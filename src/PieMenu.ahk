#Requires AutoHotKey v1.1.34.04+
#Persistent
#NoEnv
#SingleInstance force
SetBatchLines -1
ListLines Off
SetWinDelay, 0		; Changed to 0 upon recommendation of documentation
SetControlDelay, 0	; Changed to 0 upon recommendation of documentation

#Include %A_ScriptDir%\lib\Gdip_All.ahk
#Include %A_ScriptDir%\lib\GdipHelper.ahk
#Include %A_ScriptDir%\lib\BGFunks.ahk
#Include %A_ScriptDir%\lib\PieFunctions.ahk
#Include %A_ScriptDir%\lib\Json.ahk

;Set Per monitor DPI awareness: https://www.autohotkey.com/boards/viewtopic.php?p=295182#p295182
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
CoordMode, Mouse, Screen
SetTitleMatchMode, RegEx ;May not need this anymore

;Check AHK version and if AHK is installed.  Prompt install or update.
if (!A_IsCompiled)
	checkAHK()

global DebugMode := false
; DebugMode := true
global RemapLButton := ""

;Read Json Settings file to object from AppData\Local\AutoHotPie

global UserDataFolder, Settings
global IsStandAlone := false
loadSettingsFile() ;loads JSON to Settings global variable

;Initialize Variables and GDI+ Screen bitmap
;Tariq Porter, you will forever have a special place in my heart.

global Mon := {left: 0,	right: 0, top: 0,bottom: 0, pieDPIScale: 1}
global G ; For GDIP
global pGraphics, hbm, hdc, obm, hwnd ;For Gdip+ stuff, may not be needed.
global BitmapPadding

global PieOpenLocX	;X Position of where pie menu is opened
global PieOpenLocY	;Y ^
global SubPieLocX	;X Position of where pie menu is opened
global SubPieLocY	;Y ^
global ActivePieHotkey
global ActivePieNumber
global ActivePieSliceHotkeyArray := [] ;loadSliceHotkeys()
global PressedSliceHotkeyName := ""
global PressedPieKeyAgain := false
global ActiveProfile
global PieLaunchedState := false

global PenClicked := false
global PieMenuRanWithMod := false

global LMB
LMB.pressed := false
global SliceHotkey
SliceHotkey.pressed := false
global ExitKey
ExitKey.pressed := false

; global pieDPIScale
getMonitorCoords(Mon.left , Mon.right , Mon.top , Mon.bottom )

;Init G Text
SetUpGDIP(0, 0, 50, 50) ;windows were appearing over taskbar without -0.01
SetUpGDIP(0, 0, 0, 0) ; To Fix white box in screenshare (https://github.com/dumbeau/AutoHotPie/issues/115)

verifyFont()

;Set up icon menu tray options
if (A_IsCompiled){
	if (!IsStandAlone){
		Menu, Tray, Add , AutoHotPie Settings, openSettings
	}
	Menu, Tray, NoStandard
	Menu, Tray, Add , Restart, Rel
	Menu, Tray, Add , Exit, QuitPieMenus
	Menu, Tray, Tip , AutoHotPie
} else {
	if (!IsStandAlone){
		Menu, Tray, Add , AutoHotPie Settings, openSettings
	}
	Menu, Tray, Add , Restart, Rel
}
if (!IsStandAlone){
	Menu, Tray, Default , AutoHotPie Settings
}
loadPieMenus()
return ;End Initialization

pieLabel: ;Fixed hotkey overlap "r and ^r", refactor this
	; Issue with MOI3d, pie menus don't want to show in that application specifically, so this display refresh thing sometimes works.
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop, "Hide")
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop, "Show")
	;Re-initialize variables
	if (PieLaunchedState == true){
		PressedSliceHotkeyName := A_ThisHotkey ;This line made me feel things again :)
		;Handle same piekey pressed again?
		return
	}
	else
		hotKeyArray := []
	PieLaunchedState := true
	ActivePieHotkey := A_ThisHotkey


	ActiveProfile := getActiveProfile()
	activeProfileString := getProfileString(ActiveProfile)
	; tooltip % activeProfileString
	if (SubStr(activeProfileString, -3) = "Func")       ;custom context
	{
		fn := Func(activeProfileString)
		Hotkey, If, % fn
	}
	else if (activeProfileString = "ahk_group regApps")   ;default context
	{
		Hotkey, IfWinNotActive, ahk_group regApps
	}
	else                                                ;app specific context
	{
		Hotkey, IfWinActive, % activeProfileString
	}
	
	;Push hotkey to hotkeyArray to be blocked when pie menus are running.
	for k, pieKey in ActiveProfile.pieKeys
	{

		hotKeyArray.Push(pieKey.hotkey)
		; OutputDebug, % pieKey.hotkey
		; if (pieKey.hotkey == ActivePieHotkey)
		; {
		; 	for k2, pieMenu in pieKey.pieMenus
		; 	{
		; 		for k3, func in pieMenu.functions
		; 		{
		; 			if (func.hotkey != "")
		; 			{
		; 				; msgbox, % func.hotkey
		; 				hotKeyArray.Push(func.hotkey)
		; 			}
		; 		}
		; 	}
		; }
	}

	for k, menu in ActiveProfile.pieKeys
	{
		if (menu.hotkey == ActivePieHotkey)
		{
			blockBareKeys(ActivePieHotkey, hotKeyArray, true)
			funcAddress := runPieMenu(ActiveProfile, k)
			PieLaunchedState := false

			if (ActiveProfile.pieEnableKey.useEnableKey)
				pieEnableKey.modOff()

			blockBareKeys(ActivePieHotkey, hotKeyArray, false)

			;deactivate dummy keys
			ActivePieHotkey := ""
			; msgbox, % funcAddress.label
			runPieFunction(funcAddress)
			SetUpGDIP(0, 0, 0, 0) ; To Fix white box in screenshare (https://github.com/dumbeau/AutoHotPie/issues/115)
			EmptyMem()
			break
		}
	}
return

togglePieLabel:
	pieEnableKey.modToggle()
return

onPieLabel:
	pieEnableKey.modOn()
; msgbox, On
return

offPieLabel:
	pieEnableKey.modOff()
; msgbox, ActiveProfile
; msgbox, off
return

blockLabel:
	PressedSliceHotkeyName := A_ThisHotkey
; msgbox, % PressedSliceHotkeyName
return

#If DebugMode = true
	{
		escape::
		exitapp
		return
	}

;I hate you so much... windows ink.
;220705 - windows ink still makes me sad.

#IfWinActive, ahk_exe AutoHotPie.exe
	~LButton up::
		sleep,200
		if WinExist("ahk_exe AutoHotPie.exe")
			exitapp
	return
	~Enter up::
		sleep,200
		if WinExist("AutoHotPie Uninstall")
			exitapp
	return
#IfWinActive, ahk_exe Un_A.exe
	~LButton up::
		sleep,100
		if WinExist("AutoHotPie Uninstall")
			exitapp
	return
	~Enter up::
		sleep,100
		if WinExist("AutoHotPie Uninstall")
			exitapp
	return
#IfWinActive, AutoHotPie Setup
	~LButton up::
		sleep,100
		if WinExist("AutoHotPie Setup")
			exitapp
	return
	~Enter up::
		sleep,100
		if WinExist("AutoHotPie Setup")
			exitapp
	return

#If (PieLaunchedState == 1)
	LButton::
		LMB.pressed := true
	; PenClicked := true
	;Check pie launched state again?
	Return
	LButton up::
		LMB.pressed := false
	; PenClicked := false
	;Check pie launched state again?
	Return

;For mouseClick function
#If (RemapLButton == "right")
	LButton::RButton
#If (RemapLButton == "middle")
	LButton::MButton
#If ;This ends the context-sensitivity

SliceHotkeyPress:
	SliceHotkey.pressed := true
return
SliceHotkeyRelease:
	SliceHotkey.pressed := false
return
ExitKeyPress:
	ExitKey.pressed := true
return
ExitKeyRelease:
	ExitKey.pressed := false
return

~esc::
	if (settings.global.enableEscapeKeyMenuCancel)
		PieLaunchedState := false
return

;If a display is connected or disconnected
OnMessage(0x7E, "WM_DISPLAYCHANGE")
return
WM_DISPLAYCHANGE(wParam, lParam)
{
	sleep, 200
	Reload
	return
}

Rel:
	Reload
Return

openSettings:
	pie_openSettings()
Return

QuitPieMenus:
exitapp
return

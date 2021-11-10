#Persistent
#NoEnv
#SingleInstance force

#Include %A_ScriptDir%\lib\Gdip_All.ahk
#Include %A_ScriptDir%\lib\GdipHelper.ahk
#Include %A_ScriptDir%\lib\BGFunks.ahk
#Include %A_ScriptDir%\lib\PieFunctions.ahk
#Include %A_ScriptDir%\lib\Json.ahk

;Set Per monitor DPI awareness: https://www.autohotkey.com/boards/viewtopic.php?p=295182#p295182
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
CoordMode, Mouse, Screen
;  DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
;Check AHK version and if AHK is installed.  Prompt install or update.



if (!A_IsCompiled)
	checkAHK()


debugMode := false
global remapLButton := ""

;Read Json Settings file to object from AppData\Local\AutoHotPie
	Try 
	{
		settingsFileName := "AHPSettings.json"
		userDataFolder := A_AppData . "\AutoHotPie"
		settingsFilePath := userDataFolder . "\" . settingsFileName
		
		if ( FileExist(userDataFolder) ){
			FileRead, settings, %settingsFilePath%
			global settings := Json.Load(settings)	
		}else{			
			FileCreateDir, %userDataFolder%
			pie_openSettings()
			exitapp
		}
	} catch e {
		msgbox, % "Settings file is invalid JSON.`n`nNo Pie Menus for you :(`n`nFix settings file at:`n" . settingsFilePath
		pie_openSettings()
		Exitapp
	}

;Experimental
; if FileExist(settings.global.adobeScriptsFolder)
; 	{
; 	copyFilesAndFolders(A_ScriptDir . "\Local Scripts\AdobePieScripts", settings.global.adobeScriptsFolder, True)
; 	} ;Check if folder exists.

;Initialize Variables and GDI+ Screen bitmap
	;Tariq Porter, you will forever have a special place in my heart.
	
	global monLeft := 0
	global monRight := 0
	global monTop := 0
	global monBottom := 0
	global Mon := {left: 0,	right: 0, top: 0,bottom: 0, pieDPIScale: 1} 
	global G ;For Gdip+ stuff


	global pieOpenLocX	;X Position of where pie menu is opened
	global pieOpenLocY	;Y ^
	global subPieLocX	;X Position of where pie menu is opened
	global subPieLocY	;Y ^
	global subMenuActive	;Y ^
	global activePieNumber	;Y ^
	global ActivePieSliceHotkeyArray := [] ;loadSliceHotkeys()
	global activeProfile

	global penClicked := false

	; global pieDPIScale
	getMonitorCoords(Mon.left , Mon.right , Mon.top , Mon.bottom )
	; getMonitorCoords(monLeft, monRight, monTop, monBottom)
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop-0.01) ;windows were appearing over taskbar without -0.01
	SetUpGDIP(0, 0, 50, 50) ;windows were appearing over taskbar without -0.01
	StartDrawGDIP()
	Gdip_TextToGraphics(G, "Test", "x20 y20 Center vCenter c00FFFFFF r4 s20", "Arial")
	ClearDrawGDIP()
	EndDrawGDIP()

	;Set up icon menu tray options
	if (A_IsCompiled){
		Menu, Tray, NoStandard
		Menu, Tray, Add , AutoHotPie Settings, openSettings
		Menu, Tray, Add , Restart, Rel
		Menu, Tray, Add , Exit, QuitPieMenus
		Menu, Tray, Tip , AutoHotPie		
	}else{
		Menu, Tray, Add , AutoHotPie Settings, openSettings
		Menu, Tray, Add , Restart, Rel		
	}
	Menu, Tray, Default , AutoHotPie Settings
	; Menu, Tray, Click, 1
	loadPieMenus()
return



;End Initialization

pieLabel: ;Fixed hotkey overlap "r and ^r", refactor this
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop, "Hide")
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop, "Show")
	;Re-initialize variables	
	if (pieLaunchedState == 1)
		return
	else
		hotKeyArray := []	
	pieLaunchedState := 1
	global activePieKey := A_ThisHotkey
	; msgbox, % activePieKey
	
	If (!WinActive("ahk_group regApps"))
		{
		profileIndex := 1
		activeProfile := settings.appProfiles[1]
		Hotkey, IfWinNotActive, ahk_group regApps		
		}
	else ;Registered applications
		{
		;Get application and key
		WinGet, activeWinProc, ProcessName, A	
		;lookup profile and key index
		for profileIndex, profile in settings.appProfiles
			{
			if profileIndex == 1
				continue			
			; if ahk_group regApps not contains activeWindow
			for ahkHandleIndex, ahkHandle in profile.ahkHandles
			{
				testAHKHandle := StrSplit(ahkHandle, " ", ,2)[2] ;Will test multiple program, may be broken
				if (testAHKHandle == activeWinProc) ;Is this the right profile?
					{
						activeProfile := profile						
						Hotkey, IfWinActive, % "ahk_exe " + activeWinProc
						break 2	
					}
				}
			}			
		}	
	
	;Push hotkey to hotkeyArray to be blocked when pie menus are running.
	for k, pieKey in activeProfile.pieKeys
	{		
		hotKeyArray.Push(pieKey.hotkey)
		; msgbox, % pieKey.hotkey
		; if (pieKey.hotkey == activePieKey)
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
	; msgbox, % hotkeyArray[1]
	; msgbox, % hotkeyArray[2]
	; msgbox, % hotkeyArray[3]
	; msgbox, % hotkeyArray[4]
	
	
	for k, menus in activeProfile.pieKeys
		{
		if (menus.hotkey == activePieKey)
			{			
			blockBareKeys(activePieKey, hotKeyArray, true)			
			funcAddress := runPieMenu(profileIndex, k)
			pieLaunchedState := 0				
			blockBareKeys(activePieKey, hotKeyArray, false)
				;deactivate dummy keys
			activePieKey := ""
			runPieFunction(funcAddress)
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
	; msgbox, off
return

blockLabel:
return

#If debugMode = true
{
escape::
exitapp
return
}

;Block LButton when Pie Menu is opened WHY DOESNT HOLDOPENOVERRIDE WORK???
;I hate you so much... windows ink.
#If (pieLaunchedState == 1)
LButton::
	; penClicked := true 
	Return
LButton up::	
	; penClicked := false
	Return
;For mouseClick function
#If (remapLButton == "Right")
LButton::RButton
#If (remapLButton == "Middle")
LButton::MButton
#If ;This ends the context-sensitivity

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

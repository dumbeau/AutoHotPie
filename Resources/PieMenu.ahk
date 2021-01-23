#Persistent
#SingleInstance ignore
#Include %A_ScriptDir%\lib\Gdip_All.ahk
#Include %A_ScriptDir%\lib\GdipHelper.ahk
#Include %A_ScriptDir%\lib\BGFunks.ahk
#Include %A_ScriptDir%\lib\PieFunctions.ahk
#Include %A_ScriptDir%\lib\Json.ahk
CoordMode, Mouse, Screen
;  DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
;Check AHK version and if AHK is installed.  Prompt install or update.
checkAHK()

debugMode := False
global remapLButton := ""


;Read Json Settings file to object
	Try 
	{
		
		FileRead, settings, %A_ScriptDir%\settings.json
		global settings := Json.Load(settings)
		
	} catch e {
		msgbox, % "Settings file is invalid JSON.`n`nNo Pie Menus for you :(`n`nFix settings file at:`n" . A_ScriptDir . "\settings.json"
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

	global iMouseX	;X Position of where pie menu is opened
	global iMouseY	;Y ^
	getMonitorCoords(monLeft, monTop, monRight, monBottom)
	; SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop-0.01) ;windows were appearing over taskbar without -0.01
	SetUpGDIP(0, 0, 50, 50) ;windows were appearing over taskbar without -0.01
	StartDrawGDIP()
	Gdip_TextToGraphics(G, "Test", "x20 y20 Center vCenter c00FFFFFF r4 s20", "Arial")
	ClearDrawGDIP()
	EndDrawGDIP()
	Menu, Tray, Add , Reload, Rel
		
;Load registered applications to ahk_group regApps
for profiles in settings.appProfiles
	{		
	if settings.appProfiles[profiles].ahkHandle == "ahk_group regApps"
		continue
	GroupAdd, regApps, % settings.appProfiles[profiles].ahkHandle
	}

;Load hotkeys from settings object
 for profiles in settings.appProfiles
	{
	If settings.appProfiles[profiles].enable = 0 ;continue if profile is disabled
		continue
	if settings.appProfiles[profiles].ahkHandle == "ahk_group regApps"
		{
		Hotkey, IfWinNotActive, ahk_group regApps
		for menus in settings.appProfiles[profiles].pieMenus
			{
			if settings.appProfiles[profiles].pieMenus[menus].enable = 0
				continue
			Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, pieLabel
			If (settings.appProfiles[profiles].pieModifier.useModifierKey == 1) && (settings.appProfiles[profiles].pieModifier.toggle == 0)
				{ ;initialize off if modkey active no toggle
				Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, Off
				}
			}
		;load modifier key for default profiles
		If settings.appProfiles[profiles].pieModifier.useModifierKey == 1
			{
			If settings.appProfiles[profiles].pieModifier.toggle == 1
				{
				Hotkey, % settings.appProfiles[profiles].pieModifier.modifierKey, togglePieLabel
				}
			else ;hotkey needs to be initialized off this does not work yet
				{
				Hotkey, % settings.appProfiles[profiles].pieModifier.modifierKey, onPieLabel
				upHotkey := settings.appProfiles[profiles].pieModifier.modifierKey " up"
				Hotkey, % upHotkey, offPieLabel
				}
			}	
		}
	else
		{
		; msgbox, % settings[profiles].ahkHandle
		;load modifier key for profile
		Hotkey, IfWinActive, % settings.appProfiles[profiles].ahkHandle
		for menus in settings.appProfiles[profiles].pieMenus
			{
			; msgbox, % settings.appProfiles[profiles].pieMenus[menus].hotkey
			Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, pieLabel
			If (settings.appProfiles[profiles].pieModifier.useModifierKey == 1) && (settings.appProfiles[profiles].pieModifier.toggle == 0)
				{
				Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, Off
				}
			}
		If settings.appProfiles[profiles].pieModifier.useModifierKey == 1
			{
			If settings.appProfiles[profiles].pieModifier.toggle == 1
				{
				Hotkey, % settings.appProfiles[profiles].pieModifier.modifierKey, togglePieLabel
				}
			else
				{
				Hotkey, % settings.appProfiles[profiles].pieModifier.modifierKey, onPieLabel
				upHotkey := settings.appProfiles[profiles].pieModifier.modifierKey " up"
				Hotkey, % upHotkey, offPieLabel					
				}
			}
		}
	}
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
		Hotkey, IfWinNotActive, ahk_group regApps
		for menus in settings.appProfiles[1].pieMenus
			hotKeyArray.Push(settings.appProfiles[1].pieMenus[menus].hotkey)
		for menus in settings.appProfiles[1].pieMenus
			{
			; msgbox, % settings.appProfiles[1].pieMenus[menus].hotkey  menus
			 
			if (settings.appProfiles[1].pieMenus[menus].hotkey == activePieKey)
				{
				blockBareKeys(activePieKey, hotKeyArray, 1)				
				funcAddress := runPieMenu(1, menus)
				pieLaunchedState := 0				
				blockBareKeys(activePieKey, hotKeyArray, 0)
				 ;deactivate dummy keys
				activePieKey := ""
				runPieFunction(funcAddress)
				break
				}		
			}
		return
		}
	else ;Registered applications
		{
		;Get application and key
		WinGet, activeWinProc, ProcessName, A
		WinGetClass, activeWinClass, A
		activePieKey := A_ThisHotkey
		
		;lookup profile and key index
		for profiles in settings.appProfiles
			{
			; if ahk_group regApps not conftains activeWi6ndow
			testAHKHandle := StrSplit(settings.appProfiles[profiles].ahkHandle, " ", ,2)[2]
			if (testAHKHandle == activeWinProc)
				{				
				Hotkey, IfWinActive, % "ahk_exe " + activeWinProc
				for menus in settings.appProfiles[profiles].pieMenus
					hotKeyArray.Push(settings.appProfiles[profiles].pieMenus[menus].hotkey)
				for menus in settings.appProfiles[profiles].pieMenus
					{
					;if hotkey found
					if settings.appProfiles[profiles].pieMenus[menus].hotkey == activePieKey
						{
						blockBareKeys(activePieKey, hotKeyArray, 1)
						funcAddress := runPieMenu(profiles, menus)
						pieLaunchedState := 0
						blockBareKeys(activePieKey, hotKeyArray, 0)
						activePieKey := ""
						runPieFunction(funcAddress)
						break, 2
						}
					}
				return
				}
			If (testAHKHandle == activeWinClass)	
				{
				Hotkey, IfWinActive, % "ahk_class " + activeWinClass
				for menus in settings.appProfiles[profiles].pieMenus
					hotKeyArray.Push(settings.appProfiles[profiles].pieMenus[menus].hotkey)
				for menus in settings.appProfiles[profiles].pieMenus
					{
					;if hotkey found
					if settings.appProfiles[profiles].pieMenus[menus].hotkey == activePieKey
						{
						blockBareKeys(activePieKey, hotKeyArray, 1)								
						funcAddress := runPieMenu(profiles, menus)
						pieLaunchedState := 0
						blockBareKeys(activePieKey, hotKeyArray, 0)
						activePieKey := ""
						runPieFunction(funcAddress)
						break, 2
						}					
					}				
				return
				}	
			}
		}	
	return

togglePieLabel:
	pieModifier.modToggle()
return

onPieLabel:
	pieModifier.modOn()
	; msgbox, On
return

offPieLabel:
	pieModifier.modOff()
	; msgbox, off
return


#If debugMode = true
{
escape::
exitapp
return
}

;Block LButton when Pie Menu is opened
#If (pieLaunchedState == 1)
LButton::Return


;For mouseClick function 
#If (remapLButton == "Right")
LButton::RButton
#If (remapLButton == "Middle")
LButton::MButton

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
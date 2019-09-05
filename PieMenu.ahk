#Persistent
#SingleInstance ignore
#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk
CoordMode, Mouse, Screen
;Check AHK version and if AHK is installed.  Prompt install or update.
checkAHK()

;Read Json Settings file to object
	FileRead, settings, %A_ScriptDir%\Resources\settings.json
	global settings := Jxon_Load(settings)

;Initialize Variables and GDI+ Screen bitmap
	;Thank you Tariq Porter
	; monLeft := 0 monRight := 0 monTop := 0 monBottom :=r 0
	global monLeft := 0
	global monRight := 0
	global monTop := 0
	global monBottom := 0
	getMonitorCoords(monLeft, monTop, monRight, monBottom)
	SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop)

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
	if settings.appProfiles[profiles].ahkHandle == "ahk_group regApps"
		{				
		Hotkey, IfWinNotActive, ahk_group regApps
		for menus in settings.appProfiles[profiles].pieMenus
			{	
			Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, pieLabel
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
	; pieModifiers("Off")
	activeKey := A_ThisHotkey
	otherHotkeys := []
	If (!WinActive("ahk_group regApps"))
		{
		Hotkey, IfWinNotActive, ahk_group regApps
		for menus in settings.appProfiles[1].pieMenus
			{
			; msgbox, % settings.appProfiles[1].pieMenus[menus].hotkey  menus
			if (settings.appProfiles[1].pieMenus[menus].hotkey == activeKey)
				{
				activeMenuNum := menus	
				; msgbox, % functionNum
				; break
				}
			else
				{
				otherHotkeys.Push(settings.appProfiles[1].pieMenus[menus].hotkey)
				Hotkey, % settings.appProfiles[1].pieMenus[menus].hotkey, Off				
				}							
			}		
		functionNum := runPieMenu(1, activeMenuNum)
		for offKeys in otherHotkeys
			{				
			Hotkey, % otherHotkeys[offKeys], On
			}
		return
		}
	else
		{
		;Get application and key
		WinGet, activeWinProc, ProcessName, A
		WinGetClass, activeWinClass, A
		activeKey := A_ThisHotkey
		;lookup profile and key index
		for profiles in settings.appProfiles
			{			
			; if ahk_group regApps not contains activeWindow
			testAHKHandle := StrSplit(settings.appProfiles[profiles].ahkHandle, " ", ,2)[2]
			if (testAHKHandle == activeWinProc)
				{
				Hotkey, IfWinActive, % "ahk_exe " + activeWinProc
				for menus in settings.appProfiles[profiles].pieMenus
					{
					;if hotkey found
					if settings.appProfiles[profiles].pieMenus[menus].hotkey == activeKey
						{
						activeMenuNum := menus						
						; msgbox, % functionNum
						; pieModifiers("On")
						; break, 2
						}
					else
						{
						otherHotkeys.Push(settings.appProfiles[profiles].pieMenus[menus].hotkey)
						Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, Off				
						}			
					}
				functionNum := runPieMenu(profiles, activeMenuNum)
				for offKeys in otherHotkeys
					{				
					Hotkey, % otherHotkeys[offKeys], On
					}
				return
				}
			If (testAHKHandle == activeWinClass)	
				{
				; msgbox, % "ahk_class " + activeWinClass		
				Hotkey, IfWinActive, % "ahk_class " + activeWinClass
				for menus in settings.appProfiles[profiles].pieMenus
					{
					;if hotkey found
					if settings.appProfiles[profiles].pieMenus[menus].hotkey == activeKey
						{
						activeMenuNum := menus						
						; msgbox, % functionNum
						; pieModifiers("On")
						; break, 2
						}
					else
						{
						otherHotkeys.Push(settings.appProfiles[profiles].pieMenus[menus].hotkey)
						Hotkey, % settings.appProfiles[profiles].pieMenus[menus].hotkey, Off				
						}					
					}
				functionNum := runPieMenu(profiles, activeMenuNum)
				for offKeys in otherHotkeys
					{
					Hotkey, % otherHotkeys[offKeys], On
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

u::
msgbox, % getActiveProfile()[2]
return

escape::
exitapp
return



;If a display is connected or disconnected
	OnMessage(0x7E, "WM_DISPLAYCHANGE")
	return
	WM_DISPLAYCHANGE(wParam, lParam)
		{
		sleep, 200
		Reload
		}

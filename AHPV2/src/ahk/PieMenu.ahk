#Requires AutoHotKey v1.1.34.04+
#Persistent
#NoEnv
#SingleInstance force
SetBatchLines -1
ListLines Off

;Optimize AHK Scipt speed?
;https://www.autohotkey.com/boards/viewtopic.php?t=6413
#KeyHistory 0
SendMode Input
SetTitleMatchMode 2
SetTitleMatchMode Fast
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetWinDelay, 0		; Changed to 0 upon recommendation of documentation
SetControlDelay, 0	; Changed to 0 upon recommendation of documentation
SetDefaultMouseSpeed, 0

#MaxMem 1023

ScriptStartTime := A_TickCount

#Include %A_ScriptDir%\lib\
#Include Gdip_All.ahk
#Include GdipHelper.ahk
#Include BGFunks.ahk
#Include Json.ahk
#Include PieFunctions.ahk
#Include %A_ScriptDir%\lib\classes\
#Include Display.ahk
#Include AutoHotPie.ahk


CoordMode, Mouse, Screen
; SetTitleMatchMode, RegEx ;May not need this anymore

;Check AHK version and if AHK is installed.  Prompt install or update.
if (!A_IsCompiled)
	CheckAHK()

global G
global RemapLButton := ""


;Read Json Settings file to object from AppData\Local\AutoHotPie

global UserDataFolder, Settings
global IsStandAlone := false
; loadSettingsFile() ;loads JSON to Settings global variable
;Initialize Variables and GDI+ Screen bitmap
;Tariq Porter, you will forever have a special place in my heart.

; Load AHP V2.0.0 
AHP := new AutoHotPie(LoadSettingsFile())
ValidateFontFamily(AHP.appearance.font.family) ;Reload 3x if font not loaded, Use Arial if invalid? !!!
getMonitorCoords(Mon.left , Mon.right , Mon.top , Mon.bottom )

;Init G Text


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

print("AutoHotPie loaded in " . A_TickCount - ScriptStartTime . " ms" )
return ;End Initialization


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

; #If (PieLaunchedState == 1)
; LButton::
; 	LMB.pressed := true
; 	; PenClicked := true 
; 	;Check pie launched state again?
; 	Return
; LButton up::	
; 	LMB.pressed := false
; 	; PenClicked := false
; 	;Check pie launched state again?
; 	Return

;For mouseClick function
; #If (RemapLButton == "right")
; LButton::RButton
; #If (RemapLButton == "middle")
; LButton::MButton
#If ;This ends the context-sensitivity


; ~esc::
; if (settings.global.enableEscapeKeyMenuCancel)
; 	PieLaunchedState := false
; return


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

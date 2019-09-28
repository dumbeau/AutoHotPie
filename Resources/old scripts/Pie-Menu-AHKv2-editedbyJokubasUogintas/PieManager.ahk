#NoEnv
#Include %A_ScriptDir%\Resources\GeneralPieMenu\Resources\GDIp_All.ahk
#Include %A_ScriptDir%\Resources\GeneralPieMenu\Resources\GDIpHelper.ahk

SetWorkingDir %A_ScriptDir%

Sysget, Mon1, Monitor, 1
Sysget, Mon2, Monitor, 2
Sysget, Mon3, Monitor, 3
Sysget, Mon4, Monitor, 4
Sysget, Mon5, Monitor, 5
Sysget, Mon6, Monitor, 6
	
BitmapScreenRight := Max(Mon1Right, Mon2Right, Mon3Right, Mon4Right, Mon5Right, Mon6Right)
BitmapScreenBottom := Max(Mon1Bottom, Mon2Bottom, Mon3Bottom, Mon4Bottom, Mon5Bottom, Mon6Bottom)

SetUpGDIP(,,"Hide") ;//changed// from SetUPGDIP() to SetUpGDIP(,,"Hide")
ShowToolTips := 1
DefPieRunning := 0

FileReadLine, PieKeyTipShow, %A_ScriptDir%\Resources\Varsinit\PieKeyTip.txt,1
DetectHiddenWindows, On
DefPieActive := 0
Loop
	{
	FileReadLine, RegisteredAppSub, %A_ScriptDir%\Resources\registeredapps.txt,%A_Index%
	If ErrorLevel = 1
		break
	If RegisteredAppSub = 1Default Pie Menu.exe
		DefPieActive := 1
	If SubStr(RegisteredAppSub, 1, 1) = 1
		{
		RegisteredAppSub := SubStr(RegisteredAppSub, 2)
		
		RegisteredAppList = %RegisteredAppList%,%RegisteredAppSub%
		}
	
	}
RegisteredAppList := SubStr(RegisteredAppList, 2)

WinGet, ActiveProcess, ProcessName, A	
Goto, FirstRunCheck

RestartLabel:

DetectHiddenWindows, On 

OtherApp := ""
PrevActiveProcess := ""-
ActiveProcess := ""
fullScriptPath := ""


Loop  ;Will run while Default is running
	{
	If GetKeyState("Alt","P")
		{
		sleep, 50
		continue
		}
	; If GetKeyState("g","P")
		; {
		; msgbox, %ActiveProcess% and previoous is %PrevActiveProcess%
		; continue
		; }		
	If (A_Index > 10)
	WinGet, ActiveProcess, ProcessName, A
	If !ActiveProcess
		{
		sleep, 50
		Continue
		}
	If PrevActiveProcess is not space
		{
		If (ActiveProcess != PrevActiveProcess) && (A_Index > 1) 
			Break
		}
	If !PrevActiveProcess 
		PrevActiveProcess := ActiveProcess
	If (DefPieRunning = 1) && (A_Index < 25) && (ActiveProcess != "EXPLORER.EXE") && (ActiveProcess != "explorer.exe")
		{
		If ActiveProcess in %RegisteredAppList%
			{
			Break
			}
		}
	
		

	sleep, 10
	If A_Index = 75
		{
		StartDrawGDIP()
		ClearDrawGDIP()	
		EndDrawGDIP()
		}
	If A_Index > 50
		sleep, 100
	If A_Index > 200
		sleep, 100
	}


SetUpGDIP(,,"Show") ;//changed//
StartDrawGDIP()
ClearDrawGDIP()	
EndDrawGDIP()
SetUpGDIP(,,"Hide") ; //changed//

FirstRunCheck:
If ProcessToKill is not space
	{
	fullScriptPath = %A_ScriptDir%\%ProcessToKill%\PieMenu.ahk  ; edit with your full script path
	WinClose, %fullScriptPath% ahk_class AutoHotkey	
	ProcessToKill := ""
	}
If DefPieRunning = 1
	{
	fullScriptPath = %A_ScriptDir%\Default Pie Menu\PieMenu.ahk  ; edit with your full script path
	WinClose, %fullScriptPath% ahk_class AutoHotkey				
	DefPieRunning := 0
	}
	
If ActiveProcess = AutoHotkey.exe
	Goto, RestartLabel
	
If ActiveProcess in %RegisteredAppList%
	{
	ProcessToKill := SubStr(ActiveProcess, 1, -4)
	Run, "%A_ScriptDir%\%ProcessToKill%\PieMenu.ahk"	
	; sleep, %progwait%
	If PieKeyTipShow = 1
	{
	FileReadline, piekeysetting, %A_ScriptDir%\%ProcessToKill%\Resources\settingsfile.txt, 1
		If piekeysetting = ``
			piekeytip := " (The Tilde Key)"
		SetUpGDIP(,,"Show") ;//changed//
		StartDrawGDIP()
		ClearDrawGDIP()	
		Gdip_SetSmoothingMode(G, 4)
			piekeytextstart :=  % "Pie Activation Key is " piekeysetting piekeytip
			TXo := A_ScreenWidth / 2
			TYo := A_ScreenHeight - 70
			textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
			Gdip_TextToGraphics(G, piekeytextstart, textoptions)
			EndDrawGDIP()
			SetUpGDIP(,,"Hide") ; //Changed
			piekeytip := ""
	}
	Goto, RestartLabel	
	}
Else
	{
	If (DefPieActive = 1) && (DefPieRunning = 0)
		{
		Run, "%A_ScriptDir%\Default Pie Menu\PieMenu.ahk"
		
		DefPieRunning := 1
		If PieKeyTipShow = 1
			{
			FileReadline, piekeysetting, %A_ScriptDir%\Default Pie Menu\Resources\settingsfile.txt, 1
			If piekeysetting = ``
			piekeytip := " (The Tilde Key)"
			SetUpGDIP(,,"Show") ;//changed
			StartDrawGDIP()
			ClearDrawGDIP()	
			Gdip_SetSmoothingMode(G, 4)
				piekeytextstart :=  % "Pie Activation Key is " piekeysetting piekeytip
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 70
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				Gdip_TextToGraphics(G, piekeytextstart, textoptions)
				EndDrawGDIP()
				SetUpGDIP(,,"Hide") ; //Changed
				piekeytip := ""
			}
		}
	Goto, RestartLabel
	}

#NoEnv

WinGetAll(Which="Title", DetectHidden="Off"){
O_DHW := A_DetectHiddenWindows, O_BL := A_BatchLines ;Save original states
DetectHiddenWindows, % (DetectHidden != "off" && DetectHidden) ? "on" : "off"
SetBatchLines, -1
    WinGet, all, list ;get all hwnd
    If (Which="Title") ;return Window Titles
    {
        Loop, %all%
        {
            WinGetTitle, WTitle, % "ahk_id " all%A_Index%
            If WTitle ;Prevent to get blank titles
                Output .= WTitle "`n"        
        }
    }
    Else If (Which="Process") ;return Process Names
    {
        Loop, %all%
        {
            WinGet, PName, ProcessName, % "ahk_id " all%A_Index%
            Output .= PName "`n"
        }
    }
    Else If (Which="Class") ;return Window Classes
    {
        Loop, %all%
        {
            WinGetClass, WClass, % "ahk_id " all%A_Index%
            Output .= WClass "`n"
        }
    }
    Else If (Which="hwnd") ;return Window Handles (Unique ID)
    {
        Loop, %all%
            Output .= all%A_Index% "`n"
    }
    Else If (Which="PID") ;return Process Identifiers
    {
        Loop, %all%
        {
            WinGet, PID, PID, % "ahk_id " all%A_Index%
            Output .= PID "`n"        
        }
        Sort, Output, U N ;numeric order and remove duplicates
    }
DetectHiddenWindows, %O_DHW% ;back to original state
SetBatchLines, %O_BL% ;back to original state
    Sort, Output, U ;remove duplicates
    Return Output
}


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
; msgbox, %RegisteredAppList%

RestartLabel:


PieMenuActiveNow := 0

ClassesOpen := WinGetAll("Class")
StringSplit, ClassesArray, ClassesOpen, `n
ProcessOpen := WinGetAll("Process")
StringSplit, ProcessArray, ProcessOpen, `n

GroupAdd, OtherApp, ahk_class Progman

Loop
	{
	WinGet, ActiveProcess, ProcessName, A
	PrevActiveProcess := ActiveProcess
	If A_Index > 1
		{
		If PrevActiveProcess != ActiveProcess
			Break
		}
	Sleep, 300
	}


If ActiveProcess in %RegisteredAppList%
	{
	ProcessToKill := SubStr(ActiveProcess, 1, -4)
	WinGetClass, ActiveWin, A
	Loop
		{
		ClassName := ClassesArray%A_Index%
		If !ClassName
			Break
		If ClassName != %ActiveWin%
		GroupAdd, OtherApp, ahk_class %ClassName%
		}
	Run, "%A_ScriptDir%\%ProcessToKill%\PieMenu.ahk"
	Loop
		{
		If WinActive("ahk_group OtherApp")
			{
			fullScriptPath = %A_ScriptDir%\%ProcessToKill%\PieMenu.ahk  ; edit with your full script path
			DetectHiddenWindows, On 
			WinClose, %fullScriptPath% ahk_class AutoHotkey
			Reload
			}
		sleep, 200
		}
	}

DetectHiddenWindows, On	
SetTitleMatchMode, 2


IfWinNotExist, PieMenu.ahk
	PieMenuActiveNow := 1
If (DefPieActive = 1) && (PieMenuActiveNow = 1)
	Run "%A_ScriptDir%\Default Pie Menu\PieMenu.ahk"	
Goto, RestartLabel





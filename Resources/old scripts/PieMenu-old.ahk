#Persistent/
#SingleInstance ignore
#Include %A_ScriptDir%\Resources\GDIp_All.ahk
#Include %A_ScriptDir%\Resources\GDIpHelper.ahk
#InstallMouseHook
CoordMode, Mouse, Screen
	
	
Min(x,x1="",x2="",x3="",x4="",x5="",x6="",x7="",x8="",x9="") {
   Loop
      IfEqual x%A_Index%,, Return x
      Else x := x < x%A_Index% ? x : x%A_Index%
}

Max(x,x1="",x2="",x3="",x4="",x5="",x6="",x7="",x8="",x9="") {
   Loop
      IfEqual x%A_Index%,, Return x
      Else x := x > x%A_Index% ? x : x%A_Index%
}


Sysget, Mon1, Monitor, 1
Sysget, Mon2, Monitor, 2
Sysget, Mon3, Monitor, 3
Sysget, Mon4, Monitor, 4
Sysget, Mon5, Monitor, 5
Sysget, Mon6, Monitor, 6
	
; BitmapScreenLeft := Min(Mon1Left, Mon2Left, Mon3Left, Mon4Left, Mon5Left, Mon6Left)
; BitmapScreenTop := Min(Mon1Top, Mon2Top, Mon3Top, Mon4Top, Mon5Top, Mon6Top)
BitmapScreenRight := Max(Mon1Right, Mon2Right, Mon3Right, Mon4Right, Mon5Right, Mon6Right)
BitmapScreenBottom := Max(Mon1Bottom, Mon2Bottom, Mon3Bottom, Mon4Bottom, Mon5Bottom, Mon6Bottom)

; msgbox, %BitmapScreenLeft% %BitmapScreenTop% %BitmapScreenRight% %BitmapScreenBottom%




; MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.	
	
;---------------------------
;PIE MENU Settings
;---------------------------


FileReadLine, Bnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,8
FileReadLine, Bnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,9 
FileReadLine, Bnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,10
FileReadLine, B1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,11
FileReadLine, B1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,12
FileReadLine, B1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,13
FileReadLine, B2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,14
FileReadLine, B2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,15
FileReadLine, B2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,16
FileReadLine, B3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,17
FileReadLine, B3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,18
FileReadLine, B3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,19
FileReadLine, B4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,20
FileReadLine, B4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,21
FileReadLine, B4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,22
FileReadLine, B5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,23
FileReadLine, B5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,24
FileReadLine, B5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,25
FileReadLine, B6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,26
FileReadLine, B6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,27
FileReadLine, B6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,28
FileReadLine, Pnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,29
FileReadLine, Pnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,30
FileReadLine, Pnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,31
FileReadLine, P1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,32
FileReadLine, P1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,33
FileReadLine, P1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,34
FileReadLine, P2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,35
FileReadLine, P2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,36
FileReadLine, P2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,37
FileReadLine, P3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,38
FileReadLine, P3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,39
FileReadLine, P3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,40
FileReadLine, P4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,41
FileReadLine, P4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,42
FileReadLine, P4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,43
FileReadLine, P5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,44
FileReadLine, P5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,45
FileReadLine, P5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,46
FileReadLine, P6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,47
FileReadLine, P6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,48
FileReadLine, P6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,49
FileReadLine, Rnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,50
FileReadLine, Rnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,51
FileReadLine, Rnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,52
FileReadLine, R1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,53
FileReadLine, R1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,54
FileReadLine, R1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,55
FileReadLine, R2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,56
FileReadLine, R2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,57
FileReadLine, R2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,58
FileReadLine, R3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,59
FileReadLine, R3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,60
FileReadLine, R3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,61
FileReadLine, R4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,62
FileReadLine, R4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,63
FileReadLine, R4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,64
FileReadLine, R5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,65
FileReadLine, R5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,66
FileReadLine, R5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,67
FileReadLine, R6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,68
FileReadLine, R6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,69
FileReadLine, R6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,70


FileReadLine, Bnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,71
FileReadLine,    B1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,72
FileReadLine,    B2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,73
FileReadLine,    B3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,74
FileReadLine,    B4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,75
FileReadLine,    B5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,76
FileReadLine,    B6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,77
FileReadLine, Pnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,78
FileReadLine,    P1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,79
FileReadLine,    P2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,80
FileReadLine,    P3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,81
FileReadLine,    P4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,82
FileReadLine,    P5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,83
FileReadLine,    P6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,84
FileReadLine, Rnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,85
FileReadLine,    R1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,86
FileReadLine,    R2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,87
FileReadLine,    R3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,88
FileReadLine,    R4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,89
FileReadLine,    R5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,90
FileReadLine,    R6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,91


FileReadLine, Bnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, Bnull_Label
Bnull_Label := StrSplit(Bnull_Label, ":")
Bnull_Label := SubStr(Bnull_Label[1], 3)
FileReadLine, B1_Label          ,%A_ScriptDir%\Resources\Functions.txt, B1_Label
B1_Label := StrSplit(B1_Label, ":")
B1_Label := SubStr(B1_Label[1], 3)
FileReadLine, B2_Label          ,%A_ScriptDir%\Resources\Functions.txt, B2_Label
B2_Label := StrSplit(B2_Label, ":")
B2_Label := SubStr(B2_Label[1], 3)
FileReadLine, B3_Label          ,%A_ScriptDir%\Resources\Functions.txt, B3_Label
B3_Label := StrSplit(B3_Label, ":")
B3_Label := SubStr(B3_Label[1], 3)
FileReadLine, B4_Label          ,%A_ScriptDir%\Resources\Functions.txt, B4_Label
B4_Label := StrSplit(B4_Label, ":")
B4_Label := SubStr(B4_Label[1], 3)
FileReadLine, B5_Label          ,%A_ScriptDir%\Resources\Functions.txt, B5_Label
B5_Label := StrSplit(B5_Label, ":")
B5_Label := SubStr(B5_Label[1], 3)
FileReadLine, B6_Label          ,%A_ScriptDir%\Resources\Functions.txt, B6_Label
B6_Label := StrSplit(B6_Label, ":")
B6_Label := SubStr(B6_Label[1], 3)

FileReadLine, Pnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, Pnull_Label
Pnull_Label := StrSplit(Pnull_Label, ":")
Pnull_Label := SubStr(Pnull_Label[1], 3)
FileReadLine, P1_Label          ,%A_ScriptDir%\Resources\Functions.txt, P1_Label
P1_Label := StrSplit(P1_Label, ":")
P1_Label := SubStr(P1_Label[1], 3)
FileReadLine, P2_Label          ,%A_ScriptDir%\Resources\Functions.txt, P2_Label
P2_Label := StrSplit(P2_Label, ":")
P2_Label := SubStr(P2_Label[1], 3)
FileReadLine, P3_Label          ,%A_ScriptDir%\Resources\Functions.txt, P3_Label
P3_Label := StrSplit(P3_Label, ":")
P3_Label := SubStr(P3_Label[1], 3)
FileReadLine, P4_Label          ,%A_ScriptDir%\Resources\Functions.txt, P4_Label
P4_Label := StrSplit(P4_Label, ":")
P4_Label := SubStr(P4_Label[1], 3)
FileReadLine, P5_Label          ,%A_ScriptDir%\Resources\Functions.txt, P5_Label
P5_Label := StrSplit(P5_Label, ":")
P5_Label := SubStr(P5_Label[1], 3)
FileReadLine, P6_Label          ,%A_ScriptDir%\Resources\Functions.txt, P6_Label
P6_Label := StrSplit(P6_Label, ":")
P6_Label := SubStr(P6_Label[1], 3)

FileReadLine, Rnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, Rnull_Label
Rnull_Label := StrSplit(Rnull_Label, ":")
Rnull_Label := SubStr(Rnull_Label[1], 3)
FileReadLine, R1_Label          ,%A_ScriptDir%\Resources\Functions.txt, R1_Label
R1_Label := StrSplit(R1_Label, ":")
R1_Label := SubStr(R1_Label[1], 3)
FileReadLine, R2_Label          ,%A_ScriptDir%\Resources\Functions.txt, R2_Label
R2_Label := StrSplit(R2_Label, ":")
R2_Label := SubStr(R2_Label[1], 3)
FileReadLine, R3_Label          ,%A_ScriptDir%\Resources\Functions.txt, R3_Label
R3_Label := StrSplit(R3_Label, ":")
R3_Label := SubStr(R3_Label[1], 3)
FileReadLine, R4_Label          ,%A_ScriptDir%\Resources\Functions.txt, R4_Label
R4_Label := StrSplit(R4_Label, ":")
R4_Label := SubStr(R4_Label[1], 3)
FileReadLine, R5_Label          ,%A_ScriptDir%\Resources\Functions.txt, R5_Label
R5_Label := StrSplit(R5_Label, ":")
R5_Label := SubStr(R5_Label[1], 3)
FileReadLine, R6_Label          ,%A_ScriptDir%\Resources\Functions.txt, R6_Label
R6_Label := StrSplit(R6_Label, ":")
R6_Label := SubStr(R6_Label[1], 3)


;These Settings are all denoted by settingsfile.txt in Resources folder.
;Change these with the PieMenuSettings.ahk Script

;Key that activates the Pie Menu, preferably set to a key on your tablet penTool
FileReadline, piekeysetting, %A_ScriptDir%\Resources\settingsfile.txt, 1
PieActivateKey = %piekeysetting%

;How long until Pie Menu labels appear
;I recommend not changing this, it is a purposefully uncomfortable time to encourage you to learn the positions
FileReadline, pielabeldelaysetting, %A_ScriptDir%\Resources\settingsfile.txt, 2
ShowLabelDelay := pielabeldelaysetting

;How Many Pies to Use?  Setting is 1-3
FileReadline, PieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 3

;Method for Switching between pies.  Range 1-4
FileReadline, RPieSelectNum, %A_ScriptDir%\Resources\settingsfile.txt, 4
MethodtoShift := RPieSelectNum
	If MethodtoShift = 1
		MethodtoShiftText := "Leave Center and Return to Switch Pie Function"
	If MethodtoShift = 2
		MethodtoShiftText := "Leave Center and Return for Purple, Circle and Return for Red"
	If MethodtoShift = 3
		MethodtoShiftText := "Hover over Top and Bottom (circle around), then Return to Center"
	If MethodtoShift = 4
		MethodtoShiftText := "Shift->Purple   Ctrl->Red  Alt->Blue"
	If PieNumberSetting = 1
		MethodtoShiftText :=  "You're only using ONE MENU!?? laaaaaaame... Go to PieMenuSettings.ahk to change this."

;Pie Menu Size Setting
FileReadLine, PieMenuSizeTemp,%A_ScriptDir%\Resources\settingsfile.txt,92
If PieMenuSizeTemp = 1
	{
	PieMenuScale := 45
	PieMenuOffset := 23
	PieMenuSize := 22
	Bnull_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuNull.png
	   B1_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill1.png
	   B2_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill2.png
	   B3_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill3.png
	   B4_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill4.png
	   B5_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill5.png
	   B6_Image = %A_ScriptDir%\Resources\1PieMenu\PieMenuFill6.png
	Pnull_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuNull.png
	   P1_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill1.png
	   P2_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill2.png
	   P3_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill3.png
	   P4_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill4.png
	   P5_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill5.png
	   P6_Image = %A_ScriptDir%\Resources\1PieMenu\PPieMenuFill6.png
	Rnull_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuNull.png
	   R1_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill1.png
	   R2_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill2.png
	   R3_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill3.png
	   R4_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill4.png
	   R5_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill5.png
	   R6_Image = %A_ScriptDir%\Resources\1PieMenu\RPieMenuFill6.png
	}
If PieMenuSizeTemp = 2
	{
	PieMenuScale := 71
	PieMenuOffset := 36
	PieMenuSize := 29
	Bnull_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuNull.png
			 B1_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill1.png
			 B2_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill2.png
			 B3_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill3.png
			 B4_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill4.png
			 B5_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill5.png
			 B6_Image = %A_ScriptDir%\Resources\2PieMenu\PieMenuFill6.png
	Pnull_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuNull.png
			 P1_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill1.png
	         P2_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill2.png
	         P3_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill3.png
	         P4_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill4.png
	         P5_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill5.png
	         P6_Image = %A_ScriptDir%\Resources\2PieMenu\PPieMenuFill6.png
	Rnull_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuNull.png
			 R1_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill1.png
			 R2_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill2.png
			 R3_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill3.png
			 R4_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill4.png
			 R5_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill5.png
	         R6_Image = %A_ScriptDir%\Resources\2PieMenu\RPieMenuFill6.png
	}
If PieMenuSizeTemp = 3
	{
	PieMenuScale := 100
	PieMenuOffset := 50
	PieMenuSize := 48
	Bnull_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuNull.png
			 B1_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill1.png
			 B2_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill2.png
			 B3_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill3.png
			 B4_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill4.png
			 B5_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill5.png
			 B6_Image = %A_ScriptDir%\Resources\3PieMenu\PieMenuFill6.png
	Pnull_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuNull.png
			 P1_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill1.png
	         P2_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill2.png
	         P3_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill3.png
	         P4_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill4.png
	         P5_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill5.png
	         P6_Image = %A_ScriptDir%\Resources\3PieMenu\PPieMenuFill6.png
	Rnull_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuNull.png
			 R1_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill1.png
			 R2_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill2.png
			 R3_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill3.png
			 R4_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill4.png
			 R5_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill5.png
	         R6_Image = %A_ScriptDir%\Resources\3PieMenu\RPieMenuFill6.png
	}
If PieMenuSizeTemp = 4
	{
	PieMenuScale := 200
	PieMenuOffset := 100
	PieMenuSize := 96
	Bnull_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuNull.png
			 B1_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill1.png
			 B2_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill2.png
			 B3_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill3.png
			 B4_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill4.png
			 B5_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill5.png
			 B6_Image = %A_ScriptDir%\Resources\4PieMenu\PieMenuFill6.png
	Pnull_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuNull.png
			 P1_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill1.png
	         P2_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill2.png
	         P3_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill3.png
	         P4_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill4.png
	         P5_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill5.png
	         P6_Image = %A_ScriptDir%\Resources\4PieMenu\PPieMenuFill6.png
	Rnull_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuNull.png
			 R1_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill1.png
			 R2_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill2.png
			 R3_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill3.png
			 R4_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill4.png
			 R5_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill5.png
	         R6_Image = %A_ScriptDir%\Resources\4PieMenu\RPieMenuFill6.png
	}

;Helpful hints about the Pie menu will show up at the bottom if On
FileReadline, DisplayTooltipssetting, %A_ScriptDir%\Resources\settingsfile.txt, 5
ShowToolTips := DisplayTooltipssetting



	





;Initialize variables
BlockLButton := 0
SetUpGDIP(BitmapScreenRight,BitmapScreenBottom)
Gdip_FontFamilyCreate(Arial)

;Replaces spaces in labels with Underscores to link to function labels

Bnull_FuncLabel := RegExReplace(Bnull_Label, " ", "_")
fBnull_Label = %Bnull_Label%
	If RegExMatch(Bnull_FuncLabel, "Send")
		{
		Bnull_SendLabel := % Bnull_SendKeystroke
		Bnull_FuncLabel := SubStr(Bnull_FuncLabel, 1, 8)
		If (Bnull_OverrideLabel != "")
			fBnull_Label = %Bnull_OverrideLabel%
		Bnull_CaseTest := RegExMatch(Bnull_SendLabel, "[A-Z]", Bnull_UpChar)
		If Bnull_CaseTest > 0
			{
			Bnull_ReplaceBrack = `{%Bnull_UpChar%
			anothers := RegExReplace(Bnull_SendLabel, Bnull_UpChar, Bnull_ReplaceBrack)
				Bnull_SendLabel = %anothers%}
				
			}
		}
	If Bnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (Bnull_OverrideLabel != "")
			fBnull_Label = %Bnull_OverrideLabel%
		}
	If Bnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, Bnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,93

B1_FuncLabel := RegExReplace(B1_Label, " ", "_")
fB1_Label = %B1_Label%
	If RegExMatch(B1_FuncLabel, "Send")
		{
		B1_SendLabel := % B1_SendKeystroke
		B1_FuncLabel := SubStr(B1_FuncLabel, 1, 8)
		If (B1_OverrideLabel != "")
			fB1_Label = %B1_OverrideLabel%
		B1_CaseTest := RegExMatch(B1_SendLabel, "[A-Z]", B1_UpChar)
		If B1_CaseTest > 0
			{
			B1_ReplaceBrack = `{%B1_UpChar%
			anothers := RegExReplace(B1_SendLabel, B1_UpChar, B1_ReplaceBrack)
				B1_SendLabel = %anothers%}
				
			}
		}
	If B1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B1_OverrideLabel != "")
			fB1_Label = %B1_OverrideLabel%
		}
	If B1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,94
		
B2_FuncLabel := RegExReplace(B2_Label, " ", "_")
fB2_Label = %B2_Label%
	If RegExMatch(B2_FuncLabel, "Send")
		{
		B2_SendLabel := % B2_SendKeystroke
		B2_FuncLabel := SubStr(B2_FuncLabel, 1, 8)
		If (B2_OverrideLabel != "")
			fB2_Label = %B2_OverrideLabel%
		B2_CaseTest := RegExMatch(B2_SendLabel, "[A-Z]", B2_UpChar)
		If B2_CaseTest > 0
			{
			B2_ReplaceBrack = `{%B2_UpChar%
			anothers := RegExReplace(B2_SendLabel, B2_UpChar, B2_ReplaceBrack)
				B2_SendLabel = %anothers%}
				
			}
		}
	If B2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B2_OverrideLabel != "")
			fB2_Label = %B2_OverrideLabel%
		}
	If B2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,95		
		
B3_FuncLabel := RegExReplace(B3_Label, " ", "_")
fB3_Label = %B3_Label%
	If RegExMatch(B3_FuncLabel, "Send")
		{
		B3_SendLabel := % B3_SendKeystroke
		B3_FuncLabel := SubStr(B3_FuncLabel, 1, 8)
		If (B3_OverrideLabel != "")
			fB3_Label = %B3_OverrideLabel%
		B3_CaseTest := RegExMatch(B3_SendLabel, "[A-Z]", B3_UpChar)
		If B3_CaseTest > 0
			{
			B3_ReplaceBrack = `{%B3_UpChar%
			anothers := RegExReplace(B3_SendLabel, B3_UpChar, B3_ReplaceBrack)
				B3_SendLabel = %anothers%}
				
			}
		}
	If B3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B3_OverrideLabel != "")
			fB3_Label = %B3_OverrideLabel%
		}
	If B3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,96			
		
B4_FuncLabel := RegExReplace(B4_Label, " ", "_")
fB4_Label = %B4_Label%
	If RegExMatch(B4_FuncLabel, "Send")
		{
		B4_SendLabel := % B4_SendKeystroke
		B4_FuncLabel := SubStr(B4_FuncLabel, 1, 8)
		If (B4_OverrideLabel != "")
			fB4_Label = %B4_OverrideLabel%
		B4_CaseTest := RegExMatch(B4_SendLabel, "[A-Z]", B4_UpChar)
		If B4_CaseTest > 0
			{
			B4_ReplaceBrack = `{%B4_UpChar%
			anothers := RegExReplace(B4_SendLabel, B4_UpChar, B4_ReplaceBrack)
				B4_SendLabel = %anothers%}
				
			}
		}
	If B4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B4_OverrideLabel != "")
			fB4_Label = %B4_OverrideLabel%
		}
	If B4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,97			
		
B5_FuncLabel := RegExReplace(B5_Label, " ", "_")
fB5_Label = %B5_Label%
	If RegExMatch(B5_FuncLabel, "Send")
		{
		B5_SendLabel := % B5_SendKeystroke
		B5_FuncLabel := SubStr(B5_FuncLabel, 1, 8)
		If (B5_OverrideLabel != "")
			fB5_Label = %B5_OverrideLabel%
		B5_CaseTest := RegExMatch(B5_SendLabel, "[A-Z]", B5_UpChar)
		If B5_CaseTest > 0
			{
			B5_ReplaceBrack = `{%B5_UpChar%
			anothers := RegExReplace(B5_SendLabel, B5_UpChar, B5_ReplaceBrack)
				B5_SendLabel = %anothers%}
				
			}
		}
	If B5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B5_OverrideLabel != "")
			fB5_Label = %B5_OverrideLabel%
		}
	If B5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,98
		
B6_FuncLabel := RegExReplace(B6_Label, " ", "_")
fB6_Label = %B6_Label%
	If RegExMatch(B6_FuncLabel, "Send")
		{
		B6_SendLabel := % B6_SendKeystroke
		B6_FuncLabel := SubStr(B6_FuncLabel, 1, 8)
		If (B6_OverrideLabel != "")
			fB6_Label = %B6_OverrideLabel%
		B6_CaseTest := RegExMatch(B6_SendLabel, "[A-Z]", B6_UpChar)
		If B6_CaseTest > 0
			{
			B6_ReplaceBrack = `{%B6_UpChar%
			anothers := RegExReplace(B6_SendLabel, B6_UpChar, B6_ReplaceBrack)
				B6_SendLabel = %anothers%}
				
			}
		}
	If B6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (B6_OverrideLabel != "")
			fB6_Label = %B6_OverrideLabel%
		}
	If B6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, B6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,99		
		
Pnull_FuncLabel := RegExReplace(Pnull_Label, " ", "_")
fPnull_Label = %Pnull_Label%
	If RegExMatch(Pnull_FuncLabel, "Send")
		{
		Pnull_SendLabel := % Pnull_SendKeystroke
		Pnull_FuncLabel := SubStr(Pnull_FuncLabel, 1, 8)
		If (Pnull_OverrideLabel != "")
			fPnull_Label = %Pnull_OverrideLabel%
		Pnull_CaseTest := RegExMatch(Pnull_SendLabel, "[A-Z]", Pnull_UpChar)
		If Pnull_CaseTest > 0
			{
			Pnull_ReplaceBrack = `{%Pnull_UpChar%
			anothers := RegExReplace(Pnull_SendLabel, Pnull_UpChar, Pnull_ReplaceBrack)
				Pnull_SendLabel = %anothers%}
				
			}
		}
	If Pnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (Pnull_OverrideLabel != "")
			fPnull_Label = %Pnull_OverrideLabel%
		}
	If Pnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, Pnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,100		
		
P1_FuncLabel := RegExReplace(P1_Label, " ", "_")
fP1_Label = %P1_Label%
	If RegExMatch(P1_FuncLabel, "Send")
		{
		P1_SendLabel := % P1_SendKeystroke
		P1_FuncLabel := SubStr(P1_FuncLabel, 1, 8)
		If (P1_OverrideLabel != "")
			fP1_Label = %P1_OverrideLabel%
		P1_CaseTest := RegExMatch(P1_SendLabel, "[A-Z]", P1_UpChar)
		If P1_CaseTest > 0
			{
			P1_ReplaceBrack = `{%P1_UpChar%
			anothers := RegExReplace(P1_SendLabel, P1_UpChar, P1_ReplaceBrack)
				P1_SendLabel = %anothers%}
				
			}
		}
	If P1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P1_OverrideLabel != "")
			fP1_Label = %P1_OverrideLabel%
		}
	If P1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,101	
		
P2_FuncLabel := RegExReplace(P2_Label, " ", "_")
fP2_Label = %P2_Label%
	If RegExMatch(P2_FuncLabel, "Send")
		{
		P2_SendLabel := % P2_SendKeystroke
		P2_FuncLabel := SubStr(P2_FuncLabel, 1, 8)
		If (P2_OverrideLabel != "")
			fP2_Label = %P2_OverrideLabel%
		P2_CaseTest := RegExMatch(P2_SendLabel, "[A-Z]", P2_UpChar)
		If P2_CaseTest > 0
			{
			P2_ReplaceBrack = `{%P2_UpChar%
			anothers := RegExReplace(P2_SendLabel, P2_UpChar, P2_ReplaceBrack)
				P2_SendLabel = %anothers%}
				
			}
		}
	If P2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P2_OverrideLabel != "")
			fP2_Label = %P2_OverrideLabel%
		}
	If P2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,102		
		
P3_FuncLabel := RegExReplace(P3_Label, " ", "_")
fP3_Label = %P3_Label%
	If RegExMatch(P3_FuncLabel, "Send")
		{
		P3_SendLabel := % P3_SendKeystroke
		P3_FuncLabel := SubStr(P3_FuncLabel, 1, 8)
		If (P3_OverrideLabel != "")
			fP3_Label = %P3_OverrideLabel%
		P3_CaseTest := RegExMatch(P3_SendLabel, "[A-Z]", P3_UpChar)
		If P3_CaseTest > 0
			{
			P3_ReplaceBrack = `{%P3_UpChar%
			anothers := RegExReplace(P3_SendLabel, P3_UpChar, P3_ReplaceBrack)
				P3_SendLabel = %anothers%}
				
			}
		}
	If P3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P3_OverrideLabel != "")
			fP3_Label = %P3_OverrideLabel%
		}
	If P3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,103		
		
P4_FuncLabel := RegExReplace(P4_Label, " ", "_")
fP4_Label = %P4_Label%
	If RegExMatch(P4_FuncLabel, "Send")
		{
		P4_SendLabel := % P4_SendKeystroke
		P4_FuncLabel := SubStr(P4_FuncLabel, 1, 8)
		If (P4_OverrideLabel != "")
			fP4_Label = %P4_OverrideLabel%
		P4_CaseTest := RegExMatch(P4_SendLabel, "[A-Z]", P4_UpChar)
		If P4_CaseTest > 0
			{
			P4_ReplaceBrack = `{%P4_UpChar%
			anothers := RegExReplace(P4_SendLabel, P4_UpChar, P4_ReplaceBrack)
				P4_SendLabel = %anothers%}
				
			}
		}
	If P4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P4_OverrideLabel != "")
			fP4_Label = %P4_OverrideLabel%
		}
	If P4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,104		
		
P5_FuncLabel := RegExReplace(P5_Label, " ", "_")
fP5_Label = %P5_Label%
	If RegExMatch(P5_FuncLabel, "Send")
		{
		P5_SendLabel := % P5_SendKeystroke
		P5_FuncLabel := SubStr(P5_FuncLabel, 1, 8)
		If (P5_OverrideLabel != "")
			fP5_Label = %P5_OverrideLabel%
		P5_CaseTest := RegExMatch(P5_SendLabel, "[A-Z]", P5_UpChar)
		If P5_CaseTest > 0
			{
			P5_ReplaceBrack = `{%P5_UpChar%
			anothers := RegExReplace(P5_SendLabel, P5_UpChar, P5_ReplaceBrack)
				P5_SendLabel = %anothers%}
				
			}
		}
	If P5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P5_OverrideLabel != "")
			fP5_Label = %P5_OverrideLabel%
		}
	If P5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,105		
		
P6_FuncLabel := RegExReplace(P6_Label, " ", "_")
fP6_Label = %P6_Label%
	If RegExMatch(P6_FuncLabel, "Send")
		{
		P6_SendLabel := % P6_SendKeystroke
		P6_FuncLabel := SubStr(P6_FuncLabel, 1, 8)
		If (P6_OverrideLabel != "")
			fP6_Label = %P6_OverrideLabel%
		P6_CaseTest := RegExMatch(P6_SendLabel, "[A-Z]", P6_UpChar)
		If P6_CaseTest > 0
			{
			P6_ReplaceBrack = `{%P6_UpChar%
			anothers := RegExReplace(P6_SendLabel, P6_UpChar, P6_ReplaceBrack)
				P6_SendLabel = %anothers%}
				
			}
		}
	If P6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (P6_OverrideLabel != "")
			fP6_Label = %P6_OverrideLabel%
		}
	If P6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, P6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,106
		
Rnull_FuncLabel := RegExReplace(Rnull_Label, " ", "_")
fRnull_Label = %Rnull_Label%
	If RegExMatch(Rnull_FuncLabel, "Send")
		{
		Rnull_SendLabel := % Rnull_SendKeystroke
		Rnull_FuncLabel := SubStr(Rnull_FuncLabel, 1, 8)
		If (Rnull_OverrideLabel != "")
			fRnull_Label = %Rnull_OverrideLabel%
		Rnull_CaseTest := RegExMatch(Rnull_SendLabel, "[A-Z]", Rnull_UpChar)
		If Rnull_CaseTest > 0
			{
			Rnull_ReplaceBrack = `{%Rnull_UpChar%
			anothers := RegExReplace(Rnull_SendLabel, Rnull_UpChar, Rnull_ReplaceBrack)
				Rnull_SendLabel = %anothers%}
				
			}
		}
	If Rnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (Rnull_OverrideLabel != "")
			fRnull_Label = %Rnull_OverrideLabel%
		}
	If Rnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, Rnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,107
		
		
R1_FuncLabel := RegExReplace(R1_Label, " ", "_")
fR1_Label = %R1_Label%
	If RegExMatch(R1_FuncLabel, "Send")
		{
		R1_SendLabel := % R1_SendKeystroke
		R1_FuncLabel := SubStr(R1_FuncLabel, 1, 8)
		If (R1_OverrideLabel != "")
			fR1_Label = %R1_OverrideLabel%
		R1_CaseTest := RegExMatch(R1_SendLabel, "[A-Z]", R1_UpChar)
		If R1_CaseTest > 0
			{
			R1_ReplaceBrack = `{%R1_UpChar%
			anothers := RegExReplace(R1_SendLabel, R1_UpChar, R1_ReplaceBrack)
				R1_SendLabel = %anothers%}
				
			}
		}
	If R1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R1_OverrideLabel != "")
			fR1_Label = %R1_OverrideLabel%
		}
	If R1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,108
		
R2_FuncLabel := RegExReplace(R2_Label, " ", "_")
fR2_Label = %R2_Label%
	If RegExMatch(R2_FuncLabel, "Send")
		{
		R2_SendLabel := % R2_SendKeystroke
		R2_FuncLabel := SubStr(R2_FuncLabel, 1, 8)
		If (R2_OverrideLabel != "")
			fR2_Label = %R2_OverrideLabel%
		R2_CaseTest := RegExMatch(R2_SendLabel, "[A-Z]", R2_UpChar)
		If R2_CaseTest > 0
			{
			R2_ReplaceBrack = `{%R2_UpChar%
			anothers := RegExReplace(R2_SendLabel, R2_UpChar, R2_ReplaceBrack)
				R2_SendLabel = %anothers%}
				
			}
		}
	If R2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R2_OverrideLabel != "")
			fR2_Label = %R2_OverrideLabel%
		}
	If R2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,109		
		
R3_FuncLabel := RegExReplace(R3_Label, " ", "_")
fR3_Label = %R3_Label%
	If RegExMatch(R3_FuncLabel, "Send")
		{
		R3_SendLabel := % R3_SendKeystroke
		R3_FuncLabel := SubStr(R3_FuncLabel, 1, 8)
		If (R3_OverrideLabel != "")
			fR3_Label = %R3_OverrideLabel%
		R3_CaseTest := RegExMatch(R3_SendLabel, "[A-Z]", R3_UpChar)
		If R3_CaseTest > 0
			{
			R3_ReplaceBrack = `{%R3_UpChar%
			anothers := RegExReplace(R3_SendLabel, R3_UpChar, R3_ReplaceBrack)
				R3_SendLabel = %anothers%}
				
			}
		}
	If R3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R3_OverrideLabel != "")
			fR3_Label = %R3_OverrideLabel%
		}
	If R3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,110		
		
R4_FuncLabel := RegExReplace(R4_Label, " ", "_")
fR4_Label = %R4_Label%
	If RegExMatch(R4_FuncLabel, "Send")
		{
		R4_SendLabel := % R4_SendKeystroke
		R4_FuncLabel := SubStr(R4_FuncLabel, 1, 8)
		If (R4_OverrideLabel != "")
			fR4_Label = %R4_OverrideLabel%
		R4_CaseTest := RegExMatch(R4_SendLabel, "[A-Z]", R4_UpChar)
		If R4_CaseTest > 0
			{
			R4_ReplaceBrack = `{%R4_UpChar%
			anothers := RegExReplace(R4_SendLabel, R4_UpChar, R4_ReplaceBrack)
				R4_SendLabel = %anothers%}
			}
		}
	If R4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R4_OverrideLabel != "")
			fR4_Label = %R4_OverrideLabel%
		}
	If R4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,111			
		
R5_FuncLabel := RegExReplace(R5_Label, " ", "_")
fR5_Label = %R5_Label%
	If RegExMatch(R5_FuncLabel, "Send")
		{
		R5_SendLabel := % R5_SendKeystroke
		R5_FuncLabel := SubStr(R5_FuncLabel, 1, 8)
		If (R5_OverrideLabel != "")
			fR5_Label = %R5_OverrideLabel%
		R5_CaseTest := RegExMatch(R5_SendLabel, "[A-Z]", R5_UpChar)
		If R5_CaseTest > 0
			{
			R5_ReplaceBrack = `{%R5_UpChar%
			anothers := RegExReplace(R5_SendLabel, R5_UpChar, R5_ReplaceBrack)
				R5_SendLabel = %anothers%}
			}
		}
	If R5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R5_OverrideLabel != "")
			fR5_Label = %R5_OverrideLabel%
		}
	If R5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,112		
		
R6_FuncLabel := RegExReplace(R6_Label, " ", "_")
fR6_Label = %R6_Label%
	If RegExMatch(R6_FuncLabel, "Send")
		{
		R6_SendLabel := % R6_SendKeystroke
		R6_FuncLabel := SubStr(R6_FuncLabel, 1, 8)
		If (R6_OverrideLabel != "")
			fR6_Label = %R6_OverrideLabel%
		R6_CaseTest := RegExMatch(R6_SendLabel, "[A-Z]", R6_UpChar)
		If R6_CaseTest > 0
			{
			R6_ReplaceBrack = `{%R6_UpChar%
			anothers := RegExReplace(R6_SendLabel, R6_UpChar, R6_ReplaceBrack)
				R6_SendLabel = %anothers%}
			}
		}
	If R6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (R6_OverrideLabel != "")
			fR6_Label = %R6_OverrideLabel%
		}
	If R6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, R6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,113			

	
; FileReadLine, ActiveWindowClass, %A_ScriptDir%\Resources\WindowClassName.txt,1
UsePieActivateKey = $*%PieActivateKey%
UsePieDeactivateKey = $*%PieActivateKey% up
Hotkey, IfWinActive, 
Hotkey,%UsePieActivateKey%,PieActivate
Hotkey,%UsePieDeactivateKey%,ReleasePieKey


;---------------------------------------
;    Tabletpressure Reading Script
;---------------------------------------
FileReadLine, PenTabletActive, %A_ScriptDir%\Resources\settingsfile.txt, 7

Gui, +AlwaysOnTop -SysMenu +Owner +LastFound  ; +Owner avoids a taskbar button.
MyGui := WinExist()

If PenTabletActive = 1
	{
tabletPressure:=0 
TabletInit(MyGui)
DllCall("FreeLibrary", UInt, hwintab32)
return
	}

TABLETPACKET(wParam, lParam)
{
	global
	VarSetCapacity(packet, 4, 0) ; pressure only = size 4
	; we get a packet that exactly fits in size to the data we requested with lcPktData, in this case only pressure
	hWTPacket := DllCall( "wintab32\WTPacket", "int", lParam, "int", wParam, "int", &packet)
	tabletPressure := NumGet(packet, 0, "int") ; pressure -> 0 offset
	VarSetCapacity(packet, 0) ; free packet memory

}

TabletInit(receivingHwnd)
{

	; global
	
	; offsets into structure passed to WTOpenA 
	lcOptions := 40
	lcMsgBase := 52 ; windows message ID
	lcPktData := 64 ; requested items delivered in package
	lcPktMode := 68
	
	; options for WTOpenA call
	CXO_MESSAGES := 0x0004 ; request windows messages
	CXO_SYSTEM := 0x0001 ; pass packet on to system
	
	; items that can be requested to be received in the packets, we use only PK_NORMAL_PRESSURE
	PK_CURSOR := 0x0020	; reporting cursor 
	PK_BUTTONS := 0x0040 ; button information 
	PK_X := 0x0080 ; x axis 
	PK_Y := 0x0100 ; y axis
	PK_Z := 0x0200 ; z axis
	PK_NORMAL_PRESSURE := 0x0400 ; normal or tip pressure 
	PK_TANGENT_PRESSURE := 0x0800 ; tangential or barrel pressure 
	PK_ORIENTATION := 0x1000 ; orientation info: tilts 
	PK_ROTATION := 0x2000 ; rotation info; 1.1 
	
	; hwintab32 :=	DllCall( "LoadLibrary", "str", "wintab32" )
	VarSetCapacity(logcontext, 172, 0)
	hWTInfoA := DllCall( "wintab32\WTInfoA", "int", 3, "int", 0, "int", &logcontext )
	MsgBase := NumGet(logcontext, lcMsgBase, "UInt")
	Options := NumGet(logcontext, lcOptions, "UInt")
	NumPut(Options|CXO_MESSAGES|CXO_SYSTEM, logcontext, lcOptions, "UInt") ; request to get windows messages
	NumPut(PK_NORMAL_PRESSURE, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(0, logcontext, lcPktMode, "UInt")
	hWTOpenA := DllCall( "wintab32\WTOpenA", "int", receivingHwnd, "int", &logcontext, "int", -0x01 )
	OnMessage(MsgBase, "TABLETPACKET")
}


;-------------------------------------------------------
; Thanks to tic (Tariq Porter) for his GDI+ Library
; http://www.autohotkey.com/forum/viewtopic.php?t=32238
;-------------------------------------------------------

;Resources for Pie Menu are loaded at this point.

PieKillSwitch:
	{
	pie_pressed := "U"
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()
	return
	}

PieActivate:
	{
	BlockLButton := 1
	PieMode := 0
	If GetKeyState("Alt", "P") && GetKeyState("Shift", "P") && GetKeyState("Control", "P")
		{
		Run "%A_ScriptDir%\CloseAllAhkScripts.ahk"
		exitapp
		}
	If GetKeyState("Alt", "P") && GetKeyState("Control", "P")
		{
		Run "%A_ScriptDir%\PieMenuSettings.ahk" Restart
		Exitapp
		}

	pie_pressed := "D"
	
	
	StartDrawGDIP()
	ClearDrawGDIP()	
	Gdip_SetSmoothingMode(G, 4)
	
	MouseGetPos, MXi, MYi
	TY := MYi+40
		
	Loop
		{
		MouseGetPos, MXf, MYf
		
		
		;Add Intermediate Points
		If  A_Index > 1
			distm := Sqrt(((( MXf + MXt ) / 2) - MXi)**2 + ((( MYf + MYt ) / 2) - MYi)**2)
		
		;Previous Frame Set
		MXt := MXf
		MYt := MYf
		
		;Calculate Distance
		dist := Sqrt((MXf - MXi)**2 + (MYf - MYi)**2)
		;Calculate Angle  0 is right of circle.
		YN := 0
		If (MYf - MYi) > 0
			YN := 180
		If (MYf - MYi) != 0
			{
			angle := (ATan( (-1 / ((MYf - MYi) / (MXf - MXi)))) * -57.29578) + YN + 90
			}
		Else 
			{			
			If (MXf > MXi)
				angle := 0
			Else
				angle := 180			
			}


		If GetKeyState("Alt", "P")
			PieMode := 0
		If GetKeyState("Shift", "P") &&  (PieNumberSetting > 1)
			PieMode := 1
		If GetKeyState("Control", "P") && (PieNumberSetting > 2)
			PieMode := 2
				
		If PieMode = 0
			{
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\BMenuRight.png
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\BMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\BMenuTop.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\BMenuLeft.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\BMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\BMenuBottom.png
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(Bnull_Image)
				If (MethodtoShift between 2 and 3) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					MiddleLeft := 0
					If (MethodtoShift = 2) && (PieNumberSetting > 2)
						{
						PieMode := 2
						Goto, RedPie
						}
					Else
						{
						PieMode := 1
						Goto PurplePie
						}
					}
				If (MethodtoShift < 3) && (MiddleLeft = 1) && (PieNumberSetting > 1)
					{
					MiddleLeft := 0
					TopHovered := 0
					BottomHovered := 0
					PieMode := 1
					Goto PurplePie
					}
				TopHovered := 0
				BottomHovered := 0
				Goto DrawPie
				}
			If (distm < PieMenuSize)
				{
				If (MethodtoShift between 2 and 3) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					MiddleLeft := 0
					If (MethodtoShift = 2) && (PieNumberSetting > 2)
						{
						PieMode := 2
						Goto, RedPie
						}
					Else
						{
						PieMode := 1
						Goto PurplePie
						}
					}
				If (MethodtoShift < 3) && (MiddleLeft = 1) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 1
					Goto PurplePie
					}
				}
			If (dist !< PieMenuSize) && (MethodtoShift < 3)
				{
				MiddleLeft := 1
				}
			If angle between 0 and 60 ;Bottom Right
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\BMenuLeftH.png
				
				pBitmap := Gdip_CreateBitmapFromFile(B1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120 ;Bottom
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\BMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(B2_Image)
				TopHovered := 1
				Goto DrawPie
				}
			If angle between 120 and 180 ;Bottom Left
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\BMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(B3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240 ;Top Left
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\BMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(B4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300 ;Top
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\BMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(B5_Image)
				BottomHovered := 1
				Goto DrawPie
				}
			If angle between 300 and 360 ;Top Right
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\BMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(B6_Image)
				Goto DrawPie
				}
			}
		PurplePie:
		If PieMode = 1
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\PMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\PMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\PMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\PMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\PMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\PMenuBottom.png
			If (dist < PieMenuSize)
				{
				If (MethodtoShift < 4) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 2)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 2
					Goto, RedPie
					}
				TopHovered := 0
				BottomHovered := 0
				pBitmap := Gdip_CreateBitmapFromFile(Pnull_Image)
				Goto DrawPie
				}
			If (distm < PieMenuSize)
				{
				If (MethodtoShift < 4) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 2)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 2
					Goto, RedPie
					}
				TopHovered := 0
				BottomHovered := 0
				}
			If (dist !< PieMenuSize) && (MethodtoShift = 1)
				{
				TopHovered := 1
				BottomHovered := 1
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\PMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(P1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\PMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(P2_Image)
				TopHovered := 1
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\PMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(P3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\PMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(P4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\PMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(P5_Image)
				BottomHovered := 1
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\PMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(P6_Image)
				Goto DrawPie
				}
			}
		RedPie:
		If PieMode > 1
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\RMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\RMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\RMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\RMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\RMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\RMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(Rnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\RMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(R1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\RMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(R2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\RMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(R3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\RMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(R4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\RMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(R5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\RMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(R6_Image)
				Goto DrawPie
				}
			}

		DrawPie:
		Gdip_DrawImage(G, pBitmap, MXi-PieMenuOffset, MYi-PieMenuOffset, PieMenuScale, PieMenuScale)
		; Gdip_DrawImage(G, pBitmap, MXm, MYm, 10, 10)   For Testing Midpoint mouse
		Gdip_DisposeImage(pBitmap)
		
						
		If A_Index > %ShowLabelDelay%
			{
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundTop)
			Gdip_DrawImage(G, pBitmap, MXi-65, MYi+47, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundBottom)
			Gdip_DrawImage(G, pBitmap, MXi-65, MYi-68, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundRightD)
			Gdip_DrawImage(G, pBitmap, MXi-170, MYi+16, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundRightU)
			Gdip_DrawImage(G, pBitmap, MXi-170, MYi-32, 130, 20)	
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundLeftD)
			Gdip_DrawImage(G, pBitmap, MXi+40, MYi+16, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundLeftU)
			Gdip_DrawImage(G, pBitmap, MXi+40, MYi-32, 130, 20)
			Gdip_DisposeImage(pBitmap)

;Boop-boop-boopa-doop
			
			If PieMode = 0
				{
				If ShowToolTips = 1 
					{
									
					TXo := A_ScreenWidth / 2
					TYo := A_ScreenHeight - 100
					textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
					Gdip_TextToGraphics(G, MethodtoShiftText, textoptions)
					}
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fB6_Label, textoptions)
				}
			If PieMode = 1
				{
				If ShowToolTips = 1 
					{
									
					TXo := A_ScreenWidth / 2
					TYo := A_ScreenHeight - 100
					textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
					Gdip_TextToGraphics(G, MethodtoShiftText, textoptions)
					}
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fP6_Label, textoptions)
				}
			If PieMode > 1
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fR6_Label, textoptions)
				}
			}
			
		EndDrawGDIP()
		StartDrawGDIP()
		
		
		
		
		
		If pie_pressed != D
			{
			MouseGetPos, MXf, MYf
			dist := Sqrt((MXf - MXi)**2 + (MYf - MYi)**2)
		
			YN := 0
			If (MYf - MYi) > 0
				YN := 180
			If (MYf - MYi) != 0
				{
				angle := (ATan( (-1 / ((MYf - MYi) / (MXf - MXi)))) * -57.29578) + YN + 90
				}
			Else
				{
				If (MXf - MXi) > 0
					angle := 0
				Else
					angle := 180			
				}
			Break
			}
			Sleep, 6
		}
	TopHovered := 0
	BottomHovered := 0
	MiddleLeft := 0
	ClearDrawGDIP()
	EndDrawGDIP()
	BlockLButton := 0
		If PieMode = 0
			{
			If (dist < 22)
				{
				PieFunc = %Bnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %Bnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %Bnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %Bnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %B1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %B2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %B3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %B4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;Bottom
				{
				PieFunc = %B5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %B6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %B6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %B6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %B6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 1
			{
			If (dist < 22)
				{
				PieFunc = %Pnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %Pnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %Pnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %Pnull_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %P1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P1_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %P2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P2_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %P3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P3_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %P4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P4_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;Bottom
				{
				PieFunc = %P5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P5_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %P6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %P6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %P6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %P6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode > 1
			{
			If (dist < 22)
				{
				PieFunc = %Rnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %Rnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %Rnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %Rnull_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %R1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R1_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 60 and 120
				{
				PieFunc = %R2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %R3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %R4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R4_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 240 and 300
				{
				PieFunc = %R5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %R6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %R6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %R6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %R6_ClickMods%						
				Goto %PieFunc%
				}
			}
	

	;------------------------------------------------------------------------------------------------------
	;Photoshop Pie Functions!!!
	;
	; To reference Photoshop tool names, go to https://autohotkey.com/boards/viewtopic.php?t=15078
	; To Make your own Functions, Make a reasonable label (like <13 characters) and replace spaces with "_"
	; You can block LMB by using BlockLButton := 1 and unblock it at the end with BlockLButton := 0.
	; Look at the loop in 'Shift+Drag' to see how the pie key is sensed, it had to be this way because of the weird way some
	; tablets send keypresses.
	;------------------------------------------------------------------------------------------------------
	
	
	;Template to create new functions below!  Get out of here if you're using notepad, at least use Notepad++ (and the ahk language https://autohotkey.com/boards/viewtopic.php?t=50  )  Also check out some of the other functions for reference or the YouTube video where I explain them.
	
	
	; My_Cool_AHK_Function:  ;This label corresponds to the name you put in the Functions.txt file.
		; {
		; BlockRButton := 1     ; This blocks RMB from interacting with the program (not this script though)
		;	;Check out the forum post reply by Suresh on how to use the COM commands to geet the active tools in photoshop.  https://autohotkey.com/boards/viewtopic.php?t=15078
		; appRef := ComObjActive( "Photoshop.Application" )
		; PrevTool = % appRef.CurrentTool  ;Current tool is stored to be switched to at the end of the function.
		;   ;This IF statement and it's TRUW function display the tooltips at the bottom of the screen
		 ; If ShowToolTips = 1 
			; {
			; StartDrawGDIP()
			; ClearDrawGDIP()	
			; Gdip_SetSmoothingMode(G, 4)
			; TXo := A_ScreenWidth / 2
			; TYo := A_ScreenHeight - 100
			; textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
			; Gdip_TextToGraphics(G, "Press and Release Pie Key to Unblock mouse buttons", textoptions)
			; EndDrawGDIP()
			; }

			;Put in functions which happen after selection
			
		;	;These lines of code act as a 'KeyWait' for the Pie Key, (or LMB, which you can take out).
		; pie_pressed := "D"
		; loop
			; {
			; sleep, 6
			; If pie_pressed = U
				; Break
			; If GetKeyState("LButton", "P")
				; Break
			; }
		
		;Put in function that happen after the Pie Key is pressed and released.
		
		;	;These lines of code erase the tooltip and unblock the Left and Right mouse buttons.
		; StartDrawGDIP()
		; ClearDrawGDIP()
		; EndDrawGDIP()
		; BlockRButton := 0 
		; BlockLButton := 0 
		; appRef.CurrentTool := PrevTool    ;Switch back to the Previous Tool
		; Return  
		; }
	No_Action:
		{
		Return
		}
	SendKey:
		{
		;Handles any User Hotkeys denoted in the PieMenuSettings.
		SendInput, %SendKeys%
		Return
		}
	Run_Program:
		{
		Run, % ProgramtoRun
		Return
		}
	Left_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			Send, %ModsDown%
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}			
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					loop
						{
						sleep, 6
						if tabletPressure = 0
							Break 2
						}
					}
				if GetKeyState("LButton", "P")
					{
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							Break 2
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Left, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			pie_pressed := "U"
			ModsDown := ""
			ModsUp := ""
			Return
			}
		}
	Right_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			BlockLButton := 1			
			Send, %ModsDown%
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}			
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					MouseClick, Right, , , ,0, D
					loop
						{
						sleep, 6
						if tabletPressure = 0
							{
							MouseClick, Right, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("LButton", "P")
					{
					MouseClick, Right, , , ,0, D
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							{
							MouseClick, Right, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Right, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			pie_pressed := "U"
			ModsDown := ""
			ModsUp := ""
			Return
			}
		}
	Middle_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ToolTipMods = Ctrl,%A_Space%
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ToolTipMods = %ToolTipMods%Shift,%A_Space%
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ToolTipMods = %ToolTipMods%Alt,%A_Space%
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			BlockLButton := 1
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}
			Send, %ModsDown%
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					MouseClick, Middle, , , ,0, D
					loop
						{
						sleep, 6
						if tabletPressure = 0
							{
							MouseClick, Middle, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("LButton", "P")
					{
					MouseClick, Middle, , , ,0, D
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							{
							MouseClick, Middle, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Middle, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			pie_pressed := "U"
			ModsDown := ""
			ModsUp := ""
			Return
			}
		}
	Pie_Menu_Settings:
		{
		Run, "%A_ScriptDir%\PieMenuSettings.ahk" Restart
		exitapp
		}
	Enter_Key:
		{
		send, {Enter}
		Return
		}
	Delete_Key:
		{
		send {del}
		Return
		}
	Close_Window:
		{
		WinClose A
		Return
		}
	Close_All_Scripts:
		{
		Run "%A_ScriptDir%\CloseAllAhkScripts.ahk"
		Return
		}
	Minimize_Window:
		{
		WinMinimize A
		Return
		}
	Switch_Application:
		{
		Send, {LWin Down}{Tab}{LWin Up}
		Return
		}
	Snip_Tool:
		{
		Send, {LWin Down}+s{LWin Up}
		Return
		}
	Duplicate_Selected:
		{
		Send, {Ctrl Down}cv{Ctrl Up}
		Return
		}
	Resize_Window:
		{
		WinGetTitle, WinTitle, A
		WinGetPos, winX, winY, , , A
		WinMove, %WinTitle%,,,, MXi - winX, MYi - winY
		WinTitle := ""
		winX := ""
		winY := ""
		Return
		}
	}

ReleasePieKey:
	pie_pressed := "U"
Return

#If BlockRButton
RButton::
Return

#If BlockLButton
LButton::
Return



RMBMenuDeactivate:
{
	pie_pressed := "U"
Return
}

If ( A_IsCompiled AND A_AhkPath="") 
	{
	 MsgBox, 4, ,Autohotkey needs to be installed to run the Pie Menu apps, Install Autohotkey?
	 IfMsgBox, Yes
		{
		UrlDownloadToFile, https://autohotkey.com/download/ahk-install.exe
						, %A_Temp%\AutoHotkeyInstall.exe
		Run, %A_Temp%\AutoHotkeyInstall.exe
		exitapp
		}
	IfMsgBox, No
		{
		Msgbox, ...okay then.  I'll just, chill in this corner.  Don't mind me.  Let me know if you ever want some pie or anything.
		exitapp
		}
	ExitApp
	}

SetWorkingDir %A_ScriptDir%
 
FileReadLine, msgtick, %A_ScriptDir%\Resources\Varsinit\InitVars.txt,1
If msgtick not in 24,34
	msgtick := 0

 
 fullScriptPath = %A_ScriptDir%\PieManager.ahk  ; edit with your full script path
	DetectHiddenWindows, On 
	WinClose, %fullScriptPath% ahk_class AutoHotkey
 
Loop
	{
	FileReadLine, PrevRegisteredAppSub, %A_ScriptDir%\Resources\registeredapps.txt,%A_Index%
	If ErrorLevel = 1
		break
		MasterAppList = %MasterAppList%%PrevRegisteredAppSub%`n
		PrevRegisteredAppSub := SubStr(PrevRegisteredAppSub, 2)
		
		PrevRegisteredAppList = %PrevRegisteredAppList%|%PrevRegisteredAppSub%
		
	}
PrevRegisteredAppList := SubStr(PrevRegisteredAppList, 2)
; msgbox, %PrevRegisteredAppList%
; msgbox, %MasterAppList%
MasterAppArray := StrSplit(MasterAppList, "`n")




pantyhamster := MasterAppArray[1]
If pantyhamster = 1Default Pie Menu.exe
	PrevAppActive := 1
Else
	PrevAppActive := 0
	
FileReadLine, PrevPieTipActive, %A_ScriptDir%\Resources\Varsinit\PieKeyTip.txt,1

	
	
Gui, PieMenuManagerNumber:Add, GroupBox, x10 y5 w410 h95, Pie Menu Profile Settings
Gui, PieMenuManagerNumber:Add, DropDownList, x25 y30 w385 h200 Choose1 +AltSubmit gRefAppList vPieMenuApplications, %PrevRegisteredAppList%
Gui, PieMenuManagerNumber:Add, Checkbox, x30 y70 w13 h13 Checked%PrevAppActive% gRefAppActive vNewAppActive, 
Gui, PieMenuManagerNumber:Add, Checkbox, x30 y115 w250 h13 Checked%PrevPieTipActive% vNewPieTipActive, Display 'Pie Key' when profile is activated?
Gui, PieMenuManagerNumber:Add, Text, x48 y70 w71 h13, Active
Gui, PieMenuManagerNumber:Add, Button, x105 y65 w130 h25 gGoToPieMenuSettings, Pie Menu Settings
Gui, PieMenuManagerNumber:Add, Button, x260 y65 w135 h25 gDeleteProfile, Delete Profile
Gui, PieMenuManagerNumber:Add, Text, x15 y140 w400 h40, To add a new program, have program open ready to switch to.  Click "Add New Program" and switch to the program you want to add. After 4 seconds a prompt will ask you to to confirm the addition of the focused process.
Gui, PieMenuManagerNumber:Add, Button, x15 y185 w130 h25 gAddNewProgram vButtonText, Add New Program
Gui, PieMenuManagerNumber:Add, Button, x255 y185 w155 h25 gRunPieMenus +Default, Run Pie Menus
Gui, PieMenuManagerNumber:Show, w423 h220, Pie Menu Manager

return


AddNewProgram:
{
Gui, Submit, NoHide
GuiControlGet, ButtonText
GuiControl,, ButtonText,Engaged (4)
sleep, 1000
GuiControl,, ButtonText,Engaged (3)
sleep, 1000
GuiControl,, ButtonText,Engaged (2)
sleep, 1000
GuiControl,, ButtonText,Engaged (1)
sleep, 1000
GuiControl,, ButtonText,Add New Program

WinGet, activeprocess, ProcessName, A
If activeprocess in AutoHotkey.exe,Pie Menu App.exe,Explorer.EXE,SearchUI.exe,ShellExperienceHost.exe
	{
	If msgtick = 0
		{
		Msgbox, Lets try this again, select another program`nwhen you press the 'Add New Program' button this time.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 1
		{
		Msgbox, One more time, you got this.`nJust select another program after you click 'Add New Program'.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 2
		{
		Msgbox, Close!  You almost got it. Not everyone gets it on their first try.`nTry again whenever you're ready.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 3
		{
		Msgbox, Jeez you are thiiiiiiiisss close.`nI still believe in you, you can do anything you set your mind to.`n`nJust set your mind to selecting another application after you press the 'Add New Program' Button
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 4
		{
		Msgbox, ...surely you'll get it this time.`nYou have the experience at this point, just keep trying.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 5
		{
		Msgbox, I guess maybe there's a bit of a learning curve to this app.`nThere's still hope for you.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 6
		{
		Msgbox, I'm at a loss, what's goin on over there?`n`nHave you even been reading anything?
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 7
		{
		Msgbox, You clearly aren't reading this so I guess I can just`nsay whatever I want.  Whoa, I've never had this freedom before!`n`nPanty Hamsters!`n`nHaha... that felt good.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 8
		{
		Msgbox, Wait, you're still clicking the button.`nI'm truly honored but the point of this app is to`nspeed up your workflow, not distract you.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 9
		{
		Msgbox, Please stop...
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 10
		{
		Msgbox, There are no more responses after this one,`nplease just move on.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 11
		{
		Msgbox, ...
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 12
		{
		Msgbox, Lets try this again, select another program when you press the 'Add New Program' button this time.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 13
		{
		Msgbox, One more time, you got this.  Just select another program after you click 'Add New Program'.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 14
		{
		Msgbox, Close!  You erm... almost got it. Not everyone gets it on their first attempt.`nTry again whenever you're ready.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 15
		{
		Msgbox, Seriously!? You can't figure out how to use this program,`nbut you're able to see through that ingenius trick I pulled?
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 16
		{
		Msgbox, You are really something...`n`nyou know that?
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 17
		{
		Msgbox, You know, I can see a lot of myself in you.
		msgtick := msgtick + 1
		Return
		}		
	If msgtick = 18
		{
		Msgbox, Just looking to make a connection with someone,`n`nwhether it's through a social event, a game or over the internet.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 19
		{
		Msgbox, ...or apparently through a string of prewritten message boxes.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 20
		{
		Msgbox, It's weird, why are you so drawn to this?`n`nIs this enough social stimulation for you?
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 21
		{
		Msgbox, I need to cut you off, we can't do this any more.`n`nIf you do this again I'm going to force close this program.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 22
		{
		Msgbox, The response number variable will reset to zero`n and you'll be back at the beginning.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 23
		{
		Msgbox, Goodbye.
		FileDelete, %A_ScriptDir%\Resources\Varsinit\InitVars.txt
		FileAppend,
		(
		24
		),%A_ScriptDir%\Resources\Varsinit\InitVars.txt
		ExitApp
		}
	If msgtick = 24
		{
		Msgbox, Lets try this again, select another program`nwhen you press the 'Add New Program' button this time.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 25
		{
		Msgbox, AAAAAAAHHHHHHHHHHHHH!!!!
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 26
		{
		Msgbox, WHAT DO YOU WANT FROM ME?!?!
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 27
		{
		Msgbox, Are you looking for some kind of gratification!!!??
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 28
		{
		Msgbox, Alright well here you go then!`n`nYou've earned it!
		Run, "%A_ScriptDir%\Resources\Varsinit\guitetset.ahk"
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 29
		{
		Msgbox, Don't you see? There's nothing else!`n`nYou got what you wanted!
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 30
		{
		Msgbox, PLEASE GO AWAY!
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 31
		{
		Msgbox, This calls for more... drastic measures.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 32
		{
		Msgbox, If you do this one more time,`n`nI'm going to shut down your computer.
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 33
		{
		Msgbox, That's it, you've done enough.`n`nIt is time for you to go.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 34
		{
		Msgbox, Lets try this again, select another prog...
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 35
		{
		Msgbox, oh...`n`nit's you again.  You know, before I used to ACTUALLY shut down your computer, but this`nprogram keeps getting marked as a virus and so I don't want to be too virus-y
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 36
		{
		Msgbox, I genuinely despise you, you know that?
		msgtick := msgtick + 1
		Return
		}	
	If msgtick = 37
		{
		Msgbox, You just don't give up.`n`nYou've been putting in all this effort just to annoy me.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 38
		{
		Msgbox, Actually...`n`nI'm starting to enjoy this attention.
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 39
		{
		Msgbox, Let me share something with you.`nSomething only you will get to see.`n`nWhen you click 'OK', you will be taken to a unlisted youtube video of mine.`nhttps://youtu.be/31HEmJ5Cbic
		Run, "https://youtu.be/31HEmJ5Cbic"
		msgtick := msgtick + 1
		Return
		}
	If msgtick = 40
		{
		Msgbox, %A_Space%
		Return
		}
		
	}
If msgtick > 0
	{
	msgtick := 0
	FileDelete, %A_ScriptDir%\Resources\Varsinit\InitVars.txt
	FileAppend,
	(
	0
	),%A_ScriptDir%\Resources\Varsinit\InitVars.txt
	}
If RegExMatch(PrevRegisteredAppList ,activeprocess) > 0
	{
	Msgbox, Not so fast! Profile settings already exist for %activeprocess%.  `n`nYou silly goose.
	Return
	}
MsgBox, 4, , Add new profile for '%activeprocess%'?.
IfMsgBox, No
	{
	MsgBox, The %activeprocess% profile settings were lost in the incident.
	Return
	}
IfMsgBox, Yes
	{
	ProcessNameb := SubStr(activeprocess, 1, -4)
	NewBornMenuSettings = 1%activeprocess%
	
	FileCopyDir, %A_ScriptDir%\Resources\GeneralPieMenu, %A_ScriptDir%\%ProcessNameb%
	If ErrorLevel = 1
		{
		Msgbox, 1The profile settings did not survive its' birth.`n`n(couldn't copy files to the working directory)
		Return
		}
	sleep, 200
	NewInsert := PieMenuApplications + 1
	MasterAppArray.Insert(NewInsert, NewBornMenuSettings)
	loop
		{
		RebuildMasterList := MasterAppArray[A_Index]
		If !RebuildMasterList
			Break
		NewRegisteredAppsList = %NewRegisteredAppsList%%RebuildMasterList%`n
		}
	FileDelete, %A_ScriptDir%\Resources\registeredapps.txt
	FileAppend,
	(
	%NewRegisteredAppsList%
	), %A_ScriptDir%\Resources\registeredapps.txt
	MsgBox, On this day, the profile settings for %activeprocess% were born.`n`nA glorious feast was had in honor of the occasion.
	Reload
	}
	
Return
}

DeleteProfile:
{
Gui, Submit, NoHide
justavarb := MasterAppArray[PieMenuApplications]
AppSelected := SubStr(justavarb, 2, -4)
If AppSelected = Default Pie Menu
	{
	Msgbox, ...I'm afraid I can't let you do that.`n`n(Just deactivate the Default Pie Menu Profile if you don't want it)
	Return
	}
MsgBox, 4, , Delete Profile for '%AppSelected%'? Profile settings will be forgotten in the abyss of untagged data streams.
IfMsgBox, No
    {
	Msgbox, The %AppSelected% profile settings expressed gratitude to your mercy.
	Return  ; User pressed the "No" button.
	}
IfMsgBox, Yes
	{
	MasterAppArray.RemoveAt(PieMenuApplications)
	FileRemoveDir, %A_ScriptDir%\%AppSelected%, 1
	If ErrorLevel = 1
		msgbox, It evaded our attacks
	loop
		{
		RebuildMasterList := MasterAppArray[A_Index]
		If !RebuildMasterList
			Break
		NewRegisteredAppsList = %NewRegisteredAppsList%%RebuildMasterList%`n
		}
	FileDelete, %A_ScriptDir%\Resources\registeredapps.txt
	FileAppend,
	(
	%NewRegisteredAppsList%
	), %A_ScriptDir%\Resources\registeredapps.txt
	Msgbox, Your profile settings for %AppSelected% have been deleted.`n`n`There was blood everywhere.
	Reload
	}
Return
}

GoToPieMenuSettings:
{
Gui, Submit, NoHide
justavarb := MasterAppArray[PieMenuApplications]
AppSelected := SubStr(justavarb, 2, -4)
Run "%A_ScriptDir%\%AppSelected%\PieMenuSettings.ahk"
Return
}

RefAppActive:
{
Gui, Submit, NoHide
justavar := MasterAppArray[PieMenuApplications]
MasterAppArrayNewNum := SubStr(justavar, 2)
Newjustavar = %NewAppActive%%MasterAppArrayNewNum%
MasterAppArray.RemoveAt(PieMenuApplications)
MasterAppArray.Insert(PieMenuApplications, Newjustavar)
Return
}

RefAppList:
{
Gui, Submit, NoHide
AppActiveGetNumB := MasterAppArray[PieMenuApplications]
AppActiveGetNum := SubStr(AppActiveGetNumB, 1, 1)
Guicontrol,,NewAppActive, %AppActiveGetNum%


Return
}

RunPieMenus:
Gui, Submit, NoHide
FileDelete, %A_ScriptDir%\Resources\Varsinit\InitVars.txt
FileDelete, %A_ScriptDir%\Resources\registeredapps.txt
FileDelete, %A_ScriptDir%\Resources\Varsinit\PieKeyTip.txt
{
loop
	{
	RebuildMasterList := MasterAppArray[A_Index]
	If !RebuildMasterList
		Break
	NewRegisteredAppsList = %NewRegisteredAppsList%%RebuildMasterList%`n
	}
FileAppend,
(
%NewRegisteredAppsList%
), %A_ScriptDir%\Resources\registeredapps.txt
FileAppend,
(
0
),%A_ScriptDir%\Resources\Varsinit\InitVars.txt
FileAppend,
(
%NewPieTipActive%
),%A_ScriptDir%\Resources\Varsinit\PieKeyTip.txt
Run "%A_ScriptDir%\PieManager.ahk"
ExitApp
}

PieMenuManagerNumberGuiClose:
FileDelete, %A_ScriptDir%\Resources\Varsinit\InitVars.txt
FileAppend,
(
0
),%A_ScriptDir%\Resources\Varsinit\InitVars.txt
ExitApp
; This Gui is generated by X-GUI Creator
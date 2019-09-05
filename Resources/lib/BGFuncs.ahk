getMonitorCoords(ByRef monLeft, ByRef monTop, ByRef monRight, ByRef monBottom)
	{
	monLeft := 0
	monRight := 0
	monTop := 0
	monBottom := 0
	loop
		{
		Sysget, testMon, Monitor, 1
		if testMonLeft is number
			Break
		sleep, 100
		}
	Sysget, numMonitors, MonitorCount
	loop, %numMonitors%
		{
		SysGet, iMon, Monitor, %A_Index%	
		if monLeft > %iMonLeft%
		monLeft = %iMonLeft%
		if monRight < %iMonRight%
		monRight = %iMonRight%
		if monTop > %iMonTop%
		monTop = %iMonTop%
		if monBottom < %iMonBottom%
		monBottom = %iMonBottom%
		; msgbox, "left:"%iMonLeft%" Top:"%iMonTop%" Right:"%iMonRight%" Bottom:"%iMonBottom%"."
		; msgbox, "left:"%monLeft%" Top:"%monTop%" Right:"%monRight%" Bottom:"%monBottom%"."
		}
	return
	}

removeCharacters(var, chars="!^+#")
	{
	   stringreplace,var,var,%A_space%,_,a
	   loop, parse, chars,
	      stringreplace,var,var,%A_loopfield%,,a
	   return var
	}

calcAngle(aX, aY, bX, bY)
	{
	initVal := (dllcall("msvcrt\atan2","Double",(bY-aY), "Double",(bX-aX), "CDECL Double")*57.29578)
	If initVal < 0
		returnVal := (initVal+360)
	Else
		returnVal := initVal
	return returnVal
	}

checkAHK()
	{
	AHKVersion := StrReplace(A_AHKVersion, ".","")
	If ( A_IsCompiled AND A_AhkPath="" AND (AHKVersion >= 113001)) 
	{
	 MsgBox, 4, ,Autohotkey needs to be installed/updated to run the Pie Menu apps, Install Autohotkey?
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
	}

drawPie(G, xPos, yPos, dist, theta, numSlices, radius, thickness, bgColor, selectColor)
	{
	nTheta := Round(theta/(360/numSlices))*(360/numSlices)
	gmx := xPos-monLeft
	gmy := yPos-monTop
	ClearDrawGDIP()
	Gdip_SetSmoothingMode(G, 4)
	basicPen := Gdip_CreatePen(bgColor, thickness)
	Gdip_DrawEllipse(G, basicPen, (gmx-(radius / 2)), (gmy-(radius / 2)), radius, radius)
	If (dist <= ((radius/2)+(thickness/2)))
	{
	selectPen := Gdip_CreatePen(selectColor, thickness/2)
	Gdip_DrawEllipse(G, selectPen, (gmx-(radius / 2)+(thickness/4)), (gmy-(radius / 2)+(thickness/4)), radius-(thickness/2), radius-(thickness/2))
	pieRegion := 0
	}
	Else
	{
	selectPen := Gdip_CreatePen(selectColor, thickness)	
	Gdip_DrawArc(G, selectPen, (gmx-(radius/2)), (gmy-(radius/2)), radius, radius, (nTheta-(180/numSlices)), (360/numSlices))	
	pieRegion := Round(theta/(360/numSlices))+1	
	If (pieRegion == (numSlices + 1))
		pieRegion := 1
	}
	; Gdip_DeletePen(basicPen)
	; Gdip_DeletePen(selectPen)
	EndDrawGDIP()
	return pieRegion
	}
pieTipText(text)
	{
	global
	StartDrawGDIP()
	ClearDrawGDIP()	
	
	Gdip_SetSmoothingMode(G, 4)
	
	TXo := A_ScreenWidth / 2
	TYo := A_ScreenHeight - 100
	textoptions = x%TXo% y%TYo% Center Vcenter cffffffff r4 s16
	ToolTipText = %text%
	Gdip_TextToGraphics(G, ToolTipText, textoptions)
	EndDrawGDIP()
	}

runPieMenu(profileNum, index)
	{
	global
	MouseGetPos, iMouseX, iMouseY
	StartDrawGDIP()
	arm2 := false
	arm3 := false
	armPie3 := false
	armPie2 := false
	activePie := 1
	pieMode := 0
	PieRegion := 0
	fPieRegion := drawPie(G, iMouseX, iMouseY, 0, 0, settings.appProfiles[profileNum].pieMenus[index].numSlices, settings.appProfiles[profileNum].pieMenus[index].radius, settings.appProfiles[profileNum].pieMenus[index].thickness, settings.appProfiles[profileNum].pieMenus[index].bgColor, settings.appProfiles[profileNum].pieMenus[index].selColor)
	pieHotkey := removeCharacters(settings.appProfiles[profileNum].pieMenus[index].hotkey, "!^+#")
	; msgbox, % settings.appProfiles[profileNum].pieMenus[index].hotkey " changed to " pieHotkey
	loop
		{
		if !GetKeyState(pieHotkey, "P")
			Break
		
		if (A_Index != 1) && (pieRegion != 0) ;Midpoint stuff
			{
			midMouseX := mouseX
			midMouseY := mouseY
			MouseGetPos, mouseX, mouseY		
			midMouseX := ( ( mouseX + midMouseX ) / 2)
			midMouseY := ( ( mouseY + midMouseY ) / 2)
			midDist := (Sqrt((Abs(midMouseX-iMouseX)**2) + (Abs(midMouseY-iMouseY)**2)))
			}
		else
			{
			MouseGetPos, mouseX, mouseY
			midDist := 99999
			}

		;Calculate Distance and Angle
		dist := (Sqrt((Abs(mouseX-iMouseX)**2) + (Abs(mouseY-iMouseY)**2)))
		theta := calcAngle(iMouseX, iMouseY, mouseX, mouseY)
		;if inside circle
		If (dist <= ((settings.appProfiles[profileNum].pieMenus[index].radius/2)+(settings.appProfiles[profileNum].pieMenus[index].thickness/2)) or midDist <= ((settings.appProfiles[profileNum].pieMenus[index].radius/2)+(settings.appProfiles[profileNum].pieMenus[index].thickness/2)))
		{
		pieRegion := 0
		}
		Else
		{
		pieRegion := Round(theta/(360/settings.appProfiles[profileNum].pieMenus[index].numSlices))+1	
		If (pieRegion == (settings.appProfiles[profileNum].pieMenus[index].numSlices + 1))
			pieRegion := 1
		}
		if (armPie3 != true) && (pieRegion > 0)
			{
			;Refactor Me!!
			atheta := (leftTheta - theta - 180)
			deltaTheta := atheta - (Floor(atheta / 360) * 360)
			if deltaTheta between 0 and 90
				{
				if (arm3 == true)
					armPie3 := true
				arm2 := true
				; thetaQuad := 3
				}				
			else if deltaTheta between 270 and 360
				{
				if (arm2 == true)
					armPie3 := true
				arm3 := true
				}				
			else
				{				
				arm2 := false
				arm3 := false
				; thetaQuad := 1
				}		
			}

		If (pieRegion != fPieRegion)
			{
			;;If you leave the center
			If (pieRegion > 0) && (fPieRegion == 0)
				{
				if (settings.appProfiles[profileNum].pieMenus[index].enablePie2)
					armPie2 := true
				leftTheta := theta				
				}			
			;Check armed pie when return to circle
			if (fPieRegion > 0) && (pieRegion == 0) 
				{
				if (armPie3 == true) && (settings.appProfiles[profileNum].pieMenus[index].enablePie3)
					activePie := 3
				else if (armPie2 == true) && (settings.appProfiles[profileNum].pieMenus[index].enablePie2)
					activePie := 2			
				}
			;Draw the correct pie menu			
			StartDrawGDIP()				
			if (activePie == 1)
				{
				fPieRegion := drawPie(G, iMouseX, iMouseY, dist, theta, settings.appProfiles[profileNum].pieMenus[index].numSlices, settings.appProfiles[profileNum].pieMenus[index].radius, settings.appProfiles[profileNum].pieMenus[index].thickness, settings.appProfiles[profileNum].pieMenus[index].bgColor, settings.appProfiles[profileNum].pieMenus[index].selColor)
				}				
			else if (activePie == 2)
				{
				fPieRegion := (settings.appProfiles[profileNum].pieMenus[index].numSlices + 1 + drawPie(G, iMouseX, iMouseY, dist, theta, settings.appProfiles[profileNum].pieMenus[index].pie2.numSlices, settings.appProfiles[profileNum].pieMenus[index].radius, settings.appProfiles[profileNum].pieMenus[index].thickness, settings.appProfiles[profileNum].pieMenus[index].pie2.bgColor, settings.appProfiles[profileNum].pieMenus[index].pie2.selColor))
				}
			else if (activePie == 3)
				{
				fPieRegion := (settings.appProfiles[profileNum].pieMenus[index].numSlices + settings.appProfiles[profileNum].pieMenus[index].pie2.numSlices + 2 + drawPie(G, iMouseX, iMouseY, dist, theta, settings.appProfiles[profileNum].pieMenus[index].pie3.numSlices, settings.appProfiles[profileNum].pieMenus[index].radius, settings.appProfiles[profileNum].pieMenus[index].thickness, settings.appProfiles[profileNum].pieMenus[index].pie3.bgColor, settings.appProfiles[profileNum].pieMenus[index].pie3.selColor))
				}				
			}
		sleep 20
		} ;end pie loop
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()
	; msgbox,  %deltaTheta%`nPie3 = %armPie3%`narm2 = %arm2%`narm3 = %arm3%`nactivePie = %activePie% `nfPieRegion = %fPieRegion%
	return %pieRegion%
	}





Class pieModifier{
	modToggle(){		
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieMenus
				Hotkey, % settings.appProfiles[1].pieMenus[menus].hotkey, Toggle
			return
			}
		Else
			{
			global activeProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieMenus
				Hotkey, % settings.appProfiles[activeProfile[2]].pieMenus[menus].hotkey, Toggle
			return
			}
		}
	modOn(){
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieMenus
				Hotkey, % settings.appProfiles[1].pieMenus[menus].hotkey, On
			return
			}
		Else
			{
			; global activeProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieMenus
				Hotkey, % settings.appProfiles[activeProfile[2]].pieMenus[menus].hotkey, On
			return
			}
		}
	modOff(){
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieMenus
				Hotkey, % settings.appProfiles[1].pieMenus[menus].hotkey, Off
			return
			}
		Else
			{
			global activeProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieMenus
				Hotkey, % settings.appProfiles[activeProfile[2]].pieMenus[menus].hotkey, Off
			return			
			}
		}	
	}

getActiveProfile()
	{
	If (!WinActive("ahk_group regApps"))
		{
		return ["ahk_group regApps", 1]
		}	
	WinGet, activeWinProc, ProcessName, A
	WinGetClass, activeWinClass, A
	for profiles in settings.appProfiles
		{
		testAHKHandle := StrSplit(settings.appProfiles[profiles].ahkHandle, " ", ,2)[2]
		if (testAHKHandle == activeWinProc) || (testAHKHandle == activeWinClass)
			{
			return [settings.appProfiles[profiles].ahkHandle, profiles]
			}
		}	
	}

Class pieFunctions{
	Class general{
		sendKey(){
			msgbox, this function went
			return
		}
		multiKeySend(){
			return
		}
		focusApplication(){
			return
		}
		repeatLastFunction(){
			return
		}
		openSettings(){
			return
		}
		resizeWindow(){
			return
		}
		

	}

	Class appSpecific{
		Class afterfx{
		}
	}
	
}
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

cycleRange(var, range=360){
	var := var - (range*Floor((var / range)))
	return var
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
RGBAtoHEX(RGBA) ;Converts RGBA array to HEX ARGB
	{
	rHex := Format("0x{4:02x}{1:02x}{2:02x}{3:02x}`r`n", RGBA*)
	return rHex
	}
whitenRGB(RGBAarray)
	{
	NewRGBA := [0, 0, 0, 255]
	loop 3
		{
		NewRGBA[A_Index] := RGBAarray[A_Index]+20		
		}
	; msgbox, % RGBAarray[1] "," RGBAarray[2] "," RGBAarray[3]
	return NewRGBA
	}
drawPieLabel(pGraphics, labelText, xPos, yPos, selected:=0, anchor:="top", activePieProfile=0)
	{	
	xPosition := xPos
	yPosition := yPos
	pad := 6
	fontSize := 12	
	If (selected == 1)
		{
		strokeColor := RGBAtoHEX(activePieProfile.selColor)
		labelBGColor := RGBAtoHEX(whitenRGB(activePieProfile.bgColor))
		; labelBGColor := RGBAtoHEX(whitenRGB([30, 30, 30, 255]))
		}
	else
		{
		strokeColor := RGBAtoHEX([123, 123, 123, 255])
		labelBGColor := RGBAtoHEX(activePieProfile.bgColor)		
		; labelBGColor := RGBAtoHEX([30, 30, 30, 255])		
		}
	
	textColor := "C7FFFFFF"
	displayText := labelText
	textOptionsTest := % "x" xPosition " y" yPosition " Center vCenter c00FFFFFF r4 s" fontSize
	Gdip_SetSmoothingMode(pGraphics, 4)
	basicPen := Gdip_CreatePen(strokeColor, 1)
	otherPen := Gdip_CreatePen("0xFFff0000" , 1)
	basicBrush := Gdip_BrushCreateSolid(labelBGColor)
	theRect := Gdip_TextToGraphics(pGraphics, displayText, textOptionsTest, "Arial")
	theRect := StrSplit(theRect, "|")
	theRect[3] := Ceil(theRect[3])
	theRect[4] := Ceil(theRect[4])
	If (anchor == "bottom")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-(theRect[3]/2)-pad), Ceil(yPosition-theRect[4]-(2*pad)), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-(theRect[3]/2)-pad), Ceil(yPosition-theRect[4]-(2*pad)), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" xPosition " y" (yPosition-theRect[4]-pad) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "top")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-(theRect[3]/2)-pad), yPosition, Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-(theRect[3]/2)-pad), yPosition, Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" xPosition " y" (yPosition+pad) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "left")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, xPosition, Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, xPosition, Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" (xPosition+(theRect[3]/2)+pad) " y" (yPosition-(theRect[4]/2)) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "right")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-theRect[3]-(2*pad)), Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-theRect[3]-(2*pad)), Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" (xPosition-(theRect[3]/2)-pad) " y" (yPosition-(theRect[4]/2)) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	; Gdip_DrawEllipse(pGraphics, otherPen, xPosition, yPosition, 1, 1)
	return
	}

drawPie(G, xPos, yPos, dist, theta, numSlices, radius, thickness, bgColor, selectColor, thetaOffset, activePieProfile)
	{	
	;init local variables
	nTheta := (Floor(cycleRange(theta-thetaOffset)/(360/numSlices))*(360/numSlices))+thetaOffset
	gmx := xPos-monLeft
	gmy := yPos-monTop
	labelRadius := 100
	ClearDrawGDIP()
	Gdip_SetSmoothingMode(G, 4)
	basicPen := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness)
	Gdip_DrawEllipse(G, basicPen, (gmx-(radius / 2)), (gmy-(radius / 2)), radius, radius)
	If (dist <= ((radius/2)+(thickness/2)))
		{
		selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness/2)
		Gdip_DrawEllipse(G, selectPen, (gmx-(radius / 2)+(thickness/4)), (gmy-(radius / 2)+(thickness/4)), radius-(thickness/2), radius-(thickness/2))
		pieRegion := 0
		}
	Else
		{
		selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness)
		Gdip_DrawArc(G, selectPen, (gmx-(radius/2)), (gmy-(radius/2)), radius, radius, (nTheta)-90, (360/numSlices))	
		pieRegion := Floor(cycleRange(theta-thetaOffset)/(360/numSlices))+1	

		; If (pieRegion == (numSlices + 1))
		; 	pieRegion := 1
		}
	;Draw pie labels
	loop, %numSlices%
		{
		labelTheta := (((A_Index-1)*(360/numSlices))+(180/numSlices+thetaOffset))
		if labelTheta between 0.1 and 179.9
			labelAnchor := "left"
		else if labelTheta between 180.1 and 359.9
			labelAnchor := "right"
		else If (labelTheta == Mod(labelTheta,360))
			labelAnchor := "top"
		else
			labelAnchor := "bottom"	

		If (pieRegion = A_Index)
			selectedLabelState := 1				
		Else
			selectedLabelState := 0
		
		drawPieLabel(G, activePieProfile.functions[A_Index+1].label, Round(xPos+(labelRadius*Cos((labelTheta-90)*0.01745329252))), Round(ypos+(labelRadius*Sin((labelTheta-90)*0.01745329252))), selectedLabelState, labelAnchor, activePieProfile)
		}
	EndDrawGDIP()
	return pieRegion
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
	thetaOffset := 0
	activePieNumber := 1	
	runningProfile := settings.appProfiles[profileNum].pieMenus[index]
	offsetPie := [runningProfile.activePie[1].offset*(180/runningProfile.activePie[1].numSlices),runningProfile.activePie[2].offset*(180/runningProfile.activePie[2].numSlices),runningProfile.activePie[3].offset*(180/runningProfile.activePie[3].numSlices)]	
	pieMode := 0
	pieRegion := 0 ;what is this used for?
	drawPie(G, iMouseX, iMouseY, 0, 0, runningProfile.activePie[activePieNumber].numSlices, runningProfile.radius, runningProfile.thickness, runningProfile.activePie[1].bgColor, runningProfile.activePie[1].selColor, offsetPie[1], runningProfile.activePie[activePieNumber])
	fPieRegion := 0
	pieHotkey := removeCharacters(runningProfile.hotkey, "!^+#")
	; msgbox, % runningProfile.hotkey " changed to " pieHotkey
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
		theta := cycleRange(calcAngle(iMouseX, iMouseY, mouseX, mouseY)+90)
		;if inside circle
		If (dist <= ((runningProfile.radius/2)+(runningProfile.thickness/2)) or midDist <= ((runningProfile.radius/2)+(runningProfile.thickness/2)))
		{
		pieRegion := 0
		}
		Else		
		{		
		pieRegion := Floor(cycleRange(theta-offsetPie[activePieNumber])/(360/runningProfile.activePie[activePieNumber].numSlices))+1	
		If (pieRegion == (runningProfile.activePie[activePieNumber].numSlices + 1))
			pieRegion := 1
		}
		if (armPie3 != true) && (pieRegion > 0) ; If out of middle and pie 1 or 2
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

		; If (pieRegion != fPieRegion) ;If region changes
		If (pieRegion != fPieRegion) ;If region changes
			{
			;;If you leave the center
			If (pieRegion > 0) && (fPieRegion == 0)
				{
				if (runningProfile.activePie[2].enable)
					armPie2 := true
				leftTheta := theta				
				}			
			;Check armed pie when return to circle
			if (fPieRegion > 0) && (pieRegion == 0) 
				{
				if (armPie3 == true) && (runningProfile.activePie[3].enable)
					activePieNumber := 3
				else if (armPie2 == true) && (runningProfile.activePie[2].enable)
					activePieNumber := 2			
				}
			StartDrawGDIP()
			fPieRegion := drawPie(G, iMouseX, iMouseY, dist, theta, runningProfile.activePie[activePieNumber].numSlices, runningProfile.radius, runningProfile.thickness, runningProfile.activePie[activePieNumber].bgColor, runningProfile.activePie[activePieNumber].selColor, offsetPie[activePieNumber], runningProfile.activePie[activePieNumber])

			}
		sleep, 10		
		} ;end pie loop
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()	
	return [profileNum,index,activePieNumber,pieRegion]
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
			global activeProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			; msgbox,  % activeProfile[1]
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
				{
				If (settings.appProfiles[1].pieMenus[menus].hotkey != activePieKey)
					Hotkey, % settings.appProfiles[1].pieMenus[menus].hotkey, Off
				}				
			return
			}
		Else
			{
			; global activveProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieMenus
				{
				If (settings.appProfiles[activeProfile[2]].pieMenus[menus].hotkey != activePieKey)
					Hotkey, % settings.appProfiles[activeProfile[2]].pieMenus[menus].hotkey, Off
				}				
			return			
			}
		}	
	}
runPieFunction(funcNum)
	{
	selectedRegion := settings.appProfiles[funcNum[1]].pieMenus[funcNum[2]].activePie[funcNum[3]].functions[funcNum[4]+1]
	pieFuncToRun := "pie_" . selectedRegion.function	
	pieFuncParamsArray := selectedRegion.params
	%pieFuncToRun%(pieFuncParamsArray)
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

hasValue(var, arr) {
	arrOfKeys := []
	for key, value in arr
		if (value == var)
			arrOfKeys.Push(key)
	return (arrOfKeys.Length() = 0) ? false : arrOfKeys
	}

blockBareKeys(hotkeyInput, hotkeyArray, blockState=1){
	bareKey := removeCharacters(hotkeyInput, "!^+#")
	If (bareKey == activePieKey)
		return
	If (blockState == 1)
		{
		Try	Hotkey, % bareKey, pieLabel
		Try Hotkey, % "+" + bareKey,pieLabel							
		Try	Hotkey, % bareKey, On
		Try Hotkey, % "+" + bareKey, On
		}
	Else
		{
		If !(hasValue(bareKey, hotkeyArray))
			Try Hotkey, % bareKey, Off
		If !(hasValue("+" + bareKey, hotkeyArray))
			Try Hotkey, % "+" + bareKey, Off
		}
	return
	}

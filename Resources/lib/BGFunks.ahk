getMonitorCoords(ByRef monLeft, ByRef monTop, ByRef monRight, ByRef monBottom)
	{
	global monitorManager := New MonitorManager
	; msgbox, % monitorManager.monitors[1].dpiX
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
	;Get the number of monitors from the monitor manager.
	numMonitors := 0
	for monIndex in monitorManager.monitors
		{
		;Count monitors
		if (IsObject(monitorManager.monitors[monIndex]))
		numMonitors := numMonitors+1
		;Determine maximum area, only disregard scaling when true/pm is enabled in the compile.
		if (monLeft > monitorManager.monitors[monIndex].left)
		monLeft := monitorManager.monitors[monIndex].left
		if (monRight < monitorManager.monitors[monIndex].right)
		monRight := monitorManager.monitors[monIndex].right
		if (monTop > monitorManager.monitors[monIndex].top)
		monTop := monitorManager.monitors[monIndex].top
		if (monBottom < monitorManager.monitors[monIndex].bottom)
		monBottom := monitorManager.monitors[monIndex].bottom
		; msgbox, %monIndex% "left:"%monLeft%" Top:"%monTop%" Right:"%monRight%" Bottom:"%monBottom%
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
	; msgbox, % AHKVersion < 113202
	; If ( A_IsCompiled AND A_AhkPath="" AND (AHKVersion < 113201)) 
	If (AHKVersion < 113200) 
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

copyFilesAndFolders(SourcePattern, DestinationFolder, DoOverwrite = false)
	{
    ; First copy all the files (but not the folders):
    FileCopy, %SourcePattern%, %DestinationFolder%, %DoOverwrite%
    ErrorCount := ErrorLevel
    ; Now copy all the folders:
    Loop, %SourcePattern%, 2  ; 2 means "retrieve folders only".
    {
        FileCopyDir, %A_LoopFileFullPath%, %DestinationFolder%\%A_LoopFileName%, %DoOverwrite%
        ErrorCount += ErrorLevel
        if ErrorLevel  ; Report each problem folder by name.
            MsgBox Could not copy %A_LoopFileFullPath% into %DestinationFolder%.
    }
    return ErrorCount
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
drawPieLabel(pGraphics, labelText, xPos, yPos, selected:=0, anchor:="top", activePieProfile=0, pieDPIScale=1, clicked:=false)
	{
	p_FontSize := settings.global.fontSize
	xPosition := xPos
	yPosition := yPos
	pad := Ceil(6*(((pieDPIScale-1)/2)+1))
	fontSize := Ceil(p_FontSize*pieDPIScale)
	minBoxWidth := Ceil(settings.global.minimumLabelWidth)
	; fontSize := 14
	If (selected == 1)
		{
		If (clicked = true)
		{
		strokeColor := RGBAtoHEX(activePieProfile.selColor)
		labelBGColor := RGBAtoHEX(activePieProfile.selColor)
		textColor := RGBAtoHEX(activePieProfile.bgColor)
		}
		else ;slice is focused
		{
		strokeColor := RGBAtoHEX(activePieProfile.selColor)
		labelBGColor := RGBAtoHEX(whitenRGB(activePieProfile.bgColor))
		textColor := "FFFFFFFF"
		}	
		}
	else
		{
		strokeColor := RGBAtoHEX([123, 123, 123, 255])
		labelBGColor := RGBAtoHEX(activePieProfile.bgColor)
		textColor := "FFFFFFFF"
		; labelBGColor := RGBAtoHEX([30, 30, 30, 255])
		}
	textYOffset := Ceil(1*pieDPIScale)
	displayText := labelText
	textOptionsTest := % "x" xPosition " y" yPosition " Center vCenter c00FFFFFF r4 s" fontSize
	Gdip_SetSmoothingMode(pGraphics, 4)
	basicPen := Gdip_CreatePen(strokeColor, 1)
	otherPen := Gdip_CreatePen("0xFFff0000" , 1)
	basicBrush := Gdip_BrushCreateSolid(labelBGColor)
	theRect := Gdip_TextToGraphics(pGraphics, displayText, textOptionsTest, "Arial")
	theRect := StrSplit(theRect, "|")
	theRect[3] := Max(Ceil(theRect[3]), minBoxWidth*pieDPIScale)
	theRect[4] := Ceil(theRect[4])
	If (anchor == "bottom")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-(theRect[3]/2)-pad), Ceil(yPosition-theRect[4]-(2*pad)), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-(theRect[3]/2)-pad), Ceil(yPosition-theRect[4]-(2*pad)), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" xPosition " y" (yPosition-theRect[4]-pad+textYOffset) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "top")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-(theRect[3]/2)-pad), yPosition, Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-(theRect[3]/2)-pad), yPosition, Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" xPosition " y" (yPosition+pad+textYOffset) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "left")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, xPosition, Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, xPosition, Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" (xPosition+(theRect[3]/2)+pad) " y" (yPosition-(theRect[4]/2)+textYOffset) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	If (anchor == "right")
		{
		Gdip_FillRoundedRectangle(pGraphics, basicBrush, Ceil(xPosition-theRect[3]-(2*pad)), Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		Gdip_DrawRoundedRectangle(pGraphics, basicPen, Ceil(xPosition-theRect[3]-(2*pad)), Ceil(yPosition-(theRect[4]/2)-pad), Ceil(theRect[3]+(2*pad)), Ceil(theRect[4]+(2*pad)), 3)
		textOptions := % "x" (xPosition-(theRect[3]/2)-pad) " y" (yPosition-(theRect[4]/2)+textYOffset) " Center vCenter c" textColor " r4 s" fontSize
		Gdip_TextToGraphics(pGraphics, displayText, textOptions, "Arial")
		}
	; Gdip_DrawEllipse(pGraphics, otherPen, xPosition, yPosition, 1, 1)
	return
	}

drawPie(G, xPos, yPos, dist, theta, numSlices, radius, thickness, bgColor, selectColor, thetaOffset, activePieProfile, pieDPIScale=1, clicked:=false, drawLabel:=true)
	{	
	;init local variables
	nTheta := (Floor(cycleRange(theta-thetaOffset)/(360/numSlices))*(360/numSlices))+thetaOffset
	gmx := xPos
	gmy := yPos
	labelRadius := 100*pieDPIScale
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
	if(drawLabel = true)
	{
	loop, %numSlices%
		{
		if (activePieProfile.functions[A_Index+1].label = "")
			continue
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
		
		drawPieLabel(G, activePieProfile.functions[A_Index+1].label, Round(gmx+(labelRadius*Cos((labelTheta-90)*0.01745329252))), Round(gmy+(labelRadius*Sin((labelTheta-90)*0.01745329252))), selectedLabelState, labelAnchor, activePieProfile, pieDPIScale, clicked)
		}
	}
	EndDrawGDIP()
	return pieRegion
	}
runPieMenu(profileNum, index)
	{
	;REFACTOR - Declare variables better
	global	
	MouseGetPos, iMouseX, iMouseY
	

	if (substr(a_osversion, 1, 2) = "10")
	{	
	;detemine what monitor the mouse is in and scale factor
	pieDPIScale := 1
	for monIndex in monitorManager.monitors
		{
		if (iMouseX >= monitorManager.monitors[monIndex].left and iMouseX <= monitorManager.monitors[monIndex].right)
			{
			; msgbox, % iMouseX " is apparently between " monitorManager.monitors[monIndex].left " and " monitorManager.monitors[monIndex].right
			if (iMouseY >= monitorManager.monitors[monIndex].top and iMouseY <= monitorManager.monitors[monIndex].bottom)
				{
				pieDPIScale := monitorManager.monitors[monIndex].scaleX					
				break			
				}
			}
		}
	}
	else
	{
		;Win7 DPI Scaling (takes value of primary monitor)
		pieDPIScale := A_ScreenDPI / 96
	}
	; pieDPIScale := 1
	; msgbox, % iMouseX " and " iMouseY " pieDPI=" pieDPIScale
	pieDPIScaleHalf := ((pieDPIScale-1)/2)+1
	
	bitmapPadding := [300*pieDPIScale,180*pieDPIScale]
	SetUpGDIP(iMouseX-bitmapPadding[1], iMouseY-bitmapPadding[2], 2*bitmapPadding[1], 2*bitmapPadding[2])
	StartDrawGDIP()

	arm2 := false
	arm3 := false
	armPie3 := false
	armPie2 := false
	LButtonPressed := false
	LButtonPressed_LastState := false
	LButtonPressed_static := false
	thetaOffset := 0
	activePieNumber := 1
	runningProfile := settings.appProfiles[profileNum].pieMenus[index]
	offsetPie := [runningProfile.activePie[1].offset*(180/runningProfile.activePie[1].numSlices),runningProfile.activePie[2].offset*(180/runningProfile.activePie[2].numSlices),runningProfile.activePie[3].offset*(180/runningProfile.activePie[3].numSlices)]	
	pieMode := 0
	pieRegion := 0 ;what is one this used for?
	
	pieLabelShown := false
	if(runningProfile.labelDelay = 0)	
	showLabel := true
	else
	{
	showLabel := false
	pieOpenTime := A_TickCount
	}

	drawPie(G, bitmapPadding[1], bitmapPadding[2], 0, 0, runningProfile.activePie[activePieNumber].numSlices, runningProfile.radius*pieDPIScale, runningProfile.thickness*pieDPIScale, runningProfile.activePie[1].bgColor, runningProfile.activePie[1].selColor, offsetPie[1], runningProfile.activePie[activePieNumber], pieDPIScale, ,showLabel)
	fPieRegion := 0
	pieHotkey := removeCharacters(runningProfile.hotkey, "!^+#")
	
	

	if (SubStr(pieHotkey, -6) == "LButton") || (runningProfile.holdOpenOverride == true)
		f_FunctionLaunchMode := 1 ;Click only launchmode
	else
		f_FunctionLaunchMode := settings.global.functionLaunchMode



	; msgbox, % runningProfile.hotkey " changed to " pieHotkey
	loop
		{		
		if !GetKeyState(pieHotkey, "P") && (runningProfile.holdOpenOverride == false)
			Break
		if ((A_TickCount - pieOpenTime) > runningProfile.labelDelay*1000 && (showLabel == false))
		{
			showLabel := true
			pieLabelShown := true			
		}


		if (LButtonPressed = false)
		{
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
		}
		;Calculate Distance and Angle
		dist := (Sqrt((Abs(mouseX-iMouseX)**2) + (Abs(mouseY-iMouseY)**2)))
		theta := cycleRange(calcAngle(iMouseX, iMouseY, mouseX, mouseY)+90)
		;if inside circle
		If (dist <= (((runningProfile.radius/2)+(runningProfile.thickness/2))*pieDPIScale) or midDist <= (((runningProfile.radius/2)+(runningProfile.thickness/2))*pieDPIScale))
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

		;If LButton down - Change State and launch function maybe consider getting this out of the loop
		If (f_FunctionLaunchMode < 2) && (GetKeyState("LButton","P"))
		{
			LButtonPressed := true
			LButtonPressed_static := true
		}
		else
			LButtonPressed := false

		; If (pieRegion != fPieRegion) ;If region changes
		If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown := true) ;If region changes or mouseclick changes
			{
			pieLabelShown := false
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
			fPieRegion := drawPie(G, bitmapPadding[1], bitmapPadding[2], dist, theta, runningProfile.activePie[activePieNumber].numSlices, runningProfile.radius*pieDPIScale, runningProfile.thickness*pieDPIScale, runningProfile.activePie[activePieNumber].bgColor, runningProfile.activePie[activePieNumber].selColor, offsetPie[activePieNumber], runningProfile.activePie[activePieNumber], pieDPIScale, LButtonPressed, showLabel)
			if (LButtonPressed_LastState == true) && (LButtonPressed == false){
				runPieFunction([profileNum, index, activePieNumber, pieRegion, iMouseX, iMouseY])
				if (runningProfile.holdOpenOverride == true)
					break
				}			
			
			}
		LButtonPressed_LastState := LButtonPressed
		sleep, 10		
		} ;end pie loop
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()
	if LButtonPressed_static
	return false
	else
	{
	if (f_FunctionLaunchMode != 1)
	return [profileNum,index,activePieNumber,pieRegion, iMouseX, iMouseY]
	}
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
	if(funcNum = false)
		return
	static lastPieFunctionRanTickCount := 0
	static lastPieFunctionRan = ""
	

	selectedRegion := settings.appProfiles[funcNum[1]].pieMenus[funcNum[2]].activePie[funcNum[3]].functions[funcNum[4]+1]	
	; if selectedRegion.returnMousePos = 1
	; 	{
	; 	BlockInput, Mouse
	; 	MouseMove, funcNum[5], funcNum[6], 0		
	; 	}
	if (selectedRegion.function = "repeatLastFunction")
		{
		;Determine timeOut 0 := Infinite or >0 := value
		repeatTimeOut := 0	
		If (selectedRegion.params[1] > 0)
			{
			if ((lastPieFunctionRanTickCount + (selectedRegion.params[1]*1000)) > A_TickCount)
				repeatTimeOut := 1		
			}
		else
			repeatTimeOut := 1

		if (lastPieFunctionRan != "") && repeatTimeOut
			selectedRegion := lastPieFunctionRan
		else
			return
		}
	else
		{
		lastPieFunctionRan := selectedRegion	
		}

	pieFuncToRun := "pie_" . selectedRegion.function	
	pieFuncParamsArray := selectedRegion.params
	%pieFuncToRun%(pieFuncParamsArray)

	lastPieFunctionRanTickCount := A_TickCount
	
	; if selectedRegion.returnMousePos = 1
	; 	BlockInput, Off
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
	; for key in hotkeyArray
	; 	msgbox, % hotkeyArray[key]	
	; if (hotkeyInput == "")
	; 	return
	if hotkeyArray[1] = ""
		return
	bareKey := removeCharacters(hotkeyInput, "!^+#")


	If (hasValue(bareKey, hotkeyArray) && hasValue("+" + bareKey, hotkeyArray)){
		; msgbox, both
		return
	}
	If (bareKey == hotkeyInput)
		return
	If (blockState == 1) ; fix this
		{
		; If !(hasValue(bareKey, hotkeyArray))		
		Try	Hotkey, % bareKey, pieLabel
		Try Hotkey, % "+" + bareKey, pieLabel							
		Try	Hotkey, % bareKey, On
		Try Hotkey, % "+" + bareKey, On
		}
	Else
		{			
		If !(hasValue(bareKey, hotkeyArray)){
			Try Hotkey, % bareKey, Off
			; msgbox, % hasValue(bareKey, hotkeyArray)
		}
		If !(hasValue("+" + bareKey, hotkeyArray)){
			Try Hotkey, % "+" + bareKey, Off
		}		
		; msgbox, % bareKey
		}
	return
	}

class MonitorManager {
  __New() {
    ;; enum _PROCESS_DPI_AWARENESS    
	PROCESS_DPI_UNAWARE := 0
    PROCESS_SYSTEM_DPI_AWARE := 1
    PROCESS_PER_MONITOR_DPI_AWARE := 2
    ; DllCall("SHcore\SetProcessDpiAwareness", "UInt", PROCESS_PER_MONITOR_DPI_AWARE)
    ;; InnI: Get per-monitor DPI scaling factor (https://www.autoitscript.com/forum/topic/189341-get-per-monitor-dpi-scaling-factor/?tab=comments#comment-1359832)
    DPI_AWARENESS_CONTEXT_UNAWARE := -1
    DPI_AWARENESS_CONTEXT_SYSTEM_AWARE := -2
    DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE := -3
    DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 := -4
    DllCall("User32\SetProcessDpiAwarenessContext", "UInt" , DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE)
    ;; pneumatic: -DPIScale not working properly (https://www.autohotkey.com/boards/viewtopic.php?p=241869&sid=abb2db983d2b3966bc040c3614c0971e#p241869)
    
    ptr := A_PtrSize ? "Ptr" : "UInt"
    this.monitors := []
    DllCall("EnumDisplayMonitors", ptr, 0, ptr, 0, ptr, RegisterCallback("MonitorEnumProc", "", 4, &this), "UInt", 0)
    ;; Solar: SysGet incorrectly identifies monitors (https://autohotkey.com/board/topic/66536-sysget-incorrectly-identifies-monitors/)
  }
}

MonitorEnumProc(hMonitor, hdcMonitor, lprcMonitor, dwData) {
  l := NumGet(lprcMonitor + 0,  0, "Int")
  t := NumGet(lprcMonitor + 0,  4, "Int")
  r := NumGet(lprcMonitor + 0,  8, "Int")
  b := NumGet(lprcMonitor + 0, 12, "Int")
  
  this := Object(A_EventInfo)
  ;; Helgef: Allow RegisterCallback with BoundFunc objects (https://www.autohotkey.com/boards/viewtopic.php?p=235243#p235243)
  this.monitors.push(New Monitor(hMonitor, l, t, r, b))
  
	Return, 1
}

class Monitor {
  __New(handle, left, top, right, bottom) {
    ;When compiled with true/pm these values are based on real pixel coordinates without scaling.
	this.handle := handle
    this.left   := left
    this.top    := top
    this.right  := right
    this.bottom := bottom
    
    this.x      := left
    this.y      := top
    this.width  := right - left
    this.height := bottom - top

	dpi := this.getDpiForMonitor()
	this.dpiX := dpi.x	
    this.dpiY := dpi.y
    this.scaleX := this.dpiX / 96
   	this.scaleY := this.dpiY / 96
  }
  
  getDpiForMonitor() {
    ;; enum _MONITOR_DPI_TYPE
    MDT_EFFECTIVE_DPI := 0
    MDT_ANGULAR_DPI := 1
    MDT_RAW_DPI := 2
    MDT_DEFAULT := MDT_EFFECTIVE_DPI
    ptr := A_PtrSize ? "Ptr" : "UInt"
    dpiX := dpiY := 0
    DllCall("SHcore\GetDpiForMonitor", ptr, this.handle, "Int", MDT_DEFAULT, "UInt*", dpiX, "UInt*", dpiY)
    
    Return, {x: dpiX, y: dpiY}
  }
  ;; InnI: Get per-monitor DPI scaling factor (https://www.autoitscript.com/forum/topic/189341-get-per-monitor-dpi-scaling-factor/?tab=comments#comment-1359832)

}


resizeWindow(xPos,yPos){
	WinGetPos, winX, winY, width, height, A
	if (xPos < winX){ ;to left of origin
		if (yPos > winY){ ;below origin
			WinMove, A,,xPos,, width+(winX-xPos), (yPos-winY)
		}else{ ;above origin
			WinMove, A,, xPos, yPos, width+(winX-xPos), height+(winY-yPos)		
		}	
	}else{ ;right of origin
		if (yPos > winY){ ;mouse below origin
			WinMove, A,,,, (xPos-winX), (yPos-winY)
		} else { ;mouse above origin
			WinMove, A,,,yPos, (xPos-winX), height+(winY-yPos)
		}	
	}	
	Return
}

moveWindow(xPos,yPos){
	WinGetPos, winX, winY, width, height, A
	WinMove, A, , xPos-(width/2), yPos-(width/3)
}


logTime(start=True){
	static timeArray := []
	if (start == True){
	}
}

;For mouseClick pie function
lButtonWait(clickButton,sleepTime=3){	
	loop
		{
		Sleep, %sleepTime%
		if GetKeyState("LButton", "P")
			{				
			; MouseClick, %clickButton%, , , ,0, D
			loop
				{
				sleep, %sleepTime%
				If !GetKeyState("LButton", "P"){
					; MouseClick, %clickButton%, , , ,0, U
					return
				}
				}			
			}
		}
}
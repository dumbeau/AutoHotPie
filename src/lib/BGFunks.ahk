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

removeCharacters(var, chars="+^!#")
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

loadPieMenus(){
	;Copy global profiles to other profiles
	for k, pieKey in settings.appProfiles[1].pieKeys
	{
		if (pieKey.globalMenu == true)
		{
			for k2, profile in settings.appProfiles
			{
				if (k2 == 1)
					continue
				profile.pieKeys.Push(pieKey)
			}
		}
	}	

	
	;Load app settings to hotkeys
    appProfiles := settings.appProfiles    
    for k, profile in appProfiles {		
		if (profile.enable == false)
			continue
		if (profile.ahkHandles[1] == "ahk_group regApps")
		{
			Hotkey, IfWinNotActive, ahk_group regApps
			for k, pieKey in profile.pieKeys			
				{
				; msgbox, % pieKey.hotkey
				if (pieKey.enable == false)
					continue							
				Hotkey, % pieKey.hotkey, pieLabel
				If (profile.pieEnableKey.useEnableKey == true) && (profile.pieEnableKey.toggle == false)
					{ ;initialize off if modkey active no toggle				
					Hotkey, % pieKey.hotkey, Off
					}
				}			
			If (profile.pieEnableKey.useEnableKey == true)
				{
				If (profile.pieEnableKey.toggle == true)
					{
					Hotkey, % profile.pieEnableKey.enableKey, togglePieLabel				
					}
				else
					{
					Hotkey, % profile.pieEnableKey.enableKey, onPieLabel
					upHotkey := profile.pieEnableKey.enableKey " up"
					Hotkey, % upHotkey, offPieLabel
					}
				}
        }
		else
		{
		for ahkHandleIndex, ahkHandle in profile.ahkHandles
			{
				profile.ahkHandles[ahkHandleIndex] := "ahk_exe " . ahkHandle ;Append the ahk_exe tag to all profiles
				fullAHKHandle := profile.ahkHandles[ahkHandleIndex]
				; msgbox, % fullAHKHandle	
				GroupAdd, regApps, % fullAHKHandle 
				Hotkey, IfWinActive, % fullAHKHandle
				for k, pieKey in profile.pieKeys			
					{
					; msgbox, % pieKey.hotkey
					if (pieKey.enable == false)
						continue							
					Hotkey, % pieKey.hotkey, pieLabel
					If (profile.pieEnableKey.useEnableKey == true) && (profile.pieEnableKey.toggle == false)
						{ ;initialize off if modkey active no toggle				
						Hotkey, % pieKey.hotkey, Off
						}
					}			
				If (profile.pieEnableKey.useEnableKey == true)
					{
					If (profile.pieEnableKey.toggle == true)
						{
						Hotkey, % profile.pieEnableKey.enableKey, togglePieLabel				
						}
					else
						{
						Hotkey, % profile.pieEnableKey.enableKey, onPieLabel
						upHotkey := profile.pieEnableKey.enableKey " up"
						Hotkey, % upHotkey, offPieLabel
						}
					}
			}			          
        }
					
	}
}

loadSliceHotkeys(activePieMenu, hotkeysOn){
	global SliceHotkeyPressed
	profileKeyArray := []
	for k2, pieKey in activeProfile.pieKeys{
		profileKeyArray.Push(pieKey.hotkey)
	}
	; global ActivePieSliceHotkeyArray
	static lastActivePieMenu	
	if (lastActivePieMenu != activePieMenu){
		for k, key in ActivePieSliceHotkeyArray
		{
			;If hotkey is in another pie menu, continue
			if ( !hasValue(key, profileKeyArray) )
				Hotkey, % key, Off
			else
				continue		
		}
		ActivePieSliceHotkeyArray := []			
		; msgbox, % activePieMenu.functions[1].label
		for k, func in activePieMenu.functions
		{
			if (func.hotkey != ""){
				;If hotkey is in another pie menu, don't switch it
				if ( !hasValue(func.hotkey, profileKeyArray) ){
					Hotkey, % func.hotkey, blockLabel
					Hotkey, % func.hotkey, On
				}
				ActivePieSliceHotkeyArray.Push(func.hotkey)
			}
		}		
		lastActivePieMenu := activePieMenu
		;turn previous menu hotkeys off
		;turn new hotkey on		
	} else if (hotkeysOn == false){
		;turn activePieMenu keys off
		for k, key in ActivePieSliceHotkeyArray
		{	
			;If hotkey is in another pie menu, continue	
			if ( !hasValue(key, profileKeyArray) )
				Hotkey, % key, Off
			else
				continue						
		}
		ActivePieSliceHotkeyArray := []

		SliceHotkeyPressed := ""
		lastActivePieMenu := {}
	} else {
		; msgbox, they're the same somehow
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

getActiveMonitorDPI()
	{
	if (substr(a_osversion, 1, 2) = "10")
	{	
	;detemine what monitor the mouse is in and scale factor
	; pieDPIScale := 1
	Mon.pieDPIScale := 1
	for monIndex in monitorManager.monitors
		{
		if (pieOpenLocX >= monitorManager.monitors[monIndex].left and pieOpenLocX <= monitorManager.monitors[monIndex].right)
			{
			; msgbox, % pieOpenLocX " is apparently between " monitorManager.monitors[monIndex].left " and " monitorManager.monitors[monIndex].right
			if (pieOpenLocY >= monitorManager.monitors[monIndex].top and pieOpenLocY <= monitorManager.monitors[monIndex].bottom)
				{
				Mon.pieDPIScale := monitorManager.monitors[monIndex].scaleX					
				break			
				}
			}
		}
	}
	else
	{
		;Win7 DPI Scaling (takes value of primary monitor)
		Mon.pieDPIScale := A_ScreenDPI / 96
	}
	return Mon.pieDPIScale
	}

runPieMenu(profileNum, index, activePieNum=1)
	{
	MouseGetPos, pieOpenLocX, pieOpenLocY ;global
	subPieLocX := pieOpenLocX
	subPieLocY := pieOpenLocY

	getActiveMonitorDPI() ;set Mon.pieDPIScale
	
	;FIX: Needs to be dynamic based on graphics size.
	bitmapPadding := [300*Mon.pieDPIScale,180*Mon.pieDPIScale]
	SetUpGDIP(pieOpenLocX-bitmapPadding[1], pieOpenLocY-bitmapPadding[2], 2*bitmapPadding[1], 2*bitmapPadding[2])
	StartDrawGDIP()
	
	activePieKey := settings.appProfiles[profileNum].pieKeys[index]		
	pieHotkey := removeCharacters(activePieKey.hotkey, "!^+#")
	activePieNumber := activePieNum
	activePie := activePieKey.pieMenus[activePieNumber]	

	;Init Click related variables
	pieClicked := false
	LButtonPressed := false
	LButtonPressed_LastState := false
	LButtonPressed_static := false
	
	sliceHotkeyPressed := false


	;Determine pie menu angles for some reason, maybe delete
	; thetaOffset := 0
	thetaOffset := activePie.pieAngle
	; offsetPie := []
	; for k, pieMenu in activePieKey.pieMenus
	; {		
	; 	offsetPie.Push(pieMenu.pieAngle)
	; }


	pieRegion := 0	
	fPieRegion := 0
	pieLabelShown := false
	if (activePieKey.labelDelay = 0)	
		showLabel := true
	else
		{
		showLabel := false
		pieOpenTime := A_TickCount
		}

	activePieSubmenuMode := activePieKey.activationMode.submenuMode
	if (activePieSubmenuMode == 3)
	{
		activePieSubmenuMode := 2
		hoverToSelectActive := true
	}
	else
	{
		hoverToSelectActive := false
	}
	hoveredIntoSubMenu := false

	drawPie(activePieKey, activePie, bitmapPadding[1], bitmapPadding[2], 0, 0, activePie.pieAngle, ,showLabel , hoverToSelectActive)
	mouse := getMouseTransformProperties(true)

		Switch activePieSubmenuMode
		{
			case 1: ; Hover into submenus, release on function
				{
					loop
					{
						sliceHotkeyPressed := false
						updatePie := false
						if !GetKeyState(pieHotkey, "P")
							Break
						
						if ((A_TickCount - pieOpenTime) > activePieKey.labelDelay*1000 && (showLabel == false))
						{
							showLabel := true
							pieLabelShown := true
						}					
						
									
						if (LButtonPressed = false)
							mouse := getMouseTransformProperties()
						
							
						selectionRadius := ((activePie.radius)*Mon.pieDPIScale)						
						numSlices := activePie.functions.Length()+1

						;Set Slice Hotkeys
						; loadSliceHotkeys(activePieMenu, true)


						If (mouse.distance < selectionRadius)
						{
							pieRegion := 0
						}
						else
						{
							pieRegion := Floor(cycleRange(mouse.theta-activePie.pieAngle)/(360/(activePie.functions.Length()-1)))+1	
							If (pieRegion >= (activePie.functions.Length()+1))
								pieRegion := 1
						}

						loadSliceHotkeys(activePie, true)						
						if ( hasValue(A_ThisHotkey, ActivePieSliceHotkeyArray)){
							for k3, func in activePie.functions
							{
								if (A_ThisHotkey == func.hotkey){
									if (func.function == "submenu"){
										updatePie := true
										pieRegion := k3-1										
										; hoveredIntoSubMenu := false						
										break
									}										
									else{
										; updatePie := true
										pieRegion := k3-1	
										sliceHotkeyPressed := true									
										break				
									}
										
								}
							}
						}

						If (GetKeyState("LButton","P"))		
						{
							LButtonPressed := true
							LButtonPressed_static := true
						}
						else
							LButtonPressed := false	


						If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown == true) or (updatePie) or sliceHotkeyPressed ;If region or mouseclick changes
							{
							pieLabelShown := false

							If (( activePie.functions[pieRegion+1].function == "submenu" ) && fPieRegion == 0) or (activePie.functions[pieRegion+1].function == "submenu" && LButtonPressed) or (updatePie)
							{
								activePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1
								activePie := activePieKey.pieMenus[activePieNumber]

								sliceAngle := ((pieRegion+1)*(360/numSlices))+(180/numSlices+thetaOffset)
								; msgbox, % sliceAngle
								; extendedPos := extendAlongAngle([mouse.x, mouse.y], sliceAngle, (activePieKey.submenu.radius+activePieKey.mainMenu.radius)*Mon.pieDPIScale)

								if ( LButtonPressed or updatePie) {
									extendedPos := [mouse.x, mouse.y]
									mouse.distance := 0										
								} else {																		
									extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, (activePie.radius*0.9)*Mon.pieDPIScale)
									; msgbox, % mouse.distance
								}
								
								
								; extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, 150)
								subPieLocX := extendedPos[1]
								subPieLocY := extendedPos[2]

								StartDrawGDIP()	
								ClearDrawGDIP()
								EndDrawGDIP()
								SetUpGDIP(subPieLocX-bitmapPadding[1], subPieLocY-bitmapPadding[2], 2*bitmapPadding[1], 2*bitmapPadding[2])	
							}

							StartDrawGDIP()							

							fPieRegion := drawPie(activePieKey, activePie, bitmapPadding[1], bitmapPadding[2], mouse.distance, mouse.theta, activePie.pieAngle, LButtonPressed, showLabel, false)
							
							; if (LButtonPressed_LastState == true) && (LButtonPressed == false){
							if (LButtonPressed_LastState == true) && (LButtonPressed == false) || (GetKeyState("Esc") || (sliceHotkeyPressed)){
								if (GetKeyState("Esc")) {
									break
								}
								if (sliceHotkeyPressed == true){
									break
								}																
								runPieFunction(activePie.functions[pieRegion+1])
								}	

							
							}
						LButtonPressed_LastState := LButtonPressed
						sleep, 1											
					} ;loop end
					StartDrawGDIP()	
					ClearDrawGDIP()
					EndDrawGDIP()
					; msgbox, % JSON.Dump(mouse)
					loadSliceHotkeys(activePie, false)

					; return false
					; msgbox, % activePie.functions[pieRegion+1].label						
					return activePie.functions[pieRegion+1]	
					; return [profileNum,index,activePieNumber,pieRegion]						
				}
			case 2: ; Select first menu and hover over the next
				{					
					updatePie := false
					loop
					{

						if (hoverToSelectActive == false)
						{
							if (!GetKeyState(pieHotkey, "P"))							
								{									
									if (activePie.functions[pieRegion+1].function != "submenu")
										break
									hoverToSelectActive := true
									updatePie := true
								}
						}
						
						if ((A_TickCount - pieOpenTime) > activePieKey.labelDelay*1000 && (showLabel == false))
						{
							showLabel := true
							pieLabelShown := true
						}						
						
									
						if (LButtonPressed = false)
							mouse := getMouseTransformProperties()

						;Load Slice Hotkeys						
												
						
							
						selectionRadius := ((activePie.radius)*Mon.pieDPIScale)						
						numSlices := activePie.functions.Length()+1
						If (mouse.distance < selectionRadius)
						{
							pieRegion := 0
						}
						else
						{
							pieRegion := Floor(cycleRange(mouse.theta-activePie.pieAngle)/(360/(activePie.functions.Length()-1)))+1	
							If (pieRegion >= (activePie.functions.Length()+1))
								pieRegion := 1
						}

						;Use LSlice Hotkey
						loadSliceHotkeys(activePie, true)						
						if ( hasValue(A_ThisHotkey ,ActivePieSliceHotkeyArray)){
							for k3, func in activePie.functions
							{
								if (A_ThisHotkey == func.hotkey){
									if (func.function == "submenu"){
										updatePie := true
										pieRegion := k3-1										
										; hoveredIntoSubMenu := false						
										break
									}										
									else{
										updatePie := true
										pieRegion := k3-1	
										sliceHotkeyPressed := true									
										break				
									}
										
								}
							}
						}

						If (GetKeyState("LButton","P"))		
						{
							LButtonPressed := true
							LButtonPressed_static := true
						}
						else
							LButtonPressed := false

						if (hoverToSelectActive == true) && (pieRegion > 0) && (updatePie == false)
							{
								if activePie.functions[pieRegion+1].function != "submenu"
									break ;Launches function
								else
								{
									updatePie := true
									hoveredIntoSubMenu := true	
								}
																			
							}
			

						; If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown == true) or GetKeyState("q", "P") ;If region or mouseclick changes, redraw menu
						If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown == true) or (updatePie == true) ;If region or mouseclick changes, redraw menu
							{
							pieLabelShown := false

							If ( (activePie.functions[pieRegion+1].function == "submenu") && (fPieRegion == 0) && (hoverToSelectActive == true) or ((activePie.functions[pieRegion+1].function == "submenu") && (updatePie == true)))
							{								
								activePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1																								
								activePie := activePieKey.pieMenus[activePieNumber]
								loadSliceHotkeys(activePie, true)

								sliceAngle := ((pieRegion+1)*(360/numSlices))+(180/numSlices+thetaOffset)
								; msgbox, % sliceAngle
								; extendedPos := extendAlongAngle([mouse.x, mouse.y], sliceAngle, (activePieKey.submenu.radius+activePieKey.mainMenu.radius)*Mon.pieDPIScale)

								if (hoveredIntoSubMenu == true)
								{
									extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, (activePie.radius*0.9)*Mon.pieDPIScale)
									subPieLocX := extendedPos[1]
									subPieLocY := extendedPos[2]									
									hoveredIntoSubMenu := false
								}
								else
								{
									; msgbox, this happened
									subPieLocX := mouse.x
									subPieLocY := mouse.y																		
								}	
								StartDrawGDIP()	
								ClearDrawGDIP()
								EndDrawGDIP()
								SetUpGDIP(subPieLocX-bitmapPadding[1], subPieLocY-bitmapPadding[2], 2*bitmapPadding[1], 2*bitmapPadding[2])	
							}
							updatePie := false			

							StartDrawGDIP()								
								
							fPieRegion := drawPie(activePieKey, activePie, bitmapPadding[1], bitmapPadding[2], mouse.distance, mouse.theta, activePie.pieAngle, LButtonPressed, showLabel, hoverToSelectActive)
							
							; if (LButtonPressed_LastState == true) && (LButtonPressed == false){
							if (LButtonPressed_LastState == true) && (LButtonPressed == false) || (GetKeyState("Esc") || sliceHotkeyPressed){
								if (GetKeyState("Esc")) {									
									break
								}
								if (sliceHotkeyPressed == true){
									break
								}
								if (activePie.functions[pieRegion+1].function == "submenu" )
									updatePie := true
								else									
									runPieFunction(activePie.functions[pieRegion+1])				
								}		
							
							}						
						LButtonPressed_LastState := LButtonPressed
						sleep, 1																
					} ;Loop end
					StartDrawGDIP()	
					ClearDrawGDIP()
					EndDrawGDIP()
					; msgbox, % JSON.Dump(mouse)
					loadSliceHotkeys(activePie, false)
					
					return activePie.functions[pieRegion+1]
				}
			case 3: ; Hover over all
				{
					;This becomes case 2
				}
			case 4: ; Click all
				{
					submenuMode :=  "click all"
				}
			case 5: ; Leave and return or circle and return for more menus.  Selecting a submenu will make subsequent menus hover activated.
				{
					arm2 := false
					arm3 := false
					armPie3 := false
					armPie2 := false					

					loop
						{		
						; if !GetKeyState(pieHotkey, "P") && (runningPieKey.holdOpenOverride == 0)
						if !GetKeyState(pieHotkey, "P")
							Break
						; if (runningPieKey.holdOpenOverride == 2) && (fPieRegion > 0)
						; {
						; 	LButtonPressed_static := false
						; 	Break
						; }	
						if ((A_TickCount - pieOpenTime) > runningPieKey.labelDelay*1000 && (showLabel == false))
						{
							showLabel := true
							pieLabelShown := true			
						}


						if (LButtonPressed = false)
							mouse := getMouseTransformProperties()	

						;Calculate Distance and Angle

						;if inside circle
						menuShape := runningPieKey.menuShape.mainMenu
						If (mouse.distance <= (((menuShape.radius/2)+(menuShape.thickness/2))*Mon.pieDPIScale) or mouse.midDistance <= (((menuShape.radius/2)+(menuShape.thickness/2))*Mon.pieDPIScale))
						{
						pieRegion := 0
						}
						Else		
						{		
						pieRegion := Floor(cycleRange(mouse.theta-offsetPie[activePieNumber])/(360/activePie.functions.Length()-1))+1	
						If (pieRegion == (activePie.functions.Length()))
							pieRegion := 1
						}
						if (armPie3 != true) && (pieRegion > 0) ; If out of middle and pie 1 or 2
							{
							;Refactor Me!!
							atheta := (leftTheta - mouse.theta - 180)
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
 
						If (GetKeyState("LButton","P"))		
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
								if (runningPieKey.pieMenus[2].enable)
									armPie2 := true
								leftTheta := mouse.theta
								}
							;Check armed pie when return to circle
							if (fPieRegion > 0) && (pieRegion == 0)
								{
								if (armPie3 == true) && (runningPieKey.pieMenus[3].enable)
									activePieNumber := 3
								else if (armPie2 == true) && (runningPieKey.pieMenus[2].enable)
									activePieNumber := 2
								}				
							StartDrawGDIP()		
								
							fPieRegion := drawPie(runningPieKey, activePie, bitmapPadding[1], bitmapPadding[2], mouse.distance, theta, offsetPieAngle, LButtonPressed, showLabel)

							if (LButtonPressed_LastState == true) && (LButtonPressed == false) || (GetKeyState("Esc")){
								if (GetKeyState("Esc")) {
									break
								}
								runPieFunction(activePie.functions[pieRegion+1])								
							}
						LButtonPressed_LastState := LButtonPressed
						sleep, 5		
						} ;end pie loop

					StartDrawGDIP()	
					ClearDrawGDIP()
					EndDrawGDIP()
					if LButtonPressed_static
						{
						return false
						}		
					else
						{
						return false
						; return activePie.functions[pieRegion+1]
						}
				}
			}
			default:
				msgbox, Invalid submenu mode selected.  I never thought this error would ever pop up how did you mess this up?	
		}
	}

getMouseTransformProperties(init:=false)
	{
	static mouseX, mouseY, velocityTheta
	if (init == true)
		{
		midMouseX := subPieLocX
		midMouseY := subPieLocY			
		}
	else
		{
		midMouseX := mouseX
		midMouseY := mouseY	
		}
	MouseGetPos, mouseX, mouseY
	velocity := (Sqrt((Abs(mouseX-midMouseX)**2) + (Abs(mouseY-midMouseY)**2)))
	if velocity != 0
		velocityTheta := cycleRange(calcAngle(midMouseX, midMouseY, mouseX, mouseY)+90)
	if init == false
		{
		midMouseX := ( ( mouseX + midMouseX ) / 2)
		midMouseY := ( ( mouseY + midMouseY ) / 2)
		}	
	midDist := (Sqrt((Abs(midMouseX-subPieLocX)**2) + (Abs(midMouseY-subPieLocY)**2)))
	;Calculate Distance and Angle
	dist := (Sqrt((Abs(mouseX-subPieLocX)**2) + (Abs(mouseY-subPieLocY)**2)))
	
	theta := cycleRange(calcAngle(subPieLocX, subPieLocY, mouseX, mouseY)+90)
	returnObj := Object()	
	returnObj["x"] := mouseX
	returnObj["y"] := mouseY 
	returnObj["midX"] := midMouseX
	returnObj["midY"] := midMouseY	
	returnObj["theta"] := theta
	returnObj["midDistance"] := midDist
	returnObj["distance"] := dist
	returnObj["velocity"] := velocity
	returnObj["velocityTheta"] := velocityTheta	
	return returnObj
	}

extendAlongAngle(iPos, theta, distance)
	{		
		fPosX := Round(iPos[1]+(distance*Cos((theta-90)*0.01745329252)))		
		fPosY := Round(iPos[2]+(distance*Sin((theta-90)*0.01745329252)))
		; msgbox, % iPos[1] . " " . iPos[2] . "`n" . fPosX . " " . fPosY
		return [fPosX, fPosY]
	}


drawPie(appProfile, activePieProfile, xPos, yPos, dist, theta, thetaOffset, clicked:=false, drawLabel:=true, drawIndicator:=true)
	{	
	;init local variables
	numSlices := activePieProfile.functions.Length()-1

	radius := (activePieProfile.radius)*Mon.pieDPIScale	
	thickness := activePieProfile.thickness*Mon.pieDPIScale

	
	bgColor := activePieProfile.backgroundColor
	selectColor := activePieProfile.selectionColor



	nTheta := (Floor(cycleRange(theta-thetaOffset)/(360/numSlices))*(360/numSlices))+thetaOffset
	gmx := xPos
	gmy := yPos
	submenuMarkRadius := radius+thickness+(5*Mon.pieDPIScale)
	labelRadius := radius+thickness+activePieProfile.labelRadius*Mon.pieDPIScale
	ClearDrawGDIP()
	Gdip_SetSmoothingMode(G, 4)
	basicPen := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness)
	basicPenThin := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness/2)
	basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([0,0,0,1])) ;set last value to non-zero to see rect, issue 0 means no rect is created
	; Gdip_DrawEllipse(G, basicPen, (gmx-(radius / 2)), (gmy-(radius / 2)), radius, radius)
	
	Gdip_FillRectangle(G, basicBrush, 0,0,600*Mon.pieDPIScale,360*Mon.pieDPIScale) ;bitmapPadding copy	
	; Gdip_DrawEllipse(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness)	
	Gdip_DrawEllipse(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness)	

	If (dist <= radius)
		{
		selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness/2)
		Gdip_DrawEllipse(G, selectPen, (gmx-((radius)+ (thickness / 4))), (gmy-((radius)+ (thickness / 4))), 2*radius+(thickness/2), 2*radius+(thickness/2))
		if drawIndicator
			pieRegion := Floor(cycleRange(theta-thetaOffset)/(360/numSlices))+1	
		else
			pieRegion := 0
		}
	Else
		{
		selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness)
		Gdip_DrawArc(G, selectPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (nTheta)-90, (360/numSlices))	
		pieRegion := Floor(cycleRange(theta-thetaOffset)/(360/numSlices))+1	
		; pieRegion := nTheta/(360/numSlices)

		; If (pieRegion == (numSlices + 1))
		; 	pieRegion := 1
		}
	;Draw pie slice indicators
	
	
	
	;Draw pie labels

	if(drawLabel = true)
	{
	loop, %numSlices%
		{
		; if (activePieProfile.functions[A_Index+1].label = "" && )
		; 	continue
		labelTheta := (((A_Index-1)*(360/numSlices))+(180/numSlices+thetaOffset))
		; If ((dist <= radius) && drawIndicator && (activePieProfile.functions[A_Index+1].function == "submenu" or activePieProfile.functions[A_Index].function == "submenu") )
		; 	Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, labelTheta-(720/numSlices), 3*Mon.pieDPIScale)
		If ((dist <= radius) )
		{
			if drawIndicator
			{
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)+(180/numSlices), 3*(Mon.pieDPIScale))
			}

			if (activePieProfile.functions[A_Index+1].function == "submenu")
			{
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)+(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPenThin, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), (360/numSlices)+(2*Mon.pieDPIScale))
			}
			
		}
			
		
		if activePieProfile.functions[A_Index].function == "submenu"
		{
			;Draw subMenuIndicator
		}
		
		
		; msgbox, % labelTheta
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
		
		drawPieLabel(activePieProfile, activePieProfile.functions[A_Index+1], Round(gmx+(labelRadius*Cos((labelTheta-90)*0.01745329252))), Round(gmy+(labelRadius*Sin((labelTheta-90)*0.01745329252))), selectedLabelState, labelAnchor, clicked, activePieProfile.functions[A_Index+1].icon)
		; drawPieLabel(activePieProfile, activePieProfile.functions[A_Index+1].label, Round(gmx+(labelRadius*Cos((labelTheta-90)*0.01745329252))), Round(gmy+(labelRadius*Sin((labelTheta-90)*0.01745329252))), selectedLabelState, "center", Mon.pieDPIScale, clicked, activePieProfile.functions[A_Index+1].icon)
		}
	}
	
	EndDrawGDIP()
	return pieRegion
	}
	
drawPieLabel(activePieProfile, sliceFunction, xPos, yPos, selected:=0, anchor:="center", clicked:=false, labelIcon="")
	{
	iconSizeSquare := Ceil(settings.global.globalAppearance.iconSize*Mon.pieDPIScale)
	labelText := sliceFunction.label	
	sliceHotkey := sliceFunction.hotkey
	innerWidthPadding := Ceil(6*(((Mon.pieDPIScale-1)/2)+1))

	;Determine iconFolder
	static iconFolder
	If (iconFolder == ""){
		if(substr(settings.global.globalAppearance.pieIconFolder, 1,13) == "%A_ScriptDir%"){
			iconFolder := A_ScriptDir . substr(settings.global.globalAppearance.pieIconFolder, 14)
		} else {
			iconFolder := settings.global.globalAppearance.pieIconFolder
		}
	}
	
	labelFont := settings.global.globalAppearance.font
	fontSize := Ceil(settings.global.globalAppearance.fontSize*Mon.pieDPIScale)
	minBoxWidth := Ceil(settings.global.globalAppearance.minimumLabelWidth*Mon.pieDPIScale)	
	iconSizeSquare := Ceil(settings.global.globalAppearance.iconSize*Mon.pieDPIScale)
	strokeThickness := settings.global.globalAppearance.labelStrokeThickness*Mon.pieDPIScale
	safetyGreyColor := settings.global.globalAppearance.safetyStrokeColor
	textOptionsTest := % "x" xPos " y" yPos " Center vCenter c00FFFFFF r4 s" fontSize
	textYOffset := Ceil(1*Mon.pieDPIScale) ;For slightly off center text

	Gdip_SetSmoothingMode(G, 4)
	textHeight := Ceil(StrSplit(Gdip_TextToGraphics(G, "W", textOptionsTest, labelFont),"|")[3])


	if (sliceHotkey != ""){
		sliceHotkeyExists := true
	}else{
		sliceHotkeyExists := false
	}	
	
	;initialize element vars
	labelElements := []
	newElement := {}
	iconFile := iconFolder . "\" . labelIcon.filepath
	If (!FileExist(iconFile) || (sliceFunction.icon.filepath == ""))
		iconFile := ""
	if ( iconFile != ""){
		newElement := {type:"icon",rect:[iconSizeSquare,iconSizeSquare],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX(activePieProfile.selectionColor),hoveredColor:RGBAtoHEX([255,255,255,255]),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}
		pBitmaps := Gdip_CreateBitmapFromFile(iconFile)		
		iconFile := iconFolder . "\" . sliceFunction.icon.filepath
		labelElements.Push(newElement)
	}
	if (labelText != ""){
		labelTextWidth := Ceil(StrSplit(Gdip_TextToGraphics(G, labelText, textOptionsTest, labelFont),"|")[3])		
		newElement := {type:"labelText",rect:[labelTextWidth,textHeight],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX([255,255,255,255]),hoveredColor:RGBAtoHEX([255,255,255,255]),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}	
		labelElements.Push(newElement)
	}
	if (sliceHotkey != ""){
		sliceHotkeyWidth := Ceil(StrSplit(Gdip_TextToGraphics(G, sliceHotkey, textOptionsTest, labelFont),"|")[3])		
		newElement := {type:"hotkeyText",rect:[sliceHotkeyWidth,textHeight],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX([255,255,255,126]),hoveredColor:RGBAtoHEX([255,255,255,126]),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}			
		labelElements.Push(newElement)
	}

	if (labelElements.Length() == 0)
		return

	;get padding values, left align all and add in succession
	;Determine Content Rect
	
	
	contentRect := [0,0]
	for elementIndex, element in labelElements {		
		if (A_Index == labelElements.Length())
			padding := 0
		else
			padding := element.padding[1]				
		contentRect := [contentRect[1]+(element.rect[1])+padding, iconSizeSquare]	
	}

	pad := [Ceil(6*(((Mon.pieDPIScale-1)/2)+1)), Ceil(6*(((Mon.pieDPIScale-1)/2)+1))]

	; msgbox, % textOptionsTest

	Gdip_SetSmoothingMode(G, 4)
	; iconTextOffset := 0
	; iconContentWidth := 0

	;Determine Icon Folder:
	

	

	if (selected == 1){
		if (clicked == true){
			;clicked color
			strokeColor := RGBAtoHEX(activePieProfile.selectionColor)
			labelBGColor := RGBAtoHEX(activePieProfile.selectionColor)
			textColor := RGBAtoHEX(activePieProfile.backgroundColor)	
			sliceHotkeyTextColor := RGBAtoHEX(activePieProfile.backgroundColor)				
			
		} else {
			strokeColor := RGBAtoHEX(safetyGreyColor)
			labelBGColor := RGBAtoHEX(whitenRGB(activePieProfile.backgroundColor))
			textColor := RGBAtoHEX([255, 255, 255, 255])
			sliceHotkeyTextColor := RGBAtoHEX([255, 255, 255, 128])	
			;hover color
		}
	}else{
		strokeColor := RGBAtoHEX(safetyGreyColor)
		labelBGColor := RGBAtoHEX(activePieProfile.backgroundColor)
		textColor := RGBAtoHEX([255, 255, 255, 255])
		sliceHotkeyTextColor := RGBAtoHEX([255, 255, 255, 128])
		;resting color
	}
	
	
	outerRectSize := [Max(contentRect[1]+(2*pad[1]), minBoxWidth, contentRect[2]+(2*pad[2])), contentRect[2]+(2*pad[2])]	

	
	rectCenter := [xPos,yPos]	;if anchor is none of these, leave as center
	If (anchor == "left"){		
		rectCenter := [xPos+(outerRectSize[1]/2)-(outerRectSize[2]/2), yPos]	
	}			
	If (anchor == "right"){		
		rectCenter := [xPos-(outerRectSize[1]/2)+(outerRectSize[2]/2), yPos]		
	}
		
	
	basicPen := Gdip_CreatePen(strokeColor, strokeThickness)
	otherPen := Gdip_CreatePen("0xFFff0000" , strokeThickness)
	basicBrush := Gdip_BrushCreateSolid(labelBGColor)
	Gdip_FillRoundedRectangle(G, basicBrush, rectCenter[1]-(outerRectSize[1]/2), rectCenter[2]-(outerRectSize[2]/2), outerRectSize[1], outerRectSize[2], 3)
	Gdip_DrawRoundedRectangle(G, basicPen, rectCenter[1]-(outerRectSize[1]/2), rectCenter[2]-(outerRectSize[2]/2), outerRectSize[1], outerRectSize[2], 3)
	; basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([255,0,0,255])) ;Draw rectcenter locations
	; Gdip_FillRoundedRectangle(G, basicBrush, xPos,yPos, 2, 2, 0)


	elementPlacementPos := [rectCenter[1]-(contentRect[1]/2), rectCenter[2]]
	for elementIndex, element in labelElements {
		if (element.type == "icon"){
			iconPosition := [rectCenter[1]-(contentRect[1]/2)+(iconSizeSquare/2), rectCenter[2]]
			if (sliceFunction.icon.WBOnly == true)
				{
				colW := activePieProfile.selectionColor
				; colB := safetyGreyColor
				If (selected = 1)
					imageMatrix := "1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|1|0|1|1|1|0|1"
				Else
					imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
				}
			Else
				imageMatrix := 1
			Gdip_DrawImage(G, pBitmaps, (iconPosition[1]-(iconSizeSquare/2)), (iconPosition[2]-(iconSizeSquare/2)), iconSizeSquare, iconSizeSquare,,,,,imageMatrix)
			;add and draw icon
			; elementPlacementPos := [elementPlacementPos[1]+iconSizeSquare+element.padding[1],elementPlacementPos[2]]
			elementPlacementPos := [elementPlacementPos[1]+element.rect[1]+element.padding[1],elementPlacementPos[2]]
			;set new place pos
		}
		if (element.type == "labelText"){
			; msgbox, % rectCenter[1]	
			textOptions := % "x" (elementPlacementPos[1]+(element.rect[1]/2)) " y" (rectCenter[2]-(element.rect[2]/2)+textYOffset) " Center vCenter c" SubStr(textColor,3) " r4 s" fontSize
			; textOptions := % "x" (rectCenter[1]) " y" (rectCenter[2]) " Center vCenter c" SubStr(textColor,3) " r4 s" fontSize
			;add and draw text
			Gdip_TextToGraphics(G, labelText, textOptions, labelFont)
			;set new place pos
		}
		if (element.type == "hotkeyText"){
			sliceHotkeyTextOptions := % "x" (rectCenter[1]+(contentRect[1]/2)-(element.rect[1]/2)) " y" (rectCenter[2]-(element.rect[2]/2)+textYOffset) " Center vCenter c" SubStr(sliceHotkeyTextColor,3) " r4 s" fontSize
			Gdip_TextToGraphics(G, sliceHotkey, sliceHotkeyTextOptions, labelFont)
			;add and draw text
			;set new place pos
		}
	}	
	return
}
	



Class pieEnableKey{
	modToggle(){
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieKeys
				Hotkey, % settings.appProfiles[1].pieKeys[menus].hotkey, Toggle
			return
			}
		Else
			{
			global activeProfile := getActiveProfile()
			
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieKeys
			{				
				Hotkey, % settings.appProfiles[activeProfile[2]].pieKeys[menus].hotkey, Toggle
			}
				
			return
			}
		}
	modOn(){
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieKeys
				Hotkey, % settings.appProfiles[1].pieKeys[menus].hotkey, On
			return
			}
		Else
			{
			global activeProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			; msgbox,  % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieKeys
				Hotkey, % settings.appProfiles[activeProfile[2]].pieKeys[menus].hotkey, On
			return
			}
		}
	modOff(){
		If (!WinActive("ahk_group regApps"))
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for menus in settings.appProfiles[1].pieKeys
				{
				If (settings.appProfiles[1].pieKeys[menus].hotkey != activePieKey)
					Hotkey, % settings.appProfiles[1].pieKeys[menus].hotkey, Off
				}				
			return
			}
		Else
			{
			; global activveProfile := getActiveProfile()
			Hotkey, IfWinActive, % activeProfile[1]
			for menus in settings.appProfiles[activeProfile[2]].pieKeys
				{
				If (settings.appProfiles[activeProfile[2]].pieKeys[menus].hotkey != activePieKey)
					Hotkey, % settings.appProfiles[activeProfile[2]].pieKeys[menus].hotkey, Off
				}				
			return			
			}
		}	
	}
runPieFunction(functionObj)
	{
	if(functionObj = false)
		return
	static lastPieFunctionRanTickCount := 0
	static lastPieFunctionRan = ""
	

	; selectedRegion := settings.appProfiles[functionObj[1]].pieKeys[functionObj[2]].pieMenus[functionObj[3]].functions[functionObj[4]+1]	
	; if functionObj.returnMousePos = 1
	; 	{
	; 	BlockInput, Mouse
	; 	MouseMove, functionObj[5], functionObj[6], 0		
	; 	}
	if (functionObj.function = "repeatLastFunction")
		{
		;Determine timeOut 0 := Infinite or >0 := value
		repeatTimeOut := false	
		If (functionObj.params.timeout > 0)
			{
			if ((lastPieFunctionRanTickCount + (functionObj.params.timeout*1000)) > A_TickCount)
				repeatTimeOut := true		
			}
		else
			repeatTimeOut := true

		if (lastPieFunctionRan != "") && repeatTimeOut
			functionObj := lastPieFunctionRan
		else
			return
		}
	else
		{
		lastPieFunctionRan := functionObj	
		}

	pieFuncToRun := "pie_" . functionObj.function	
	pieFuncParamsArray := functionObj.params
	%pieFuncToRun%(pieFuncParamsArray)

	lastPieFunctionRanTickCount := A_TickCount
	
	; if functionObj.returnMousePos = 1
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
		for ahkHandleIndex, ahkHandle in profile.ahkHandles
			{
			testAHKHandle := StrSplit(ahkHandle, " ", ,2)[2]
			if (testAHKHandle == activeWinProc) || (testAHKHandle == activeWinClass)
				{
				return [ahkHandle, profiles]
				}				
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

blockBareKeys(hotkeyInput, hotkeyArray, blockState=true){
	; for key in hotkeyArray
	; 	msgbox, % hotkeyArray[key]	
	; if (hotkeyInput == "")
	; 	return
	if hotkeyArray[1] = ""
		return
	bareKey := removeCharacters(hotkeyInput, "+^!#")


	If (hasValue(bareKey, hotkeyArray) && hasValue("+" + bareKey, hotkeyArray)){
		; msgbox, both
		return
	}
	If (bareKey == hotkeyInput)
		return
	If (blockState == true) ; fix this
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

logTime(start=True){
	static timeArray := []
	if (start == True){
	}
}

showArray(arr){
	showArrString := ""
	for k, val in arr
	{
		showArrString := showArrString + ", " + val
	}
	msgbox, % showArrString
	return
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
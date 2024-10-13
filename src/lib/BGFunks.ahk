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
	If (AHKVersion < 113310) 
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

loadSettingsFile(){
	FileEncoding, UTF-8
	Try{
		;Try loading from local directory
			UserDataFolder := A_ScriptDir . "\"			
			loopFileFound := false
			Loop, Files, %A_ScriptDir%\*.json, F
			{				
				settingsFilePath := A_LoopFileFullPath
				FileRead, Settings, %settingsFilePath%	
				
				Settings := Json.Load(Settings)
				If (ErrorLevel)					
					break
				loopFileFound := true				
				break
			}
			if (loopFileFound){
				; msgbox json found in scriptdir`ntherefore standalone=true
				IsStandalone := true
				return
			} else {
				; msgbox no json found in scriptdir`, so checking appdata
				;Try opening from User AppData folder
				settingsFileName := "AHPSettings.json"
				UserDataFolder := A_AppData . "\AutoHotPie"
				settingsFilePath := UserDataFolder . "\" . settingsFileName	
				if ( FileExist(settingsFilePath) ){
					; msgbox json found in appdata`n%settingsFilePath%
					FileRead, Settings, %settingsFilePath%					
					Settings := Json.Load(Settings)							
				} else {
					; msgbox no json found in appdata
					;Try to open AHP Settings
					AHPSettingsOpened := pie_openSettings()
					if (AHPSettingsOpened == false){
						Msgbox, % "No valid settings file found.`n`nPlace a valid settings file here and relaunch to load manually:`n" . UserDataFolder . "`n`nFolder will be opened when this message box is closed."
						if !(FileExist(UserDataFolder))
							FileCreateDir, %UserDataFolder%
						Run, %UserDataFolder%
						exitapp
					}
				}				
			}
		SetWorkingDir, %UserDataFolder%		
		;Try loading from AppData Folder
		
	} catch e {
		msgbox, % "Settings file is invalid JSON.`n`nNo Pie Menus for you :(`n`nFix settings file at:`n" . settingsFilePath
		pie_openSettings()
		Exitapp	
	}
}

verifyFont(){
	labelFont := Settings.global.globalAppearance.font
	; labelFont := "Fake non real font name"
	fontSize := Settings.global.globalAppearance.fontSize
	StartDrawGDIP()
	testFontDraw := Ceil(StrSplit(Gdip_TextToGraphics(G, "Test", "x20 y20 Center vCenter c00FFFFFF r4 s" . fontSize, labelFont),"|")[3])
	reloadCountFile := A_WorkingDir . "\reloadCount.txt"
	if (testFontDraw == 0){
		print("Font not found.  Reloading...")
		; Define the path to the file in the working directory
		
		; Read the current reload count from the file
		FileRead, reloadCount, %reloadCountFile%
		; If the file doesn't exist or is empty, initialize the count to 0
		if (ErrorLevel || reloadCount == "")
			reloadCount := 0
		; Increment the reload count
		if (reloadCount > 3){
			print("Font not found after 3 attempts.  Using Arial.")
			Settings.global.globalAppearance.font := "Arial"
			Settings.global.globalAppearance.fontSize := 12
			FileDelete, %reloadCountFile%
		} else {
			reloadCount++
			; Write the new count back to the file
			FileDelete, %reloadCountFile%
			FileAppend, %reloadCount%, %reloadCountFile%
			sleep, 500
			Reload
		}
	} else {
		; Font found, remove the reload count file if it exists.
		FileDelete, %reloadCountFile%
	}	
	Gdip_SetCompositingMode(G, 1) ;idk if this matters but it looked p nice for images
	ClearDrawGDIP()
	EndDrawGDIP()
}



loadPieMenus(){
	;Copy global profiles to other profiles
	for k, pieKey in Settings.appProfiles[1].pieKeys
	{
		if (pieKey.globalMenu == true)
		{
			for k2, profile in Settings.appProfiles
			{
				if (k2 == 1)
					continue
				profile.pieKeys.Push(pieKey)
			}
		}
	}	

	
	;Load app settings to hotkeys
    appProfiles := Settings.appProfiles    

    for k, profile in appProfiles {	
		profile.pieEnableKey.enableState := false	;add enableState key to every profile.  Only for visual.
	}

	;// first, turn on the hotkeys for the custom contexts (if any), so that they have highest precendence
	;// (from AHK help, Hotkey command:
	;// "If more than one variant of a hotkey is eligible to fire, only the one created earliest will fire.")
	for k, profile in appProfiles {
		if (profile.enable == false)
			continue
		;// we require the json ahkHandles setting to be a simple string that ends in 'Func' (such as 'myFunc')
		;// if we find that, then AHP will check for the success of that Func to determine if the context is applied
		if (SubStr(profile.ahkHandles[1], -3) = "Func")     ;custom context
		{
			; msgbox % "custom context func for profile #" k "`nfunc=" profile.ahkHandles[1]
			fn := Func(profile.ahkHandles[1])
			; %fn%()
			if IsFunc(fn)
				Hotkey, If, % fn
			else
			{
				MsgBox, % "Custom context function '" profile.ahkHandles[1] "' is not found.`n`nProfile '" profile.name "' will be disabled."
				profile.enable := false
			}

			;// all this pieKeys code was copied as written below
			for k, pieKey in profile.pieKeys			
				{
				if (pieKey.enable == false)
					continue							
				Hotkey, % pieKey.hotkey, pieLabel
				If (profile.pieEnableKey.useEnableKey == true) && (profile.pieEnableKey.toggle == false)
					{ ;initialize off if modkey active no toggle				
					Try Hotkey, % pieKey.hotkey, Off
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

    ;// second, turn on the hotkeys for the default profile, and for the app-specific profiles
	for k, profile in appProfiles {	
		if (profile.enable == false)
			continue
		if (SubStr(profile.ahkHandles[1], -3) = "Func") ;already handled above
			continue
		else if (profile.ahkHandles[1] == "ahk_group regApps")    ;default context
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
					Try Hotkey, % pieKey.hotkey, Off
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
		else                                                ;app specific context
		{
		for ahkHandleIndex, ahkHandle in profile.ahkHandles
			{
				; profile.ahkHandles[ahkHandleIndex] := "ahk_exe " . ahkHandle ;Append the ahk_exe tag to all profiles
				profile.ahkHandles[ahkHandleIndex] := appendAHKTag(ahkHandle) ;Append the ahk_exe tag to all profiles
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
						Try Hotkey, % pieKey.hotkey, Off
						}
					}			
				If (profile.pieEnableKey.useEnableKey == true)
					{
					If (profile.pieEnableKey.toggle == true)
						{
							Try Hotkey, % profile.pieEnableKey.enableKey, togglePieLabel				
						}
					else
						{
						Try Hotkey, % profile.pieEnableKey.enableKey, onPieLabel
						upHotkey := profile.pieEnableKey.enableKey " up"
						Try Hotkey, % upHotkey, offPieLabel
						}
					}
			}			          
        }
					
	}
}

loadSliceHotkeys(activePieMenu, hotkeysOn){
	global SliceHotkeyPressed		
	profileKeyArray := []
	for k2, pieKey in ActiveProfile.pieKeys{
		profileKeyArray.Push(pieKey.hotkey)
	}	
	; global ActivePieSliceHotkeyArray
	static lastActivePieMenu	
	if (lastActivePieMenu != activePieMenu){
		for k, key in ActivePieSliceHotkeyArray
		{
			;If hotkey is in another pie menu, continue			
			if ( !hasValue(key, profileKeyArray) )
				Try Hotkey, % key, Off ;This has Issues!!!!
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

		; SliceHotkeyPressed := ""
		SliceHotkeyPressed := false
		lastActivePieMenu := {}
	} else {
		; msgbox, they're the same somehow
	}
		
}

Class UserPieFunctions {
	load(){		
		fileChanged := false
		;Determine if custom functions changed
		;Check if file text and JSON string are equivalent.

		if (changed){
			this.createFile()			
			Reload ;Restart
		} else {
			return
		}

	}
	createFile(){
		;Load from settings OBJ functionconfig
		;replace the UserPieFunctions.ahk file with JSON text.			

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


EmptyMem(){
    pid:= DllCall("GetCurrentProcessId")
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
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

getActiveMonitorDPI(position=false){
	if (position == false){
		posX := PieOpenLocX	
		posY := PieOpenLocY	
	} else {
		posX := position[1]	
		posY := position[2]		
	}
	
	if (substr(a_osversion, 1, 2) = "10")
	{	
	;detemine what monitor the mouse is in and scale factor
	; pieDPIScale := 1
	Mon.pieDPIScale := 1
	for monIndex in monitorManager.monitors
		{
		if (posX >= monitorManager.monitors[monIndex].left and posX <= monitorManager.monitors[monIndex].right)
			{
			; msgbox, % PieOpenLocX " is apparently between " monitorManager.monitors[monIndex].left " and " monitorManager.monitors[monIndex].right
			if (posY >= monitorManager.monitors[monIndex].top and posY <= monitorManager.monitors[monIndex].bottom)
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
getActiveMonitorDimensions()
	{
	if (substr(a_osversion, 1, 2) = "10")
	{	
	;detemine what monitor the mouse is in and scale factor
	; pieDPIScale := 1
	
	MouseGetPos, mouseX, mouseY
	getActiveMonitorDPI([mouseX, mouseY])
	bottomRight := [A_ScreenWidth,A_ScreenHeight]
	for monIndex in monitorManager.monitors
		{
		if (mouseX >= monitorManager.monitors[monIndex].left and mouseX <= monitorManager.monitors[monIndex].right)
			{			
			; msgbox, % PieOpenLocX " is apparently between " monitorManager.monitors[monIndex].left " and " monitorManager.monitors[monIndex].right
			if (mouseY >= monitorManager.monitors[monIndex].top and mouseY <= monitorManager.monitors[monIndex].bottom)
				{
				monitorDimensions := [monitorManager.monitors[monIndex].left, monitorManager.monitors[monIndex].right, monitorManager.monitors[monIndex].top, monitorManager.monitors[monIndex].bottom]
				; bottomRight := [monitorManager.monitors[monIndex].right,monitorManager.monitors[monIndex].bottom]				
				break			
				}
			}
		}
	}
	; return bottomRight
	return monitorDimensions
	}


runPieMenu(p_activeProfile, index, activePieNum=1)
	{
	activePieKey := p_activeProfile.pieKeys[index]

	PieOpenLocX := 0
	PieOpenLocY := 0
	SubPieLocX := 0
	SubPieLocY := 0
	if (activePieKey.activationmode.openMenuInCenter){
		p3_dimensions := mouseToCenterScreen(!activePieKey.activationMode.decoupleMouse)
		PieOpenLocX := p3_dimensions[1]
		PieOpenLocY := p3_dimensions[2]
		SubPieLocX := p3_dimensions[1]
		SubPieLocY := p3_dimensions[2]
	} else {
		MouseGetPos, PieOpenLocX, PieOpenLocY ;global	
		SubPieLocX := PieOpenLocX
		SubPieLocY := PieOpenLocY
	}

	pieHotkey := removeCharacters(activePieKey.hotkey, "!^+#")
	ActivePieNumber := activePieNum
	activePie := activePieKey.pieMenus[ActivePieNumber]	

	getActiveMonitorDPI() ;set Mon.pieDPIScale	

	getBitmapPadding(activePie)
	
	SetUpGDIP(PieOpenLocX-BitmapPadding[1], PieOpenLocY-BitmapPadding[2], 2*BitmapPadding[1], 2*BitmapPadding[2])
	StartDrawGDIP()

	;Init Click related variables
	; pieClicked := false ;This is not used anywhere

	LButtonPressed := false
	LButtonPressed_LastState := false
	LButtonPressed_static := false
	pieFunctionClicked := false ;Has a pie function been clicked on
	pieKeyReleased := false
	pieKeyAction := activePieKey.activationMode.pieKeyAction
	
		
	sliceHotkeyPressed := false
	PieMenuRanWithMod := true

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
	
	drawPie(activePieKey, activePie, BitmapPadding[1], BitmapPadding[2], 0, 0, activePie.pieAngle, ,showLabel , hoverToSelectActive)
	
	mouse := getMouseTransformProperties(true, activePieKey.activationMode.decoupleMouse)

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
						
									
						if (LButtonPressed == false)
							mouse := getMouseTransformProperties(false, activePieKey.activationMode.decoupleMouse)						
							
						selectionRadius := ((activePie.radius)*Mon.pieDPIScale)						
						numSlices := activePie.functions.Length()+1

						;Set Slice Hotkeys
						; loadSliceHotkeys(activePieMenu, true)

						;Escape radius
						If (activePieKey.activationMode.escapeRadius.enable && (mouse.distance > activePieKey.activationMode.escapeRadius.radius)) || (Settings.global.enableEscapeKeyMenuCancel && GetKeyState("Esc", "P")) 
						{														
							exitPieMenu(activePie)							
							loop ;Wait for hotkey to be released
							{
								if !GetKeyState(pieHotkey, "P")
									Break
							}							
							return false						
						}								


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

						If (A_Index == 1)
							loadSliceHotkeys(activePie, true)	;doesn't this only need to happen once?  TEST

						if ( hasValue(PressedSliceHotkeyName, ActivePieSliceHotkeyArray)){	
							; showArray(ActivePieSliceHotkeyArray)
							for k3, func in activePie.functions
							{								
								if (PressedSliceHotkeyName == func.hotkey){
									PressedSliceHotkeyName := ""
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
										; break		
										break, 2			
									}
										
								}
							}
						}
						PressedSliceHotkeyName := ""

						If ((GetKeyState("LButton","P") && activePieKey.activationMode.clickableFunctions))		
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
								loadSliceHotkeys(activePie, false)
								ActivePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1
								activePie := activePieKey.pieMenus[ActivePieNumber]
								getBitmapPadding(activePie)
								loadSliceHotkeys(activePie, true)

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
								SubPieLocX := extendedPos[1]
								SubPieLocY := extendedPos[2]

								StartDrawGDIP()	
								ClearDrawGDIP()
								EndDrawGDIP()
								SetUpGDIP(SubPieLocX-BitmapPadding[1], SubPieLocY-BitmapPadding[2], 2*BitmapPadding[1], 2*BitmapPadding[2])	
							}

							StartDrawGDIP()							

							fPieRegion := drawPie(activePieKey, activePie, BitmapPadding[1], BitmapPadding[2], mouse.distance, mouse.theta, activePie.pieAngle, LButtonPressed, showLabel, false)
							
							; if (LButtonPressed_LastState == true) && (LButtonPressed == false){
							if ((LButtonPressed_LastState == true) && (LButtonPressed == false)) || (sliceHotkeyPressed){
								if (sliceHotkeyPressed == true){
									break
								}
								pieFunctionClicked := true															
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
					
					if pieFunctionClicked
						return false
					else										
						return activePie.functions[pieRegion+1]						
				}
			case 2: ; Select first menu and hover over the next
				{					
					updatePie := false
					loop
					{						

						if (hoverToSelectActive == false)
						{
							if (!GetKeyState(pieHotkey, "P")) ;May have to remove modifier flags.						
								{									
									if (activePie.functions[pieRegion+1].function != "submenu")
										break
									hoverToSelectActive := true
									updatePie := true									
								}
						} else {							
							if (!GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P")){
								pieKeyReleased := true
							}
							; if (fPieRegion == 0) ;This kind of fixed the menus but something else is making it continuously refresh
							; {								
							; 	updatePie := true
							; }								
						}						
						
						
						if ((A_TickCount - pieOpenTime) > activePieKey.labelDelay*1000 && (showLabel == false))
						{
							showLabel := true
							pieLabelShown := true
						}				
						
									
						if (LButtonPressed == false)
							mouse := getMouseTransformProperties(false, activePieKey.activationMode.decoupleMouse)
						;Load Slice Hotkeys						
						
						;Escape Radius cancel, ESC or pieKey exit
						If (activePieKey.activationMode.escapeRadius.enable && (mouse.distance > activePieKey.activationMode.escapeRadius.radius)) || (Settings.global.enableEscapeKeyMenuCancel && GetKeyState("Esc", "P")) || (pieKeyAction == "Exit Menu" && GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P") && hoverToSelectActive && pieKeyReleased) 
						{							
							exitPieMenu(activePie)					
							loop ;Wait for hotkey to be released
							{
								If !GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P")
									Break
							}			
							return false						
						}
						
							
						selectionRadius := ((activePie.radius)*Mon.pieDPIScale)						
						numSlices := activePie.functions.Length()+1
						If (mouse.distance < selectionRadius) && (!hoverToSelectActive)
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
						If (A_Index == 1)
							loadSliceHotkeys(activePie, true) ;TEST
						
						
						
						if ( hasValue(PressedSliceHotkeyName, ActivePieSliceHotkeyArray)){
							for k3, func in activePie.functions
							{								
								if (PressedSliceHotkeyName == func.hotkey){
									PressedSliceHotkeyName := ""
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
										break, 2			
									}									
									
								}
							}
						}
						PressedSliceHotkeyName := ""
						

						If ((GetKeyState("LButton","P") && activePieKey.activationMode.clickableFunctions) || (pieKeyAction == "Select" && GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P") && hoverToSelectActive && pieKeyReleased))
						{
							LButtonPressed := true
							LButtonPressed_static := true
						}
						else
							LButtonPressed := false
						
						 

						; if (hoverToSelectActive == true) && (pieRegion > 0) && (updatePie == false)
						if (hoverToSelectActive == true) && (mouse.distance > selectionRadius) && (updatePie == false)
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
						; msgbox, % "pieRegion=" pieRegion . "`nfPieRegion= " . fPieRegion

						If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown == true) or (updatePie == true) ;If region or mouseclick changes, redraw menu
							{								
							pieLabelShown := false	
							; msgbox, % "pieRegion=" pieRegion . "`nfPieRegion= " . fPieRegion . "`nButtons= " . (LButtonPressed_LastState != LButtonPressed) . "`npieLabelShown=" . pieLabelShown . "`nupdatePie=" . updatePie
							
							If ( (activePie.functions[pieRegion+1].function == "submenu") && (mouse.distance > selectionRadius) && (hoverToSelectActive == true)) or ((activePie.functions[pieRegion+1].function == "submenu") && (updatePie == true))
							{								
								loadSliceHotkeys(activePie, false)		
								ActivePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1
								; msgbox, % ActivePieNumber . "`nupdatePie= " . updatePie																						
								activePie := activePieKey.pieMenus[ActivePieNumber]
								getBitmapPadding(activePie)
								loadSliceHotkeys(activePie, true)

								sliceAngle := ((pieRegion+1)*(360/numSlices))+(180/numSlices+thetaOffset)
								; msgbox, % sliceAngle
								; extendedPos := extendAlongAngle([mouse.x, mouse.y], sliceAngle, (activePieKey.submenu.radius+activePieKey.mainMenu.radius)*Mon.pieDPIScale)

								if (hoveredIntoSubMenu == true)
								{									
									extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, (activePie.radius*0.9)*Mon.pieDPIScale)
									SubPieLocX := extendedPos[1]
									SubPieLocY := extendedPos[2]									
									hoveredIntoSubMenu := false
								}
								else
								{									
									; msgbox, this happened
									SubPieLocX := mouse.x
									SubPieLocY := mouse.y																		
								}	
								StartDrawGDIP()	
								ClearDrawGDIP()
								EndDrawGDIP()
								SetUpGDIP(SubPieLocX-BitmapPadding[1], SubPieLocY-BitmapPadding[2], 2*BitmapPadding[1], 2*BitmapPadding[2])	
							}							
							updatePie := false	;oh this is actually useful							

							StartDrawGDIP()
							pieRegion := fPieRegion	
							fPieRegion := drawPie(activePieKey, activePie, BitmapPadding[1], BitmapPadding[2], mouse.distance, mouse.theta, activePie.pieAngle, LButtonPressed, showLabel, hoverToSelectActive)
							
							; if (LButtonPressed_LastState == true) && (LButtonPressed == false){
							if (LButtonPressed_LastState == true) && (LButtonPressed == false) || (sliceHotkeyPressed){
								if (sliceHotkeyPressed == true){									
									break
								}
								if (activePie.functions[pieRegion+1].function == "submenu" )
									updatePie := true
								else
								{
									pieFunctionClicked := true
									runPieFunction(activePie.functions[pieRegion+1])									
								}	
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
					
					if pieFunctionClicked
						return false
					else										
						return activePie.functions[pieRegion+1]	
				}
			case 3: ; Hover over all
				{
					;This becomes case 2
				}
			case 4: ; Click all
				{
					loop
					{
						sliceHotkeyPressed := false
						updatePie := false						
						 
						if !GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P")
							pieKeyReleased := true
						
						if ((A_TickCount - pieOpenTime) > activePieKey.labelDelay*1000 && (showLabel == false))
						{
							showLabel := true
							pieLabelShown := true
						}					
						
									
						if (LButtonPressed == false)
							mouse := getMouseTransformProperties(false, activePieKey.activationMode.decoupleMouse)

						;Escape Radius cancel, ESC or pieKey exit
						If (activePieKey.activationMode.escapeRadius.enable && (mouse.distance > activePieKey.activationMode.escapeRadius.radius)) || (Settings.global.enableEscapeKeyMenuCancel && GetKeyState("Esc", "P")) || (pieKeyAction == "Exit Menu" && GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P") && pieKeyReleased) 
						{
							
							exitPieMenu(activePie)							
							loop ;Wait for hotkey to be released
							{
								If !GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P")
									Break
							}							
							return false						
						}					
						
							;Just restarts menu considering pie key is held down.							
							
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
						if ( hasValue(PressedSliceHotkeyName, ActivePieSliceHotkeyArray)){
							for k3, func in activePie.functions
							{
								if (PressedSliceHotkeyName == func.hotkey){	
									PressedSliceHotkeyName := ""																
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
						PressedSliceHotkeyName := ""

						If (GetKeyState("LButton","P") || (pieKeyAction == "Select" && GetKeyState(removeCharacters(pieHotkey, "+^!#"), "P") && pieKeyReleased))
						{
							LButtonPressed := true
							LButtonPressed_static := true
						}
						else
							LButtonPressed := false	


						If (pieRegion != fPieRegion) or (LButtonPressed_LastState != LButtonPressed) or (pieLabelShown == true) or (updatePie) or sliceHotkeyPressed ;If region or mouseclick changes
							{
							pieLabelShown := false
						

							; If (( activePie.functions[pieRegion+1].function == "submenu" ) && fPieRegion == 0) or (activePie.functions[pieRegion+1].function == "submenu" && LButtonPressed) or (updatePie)
							; If (activePie.functions[pieRegion+1].function == "submenu" && LButtonPressed) or (updatePie)
							; If (updatePie) or ((LButtonPressed_LastState == true) && (LButtonPressed == false))
							If (updatePie)
							{								
								ActivePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1
								activePie := activePieKey.pieMenus[ActivePieNumber]
								getBitmapPadding(activePie)

								sliceAngle := ((pieRegion+1)*(360/numSlices))+(180/numSlices+thetaOffset)
								; msgbox, % sliceAngle
								; extendedPos := extendAlongAngle([mouse.x, mouse.y], sliceAngle, (activePieKey.submenu.radius+activePieKey.mainMenu.radius)*Mon.pieDPIScale)

								extendedPos := [mouse.x, mouse.y]
								mouse.distance := 0

								; if (updatePie && LButtonPressed == false) {
								; 	extendedPos := [mouse.x, mouse.y]
								; 	mouse.distance := 0										
								; } else {																		
								; 	extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, (activePie.radius*0.9)*Mon.pieDPIScale)
								; 	; msgbox, % mouse.distance
								; }

								; extendedPos := extendAlongAngle([mouse.x, mouse.y], mouse.theta, 150)
								SubPieLocX := extendedPos[1]
								SubPieLocY := extendedPos[2]								

								StartDrawGDIP()
								ClearDrawGDIP()
								EndDrawGDIP()								
								SetUpGDIP(SubPieLocX-BitmapPadding[1], SubPieLocY-BitmapPadding[2], 2*BitmapPadding[1], 2*BitmapPadding[2])
							}													

							StartDrawGDIP()		

							fPieRegion := drawPie(activePieKey, activePie, BitmapPadding[1], BitmapPadding[2], mouse.distance, mouse.theta, activePie.pieAngle, LButtonPressed, showLabel, false)
							
							; if (LButtonPressed_LastState == true) && (LButtonPressed == false){
							if ((LButtonPressed_LastState == true) && (LButtonPressed == false)) || (sliceHotkeyPressed){
								if (sliceHotkeyPressed == true){									
									break
								}
								if (activePie.functions[pieRegion+1].function == "submenu")
								{									
									ActivePieNumber := activePie.functions[pieRegion+1].params.pieMenuNumber+1
									activePie := activePieKey.pieMenus[ActivePieNumber]
									getBitmapPadding(activePie)
									

									extendedPos := [mouse.x, mouse.y]
									mouse.distance := 0
									SubPieLocX := extendedPos[1]
									SubPieLocY := extendedPos[2]
									mouse := getMouseTransformProperties(false, activePieKey.activationMode.decoupleMouse)
									SetUpGDIP(SubPieLocX-BitmapPadding[1], SubPieLocY-BitmapPadding[2], 2*BitmapPadding[1], 2*BitmapPadding[2])									
								} else {
									break									
								}
								; runPieFunction(activePie.functions[pieRegion+1])
								; 	break
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
					; if (pieFunctionClicked)
					; {
					; 	msgbox, why
					; 	return false
					; }	
					; else
					; {
						return activePie.functions[pieRegion+1]	
					; }										
						
					; return [profileNum,index,ActivePieNumber,pieRegion]						
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
							mouse := getMouseTransformProperties(false, activePieKey.activationMode.decoupleMouse)

						;Calculate Distance and Angle

						;if inside circle
						menuShape := runningPieKey.menuShape.mainMenu
						If (mouse.distance <= (((menuShape.radius/2)+(menuShape.thickness/2))*Mon.pieDPIScale) or mouse.midDistance <= (((menuShape.radius/2)+(menuShape.thickness/2))*Mon.pieDPIScale))
						{
						pieRegion := 0
						}
						Else		
						{		
						pieRegion := Floor(cycleRange(mouse.theta-offsetPie[ActivePieNumber])/(360/activePie.functions.Length()-1))+1	
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
									ActivePieNumber := 3
								else if (armPie2 == true) && (runningPieKey.pieMenus[2].enable)
									ActivePieNumber := 2
								}				
							StartDrawGDIP()		
								
							fPieRegion := drawPie(runningPieKey, activePie, BitmapPadding[1], BitmapPadding[2], mouse.distance, theta, offsetPieAngle, LButtonPressed, showLabel)

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

exitPieMenu(p_activePie)
{	
	PieLaunchedState := false
	StartDrawGDIP()	
	ClearDrawGDIP()
	EndDrawGDIP()
	loadSliceHotkeys(p_activePie, false)
	PieLaunchedState := false
	return false	
}



getMouseTransformProperties(init:=false, forceZeroDistance:=false)
	{
	static mouseX, mouseY, velocityTheta
	if (init == true)
		{
		midMouseX := SubPieLocX
		midMouseY := SubPieLocY			
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
	midDist := (Sqrt((Abs(midMouseX-SubPieLocX)**2) + (Abs(midMouseY-SubPieLocY)**2)))
	;Calculate Distance and Angle
	dist := (Sqrt((Abs(mouseX-SubPieLocX)**2) + (Abs(mouseY-SubPieLocY)**2)))
	
	theta := cycleRange(calcAngle(SubPieLocX, SubPieLocY, mouseX, mouseY)+90)
	returnObj := Object()	
	returnObj["x"] := mouseX
	returnObj["y"] := mouseY 
	returnObj["midX"] := midMouseX
	returnObj["midY"] := midMouseY	
	returnObj["theta"] := theta
	;If Mouse decouple
	If (forceZeroDistance)
	{
		returnObj["midDistance"] := 0
		returnObj["distance"] := 0
	}
	Else
	{
		returnObj["midDistance"] := midDist
		returnObj["distance"] := dist
	}

	returnObj["velocity"] := velocity
	returnObj["velocityTheta"] := velocityTheta

	; msgbox, % "x=" . returnObj.x . "`ny=" . returnObj.y . "`nmidX=" . returnObj.midX . "`nmidY=" . returnObj.midY . "`ntheta=" . returnObj.theta . "`nDistance=" . returnObj.distance . "`nVelocity=" . returnObj.velocity . "`nVelocityTheta=" . returnObj.velocityTheta
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
	
	Gdip_FillRectangle(G, basicBrush, 0,0,BitmapPadding[1]*2,BitmapPadding[2]*2) ;BitmapPadding copy	
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
		}
	;Draw pie slice indicators

	
	
	;Draw pie labels

	; if(drawLabel == true)
	if(true)
	{
	loop, %numSlices%
		{
		; if (activePieProfile.functions[A_Index+1].label = "" && )
		; 	continue
		labelTheta := cycleRange(((A_Index-1)*(360/numSlices))+(180/numSlices+thetaOffset))
		; If ((dist <= radius) && drawIndicator && (activePieProfile.functions[A_Index+1].function == "submenu" or activePieProfile.functions[A_Index].function == "submenu") )
		; 	Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, labelTheta-(720/numSlices), 3*Mon.pieDPIScale)
		If ((dist <= radius) )
		{
			if drawIndicator
			{
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)+(180/numSlices), 3*(Mon.pieDPIScale))
			}

			if (activePieProfile.functions[A_Index+1].function == "submenu") ;Shouldn't make mark when you don't hover over the mode.
			{
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPen, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)+(180/numSlices), 3*Mon.pieDPIScale)
				Gdip_DrawArc(G, basicPenThin, (gmx-((radius)+ (thickness / 2))), (gmy-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (labelTheta-90)-(180/numSlices), (360/numSlices)+(2*Mon.pieDPIScale))
			}			
		}
			
		
		; if activePieProfile.functions[A_Index].function == "submenu"
		; {
		; 	;Draw subMenuIndicator
		; }

		; msgbox, % labelTheta
		if labelTheta between 0.1 and 179.9
			labelAnchor := "left"
		else if labelTheta between 180.1 and 359.9
			labelAnchor := "right"
		else If (labelTheta == Mod(labelTheta,360))
			labelAnchor := "top"
		else
			labelAnchor := "bottom"	

		If (pieRegion == A_Index)
			selectedLabelState := 1				
		Else
			selectedLabelState := 0	
		if(drawLabel == true)
			drawPieLabel(activePieProfile, activePieProfile.functions[A_Index+1], Round(gmx+(labelRadius*Cos((labelTheta-90)*0.01745329252))), Round(gmy+(labelRadius*Sin((labelTheta-90)*0.01745329252))), selectedLabelState, labelAnchor, clicked, activePieProfile.functions[A_Index+1].icon)
		}
	}
	
	EndDrawGDIP()
	return pieRegion
	}
	
drawPieLabel(activePieProfile, sliceFunction, xPos, yPos, selected:=0, anchor:="center", clicked:=false, labelIcon="")
	{
	iconSizeSquare := Ceil(Settings.global.globalAppearance.iconSize*Mon.pieDPIScale)
	labelText := sliceFunction.label	
	sliceHotkey := sliceFunction.hotkey
	innerWidthPadding := Ceil(6*(((Mon.pieDPIScale-1)/2)+1))

	;Determine iconFolder
	static iconFolder
	static userIconFolder
	userIconFolder := A_WorkingDir . "\icons"
	If (iconFolder == ""){
		if( substr(Settings.global.globalAppearance.pieIconFolder, 1,13) == "%A_ScriptDir%" ){		
			iconFolder := A_ScriptDir . substr(Settings.global.globalAppearance.pieIconFolder, 14)			
		} else {
			iconFolder := Settings.global.globalAppearance.pieIconFolder
		}
	}
	
	labelFont := Settings.global.globalAppearance.font
	fontSize := Ceil(Settings.global.globalAppearance.fontSize*Mon.pieDPIScale)
	minBoxWidth := Ceil(Settings.global.globalAppearance.minimumLabelWidth*Mon.pieDPIScale)	
	iconSizeSquare := Ceil(Settings.global.globalAppearance.iconSize*Mon.pieDPIScale)
	strokeThickness := Settings.global.globalAppearance.labelStrokeThickness*Mon.pieDPIScale
	safetyGreyColor := Settings.global.globalAppearance.safetyStrokeColor
	textOptionsTest := % "x" xPos " y" yPos " Center vCenter c00FFFFFF r4 s" fontSize
	textYOffset := Ceil(1*Mon.pieDPIScale) ;For slightly off center text

	Gdip_SetSmoothingMode(G, 4)
	textHeight := Ceil(StrSplit(Gdip_TextToGraphics(G, "W", textOptionsTest, labelFont),"|")[3]) ;Should this be index 4?


	if (sliceHotkey != ""){
		sliceHotkeyExists := true
	}else{
		sliceHotkeyExists := false
	}	
	
	;initialize element vars
	labelElements := []
	newElement := {}
	iconFile := ""

	if ( InStr(labelIcon.filepath, "%UserIcons%") ){
		iconFile := StrReplace(labelIcon.filepath,"%UserIcons%", userIconFolder)	
		; msgbox, % iconFile
	} else {
		iconFile := iconFolder . "\" . labelIcon.filepath
	}
	
	If (!FileExist(iconFile) || (sliceFunction.icon.filepath == ""))
		iconFile := ""
	if ( iconFile != ""){
		newElement := {type:"icon",rect:[iconSizeSquare,iconSizeSquare],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX(activePieProfile.selectionColor),hoveredColor:RGBAtoHEX(activePieProfile.backgroundColor),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}
		pBitmaps := Gdip_CreateBitmapFromFile(iconFile)		
		iconFile := iconFolder . "\" . sliceFunction.icon.filepath
		labelElements.Push(newElement)
	}
	if (labelText != ""){
		labelTextWidth := Ceil(StrSplit(Gdip_TextToGraphics(G, labelText, textOptionsTest, labelFont),"|")[3])		
		newElement := {type:"labelText",rect:[labelTextWidth,textHeight],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX([255,255,255,255]),hoveredColor:RGBAtoHEX(activePieProfile.backgroundColor),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}	
		labelElements.Push(newElement)
	}
	if (sliceHotkey != ""){
		sliceHotkeyWidth := Ceil(StrSplit(Gdip_TextToGraphics(G, sliceHotkey, textOptionsTest, labelFont),"|")[3])		
		newElement := {type:"hotkeyText",rect:[sliceHotkeyWidth,textHeight],padding:[innerWidthPadding,innerWidthPadding],restColor:RGBAtoHEX([255,255,255,126]),hoveredColor:RGBAtoHEX(activePieProfile.backgroundColor),selectedColor:RGBAtoHEX(activePieProfile.backgroundColor)}			
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
			strokeColor := RGBAtoHEX(activePieProfile.selectionColor)
			; labelBGColor := RGBAtoHEX(whitenRGB(activePieProfile.backgroundColor))
			labelBGColor := RGBAtoHEX(activePieProfile.selectionColor)
			; textColor := RGBAtoHEX([255, 255, 255, 255])
			textColor := RGBAtoHEX(activePieProfile.backgroundColor)
			sliceHotkeyTextColor := RGBAtoHEX([activePieProfile.backgroundColor[1],activePieProfile.backgroundColor[2],activePieProfile.backgroundColor[3],128])	
			;hover color
		}
	}else{
		strokeColor := RGBAtoHEX(safetyGreyColor)
		labelBGColor := RGBAtoHEX(activePieProfile.backgroundColor)
		textColor := RGBAtoHEX(activePieProfile.fontColor)
		sliceHotkeyTextColor := RGBAtoHEX([activePieProfile.fontColor[1],activePieProfile.fontColor[2],activePieProfile.fontColor[3],128])
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
	otherPen := Gdip_CreatePen("0xFFff0000" , strokeThickness) ;May want to adjust
	basicBrush := Gdip_BrushCreateSolid(labelBGColor)
	; Gdip_DrawRoundedRectangle(G, basicPen, rectCenter[1]-(outerRectSize[1]/2), rectCenter[2]-(outerRectSize[2]/2), outerRectSize[1], outerRectSize[2], (outerRectSize[2]/2)*(activePieProfile.labelRoundness/100))
	Gdip_FillRoundedRectangle(G, basicBrush, rectCenter[1]-(outerRectSize[1]/2), rectCenter[2]-(outerRectSize[2]/2), outerRectSize[1], outerRectSize[2], (outerRectSize[2]/2)*(activePieProfile.labelRoundness/100))
	
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
					{
						colW := activePieProfile.backgroundColor
						imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
					}					
				Else
					{
					colW := activePieProfile.selectionColor
					imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
					}
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
			; textOptions := % "x" Ceil(elementPlacementPos[1]+(element.rect[1]/2)) " y" Ceil(rectCenter[2]-(element.rect[2]/2)+textYOffset) " Center vCenter c" SubStr(textColor,3) " r4 s" fontSize
			textOptions := % "x" Ceil(elementPlacementPos[1]) " y" Ceil(rectCenter[2]-(element.rect[2]/2)+textYOffset) " Left vCenter c" SubStr(textColor,3) " r4 s" fontSize
			; textOptions := % "x" (rectCenter[1]) " y" (rectCenter[2]) " Center vCenter c" SubStr(textColor,3) " r4 s" fontSize
			;add and draw text
			Gdip_TextToGraphics(G, labelText, textOptions, labelFont)
			;set new place pos
		}
		if (element.type == "hotkeyText"){
			; sliceHotkeyTextOptions := % "x" Ceil(rectCenter[1]+(contentRect[1]/2)-(element.rect[1]/2)) " y" Ceil(rectCenter[2]-(element.rect[2]/2)+textYOffset) " Center vCenter c" SubStr(sliceHotkeyTextColor,3) " r4 s" fontSize
			sliceHotkeyTextOptions := % "x" Ceil(rectCenter[1]+(contentRect[1]/2)-(element.rect[1])) " y" Ceil(rectCenter[2]-(element.rect[2]/2)+textYOffset) " Left vCenter c" SubStr(sliceHotkeyTextColor,3) " r4 s" fontSize
			Gdip_TextToGraphics(G, sliceHotkey, sliceHotkeyTextOptions, labelFont)
			;add and draw text
			;set new place pos
		}
	}	
	return
}


notifyPieEnableState(state){	
    if (state) {
        sFile := a_scriptdir . "\lib\PieEnableOn.png"
    } else {
        sFile := a_scriptdir . "\lib\PieEnableOff.png"
    }
	getActiveMonitorDPI() ;Assigns Mon.pieDPIScale

    ; Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs -DPIScale
    ; Gui, 1: Show, NA        
    gui +lastfound
    hwnd := WinExist()
    pNotificationImage:=Gdip_CreateBitmapFromFile(sFile)	
	p_dimensions := getActiveMonitorDimensions()
	dimensions := [p_dimensions[2],p_dimensions[4]]
	; msgbox, % Mon.pieDPIScale
    Width := 32*Mon.pieDPIScale
    Height := 32*Mon.pieDPIScale
    screenWidth := dimensions[1]
    screenHeight := dimensions[2]
    bottomRightPadding := [50*Mon.pieDPIScale,70*Mon.pieDPIScale]
    newWidth:=newHeight:=Width
    hbm := CreateDIBSection(newWidth, newHeight)
    hdc := CreateCompatibleDC()
    obm := SelectObject(hdc, hbm)
    pGraphics := Gdip_GraphicsFromHDC(hdc)
    Gdip_SetSmoothingMode(pGraphics, 2)
    Gdip_SetInterpolationMode(pGraphics, 2)
    Gdip_SetCompositingMode(pGraphics, 1)
    Gdip_GraphicsClear(pGraphics)
    UpdateLayeredWindow(hwnd, hdc, (screenWidth-bottomRightPadding[1]), (screenHeight-bottomRightPadding[2]), newWidth, newHeight)
    Gdip_DrawImage(pGraphics, pNotificationImage, 0, 0, width , height)
    UpdateLayeredWindow(hwnd, hdc)     
    SetTimer,hidePieEnbleNotification, -1500	
    return    
}
hidePieEnbleNotification(){    
    Gdip_GraphicsClear(pGraphics)    
    UpdateLayeredWindow(hwnd, hdc) 
    return
}

toggleEnableState(profile){			
	notifyPieEnableState(profile.pieEnableKey.enableState)
	profile.pieEnableKey.enableState := !profile.pieEnableKey.enableState	
}
	
Class pieEnableKey{
	modToggle(){
		ActiveProfile := getActiveProfile()
		toggleEnableState(ActiveProfile)
		activeProfileString := getProfileString(ActiveProfile)
		; msgbox % activeProfileString
		if (SubStr(activeProfileString, -3) = "Func")       ;custom context
			{
			fn := Func(activeProfileString)
			Hotkey, If, % fn			
			for pieKeyIndex, pieKey in ActiveProfile.pieKeys {
				if (!pieKey.ignoreProfileEnableKey)
					Try Hotkey, % pieKey.hotkey, Toggle				
			}
				
			return
			}
		else if (activeProfileString = "ahk_group regApps")   ;default context
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for pieKeyIndex, pieKey in Settings.appProfiles[1].pieKeys {
				if (!pieKey.ignoreProfileEnableKey)
					Try Hotkey, % pieKey.hotkey, Toggle ;Try may be unnecessary
			}
			return
			}
		Else                                                ;app specific context
			{
			for ahkHandleIndex, ahkHandle in ActiveProfile.ahkHandles
			{
				Hotkey, IfWinActive, % ahkHandle
				for pieKeyIndex, pieKey in ActiveProfile.pieKeys
				{
					if (!pieKey.ignoreProfileEnableKey)
						Try Hotkey, % pieKey.hotkey, Toggle
				}
			}
			; Hotkey, IfWinActive, % ActiveProfile.ahkHandles
			; for pieKeyIndex, pieKey in ActiveProfile.profile.pieKeys
			; {				
			; 	Hotkey, % Settings.appProfiles[ActiveProfile[2]].pieKey.hotkey, Toggle
			; }
				
			return
			}
		}
	modOn(){
		PieMenuRanWithMod := false
		ActiveProfile := getActiveProfile()
		activeProfileString := getProfileString(ActiveProfile)
		; msgbox % activeProfileString
		if (SubStr(activeProfileString, -3) = "Func")       ;custom context
			{
			fn := Func(activeProfileString)
			Hotkey, If, % fn
			for pieKeyIndex, pieKey in ActiveProfile.pieKeys {
				if (!pieKey.ignoreProfileEnableKey)
					Try Hotkey, % pieKey.hotkey, On
			}
				
			return
			}
		else if (activeProfileString = "ahk_group regApps")   ;default context
			{
			Hotkey, IfWinNotActive, ahk_group regApps
			for pieKeyIndex, pieKey in Settings.appProfiles[1].pieKeys {
				if (!pieKey.ignoreProfileEnableKey)
					Try Hotkey, % pieKey.hotkey, On
			}				
			return
			}
		Else                                                ;app specific context
			{
			for ahkHandleIndex, ahkHandle in ActiveProfile.ahkHandles
			{
				Hotkey, IfWinActive, % ahkHandle
				for pieKeyIndex, pieKey in ActiveProfile.pieKeys
				{
					; msgbox, % pieKey.hotkey
					Try Hotkey, % pieKey.hotkey, On
				}
			}
			return
			; Hotkey, IfWinActive, % ActiveProfile[1]
			; ; msgbox,  % ActiveProfile[1]
			; for menus in Settings.appProfiles[ActiveProfile[2]].pieKeys
			; 	Hotkey, % Settings.appProfiles[ActiveProfile[2]].pieKeys[menus].hotkey, On
			; return
			}
		}
	modOff(){	
		;Ignore if pie Menu is running
		If (PieLaunchedState)
			return
		
		ActiveProfile := getActiveProfile()
		activeProfileString := getProfileString(ActiveProfile)
		; msgbox % activeProfileString
		if (SubStr(activeProfileString, -3) = "Func") {       ;custom context		
			fn := Func(activeProfileString)
			Hotkey, If, % fn
			for pieKeyIndex, pieKey in ActiveProfile.pieKeys {
				if (!pieKey.ignoreProfileEnableKey)
					Try Hotkey, % pieKey.hotkey, Off
			}				
		}
		else if (activeProfileString = "ahk_group regApps") {   ;default context						
			Hotkey, IfWinNotActive, ahk_group regApps
			for pieKeyIndex, pieKey in Settings.appProfiles[1].pieKeys {
					If (pieKey.hotkey != ActivePieHotkey || true) { ; Not sure why I added this
						; msgbox, % Settings.appProfiles[1].pieKeys[menus].hotkey					
						; if(ActivePieHotkey != Settings.appProfiles[1].pieKeys[menus].hotkey)
						If (!pieKey.ignoreProfileEnableKey)
							Try Hotkey, % pieKey.hotkey, Off	
					}				
			}
		}
		Else ;Other application profile
			{ 
			; ActiveProfile := getActiveProfile()
			Hotkey, IfWinActive, % ActiveProfile[1]			
			for ahkHandleIndex, ahkHandle in ActiveProfile.ahkHandles
				{
				Hotkey, IfWinActive, % ahkHandle
				for pieKeyIndex, pieKey in ActiveProfile.pieKeys
					{
					; msgbox, % pieKey.hotkey	
					; if (ActivePieHotkey != pieKey.hotkey)	
					If (!pieKey.ignoreProfileEnableKey)	
						Try Hotkey, % pieKey.hotkey, Off
					}
				}
			; for menus in Settings.appProfiles[ActiveProfile[2]].pieKeys
			; 	{
			; 	If (Settings.appProfiles[ActiveProfile[2]].pieKeys[menus].hotkey != ActivePieHotkey)
			; 		Hotkey, % Settings.appProfiles[ActiveProfile[2]].pieKeys[menus].hotkey, Off
			; 	}				
			; return			
			}				

		If (getActiveProfile().pieEnableKey.sendOriginalFunc && PieMenuRanWithMod == false){
			; Send, %A_ThisHotkey%
			; msgbox, % "{" . StrReplace(A_ThisHotkey, " up","") . "}"
			; msgbox, % A_ThisHotkey
			if (StrReplace(A_ThisHotkey, " up","") == "capslock"){
				toggleCapsLock()
			} else {
				send, % "{" . StrReplace(A_ThisHotkey, " up","") . "}"
			}
			
		}
		}	
	}
runPieFunction(functionObj)
	{
	if(functionObj = false)
		return
	static lastPieFunctionRanTickCount := 0
	static lastPieFunctionRan = ""

	; selectedRegion := Settings.appProfiles[functionObj[1]].pieKeys[functionObj[2]].pieMenus[functionObj[3]].functions[functionObj[4]+1]	
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
	;// check to see which hotkey condition matches
	;// we check in the same order as the hotkeys are turned on in loadPieMenus()
	;// that is: first check for custom func contexts, then default profile, then app specific profiles
	for profileIndex, profile in Settings.appProfiles
	{
		if (profile.enable == false)
			continue
		for k, pieKey in profile.pieKeys
		{
			if (pieKey.enable == false)
				continue
			; tooltip, % "getActiveProfile`nthis hotkey = " A_ThisHotkey "`npieKey.hotkey=" pieKey.hotkey
			if (pieKey.hotkey = A_ThisHotkey)
			{
				if (SubStr(profile.ahkHandles[1], -3) = "Func")       ;custom context
				{
					; msgbox % profile.ahkHandles[1] "`n" profileIndex
					fn := Func(profile.ahkHandles[1])
					if %fn%()
						return profile
				}
			}
		}
	}

	If (!WinActive("ahk_group regApps"))
		{
		return Settings.appProfiles[1]
		}	
	WinGet, activeWinProc, ProcessName, A
	WinGetClass, activeWinClass, A
	for profileIndex, profile in Settings.appProfiles ;Could refactor 
		{
		for ahkHandleIndex, ahkHandle in profile.ahkHandles
			{
			testAHKHandle := StrSplit(ahkHandle, " ", ,2)[2]
			if (testAHKHandle == activeWinProc) || (testAHKHandle == activeWinClass)
				{
				; msgbox, profile.name
				return profile ; Could refactor and just pass the profile back as index 2
				}				
			}
			
		}	
	}

getProfileString(profile)
{
	; the json ahkHandles setting can be one of three things:
	; 1. "ahk_group regApps" for the default pie menu (bad choice of setting value though because its really if that ahkgroup is NOT active)
	; 2. array of exes for focused app context sensitivity (prefixed with "ahk_exe " due to appendAHKTag() )
	;    if 2, then we need to loop through and figure out which of the exes is currently active
	; 3. a string ending in 'Func' containing the name of the function for a user defined custom context
	firstAhkHandle := profile.ahkHandles[1]
	if (SubStr(firstAhkHandle, 1, 7) = "ahk_exe")
	{
		WinGet, activeWinProc, ProcessName, A
		WinGetClass, activeWinClass, A
		for ahkHandleIndex, ahkHandle in profile.ahkHandles
		{
			testAHKHandle := StrSplit(ahkHandle, " ", ,2)[2]
			if (testAHKHandle == activeWinProc) || (testAHKHandle == activeWinClass)
				{
				; msgbox, profile.name
				return testAHKHandle ; Could refactor and just pass the profile back as index 2
				}				
		}	
	}
	else
		return firstAhkHandle
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
	; msgbox, % "input: " . hotkeyInput
	; msgbox, % hotkeyArray[1]
	; msgbox, % hotkeyArray[2]
	if (hotkeyArray[1] = "")
		return
	
	for ahkHandleIndex, ahkHandle in ActiveProfile.ahkHandles
	{
		if (SubStr(ahkHandle, -3) = "Func") {      ;custom context
			fn := Func(ahkHandle)
			Hotkey, If, % fn
		} else if (ahkHandle == "ahk_group regApps"){
			Hotkey, IfWinNotActive, ahk_group regApps
		} else {
			Hotkey, IfWinActive, % ahkHandle
		}
		bareKey := removeCharacters(hotkeyInput, "+^!#")



		If (hasValue(bareKey, hotkeyArray) && hasValue("+" + bareKey, hotkeyArray)){
			; msgbox, both
			return
		}
		If (bareKey == hotkeyInput){			
			return
		}
			
		If (blockState == true) ; fix this
			{		
				; If !(hasValue(bareKey, hotkeyArray))				
				
				Try	Hotkey, % bareKey, pieLabel
				Try Hotkey, % "+" . bareKey, pieLabel							
				Try	Hotkey, % bareKey, On
				Try Hotkey, % "+" . bareKey, On
			}
		Else
			{							
				If !(hasValue(bareKey, hotkeyArray)){
					Try Hotkey, % bareKey, Off			
				}
				If !(hasValue("+" . bareKey, hotkeyArray)){
					Try Hotkey, % "+" . bareKey, Off
				}
			}
	}
	return
	}
appendAHKTag(processString){
	; msgbox, % processString
	if (processString == "explorer.exe"){
		return "ahk_class CabinetWClass"
	} else {
		return "ahk_exe " . processString
	}
}

blockBareKeys_2(hotkeyInput, hotkeyArray, blockState=true){
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
		Try	Hotkey, % "*" . bareKey, pieLabel
		; Try Hotkey, % "+" + bareKey, pieLabel							
		Try	Hotkey, % "*" . bareKey, On
		; Try Hotkey, % "+" + bareKey, On
		}
	Else
		{		
		If !(hasValue(bareKey, hotkeyArray)){
			Try Hotkey, % "*" . bareKey, Off
			; msgbox, % hasValue(bareKey, hotkeyArray)
		}
		If !(hasValue("+" + bareKey, hotkeyArray)){
			Try Hotkey, % "*" . bareKey, Off
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

getBitmapPadding(activePieObj){
	safetyPadding := [280,50]
	circleGraphicsRadius := (activePieObj.radius + activePieObj.thickness + activePieObj.labelRadius)	
	BitmapPadding := [circleGraphicsRadius + safetyPadding[1],circleGraphicsRadius + safetyPadding[2]]		
	BitmapPadding := [BitmapPadding[1]*Mon.pieDPIScale,BitmapPadding[2]*Mon.pieDPIScale]	
	return BitmapPadding
}

mouseToCenterScreen(mouseMouse:=true){
	p2_dimensions := getActiveMonitorDimensions()
	; msgbox, % p2_dimensions[1]
	; msgbox, % p2_dimensions[2]
	
	If (mouseMouse)
		MouseMove, p2_dimensions[1]+((p2_dimensions[2]-p2_dimensions[1])/2), p2_dimensions[3]+((p2_dimensions[4]-p2_dimensions[3])/2), 0
	
	return [p2_dimensions[1]+((p2_dimensions[2]-p2_dimensions[1])/2), p2_dimensions[3]+((p2_dimensions[4]-p2_dimensions[3])/2)]
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
	this.center := [this.x + (this.width/2),this.y + (this.height/2)]
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

print(value,varName=""){
	if (value == ""){
		if(varName != ""){
			OutputDebug, % varName . ": null"
		}else{
			OutputDebug, null
		}		
		return
	}
	; if (DebugMode == false)		
	; 	return		
	if (IsObject(value)) ;Array or Object
	{
		showArrString := ""
		for k, val in value
		{
			if (k == 1) {
				showArrString := "1: " . val
			} else {
				if(varName != ""){
					showArrString := showArrString . "`n`t" . k . ": " . val
				}else{
					showArrString := showArrString . "`n" . k . ": " . val				
				}
			}
		}
		if(varName != ""){
			showArrString := varName . ":`n`t" . showArrString
		}
		OutputDebug, % showArrString	
		return
	} else { ;Number or string
		if(varName != ""){
			value := varName . ": " . value
		}
		OutputDebug, % value
		return
	}	
}

; print(var, thing=""){
; 	OutputDebug, % var . "`n"
; }

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

toggleCapsLock(){
	if GetKeyState("CapsLock", "T") = 1
	{	
	SetCapsLockState, off
	}
	else if GetKeyState("CapsLock", "F") = 0
	{	
	SetCapsLockState, on
	}
}
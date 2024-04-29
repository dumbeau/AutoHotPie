;To set the function to call from the JSON settings file, type in the
;part of the function after "pie_"

;Special function allowing submenus
pie_submenu(pieMenuAddress)
{
	return
}

pie_sendKey(keyObject)
{
	if (keyObject.delayKeyRelease){		
		newKeyArray := []
		; msgbox, % keyObject.keys[0] . " " . keyObject.keys[1] . " " . keyObject.keys[2] . " " . keyObject.keys[3]
		for keyIndex, key in keyObject.keys
		{	
			bareKey := removeCharacters(key, "+^!#")			
			startModifierString := ""                
			endModifierString := ""
			If (InStr(key,"#")){
				startModifierString := startModifierString . "{LWin down}"
				endModifierString := endModifierString . "{LWin up}"					
			}
			If (InStr(key,"+")){                    
				startModifierString := startModifierString . "{shift down}"
				endModifierString := endModifierString . "{shift up}"                    
			}
			If (InStr(key,"^")){
				startModifierString := startModifierString . "{ctrl down}"
				endModifierString := endModifierString . "{ctrl up}"						
			}
			If (InStr(key,"!")){
				startModifierString := startModifierString . "{alt down}"
				endModifierString := endModifierString . "{alt up}"					
			}
			newKeyArray.Push(startModifierString . "{" . bareKey . " down}")				
			newKeyArray.Push("{" . bareKey . " up}" . endModifierString)				
		}
		sendKeyArray := newKeyArray
		for keyIndex, key in sendKeyArray
		{
		if (keyIndex != 1)
			sleep, % keyObject.keyDelay+1	
		send, % key
		}		
		} else {		
			sendKeyArray := keyObject.keys
			for keyIndex, key in sendKeyArray
			{ 
			if (keyIndex != 1)
				sleep, % keyObject.keyDelay
			bareKey := removeCharacters(key, "+^!#")		
			keyToSend := StrReplace(key, bareKey, "{" .  bareKey . "}")			
			send, % keyToSend
			}
		}
		return	
	}

	; msgbox, % keyObject.keys[1]	
	; msgbox, % keyObject.keys[2]	
	; msgbox, % keyObject.keys[3]	
	; msgbox, % keyObject.keys[4]	
	

pie_sendText(params)
{
	for index, txt in params.text
	{
		; msgbox pie_sendText`n%txt%
		if (index = 1) ; just incase someone malforms the json
			SendInput, {Text}%txt%
	}
}



pie_mouseClick(params)
	{
		; MouseButton - str, Shift - bool, Ctrl - bool, Alt - bool, Drag - bool
		;["LButton",1,0,0,0,0]
		RemapLButton := params.button
		modsDown := ""
		modsUp := ""
		mouseButton := params.button
		if(params.shift == true){
			modsDown := modsDown . "{shift down}"
			modsUp := modsUp . "{shift up}"
		}
		if(params.ctrl == true){
			modsDown := modsDown . "{ctrl down}"
			modsUp := modsUp . "{ctrl up}"
		}
		if(params.alt == true){
			modsDown := modsDown . "{alt down}"
			modsUp := modsUp . "{alt up}"
		}
		send, %modsDown%		
		if (params.drag == true){
			lButtonWait(mouseButton)			
		} else {			
			MouseClick, %mouseButton%, PieOpenLocX, PieOpenLocY, ,0
		}
		send, %modsUp%
		RemapLButton := ""
		return
	}
pie_runScript(script) {
    script := script.filepath
    Try {
        If (SubStr(script, 1, 14) = "%A_WorkingDir%") {
            script := A_WorkingDir . SubStr(script, 15)
        }
        script := StrReplace(script, "%PieOpenLocX%", PieOpenLocX)
        script := StrReplace(script, "%PieOpenLocY%", PieOpenLocY)
        Run, % script
        return
    }
    catch e {
        MsgBox, % "Cannot run the script at:`n`n" . script
        return
    }
}
pie_openFolder(params){
	directory := params.filePath	
	if (FileExist(directory)){
		Run, %directory%
	} else {
		msgbox, % "Cannot find directory:`n" + directory
	}
}
pie_focusApplication(applications)
	{
	; Need to add this function to UI
	return
	}

pie_eyedropper(mode)
	{
	PixelGetColor, pixelcol, PieOpenLocX, PieOpenLocY, RGB
	pixelcol := SubStr(pixelcol, 3, 6)
	clipboard = %pixelcol%
	Return		
	}
pie_multiClipboard()
	{
	;Windows already has this so who cares
	return
	}
pie_repeatLastFunction(timeOut) ;special function
	{
	return
	}
pie_openSettings()
	{
	;Different location for compiled version
	if (IsStandAlone){
		msgbox, "Cannot open AutoHotPie settings from standalone"
		return false
	}
	try {
		SplitPath, A_ScriptDir,, dir1
		SplitPath, dir1,, dir2
		run, % dir2 . "\AutoHotPie.exe"
		exitapp	
		return
	} catch e {
		msgbox, Cannot find AutoHotPie.exe
		return false
	}
	
	}
pie_resizeWindow() ;make this work thorugh here
	{
	; msgbox, % PieMenuPosition[1]
	xPos := PieOpenLocX
	yPos := PieOpenLocY
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
pie_moveWindow() ;make this work thorugh here
	{
	WinGetPos, winX, winY, width, height, A
	WinMove, A, , PieOpenLocX-(width/2), PieOpenLocY-(width/3)
	return
	}
pie_openURL(params){
	url := params.url
	Try
	{
	run, % url
	return
	} catch e {
		msgbox, % "Cannot open URL at:`n`n" . url
	return
	}
	}
pie_selectMenuItem(menuItems){
	WinMenuSelectItem, A, , menuItems[1], menuItems[2], menuItems[3], menuItems[4], menuItems[5], menuItems[6] 	
}
pie_switchApplication(params){
	exePath := params.filePath
	multipleInstances := params.multipleInstanceApplication
	SplitPath, % params.filePath, ahkHandle
	ahkHandle := appendAHKTag(ahkHandle)
	If (multipleInstances) {
        groupName := StrReplace(SubStr(ahkHandle, InStr(ahkHandle," ")+1),".","")
        If (GetKeyState("Ctrl", "P"))
        {            
            Run, %exePath%            
            GroupAdd, %groupName%, %ahkHandle%
        } Else {            
            If !(WinExist(ahkHandle))
                {
                Run, %exePath%
                GroupAdd, %groupName%, %ahkHandle%
                Return
                }
            GroupAdd, %groupName%, %ahkHandle%
            if WinActive(ahkHandle)
                {
                GroupActivate, %groupName%, r
                sleep, 3
                }
            else
                WinActivate, %ahkHandle%
        }                 
    } Else {
        If !WinExist(ahkHandle) {
            Run, %exePath%
        } Else {
            WinActivate, %ahkHandle%
        }             
    }	
}
pie_afterfx_cursorToPlayhead()
	{
	return
	}
pie_afterfx_runPieScript()
	{
	return
	}


pie_Photoshop_cycleTool(cycleTools) ;cycle through array of tools.  The array can have only one value as well.
	{
	; photoshopTools := ["moveTool","artboardTool","marqueeRectTool","marqueeEllipTool","marqueeSingleRowTool","marqueeSingleColumnTool","lassoTool","polySelTool","magneticLassoTool","quickSelectTool","magicWandTool","cropTool","perspectiveCropTool","sliceTool","sliceSelectTool","framedGroupTool","eyedropperTool","3DMaterialSelectTool","colorSamplerTool","rulerTool","textAnnotTool","countTool","spotHealingBrushTool","magicStampTool","patchSelection","recomposeSelection","redEyeTool","paintbrushTool","pencilTool","colorReplacementBrushTool","wetBrushTool","cloneStampTool","patternStampTool","historyBrushTool","artBrushTool","eraserTool","backgroundEraserTool","magicEraserTool","gradientTool","bucketTool","3DMaterialDropTool","blurTool","sharpenTool","smudgeTool","dodgeTool","burnInTool","saturationTool","penTool","freeformPenTool","curvaturePenTool","addKnotTool","deleteKnotTool","convertKnotTool","typeCreateOrEditTool","typeVerticalCreateOrEditTool","typeVerticalCreateMaskTool","typeCreateMaskTool","pathComponentSelectTool","directSelectTool","rectangleTool","roundedRectangleTool","ellipseTool","polygonTool","lineTool","customShapeTool","handTool","rotateTool","zoomTool"]			
	appRef := ComObjActive( "Photoshop.Application" )
	; msgbox, % cycleTools.Length() "  " appRef.CurrentTool "  " cycleTools[1]
	if cycleTools.Length() = 1
		{
		appRef.CurrentTool := cycleTools[1]
		return
		}
	for tool in cycleTools
		{
		if appRef.CurrentTool == cycleTools[tool]
			{
			; msgbox, % cycleTools[tool] " and " appRef.CurrentTool
			if appRef.CurrentTool = cycleTools[cycleTools.Length()]
				{
				appRef.CurrentTool := cycleTools[1]
				return
				; break
				}
			appRef.CurrentTool := cycleTools[tool+1]
			return
			; break
			}
		}
	appRef.CurrentTool := cycleTools[1]
	return
	}

pie_Photoshop_sampleColor() 
	{
	appRef := ComObjActive( "Photoshop.Application" )
	prevTool := appRef.CurrentTool
	appRef.CurrentTool := "eyedropperTool"
	MouseClick, Left, , , , 0
	sleep,5
	appRef.CurrentTool := prevTool
	return
	}


pie_Photoshop_toggleLayerByName(layerNames) ; toggles on/off a layer by name
{
	appRef := ComObjActive( "Photoshop.Application" )
    ref := ComObjCreate( "Photoshop.ActionReference" )
    for layerName in layerNames
	{		
		ref.putName( appRef.stringIDToTypeID("layer"), layerNames[layerName] )
    	desc := ComObjCreate( "Photoshop.ActionDescriptor" )
    	desc.putReference( appRef.stringIDToTypeID( "null" ), ref )

		if appRef.executeActionGet(ref).getBoolean( appRef.stringIDToTypeID( "visible" )) == -1
    	    appRef.executeAction( appRef.charIDToTypeID( "Hd  " ), desc, 3 )
    	else
    	    appRef.executeAction( appRef.charIDToTypeID( "Shw " ), desc, 3 )
	}
	return
}

; name should be in quotes ex.: "roundbrush"
pie_Photoshop_cycleBrush(brushNames)
{
    appRef := ComObjActive( "Photoshop.Application" )
    desc := ComObjCreate( "Photoshop.ActionDescriptor" )
	ref := ComObjCreate( "Photoshop.ActionReference" )
	if brushNames.Length() = 1
		{		
    	ref.putName( appRef.charIDToTypeID( "Brsh" ), brushNames[1])
    	desc.putReference( appRef.charIDToTypeID( "null" ), ref )
    	appRef.executeAction( appRef.charIDToTypeID( "slct" ), desc, 3 )	
		}
	else
		{
		
		}
    ref.putName( appRef.charIDToTypeID( "Brsh" ), brushNames[1])
    desc.putReference( appRef.charIDToTypeID( "null" ), ref )
    appRef.executeAction( appRef.charIDToTypeID( "slct" ), desc, 3 )
    return
}

pie_customFunction(functionObject){
	Try
	{
		p_funcName := "customFunc_" . functionObject.id
		p_funcParams := functionObject.params		
		%p_funcName%(p_funcParams)
	} catch e {
		msgbox, %e%
		return
	}
}



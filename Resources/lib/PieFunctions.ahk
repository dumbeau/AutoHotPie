;To set the function to call from the JSON settings file, type in the
;part of the function after "pie_"
pie_sendKey(keys)
	{	
	for key in keys
		{		
		; sendCount++
		; if(key != 1)
		; sleep, 1
		send, % keys[key]
		; showKey := keys[key]
		; FileAppend, %sendCount% : %A_TickCount% : %showKey% `n, C:\Users\beaug\Desktop\keyLog.txt
		}
		return
	}
pie_mouseClick(params)
	{
		; MouseButton - str, Shift - bool, Ctrl - bool, Alt - bool, Drag - bool
		;["LButton",1,0,0,0,0]
		remapLButton := params.button		
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
			MouseClick, %mouseButton%, iMouseX, iMouseY, ,0
		}
		send, %modsUp%
		remapLButton := ""
		return
	}
pie_runScript(scripts)
	{
	Try
	{
	If (SubStr(scripts[1], 1, 13) = "%A_ScriptDir%")
		run, % A_ScriptDir . SubStr(scripts[1], 14)
	else
		run, % scripts[1]
	return
	} catch e {
		msgbox, % "Cannot run the script at:`n`n" . scripts[1]
	return
	}
	}
pie_focusApplication(applications)
	{
	return
	}

pie_eyedropper(mode)
	{
	PixelGetColor, pixelcol, iMouseX, iMouseY, RGB
	pixelcol := SubStr(pixelcol, 3, 6)
	clipboard = %pixelcol%
	Return		
	}
pie_multiClipboard()
	{
	return
	}
pie_repeatLastFunction(timeOut) ;special function
	{
	return
	}
pie_openSettings()
	{
	return
	}
pie_resizeWindow() ;make this work thorugh here
	{
	; msgbox, % PieMenuPosition[1]
	xPos := iMouseX
	yPos := iMouseY
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
	WinMove, A, , iMouseX-(width/2), iMouseY-(width/3)
	return
	}

pie_afterfx_cursorToPlayhead()
	{
	return
	}
pie_afterfx_runPieScript()
	{
	return
	}

; photoshopTools := ["moveTool","artboardTool","marqueeRectTool","marqueeEllipTool","marqueeSingleRowTool","marqueeSingleColumnTool","lassoTool","polySelTool","magneticLassoTool","quickSelectTool","magicWandTool","cropTool","perspectiveCropTool","sliceTool","sliceSelectTool","framedGroupTool","eyedropperTool","3DMaterialSelectTool","colorSamplerTool","rulerTool","textAnnotTool","countTool","spotHealingBrushTool","magicStampTool","patchSelection","recomposeSelection","redEyeTool","paintbrushTool","pencilTool","colorReplacementBrushTool","wetBrushTool","cloneStampTool","patternStampTool","historyBrushTool","artBrushTool","eraserTool","backgroundEraserTool","magicEraserTool","gradientTool","bucketTool","3DMaterialDropTool","blurTool","sharpenTool","smudgeTool","dodgeTool","burnInTool","saturationTool","penTool","freeformPenTool","curvaturePenTool","addKnotTool","deleteKnotTool","convertKnotTool","typeCreateOrEditTool","typeVerticalCreateOrEditTool","typeVerticalCreateMaskTool","typeCreateMaskTool","pathComponentSelectTool","directSelectTool","rectangleTool","roundedRectangleTool","ellipseTool","polygonTool","lineTool","customShapeTool","handTool","rotateTool","zoomTool"]		
pie_Photoshop_cycleTool(cycleTools) ;cycle through array of tools.  The array can have only one value as well.
	{
	; msgbox, hi
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

; toggles on/off a layer by name
pie_Photoshop_toggleLayerByName(layerNames)
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

;Special function allowing submenus
pie_SubMenu(pieMenuAddress)
{
}

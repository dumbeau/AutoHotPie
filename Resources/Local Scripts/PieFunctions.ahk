;To set the function to call from the JSON settings file, type in the
;part of the function after "pie_"
pie_sendKey(keys)
	{
	for key in keys
		{
		send, % keys[key]
		}
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
pie_resizeWindow()
	{
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

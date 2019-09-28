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
	run, "C:\Users\beaug\Desktop\blah.ahk"
	return
	}
pie_focusApplication(applications)
	{
	return
	}
pie_repeatLastFunction() ;special function
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
; photoshopTools := ["moveTool","artboardTool","marqueeRectTool","marqueeEllipTool","marqueeSingleRowTool","marqueeSingleColumnTool","lassoTool","polySelTool","magneticLassoTool","quickSelectTool","magicWandTool","cropTool","perspectiveCropTool","sliceTool","sliceSelectTool","framedGroupTool","eyedropperTool","3DMaterialSelectTool","colorSamplerTool","rulerTool","textAnnotTool","countTool","spotHealingBrushTool","magicStampTool","patchSelection","recomposeSelection","redEyeTool","paintbrushTool","pencilTool","colorReplacementBrushTool","wetBrushTool","cloneStampTool","patternStampTool","historyBrushTool","artBrushTool","eraserTool","backgroundEraserTool","magicEraserTool","gradientTool","bucketTool","3DMaterialDropTool","blurTool","sharpenTool","smudgeTool","dodgeTool","burnInTool","saturationTool","penTool","freeformPenTool","curvaturePenTool","addKnotTool","deleteKnotTool","convertKnotTool","typeCreateOrEditTool","typeVerticalCreateOrEditTool","typeVerticalCreateMaskTool","typeCreateMaskTool","pathComponentSelectTool","directSelectTool","rectangleTool","roundedRectangleTool","ellipseTool","polygonTool","lineTool","customShapeTool","handTool","rotateTool","zoomTool"]		
pie_Photoshop_cycleTool(cycleTools)
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
				break
				}
			appRef.CurrentTool := cycleTools[tool+1]
			return
			break
			}
		}
	appRef.CurrentTool := cycleTools[1]
	return
	}

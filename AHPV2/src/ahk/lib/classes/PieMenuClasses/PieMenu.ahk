class PieMenu {	
	__New(PieMenuSettings, _applicationProfile:=""){				
		ObjMerge(this, PieMenuSettings)
		this.__Parent := &_applicationProfile		
		this.pieItems := []
		if (this.enabled){
			boundPressFunc := this.press.Bind(this)					
			boundReleaseFunc := this.release.Bind(this)			
			Hotkey, % this.hotkey.ahkKey, % boundPressFunc
			Hotkey, % StripModifierCharacters(this.hotkey.ahkKey) . " up", % boundReleaseFunc
			if(this.applicationProfile.autoHotPie.escapeKeyCancelEnabled){
				boundExitFunc := this.exit.Bind(this,true)
				boundExitFuncRelease := this.exit.Bind(this,false)
				exitKey := "Escape"
				Hotkey, % exitKey, % boundExitFunc
				Hotkey, % StripModifierCharacters(exitKey) . " up", % boundExitFuncRelease
			}
			for k, pieItem in PieMenuSettings.pieItems {					
				this.pieItems.Push(new this.PieItem(pieItem, this))
			}
		}		
	}

	applicationProfile[]{
		get {
			; if (NumGet(this.__Parent) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__Parent)			
		}
	}

	;Class variables for methods
	hotkeyPressed := false
	exitKeyPressed := false	
	cursorClicked := false
	pieItemClicked := false
	isRunning := false
	pieOpenPosition := [0,0]
	activeDisplay := {}
	bitmapPadding := [0,0]
	cursor := {}
	pieOpenedTimeMilliseconds := 0
	pieTimeMilliseconds[]{
		get {
			return (A_TickCount-this.pieOpenedTimeMilliseconds)
		}
	}
	
	#Include PieItem.ahk

	press(){	
		If (this.hotkeyPressed)
			return
		If (this.exitKeyPressed)
			return
		this.hotkeyPressed := true
		if ((this.hotkeyPressed == true) && (this.isRunning == false))
			this.run()		
	}
	release(){
		this.hotkeyPressed := false		
	}
	click(){
		this.pieItemClicked := true		
		this.cursorClicked := true		
	}
	clickRelease(){
		this.cursorClicked := false		
	}
	exit(keyPress:=false){				
		StartDrawGDIP()	
		ClearDrawGDIP()
		EndDrawGDIP()
		this.isRunning := false
		this.pieItemClicked := false
		this.exitKeyPressed := (keyPress) ? true : false

		clickFunction := this.click.Bind(this)
		clickReleaseFunction := this.clickRelease.Bind(this)
		Hotkey, *LButton, Off
		Hotkey, *LButton up, Off
		
		; loadSliceHotkeys(p_activePie, false)		
		; if (this.exitKeyPressed)
		; 	print("Exited Menu by exit key")	
		; Else
		; 	print("Exit menu by key release")		
		return
	}
	run(){ ;RunPieMenu		
		; print(this.name,"Running Pie Menu")
		this.isRunning := true	
		this.pieOpenedTimeMilliseconds:= A_TickCount	

		this.activeDisplay := Display.active
		this.bitmapPadding := this.setBitmapPadding()

		clickFunction := this.click.Bind(this)
		clickReleaseFunction := this.clickRelease.Bind(this)
		Hotkey, *LButton, % clickFunction
		Hotkey, *LButton up, % clickReleaseFunction
			

		this.getCursorTransformProperties(true)		
		SetUpGDIP(this.pieOpenPosition[1]-this.bitmapPadding[1], this.pieOpenPosition[2]-this.bitmapPadding[2], 2*this.bitmapPadding[1], 2*this.bitmapPadding[2])		
		
		
		Switch this.activation.mode	{	
			case 1: ; Hover into submenus, release on function
				this.exit()
				return			
			case 2: ; Select first menu and hover over the next							
				; Create regions			
				this.lastRunTime := A_TickCount				
				drawPieFuncObj := this.draw.Bind(this, [this.cursor.x,this.cursor.y])
				SetTimer, % drawPieFuncObj, % this.activeDisplay.refreshTimeMilliseconds
				selectedPieItem := ""
				loop{
					If (!this.isRunning)
						break
					If (!this.hotkeyPressed)
						{
							;Determine selected item
							pieMenuRegionIndex := this.getSelectedPieRegion()					
							;Run item
							selectedPieItem := this.pieItems[pieMenuRegionIndex]							
							If (selectedPieItem.radius){ ;This is a submenu
								print("Submenu selected")
							} else {
								this.isRunning := false							
							}
							selectedPieItem.run()
						}
					}

				;Animate selected item away ???	
				
				
				SetTimer, % drawPieFuncObj, Delete				

				this.exit()
				; if (selectedPieItem) {									
				; 	selectedPieItem.animateOut([this.cursor.x,this.cursor.y])
				; }
				return
			case 3: ; Hover over all
				this.exit()
				Return
			case 4: ; Click all
				this.exit()
				Return
			case 5: ; Leave and return or circle and return for more menus.  Selecting a submenu will make subsequent menus hover activated.
				this.exit()
				Return
			default:
				msgbox, How did you mess this up?
			return
			this.pieItems[1].run()
		}
	}		
	draw(position:=""){
		static lastPosition
		static lastDrawTimeMilliseconds
		drawTimeMilliseconds := A_TickCount
		refreshTime := this.activeDisplay.refreshTimeMilliseconds
		;Determine if frame sleep time has passed.
		if(drawTimeMilliseconds < (lastDrawTimeMilliseconds+refreshTime)){
			print("Not refreshing")
			return
		}			

		StartDrawGDIP()					
		this.drawPie(this)

		lastDrawTimeMilliseconds := A_TickCount		
	}
	drawPie(pieMenu,position=""){
		
		
		If(!position)
			position := pieMenu.bitmapPadding

		this.getCursorTransformProperties()
		
		animation := this.applicationProfile.autoHotPie.appearance.animation
		animationDurationMilliseconds := (animation.enabled) ? (animation.durationSeconds*1000) : 0		
		
		ClearDrawGDIP()		
		Gdip_SetCompositingMode(G, 0)		
		Gdip_SetSmoothingMode(G, 4)

		
		radius := pieMenu.radius*this.activeDisplay.displayScale*Animate(this.pieTimeMilliseconds, animationDurationMilliseconds, "exponential",4,0.5,1)
		thickness := pieMenu.thickness*this.activeDisplay.displayScale
		labelRadius := pieMenu.labelRadius*this.activeDisplay.displayScale*Animate(this.pieTimeMilliseconds-(this.labelDelaySeconds*1000), animationDurationMilliseconds, "exponential",6,0.5,1)
		thetaOffset := pieMenu.pieAngle
		
		opacity := Ceil(255*Animate(this.pieTimeMilliseconds, animationDurationMilliseconds, "exponential",2))
		
		bgColor := [pieMenu.backgroundColor[1],pieMenu.backgroundColor[2],pieMenu.backgroundColor[3],opacity]
		selectColor := [pieMenu.selectionColor[1],pieMenu.selectionColor[2],pieMenu.selectionColor[3],opacity]
		hoveredSliceIndex := -1
		totalSlices := pieMenu.pieItems.Length()-1
		
		
		selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness/2)
		basicPen := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness)
		basicPenThin := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness/2)	
		basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([125,125,125,1])) ;set last value to non-zero to see rect issue 0 means no rect is created	
		selectBrush := Gdip_BrushCreateSolid(RGBAtoHEX(selectColor))		
		
		;Fill bitmap cover fill
		Gdip_FillRectangle(G, basicBrush, 0,0,pieMenu.bitmapPadding[1]*2,pieMenu.bitmapPadding[2]*2) ;pieMenu.bitmapPadding copy
		;Background circle

		centerOverlapAdjustment := 1		
		If (this.cursor.distance < pieMenu.radius){ ;Inside the circle
			;Background circle
			backgroundPen := Gdip_CreatePen(RGBAtoHEX(bgColor), thickness-(centerOverlapAdjustment*2))
			backgroundCircleRadius := radius+centerOverlapAdjustment
			Gdip_DrawEllipse(G, backgroundPen, (position[1]-((backgroundCircleRadius)+ (thickness / 2))), (position[2]-((backgroundCircleRadius)+ (thickness / 2))), 2*backgroundCircleRadius+thickness, 2*backgroundCircleRadius+thickness)	
			;Center selection circle			
			Gdip_DrawEllipse(G, selectPen, (position[1]-((radius)+ (thickness / 4))), (position[2]-((radius)+ (thickness / 4))), 2*radius+(thickness/2), 2*radius+(thickness/2))
		} Else { ;Outside the circle
			hoveredSliceIndex := Floor(Math.cycleRange(this.cursor.theta-thetaOffset)/(360/totalSlices))
			; startArcAngle := (Floor(cycleRange(this.cursor.theta-thetaOffset)/(360/totalSlices))*(360/totalSlices))+thetaOffset
			startArcAngle := ((hoveredSliceIndex)*(360/totalSlices))+thetaOffset
			labelTheta := Math.cycleRange(((pieItemIndex-1)*(360/totalSlices))+(180/totalSlices+pieMenu.pieAngle))	
			selectPen := Gdip_CreatePen(RGBAtoHEX(selectColor), thickness)	
			;Background arc
			safetyArcPaddingDegrees := 2
			Gdip_DrawArc(G, basicPen, (position[1]-((radius)+ (thickness / 2))), (position[2]-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (startArcAngle+(360/totalSlices))-90-safetyArcPaddingDegrees, 360-(360/totalSlices)+safetyArcPaddingDegrees*2)		
			;Selection arc
			Gdip_DrawArc(G, selectPen, (position[1]-((radius)+ (thickness / 2))), (position[2]-((radius)+ (thickness / 2))), 2*radius+thickness, 2*radius+thickness, (startArcAngle)-90, (360/totalSlices))
			
			
			;draw Mouse line
			pPath := Gdip_CreatePath(1)
			lineRadius := 1*this.activeDisplay.displayScale

			mainPoint := ExtendAlongAngle(this.pieOpenPosition,this.cursor.theta,Min(this.cursor.distance, this.bitmapPadding[2]))
			; mainPoint := ExtendAlongAngle(this.pieOpenPosition,this.cursor.theta,Min(this.cursor.distance, this.radius+this.labelRadius))
			mainPoint := [mainPoint[1]-this.pieOpenPosition[1]+this.bitMapPadding[1],mainPoint[2]-this.pieOpenPosition[2]+this.bitMapPadding[2]]
			; mainrPoint := [mouseLineX,mouseLineY]
			point1 := ExtendAlongAngle(mainPoint, Math.cycleRange(this.cursor.theta+90),lineRadius)
			point2 := ExtendAlongAngle(mainPoint, Math.cycleRange(this.cursor.theta-90),lineRadius)

			pointString := point1[1] . "," . point1[2] . " | " . point2[1] . "," . point2[2] . " | " . position[1] . "," . position[2]
			Gdip_FillPolygon(G, selectBrush, pointString)
			lineCapThickness := lineRadius
			Gdip_FillEllipse(G, selectBrush, mainPoint[1]-(lineCapThickness),mainPoint[2]-(lineCapThickness),lineCapThickness*2,lineCapThickness*2)
		}
		
		
		pieTimeMilliseconds := this.pieTimeMilliseconds
		
		If(pieTimeMilliseconds > (this.labelDelaySeconds*1000)){ 			
			for pieItemIndex, pieItem in this.pieItems {
				if (pieItemIndex==1) ;Don't draw center item.
					Continue
				if (!pieItem.text && !pieItem.icon.filePath) ;Don't draw empty label
					Continue
				labelTheta := Math.cycleRange(((pieItemIndex-2)*(360/totalSlices))+(180/totalSlices+pieMenu.pieAngle))				
				if labelTheta between 1 and 179
					labelAnchor := "left"
				else if labelTheta between 181 and 359
					labelAnchor := "right"
				else
					labelAnchor := "center"					
				pieItemPosition := [Round(position[1]+(labelRadius*Cos((labelTheta-90)*0.01745329252))),Round(position[2]+(labelRadius*Sin((labelTheta-90)*0.01745329252)))]
				hoveredItemIndex := Math.cycleRange(hoveredSliceIndex,totalSlices)+2
				pieItemHovered := (pieItemIndex == hoveredItemIndex && this.cursor.distance > pieMenu.radius) ? true : false
				pieItem.draw(pieItemPosition,labelAnchor,pieItemHovered)
			}
		}
		EndDrawGDIP()
	}
	runPieItem(pieItem){
	}
	setBitmapPadding(pieMenu:=""){
		if(!pieMenu)
			pieMenu := this
		safetyPadding := [280,50]
		; safetyPadding := [500,500]
		circleGraphicsRadius := (pieMenu.radius + pieMenu.thickness + pieMenu.labelRadius)	
		bitmapPadding := [circleGraphicsRadius + safetyPadding[1],circleGraphicsRadius + safetyPadding[2]]		
		bitmapPadding := [Floor(bitmapPadding[1]*pieMenu.activeDisplay.displayScale),Floor(bitmapPadding[2]*pieMenu.activeDisplay.displayScale)]	
		pieMenu.bitmapPadding := bitmapPadding
		return bitmapPadding
	}
	getSelectedPieRegion(){
		thetaOffset := this.pieAngle
		totalSlices := this.pieItems.Length()-1
		this.getCursorTransformProperties()
		if (this.cursor.distance > this.radius) {
			pieMenuRegionIndex := Math.cycleRange(Floor(Math.cycleRange(this.cursor.theta-thetaOffset)/(360/totalSlices)),totalSlices)+1
		} Else {
			pieMenuRegionIndex := 0
		}	
		pieMenuRegionIndex := pieMenuRegionIndex + 1
		return pieMenuRegionIndex
	}
	getCursorTransformProperties(init:=false,forceZeroDistance:=false){
		; May add pseudo-cursor later ???
		MouseGetPos, mouseX, mouseY
		if(init)
			this.pieOpenPosition := [mouseX,mouseY]
		; velocity := (Sqrt((Abs(mouseX-midMouseX)**2) + (Abs(mouseY-midMouseY)**2)))
		; if velocity != 0
		; 	velocityTheta := cycleRange(calcAngle(midMouseX, midMouseY, mouseX, mouseY)+90)	
		;Calculate Distance and Angle
		dist := (Sqrt((Abs(mouseX-this.pieOpenPosition[1])**2) + (Abs(mouseY-this.pieOpenPosition[2])**2)))
		
		theta := Math.cycleRange(Math.calcAngle(this.pieOpenPosition[1], this.pieOpenPosition[2], mouseX, mouseY)+90)
		returnObj := Object()	
		returnObj["x"] := mouseX
		returnObj["y"] := mouseY 
		returnObj["theta"] := theta
		;If Mouse decouple
		returnObj["distance"] := (forceZeroDistance) ? 0 : Ceil(dist)
		; returnObj["velocity"] := velocity
		; returnObj["velocityTheta"] := velocityTheta
		this.cursor := returnObj		
		return returnObj
	}	
}	
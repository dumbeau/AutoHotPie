class PieItem {
    __New(pieItemSettings, _pieMenu:="",_parentMenu:=""){
        ObjMerge(this, pieItemSettings)
        this.__PieMenuParent := &_pieMenu
        this.__parentMenu := (_parentMenu) ? &_parentMenu : &_pieMenu

        this.getTextBounds() ;sets this.labelTextSize and this.sliceHotkeyTextSize
        ; this.fontColor := SubStr(RGBAtoHEX(this.pieMenu.fontColor),3)
        ; sHFC := this.pieMenu.fontColor
        ; this.sliceHotkeyFontColor := RGBAtoHEX([sHFC[1],sHFC[2],sHFC[3],125])
        ;load icon to bitmap
        if (this.icon.filePath)
            this.iconBitmap := this.iconFileToBitmap(this.icon.filePath)
	}        
    

    pieMenu[]{
		get {
			if (NumGet(this.__PieMenuParent) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__PieMenuParent)			
		}
	}

    parentMenu[]{
        get {
			if (NumGet(this.__parentMenu) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__parentMenu)			
		}        
    }

    labelTextSize := [0,0]
    sliceHotkeyTextSize := [0,0]
    iconBitmap := ""
    fontColor := ""
    labelBoundingBox := [0,0]
    
    draw(position, anchor, hovered:=false, clicked:=false, selected:=false){
        autoHotPie := this.pieMenu.applicationProfile.autoHotPie
        appearance := autoHotPie.appearance 
        pieMenu := this.pieMenu 
        displayScale := pieMenu.activeDisplay.displayScale         

        if(this.pieSubmenu){ 
            ;Draw submenu visual           
        }

        animation := appearance.animation
        animationDurationMilliseconds := (animation.enabled) ? (animation.durationSeconds*1000) : 0        
        labelTimeMilliseconds := pieMenu.pieTimeMilliseconds - pieMenu.labelDelaySeconds*1000         

        fontFamily := appearance.font.family
        fontSize := Ceil(appearance.font.size*displayScale)
        fontColorArray := (hovered) ? this.pieMenu.backgroundColor : this.pieMenu.fontColor
        ; fontColorArray := this.pieMenu.fontColor 
               

        fontOpacity := Ceil(255*Animate(labelTimeMilliseconds, animationDurationMilliseconds, "linear"))
        fontColor := SubStr(RGBAtoHEX([fontColorArray[1],fontColorArray[2],fontColorArray[3],fontOpacity]),3)        
        sliceHotkeyFontColor := SubStr(RGBAtoHEX([fontColorArray[1],fontColorArray[2],fontColorArray[3],Ceil(fontOpacity*0.5)]),3)

        iconSize := appearance.icon.size*displayScale
        iconImageDirectory := appearance.icon.sourceImageDirectory

        labelMinimumWidth := appearance.label.minimumWidth*displayScale
        labelStrokeThickness := appearance.label.strokeThickness*displayScale
        labelinnerPaddingWidth := 7*displayScale
        labelOuterPadding := [7*displayScale,5*displayScale]
        labelTextSize := [this.labelTextSize[1]*displayScale,this.labelTextSize[2]*displayScale]
        sliceHotkeyTextSize := [this.sliceHotkeyTextSize[1]*displayScale,this.sliceHotkeyTextSize[2]*displayScale]

        isSliceHotkey := (pieMenu.showSliceHotkeys && this.hotkey.ahkKey)? true : false

        ;colors 
        bgCol := this.pieMenu.backgroundColor
        bgOpacity := Ceil(255*Animate(labelTimeMilliseconds, animationDurationMilliseconds*0.7, "exponential", 0.5))
        backgroundColor := [bgCol[1],bgCol[2],bgCol[3],bgOpacity]
        ; backgroundColor := [bgCol[1],bgCol[2],bgCol[3],200]
        
        
            

        sCol := this.pieMenu.selectionColor
        sOpactiy := 255*Animate(labelTimeMilliseconds, animationDurationMilliseconds, "linear")
        selectionColor := [sCol[1],sCol[2],sCol[3],bgOpacity]

        if (hovered) {
            backgroundBrush := Gdip_BrushCreateSolid(RGBAtoHEX(selectionColor))
        } else {
            backgroundBrush := Gdip_BrushCreateSolid(RGBAtoHEX(backgroundColor))
        }  

        ;ContentBox and labelRect
        contentBox := [0,0]
        totalContentItems := -1
        if(this.text){
            totalContentItems++
            contentBox := [contentBox[1]+labelTextSize[1],labelTextSize[2]]    
        }
        if(this.icon.filePath){
            totalContentItems++
            contentBox := [contentBox[1]+iconSize,Max(iconSize,contentBox[2])]
        }
        if(isSliceHotkey){
            totalContentItems++            
            contentBox := [contentBox[1]+sliceHotkeyTextSize[1],Max(contentBox[2],sliceHotkeyTextSize[2])]
        }
        ; contentBox := [contentBox[1]+totalContentItems*labelinnerPaddingWidth,contentBox[2]]
        contentBox := [contentBox[1]+totalContentItems*labelinnerPaddingWidth,iconSize]
        labelRect := [contentBox[1]+labelOuterPadding[1]*2,contentBox[2]+labelOuterPadding[2]*2]

        ;setlabelCenterPosition
        labelCenterPosition := [0,0]
        switch anchor {
            case "left":
                labelCenterPosition := [position[1]+((labelRect[1]/2)-(labelRect[2]/2)),position[2]]
            case "center":
                labelCenterPosition := position
            case "right":
                labelCenterPosition := [position[1]-((labelRect[1]/2)-(labelRect[2]/2)),position[2]]
            default:
            labelCenterPosition := position
        }
        labelCenterPosition := [Ceil(labelCenterPosition[1]),Ceil(labelCenterPosition[2])]

        
        
        basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX(backgroundColor)) ;set last value to non-zero to see rect issue 0 means no rect is created
        Gdip_FillRoundedRectangle(G, backgroundBrush, labelCenterPosition[1]-(labelRect[1]/2), labelCenterPosition[2]-(labelRect[2]/2), labelRect[1], labelRect[2], (labelRect[2]/2)*((pieMenu.labelRoundness-2)/100))

        iconPosition := [0,0]
        labelPosition := [0,0]
        sliceHotkeyTextPosition := [0,0]
        ; nullPosition := [0,0]  
        nullPosition := [labelCenterPosition[1]-contentBox[1]/2,labelCenterPosition[2]]      
        If (anchor == "left"){            
            ;icon text slicehotkey                
            if(this.icon.filePath){
                iconPosition := [nullPosition[1],nullPosition[2]-(iconSize/2)]
                ; this.testPoint(iconPosition)
                if (totalContentItems > 0){
                    totalContentItems--
                    nullPosition := [nullPosition[1]+labelinnerPaddingWidth,nullPosition[2]]
                }
                nullPosition := [nullPosition[1]+iconSize,nullPosition[2]]
            }
            if(this.text){
                ; labelTextPosition := [nullPosition[1]+(labelTextSize[1]/2),nullPosition[2]] 
                labelTextPosition := [nullPosition[1],nullPosition[2]] 
                ; this.testPoint(labelTextPosition)
                if (totalContentItems > 0){
                    totalContentItems--
                    nullPosition := [nullPosition[1]+labelinnerPaddingWidth,nullPosition[2]]
                }
                nullPosition := [nullPosition[1]+labelTextSize[1],nullPosition[2]]
            }
            if(isSliceHotkey){
                ; sliceHotkeyTextPosition := [nullPosition[1]+(sliceHotkeyTextSize[1]/2),nullPosition[2]]
                sliceHotkeyTextPosition := [nullPosition[1],nullPosition[2]]
                ; this.testPoint(sliceHotkeyTextPosition)
                nullPosition := [nullPosition[1]+sliceHotkeyTextSize[1],nullPosition[2]]
            }            
        } else {
            ; sliceHotkey text icon            
            if(isSliceHotkey){
                sliceHotkeyTextPosition := [nullPosition[1],nullPosition[2]]                
                ; this.testPoint(sliceHotkeyTextPosition)
                if (totalContentItems > 0){
                    totalContentItems--
                    nullPosition := [nullPosition[1]+labelinnerPaddingWidth,nullPosition[2]]
                }
                    
                ; nullPosition := [nullPosition[1]+sliceHotkeyTextSize[1],nullPosition[2]]
                nullPosition := [nullPosition[1]+(sliceHotkeyTextSize[1]),nullPosition[2]]
            } 
            if(this.text){
                ; labelTextPosition := [nullPosition[1]-(labelTextSize[1]/2),nullPosition[2]]                 
                labelTextPosition := [nullPosition[1],nullPosition[2]] 
                ; this.testPoint(labelTextPosition)
                if (totalContentItems > 0){
                    totalContentItems--
                    nullPosition := [nullPosition[1]+labelinnerPaddingWidth,nullPosition[2]]
                }
                nullPosition := [nullPosition[1]+labelTextSize[1],nullPosition[2]]
            }
            if(this.icon.filePath){                
                iconPosition := [nullPosition[1],nullPosition[2]-(iconSize/2)]
                ; this.testPoint(iconPosition)
                nullPosition := [nullPomsition[1]+iconSize]
            }
        }

        if(isSliceHotkey){
            textYOffset := 1
            textOptions := % "x" Ceil(sliceHotkeyTextPosition[1]) " y" Ceil(labelCenterPosition[2]-(sliceHotkeyTextSize[2]/2)+textYOffset) " Left vCenter c" sliceHotkeyFontColor " r4 s" fontSize            
            Gdip_TextToGraphics(G, this.hotkey.abbreviation, textOptions, fontFamily)                        
        } 
        if(this.text){
            textYOffset := 1
            textOptions := % "x" Ceil(labelTextPosition[1]) " y" Ceil(labelCenterPosition[2]-(labelTextSize[2]/2)+textYOffset) " Left vCenter c" fontColor " r4 s" fontSize            
            ; if(this.text == "Item 2")
            ;     msgbox, stop
            Gdip_TextToGraphics(G, this.text, textOptions, fontFamily)
        }
        if(this.icon.filePath){
            pBitmaps := this.iconBitmap
            if (this.icon.useImageColor == false)
                {									
                colW := parentMenu.selectionColor
                If (hovered)
                    {
                        colW := backgroundColor
                        ; imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
                        imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|" . (colW[4]/255)
                    }					
                Else
                    {
                    colW := selectionColor
                    ; imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
                    imageMatrix := "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|" . (colW[4]/255) . "|0|" . (colW[1]/255) . "|" . (colW[2]/255) . "|" . (colW[3]/255) . "|0|1"
                    
                    }
                }
            Else
                imageMatrix := 1
            Gdip_DrawImage(G, pBitmaps, (iconPosition[1]), (iconPosition[2]), iconSize, iconSize,,,,,imageMatrix)
        }
        this.labelBoundingBox := [Round(contentBox[1])+labelOuterPadding[1]*2,Round(contentBox[2])+labelOuterPadding[2]*2] ;For animateOut

    
                   

        ;Anchor visual
        ; basicPenThin := Gdip_CreatePen(RGBAtoHEX(selectionColor), 3)		
        ; Gdip_DrawEllipse(G, basicPenThin, position[1], position[2], 2, 2)
	}
    animateOut(position){
        autoHotPie := this.pieMenu.applicationProfile.autoHotPie
        duration := autoHotPie.appearance.animation.durationSeconds
        cBox := this.labelBoundingBox
        StartDrawGDIP()
        ClearDrawGDIP()
        EndDrawGDIP()        
        SetUpGDIP(position[1]-(this.cBox[1]/2),position[2]-(this.cBox[2]/2),cBox[1],cBox[2])
        ; SetUpGDIP(0,0,800,800)
        
		; Gdip_SetCompositingMode(G, 0)		
		; Gdip_SetSmoothingMode(G, 4)
        
        ; animateOutFunc := this.animateOutAnimation.Bind(this)
        ; SetTimer, % animateOutFunc, % this.pieMenu.activeDisplay.refreshTimeMilliseconds
        this.animateOutAnimation(position)         
    }   
    animateOutAnimation(position){
        StartDrawGDIP()
        
        Gdip_SetCompositingMode(G, 0)		
		Gdip_SetSmoothingMode(G, 4)        
        basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([255,125,125,200])) ;set last value to non-zero to see rect issue 0 means no rect is created	
        ; this.draw(position, "center")
        Gdip_FillRectangle(G, basicBrush, 0,0,800,800)       
        
        EndDrawGDIP()        
        
    } 
    getTextBounds(){
        autoHotPie := this.pieMenu.applicationProfile.autoHotPie
        appearance := autoHotPie.appearance
        pieMenu := this.pieMenu

        heightTestText := "Wqg"
        SetUpGDIP(0, 0, 50, 50)
        StartDrawGDIP()
        if(this.text){
            fontSize := appearance.font.size            
            textOptionsTest := % "x15 y15 Center vCenter c00FFFFFF r4 s" fontSize
            labelText := this.text
            labelTextTestString := Ceil(StrSplit(Gdip_TextToGraphics(G, labelText, textOptionsTest, appearance.font.family),"|")[3])
            wTestString := Ceil(StrSplit(Gdip_TextToGraphics(G, labelText, textOptionsTest, appearance.font.family),"|")[3])
            hTestString := Ceil(StrSplit(Gdip_TextToGraphics(G, heightTestText, textOptionsTest, appearance.font.family),"|")[4])

            this.labelTextSize := [wTestString,hTestString]            
        }
        if(pieMenu.showSliceHotkeys && this.hotkey.ahkKey){
            fontSize := appearance.font.size
            textOptionsTest := % "x15 y15 Center vCenter c00FFFFFF r4 s" fontSize
            labelText := this.hotkey.abbreviation
            wTestString := Ceil(StrSplit(Gdip_TextToGraphics(G, labelText, textOptionsTest, appearance.font.family),"|")[3])
            hTestString := Ceil(StrSplit(Gdip_TextToGraphics(G, heightTestText, textOptionsTest, appearance.font.family),"|")[4])
            this.sliceHotkeyTextSize := [wTestString,hTestString]
        }
        ClearDrawGDIP()     
        EndDrawGDIP()
    }
    iconFileToBitmap(iconFileName){
        autoHotPie := this.pieMenu.applicationProfile.autoHotPie
        appearance := autoHotPie.appearance
        static iconFolder
        static userIconFolder
        userIconFolder := A_WorkingDir . "\icons"
        ; If (iconFolder == ""){
		; if( substr(appearance.icon.sourceImageDirectory, 1,13) == "%A_ScriptDir%" ){		
		; 	iconFolder := A_ScriptDir . substr(appearance.icon.sourceImageDirectory, 14)			
		; } else {
		; 	iconFolder := appearance.icon.sourceImageDirectory
		; }
        iconFile := userIconFolder . "\" . iconFileName
        return Gdip_CreateBitmapFromFile(iconFile)
    } 
    testPoint(position){
        basicPenThin := Gdip_CreatePen(RGBAtoHEX([255,0,0,255]), 3)		
        Gdip_DrawEllipse(G, basicPenThin, position[1], position[2], 1, 1)
    }  
    run(){
        print(this.text, "PieItem ran")
    } 
}                                                                                                                                                                                             
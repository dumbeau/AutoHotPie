class ProfileToggle{
__New(ProfileToggleSettings, _applicationProfile:=""){
	ObjMerge(this, ProfileToggleSettings)

	this.__Parent := &_applicationProfile

	if (this.useEnableKey == true){
	If (this.toggle == true)
		{					
		Hotkey, % this.enableKey, % this.enablePieToggle
		}
	else
		{
		Hotkey, % this.enableKey, % this.enablePieOn
		upHotkey := this.enableKey " up"
		Hotkey, % upHotkey, % this.enablePieOff
		}
	}
}

applicationProfile[]{
		get {
			if (NumGet(this.__Parent) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__Parent)			
		}
	}

pieMenuRanWithMod := false
; sendOriginalFunc := false

enablePieToggle(){
	this.toggleEnableState(this.applicationProfiles[1])
	If (!WinActive("ahk_group regApps"))
		{
		
		Hotkey, IfWinNotActive, ahk_group regApps
		}
	Else
		{
		this.toggleEnableState(this.applicationProfile)
		Hotkey, IfWinActive, % "ahk_group " . profile.groupName
		
		}
	for k, pieKey in profile.applicationProfile.pieKeys
		{
			Try Hotkey, % pieKey.hotkey, Toggle
		}
	return	
	}
enablePieOn(){
	this.pieMenuRanWithMod := false ;Necessary?				
	If (!WinActive("ahk_group regApps")) ;Default Profile
		{
		Hotkey, IfWinNotActive, ahk_group regApps
		for k, pieKey in this.pieKeys
			Hotkey, % this.pieKey.hotkey, On
		return
		}
	Else
		{	
		Hotkey, IfWinActive, % this.groupName
		for pieKeyIndex, pieKey in this.pieKeys
			Try Hotkey, % pieKey.hotkey, On				
		return
		}
	}
enablePieOff(){			
	If (!WinActive("ahk_group regApps")) ;Default Profile
		{
		Hotkey, IfWinNotActive, ahk_group regApps
		for k, pieKey in this.pieKeys
			Hotkey, % this.pieKey.hotkey, On
		}
	Else
		{	
		Hotkey, IfWinActive, % this.groupName
		for pieKeyIndex, pieKey in this.pieKeys						
			Try Hotkey, % pieKey.hotkey, On
		}							
	If (this.sendOriginalFunc == true && this.pieMenuRanWithMod == false){
		;This will send the pie enable key's original function if no function is launched
		if (StrReplace(A_ThisHotkey, " up","") == "capslock") {
			ToggleCapsLock()
		} else {
			send, % "{" . StrReplace(A_ThisHotkey, " up","") . "}"
		}					
	}
	}	

toggleEnableState(profile){			
	this.notifyPieEnableState(profile.pieEnableKey.enableState)
	profile.pieEnableKey.enableState := !profile.pieEnableKey.enableState	
	(profile.pieEnableKey.enableState) ? hotkeyStateString := "On" : "Off"

	
		
	
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

	hidePieBoundFunc := this.hidePieEnableNotification.Bind(this)
	SetTimer,% hidePieBoundFunc, -1500

	return    
}
hidePieEnableNotification(){    
	Gdip_GraphicsClear(pGraphics)    
	UpdateLayeredWindow(hwnd, hdc) 
	return
}
}
#Requires AutoHotKey v1.1.34.04+
#Persistent
#NoEnv
#SingleInstance force

ScriptStartTime := A_TickCount


#Include %A_ScriptDir%\lib\classes\PieMenuClasses\Gdip_All.ahk
#Include %A_ScriptDir%\lib\Gdip_All.ahk
#Include %A_ScriptDir%\lib\GdipHelper.ahk
#Include %A_ScriptDir%\lib\BGFunks.ahk
#Include %A_ScriptDir%\lib\Json.ahk
#Include %A_ScriptDir%\lib\classes\Display.ahk





CoordMode, Mouse, Screen
SetTitleMatchMode, RegEx ;May not need this anymore

;Check AHK version and if AHK is installed.  Prompt install or update.
if (!A_IsCompiled)
	CheckAHK()

global G
global RemapLButton := ""


;Read Json Settings file to object from AppData\Local\AutoHotPie

global UserDataFolder, Settings
global IsStandAlone := false
; loadSettingsFile() ;loads JSON to Settings global variable
;Initialize Variables and GDI+ Screen bitmap
;Tariq Porter, you will forever have a special place in my heart.

SetUpGDIP(0, 0, 50, 50)
StartDrawGDIP()
Gdip_TextToGraphics(G, "Test", "x20 y20 Center vCenter c00FFFFFF r4 s20", "Arial")
Gdip_SetCompositingMode(G, 1)
ClearDrawGDIP()
EndDrawGDIP()

; V2.0.0
AutoHotPie := new AutoHotPie(LoadSettingsFile())
class AutoHotPie {
	__New(AHPSettings){		
		this.global := Object(AHPSettings.global)
		this.global.functionConfig := "" ;Don't need this large object
		this.global.htmlAhkKeyConversionTable := ""
		this.appProfiles := []
		for k, appProfile in AHPSettings.appProfiles {	
			if (appProfile.enable == true)	
				this.appProfiles.Push(new this.AppProfile(appProfile,this))
		}
		this.display := new Display
	}
	class AppProfile {
		__New(AppProfileSettings, outer:=""){
			ObjMerge(this, AppProfileSettings)
			this.outer := {}
			ObjMerge(this.outer, outer)

			If (this.ahkHandles[1] == "ahk_group regApps") { ;This is the only place the regApps stuff is seen				
				Hotkey, IfWinNotActive, ahk_group regApps ;Need to create registered apps group				
				this.groupName := "DefaultProfile"
			}
			Else
			{
				this.groupName := StrReplace(this.ahkHandles[1], ".","")
				for k, ahkHandle in this.ahkHandles {					
					fullAHKHandle := this.appendAHKTag(ahkHandle)					
					GroupAdd, regApps, % fullAHKHandle
					GroupAdd, % this.groupName, % fullAHKHandle					
				}
				Hotkey, IfWinActive, % "ahk_group " . this.groupName
			}
			this.pieEnableKey := ObjMerge(new this.PieEnableKey(), this) ;May not need parent passed through

			this.pieKeys := []
			for k, pieKey in AppProfileSettings.pieKeys {				
				this.pieKeys.Push(new this.PieKey(pieKey, this))
			}		
		}				
		class PieKey {	
			__New(PieKeySettings, outer:=""){				
				ObjMerge(this, PieKeySettings)
				this.outer := {}
				ObjMerge(this.outer, outer)				
				this.pieMenus := []
				if (this.enable){
					print(this.outer.groupName)		
					print(this.hotkey)		
					boundFunc := this.run.Bind(this)					
					Hotkey, % this.hotkey, % boundFunc
					for k, pieMenu in PieKeySettings.pieMenus {					
						this.pieMenus.Push(new this.PieMenu(pieMenu, this))
					}
				}	
			}
			run(){ ;RunPieKey
				print(this.name,"Running Pie Menu")
				this.pieMenus[1].run()
			}

			class PieMenu {
				__New(PieMenuSettings, outer:=""){					
					ObjMerge(this, PieMenuSettings)	
					this.outer := {}
					ObjMerge(this.outer, outer)									
					this.functions := []					
					for k, pieFunction in PieMenuSettings.functions {						
						this.functions.Push(new this.PieFunction(pieFunction, this))
					}
					this.bitmapPadding := this.getBitmapPadding()
				}
				isRunning := false
				run(piePosition:=""){ ;RunPieMenu
					this.isRunning := true
					if !piePosition
					{						
						MouseGetPos, MousePositionX, MousePositionY
						piePosition := [MousePositionX,MousePositionY]
					}
					SetUpGDIP(piePosition[1]-this.bitmapPadding[1], piePosition[2]-this.bitmapPadding[2], 2*this.bitmapPadding[1], 2*this.bitmapPadding[2])					
					this.draw()
					this.isRunning := false
				}
				draw(position:=""){
					if !position
					 position := [this.bitmapPadding[1],this.bitmapPadding[2]]
					StartDrawGDIP()
					
					; ClearDrawGDIP()
					Gdip_SetSmoothingMode(G, 4)
					basicPen := Gdip_CreatePen(RGBAtoHEX(this.backgroundColor), this.thickness)
					basicPenThin := Gdip_CreatePen(RGBAtoHEX(this.backgroundColor), this.thickness/2)	
					basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([0,0,0,1])) ;Display interceptor
					; basicBrush := Gdip_BrushCreateSolid(RGBAtoHEX([255,255,255,255])) ;Display interceptor
					; Gdip_FillRectangle(G, basicBrush, 0,0,this.bitmapPadding[1]*2,this.bitmapPadding[2]*2) ;BitmapPadding copy	
					Gdip_FillRectangle(G, basicBrush, 0,0,500,500) ;BitmapPadding copy	
					Gdip_DrawEllipse(G, basicPen, (position[1]-((this.radius)+ (this.thickness / 2))), (position[2]-((this.radius)+ (this.thickness / 2))), 2*this.radius+this.thickness, 2*this.radius+this.thickness)	

					;Check distance
					selectPen := Gdip_CreatePen(RGBAtoHEX(this.selectionColor), this.thickness/2)					
					Gdip_DrawEllipse(G, selectPen, (position[1]-((this.radius)+ (this.thickness / 4))), (position[2]-((this.radius)+ (this.thickness / 4))), 2*this.radius+(this.thickness/2), 2*this.radius+(this.thickness/2))
					EndDrawGDIP()
					return
				}

				class PieFunction{
					__New(PieFunctionSettings, outer:=""){						
						ObjMerge(this, PieFunctionSettings)		
						this.outer := {}
						ObjMerge(this.outer, outer)				
					}

				}

				getBitmapPadding(){
					safetyPadding := [280,50]
					displayScale := Display.active.displayScale
					circleGraphicsRadius := (this.radius + this.thickness + this.labelRadius)	
					bitmapPadding := [circleGraphicsRadius + safetyPadding[1],circleGraphicsRadius + safetyPadding[2]]		
					bitmapPadding := [bitmapPadding[1]*displayScale,bitmapPadding[2]*displayScale]	
					return bitmapPadding					
				}
			}				
		}
		class PieEnableKey{ ;NOT WORKING
			__New(PieEnableKeySettings, outer){
				ObjMerge(this, PieEnableKeySettings)
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

			pieMenuRanWithMod := false
			; sendOriginalFunc := false

			enablePieToggle(){
				If (!WinActive("ahk_group regApps"))
				If (!WinActive("ahk_group regApps"))
					{
					this.toggleEnableState(Settings.appProfiles[1])							
					Hotkey, IfWinNotActive, ahk_group regApps
					for menus in Settings.appProfiles[1].pieKeys
						Hotkey, % Settings.appProfiles[1].pieKeys[menus].hotkey, Toggle
					return
					}
				Else
					{
					this.toggleEnableState(this.outer)
					for ahkHandleIndex, ahkHandle in this.outer.ahkHandles
					{
						Hotkey, IfWinActive, % ahkHandle
						for pieKeyIndex, pieKey in this.outer.pieKeys
						{
							; msgbox, % pieKey.hotkey
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
			}
			toggleEnableState(profile){			
				this.notifyPieEnableState(profile.pieEnableKey.enableState)
				profile.pieEnableKey.enableState := !profile.pieEnableKey.enableState	
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
		
		
		appendAHKTag(processString){
				if (processString == "explorer.exe"){
					return "ahk_class CabinetWClass"
				} else {
					return "ahk_exe " . processString
				}
			}
		}
}

; global pieDPIScale
getMonitorCoords(Mon.left , Mon.right , Mon.top , Mon.bottom )

;Init G Text


;Set up icon menu tray options
if (A_IsCompiled){
	if (!IsStandAlone){
		Menu, Tray, Add , AutoHotPie Settings, openSettings
	}
	Menu, Tray, NoStandard	
	Menu, Tray, Add , Restart, Rel
	Menu, Tray, Add , Exit, QuitPieMenus
	Menu, Tray, Tip , AutoHotPie		
} else {
	if (!IsStandAlone){
		Menu, Tray, Add , AutoHotPie Settings, openSettings
	}
	Menu, Tray, Add , Restart, Rel		
}
if (!IsStandAlone){
	Menu, Tray, Default , AutoHotPie Settings
}

print("AutoHotPie loaded in " . A_TickCount - ScriptStartTime . " ms" )
return ;End Initialization


#IfWinActive, ahk_exe AutoHotPie.exe
~LButton up::
	sleep,200
	if WinExist("ahk_exe AutoHotPie.exe")
		exitapp
	return
~Enter up::
	sleep,200
	if WinExist("AutoHotPie Uninstall")
		exitapp
	return
#IfWinActive, ahk_exe Un_A.exe
~LButton up::
	sleep,100
	if WinExist("AutoHotPie Uninstall")
		exitapp
	return
~Enter up::
	sleep,100
	if WinExist("AutoHotPie Uninstall")
		exitapp
	return
#IfWinActive, AutoHotPie Setup
~LButton up::
	sleep,100
	if WinExist("AutoHotPie Setup")
		exitapp
	return
~Enter up::
	sleep,100
	if WinExist("AutoHotPie Setup")
		exitapp
	return

#If (PieLaunchedState == 1)
LButton::
	LMB.pressed := true
	; PenClicked := true 
	;Check pie launched state again?
	Return
LButton up::	
	LMB.pressed := false
	; PenClicked := false
	;Check pie launched state again?
	Return

;For mouseClick function
#If (RemapLButton == "right")
LButton::RButton
#If (RemapLButton == "middle")
LButton::MButton
#If ;This ends the context-sensitivity

SliceHotkeyPress:
	SliceHotkey.pressed := true
	return
SliceHotkeyRelease:
	SliceHotkey.pressed := false
	return
ExitKeyPress:
	ExitKey.pressed := true
	return
ExitKeyRelease:
	ExitKey.pressed := false
	return


~esc::
if (settings.global.enableEscapeKeyMenuCancel)
	PieLaunchedState := false
return

;If a display is connected or disconnected
OnMessage(0x7E, "WM_DISPLAYCHANGE")
return
WM_DISPLAYCHANGE(wParam, lParam)
	{
	sleep, 200
	Reload
	return
	}

Rel:
	Reload
	Return

openSettings:
	pie_openSettings()
	Return

QuitPieMenus:
	exitapp
	return

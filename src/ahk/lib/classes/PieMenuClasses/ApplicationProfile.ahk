class ApplicationProfile {
	__New(ApplicationProfileSettings, _autoHotPie:=""){
		ObjMerge(this, ApplicationProfileSettings)
		this.__Parent := &_autoHotPie

		this.group := {}
		(this.ahkHandles[1] == "ahk_group regApps") ? this.group.mode := "IfWinNotActive" : "IfWinActive"	
		this.group.name := StrReplace(StrReplace(this.ahkHandles[1], ".",""),"ahk_group ","")	

		;Create ahk_group for profile.		
		for k, ahkHandle in this.ahkHandles {					
			fullAHKHandle := this.prependAHKTag(ahkHandle)			
			GroupAdd, regApps, % fullAHKHandle
			GroupAdd, % this.group.name, % fullAHKHandle					
		}
		this.getHotkeyGroupContext()
		
		this.profileToggle := ObjMerge(new this.ProfileToggle(), this) ;May not need parent passed through

		this.pieMenus := []
		for k, pieMenu in ApplicationProfileSettings.pieMenus {				
			this.pieMenus.Push(new this.PieMenu(pieMenu, this))
		}		
	}

	autoHotPie[]{
		get {
			if (NumGet(this.__Parent) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__Parent)			
		}
	}

	setHotkeyGroupContext(){
		;Sets hotkeys after this function to be context-sensitive to their application profile.
		Hotkey, % this.group.mode, % "ahk_group " . this.group.name
	}

	#Include PieMenu.ahk
	#Include ProfileToggle.ahk

	prependAHKTag(processString){
			if (processString == "explorer.exe"){
				return "ahk_class CabinetWClass"
			} else {
				return "ahk_exe " . processString
			}
		}
	}
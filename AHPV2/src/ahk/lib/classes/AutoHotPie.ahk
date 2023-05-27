#Include %A_LineFile%\..\PieMenuClasses\
Display := new Display()
class AutoHotPie {
	__New(AHPSettings){
		ObjMerge(this,AHPSettings)
		this.functionConfig := {} ;Don't need this large object!!!	
		this.applicationProfiles := []
		for k, applicationProfile in AHPSettings.applicationProfiles {
			if (applicationProfile.enabled == true)	
				this.applicationProfiles.Push(new this.applicationProfile(applicationProfile,this))
		}
	}
	#Include ApplicationProfile.ahk
}
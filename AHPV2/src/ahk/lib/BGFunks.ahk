Animate(timeMilliseconds,durationMilliseconds,interpolationMode="linear",exponent=2,min=0,max=1){
    if(timeMilliseconds > durationMilliseconds)
        return 1
    Switch interpolationMode{
        case "linear":            
            return ((1/durationMilliseconds)*timeMilliseconds)*(max-min)+min
        case "easeOutSine":
            return (max-min)+min
        case "exponential":			
            return (( -(1/(durationMilliseconds**exponent) )*(-timeMilliseconds+durationMilliseconds)**exponent )+1)*(max-min)+min
        default:
            msgbox, % interpolationMode . " is not a valid interpolation mode."
        return
    }
}

ValidateFontFamily(fontFamily){
	SetUpGDIP(0, 0, 50, 50)
	StartDrawGDIP()	
	verifyTextString := Ceil(StrSplit(Gdip_TextToGraphics(G, "TestWQMq|", "x20 y20 Center vCenter c00FFFFFF r4 s20", fontFamily),"|")[3])
	If (verifyTextString < 2){
		sleep, 200
		Reload
		sleep, 1000
	}	
	Gdip_SetCompositingMode(G, 1)
	ClearDrawGDIP()
	EndDrawGDIP()
}

getMonitorCoords(ByRef monLeft, ByRef monTop, ByRef monRight, ByRef monBottom)
	{
	global monitorManager := New MonitorManager
	; msgbox, % monitorManager.monitors[1].dpiX
	monLeft := 0
	monRight := 0
	monTop := 0
	monBottom := 0
	loop
		{
		Sysget, testMon, Monitor, 1
		if testMonLeft is number
			Break
		sleep, 100
		}	
	;Get the number of monitors from the monitor manager.
	numMonitors := 0	
	for monIndex in monitorManager.monitors
		{
		;Count monitors
		if (IsObject(monitorManager.monitors[monIndex]))
		numMonitors := numMonitors+1
		;Determine maximum area, only disregard scaling when true/pm is enabled in the compile.
		if (monLeft > monitorManager.monitors[monIndex].left)
		monLeft := monitorManager.monitors[monIndex].left
		if (monRight < monitorManager.monitors[monIndex].right)
		monRight := monitorManager.monitors[monIndex].right
		if (monTop > monitorManager.monitors[monIndex].top)
		monTop := monitorManager.monitors[monIndex].top
		if (monBottom < monitorManager.monitors[monIndex].bottom)
		monBottom := monitorManager.monitors[monIndex].bottom
		; msgbox, %monIndex% "left:"%monLeft%" Top:"%monTop%" Right:"%monRight%" Bottom:"%monBottom%
		}
	return
	}

StripModifierCharacters(var, chars="+^!#")
	{
	   stringreplace,var,var,%A_space%,_,a
	   loop, parse, chars,
	      stringreplace,var,var,%A_loopfield%,,a
	   return var
	}

class Math {
	cycleRange(var, range=360){
		var := var - (range*Floor((var / range)))
		return var
	}
	calcAngle(aX, aY, bX, bY)
	{
		initVal := (dllcall("msvcrt\atan2","Double",(bY-aY), "Double",(bX-aX), "CDECL Double")*57.29578)
		
		If initVal < 0
			returnVal := (initVal+360)
		Else
			returnVal := initVal
		print("angle = " . initVal . " return = " . returnVal)
		return returnVal
	}

}

CheckAHK()
	{
	AHKVersion := StrReplace(A_AHKVersion, ".","")
	; msgbox, % AHKVersion < 113202
	; If ( A_IsCompiled AND A_AhkPath="" AND (AHKVersion < 113201)) 
	If (AHKVersion < 113310) 
	{
	 MsgBox, 4, ,Autohotkey needs to be installed/updated to run the Pie Menu apps, Install Autohotkey?
	 IfMsgBox, Yes
		{
		UrlDownloadToFile, https://autohotkey.com/download/ahk-install.exe
						, %A_Temp%\AutoHotkeyInstall.exe
		Run, %A_Temp%\AutoHotkeyInstall.exe
		exitapp
		}
	IfMsgBox, No
		{
		Msgbox, ...okay then.  I'll just, chill in this corner.  Don't mind me.  Let me know if you ever want some pie or anything.
		exitapp
		}
	ExitApp
	}
}
ObjMerge(OrigObj, MergingObj, MergeBase=True) {
	If !IsObject(OrigObj) || !IsObject(MergingObj)
		Return False
	For k, v in MergingObj 
		ObjInsert(OrigObj, k, v)
	if MergeBase && IsObject(MergingObj.base) {
		If !IsObject(OrigObj.base) 
			OrigObj.base := []
		For k, v in MergingObj.base 
			ObjInsert(OrigObj.base, k, v)		
	}	
	Return True
}

LoadSettingsFile(){
	FileEncoding, UTF-8
	;Keep the settings file light
	;The larger the JSON file is, the longer this will take to startup.
	Try{
		;Try loading from local directory
			UserDataFolder := A_ScriptDir . "\"			
			loopFileFound := false
			Loop, Files, %A_ScriptDir%\*.json, F
			{				
				settingsFilePath := A_LoopFileFullPath
				FileRead, Settings, %settingsFilePath%	
				
				Settings := Json.Load(Settings)
				If (ErrorLevel)					
					break
				loopFileFound := true				
				break
			}
			if (loopFileFound){
				IsStandalone := true
				return Settings
			} else {
				;Try opening from User AppData folder
				settingsFileName := "AHPSettings.json"
				UserDataFolder := A_AppData . "\AutoHotPie"
				settingsFilePath := UserDataFolder . "\" . settingsFileName	
				if ( FileExist(UserDataFolder) ){
					FileRead, Settings, %settingsFilePath%					
					Settings := Json.Load(Settings)					
				} else {
					;Try to open AHP Settings
					AHPSettingsOpened := pie_openSettings()
					if (AHPSettingsOpened == false){
						Msgbox, % "No valid settings file found.`n`nPlace a valid settings file here and relaunch to load manually:`n" . UserDataFolder . "`n`nFolder will be opened when this message box is closed."
						Run, %UserDataFolder%
						exitapp
					}
				}				
			}
		SetWorkingDir, %UserDataFolder%	
		;Try loading from AppData Folder
		return Settings
	} catch e {
		msgbox, % "Settings file is invalid JSON.`n`nNo Pie Menus for you :(`n`nFix settings file at:`n" . settingsFilePath
		pie_openSettings()
		Exitapp	
	}
}


EmptyMem(){
    pid:= DllCall("GetCurrentProcessId")
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
}

CycleRange(var, range=360){
	var := var - (range*Floor((var / range)))
	return var
	}

getActiveMonitorDPI(){
	print("Replace the getActiveMonitorDPI function")
}
getActiveMonitorDimensions(){
	print("Replace the getActiveMonitorDimensions function")
}

RGBAtoHEX(RGBA) ;Converts RGBA array to HEX RGB
	{
	rHex := Format("0x{4:02x}{1:02x}{2:02x}{3:02x}", RGBA*)	
	return rHex
	}
whitenRGB(RGBAarray)
	{
	NewRGBA := [0, 0, 0, 255]
	loop 3
		{
		NewRGBA[A_Index] := RGBAarray[A_Index]+20		
		}
	; msgbox, % RGBAarray[1] "," RGBAarray[2] "," RGBAarray[3]
	return NewRGBA
	}
ExtendAlongAngle(iPos, theta, distance)
	{		
		fPosX := Round(iPos[1]+(distance*Cos((theta-90)*0.01745329252)))		
		fPosY := Round(iPos[2]+(distance*Sin((theta-90)*0.01745329252)))
		; msgbox, % iPos[1] . " " . iPos[2] . "`n" . fPosX . " " . fPosY
		return [fPosX, fPosY]
	}	
hasValue(var, arr) {
	arrOfKeys := []
	for key, value in arr
		if (value == var)
			arrOfKeys.Push(key)
	return (arrOfKeys.Length() = 0) ? false : arrOfKeys
	}

AppendAHKTag(processString){
	; msgbox, % processString
	if (processString == "explorer.exe"){
		return "ahk_class CabinetWClass"
	} else {
		return "ahk_exe " . processString
	}
}
LogTime(showTimeThreshold:=0){
	static lastTime
	if !lastTime
		lastTime := 0
	thisTime := A_TickCount
	timeInterval := thisTime - lastTime
	if (timeInterval > showTimeThreshold || showTimeThreshold == 0)
		print(timeInterval)
	lastTime := thisTime
}

print(value,varName=""){
	if (value == ""){
		if(varName != ""){
			OutputDebug, % varName . ": null`n"
		}else{
			OutputDebug, % "null`n"
		}		
		return
	}
	if (DebugMode == false)		
		return		
	if (IsObject(value)) ;Array or Object
	{
		showArrString := ""
		for k, val in value
		{
			if (k == 1) {
				showArrString := "1: " . val
			} else {
				if(varName != ""){
					showArrString := showArrString . "`n`t" . k . ": " . val
				}else{
					showArrString := showArrString . "`n" . k . ": " . val				
				}
			}
		}
		if(varName != ""){
			showArrString := varName . ":`n`t" . showArrString
		}
		OutputDebug, % showArrString . "`n"	
		return
	} else { ;Number or string
		if(varName != ""){
			value := varName . ": " . value
		}
		OutputDebug, % value . "`n"
		return
	}	
}

;For mouseClick pie function
lButtonWait(clickButton,sleepTime=3){	
	loop
		{
		Sleep, %sleepTime%
		if GetKeyState("LButton", "P")
			{				
			; MouseClick, %clickButton%, , , ,0, D
			loop
				{
				sleep, %sleepTime%
				If !GetKeyState("LButton", "P"){
					; MouseClick, %clickButton%, , , ,0, U
					return
				}
				}			
			}
		}
}

ToggleCapsLock(){
	if GetKeyState("CapsLock", "T") = 1
	{	
	SetCapsLockState, off
	}
	else if GetKeyState("CapsLock", "F") = 0
	{	
	SetCapsLockState, on
	}
}


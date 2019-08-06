getMonitorCoords(ByRef monLeft, ByRef monTop, ByRef monRight, ByRef monBottom)
	{
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
	Sysget, numMonitors, MonitorCount
	loop, %numMonitors%
		{
		SysGet, iMon, Monitor, %A_Index%	
		if monLeft > %iMonLeft%
		monLeft = %iMonLeft%
		if monRight < %iMonRight%
		monRight = %iMonRight%
		if monTop > %iMonTop%
		monTop = %iMonTop%
		if monBottom < %iMonBottom%
		monBottom = %iMonBottom%
		; msgbox, "left:"%iMonLeft%" Top:"%iMonTop%" Right:"%iMonRight%" Bottom:"%iMonBottom%"."
		; msgbox, "left:"%monLeft%" Top:"%monTop%" Right:"%monRight%" Bottom:"%monBottom%"."
		}
	return
	}

calcAngle(aX, aY, bX, bY)
	{
	initVal := (dllcall("msvcrt\atan2","Double",(bY-aY), "Double",(bX-aX), "CDECL Double")*57.29578)
	If initVal < 0
		returnVal := (initVal+360)
	Else
		returnVal := initVal
	return returnVal
	}

checkAHK()
	{
	AHKVersion := StrReplace(A_AHKVersion, ".","")
	If ( A_IsCompiled AND A_AhkPath="" AND (AHKVersion >= 113001)) 
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

drawPie(G, xPos, yPos, dist, theta, numSlices, radius, thickness, bgColor, selectColor)
	{
	nTheta := Round(theta/(360/numSlices))*(360/numSlices)
	gmx := xPos-monLeft
	gmy := yPos-monTop
	ClearDrawGDIP()
	Gdip_SetSmoothingMode(G, 4)
	basicPen := Gdip_CreatePen(bgColor, thickness)
	Gdip_DrawEllipse(G, basicPen, (gmx-(radius / 2)), (gmy-(radius / 2)), radius, radius)
	If (dist <= ((radius/2)+(thickness/2)))
	{
	selectPen := Gdip_CreatePen(selectColor, thickness/2)
	Gdip_DrawEllipse(G, selectPen, (gmx-(radius / 2)), (gmy-(radius / 2)), radius, radius)
	pieRegion := 0
	}
	Else
	{
	selectPen := Gdip_CreatePen(selectColor, thickness)	
	Gdip_DrawArc(G, selectPen, (gmx-(radius/2)), (gmy-(radius/2)), radius, radius, (nTheta-(180/numSlices)), (360/numSlices))	
	pieRegion := Round(theta/(360/numSlices))+1	
	If (pieRegion == (numSlices + 1))
		pieRegion := 1
	}
	; Gdip_DeletePen(basicPen)
	; Gdip_DeletePen(selectPen)
	EndDrawGDIP()
	return pieRegion
	}

Class profile{
	
	}
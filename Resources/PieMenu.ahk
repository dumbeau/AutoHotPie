#Persistent
#SingleInstance ignore
#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk
CoordMode, Mouse, Screen
runPieMenu(profileNum, index)
	{
	global
	MouseGetPos, iMouseX, iMouseY
	StartDrawGDIP()
	PieRegion := 0
	iPieRegion := drawPie(G, iMouseX, iMouseY, 0, 0, settings[profileNum].pieMenus[index].numSlices, settings[profileNum].pieMenus[index].radius, settings[profileNum].pieMenus[index].thickness, settings[profileNum].pieMenus[index].bgColor, settings[profileNum].pieMenus[index].selColor)
	loop
		{
		if !GetKeyState(settings[profileNum].pieMenus[index].hotkey, "P")
			Break
		MouseGetPos, mouseX, mouseY
		;Calculate Distance and Angle
		dist := (Sqrt((Abs(mouseX-iMouseX)**2) + (Abs(mouseY-iMouseY)**2)))
		theta := calcAngle(iMouseX, iMouseY, mouseX, mouseY)
		If (dist <= ((settings[profileNum].pieMenus[index].radius/2)+(settings[profileNum].pieMenus[index].thickness/2)))
		{
		pieRegion := 0
		}
		Else
		{
		pieRegion := Round(theta/(360/settings[profileNum].pieMenus[index].numSlices))+1	
		If (pieRegion == (settings[profileNum].pieMenus[index].numSlices + 1))
			pieRegion := 1
		}
		If (pieRegion != iPieRegion)
			{
			StartDrawGDIP()	
			iPieRegion := drawPie(G, iMouseX, iMouseY, dist, theta, settings[profileNum].pieMenus[index].numSlices, settings[profileNum].pieMenus[index].radius, settings[profileNum].pieMenus[index].thickness, settings[profileNum].pieMenus[index].bgColor, settings[profileNum].pieMenus[index].selColor)
			}
		sleep 20
		}
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()
	return %pieRegion%
}

;Check AHK version and if AHK is installed.  Prompt install or update.
checkAHK()

;Initialize Variables and GDI+ Screen bitmap
	;Thank you Tariq Porter
	; monLeft := 0 monRight := 0 monTop := 0 monBottom := 0
	global monLeft := 0
	global monRight := 0
	global monTop := 0
	global monBottom := 0
	getMonitorCoords(monLeft, monTop, monRight, monBottom)
	SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop)
;Read Json Settings file to object
	FileRead, settings, %A_ScriptDir%\settings.json
	global settings := Jxon_Load(settings)
msgbox, hi
;If a display is connected or disconnected
	OnMessage(0x7E, "WM_DISPLAYCHANGE")
	return
	WM_DISPLAYCHANGE(wParam, lParam)
		{
		sleep, 200
		Reload
		}

;Include for all of the shortcuts

;Default Profile

Hotkey, IfWinActive, ahk_class Notepad
Hotkey, r, pieLabel

pieLabel:
    runPieMenu(1, 1)
    return


i::
exitapp
return



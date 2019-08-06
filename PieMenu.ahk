#Persistent
#SingleInstance ignore
#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk

CoordMode, Mouse, Screen

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
	FileRead, settings, %A_ScriptDir%\Resources\settings.json
	settings := Jxon_Load(settings)

;If a display is connected or disconnected
	OnMessage(0x7E, "WM_DISPLAYCHANGE")
	return
	WM_DISPLAYCHANGE(wParam, lParam)
		{
		sleep, 200
		Reload
		}

;Include for all of the shortcuts
;#Include %A_ScriptDir%\Resources\lib\AppendScript.ahk


Hotkey, g, MyLabel


MyLabel:
msgbox, hi
MouseGetPos, iMouseX, iMouseY
StartDrawGDIP()
PieRegion := 0
iPieRegion := drawPie(G, iMouseX, iMouseY, 0, 0, settings[1].pieMenus[1].numSlices, settings[1].pieMenus[1].radius, settings[1].pieMenus[1].thickness, settings[1].pieMenus[1].bgColor, settings[1].pieMenus[1].selColor)
loop
	{
	if !GetKeyState(%A_ThisHotkey%, "P")
		Break
	MouseGetPos, mouseX, mouseY
	;Calculate Distance and Angle
	dist := (Sqrt((Abs(mouseX-iMouseX)**2) + (Abs(mouseY-iMouseY)**2)))
	theta := calcAngle(iMouseX, iMouseY, mouseX, mouseY)
	If (dist <= ((settings[1].pieMenus[1].radius/2)+(settings[1].pieMenus[1].thickness/2)))
	{
	pieRegion := 0
	}
	Else
	{	
	pieRegion := Round(theta/(360/settings[1].pieMenus[1].numSlices))+1	
	If (pieRegion == (settings[1].pieMenus[1].numSlices + 1))
		pieRegion := 1
	}
	If (pieRegion != iPieRegion)
		{
		StartDrawGDIP()	
		iPieRegion := drawPie(G, iMouseX, iMouseY, dist, theta, settings[1].pieMenus[1].numSlices, settings[1].pieMenus[1].radius, settings[1].pieMenus[1].thickness, settings[1].pieMenus[1].bgColor, settings[1].pieMenus[1].selColor)
		}
	sleep 20
	}
msgbox, %pieRegion%
StartDrawGDIP()
ClearDrawGDIP()
EndDrawGDIP()
return


i::
exitapp
return



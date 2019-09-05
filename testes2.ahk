#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk

;Initialize Variables and GDI+ Screen bitmap
	;Thank you Tariq Porter
	; monLeft := 0 monRight := 0 monTop := 0 monBottom := 0
	global monLeft := 0
	global monRight := 0
	global monTop := 0
	global monBottom := 0
	getMonitorCoords(monLeft, monTop, monRight, monBottom)
	SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop)

#InstallKeybdHook
KeyHistory
Gui, +AlwaysOnTop -SysMenu +Owner +LastFound  ; +Owner avoids a taskbar button.
; MyGui := WinExist()
WinGet, MyGui, ControlListHwnd, A
tabletPressure:=0 
msgbox, %MyGui%
TabletInit(MyGui)

return

b::
	loop
		{
		pieTipText("Pressure is = "%tabletPressure%)
		sleep, 1000
		if GetKeyState("n","P")
			break
		}
return

	
Escape::
	if(hwintab32)
		DllCall("FreeLibrary", UInt, hwintab32)
	ExitApp	

TABLETPACKET(wParam, lParam)
{
	global
	VarSetCapacity(packet, 4, 0) ; pressure only = size 4
	; we get a packet that exactly fits in size to the data we requested with lcPktData, in this case only pressure
	hWTPacket := DllCall( "wintab32\WTPacket", "int", lParam, "int", wParam, "int", &packet)
	tabletPressure := NumGet(packet, 0, "int") ; pressure -> 0 offset
	VarSetCapacity(packet, 0) ; free packet memory
}

TabletInit(receivingHwnd)
{
	global
	
	; offsets into structure passed to WTOpenA 
	lcOptions := 40
	lcMsgBase := 52 ; windows message ID
	lcPktData := 64 ; requested items delivered in package
	lcPktMode := 68
	
	; options for WTOpenA call
	CXO_MESSAGES := 0x0004 ; request windows messages
	CXO_SYSTEM := 0x0001 ; pass packet on to system
	
	; items that can be requested to be received in the packets, we use only PK_NORMAL_PRESSURE
	PK_CURSOR := 0x0020	; reporting cursor 
	PK_BUTTONS := 0x0040 ; button information 
	PK_X := 0x0080 ; x axis 
	PK_Y := 0x0100 ; y axis
	PK_Z := 0x0200 ; z axis
	PK_NORMAL_PRESSURE := 0x0400 ; normal or tip pressure 
	PK_TANGENT_PRESSURE := 0x0800 ; tangential or barrel pressure 
	PK_ORIENTATION := 0x1000 ; orientation info: tilts 
	PK_ROTATION := 0x2000 ; rotation info; 1.1 
	
	hwintab32 := DllCall( "LoadLibrary", "str", "wintab32" )
	VarSetCapacity(logcontext, 172, 0)
	hWTInfoA := DllCall( "wintab32\WTInfoA", "int", 3, "int", 0, "int", &logcontext )
	MsgBase := NumGet(logcontext, lcMsgBase, "UInt")
	Options := NumGet(logcontext, lcOptions, "UInt")
	NumPut(Options|CXO_MESSAGES|CXO_SYSTEM, logcontext, lcOptions, "UInt") ; request to get windows messages
	; NumPut(PK_NORMAL_PRESSURE, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(PK_NORMAL_PRESSURE, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(0, logcontext, lcPktMode, "UInt")
	hWTOpenA := DllCall( "wintab32\WTOpenA", "int", receivingHwnd, "int", &logcontext, "int", -0x01 )
	OnMessage(MsgBase, "TABLETPACKET")	
}

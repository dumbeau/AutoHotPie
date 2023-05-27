;Beau's summary
;PK_X and PK_Y only change when the pen is active, they don't respond to the mouse.
;Normal pressure is the key here to sensing the pen
;The GUI control is necessary for intercepting the pen, so the pie menu GUI may have to go full screen if the pen is used.

;Turn this into a class type.


Gui, +AlwaysOnTop -SysMenu +Owner +LastFound  ; +Owner avoids a taskbar button.
MyGui := WinExist()

tabletPressure:=0 
TabletInit(MyGui)
return

LButton::
	b_pressed := true
	while(b_pressed) ; GetKeyState doesn't work with tablet for some reason
	{
		sleep, 50
		print(tabletPressure,"tablet pressure")
	}
	
LButton up::
	; b_pressed := false
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
	
	hwintab32 :=	DllCall( "LoadLibrary", "str", "wintab32" )
	VarSetCapacity(logcontext, 172, 0)
	hWTInfoA := DllCall( "wintab32\WTInfoA", "int", 3, "int", 0, "int", &logcontext )
	MsgBase := NumGet(logcontext, lcMsgBase, "UInt")
	Options := NumGet(logcontext, lcOptions, "UInt")
	NumPut(Options|CXO_MESSAGES|CXO_SYSTEM, logcontext, lcOptions, "UInt") ; request to get windows messages
	; NumPut(PK_NORMAL_PRESSURE, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(PK_X, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(0, logcontext, lcPktMode, "UInt")
	hWTOpenA := DllCall( "wintab32\WTOpenA", "int", receivingHwnd, "int", &logcontext, "int", -0x01 )
	OnMessage(MsgBase, "TABLETPACKET")	
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


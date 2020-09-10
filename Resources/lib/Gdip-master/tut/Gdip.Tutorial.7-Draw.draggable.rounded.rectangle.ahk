; gdi+ ahk tutorial 7 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Tutorial to draw a rounded rectangle as a gui that you can drag

#SingleInstance, Force
#NoEnv
SetBatchLines, -1

; Uncomment if Gdip.ahk is not in your standard library
;#Include, Gdip.ahk

; Start gdi+
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
OnExit, Exit

; Set the width and height we want as our drawing area, to draw everything in. This will be the dimensions of our bitmap
Width := 300, Height := 200

; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs

; Show the window
Gui, 1: Show, NA

; Get a handle to this window we have created in order to update it later
hwnd1 := WinExist()

; Create a gdi bitmap with width and height of what we are going to draw into it. This is the entire drawing area for everything
hbm := CreateDIBSection(Width, Height)

; Get a device context compatible with the screen
hdc := CreateCompatibleDC()

; Select the bitmap into the device context
obm := SelectObject(hdc, hbm)

; Get a pointer to the graphics of the bitmap, for use with drawing functions
G := Gdip_GraphicsFromHDC(hdc)

; Set the smoothing mode to antialias = 4 to make shapes appear smother (only used for vector drawing and filling)
Gdip_SetSmoothingMode(G, 4)

; Create a partially transparent, black brush (ARGB = Transparency, red, green, blue) to draw a rounded rectangle with
pBrush := Gdip_BrushCreateSolid(0x77000000)

; Fill the graphics of the bitmap with a rounded rectangle using the brush created
; Filling the entire graphics - from coordinates (0, 0) the entire width and height
; The last parameter (20) is the radius of the circles used for the rounded corners
Gdip_FillRoundedRectangle(G, pBrush, 0, 0, Width, Height, 20)

; Delete the brush as it is no longer needed and wastes memory
Gdip_DeleteBrush(pBrush)


; Update the specified window we have created (hwnd1) with a handle to our bitmap (hdc), specifying the x,y,w,h we want it positioned on our screen
; With some simple maths we can place the gui in the centre of our primary monitor horizontally and vertically at the specified heigth and width
UpdateLayeredWindow(hwnd1, hdc, (A_ScreenWidth-Width)//2, (A_ScreenHeight-Height)//2, Width, Height)

; By placing this OnMessage here. The function WM_LBUTTONDOWN will be called every time the user left clicks on the gui
OnMessage(0x201, "WM_LBUTTONDOWN")


; Select the object back into the hdc
SelectObject(hdc, obm)

; Now the bitmap may be deleted
DeleteObject(hbm)

; Also the device context related to the bitmap may be deleted
DeleteDC(hdc)

; The graphics may now be deleted
Gdip_DeleteGraphics(G)
Return

;#######################################################################

; This function is called every time the user clicks on the gui
; The PostMessage will act on the last found window (this being the gui that launched the subroutine, hence the last parameter not being needed)
WM_LBUTTONDOWN()
{
	PostMessage, 0xA1, 2
}

;#######################################################################

Exit:
; gdi+ may now be shutdown on exiting the program
Gdip_Shutdown(pToken)
ExitApp
Return
; gdi+ ahk tutorial 8 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Tutorial to write text onto a gui

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
Gui, 1: Add, Edit, w%Width% h20 y300, vMeEdit
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
pBrush := Gdip_BrushCreateSolid(0xaa000000)

; Fill the graphics of the bitmap with a rounded rectangle using the brush created
; Filling the entire graphics - from coordinates (0, 0) the entire width and height
; The last parameter (20) is the radius of the circles used for the rounded corners
Gdip_FillRoundedRectangle(G, pBrush, 0, 0, Width, Height, 20)

; Delete the brush as it is no longer needed and wastes memory
Gdip_DeleteBrush(pBrush)

; We can specify the font to use. Here we use Arial as most systems should have this installed
Font = Arial
; Next we can check that the user actually has the font that we wish them to use
; If they do not then we can do something about it. I choose to give a wraning and exit!
If !Gdip_FontFamilyCreate(Font)
{
   MsgBox, 48, Font error!, The font you have specified does not exist on the system
   ExitApp
}

; There are a lot of things to cover with the function Gdip_TextToGraphics

; The 1st parameter is the graphics we wish to use (our canvas)

; The 2nd parameter is the text we wish to write. It can include new lines `n

; The 3rd parameter, the options are where all the action takes place...
; You can write literal x and y coordinates such as x20 y50 which would place the text at that position in pixels
; or you can include the last 2 parameters (Width and Height of the Graphics we will use) and then you can use x10p
; which will place the text at 10% of the width and y30p which is 30% of the height
; The same percentage marker may be used for width and height also, so w80p makes the bounding box of the rectangle the text
; will be written to 80% of the width of the graphics. If either is missed (as I have missed height) then the height of the bounding
; box will be made to be the height of the graphics, so 100%

; Any of the following words may be used also: Regular,Bold,Italic,BoldItalic,Underline,Strikeout to perform their associated action

; To justify the text any of the following may be used: Near,Left,Centre,Center,Far,Right with different spelling of words for convenience

; The rendering hint (the quality of the antialiasing of the text) can be specified with r, whose values may be:
; SystemDefault = 0
; SingleBitPerPixelGridFit = 1
; SingleBitPerPixel = 2
; AntiAliasGridFit = 3
; AntiAlias = 4

; The size can simply be specified with s

; The colour and opacity can be specified for the text also by specifying the ARGB as demonstrated with other functions such as the brush
; So cffff0000 would make a fully opaque red brush, so it is: cARGB (the literal letter c, follwed by the ARGB)

; The 4th parameter is the name of the font you wish to use

; As mentioned previously, you don not need to specify the last 2 parameters, the width and height, unless
; you are planning on using the p option with the x,y,w,h to use the percentage
Options = x10p y30p w80p Centre cbbffffff r4 s20 Underline Italic
Gdip_TextToGraphics(G, "Tutorial 8`n`nThank you for trying this example", Options, Font, Width, Height)


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
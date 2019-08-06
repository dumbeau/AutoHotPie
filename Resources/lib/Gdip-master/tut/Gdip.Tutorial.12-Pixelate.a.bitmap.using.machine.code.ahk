; gdi+ ahk tutorial 12 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Tutorial to pixelate a bitmap using machine code

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

; Create a layered window that is always on top as usual and get a handle to the window
Gui, 1: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop
Gui, 1: Show, NA
hwnd1 := WinExist()

; If the image we want to work with does not exist on disk, then download it...
If !FileExist("MJ.jpg")
	UrlDownloadToFile, http://www.autohotkey.net/~tic/MJ.jpg, MJ.jpg

; Get a bitmap from the image
pBitmap := Gdip_CreateBitmapFromFile("MJ.jpg")
;pBitmap := Gdip_BitmapFromScreen()
If !pBitmap
{
	MsgBox, 48, File loading error!, Could not load the image specified
	ExitApp
}
; Get the width and height of the bitmap we have just created from the file
Width := Gdip_GetImageWidth(pBitmap), Height := Gdip_GetImageHeight(pBitmap)

; We also need to create
pBitmapOut := Gdip_CreateBitmap(Width, Height)

; As normal create a gdi bitmap and get the graphics for it to draw into
hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
G := Gdip_GraphicsFromHDC(hdc)

; Call WM_LBUTTONDOWN every time the gui is clicked, to allow it to be dragged
OnMessage(0x201, "WM_LBUTTONDOWN")

; Update the window with the hdc so that it has a position and dimension for future calls to not
; have to explicitly pass them
UpdateLayeredWindow(hwnd1, hdc, (A_ScreenWidth-Width)//2, (A_ScreenHeight-Height)//2, Width, Height)

; Set a timer to update the gui with our pixelated bitmap
SetTimer, Update, 50
return

;#######################################################################

Update:
; Some simple checks to see if we are increasing or decreasing the pixelation
; v is the block size of the pixelation and dir is the direction (inc/decreasing)
if (v <= 1)
	v := 1, dir := !dir
else if (v >= 30)
	v := 30, dir := !dir

; Call Gdip_PixelateBitmap with the bitmap we retrieved earlier and the block size of the pixels
; The function returns the pixelated bitmap, and doesn't dispose of the original bitmap
Gdip_PixelateBitmap(pBitmap, pBitmapOut, dir ? ++v : --v)

; We can optionally clear the graphics we will be drawing to, but if we know there will be no transparencies then
; it doesn't matter
;Gdip_GraphicsClear(G)

; We then draw our pixelated bitmap into our graphics and dispose of the pixelated bitmap
Gdip_DrawImage(G, pBitmapOut, 0, 0, Width, Height, 0, 0, Width, Height)

; We can now update our window, and don't need to provide a position or dimensions as we don't want them to change
UpdateLayeredWindow(hwnd1, hdc)
return

;#######################################################################

; This is called on left click to allow to drag
WM_LBUTTONDOWN()
{
   PostMessage, 0xA1, 2
}

;#######################################################################

; On exit, dispose of everything created
Esc::
Exit:
Gdip_DisposeImage(pBitmapOut), Gdip_DisposeImage(pBitmap)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
Gdip_DeleteGraphics(G)
Gdip_Shutdown(pToken)
ExitApp
return
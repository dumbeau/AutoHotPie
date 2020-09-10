; gdi+ ahk tutorial 6 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Example to take files from disk, load them onto a background and save back to disk

#SingleInstance, Force
#NoEnv
SetBatchLines, -1

; Uncomment if Gdip.ahk is not in your standard library
;#Include, Gdip.ahk

; Specify both of the files we are going to use
File1 = mario.png
File2 = link.png

; Start gdi+
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}

; If the images we want to work with do not exist on disk, then download them...
If !(FileExist(File1) && FileExist(File2))
{
	UrlDownloadToFile, http://www.autohotkey.net/~tic/mario.png, mario.png
	UrlDownloadToFile, http://www.autohotkey.net/~tic/link.png, link.png
}


; Create a 500x500 pixel gdi+ bitmap (this will be the entire drawing area we have to play with)
pBitmap := Gdip_CreateBitmap(600, 600)

; Get a pointer to the graphics of the bitmap, for use with drawing functions
G := Gdip_GraphicsFromImage(pBitmap)

; Create a green brush (this will be used to fill the background with green). The brush is fully opaque (ARGB)
pBrush := Gdip_BrushCreateSolid(0xff00ff00)

; Filll the entire graphics of the bitmap with the green brush (this will be out background colour)
Gdip_FillRectangle(G, pBrush, 0, 0, 600, 600)

; Delete the brush created to save memory as we don't need the same brush anymore
Gdip_DeleteBrush(pBrush)


; Get bitmaps for both the files we are going to be working with
pBitmapFile1 := Gdip_CreateBitmapFromFile(File1), pBitmapFile2 := Gdip_CreateBitmapFromFile(File2)

; Get the width and height of the 1st bitmap
Width := Gdip_GetImageWidth(pBitmapFile1), Height := Gdip_GetImageHeight(pBitmapFile1)

; Draw the 1st bitmap (1st image) onto our "canvas" (the graphics of the original bitmap we created) with the same height and same width
; at coordinates (25,30).....We will be ignoring the matrix parameter for now. This can be used to change opacity and colours when drawing
Gdip_DrawImage(G, pBitmapFile1, 25, 30, Width, Height, 0, 0, Width, Height)


; Do the same again for the 2nd file, but change the coordinates to (250,260).....

Width := Gdip_GetImageWidth(pBitmapFile2), Height := Gdip_GetImageHeight(pBitmapFile2)
Gdip_DrawImage(G, pBitmapFile2, 250, 260, Width, Height, 0, 0, Width, Height)

; Dispose of both of these bitmaps we created from the images on disk, as they are now been used...They are on
; the graphics of the bitmap of our created "canvas"
Gdip_DisposeImage(pBitmapFile1), Gdip_DisposeImage(pBitmapFile2)


; Save the bitmap to file "File.png" (extension can be .png,.bmp,.jpg,.tiff,.gif)
; Bear in mind transparencies may be lost with some image formats and will appear black
Gdip_SaveBitmapToFile(pBitmap, "FinalImage.png")

; The bitmap can be deleted
Gdip_DisposeImage(pBitmap)

; The graphics may now be deleted
Gdip_DeleteGraphics(G)

; ...and gdi+ may now be shutdown
Gdip_Shutdown(pToken)
ExitApp
Return
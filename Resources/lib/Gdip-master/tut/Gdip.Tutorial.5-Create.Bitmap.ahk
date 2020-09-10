; gdi+ ahk tutorial 5 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Example to create a bitmap, fill it with some shapes and save to file

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

; Create a 400x400 pixel gdi+ bitmap
pBitmap := Gdip_CreateBitmap(400, 400)

; Get a pointer to the graphics of the bitmap, for use with drawing functions
G := Gdip_GraphicsFromImage(pBitmap)

; Set the smoothing mode to antialias = 4 to make shapes appear smoother (only used for vector drawing and filling)
Gdip_SetSmoothingMode(G, 4)

; Create a hatched brush with background and foreground colours specified (HatchStyleBackwardDiagonal = 3)
pBrush := Gdip_BrushCreateHatch(0xff553323, 0xffc09e8e, 31)
; Draw into the graphics of the bitmap from coordinates (100,80) a filled rectangle with 200 width and 250 height using the brush created
Gdip_FillRectangle(G, pBrush, (400-200)//2, (400-250)//2, 200, 250)
; Delete the brush created to save memory as we don't need the same brush anymore
Gdip_DeleteBrush(pBrush)

; Create a hatched brush with background and foreground colours specified (HatchStyleBackwardDiagonal = 3)
pBrush := Gdip_BrushCreateHatch(0xff000000, 0xff4d3538, 31)
; Draw an ellipse into the graphics with the brush we just created. 40 degree sweep angle starting at 250 degrees (0 degrees from right horizontal)
Gdip_FillPie(G, pBrush, (400-80)//2, (400-80)//2, 80, 80, 250, 40)
; Delete the brush created to save memory as we don't need the same brush anymore
Gdip_DeleteBrush(pBrush)

; Create a white brush
pBrushWhite := Gdip_BrushCreateSolid(0xffffffff)
; Create a black brush
pBrushBlack := Gdip_BrushCreateSolid(0xff000000)

; Loop to draw 2 ellipses filling them with white then black in the centre of each
Loop, 2
{
	x := (A_Index = 1) ? 120 : 220, y := 100
	Gdip_FillEllipse(G, pBrushWhite, x, y, 60, 60)
	x += 15, y+=15
	Gdip_FillEllipse(G, pBrushBlack, x, y, 30, 30)
}
; Delete both brushes
Gdip_DeleteBrush(pBrushWhite), Gdip_DeleteBrush(pBrushBlack)

; Create a hatched brush with background and foreground colours specified (HatchStyle30Percent = 10)
pBrush := Gdip_BrushCreateHatch(0xfff22231, 0xffa10f19, 10)
; Again draw another ellipse into the graphics with the specified brush
Gdip_FillPie(G, pBrush, 150, 200, 100, 80, 0, 180)
; Delete the brush
Gdip_DeleteBrush(pBrush)

; Create a 3 pixel wide slightly transparent black pen
pPen := Gdip_CreatePen(0xbb000000, 3)

; Create some coordinates for the lines in format x1,y1,x2,y2 then loop and draw all the lines
Lines = 180,200,130,220|180,190,130,195|220,200,270,220|220,190,270,195
Loop, Parse, Lines, |
{
	StringSplit, Pos, A_LoopField, `,
	Gdip_DrawLine(G, pPen, Pos1, Pos2, Pos3, Pos4)
}
; Delete the pen
Gdip_DeletePen(pPen)


; Save the bitmap to file "File.png" (extension can be .png,.bmp,.jpg,.tiff,.gif)
; Bear in mind transparencies may be lost with some image formats and will appear black
Gdip_SaveBitmapToFile(pBitmap, "File.png")

; The bitmap can be deleted
Gdip_DisposeImage(pBitmap)

; The graphics may now be deleted
Gdip_DeleteGraphics(G)

; ...and gdi+ may now be shutdown
Gdip_Shutdown(pToken)
ExitApp
Return
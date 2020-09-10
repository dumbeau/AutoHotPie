; gdi+ ahk tutorial 10 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Tutorial to rotate, flip or mirror an image

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

; Create a gui where we can select the file we want to rotate, the angle to rotate it by and whether we want to flip it
Gui, 1: +ToolWindow +AlwaysOnTop
Gui, 1: Add, Edit, x10 y10 w300 vFile, 
Gui, 1: Add, Button, x+10 yp+0 w75 gFileSelect Default, &File...
Gui, 1: Add, Button, x+10 yp+0 w75 gGo, &Go

; Here is the slider allowing rotation between 0 and 360 degrees
Gui, 1: Add, Slider, x10 y+10 w300 Tooltip vAngle Range0-360, 0

; Create 2 checkboxes, to select whether we want to flip it horizontally or vertically
Gui, 1: Add, CheckBox, x+10 yp+0 vHorizontal, Flip horizontally
Gui, 1: Add, CheckBox, x+10 yp+0 vVertical, Flip vertically

Gui, 1: Show, x0 y0 AutoSize

; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
; This will be used as the 2nd gui so that we can show our image on it
Gui, 2: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs

; Show the window
Gui, 2: Show, NA

; Get a handle to this window we have created in order to update it later
hwnd2 := WinExist()

; By placing this OnMessage here. The function WM_LBUTTONDOWN will be called every time the user left clicks on the gui. This can be used for dragging the image
OnMessage(0x201, "WM_LBUTTONDOWN")
Return

;#####################################################################

Go:

; Submit the variables to see the degress to rotate by and whether to flip the image
Gui, 1: +OwnDialogs
Gui, 1: Submit, NoHide

; If the file in the edit field is not a valid image then return
If !pBitmap := Gdip_CreateBitmapFromFile(File)
Return

; We should get the width and height of the image, in case it is too big for the screen then we can resize it to fit nicely
OriginalWidth := Gdip_GetImageWidth(pBitmap), OriginalHeight := Gdip_GetImageHeight(pBitmap)
Ratio := OriginalWidth/OriginalHeight

; If the image has a width larger than 1/2 of the width of the screen or height larger than 1/2 the screen, then we will resize it to be half of the screen
If (OriginalWidth >= A_ScreenWidth//2) || (OriginalHeight >= A_ScreenHeight//2)
{
	If (OriginalWidth >= OriginalHeight)
	Width := A_ScreenWidth//2, Height := Width*(1/Ratio)
	Else
	Height := A_ScreenHeight//2, Width := Height*Ratio
}
Else
Width := OriginalWidth, Height := OriginalHeight

; Width and Height now contain the new dimensions the image on screen will be

; When rotating a square image, then the bitmap or canvas will need to be bigger as you can imagine that once rotated then a triangle will be wider than a square
; We need to know the new dimensions of the image
; With Gdip_GetRotatedDimensions we can plug in the width and height of the image, and the angle it is to be rotated by
; The last 2 parameters are the variables in which tio store the new width and height of the rotated image
; RWidth and RHeight now contain the dimensions of the rotated image
Gdip_GetRotatedDimensions(Width, Height, Angle, RWidth, RHeight)

; We rotate an image about the top left corner of the image, however this will result in the image moving off the canvas
; We can use Gdip_GetRotatedTranslation to find how much the image should be 'shifted' by in the x and y coordinates in order for it to be back on the canvas
; As with the above function, we plug in the width, height and angle to rotate by
; The function will then make the last 2 parameters the x and y translation (this is the distance in pixels the image must be shifted by)
; xTranslation and yTranslation now contain the distance to shift the image by
Gdip_GetRotatedTranslation(Width, Height, Angle, xTranslation, yTranslation)

; We will now create a gdi bitmap to display the rotated image on the screen (as mentioned previously we must use a gdi bitmap to display things on the screen)
hbm := CreateDIBSection(RWidth, RHeight)

; Get a device context compatible with the screen
hdc := CreateCompatibleDC()

; Select the bitmap into the device context
obm := SelectObject(hdc, hbm)

; Get a pointer to the graphics of the bitmap, for use with drawing functions,
; and set the InterpolationMode to HighQualityBicubic = 7 so that when resizing the image still looks good
G := Gdip_GraphicsFromHDC(hdc), Gdip_SetInterpolationMode(G, 7)

; We can now shift our graphics or 'canvas' using the values found with Gdip_GetRotatedTranslation so that the image will be drawn on the canvas
Gdip_TranslateWorldTransform(G, xTranslation, yTranslation)

; We can also rotate the graphics by the angle we desire
Gdip_RotateWorldTransform(G, Angle)

; If we wish to flip the image horizontally, then we supply Gdip_ScaleWorldTransform(G, x, y) with a negative x transform
; We multiply the image by the x and y transform. So multiplying a direction by -1 will flip it in that direction and 1 will do nothing
; We must then shift the graphics again to ensure the image will be within the 'canvas'
; You can see that if we wish to flip vertically we supply a negative y transform
If Horizontal
Gdip_ScaleWorldTransform(G, -1, 1), Gdip_TranslateWorldTransform(G, -Width, 0)
If Vertical
Gdip_ScaleWorldTransform(G, 1, -1), Gdip_TranslateWorldTransform(G, 0, -Height)


; As you will already know....we must draw the image onto the graphics. We want to draw from the top left coordinates of the image (0, 0) to the top left of the graphics (0, 0)
; We are drawing from the orginal image size to the new size (this may not be different if the image was not larger than half the screen)
Gdip_DrawImage(G, pBitmap, 0, 0, Width, Height, 0, 0, OriginalWidth, OriginalHeight)

; Even though this is not necessary in this scenario, you should always reset the transforms set on the graphics. This will remove any of the rotations
Gdip_ResetWorldTransform(G)

; We will update the hwnd  with the hdc of our gdi bitmap. We are drawing it at the new width and height and in the centre of the screen
UpdateLayeredWindow(hwnd2, hdc, (A_ScreenWidth-RWidth)//2, (A_ScreenHeight-RHeight)//2, RWidth, RHeight)

; As always we will dispose of everything we created
; So we select the object back into the hdc, the delete the bitmap and hdc
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
; We will then dispose of the graphics and bitmap we created
Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmap)
Return

;#####################################################################

; This is a simple subroutine to select images and change the editbox with the image teh user selects
FileSelect:
Gui, 1: +OwnDialogs
Gui, 1: Submit, NoHide

FileSelectFile, File,,, Select image
If Errorlevel
Return
GuiControl,, File, %File%
Return

;#####################################################################

; This is the function to allow the user to drag the image drawn on the screen (this being gui 2)
WM_LBUTTONDOWN()
{
	If (A_Gui = 2)
	PostMessage, 0xA1, 2
}

;#####################################################################

; If the user closes the gui or closes the program then we want to shut down gdi+ and exit the application
Esc::
GuiClose:
Exit:
Gdip_Shutdown(pToken)
ExitApp
Return
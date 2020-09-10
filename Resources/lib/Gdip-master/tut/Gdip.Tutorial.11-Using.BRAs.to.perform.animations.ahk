; gdi+ ahk tutorial 11 written by tic (Tariq Porter)
; Requires Gdip.ahk either in your Lib folder as standard library or using #Include
;
; Tutorial to demonstrate how to use BRA files, in this instance for animation

#SingleInstance, Force
#NoEnv

; Uncomment if Gdip.ahk is not in your standard library
;#Include, Gdip.ahk
; Uncomment if BRA.ahk is not in your standard library
;#Include, BRA.ahk

; Start gdi+
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
; On exiting the program we will go to Exit subroutine to clean up any resources
OnExit, Exit

; I've added a simple new function here, just to ensure if anyone is having any problems then to make sure they are using the correct library version
if (Gdip_LibraryVersion() < 1.30)
{
	MsgBox, 48, version error!, Please download the latest version of the gdi+ library
	ExitApp
}

; Get the dimensions of the work area of the primary monitor
SysGet, MonitorPrimary, MonitorPrimary
SysGet, WA, MonitorWorkArea, %MonitorPrimary%
WAWidth := WARight-WALeft
WAHeight := WABottom-WATop

; Create our gui with WS_EX_LAYERED style = 0x80000
Gui, 1: -Caption +E0x80000 +LastFound +OwnDialogs +Owner
Gui, 1: Show, NA

; Get a handle to this window
hwnd1 := WinExist()

; A BRA File is a collection of files packed into one Binary Resource Archive
; There are a number of functions for use with BRA files. You must download the BRA Standard Library and either put it in your Lib folder or use #Include
; The advantages over using the separate files are:
; - One BRA file is cleaner to transport with your script than several other files
; - It is easier to cleanup 1 BRA after use if needed
; - A BRA file can be read once into memory using FileRead and is no longer needed
; - A BRA file is better for your disk (especially flash disks) as it only uses 1 read operation. Flash disks have a finite number of read/writes
; - BRA files are quicker to access as they are read from RAM and not from disk
; - It is easier to use BRA files as the library provides all the functions needed

; If the image we want to work with does not exist on disk, then download it...
If !FileExist("Gdip.tutorial.file-fish.bra")
UrlDownloadToFile, http://www.autohotkey.net/~tic/Gdip.tutorial.file-fish.bra, Gdip.tutorial.file-fish.bra

; First you will need to read the BRA into a variable. It is now stored in the variable BRA
FileRead, BRA, Gdip.tutorial.file-fish.bra
If ErrorLevel
{
	MsgBox, 48, File error!, Please download Gdip.tutorial.file-fish.bra
	ExitApp
}

; using BRA_ListFiles we can get a list of all the files contained within our BRA
; BRAs can contain folders. The returned file names will include the relative folders
BRAFiles := BRA_ListFiles(BRA, "", 1)
; Perform a StringSplit to get a count of the number of files
StringSplit, BRAFile, BRAFiles, |

; Built into the Gdip library is the ability to directly get a pointer to a bitmap from a BRA
; Gdip_BitmapFromBRA(ByRef BRAFromMemIn, File, Alternate=0)
; The 1st parameter is the BRA in memory
; The 2nd parameter is the name of the file you wish to get a bitmap for
; If the 3rd parameter is true (as it is here) then the name (2nd parameter) doesn't go by file name, but instead by file number

; So we take a pointer to the bitmap of the 1st file
; I am doing this to get the dimensions of an image. We could have taken any file as they are all the same dimension in this particular BRA
pBitmap := Gdip_BitmapFromBRA(BRA, 1, 1)

; PLEASE TAKE NOTE
; To check if the handle to the bitmap is not actually a bitmap you must check whether the pointer is either 0 or negative
; You can do this by checking if pBitmap < 1. Normally you would have checked if it was just 0
; 0 would mean you have a blank pointer
; a negative number means that the function has returned an error
If (pBitmap < 1)
{
	MsgBox, 48, File loading error!, Could not load the image specified
	ExitApp
}

; Calculate the dimensions of the gui. I advise you always work on fractions of the screen dimensions to ensure it will look similar on other screens
; If you feel like it, you could go further and change the dimensions based on 16:9 or 4:3
WinWidth := WAWidth//2.5
WinHeight := Round(WinWidth//4)

; Get the width and height of a single bitmap. This bitmap is the fish banner
Width := Gdip_GetImageWidth(pBitmap), Height := Gdip_GetImageHeight(pBitmap)

; Calculate the dimensions the fish banner will be resized to, to fit nicely on the gui
NewWidth := 0.9*WinWidth
NewHeight := Round((NewWidth/Width)*Height)

; This is standard for all guis. Create a gdi bitmap and get a graphics context to draw into
; The bitmap will be out entire drawing area, so will be the same size as the gui
hbm := CreateDIBSection(WinWidth, WinHeight), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
G := Gdip_GraphicsFromHDC(hdc)

; Set the smoothing mode to antialias = 4 to make shapes appear smother (only used for vector drawing and filling)
Gdip_SetSmoothingMode(G, 4)
; Gdip_SetInterpolationMode of 7 is used to ensure images are resized using HighQualityBicubic so that when the fish banner is redrawn it looks as good as possible
; I have commented it as it uses slightly more of the processor
;Gdip_SetInterpolationMode(G, 7)

; This brush has not been covered previously in my tutorials. Gdip_CreateLineBrushFromRect will create a fading brush
; Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1)
; You can see that it fades from 0xee000000 (mostly opaque black) to 0x77000000 (partially transparent black)
; You have 2 more optional parameters:
; LinearGradientMode specifies the direction of fill. Horizontal, vertical, diagonal, etc
; WrapMode specifies how to fill if the rectangle does not fit the area it is trying to fill. So for example it could tile the brush
pBrush := Gdip_CreateLineBrushFromRect(0, 0, WinWidth, WinHeight, 0xee000000, 0x77000000)

; Standard rounded rectangle to be used with the gradient brush for the background of our gui
Gdip_FillRoundedRectangle(G, pBrush, 0, 0, WinWidth, WinHeight, 20)

; We can specify the font to use. Here we use Arial as most systems should have this installed
Font = Arial
; Next we can check that the user actually has the font that we wish them to use
; If they do not then we can do something about it. I choose to give a wraning and exit!
If !Gdip_FontFamilyCreate(Font)
{
   MsgBox, 48, Font error!, The font you have specified does not exist on the system
   ExitApp
}
; Delete font family as we now know the font does exist
Gdip_DeleteFontFamily(hFamily)

; There are 2 new additions to Gdip_TextToGraphics
; The first additoon is shown below
; You should have already used Gdip_TextToGraphics so I wont go through all the options
; We are going to get the height of the text we want to draw so that we can create gradient brush for future use
; I put all the same options that I will use later, except I just put an arbitrary colour in and also just wrote the letter T as that will be the tallest letter
; Most importantly is the last parameter that is new. It is the measure parameter
; If specified then it will still get you the dimensions of the text, but will not actually draw it
Options = x10p y60p w80p Centre cff000000 r4 s18p Bold
RC := Gdip_TextToGraphics(G, "T", Options, Font, WinWidth, WinHeight, 1)
; StringSplit RC to get the dimensions of the text. The width is not important to me, just the starting y and height
; x = RC1, y = RC2, width = RC3, height = RC4, number of characters = RC5, number of lines = RC6
StringSplit, RC, RC, |

; I can now create a gradient brush for the text (to be used with another new addition to Gdip_TextToGraphics
; I am going to create it using the y and height we just got. The width doesnt matter as I will make the brush the same width as the gui
; so no matter how wide the writing it will still be within the brushes width
pTextBrush := Gdip_CreateLineBrushFromRect(0, RC2, WinWidth, RC4, 0xffDDF7F7, 0x774549DF)

; In the options for Gdip_TextToGraphics we can now specify the brush we just created rather than just specifying the argb as we normally do
; We literally pass the pointer to the brush (so our brush variable) after the c
; These options will be used for the duration of the program now for writing text
Options = x10p y60p w80p Centre c%pTextBrush% r4 s18p Bold

; We can dispose of the bitmap we got from the bra. We just needed it for its dimensions
Gdip_DisposeImage(pBitmap)

; We will keep a variable to count which fish image we are currently showing and incremeent it for the appearance of a video
Index := 0

; Same as always. On LBUTTONDOWN then run the function to allow dragging of the gui
OnMessage(0x201, "WM_LBUTTONDOWN")

; Update this all onto the window so that it has a postion on screen
; In future we wont need to supply x,y,w,h any more
UpdateLayeredWindow(hwnd1, hdc, (WAWidth-WinWidth)//2, (WAHeight-WinHeight)//2, WinWidth, WinHeight)

; Set the timers
; UpdateTime to draw the time onto the gui
; Play to change the image for the fish video
GoSub, UpDateTime
SetTimer, UpdateTime, 950
SetTimer, Play, 70
return

;######################################################################

UpdateTime:

; We should probably put critical here so that it isnt interrupted, but the subroutines are so quick that its very unlikely

; Get the time in the format of 16:05 06 January 2010 (oops...caught me commenting this at work!)
FormatTime, Time
if (Time = OldTime)
	return

; We are going to get the dimensions of the text for the time
RC := Gdip_TextToGraphics(G, Time, Options, Font, WinWidth, WinHeight, 1)
StringSplit, RC, RC, |

; We can then clip a rectangle so that we only need to redraw what is contained within it
Gdip_SetClipRect(G, RC1, RC2, RC3, RC4)

; Gdip_SetCompositingMode to 1, which overwrites anything inside the rectangle
Gdip_SetCompositingMode(G, 1)
; We fill the background up again
Gdip_FillRectangle(G, pBrush, 0, 0, WinWidth, WinHeight)
; And Gdip_SetCompositingMode back to 0 so that anything new that is drawn will be blended on top
Gdip_SetCompositingMode(G, 0)

; We now write the time onto our gui
; We are using the options before which uses our white-purple fading brush
; When actually passing a pBrush to the function as we have done, then it will not dispose of it. You are responsible for disposing of it
Gdip_TextToGraphics(G, Time, Options, Font, WinWidth, WinHeight)

; As we do not need to change the x,y,w,h then we dont need to specify those parameters. Just pass the hdc to update our gui
UpdateLayeredWindow(hwnd1, hdc)

; Reset the clipping area so that it is not just limited to drawing in the rectangle we just specified
Gdip_ResetClip(G)

; Save the time so that we dont redraw until the time changes
OldTime := Time
return

;######################################################################

; I know it's dirty to have global functions, but this is just really a subroutine, but is also useful to have a single parameter passed
Fade(InOut)
{
	global
	
	; We will create a simple fade effect when starting or ending the video
	; We need to know whether it will start opaque or transparent
	Trans := (InOut = "In") ? 0 : 0.8
	
	; Loop the number of times until it is at the specified opacity
	Loop, % 0.8/0.05		;%
	{
		; Clip to the area we are drawing for the fish, so that only this rectangle gets drawn to
		; We could do this once at the top of this function, but it is safer to do it each loop so that nothing else can modify it during the sleep
		Gdip_SetClipRect(G, (WinWidth-NewWidth)//2, (WinWidth-NewWidth)//2, NewWidth, NewHeight)
		; Gdip_SetCompositingMode to 1 so that it will erase anything that is currently there
		Gdip_SetCompositingMode(G, 1)
		; Fill the background
		Gdip_FillRectangle(G, pBrush, 0, 0, WinWidth, WinHeight)
		; Gdip_SetCompositingMode back to 0 so that the fish are drawn onto the background and dont erase it
		Gdip_SetCompositingMode(G, 0)
		
		; Increment index by 1 so that we get the next image in the sequence
		Index++
		; Again use alternate mode so that we only specify the file number and get a pBitmap for it
		pBitmap := Gdip_BitmapFromBRA(BRA, Index, 1)
		
		; Draw this image onto our graphics context for the gui (this being our canvas) with the current transparency
		Gdip_DrawImage(G, pBitmap, (WinWidth-NewWidth)//2, (WinWidth-NewWidth)//2, NewWidth, NewHeight, 0, 0, Width, Height, Trans)
		
		; Now update the window with the dc as usual
		UpdateLayeredWindow(hwnd1, hdc)
		
		; We can dispose of the fish bitmap we just retrieved now that it is drawn
		Gdip_DisposeImage(pBitmap)
		
		; Increase or decrease opacity depending on whether we are fading in or out
		Trans := (InOut = "In") ? Trans+0.05 : Trans-0.05

		; Reset the clipping region so that another function if called can still update the window
		Gdip_ResetClip(G)
		
		; A sleep to match the length of the Play timer
		Sleep, 70
	}
	
	; If we have reached the end of the video then put it back to the beginning after the fade
	Index := (Index >= BRAFile0) ? 0 : Index
	return
}

;#######################################################################

Play:
; Check if we need to fade in or whether we are close enough to the end to have to fade out
if (Index = 0)
	Fade("In")
else if (Index = BRAFile0-(0.8/0.05))
	Fade("Out")
else
{
	; If we are doing no fading and we are just playing the video....
	
	; We do the same here as we did inside the function
	; We are setting a clipping area for just the fish, then filling the background in (overwiting anything that was there)
	; We set Gdip_SetCompositingMode back to 0 and then get a bitmap for the next fish image and draw it over our background
	; Dispose the image and reset the clipping region
	Gdip_SetClipRect(G, (WinWidth-NewWidth)//2, (WinWidth-NewWidth)//2, NewWidth, NewHeight)
	Gdip_SetCompositingMode(G, 1)
	Gdip_FillRectangle(G, pBrush, 0, 0, WinWidth, WinHeight)
	Gdip_SetCompositingMode(G, 0)

	Index++
	pBitmap := Gdip_BitmapFromBRA(BRA, Index, 1)
	Gdip_DrawImage(G, pBitmap, (WinWidth-NewWidth)//2, (WinWidth-NewWidth)//2, NewWidth, NewHeight, 0, 0, Width, Height, 0.8)
	UpdateLayeredWindow(hwnd1, hdc)
	Gdip_DisposeImage(pBitmap)
	Gdip_ResetClip(G)
}
return

;#######################################################################

; Our function for WM_LBUTTONDOWN allowing us to drag. works on last found window
WM_LBUTTONDOWN()
{
	PostMessage, 0xA1, 2
}

;#######################################################################

; On Exit clean up resources
Exit:
; Select the object back into the hdc
SelectObject(hdc, obm)

; Now the bitmap may be deleted
DeleteObject(hbm)

; Also the device context related to the bitmap may be deleted
DeleteDC(hdc)

; The graphics may now be deleted
Gdip_DeleteGraphics(G)

; Also delete the 2 brushes we created
Gdip_DeleteBrush(pBrush), Gdip_DeleteBrush(pTextBrush)
Gdip_Shutdown(pToken)
ExitApp
Return

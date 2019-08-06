; AutoHotkey header file for OpenGL-Win32.
; wgl.ahk last updated Date: 2011-03-08 (Tuesday, 08 Mar 2011)
; Written by: Bentschi (bentschi1337@yahoo.de)

;=============================================================

GLptr := (A_PtrSize) ? "ptr" : "uint" ;AutoHotkey definition
GLastr := (A_IsUnicode) ? "astr" : "str" ;AutoHotkey definition

wglCopyContext(hglrcSrc, hglrcDst, mask)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hglrcSrc, GLptr, hglrcDst, "uint", mask, "uint")
}

wglCreateContext(hdc)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hDC, GLptr)
}

wglCreateLayerContext(hdc, iLayerPlane)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hDC, "int", iLayerPlane, GLptr)
}

wglDeleteContext(hglrc)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hglrc, "uint")
}

wglGetCurrentContext()
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr)
}

wglGetCurrentDC()
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr)
}

wglGetProcAddress(lpszProc)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLastr, lpszProc, GLptr)
}

wglMakeCurrent(hdc, hglrc)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, GLptr, hglrc, "uint")
}

wglShareLists(hglrc1, hglrc2)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hglrc1, GLptr, hglrc2, "uint")
}

wglUseFontBitmapsA(hdc, first, count, listBase)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "uint", first, "uint", count, "uint", listBase, "uint")
}

wglUseFontBitmapsW(hdc, first, count, listBase)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "uint", first, "uint", count, "uint", listBase, "uint")
}

wglUseFontBitmaps(hdc, first, count, listBase)
{
  if (A_IsUnicode)
    return wglUseFontBitmapsW(hdc, first, count, listBase)
  else
    return wglUseFontBitmapsA(hdc, first, count, listBase)
}

SwapBuffers(hdc)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hdc, "uint")
}

WGL_FONT_LINES      := 0
WGL_FONT_POLYGONS   := 1

wglUseFontOutlinesA(hdc, first, count, listBase, deviation, extrusion, format, lpgmf)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "uint", first, "uint", count, "uint", listBase, "float", deviation, "float", extrusion, "int", format, GLptr, lpgmf, "uint")
}

wglUseFontOutlinesW(hdc, first, count, listBase, deviation, extrusion, format, lpgmf)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "uint", first, "uint", count, "uint", listBase, "float", deviation, "float", extrusion, "int", format, GLptr, lpgmf, "uint")
}

wglUseFontOutlines(hdc, first, count, listBase, deviation, extrusion, format, lpgmf)
{
  if (A_IsUnicode)
    return wglUseFontOutlinesW(hdc, first, count, listBase, deviation, extrusion, format, lpgmf)
  else
    return wglUseFontOutlinesA(hdc, first, count, listBase, deviation, extrusion, format, lpgmf)
}

LPD_DOUBLEBUFFER       := 0x00000001
LPD_STEREO             := 0x00000002
LPD_SUPPORT_GDI        := 0x00000010
LPD_SUPPORT_OPENGL     := 0x00000020
LPD_SHARE_DEPTH        := 0x00000040
LPD_SHARE_STENCIL      := 0x00000080
LPD_SHARE_ACCUM        := 0x00000100
LPD_SWAP_EXCHANGE      := 0x00000200
LPD_SWAP_COPY          := 0x00000400
LPD_TRANSPARENT        := 0x00001000

LPD_TYPE_RGBA        := 0
LPD_TYPE_COLORINDEX  := 1

;wglSwapLayerBuffers flags
WGL_SWAP_MAIN_PLANE    := 0x00000001
WGL_SWAP_OVERLAY1      := 0x00000002
WGL_SWAP_OVERLAY2      := 0x00000004
WGL_SWAP_OVERLAY3      := 0x00000008
WGL_SWAP_OVERLAY4      := 0x00000010
WGL_SWAP_OVERLAY5      := 0x00000020
WGL_SWAP_OVERLAY6      := 0x00000040
WGL_SWAP_OVERLAY7      := 0x00000080
WGL_SWAP_OVERLAY8      := 0x00000100
WGL_SWAP_OVERLAY9      := 0x00000200
WGL_SWAP_OVERLAY10     := 0x00000400
WGL_SWAP_OVERLAY11     := 0x00000800
WGL_SWAP_OVERLAY12     := 0x00001000
WGL_SWAP_OVERLAY13     := 0x00002000
WGL_SWAP_OVERLAY14     := 0x00004000
WGL_SWAP_OVERLAY15     := 0x00008000
WGL_SWAP_UNDERLAY1     := 0x00010000
WGL_SWAP_UNDERLAY2     := 0x00020000
WGL_SWAP_UNDERLAY3     := 0x00040000
WGL_SWAP_UNDERLAY4     := 0x00080000
WGL_SWAP_UNDERLAY5     := 0x00100000
WGL_SWAP_UNDERLAY6     := 0x00200000
WGL_SWAP_UNDERLAY7     := 0x00400000
WGL_SWAP_UNDERLAY8     := 0x00800000
WGL_SWAP_UNDERLAY9     := 0x01000000
WGL_SWAP_UNDERLAY10    := 0x02000000
WGL_SWAP_UNDERLAY11    := 0x04000000
WGL_SWAP_UNDERLAY12    := 0x08000000
WGL_SWAP_UNDERLAY13    := 0x10000000
WGL_SWAP_UNDERLAY14    := 0x20000000
WGL_SWAP_UNDERLAY15    := 0x40000000

wglDescribeLayerPlane(hdc, iPixelFormat, iLayerPlane, nBytes, plpd)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "int", iPixelFormat, "int", iLayerPlane, "uint", nBytes, GLptr, lppd, "uint")
}

wglSetLayerPaletteEntries(hdc, iLayerPlane, iStart, cEntries, pcr)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "int", iLayerPlane, "int", iStart, "int", cEntries, GLptr, pcr, "int")
}

wglGetLayerPaletteEntries(hdc, iLayerPlane, iStart, cEntries, pcr)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "int", iLayerPlane, "int", iStart, "int", cEntries, GLptr, pcr, "int")
}

wglRealizeLayerPalette(hdc, iLayerPlane, bRealize)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "int", iLayerPlane, "uint", bRealize, "uint")
}

wglSwapLayerBuffers(hdc, fuPlanes)
{
  global
  return DllCall("opengl32\" A_ThisFunc, GLptr, hdc, "uint", fuPlanes, "uint")
}

WGL_SWAPMULTIPLE_MAX := 16

wglSwapMultibleBuffers(n, pwglswap)
{
  global
  return DllCall("opengl32\" A_ThisFunc, "uint", n, GLptr, pwglswap, "uint")
}

PFD_TYPE_RGBA        := 0
PFD_TYPE_COLORINDEX  := 1

;layer types 
PFD_MAIN_PLANE       := 0
PFD_OVERLAY_PLANE    := 1
PFD_UNDERLAY_PLANE   := (-1)

;PIXELFORMATDESCRIPTOR flags 
PFD_DOUBLEBUFFER            := 0x00000001
PFD_STEREO                  := 0x00000002
PFD_DRAW_TO_WINDOW          := 0x00000004
PFD_DRAW_TO_BITMAP          := 0x00000008
PFD_SUPPORT_GDI             := 0x00000010
PFD_SUPPORT_OPENGL          := 0x00000020
PFD_GENERIC_FORMAT          := 0x00000040
PFD_NEED_PALETTE            := 0x00000080
PFD_NEED_SYSTEM_PALETTE     := 0x00000100
PFD_SWAP_EXCHANGE           := 0x00000200
PFD_SWAP_COPY               := 0x00000400
PFD_SWAP_LAYER_BUFFERS      := 0x00000800
PFD_GENERIC_ACCELERATED     := 0x00001000
PFD_SUPPORT_DIRECTDRAW      := 0x00002000
PFD_DIRECT3D_ACCELERATED    := 0x00004000
PFD_SUPPORT_COMPOSITION     := 0x00008000

;PIXELFORMATDESCRIPTOR flags for use in ChoosePixelFormat only
PFD_DEPTH_DONTCARE          := 0x20000000
PFD_DOUBLEBUFFER_DONTCARE   := 0x40000000
PFD_STEREO_DONTCARE         := 0x80000000

ChoosePixelFormat(hdc, ppfd)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hdc, GLptr, ppfd, "int")
}

DescribePixelFormat(hdc, iPixelFormat, nBytes, ppfd)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hdc, "int", iPixelFormat, "uint", nBytes, GLptr, ppfd, "uint")
}

GetEnhMetaFilePixelFormat(hemf, cbBuffer, ppfd)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hemf, "uint", cbBuffer, GLptr, ppfd, "uint")
}

GetPixelFormat(hdc)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hdc, "int")
}

SetPixelFormat(hdc, iPixelFormat, ppfd)
{
  global
  return DllCall("gdi32\" A_ThisFunc, GLptr, hdc, "int", iPixelFormat, GLptr, ppfd, "uint")
}

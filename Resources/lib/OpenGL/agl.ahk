; AutoHotkey header file for OpenGL.
; agl.ahk last updated Date: 2011-03-11 (Friday, 08 Mar 2011)
; Written by: Bentschi (bentschi1337@yahoo.de)

;=============================================================

GLptr := (A_PtrSize) ? "ptr" : "uint" ;AutoHotkey definition
GLastr := (A_IsUnicode) ? "astr" : "str" ;AutoHotkey definition

;aglInit loads the librarys opengl32.dll and glu32.dll.

aglInit()
{
  global
  local astr, ptr, error, hgl, hglu, PFNGETPROCADDRESSPROC

  astr := (A_IsUnicode) ? "astr" : "str"
  ptr := (A_PtrSize) ? "ptr" : "uint"
  error := A_LastError
  hgl := DllCall("LoadLibrary", "str", "opengl32", ptr)
  hglu := DllCall("LoadLibrary", "str", "glu32", ptr)
  if ((hgl) && (hglu))
  {
    DllCall("SetLastError", "uint", error)
    PFNGETPROCADDRESSPROC := DllCall("GetProcAddress", ptr, DllCall("GetModuleHandle", "str", "kernel32", ptr), astr, "GetProcAddress", ptr)
    PFNGLACCUMPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glAccum", ptr)
    PFNGLALPHAFUNCPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glAlphaFunc", ptr)
    PFNGLARETEXTURESRESIDENTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glAreTexturesResident", ptr)
    PFNGLARRAYELEMENTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glArrayElement", ptr)
    PFNGLBEGINPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glBegin", ptr)
    PFNGLBINDTEXTUREPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glBindTexture", ptr)
    PFNGLBITMAPPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glBitmap", ptr)
    PFNGLBLENDFUNCPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glBlendFunc", ptr)
    PFNGLCALLLISTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCallList", ptr)
    PFNGLCALLLISTSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCallLists", ptr)
    PFNGLCLEARPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClear", ptr)
    PFNGLCLEARACCUMPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClearAccum", ptr)
    PFNGLCLEARCOLORPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClearColor", ptr)
    PFNGLCLEARDEPTHPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClearDepth", ptr)
    PFNGLCLEARINDEXPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClearIndex", ptr)
    PFNGLCLEARSTENCILPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClearStencil", ptr)
    PFNGLCLIPPLANEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glClipPlane", ptr)
    PFNGLCOLOR3BPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3b", ptr)
    PFNGLCOLOR3BVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3bv", ptr)
    PFNGLCOLOR3DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3d", ptr)
    PFNGLCOLOR3DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3dv", ptr)
    PFNGLCOLOR3FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3f", ptr)
    PFNGLCOLOR3FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3fv", ptr)
    PFNGLCOLOR3IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3i", ptr)
    PFNGLCOLOR3IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3iv", ptr)
    PFNGLCOLOR3SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3s", ptr)
    PFNGLCOLOR3SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3sv", ptr)
    PFNGLCOLOR3UBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3ub", ptr)
    PFNGLCOLOR3UBVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3ubv", ptr)
    PFNGLCOLOR3UIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3ui", ptr)
    PFNGLCOLOR3UIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3uiv", ptr)
    PFNGLCOLOR3USPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3us", ptr)
    PFNGLCOLOR3USVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor3usv", ptr)
    PFNGLCOLOR4BPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4b", ptr)
    PFNGLCOLOR4BVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4bv", ptr)
    PFNGLCOLOR4DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4d", ptr)
    PFNGLCOLOR4DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4dv", ptr)
    PFNGLCOLOR4FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4f", ptr)
    PFNGLCOLOR4FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4fv", ptr)
    PFNGLCOLOR4IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4i", ptr)
    PFNGLCOLOR4IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4iv", ptr)
    PFNGLCOLOR4SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4s", ptr)
    PFNGLCOLOR4SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4sv", ptr)
    PFNGLCOLOR4UBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4ub", ptr)
    PFNGLCOLOR4UBVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4ubv", ptr)
    PFNGLCOLOR4UIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4ui", ptr)
    PFNGLCOLOR4UIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4uiv", ptr)
    PFNGLCOLOR4USPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4us", ptr)
    PFNGLCOLOR4USVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColor4usv", ptr)
    PFNGLCOLORMASKPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColorMask", ptr)
    PFNGLCOLORMATERIALPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColorMaterial", ptr)
    PFNGLCOLORPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glColorPointer", ptr)
    PFNGLCOPYPIXELSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCopyPixels", ptr)
    PFNGLCOPYTEXIMAGE1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCopyTexImage1D", ptr)
    PFNGLCOPYTEXIMAGE2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCopyTexImage2D", ptr)
    PFNGLCOPYTEXSUBIMAGE1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCopyTexSubImage1D", ptr)
    PFNGLCOPYTEXSUBIMAGE2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCopyTexSubImage2D", ptr)
    PFNGLCULLFACEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glCullFace", ptr)
    PFNGLDELETELISTSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDeleteLists", ptr)
    PFNGLDELETETEXTURESPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDeleteTextures", ptr)
    PFNGLDEPTHFUNCPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDepthFunc", ptr)
    PFNGLDEPTHMASKPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDepthMask", ptr)
    PFNGLDEPTHRANGEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDepthRange", ptr)
    PFNGLDISABLEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDisable", ptr)
    PFNGLDISABLECLIENTSTATEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDisableClientState", ptr)
    PFNGLDRAWARRAYSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDrawArrays", ptr)
    PFNGLDRAWBUFFERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDrawBuffer", ptr)
    PFNGLDRAWELEMENTSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDrawElements", ptr)
    PFNGLDRAWPIXELSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glDrawPixels", ptr)
    PFNGLEDGEFLAGPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEdgeFlag", ptr)
    PFNGLEDGEFLAGPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEdgeFlagPointer", ptr)
    PFNGLEDGEFLAGVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEdgeFlagv", ptr)
    PFNGLENABLEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEnable", ptr)
    PFNGLENABLECLIENTSTATEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEnableClientState", ptr)
    PFNGLENDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEnd", ptr)
    PFNGLENDLISTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEndList", ptr)
    PFNGLEVALCOORD1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord1d", ptr)
    PFNGLEVALCOORD1DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord1dv", ptr)
    PFNGLEVALCOORD1FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord1f", ptr)
    PFNGLEVALCOORD1FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord1fv", ptr)
    PFNGLEVALCOORD2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord2d", ptr)
    PFNGLEVALCOORD2DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord2dv", ptr)
    PFNGLEVALCOORD2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord2f", ptr)
    PFNGLEVALCOORD2FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalCoord2fv", ptr)
    PFNGLEVALMESH1PROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalMesh1", ptr)
    PFNGLEVALMESH2PROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalMesh2", ptr)
    PFNGLEVALPOINT1PROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalPoint1", ptr)
    PFNGLEVALPOINT2PROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glEvalPoint2", ptr)
    PFNGLFEEDBACKBUFFERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFeedbackBuffer", ptr)
    PFNGLFINISHPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFinish", ptr)
    PFNGLFLUSHPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFlush", ptr)
    PFNGLFOGFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFogf", ptr)
    PFNGLFOGFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFogfv", ptr)
    PFNGLFOGIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFogi", ptr)
    PFNGLFOGIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFogiv", ptr)
    PFNGLFRONTFACEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFrontFace", ptr)
    PFNGLFRUSTUMPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glFrustum", ptr)
    PFNGLGENLISTSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGenLists", ptr)
    PFNGLGENTEXTURESPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGenTextures", ptr)
    PFNGLGETBOOLEANVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetBooleanv", ptr)
    PFNGLGETCLIPPLANEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetClipPlane", ptr)
    PFNGLGETDOUBLEVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetDoublev", ptr)
    PFNGLGETERRORPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetError", ptr)
    PFNGLGETFLOATVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetFloatv", ptr)
    PFNGLGETINTEGERVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetIntegerv", ptr)
    PFNGLGETLIGHTFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetLightfv", ptr)
    PFNGLGETLIGHTIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetLightiv", ptr)
    PFNGLGETMAPDVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetMapdv", ptr)
    PFNGLGETMAPFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetMapfv", ptr)
    PFNGLGETMAPIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetMapiv", ptr)
    PFNGLGETMATERIALFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetMaterialfv", ptr)
    PFNGLGETMATERIALIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetMaterialiv", ptr)
    PFNGLGETPIXELMAPFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetPixelMapfv", ptr)
    PFNGLGETPIXELMAPUIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetPixelMapuiv", ptr)
    PFNGLGETPIXELMAPUSVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetPixelMapusv", ptr)
    PFNGLGETPOINTERVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetPointerv", ptr)
    PFNGLGETPOLYGONSTIPPLEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetPolygonStipple", ptr)
    PFNGLGETSTRINGPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetString", ptr)
    PFNGLGETTEXENVFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexEnvfv", ptr)
    PFNGLGETTEXENVIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexEnviv", ptr)
    PFNGLGETTEXGENDVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexGendv", ptr)
    PFNGLGETTEXGENFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexGenfv", ptr)
    PFNGLGETTEXGENIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexGeniv", ptr)
    PFNGLGETTEXIMAGEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexImage", ptr)
    PFNGLGETTEXLEVELPARAMETERFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexLevelParameterfv", ptr)
    PFNGLGETTEXLEVELPARAMETERIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexLevelParameteriv", ptr)
    PFNGLGETTEXPARAMETERFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexParameterfv", ptr)
    PFNGLGETTEXPARAMETERIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glGetTexParameteriv", ptr)
    PFNGLHINTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glHint", ptr)
    PFNGLINDEXMASKPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexMask", ptr)
    PFNGLINDEXPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexPointer", ptr)
    PFNGLINDEXDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexd", ptr)
    PFNGLINDEXDVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexdv", ptr)
    PFNGLINDEXFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexf", ptr)
    PFNGLINDEXFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexfv", ptr)
    PFNGLINDEXIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexi", ptr)
    PFNGLINDEXIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexiv", ptr)
    PFNGLINDEXSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexs", ptr)
    PFNGLINDEXSVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexsv", ptr)
    PFNGLINDEXUBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexub", ptr)
    PFNGLINDEXUBVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIndexubv", ptr)
    PFNGLINITNAMESPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glInitNames", ptr)
    PFNGLINTERLEAVEDARRAYSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glInterleavedArrays", ptr)
    PFNGLISENABLEDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIsEnabled", ptr)
    PFNGLISLISTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIsList", ptr)
    PFNGLISTEXTUREPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glIsTexture", ptr)
    PFNGLLIGHTMODELFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightModelf", ptr)
    PFNGLLIGHTMODELFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightModelfv", ptr)
    PFNGLLIGHTMODELIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightModeli", ptr)
    PFNGLLIGHTMODELIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightModeliv", ptr)
    PFNGLLIGHTFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightf", ptr)
    PFNGLLIGHTFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightfv", ptr)
    PFNGLLIGHTIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLighti", ptr)
    PFNGLLIGHTIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLightiv", ptr)
    PFNGLLINESTIPPLEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLineStipple", ptr)
    PFNGLLINEWIDTHPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLineWidth", ptr)
    PFNGLLISTBASEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glListBase", ptr)
    PFNGLLOADIDENTITYPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLoadIdentity", ptr)
    PFNGLLOADMATRIXDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLoadMatrixd", ptr)
    PFNGLLOADMATRIXFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLoadMatrixf", ptr)
    PFNGLLOADNAMEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLoadName", ptr)
    PFNGLLOGICOPPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glLogicOp", ptr)
    PFNGLMAP1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMap1d", ptr)
    PFNGLMAP1FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMap1f", ptr)
    PFNGLMAP2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMap2d", ptr)
    PFNGLMAP2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMap2f", ptr)
    PFNGLMAPGRID1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMapGrid1d", ptr)
    PFNGLMAPGRID1FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMapGrid1f", ptr)
    PFNGLMAPGRID2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMapGrid2d", ptr)
    PFNGLMAPGRID2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMapGrid2f", ptr)
    PFNGLMATERIALFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMaterialf", ptr)
    PFNGLMATERIALFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMaterialfv", ptr)
    PFNGLMATERIALIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMateriali", ptr)
    PFNGLMATERIALIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMaterialiv", ptr)
    PFNGLMATRIXMODEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMatrixMode", ptr)
    PFNGLMULTMATRIXDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMultMatrixd", ptr)
    PFNGLMULTMATRIXFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glMultMatrixf", ptr)
    PFNGLNEWLISTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNewList", ptr)
    PFNGLNORMAL3BPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3b", ptr)
    PFNGLNORMAL3BVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3bv", ptr)
    PFNGLNORMAL3DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3d", ptr)
    PFNGLNORMAL3DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3dv", ptr)
    PFNGLNORMAL3FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3f", ptr)
    PFNGLNORMAL3FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3fv", ptr)
    PFNGLNORMAL3IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3i", ptr)
    PFNGLNORMAL3IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3iv", ptr)
    PFNGLNORMAL3SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3s", ptr)
    PFNGLNORMAL3SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormal3sv", ptr)
    PFNGLNORMALPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glNormalPointer", ptr)
    PFNGLORTHOPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glOrtho", ptr)
    PFNGLPASSTHROUGHPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPassThrough", ptr)
    PFNGLPIXELMAPFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelMapfv", ptr)
    PFNGLPIXELMAPUIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelMapuiv", ptr)
    PFNGLPIXELMAPUSVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelMapusv", ptr)
    PFNGLPIXELSTOREFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelStoref", ptr)
    PFNGLPIXELSTOREIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelStorei", ptr)
    PFNGLPIXELTRANSFERFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelTransferf", ptr)
    PFNGLPIXELTRANSFERIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelTransferi", ptr)
    PFNGLPIXELZOOMPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPixelZoom", ptr)
    PFNGLPOINTSIZEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPointSize", ptr)
    PFNGLPOLYGONMODEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPolygonMode", ptr)
    PFNGLPOLYGONOFFSETPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPolygonOffset", ptr)
    PFNGLPOLYGONSTIPPLEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPolygonStipple", ptr)
    PFNGLPOPATTRIBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPopAttrib", ptr)
    PFNGLPOPCLIENTATTRIBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPopClientAttrib", ptr)
    PFNGLPOPMATRIXPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPopMatrix", ptr)
    PFNGLPOPNAMEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPopName", ptr)
    PFNGLPRIORITIZETEXTURESPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPrioritizeTextures", ptr)
    PFNGLPUSHATTRIBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPushAttrib", ptr)
    PFNGLPUSHCLIENTATTRIBPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPushClientAttrib", ptr)
    PFNGLPUSHMATRIXPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPushMatrix", ptr)
    PFNGLPUSHNAMEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glPushName", ptr)
    PFNGLRASTERPOS2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2d", ptr)
    PFNGLRASTERPOS2DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2dv", ptr)
    PFNGLRASTERPOS2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2f", ptr)
    PFNGLRASTERPOS2FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2fv", ptr)
    PFNGLRASTERPOS2IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2i", ptr)
    PFNGLRASTERPOS2IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2iv", ptr)
    PFNGLRASTERPOS2SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2s", ptr)
    PFNGLRASTERPOS2SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos2sv", ptr)
    PFNGLRASTERPOS3DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3d", ptr)
    PFNGLRASTERPOS3DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3dv", ptr)
    PFNGLRASTERPOS3FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3f", ptr)
    PFNGLRASTERPOS3FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3fv", ptr)
    PFNGLRASTERPOS3IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3i", ptr)
    PFNGLRASTERPOS3IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3iv", ptr)
    PFNGLRASTERPOS3SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3s", ptr)
    PFNGLRASTERPOS3SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos3sv", ptr)
    PFNGLRASTERPOS4DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4d", ptr)
    PFNGLRASTERPOS4DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4dv", ptr)
    PFNGLRASTERPOS4FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4f", ptr)
    PFNGLRASTERPOS4FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4fv", ptr)
    PFNGLRASTERPOS4IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4i", ptr)
    PFNGLRASTERPOS4IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4iv", ptr)
    PFNGLRASTERPOS4SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4s", ptr)
    PFNGLRASTERPOS4SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRasterPos4sv", ptr)
    PFNGLREADBUFFERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glReadBuffer", ptr)
    PFNGLREADPIXELSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glReadPixels", ptr)
    PFNGLRECTDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectd", ptr)
    PFNGLRECTDVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectdv", ptr)
    PFNGLRECTFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectf", ptr)
    PFNGLRECTFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectfv", ptr)
    PFNGLRECTIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRecti", ptr)
    PFNGLRECTIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectiv", ptr)
    PFNGLRECTSPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRects", ptr)
    PFNGLRECTSVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRectsv", ptr)
    PFNGLRENDERMODEPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRenderMode", ptr)
    PFNGLROTATEDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRotated", ptr)
    PFNGLROTATEFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glRotatef", ptr)
    PFNGLSCALEDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glScaled", ptr)
    PFNGLSCALEFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glScalef", ptr)
    PFNGLSCISSORPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glScissor", ptr)
    PFNGLSELECTBUFFERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glSelectBuffer", ptr)
    PFNGLSHADEMODELPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glShadeModel", ptr)
    PFNGLSTENCILFUNCPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glStencilFunc", ptr)
    PFNGLSTENCILMASKPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glStencilMask", ptr)
    PFNGLSTENCILOPPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glStencilOp", ptr)
    PFNGLTEXCOORD1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1d", ptr)
    PFNGLTEXCOORD1DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1dv", ptr)
    PFNGLTEXCOORD1FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1f", ptr)
    PFNGLTEXCOORD1FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1fv", ptr)
    PFNGLTEXCOORD1IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1i", ptr)
    PFNGLTEXCOORD1IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1iv", ptr)
    PFNGLTEXCOORD1SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1s", ptr)
    PFNGLTEXCOORD1SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord1sv", ptr)
    PFNGLTEXCOORD2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2d", ptr)
    PFNGLTEXCOORD2DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2dv", ptr)
    PFNGLTEXCOORD2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2f", ptr)
    PFNGLTEXCOORD2FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2fv", ptr)
    PFNGLTEXCOORD2IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2i", ptr)
    PFNGLTEXCOORD2IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2iv", ptr)
    PFNGLTEXCOORD2SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2s", ptr)
    PFNGLTEXCOORD2SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord2sv", ptr)
    PFNGLTEXCOORD3DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3d", ptr)
    PFNGLTEXCOORD3DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3dv", ptr)
    PFNGLTEXCOORD3FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3f", ptr)
    PFNGLTEXCOORD3FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3fv", ptr)
    PFNGLTEXCOORD3IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3i", ptr)
    PFNGLTEXCOORD3IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3iv", ptr)
    PFNGLTEXCOORD3SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3s", ptr)
    PFNGLTEXCOORD3SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord3sv", ptr)
    PFNGLTEXCOORD4DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4d", ptr)
    PFNGLTEXCOORD4DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4dv", ptr)
    PFNGLTEXCOORD4FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4f", ptr)
    PFNGLTEXCOORD4FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4fv", ptr)
    PFNGLTEXCOORD4IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4i", ptr)
    PFNGLTEXCOORD4IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4iv", ptr)
    PFNGLTEXCOORD4SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4s", ptr)
    PFNGLTEXCOORD4SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoord4sv", ptr)
    PFNGLTEXCOORDPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexCoordPointer", ptr)
    PFNGLTEXENVFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexEnvf", ptr)
    PFNGLTEXENVFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexEnvfv", ptr)
    PFNGLTEXENVIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexEnvi", ptr)
    PFNGLTEXENVIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexEnviv", ptr)
    PFNGLTEXGENDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGend", ptr)
    PFNGLTEXGENDVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGendv", ptr)
    PFNGLTEXGENFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGenf", ptr)
    PFNGLTEXGENFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGenfv", ptr)
    PFNGLTEXGENIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGeni", ptr)
    PFNGLTEXGENIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexGeniv", ptr)
    PFNGLTEXIMAGE1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexImage1D", ptr)
    PFNGLTEXIMAGE2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexImage2D", ptr)
    PFNGLTEXPARAMETERFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexParameterf", ptr)
    PFNGLTEXPARAMETERFVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexParameterfv", ptr)
    PFNGLTEXPARAMETERIPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexParameteri", ptr)
    PFNGLTEXPARAMETERIVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexParameteriv", ptr)
    PFNGLTEXSUBIMAGE1DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexSubImage1D", ptr)
    PFNGLTEXSUBIMAGE2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTexSubImage2D", ptr)
    PFNGLTRANSLATEDPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTranslated", ptr)
    PFNGLTRANSLATEFPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glTranslatef", ptr)
    PFNGLVERTEX2DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2d", ptr)
    PFNGLVERTEX2DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2dv", ptr)
    PFNGLVERTEX2FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2f", ptr)
    PFNGLVERTEX2FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2fv", ptr)
    PFNGLVERTEX2IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2i", ptr)
    PFNGLVERTEX2IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2iv", ptr)
    PFNGLVERTEX2SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2s", ptr)
    PFNGLVERTEX2SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex2sv", ptr)
    PFNGLVERTEX3DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3d", ptr)
    PFNGLVERTEX3DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3dv", ptr)
    PFNGLVERTEX3FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3f", ptr)
    PFNGLVERTEX3FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3fv", ptr)
    PFNGLVERTEX3IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3i", ptr)
    PFNGLVERTEX3IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3iv", ptr)
    PFNGLVERTEX3SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3s", ptr)
    PFNGLVERTEX3SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex3sv", ptr)
    PFNGLVERTEX4DPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4d", ptr)
    PFNGLVERTEX4DVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4dv", ptr)
    PFNGLVERTEX4FPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4f", ptr)
    PFNGLVERTEX4FVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4fv", ptr)
    PFNGLVERTEX4IPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4i", ptr)
    PFNGLVERTEX4IVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4iv", ptr)
    PFNGLVERTEX4SPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4s", ptr)
    PFNGLVERTEX4SVPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertex4sv", ptr)
    PFNGLVERTEXPOINTERPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glVertexPointer", ptr)
    PFNGLVIEWPORTPROC := DllCall(PFNGETPROCADDRESSPROC, ptr, hgl, astr, "glViewport", ptr)

    return 1
  }
  return 0
}


;aglFree frees the librarys, which was loaded using aglInit

aglFree()
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  DllCall("FreeLibrary", ptr, DllCall("GetModuleHandle", "str", "opengl32", ptr))
  DllCall("FreeLibrary", ptr, DllCall("GetModuleHandle", "str", "glu32", ptr))
  return 1
}


;aglCleanup is the same as aglFree, it frees the librarys, which was loaded using aglInit

aglCleanup()
{
  return aglFree()
}


;aglUseGui creates a rendercontext on an AutoHotkey-Gui.
;nGui - the Guinumber, or 0 for the "default" Gui.
;return - the handle of the created rendercontext (HGLRC) or 0 if the rendercontext could not been created.
;First use aglInit, otherwise the function returns an error!
;Use aglUseGui after the Gui is visible, otherwise you must set the viewport
;If a rendercontext was created, the rendercontext will be the current.
;The rendercontext will use the flags PFD_DOUBLEBUFFER, PFD_DRAW_TO_WINDOW and PFD_SUPPORT_OPENGL (defined in wgl.ahk)
;and use 24 colorbits, no alphabits, 32 accumbits, 24 depthbits and 8 stencilbits.
;If PFD_DOUBLEBUFFER is used in flags, glFlush will not work.
;In this case use SwapBuffers (defined in wgl.ahk) instead.

aglUseGui(nGui=0, flags=0x25, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  if (nGui!=0)
    Gui, %nGui%: +LastFound
  else
    Gui, +LastFound
  return aglUseWindow(WinExist(), flags, colorbits, accumbits, depthbits, stencilbits)
}


;aglUseGuiControl creates a rendercontext on an AutoHotkey-GuiControl.
;vLabel - the vLabel of the GuiControl (use a static Control, such as text or pic).
;nGui - the Guinumber, or 0 for the "default" Gui.
;return - the handle of the created rendercontext (HGLRC) or 0 if the rendercontext could not been created.
;First use aglInit, otherwise the function returns an error!
;Use aglUseGuiControl after the Gui is visible, otherwise you must set the viewport
;If a rendercontext was created, the rendercontext will be the current.
;The rendercontext will use the flags PFD_DOUBLEBUFFER, PFD_DRAW_TO_WINDOW and PFD_SUPPORT_OPENGL (defined in wgl.ahk)
;and use 24 colorbits, no alphabits, 32 accumbits, 24 depthbits and 8 stencilbits.
;If PFD_DOUBLEBUFFER is used in flags, glFlush will not work.
;In this case use SwapBuffers (defined in wgl.ahk) instead.

aglUseGuiControl(vLabel, nGui=0, flags=0x25, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  if (nGui!=0)
    GuiControlGet, hWnd, %nGui%:hWnd, % vLabel
  else
    GuiControlGet, hWnd, hWnd, % vLabel
  return aglUseWindow(hWnd, flags, colorbits, accumbits, depthbits, stencilbits)
}


;aglUseWindow creates a rendercontext on a window.
;hWnd - the handle (unique identifer) of the window.
;return - the handle of the created rendercontext (HGLRC) or 0 if the rendercontext could not been created.
;First use aglInit, otherwise the function returns an error!
;If a rendercontext was created, the rendercontext will be the current.
;The rendercontext will use the flags PFD_DOUBLEBUFFER, PFD_DRAW_TO_WINDOW and PFD_SUPPORT_OPENGL (defined in wgl.ahk)
;and use 24 colorbits, no alphabits, 32 accumbits, 24 depthbits and 8 stencilbits.
;If PFD_DOUBLEBUFFER is used in flags, glFlush will not work.
;In this case use SwapBuffers (defined in wgl.ahk) instead.

aglUseWindow(hWnd, flags=0x25, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(hDC := DllCall("GetDC", ptr, hWnd, ptr)))
    return 0
  WinSet, Style, +0x04000000, ahk_id %hWnd% ;WS_CLIPSIBLINGS
  WinSet, Style, +0x02000000, ahk_id %hWnd% ;WS_CLIPCHILDREN
  VarSetCapacity(pfd, 40, 0)
  NumPut(40, pfd, 0, "short")
  NumPut(1, pfd, 2, "short")
  NumPut(flags, pfd, 4, "uint")
  NumPut(colorbits, pfd, 9, "uchar")
  NumPut(alphabits, pfd, 16, "uchar")
  NumPut(accumbits, pfd, 18, "uchar")
  NumPut(depthbits, pfd, 23, "uchar")
  NumPut(stencilbits, pfd, 24, "uchar")
  if (!DllCall("GetModuleHandle", "str", "opengl32", ptr))
    aglInit()
  if (!(pf := DllCall("ChoosePixelFormat", ptr, hDC, ptr, &pfd, "int")))
    return 0
  if (!DllCall("SetPixelFormat", ptr, hDC, "int", pf, ptr, &pfd, "uint"))
    return 0
  if (!(hRC := DllCall("opengl32\wglCreateContext", ptr, hDC, ptr)))
    return 0
  DllCall("opengl32\wglMakeCurrent", ptr, hDC, ptr, hRC)
  return hRC
}

aglIsMultisampleSupported(multisample=0)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"
  old_hDC := DllCall("opengl32\glGetCurrentDC", ptr)
  old_hRC := DllCall("opengl32\glGetCurrentContext", ptr)
  max := 0
  if (hWnd := DllCall("CreateWindowEx", "uint", 0, "str", "STATIC", "str", "", "uint", 0, "int", 0, "int", 0, "int", 1, "int", 1, ptr, 0, ptr, 0, ptr, 0, ptr, 0, ptr))
  {
    if (hRC := aglUseWindow(hWnd))
    {
      if (aglIsWglExt("WGL_ARB_multisample"))
      {
        if (PFNWGLCHOOSEPIXELFORMATARBPROC := DllCall("opengl32\wglGetProcAddress", astr, "wglChoosePixelFormatARB", ptr))
        {
          success_init := 1
          hDC := DllCall("opengl32\glGetCurrentDC", ptr)
          DllCall("opengl32\wglMakeCurrent", ptr, 0, ptr, 0)
          DllCall("opengl32\wglDeleteContext", ptr, hRC)
          DllCall("ReleaseDC", ptr, hDC)
          hDC := DllCall("GetDC", ptr, hWnd, ptr)

          VarSetCapacity(fAttributes, 8, 0)
          VarSetCapacity(iAttributes, 96, 0)
          NumPut(0x2001, iAttributes,  0, "int")  NumPut(1,      iAttributes,  4, "int") ;WGL_DRAW_TO_WINDOW_ARB
          NumPut(0x2010, iAttributes,  8, "int")  NumPut(1,      iAttributes, 12, "int") ;WGL_SUPPORT_OPENGL_ARB
          NumPut(0x2003, iAttributes, 16, "int")  NumPut(0x2027, iAttributes, 20, "int") ;WGL_ACCELERATION_ARB - WGL_FULL_ACCELERATION_ARB
          NumPut(0x2014, iAttributes, 24, "int")  NumPut(24,     iAttributes, 28, "int") ;WGL_COLOR_BITS_ARB
          NumPut(0x201B, iAttributes, 32, "int")  NumPut(8,      iAttributes, 36, "int") ;WGL_ALPHA_BITS_ARB
          NumPut(0x201D, iAttributes, 40, "int")  NumPut(32,     iAttributes, 44, "int") ;WGL_ACCUM_BITS_ARB
          NumPut(0x2022, iAttributes, 48, "int")  NumPut(24,     iAttributes, 52, "int") ;WGL_DEPTH_BITS_ARB
          NumPut(0x2023, iAttributes, 56, "int")  NumPut(8,      iAttributes, 60, "int") ;WGL_STENCIL_BITS_ARB
          NumPut(0x2011, iAttributes, 64, "int")  NumPut(1,      iAttributes, 68, "int") ;WGL_DOUBLE_BUFFER_ARB
          NumPut(0x2041, iAttributes, 72, "int")  NumPut(1,      iAttributes, 76, "int") ;WGL_SAMPLE_BUFFERS_ARB
          NumPut(0x2042, iAttributes, 80, "int")  NumPut(multisample, iAttributes, 84, "int") ;WGL_SAMPLES_ARB
          VarSetCapacity(pf, 4, 0)
          if (!multisample)
          {
            test := "32 16 8 4 2"
            Loop, parse, test, % " "
            {
              NumPut(A_LoopField, iAttributes, 84, "int")
              result := DllCall(PFNWGLCHOOSEPIXELFORMATARBPROC, ptr, hDC, ptr, &iAttributes, ptr, &fAttributes, "uint", 1, ptr, &pf, "uint*", nf)
              if ((result) && (nf >= 1))
              {
                max := A_LoopField
                break
              }
            }
          }
          else
          {
            result := DllCall(PFNWGLCHOOSEPIXELFORMATARBPROC, ptr, hDC, ptr, &iAttributes, ptr, &fAttributes, "uint", 1, ptr, &pf, "uint*", nf)
            max := ((result) && (nf >= 1)) ? 1 : 0
          }
        }
        DllCall("ReleaseDC", ptr, hDC)
      }
      if (!success_init)
      {
        hDC := DllCall("opengl32\glGetCurrentDC", ptr)
        DllCall("opengl32\wglMakeCurrent", ptr, 0, ptr, 0)
        DllCall("opengl32\wglDeleteContext", ptr, hRC)
        DllCall("ReleaseDC", ptr, hDC)
      }
      DllCall("opengl32\wglMakeCurrent", ptr, old_hDC, ptr, old_hRC)
    }
    DllCall("DestroyWindow", ptr, hWnd)
  }
  return max
}


aglUseGuiMultisample(nGui=0, multisample=2, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  if (nGui!=0)
    Gui, %nGui%: +LastFound
  else
    Gui, +LastFound
  return aglUseWindowMultisample(WinExist(), multisample, colorbits, alphabits, accumbits, depthbits, stencilbits)
}

aglUseGuiControlMultisample(vLabel, nGui=0, multisample=2, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  if (nGui!=0)
    GuiControlGet, hWnd, %nGui%:hWnd, % vLabel
  else
    GuiControlGet, hWnd, hWnd, % vLabel
  return aglUseWindowMultisample(hWnd, multisample, colorbits, accumbits, depthbits, stencilbits)
}

aglUseWindowMultisample(hWnd, multisample=2, colorbits=24, alphabits=0, accumbits=32, depthbits=24, stencilbits=8)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"
  if ((!multisample) || (!aglIsMultisampleSupported(multisample)))
    return aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)
  if (!(hRC := aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)))
    return 0
  VarSetCapacity(fAttributes, 8, 0)
  VarSetCapacity(iAttributes, 96, 0)
  NumPut(0x2001, iAttributes,  0, "int")  NumPut(1, iAttributes,  4, "int") ;WGL_DRAW_TO_WINDOW_ARB
  NumPut(0x2010, iAttributes,  8, "int")  NumPut(1, iAttributes, 12, "int") ;WGL_SUPPORT_OPENGL_ARB
  NumPut(0x2003, iAttributes, 16, "int")  NumPut(0x2027, iAttributes, 20, "int") ;WGL_ACCELERATION_ARB - WGL_FULL_ACCELERATION_ARB
  NumPut(0x2014, iAttributes, 24, "int")  NumPut(colorbits, iAttributes, 28, "int") ;WGL_COLOR_BITS_ARB
  NumPut(0x201B, iAttributes, 32, "int")  NumPut(alphabits, iAttributes, 36, "int") ;WGL_ALPHA_BITS_ARB
  NumPut(0x201D, iAttributes, 40, "int")  NumPut(accumbits, iAttributes, 44, "int") ;WGL_ACCUM_BITS_ARB
  NumPut(0x2022, iAttributes, 48, "int")  NumPut(depthbits, iAttributes, 52, "int") ;WGL_DEPTH_BITS_ARB
  NumPut(0x2023, iAttributes, 56, "int")  NumPut(stencilbits, iAttributes, 60, "int") ;WGL_STENCIL_BITS_ARB
  NumPut(0x2011, iAttributes, 64, "int")  NumPut(1, iAttributes, 68, "int") ;WGL_DOUBLE_BUFFER_ARB
  NumPut(0x2041, iAttributes, 72, "int")  NumPut(1, iAttributes, 76, "int") ;WGL_SAMPLE_BUFFERS_ARB
  NumPut(0x2042, iAttributes, 80, "int")  NumPut(multisample, iAttributes, 84, "int") ;WGL_SAMPLES_ARB

  PFNWGLCHOOSEPIXELFORMATARBPROC := DllCall("opengl32\wglGetProcAddress", astr, "wglChoosePixelFormatARB", ptr)
  hDC := DllCall("opengl32\glGetCurrentDC", ptr)
  DllCall("opengl32\wglMakeCurrent", ptr, 0, ptr, 0)
  DllCall("opengl32\wglDeleteContext", ptr, hRC)
  DllCall("ReleaseDC", ptr, hDC)

  hDC := DllCall("GetDC", ptr, hWnd, ptr)
  result := DllCall(PFNWGLCHOOSEPIXELFORMATARBPROC, ptr, hDC, ptr, &iAttributes, ptr, &fAttributes, "uint", 1, "int*", pf, "uint*", nf)
  if ((!result) || (nf = 0))
    return aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)
  VarSetCapacity(pfd, 40, 0)
  NumPut(40, pfd, 0, "short")
  NumPut(1, pfd, 2, "short")
  if (!DllCall("DescribePixelFormat", ptr, hDC, "int", pf, "uint", 40, ptr, &pfd))
  {
    DllCall("ReleaseDC", ptr, hDC)
    return aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)
  }
  NumPut(colorbits, pfd, 9, "uchar")
  NumPut(alphabits, pfd, 16, "uchar")
  NumPut(accumbits, pfd, 18, "uchar")
  NumPut(depthbits, pfd, 23, "uchar")
  NumPut(stencilbits, pfd, 24, "uchar")
  if (!DllCall("SetPixelFormat", ptr, hDC, "int", pf, ptr, &pfd, "uint"))
  {
    DllCall("ReleaseDC", ptr, hDC)
    return aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)
  }
  if (!(hRC := DllCall("opengl32\wglCreateContext", ptr, hDC, ptr)))
  {
    DllCall("ReleaseDC", ptr, hDC)
    return aglUseWindow(hWnd, 0x25, colorbits, alphabits, accumbits, depthbits, stencilbits)
  }
  DllCall("opengl32\wglMakeCurrent", ptr, hDC, ptr, hRC)
  DllCall("ReleaseDC", ptr, hDC)
  DllCall("opengl32\glEnable", "uint", 0x809D) ;GL_MULTISAMPLE[_ARB]
  return hRC
}


;aglGetDC returns the handle to the devicecontext of a window.
;The devicecontext must be released, by using aglReleaseDC.

aglGetDC(hWnd)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  return DllCall("GetDC", ptr, hWnd, ptr)
}


;aglReleaseDC releases a devicecontext.

aglReleaseDC(hDC)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  return DllCall("ReleaseDC", ptr, hDC, "uint")
}


;aglInitExt initializes all procaddresses of the functions defined in glext.ahk.
;Call this function AFTER you created a rendercontext, if you need the extensions.
;return - 1 on success or 0 on failure.

aglInitExt()
{
  global
  local wglGetProcAddress, ptr, astr
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"

  if (!(wglGetProcAddress := DllCall("GetProcAddress", ptr, DllCall("GetModuleHandle", "str", "opengl32", ptr), astr, "wglGetProcAddress", ptr)))
    return 0
  GLDEBUGPROCARB := DllCall(wglGetProcAddress, astr, "glDebugProcARB", ptr)
  GLDEBUGPROCAMD := DllCall(wglGetProcAddress, astr, "glDebugProcAMD", ptr)
  PFNGLBLENDCOLORPROC := DllCall(wglGetProcAddress, astr, "glBlendColor", ptr)
  PFNGLBLENDEQUATIONPROC := DllCall(wglGetProcAddress, astr, "glBlendEquation", ptr)
  PFNGLDRAWRANGEELEMENTSPROC := DllCall(wglGetProcAddress, astr, "glDrawRangeElements", ptr)
  PFNGLTEXIMAGE3DPROC := DllCall(wglGetProcAddress, astr, "glTexImage3D", ptr)
  PFNGLTEXSUBIMAGE3DPROC := DllCall(wglGetProcAddress, astr, "glTexSubImage3D", ptr)
  PFNGLCOPYTEXSUBIMAGE3DPROC := DllCall(wglGetProcAddress, astr, "glCopyTexSubImage3D", ptr)
  PFNGLCOLORTABLEPROC := DllCall(wglGetProcAddress, astr, "glColorTable", ptr)
  PFNGLCOLORTABLEPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glColorTableParameterfv", ptr)
  PFNGLCOLORTABLEPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glColorTableParameteriv", ptr)
  PFNGLCOPYCOLORTABLEPROC := DllCall(wglGetProcAddress, astr, "glCopyColorTable", ptr)
  PFNGLGETCOLORTABLEPROC := DllCall(wglGetProcAddress, astr, "glGetColorTable", ptr)
  PFNGLGETCOLORTABLEPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameterfv", ptr)
  PFNGLGETCOLORTABLEPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameteriv", ptr)
  PFNGLCOLORSUBTABLEPROC := DllCall(wglGetProcAddress, astr, "glColorSubTable", ptr)
  PFNGLCOPYCOLORSUBTABLEPROC := DllCall(wglGetProcAddress, astr, "glCopyColorSubTable", ptr)
  PFNGLCONVOLUTIONFILTER1DPROC := DllCall(wglGetProcAddress, astr, "glConvolutionFilter1D", ptr)
  PFNGLCONVOLUTIONFILTER2DPROC := DllCall(wglGetProcAddress, astr, "glConvolutionFilter2D", ptr)
  PFNGLCONVOLUTIONPARAMETERFPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameterf", ptr)
  PFNGLCONVOLUTIONPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameterfv", ptr)
  PFNGLCONVOLUTIONPARAMETERIPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameteri", ptr)
  PFNGLCONVOLUTIONPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameteriv", ptr)
  PFNGLCOPYCONVOLUTIONFILTER1DPROC := DllCall(wglGetProcAddress, astr, "glCopyConvolutionFilter1D", ptr)
  PFNGLCOPYCONVOLUTIONFILTER2DPROC := DllCall(wglGetProcAddress, astr, "glCopyConvolutionFilter2D", ptr)
  PFNGLGETCONVOLUTIONFILTERPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionFilter", ptr)
  PFNGLGETCONVOLUTIONPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionParameterfv", ptr)
  PFNGLGETCONVOLUTIONPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionParameteriv", ptr)
  PFNGLGETSEPARABLEFILTERPROC := DllCall(wglGetProcAddress, astr, "glGetSeparableFilter", ptr)
  PFNGLSEPARABLEFILTER2DPROC := DllCall(wglGetProcAddress, astr, "glSeparableFilter2D", ptr)
  PFNGLGETHISTOGRAMPROC := DllCall(wglGetProcAddress, astr, "glGetHistogram", ptr)
  PFNGLGETHISTOGRAMPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glGetHistogramParameterfv", ptr)
  PFNGLGETHISTOGRAMPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetHistogramParameteriv", ptr)
  PFNGLGETMINMAXPROC := DllCall(wglGetProcAddress, astr, "glGetMinmax", ptr)
  PFNGLGETMINMAXPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glGetMinmaxParameterfv", ptr)
  PFNGLGETMINMAXPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetMinmaxParameteriv", ptr)
  PFNGLHISTOGRAMPROC := DllCall(wglGetProcAddress, astr, "glHistogram", ptr)
  PFNGLMINMAXPROC := DllCall(wglGetProcAddress, astr, "glMinmax", ptr)
  PFNGLRESETHISTOGRAMPROC := DllCall(wglGetProcAddress, astr, "glResetHistogram", ptr)
  PFNGLRESETMINMAXPROC := DllCall(wglGetProcAddress, astr, "glResetMinmax", ptr)
  PFNGLACTIVETEXTUREPROC := DllCall(wglGetProcAddress, astr, "glActiveTexture", ptr)
  PFNGLSAMPLECOVERAGEPROC := DllCall(wglGetProcAddress, astr, "glSampleCoverage", ptr)
  PFNGLCOMPRESSEDTEXIMAGE3DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage3D", ptr)
  PFNGLCOMPRESSEDTEXIMAGE2DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage2D", ptr)
  PFNGLCOMPRESSEDTEXIMAGE1DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage1D", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage3D", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage2D", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage1D", ptr)
  PFNGLGETCOMPRESSEDTEXIMAGEPROC := DllCall(wglGetProcAddress, astr, "glGetCompressedTexImage", ptr)
  PFNGLCLIENTACTIVETEXTUREPROC := DllCall(wglGetProcAddress, astr, "glClientActiveTexture", ptr)
  PFNGLMULTITEXCOORD1DPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1d", ptr)
  PFNGLMULTITEXCOORD1DVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1dv", ptr)
  PFNGLMULTITEXCOORD1FPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1f", ptr)
  PFNGLMULTITEXCOORD1FVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1fv", ptr)
  PFNGLMULTITEXCOORD1IPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1i", ptr)
  PFNGLMULTITEXCOORD1IVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1iv", ptr)
  PFNGLMULTITEXCOORD1SPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1s", ptr)
  PFNGLMULTITEXCOORD1SVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1sv", ptr)
  PFNGLMULTITEXCOORD2DPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2d", ptr)
  PFNGLMULTITEXCOORD2DVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2dv", ptr)
  PFNGLMULTITEXCOORD2FPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2f", ptr)
  PFNGLMULTITEXCOORD2FVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2fv", ptr)
  PFNGLMULTITEXCOORD2IPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2i", ptr)
  PFNGLMULTITEXCOORD2IVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2iv", ptr)
  PFNGLMULTITEXCOORD2SPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2s", ptr)
  PFNGLMULTITEXCOORD2SVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2sv", ptr)
  PFNGLMULTITEXCOORD3DPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3d", ptr)
  PFNGLMULTITEXCOORD3DVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3dv", ptr)
  PFNGLMULTITEXCOORD3FPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3f", ptr)
  PFNGLMULTITEXCOORD3FVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3fv", ptr)
  PFNGLMULTITEXCOORD3IPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3i", ptr)
  PFNGLMULTITEXCOORD3IVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3iv", ptr)
  PFNGLMULTITEXCOORD3SPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3s", ptr)
  PFNGLMULTITEXCOORD3SVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3sv", ptr)
  PFNGLMULTITEXCOORD4DPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4d", ptr)
  PFNGLMULTITEXCOORD4DVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4dv", ptr)
  PFNGLMULTITEXCOORD4FPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4f", ptr)
  PFNGLMULTITEXCOORD4FVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4fv", ptr)
  PFNGLMULTITEXCOORD4IPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4i", ptr)
  PFNGLMULTITEXCOORD4IVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4iv", ptr)
  PFNGLMULTITEXCOORD4SPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4s", ptr)
  PFNGLMULTITEXCOORD4SVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4sv", ptr)
  PFNGLLOADTRANSPOSEMATRIXFPROC := DllCall(wglGetProcAddress, astr, "glLoadTransposeMatrixf", ptr)
  PFNGLLOADTRANSPOSEMATRIXDPROC := DllCall(wglGetProcAddress, astr, "glLoadTransposeMatrixd", ptr)
  PFNGLMULTTRANSPOSEMATRIXFPROC := DllCall(wglGetProcAddress, astr, "glMultTransposeMatrixf", ptr)
  PFNGLMULTTRANSPOSEMATRIXDPROC := DllCall(wglGetProcAddress, astr, "glMultTransposeMatrixd", ptr)
  PFNGLBLENDFUNCSEPARATEPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparate", ptr)
  PFNGLMULTIDRAWARRAYSPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawArrays", ptr)
  PFNGLMULTIDRAWELEMENTSPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawElements", ptr)
  PFNGLPOINTPARAMETERFPROC := DllCall(wglGetProcAddress, astr, "glPointParameterf", ptr)
  PFNGLPOINTPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfv", ptr)
  PFNGLPOINTPARAMETERIPROC := DllCall(wglGetProcAddress, astr, "glPointParameteri", ptr)
  PFNGLPOINTPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glPointParameteriv", ptr)
  PFNGLFOGCOORDFPROC := DllCall(wglGetProcAddress, astr, "glFogCoordf", ptr)
  PFNGLFOGCOORDFVPROC := DllCall(wglGetProcAddress, astr, "glFogCoordfv", ptr)
  PFNGLFOGCOORDDPROC := DllCall(wglGetProcAddress, astr, "glFogCoordd", ptr)
  PFNGLFOGCOORDDVPROC := DllCall(wglGetProcAddress, astr, "glFogCoorddv", ptr)
  PFNGLFOGCOORDPOINTERPROC := DllCall(wglGetProcAddress, astr, "glFogCoordPointer", ptr)
  PFNGLSECONDARYCOLOR3BPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3b", ptr)
  PFNGLSECONDARYCOLOR3BVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3bv", ptr)
  PFNGLSECONDARYCOLOR3DPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3d", ptr)
  PFNGLSECONDARYCOLOR3DVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3dv", ptr)
  PFNGLSECONDARYCOLOR3FPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3f", ptr)
  PFNGLSECONDARYCOLOR3FVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3fv", ptr)
  PFNGLSECONDARYCOLOR3IPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3i", ptr)
  PFNGLSECONDARYCOLOR3IVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3iv", ptr)
  PFNGLSECONDARYCOLOR3SPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3s", ptr)
  PFNGLSECONDARYCOLOR3SVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3sv", ptr)
  PFNGLSECONDARYCOLOR3UBPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ub", ptr)
  PFNGLSECONDARYCOLOR3UBVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ubv", ptr)
  PFNGLSECONDARYCOLOR3UIPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ui", ptr)
  PFNGLSECONDARYCOLOR3UIVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3uiv", ptr)
  PFNGLSECONDARYCOLOR3USPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3us", ptr)
  PFNGLSECONDARYCOLOR3USVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3usv", ptr)
  PFNGLSECONDARYCOLORPOINTERPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorPointer", ptr)
  PFNGLWINDOWPOS2DPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2d", ptr)
  PFNGLWINDOWPOS2DVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2dv", ptr)
  PFNGLWINDOWPOS2FPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2f", ptr)
  PFNGLWINDOWPOS2FVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2fv", ptr)
  PFNGLWINDOWPOS2IPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2i", ptr)
  PFNGLWINDOWPOS2IVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2iv", ptr)
  PFNGLWINDOWPOS2SPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2s", ptr)
  PFNGLWINDOWPOS2SVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2sv", ptr)
  PFNGLWINDOWPOS3DPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3d", ptr)
  PFNGLWINDOWPOS3DVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3dv", ptr)
  PFNGLWINDOWPOS3FPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3f", ptr)
  PFNGLWINDOWPOS3FVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3fv", ptr)
  PFNGLWINDOWPOS3IPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3i", ptr)
  PFNGLWINDOWPOS3IVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3iv", ptr)
  PFNGLWINDOWPOS3SPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3s", ptr)
  PFNGLWINDOWPOS3SVPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3sv", ptr)
  PFNGLGENQUERIESPROC := DllCall(wglGetProcAddress, astr, "glGenQueries", ptr)
  PFNGLDELETEQUERIESPROC := DllCall(wglGetProcAddress, astr, "glDeleteQueries", ptr)
  PFNGLISQUERYPROC := DllCall(wglGetProcAddress, astr, "glIsQuery", ptr)
  PFNGLBEGINQUERYPROC := DllCall(wglGetProcAddress, astr, "glBeginQuery", ptr)
  PFNGLENDQUERYPROC := DllCall(wglGetProcAddress, astr, "glEndQuery", ptr)
  PFNGLGETQUERYIVPROC := DllCall(wglGetProcAddress, astr, "glGetQueryiv", ptr)
  PFNGLGETQUERYOBJECTIVPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectiv", ptr)
  PFNGLGETQUERYOBJECTUIVPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectuiv", ptr)
  PFNGLBINDBUFFERPROC := DllCall(wglGetProcAddress, astr, "glBindBuffer", ptr)
  PFNGLDELETEBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glDeleteBuffers", ptr)
  PFNGLGENBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glGenBuffers", ptr)
  PFNGLISBUFFERPROC := DllCall(wglGetProcAddress, astr, "glIsBuffer", ptr)
  PFNGLBUFFERDATAPROC := DllCall(wglGetProcAddress, astr, "glBufferData", ptr)
  PFNGLBUFFERSUBDATAPROC := DllCall(wglGetProcAddress, astr, "glBufferSubData", ptr)
  PFNGLGETBUFFERSUBDATAPROC := DllCall(wglGetProcAddress, astr, "glGetBufferSubData", ptr)
  PFNGLGETBUFFERPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetBufferParameteriv", ptr)
  PFNGLGETBUFFERPOINTERVPROC := DllCall(wglGetProcAddress, astr, "glGetBufferPointerv", ptr)
  PFNGLBLENDEQUATIONSEPARATEPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationSeparate", ptr)
  PFNGLDRAWBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glDrawBuffers", ptr)
  PFNGLSTENCILOPSEPARATEPROC := DllCall(wglGetProcAddress, astr, "glStencilOpSeparate", ptr)
  PFNGLSTENCILFUNCSEPARATEPROC := DllCall(wglGetProcAddress, astr, "glStencilFuncSeparate", ptr)
  PFNGLSTENCILMASKSEPARATEPROC := DllCall(wglGetProcAddress, astr, "glStencilMaskSeparate", ptr)
  PFNGLATTACHSHADERPROC := DllCall(wglGetProcAddress, astr, "glAttachShader", ptr)
  PFNGLBINDATTRIBLOCATIONPROC := DllCall(wglGetProcAddress, astr, "glBindAttribLocation", ptr)
  PFNGLCOMPILESHADERPROC := DllCall(wglGetProcAddress, astr, "glCompileShader", ptr)
  PFNGLDELETEPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glDeleteProgram", ptr)
  PFNGLDELETESHADERPROC := DllCall(wglGetProcAddress, astr, "glDeleteShader", ptr)
  PFNGLDETACHSHADERPROC := DllCall(wglGetProcAddress, astr, "glDetachShader", ptr)
  PFNGLDISABLEVERTEXATTRIBARRAYPROC := DllCall(wglGetProcAddress, astr, "glDisableVertexAttribArray", ptr)
  PFNGLENABLEVERTEXATTRIBARRAYPROC := DllCall(wglGetProcAddress, astr, "glEnableVertexAttribArray", ptr)
  PFNGLGETACTIVEATTRIBPROC := DllCall(wglGetProcAddress, astr, "glGetActiveAttrib", ptr)
  PFNGLGETACTIVEUNIFORMPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniform", ptr)
  PFNGLGETATTACHEDSHADERSPROC := DllCall(wglGetProcAddress, astr, "glGetAttachedShaders", ptr)
  PFNGLGETPROGRAMIVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramiv", ptr)
  PFNGLGETPROGRAMINFOLOGPROC := DllCall(wglGetProcAddress, astr, "glGetProgramInfoLog", ptr)
  PFNGLGETSHADERIVPROC := DllCall(wglGetProcAddress, astr, "glGetShaderiv", ptr)
  PFNGLGETSHADERINFOLOGPROC := DllCall(wglGetProcAddress, astr, "glGetShaderInfoLog", ptr)
  PFNGLGETSHADERSOURCEPROC := DllCall(wglGetProcAddress, astr, "glGetShaderSource", ptr)
  PFNGLGETUNIFORMFVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformfv", ptr)
  PFNGLGETUNIFORMIVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformiv", ptr)
  PFNGLGETVERTEXATTRIBDVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribdv", ptr)
  PFNGLGETVERTEXATTRIBFVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribfv", ptr)
  PFNGLGETVERTEXATTRIBIVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribiv", ptr)
  PFNGLGETVERTEXATTRIBPOINTERVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribPointerv", ptr)
  PFNGLLINKPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glLinkProgram", ptr)
  PFNGLSHADERSOURCEPROC := DllCall(wglGetProcAddress, astr, "glShaderSource", ptr)
  PFNGLUSEPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glUseProgram", ptr)
  PFNGLUNIFORM1FPROC := DllCall(wglGetProcAddress, astr, "glUniform1f", ptr)
  PFNGLUNIFORM2FPROC := DllCall(wglGetProcAddress, astr, "glUniform2f", ptr)
  PFNGLUNIFORM3FPROC := DllCall(wglGetProcAddress, astr, "glUniform3f", ptr)
  PFNGLUNIFORM4FPROC := DllCall(wglGetProcAddress, astr, "glUniform4f", ptr)
  PFNGLUNIFORM1IPROC := DllCall(wglGetProcAddress, astr, "glUniform1i", ptr)
  PFNGLUNIFORM2IPROC := DllCall(wglGetProcAddress, astr, "glUniform2i", ptr)
  PFNGLUNIFORM3IPROC := DllCall(wglGetProcAddress, astr, "glUniform3i", ptr)
  PFNGLUNIFORM4IPROC := DllCall(wglGetProcAddress, astr, "glUniform4i", ptr)
  PFNGLUNIFORM1FVPROC := DllCall(wglGetProcAddress, astr, "glUniform1fv", ptr)
  PFNGLUNIFORM2FVPROC := DllCall(wglGetProcAddress, astr, "glUniform2fv", ptr)
  PFNGLUNIFORM3FVPROC := DllCall(wglGetProcAddress, astr, "glUniform3fv", ptr)
  PFNGLUNIFORM4FVPROC := DllCall(wglGetProcAddress, astr, "glUniform4fv", ptr)
  PFNGLUNIFORM1IVPROC := DllCall(wglGetProcAddress, astr, "glUniform1iv", ptr)
  PFNGLUNIFORM2IVPROC := DllCall(wglGetProcAddress, astr, "glUniform2iv", ptr)
  PFNGLUNIFORM3IVPROC := DllCall(wglGetProcAddress, astr, "glUniform3iv", ptr)
  PFNGLUNIFORM4IVPROC := DllCall(wglGetProcAddress, astr, "glUniform4iv", ptr)
  PFNGLUNIFORMMATRIX2FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2fv", ptr)
  PFNGLUNIFORMMATRIX3FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3fv", ptr)
  PFNGLUNIFORMMATRIX4FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4fv", ptr)
  PFNGLVALIDATEPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glValidateProgram", ptr)
  PFNGLVERTEXATTRIB1DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1d", ptr)
  PFNGLVERTEXATTRIB1DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1dv", ptr)
  PFNGLVERTEXATTRIB1FPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1f", ptr)
  PFNGLVERTEXATTRIB1FVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1fv", ptr)
  PFNGLVERTEXATTRIB1SPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1s", ptr)
  PFNGLVERTEXATTRIB1SVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1sv", ptr)
  PFNGLVERTEXATTRIB2DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2d", ptr)
  PFNGLVERTEXATTRIB2DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2dv", ptr)
  PFNGLVERTEXATTRIB2FPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2f", ptr)
  PFNGLVERTEXATTRIB2FVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2fv", ptr)
  PFNGLVERTEXATTRIB2SPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2s", ptr)
  PFNGLVERTEXATTRIB2SVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2sv", ptr)
  PFNGLVERTEXATTRIB3DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3d", ptr)
  PFNGLVERTEXATTRIB3DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3dv", ptr)
  PFNGLVERTEXATTRIB3FPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3f", ptr)
  PFNGLVERTEXATTRIB3FVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3fv", ptr)
  PFNGLVERTEXATTRIB3SPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3s", ptr)
  PFNGLVERTEXATTRIB3SVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3sv", ptr)
  PFNGLVERTEXATTRIB4NBVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nbv", ptr)
  PFNGLVERTEXATTRIB4NIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Niv", ptr)
  PFNGLVERTEXATTRIB4NSVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nsv", ptr)
  PFNGLVERTEXATTRIB4NUBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nub", ptr)
  PFNGLVERTEXATTRIB4NUBVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nubv", ptr)
  PFNGLVERTEXATTRIB4NUIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nuiv", ptr)
  PFNGLVERTEXATTRIB4NUSVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4Nusv", ptr)
  PFNGLVERTEXATTRIB4BVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4bv", ptr)
  PFNGLVERTEXATTRIB4DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4d", ptr)
  PFNGLVERTEXATTRIB4DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4dv", ptr)
  PFNGLVERTEXATTRIB4FPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4f", ptr)
  PFNGLVERTEXATTRIB4FVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4fv", ptr)
  PFNGLVERTEXATTRIB4IVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4iv", ptr)
  PFNGLVERTEXATTRIB4SPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4s", ptr)
  PFNGLVERTEXATTRIB4SVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4sv", ptr)
  PFNGLVERTEXATTRIB4UBVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4ubv", ptr)
  PFNGLVERTEXATTRIB4UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4uiv", ptr)
  PFNGLVERTEXATTRIB4USVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4usv", ptr)
  PFNGLVERTEXATTRIBPOINTERPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribPointer", ptr)
  PFNGLUNIFORMMATRIX2X3FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2x3fv", ptr)
  PFNGLUNIFORMMATRIX3X2FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3x2fv", ptr)
  PFNGLUNIFORMMATRIX2X4FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2x4fv", ptr)
  PFNGLUNIFORMMATRIX4X2FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4x2fv", ptr)
  PFNGLUNIFORMMATRIX3X4FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3x4fv", ptr)
  PFNGLUNIFORMMATRIX4X3FVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4x3fv", ptr)
  PFNGLCOLORMASKIPROC := DllCall(wglGetProcAddress, astr, "glColorMaski", ptr)
  PFNGLGETBOOLEANI_VPROC := DllCall(wglGetProcAddress, astr, "glGetBooleani_v", ptr)
  PFNGLGETINTEGERI_VPROC := DllCall(wglGetProcAddress, astr, "glGetIntegeri_v", ptr)
  PFNGLENABLEIPROC := DllCall(wglGetProcAddress, astr, "glEnablei", ptr)
  PFNGLDISABLEIPROC := DllCall(wglGetProcAddress, astr, "glDisablei", ptr)
  PFNGLBEGINTRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glBeginTransformFeedback", ptr)
  PFNGLENDTRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glEndTransformFeedback", ptr)
  PFNGLBINDBUFFERRANGEPROC := DllCall(wglGetProcAddress, astr, "glBindBufferRange", ptr)
  PFNGLBINDBUFFERBASEPROC := DllCall(wglGetProcAddress, astr, "glBindBufferBase", ptr)
  PFNGLTRANSFORMFEEDBACKVARYINGSPROC := DllCall(wglGetProcAddress, astr, "glTransformFeedbackVaryings", ptr)
  PFNGLGETTRANSFORMFEEDBACKVARYINGPROC := DllCall(wglGetProcAddress, astr, "glGetTransformFeedbackVarying", ptr)
  PFNGLCLAMPCOLORPROC := DllCall(wglGetProcAddress, astr, "glClampColor", ptr)
  PFNGLBEGINCONDITIONALRENDERPROC := DllCall(wglGetProcAddress, astr, "glBeginConditionalRender", ptr)
  PFNGLENDCONDITIONALRENDERPROC := DllCall(wglGetProcAddress, astr, "glEndConditionalRender", ptr)
  PFNGLVERTEXATTRIBIPOINTERPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribIPointer", ptr)
  PFNGLGETVERTEXATTRIBIIVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribIiv", ptr)
  PFNGLGETVERTEXATTRIBIUIVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribIuiv", ptr)
  PFNGLVERTEXATTRIBI1IPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1i", ptr)
  PFNGLVERTEXATTRIBI2IPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2i", ptr)
  PFNGLVERTEXATTRIBI3IPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3i", ptr)
  PFNGLVERTEXATTRIBI4IPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4i", ptr)
  PFNGLVERTEXATTRIBI1UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1ui", ptr)
  PFNGLVERTEXATTRIBI2UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2ui", ptr)
  PFNGLVERTEXATTRIBI3UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3ui", ptr)
  PFNGLVERTEXATTRIBI4UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4ui", ptr)
  PFNGLVERTEXATTRIBI1IVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1iv", ptr)
  PFNGLVERTEXATTRIBI2IVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2iv", ptr)
  PFNGLVERTEXATTRIBI3IVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3iv", ptr)
  PFNGLVERTEXATTRIBI4IVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4iv", ptr)
  PFNGLVERTEXATTRIBI1UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1uiv", ptr)
  PFNGLVERTEXATTRIBI2UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2uiv", ptr)
  PFNGLVERTEXATTRIBI3UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3uiv", ptr)
  PFNGLVERTEXATTRIBI4UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4uiv", ptr)
  PFNGLVERTEXATTRIBI4BVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4bv", ptr)
  PFNGLVERTEXATTRIBI4SVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4sv", ptr)
  PFNGLVERTEXATTRIBI4UBVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4ubv", ptr)
  PFNGLVERTEXATTRIBI4USVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4usv", ptr)
  PFNGLGETUNIFORMUIVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformuiv", ptr)
  PFNGLBINDFRAGDATALOCATIONPROC := DllCall(wglGetProcAddress, astr, "glBindFragDataLocation", ptr)
  PFNGLUNIFORM1UIPROC := DllCall(wglGetProcAddress, astr, "glUniform1ui", ptr)
  PFNGLUNIFORM2UIPROC := DllCall(wglGetProcAddress, astr, "glUniform2ui", ptr)
  PFNGLUNIFORM3UIPROC := DllCall(wglGetProcAddress, astr, "glUniform3ui", ptr)
  PFNGLUNIFORM4UIPROC := DllCall(wglGetProcAddress, astr, "glUniform4ui", ptr)
  PFNGLUNIFORM1UIVPROC := DllCall(wglGetProcAddress, astr, "glUniform1uiv", ptr)
  PFNGLUNIFORM2UIVPROC := DllCall(wglGetProcAddress, astr, "glUniform2uiv", ptr)
  PFNGLUNIFORM3UIVPROC := DllCall(wglGetProcAddress, astr, "glUniform3uiv", ptr)
  PFNGLUNIFORM4UIVPROC := DllCall(wglGetProcAddress, astr, "glUniform4uiv", ptr)
  PFNGLTEXPARAMETERIIVPROC := DllCall(wglGetProcAddress, astr, "glTexParameterIiv", ptr)
  PFNGLTEXPARAMETERIUIVPROC := DllCall(wglGetProcAddress, astr, "glTexParameterIuiv", ptr)
  PFNGLGETTEXPARAMETERIIVPROC := DllCall(wglGetProcAddress, astr, "glGetTexParameterIiv", ptr)
  PFNGLGETTEXPARAMETERIUIVPROC := DllCall(wglGetProcAddress, astr, "glGetTexParameterIuiv", ptr)
  PFNGLCLEARBUFFERIVPROC := DllCall(wglGetProcAddress, astr, "glClearBufferiv", ptr)
  PFNGLCLEARBUFFERUIVPROC := DllCall(wglGetProcAddress, astr, "glClearBufferuiv", ptr)
  PFNGLCLEARBUFFERFVPROC := DllCall(wglGetProcAddress, astr, "glClearBufferfv", ptr)
  PFNGLCLEARBUFFERFIPROC := DllCall(wglGetProcAddress, astr, "glClearBufferfi", ptr)
  PFNGLDRAWARRAYSINSTANCEDPROC := DllCall(wglGetProcAddress, astr, "glDrawArraysInstanced", ptr)
  PFNGLDRAWELEMENTSINSTANCEDPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsInstanced", ptr)
  PFNGLTEXBUFFERPROC := DllCall(wglGetProcAddress, astr, "glTexBuffer", ptr)
  PFNGLPRIMITIVERESTARTINDEXPROC := DllCall(wglGetProcAddress, astr, "glPrimitiveRestartIndex", ptr)
  PFNGLGETINTEGER64I_VPROC := DllCall(wglGetProcAddress, astr, "glGetInteger64i_v", ptr)
  PFNGLGETBUFFERPARAMETERI64VPROC := DllCall(wglGetProcAddress, astr, "glGetBufferParameteri64v", ptr)
  PFNGLFRAMEBUFFERTEXTUREPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture", ptr)
  PFNGLVERTEXATTRIBDIVISORPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribDivisor", ptr)
  PFNGLMINSAMPLESHADINGPROC := DllCall(wglGetProcAddress, astr, "glMinSampleShading", ptr)
  PFNGLBLENDEQUATIONIPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationi", ptr)
  PFNGLBLENDEQUATIONSEPARATEIPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationSeparatei", ptr)
  PFNGLBLENDFUNCIPROC := DllCall(wglGetProcAddress, astr, "glBlendFunci", ptr)
  PFNGLBLENDFUNCSEPARATEIPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparatei", ptr)
  PFNGLACTIVETEXTUREARBPROC := DllCall(wglGetProcAddress, astr, "glActiveTextureARB", ptr)
  PFNGLCLIENTACTIVETEXTUREARBPROC := DllCall(wglGetProcAddress, astr, "glClientActiveTextureARB", ptr)
  PFNGLMULTITEXCOORD1DARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1dARB", ptr)
  PFNGLMULTITEXCOORD1DVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1dvARB", ptr)
  PFNGLMULTITEXCOORD1FARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1fARB", ptr)
  PFNGLMULTITEXCOORD1FVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1fvARB", ptr)
  PFNGLMULTITEXCOORD1IARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1iARB", ptr)
  PFNGLMULTITEXCOORD1IVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1ivARB", ptr)
  PFNGLMULTITEXCOORD1SARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1sARB", ptr)
  PFNGLMULTITEXCOORD1SVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1svARB", ptr)
  PFNGLMULTITEXCOORD2DARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2dARB", ptr)
  PFNGLMULTITEXCOORD2DVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2dvARB", ptr)
  PFNGLMULTITEXCOORD2FARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2fARB", ptr)
  PFNGLMULTITEXCOORD2FVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2fvARB", ptr)
  PFNGLMULTITEXCOORD2IARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2iARB", ptr)
  PFNGLMULTITEXCOORD2IVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2ivARB", ptr)
  PFNGLMULTITEXCOORD2SARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2sARB", ptr)
  PFNGLMULTITEXCOORD2SVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2svARB", ptr)
  PFNGLMULTITEXCOORD3DARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3dARB", ptr)
  PFNGLMULTITEXCOORD3DVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3dvARB", ptr)
  PFNGLMULTITEXCOORD3FARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3fARB", ptr)
  PFNGLMULTITEXCOORD3FVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3fvARB", ptr)
  PFNGLMULTITEXCOORD3IARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3iARB", ptr)
  PFNGLMULTITEXCOORD3IVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3ivARB", ptr)
  PFNGLMULTITEXCOORD3SARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3sARB", ptr)
  PFNGLMULTITEXCOORD3SVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3svARB", ptr)
  PFNGLMULTITEXCOORD4DARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4dARB", ptr)
  PFNGLMULTITEXCOORD4DVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4dvARB", ptr)
  PFNGLMULTITEXCOORD4FARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4fARB", ptr)
  PFNGLMULTITEXCOORD4FVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4fvARB", ptr)
  PFNGLMULTITEXCOORD4IARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4iARB", ptr)
  PFNGLMULTITEXCOORD4IVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4ivARB", ptr)
  PFNGLMULTITEXCOORD4SARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4sARB", ptr)
  PFNGLMULTITEXCOORD4SVARBPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4svARB", ptr)
  PFNGLLOADTRANSPOSEMATRIXFARBPROC := DllCall(wglGetProcAddress, astr, "glLoadTransposeMatrixfARB", ptr)
  PFNGLLOADTRANSPOSEMATRIXDARBPROC := DllCall(wglGetProcAddress, astr, "glLoadTransposeMatrixdARB", ptr)
  PFNGLMULTTRANSPOSEMATRIXFARBPROC := DllCall(wglGetProcAddress, astr, "glMultTransposeMatrixfARB", ptr)
  PFNGLMULTTRANSPOSEMATRIXDARBPROC := DllCall(wglGetProcAddress, astr, "glMultTransposeMatrixdARB", ptr)
  PFNGLSAMPLECOVERAGEARBPROC := DllCall(wglGetProcAddress, astr, "glSampleCoverageARB", ptr)
  PFNGLCOMPRESSEDTEXIMAGE3DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage3DARB", ptr)
  PFNGLCOMPRESSEDTEXIMAGE2DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage2DARB", ptr)
  PFNGLCOMPRESSEDTEXIMAGE1DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexImage1DARB", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage3DARB", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage2DARB", ptr)
  PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC := DllCall(wglGetProcAddress, astr, "glCompressedTexSubImage1DARB", ptr)
  PFNGLGETCOMPRESSEDTEXIMAGEARBPROC := DllCall(wglGetProcAddress, astr, "glGetCompressedTexImageARB", ptr)
  PFNGLPOINTPARAMETERFARBPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfARB", ptr)
  PFNGLPOINTPARAMETERFVARBPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfvARB", ptr)
  PFNGLWEIGHTBVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightbvARB", ptr)
  PFNGLWEIGHTSVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightsvARB", ptr)
  PFNGLWEIGHTIVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightivARB", ptr)
  PFNGLWEIGHTFVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightfvARB", ptr)
  PFNGLWEIGHTDVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightdvARB", ptr)
  PFNGLWEIGHTUBVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightubvARB", ptr)
  PFNGLWEIGHTUSVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightusvARB", ptr)
  PFNGLWEIGHTUIVARBPROC := DllCall(wglGetProcAddress, astr, "glWeightuivARB", ptr)
  PFNGLWEIGHTPOINTERARBPROC := DllCall(wglGetProcAddress, astr, "glWeightPointerARB", ptr)
  PFNGLVERTEXBLENDARBPROC := DllCall(wglGetProcAddress, astr, "glVertexBlendARB", ptr)
  PFNGLCURRENTPALETTEMATRIXARBPROC := DllCall(wglGetProcAddress, astr, "glCurrentPaletteMatrixARB", ptr)
  PFNGLMATRIXINDEXUBVARBPROC := DllCall(wglGetProcAddress, astr, "glMatrixIndexubvARB", ptr)
  PFNGLMATRIXINDEXUSVARBPROC := DllCall(wglGetProcAddress, astr, "glMatrixIndexusvARB", ptr)
  PFNGLMATRIXINDEXUIVARBPROC := DllCall(wglGetProcAddress, astr, "glMatrixIndexuivARB", ptr)
  PFNGLMATRIXINDEXPOINTERARBPROC := DllCall(wglGetProcAddress, astr, "glMatrixIndexPointerARB", ptr)
  PFNGLWINDOWPOS2DARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2dARB", ptr)
  PFNGLWINDOWPOS2DVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2dvARB", ptr)
  PFNGLWINDOWPOS2FARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2fARB", ptr)
  PFNGLWINDOWPOS2FVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2fvARB", ptr)
  PFNGLWINDOWPOS2IARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2iARB", ptr)
  PFNGLWINDOWPOS2IVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2ivARB", ptr)
  PFNGLWINDOWPOS2SARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2sARB", ptr)
  PFNGLWINDOWPOS2SVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2svARB", ptr)
  PFNGLWINDOWPOS3DARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3dARB", ptr)
  PFNGLWINDOWPOS3DVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3dvARB", ptr)
  PFNGLWINDOWPOS3FARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3fARB", ptr)
  PFNGLWINDOWPOS3FVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3fvARB", ptr)
  PFNGLWINDOWPOS3IARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3iARB", ptr)
  PFNGLWINDOWPOS3IVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3ivARB", ptr)
  PFNGLWINDOWPOS3SARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3sARB", ptr)
  PFNGLWINDOWPOS3SVARBPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3svARB", ptr)
  PFNGLVERTEXATTRIB1DARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1dARB", ptr)
  PFNGLVERTEXATTRIB1DVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1dvARB", ptr)
  PFNGLVERTEXATTRIB1FARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1fARB", ptr)
  PFNGLVERTEXATTRIB1FVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1fvARB", ptr)
  PFNGLVERTEXATTRIB1SARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1sARB", ptr)
  PFNGLVERTEXATTRIB1SVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1svARB", ptr)
  PFNGLVERTEXATTRIB2DARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2dARB", ptr)
  PFNGLVERTEXATTRIB2DVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2dvARB", ptr)
  PFNGLVERTEXATTRIB2FARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2fARB", ptr)
  PFNGLVERTEXATTRIB2FVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2fvARB", ptr)
  PFNGLVERTEXATTRIB2SARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2sARB", ptr)
  PFNGLVERTEXATTRIB2SVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2svARB", ptr)
  PFNGLVERTEXATTRIB3DARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3dARB", ptr)
  PFNGLVERTEXATTRIB3DVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3dvARB", ptr)
  PFNGLVERTEXATTRIB3FARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3fARB", ptr)
  PFNGLVERTEXATTRIB3FVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3fvARB", ptr)
  PFNGLVERTEXATTRIB3SARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3sARB", ptr)
  PFNGLVERTEXATTRIB3SVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3svARB", ptr)
  PFNGLVERTEXATTRIB4NBVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NbvARB", ptr)
  PFNGLVERTEXATTRIB4NIVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NivARB", ptr)
  PFNGLVERTEXATTRIB4NSVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NsvARB", ptr)
  PFNGLVERTEXATTRIB4NUBARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NubARB", ptr)
  PFNGLVERTEXATTRIB4NUBVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NubvARB", ptr)
  PFNGLVERTEXATTRIB4NUIVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NuivARB", ptr)
  PFNGLVERTEXATTRIB4NUSVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4NusvARB", ptr)
  PFNGLVERTEXATTRIB4BVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4bvARB", ptr)
  PFNGLVERTEXATTRIB4DARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4dARB", ptr)
  PFNGLVERTEXATTRIB4DVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4dvARB", ptr)
  PFNGLVERTEXATTRIB4FARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4fARB", ptr)
  PFNGLVERTEXATTRIB4FVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4fvARB", ptr)
  PFNGLVERTEXATTRIB4IVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4ivARB", ptr)
  PFNGLVERTEXATTRIB4SARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4sARB", ptr)
  PFNGLVERTEXATTRIB4SVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4svARB", ptr)
  PFNGLVERTEXATTRIB4UBVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4ubvARB", ptr)
  PFNGLVERTEXATTRIB4UIVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4uivARB", ptr)
  PFNGLVERTEXATTRIB4USVARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4usvARB", ptr)
  PFNGLVERTEXATTRIBPOINTERARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribPointerARB", ptr)
  PFNGLENABLEVERTEXATTRIBARRAYARBPROC := DllCall(wglGetProcAddress, astr, "glEnableVertexAttribArrayARB", ptr)
  PFNGLDISABLEVERTEXATTRIBARRAYARBPROC := DllCall(wglGetProcAddress, astr, "glDisableVertexAttribArrayARB", ptr)
  PFNGLPROGRAMSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glProgramStringARB", ptr)
  PFNGLBINDPROGRAMARBPROC := DllCall(wglGetProcAddress, astr, "glBindProgramARB", ptr)
  PFNGLDELETEPROGRAMSARBPROC := DllCall(wglGetProcAddress, astr, "glDeleteProgramsARB", ptr)
  PFNGLGENPROGRAMSARBPROC := DllCall(wglGetProcAddress, astr, "glGenProgramsARB", ptr)
  PFNGLPROGRAMENVPARAMETER4DARBPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameter4dARB", ptr)
  PFNGLPROGRAMENVPARAMETER4DVARBPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameter4dvARB", ptr)
  PFNGLPROGRAMENVPARAMETER4FARBPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameter4fARB", ptr)
  PFNGLPROGRAMENVPARAMETER4FVARBPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameter4fvARB", ptr)
  PFNGLPROGRAMLOCALPARAMETER4DARBPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameter4dARB", ptr)
  PFNGLPROGRAMLOCALPARAMETER4DVARBPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameter4dvARB", ptr)
  PFNGLPROGRAMLOCALPARAMETER4FARBPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameter4fARB", ptr)
  PFNGLPROGRAMLOCALPARAMETER4FVARBPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameter4fvARB", ptr)
  PFNGLGETPROGRAMENVPARAMETERDVARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramEnvParameterdvARB", ptr)
  PFNGLGETPROGRAMENVPARAMETERFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramEnvParameterfvARB", ptr)
  PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramLocalParameterdvARB", ptr)
  PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramLocalParameterfvARB", ptr)
  PFNGLGETPROGRAMIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramivARB", ptr)
  PFNGLGETPROGRAMSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glGetProgramStringARB", ptr)
  PFNGLGETVERTEXATTRIBDVARBPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribdvARB", ptr)
  PFNGLGETVERTEXATTRIBFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribfvARB", ptr)
  PFNGLGETVERTEXATTRIBIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribivARB", ptr)
  PFNGLGETVERTEXATTRIBPOINTERVARBPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribPointervARB", ptr)
  PFNGLBINDBUFFERARBPROC := DllCall(wglGetProcAddress, astr, "glBindBufferARB", ptr)
  PFNGLDELETEBUFFERSARBPROC := DllCall(wglGetProcAddress, astr, "glDeleteBuffersARB", ptr)
  PFNGLGENBUFFERSARBPROC := DllCall(wglGetProcAddress, astr, "glGenBuffersARB", ptr)
  PFNGLBUFFERDATAARBPROC := DllCall(wglGetProcAddress, astr, "glBufferDataARB", ptr)
  PFNGLBUFFERSUBDATAARBPROC := DllCall(wglGetProcAddress, astr, "glBufferSubDataARB", ptr)
  PFNGLGETBUFFERSUBDATAARBPROC := DllCall(wglGetProcAddress, astr, "glGetBufferSubDataARB", ptr)
  PFNGLGETBUFFERPARAMETERIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetBufferParameterivARB", ptr)
  PFNGLGETBUFFERPOINTERVARBPROC := DllCall(wglGetProcAddress, astr, "glGetBufferPointervARB", ptr)
  PFNGLGENQUERIESARBPROC := DllCall(wglGetProcAddress, astr, "glGenQueriesARB", ptr)
  PFNGLDELETEQUERIESARBPROC := DllCall(wglGetProcAddress, astr, "glDeleteQueriesARB", ptr)
  PFNGLBEGINQUERYARBPROC := DllCall(wglGetProcAddress, astr, "glBeginQueryARB", ptr)
  PFNGLENDQUERYARBPROC := DllCall(wglGetProcAddress, astr, "glEndQueryARB", ptr)
  PFNGLGETQUERYIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetQueryivARB", ptr)
  PFNGLGETQUERYOBJECTIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectivARB", ptr)
  PFNGLGETQUERYOBJECTUIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectuivARB", ptr)
  PFNGLDELETEOBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glDeleteObjectARB", ptr)
  PFNGLDETACHOBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glDetachObjectARB", ptr)
  PFNGLSHADERSOURCEARBPROC := DllCall(wglGetProcAddress, astr, "glShaderSourceARB", ptr)
  PFNGLCOMPILESHADERARBPROC := DllCall(wglGetProcAddress, astr, "glCompileShaderARB", ptr)
  PFNGLATTACHOBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glAttachObjectARB", ptr)
  PFNGLLINKPROGRAMARBPROC := DllCall(wglGetProcAddress, astr, "glLinkProgramARB", ptr)
  PFNGLUSEPROGRAMOBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glUseProgramObjectARB", ptr)
  PFNGLVALIDATEPROGRAMARBPROC := DllCall(wglGetProcAddress, astr, "glValidateProgramARB", ptr)
  PFNGLUNIFORM1FARBPROC := DllCall(wglGetProcAddress, astr, "glUniform1fARB", ptr)
  PFNGLUNIFORM2FARBPROC := DllCall(wglGetProcAddress, astr, "glUniform2fARB", ptr)
  PFNGLUNIFORM3FARBPROC := DllCall(wglGetProcAddress, astr, "glUniform3fARB", ptr)
  PFNGLUNIFORM4FARBPROC := DllCall(wglGetProcAddress, astr, "glUniform4fARB", ptr)
  PFNGLUNIFORM1IARBPROC := DllCall(wglGetProcAddress, astr, "glUniform1iARB", ptr)
  PFNGLUNIFORM2IARBPROC := DllCall(wglGetProcAddress, astr, "glUniform2iARB", ptr)
  PFNGLUNIFORM3IARBPROC := DllCall(wglGetProcAddress, astr, "glUniform3iARB", ptr)
  PFNGLUNIFORM4IARBPROC := DllCall(wglGetProcAddress, astr, "glUniform4iARB", ptr)
  PFNGLUNIFORM1FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform1fvARB", ptr)
  PFNGLUNIFORM2FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform2fvARB", ptr)
  PFNGLUNIFORM3FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform3fvARB", ptr)
  PFNGLUNIFORM4FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform4fvARB", ptr)
  PFNGLUNIFORM1IVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform1ivARB", ptr)
  PFNGLUNIFORM2IVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform2ivARB", ptr)
  PFNGLUNIFORM3IVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform3ivARB", ptr)
  PFNGLUNIFORM4IVARBPROC := DllCall(wglGetProcAddress, astr, "glUniform4ivARB", ptr)
  PFNGLUNIFORMMATRIX2FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2fvARB", ptr)
  PFNGLUNIFORMMATRIX3FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3fvARB", ptr)
  PFNGLUNIFORMMATRIX4FVARBPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4fvARB", ptr)
  PFNGLGETOBJECTPARAMETERFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetObjectParameterfvARB", ptr)
  PFNGLGETOBJECTPARAMETERIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetObjectParameterivARB", ptr)
  PFNGLGETINFOLOGARBPROC := DllCall(wglGetProcAddress, astr, "glGetInfoLogARB", ptr)
  PFNGLGETATTACHEDOBJECTSARBPROC := DllCall(wglGetProcAddress, astr, "glGetAttachedObjectsARB", ptr)
  PFNGLGETACTIVEUNIFORMARBPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniformARB", ptr)
  PFNGLGETUNIFORMFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetUniformfvARB", ptr)
  PFNGLGETUNIFORMIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetUniformivARB", ptr)
  PFNGLGETSHADERSOURCEARBPROC := DllCall(wglGetProcAddress, astr, "glGetShaderSourceARB", ptr)
  PFNGLBINDATTRIBLOCATIONARBPROC := DllCall(wglGetProcAddress, astr, "glBindAttribLocationARB", ptr)
  PFNGLGETACTIVEATTRIBARBPROC := DllCall(wglGetProcAddress, astr, "glGetActiveAttribARB", ptr)
  PFNGLDRAWBUFFERSARBPROC := DllCall(wglGetProcAddress, astr, "glDrawBuffersARB", ptr)
  PFNGLCLAMPCOLORARBPROC := DllCall(wglGetProcAddress, astr, "glClampColorARB", ptr)
  PFNGLDRAWARRAYSINSTANCEDARBPROC := DllCall(wglGetProcAddress, astr, "glDrawArraysInstancedARB", ptr)
  PFNGLDRAWELEMENTSINSTANCEDARBPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsInstancedARB", ptr)
  PFNGLBINDRENDERBUFFERPROC := DllCall(wglGetProcAddress, astr, "glBindRenderbuffer", ptr)
  PFNGLDELETERENDERBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glDeleteRenderbuffers", ptr)
  PFNGLGENRENDERBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glGenRenderbuffers", ptr)
  PFNGLRENDERBUFFERSTORAGEPROC := DllCall(wglGetProcAddress, astr, "glRenderbufferStorage", ptr)
  PFNGLGETRENDERBUFFERPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetRenderbufferParameteriv", ptr)
  PFNGLBINDFRAMEBUFFERPROC := DllCall(wglGetProcAddress, astr, "glBindFramebuffer", ptr)
  PFNGLDELETEFRAMEBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glDeleteFramebuffers", ptr)
  PFNGLGENFRAMEBUFFERSPROC := DllCall(wglGetProcAddress, astr, "glGenFramebuffers", ptr)
  PFNGLFRAMEBUFFERTEXTURE1DPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture1D", ptr)
  PFNGLFRAMEBUFFERTEXTURE2DPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture2D", ptr)
  PFNGLFRAMEBUFFERTEXTURE3DPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture3D", ptr)
  PFNGLFRAMEBUFFERRENDERBUFFERPROC := DllCall(wglGetProcAddress, astr, "glFramebufferRenderbuffer", ptr)
  PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetFramebufferAttachmentParameteriv", ptr)
  PFNGLGENERATEMIPMAPPROC := DllCall(wglGetProcAddress, astr, "glGenerateMipmap", ptr)
  PFNGLBLITFRAMEBUFFERPROC := DllCall(wglGetProcAddress, astr, "glBlitFramebuffer", ptr)
  PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC := DllCall(wglGetProcAddress, astr, "glRenderbufferStorageMultisample", ptr)
  PFNGLFRAMEBUFFERTEXTURELAYERPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureLayer", ptr)
  PFNGLPROGRAMPARAMETERIARBPROC := DllCall(wglGetProcAddress, astr, "glProgramParameteriARB", ptr)
  PFNGLFRAMEBUFFERTEXTUREARBPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureARB", ptr)
  PFNGLFRAMEBUFFERTEXTURELAYERARBPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureLayerARB", ptr)
  PFNGLFRAMEBUFFERTEXTUREFACEARBPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureFaceARB", ptr)
  PFNGLVERTEXATTRIBDIVISORARBPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribDivisorARB", ptr)
  PFNGLFLUSHMAPPEDBUFFERRANGEPROC := DllCall(wglGetProcAddress, astr, "glFlushMappedBufferRange", ptr)
  PFNGLTEXBUFFERARBPROC := DllCall(wglGetProcAddress, astr, "glTexBufferARB", ptr)
  PFNGLBINDVERTEXARRAYPROC := DllCall(wglGetProcAddress, astr, "glBindVertexArray", ptr)
  PFNGLDELETEVERTEXARRAYSPROC := DllCall(wglGetProcAddress, astr, "glDeleteVertexArrays", ptr)
  PFNGLGENVERTEXARRAYSPROC := DllCall(wglGetProcAddress, astr, "glGenVertexArrays", ptr)
  PFNGLGETUNIFORMINDICESPROC := DllCall(wglGetProcAddress, astr, "glGetUniformIndices", ptr)
  PFNGLGETACTIVEUNIFORMSIVPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniformsiv", ptr)
  PFNGLGETACTIVEUNIFORMNAMEPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniformName", ptr)
  PFNGLGETACTIVEUNIFORMBLOCKIVPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniformBlockiv", ptr)
  PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC := DllCall(wglGetProcAddress, astr, "glGetActiveUniformBlockName", ptr)
  PFNGLUNIFORMBLOCKBINDINGPROC := DllCall(wglGetProcAddress, astr, "glUniformBlockBinding", ptr)
  PFNGLCOPYBUFFERSUBDATAPROC := DllCall(wglGetProcAddress, astr, "glCopyBufferSubData", ptr)
  PFNGLDRAWELEMENTSBASEVERTEXPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsBaseVertex", ptr)
  PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC := DllCall(wglGetProcAddress, astr, "glDrawRangeElementsBaseVertex", ptr)
  PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsInstancedBaseVertex", ptr)
  PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawElementsBaseVertex", ptr)
  PFNGLPROVOKINGVERTEXPROC := DllCall(wglGetProcAddress, astr, "glProvokingVertex", ptr)
  PFNGLDELETESYNCPROC := DllCall(wglGetProcAddress, astr, "glDeleteSync", ptr)
  PFNGLWAITSYNCPROC := DllCall(wglGetProcAddress, astr, "glWaitSync", ptr)
  PFNGLGETINTEGER64VPROC := DllCall(wglGetProcAddress, astr, "glGetInteger64v", ptr)
  PFNGLGETSYNCIVPROC := DllCall(wglGetProcAddress, astr, "glGetSynciv", ptr)
  PFNGLTEXIMAGE2DMULTISAMPLEPROC := DllCall(wglGetProcAddress, astr, "glTexImage2DMultisample", ptr)
  PFNGLTEXIMAGE3DMULTISAMPLEPROC := DllCall(wglGetProcAddress, astr, "glTexImage3DMultisample", ptr)
  PFNGLGETMULTISAMPLEFVPROC := DllCall(wglGetProcAddress, astr, "glGetMultisamplefv", ptr)
  PFNGLSAMPLEMASKIPROC := DllCall(wglGetProcAddress, astr, "glSampleMaski", ptr)
  PFNGLBLENDEQUATIONIARBPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationiARB", ptr)
  PFNGLBLENDEQUATIONSEPARATEIARBPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationSeparateiARB", ptr)
  PFNGLBLENDFUNCIARBPROC := DllCall(wglGetProcAddress, astr, "glBlendFunciARB", ptr)
  PFNGLBLENDFUNCSEPARATEIARBPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparateiARB", ptr)
  PFNGLMINSAMPLESHADINGARBPROC := DllCall(wglGetProcAddress, astr, "glMinSampleShadingARB", ptr)
  PFNGLNAMEDSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glNamedStringARB", ptr)
  PFNGLDELETENAMEDSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glDeleteNamedStringARB", ptr)
  PFNGLCOMPILESHADERINCLUDEARBPROC := DllCall(wglGetProcAddress, astr, "glCompileShaderIncludeARB", ptr)
  PFNGLGETNAMEDSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glGetNamedStringARB", ptr)
  PFNGLGETNAMEDSTRINGIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetNamedStringivARB", ptr)
  PFNGLBINDFRAGDATALOCATIONINDEXEDPROC := DllCall(wglGetProcAddress, astr, "glBindFragDataLocationIndexed", ptr)
  PFNGLGENSAMPLERSPROC := DllCall(wglGetProcAddress, astr, "glGenSamplers", ptr)
  PFNGLDELETESAMPLERSPROC := DllCall(wglGetProcAddress, astr, "glDeleteSamplers", ptr)
  PFNGLBINDSAMPLERPROC := DllCall(wglGetProcAddress, astr, "glBindSampler", ptr)
  PFNGLSAMPLERPARAMETERIPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameteri", ptr)
  PFNGLSAMPLERPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameteriv", ptr)
  PFNGLSAMPLERPARAMETERFPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameterf", ptr)
  PFNGLSAMPLERPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameterfv", ptr)
  PFNGLSAMPLERPARAMETERIIVPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameterIiv", ptr)
  PFNGLSAMPLERPARAMETERIUIVPROC := DllCall(wglGetProcAddress, astr, "glSamplerParameterIuiv", ptr)
  PFNGLGETSAMPLERPARAMETERIVPROC := DllCall(wglGetProcAddress, astr, "glGetSamplerParameteriv", ptr)
  PFNGLGETSAMPLERPARAMETERIIVPROC := DllCall(wglGetProcAddress, astr, "glGetSamplerParameterIiv", ptr)
  PFNGLGETSAMPLERPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glGetSamplerParameterfv", ptr)
  PFNGLGETSAMPLERPARAMETERIUIVPROC := DllCall(wglGetProcAddress, astr, "glGetSamplerParameterIuiv", ptr)
  PFNGLQUERYCOUNTERPROC := DllCall(wglGetProcAddress, astr, "glQueryCounter", ptr)
  PFNGLGETQUERYOBJECTI64VPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjecti64v", ptr)
  PFNGLGETQUERYOBJECTUI64VPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectui64v", ptr)
  PFNGLVERTEXP2UIPROC := DllCall(wglGetProcAddress, astr, "glVertexP2ui", ptr)
  PFNGLVERTEXP2UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexP2uiv", ptr)
  PFNGLVERTEXP3UIPROC := DllCall(wglGetProcAddress, astr, "glVertexP3ui", ptr)
  PFNGLVERTEXP3UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexP3uiv", ptr)
  PFNGLVERTEXP4UIPROC := DllCall(wglGetProcAddress, astr, "glVertexP4ui", ptr)
  PFNGLVERTEXP4UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexP4uiv", ptr)
  PFNGLTEXCOORDP1UIPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP1ui", ptr)
  PFNGLTEXCOORDP1UIVPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP1uiv", ptr)
  PFNGLTEXCOORDP2UIPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP2ui", ptr)
  PFNGLTEXCOORDP2UIVPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP2uiv", ptr)
  PFNGLTEXCOORDP3UIPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP3ui", ptr)
  PFNGLTEXCOORDP3UIVPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP3uiv", ptr)
  PFNGLTEXCOORDP4UIPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP4ui", ptr)
  PFNGLTEXCOORDP4UIVPROC := DllCall(wglGetProcAddress, astr, "glTexCoordP4uiv", ptr)
  PFNGLMULTITEXCOORDP1UIPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP1ui", ptr)
  PFNGLMULTITEXCOORDP1UIVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP1uiv", ptr)
  PFNGLMULTITEXCOORDP2UIPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP2ui", ptr)
  PFNGLMULTITEXCOORDP2UIVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP2uiv", ptr)
  PFNGLMULTITEXCOORDP3UIPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP3ui", ptr)
  PFNGLMULTITEXCOORDP3UIVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP3uiv", ptr)
  PFNGLMULTITEXCOORDP4UIPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP4ui", ptr)
  PFNGLMULTITEXCOORDP4UIVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordP4uiv", ptr)
  PFNGLNORMALP3UIPROC := DllCall(wglGetProcAddress, astr, "glNormalP3ui", ptr)
  PFNGLNORMALP3UIVPROC := DllCall(wglGetProcAddress, astr, "glNormalP3uiv", ptr)
  PFNGLCOLORP3UIPROC := DllCall(wglGetProcAddress, astr, "glColorP3ui", ptr)
  PFNGLCOLORP3UIVPROC := DllCall(wglGetProcAddress, astr, "glColorP3uiv", ptr)
  PFNGLCOLORP4UIPROC := DllCall(wglGetProcAddress, astr, "glColorP4ui", ptr)
  PFNGLCOLORP4UIVPROC := DllCall(wglGetProcAddress, astr, "glColorP4uiv", ptr)
  PFNGLSECONDARYCOLORP3UIPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorP3ui", ptr)
  PFNGLSECONDARYCOLORP3UIVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorP3uiv", ptr)
  PFNGLVERTEXATTRIBP1UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP1ui", ptr)
  PFNGLVERTEXATTRIBP1UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP1uiv", ptr)
  PFNGLVERTEXATTRIBP2UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP2ui", ptr)
  PFNGLVERTEXATTRIBP2UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP2uiv", ptr)
  PFNGLVERTEXATTRIBP3UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP3ui", ptr)
  PFNGLVERTEXATTRIBP3UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP3uiv", ptr)
  PFNGLVERTEXATTRIBP4UIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP4ui", ptr)
  PFNGLVERTEXATTRIBP4UIVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribP4uiv", ptr)
  PFNGLDRAWARRAYSINDIRECTPROC := DllCall(wglGetProcAddress, astr, "glDrawArraysIndirect", ptr)
  PFNGLDRAWELEMENTSINDIRECTPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsIndirect", ptr)
  PFNGLUNIFORM1DPROC := DllCall(wglGetProcAddress, astr, "glUniform1d", ptr)
  PFNGLUNIFORM2DPROC := DllCall(wglGetProcAddress, astr, "glUniform2d", ptr)
  PFNGLUNIFORM3DPROC := DllCall(wglGetProcAddress, astr, "glUniform3d", ptr)
  PFNGLUNIFORM4DPROC := DllCall(wglGetProcAddress, astr, "glUniform4d", ptr)
  PFNGLUNIFORM1DVPROC := DllCall(wglGetProcAddress, astr, "glUniform1dv", ptr)
  PFNGLUNIFORM2DVPROC := DllCall(wglGetProcAddress, astr, "glUniform2dv", ptr)
  PFNGLUNIFORM3DVPROC := DllCall(wglGetProcAddress, astr, "glUniform3dv", ptr)
  PFNGLUNIFORM4DVPROC := DllCall(wglGetProcAddress, astr, "glUniform4dv", ptr)
  PFNGLUNIFORMMATRIX2DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2dv", ptr)
  PFNGLUNIFORMMATRIX3DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3dv", ptr)
  PFNGLUNIFORMMATRIX4DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4dv", ptr)
  PFNGLUNIFORMMATRIX2X3DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2x3dv", ptr)
  PFNGLUNIFORMMATRIX2X4DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix2x4dv", ptr)
  PFNGLUNIFORMMATRIX3X2DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3x2dv", ptr)
  PFNGLUNIFORMMATRIX3X4DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix3x4dv", ptr)
  PFNGLUNIFORMMATRIX4X2DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4x2dv", ptr)
  PFNGLUNIFORMMATRIX4X3DVPROC := DllCall(wglGetProcAddress, astr, "glUniformMatrix4x3dv", ptr)
  PFNGLGETUNIFORMDVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformdv", ptr)
  PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC := DllCall(wglGetProcAddress, astr, "glGetActiveSubroutineUniformiv", ptr)
  PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC := DllCall(wglGetProcAddress, astr, "glGetActiveSubroutineUniformName", ptr)
  PFNGLGETACTIVESUBROUTINENAMEPROC := DllCall(wglGetProcAddress, astr, "glGetActiveSubroutineName", ptr)
  PFNGLUNIFORMSUBROUTINESUIVPROC := DllCall(wglGetProcAddress, astr, "glUniformSubroutinesuiv", ptr)
  PFNGLGETUNIFORMSUBROUTINEUIVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformSubroutineuiv", ptr)
  PFNGLGETPROGRAMSTAGEIVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramStageiv", ptr)
  PFNGLPATCHPARAMETERIPROC := DllCall(wglGetProcAddress, astr, "glPatchParameteri", ptr)
  PFNGLPATCHPARAMETERFVPROC := DllCall(wglGetProcAddress, astr, "glPatchParameterfv", ptr)
  PFNGLBINDTRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glBindTransformFeedback", ptr)
  PFNGLDELETETRANSFORMFEEDBACKSPROC := DllCall(wglGetProcAddress, astr, "glDeleteTransformFeedbacks", ptr)
  PFNGLGENTRANSFORMFEEDBACKSPROC := DllCall(wglGetProcAddress, astr, "glGenTransformFeedbacks", ptr)
  PFNGLPAUSETRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glPauseTransformFeedback", ptr)
  PFNGLRESUMETRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glResumeTransformFeedback", ptr)
  PFNGLDRAWTRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glDrawTransformFeedback", ptr)
  PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC := DllCall(wglGetProcAddress, astr, "glDrawTransformFeedbackStream", ptr)
  PFNGLBEGINQUERYINDEXEDPROC := DllCall(wglGetProcAddress, astr, "glBeginQueryIndexed", ptr)
  PFNGLENDQUERYINDEXEDPROC := DllCall(wglGetProcAddress, astr, "glEndQueryIndexed", ptr)
  PFNGLGETQUERYINDEXEDIVPROC := DllCall(wglGetProcAddress, astr, "glGetQueryIndexediv", ptr)
  PFNGLRELEASESHADERCOMPILERPROC := DllCall(wglGetProcAddress, astr, "glReleaseShaderCompiler", ptr)
  PFNGLSHADERBINARYPROC := DllCall(wglGetProcAddress, astr, "glShaderBinary", ptr)
  PFNGLGETSHADERPRECISIONFORMATPROC := DllCall(wglGetProcAddress, astr, "glGetShaderPrecisionFormat", ptr)
  PFNGLDEPTHRANGEFPROC := DllCall(wglGetProcAddress, astr, "glDepthRangef", ptr)
  PFNGLCLEARDEPTHFPROC := DllCall(wglGetProcAddress, astr, "glClearDepthf", ptr)
  PFNGLGETPROGRAMBINARYPROC := DllCall(wglGetProcAddress, astr, "glGetProgramBinary", ptr)
  PFNGLPROGRAMBINARYPROC := DllCall(wglGetProcAddress, astr, "glProgramBinary", ptr)
  PFNGLPROGRAMPARAMETERIPROC := DllCall(wglGetProcAddress, astr, "glProgramParameteri", ptr)
  PFNGLUSEPROGRAMSTAGESPROC := DllCall(wglGetProcAddress, astr, "glUseProgramStages", ptr)
  PFNGLACTIVESHADERPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glActiveShaderProgram", ptr)
  PFNGLBINDPROGRAMPIPELINEPROC := DllCall(wglGetProcAddress, astr, "glBindProgramPipeline", ptr)
  PFNGLDELETEPROGRAMPIPELINESPROC := DllCall(wglGetProcAddress, astr, "glDeleteProgramPipelines", ptr)
  PFNGLGENPROGRAMPIPELINESPROC := DllCall(wglGetProcAddress, astr, "glGenProgramPipelines", ptr)
  PFNGLGETPROGRAMPIPELINEIVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramPipelineiv", ptr)
  PFNGLPROGRAMUNIFORM1IPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1i", ptr)
  PFNGLPROGRAMUNIFORM1IVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1iv", ptr)
  PFNGLPROGRAMUNIFORM1FPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1f", ptr)
  PFNGLPROGRAMUNIFORM1FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1fv", ptr)
  PFNGLPROGRAMUNIFORM1DPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1d", ptr)
  PFNGLPROGRAMUNIFORM1DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1dv", ptr)
  PFNGLPROGRAMUNIFORM1UIPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1ui", ptr)
  PFNGLPROGRAMUNIFORM1UIVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1uiv", ptr)
  PFNGLPROGRAMUNIFORM2IPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2i", ptr)
  PFNGLPROGRAMUNIFORM2IVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2iv", ptr)
  PFNGLPROGRAMUNIFORM2FPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2f", ptr)
  PFNGLPROGRAMUNIFORM2FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2fv", ptr)
  PFNGLPROGRAMUNIFORM2DPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2d", ptr)
  PFNGLPROGRAMUNIFORM2DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2dv", ptr)
  PFNGLPROGRAMUNIFORM2UIPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2ui", ptr)
  PFNGLPROGRAMUNIFORM2UIVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2uiv", ptr)
  PFNGLPROGRAMUNIFORM3IPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3i", ptr)
  PFNGLPROGRAMUNIFORM3IVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3iv", ptr)
  PFNGLPROGRAMUNIFORM3FPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3f", ptr)
  PFNGLPROGRAMUNIFORM3FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3fv", ptr)
  PFNGLPROGRAMUNIFORM3DPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3d", ptr)
  PFNGLPROGRAMUNIFORM3DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3dv", ptr)
  PFNGLPROGRAMUNIFORM3UIPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3ui", ptr)
  PFNGLPROGRAMUNIFORM3UIVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3uiv", ptr)
  PFNGLPROGRAMUNIFORM4IPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4i", ptr)
  PFNGLPROGRAMUNIFORM4IVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4iv", ptr)
  PFNGLPROGRAMUNIFORM4FPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4f", ptr)
  PFNGLPROGRAMUNIFORM4FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4fv", ptr)
  PFNGLPROGRAMUNIFORM4DPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4d", ptr)
  PFNGLPROGRAMUNIFORM4DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4dv", ptr)
  PFNGLPROGRAMUNIFORM4UIPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4ui", ptr)
  PFNGLPROGRAMUNIFORM4UIVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4uiv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x3fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x2fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x4fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x2fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x4fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x3fv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x3dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x2dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x4dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x2dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x4dv", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x3dv", ptr)
  PFNGLVALIDATEPROGRAMPIPELINEPROC := DllCall(wglGetProcAddress, astr, "glValidateProgramPipeline", ptr)
  PFNGLGETPROGRAMPIPELINEINFOLOGPROC := DllCall(wglGetProcAddress, astr, "glGetProgramPipelineInfoLog", ptr)
  PFNGLVERTEXATTRIBL1DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1d", ptr)
  PFNGLVERTEXATTRIBL2DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2d", ptr)
  PFNGLVERTEXATTRIBL3DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3d", ptr)
  PFNGLVERTEXATTRIBL4DPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4d", ptr)
  PFNGLVERTEXATTRIBL1DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1dv", ptr)
  PFNGLVERTEXATTRIBL2DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2dv", ptr)
  PFNGLVERTEXATTRIBL3DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3dv", ptr)
  PFNGLVERTEXATTRIBL4DVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4dv", ptr)
  PFNGLVERTEXATTRIBLPOINTERPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribLPointer", ptr)
  PFNGLGETVERTEXATTRIBLDVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribLdv", ptr)
  PFNGLVIEWPORTARRAYVPROC := DllCall(wglGetProcAddress, astr, "glViewportArrayv", ptr)
  PFNGLVIEWPORTINDEXEDFPROC := DllCall(wglGetProcAddress, astr, "glViewportIndexedf", ptr)
  PFNGLVIEWPORTINDEXEDFVPROC := DllCall(wglGetProcAddress, astr, "glViewportIndexedfv", ptr)
  PFNGLSCISSORARRAYVPROC := DllCall(wglGetProcAddress, astr, "glScissorArrayv", ptr)
  PFNGLSCISSORINDEXEDPROC := DllCall(wglGetProcAddress, astr, "glScissorIndexed", ptr)
  PFNGLSCISSORINDEXEDVPROC := DllCall(wglGetProcAddress, astr, "glScissorIndexedv", ptr)
  PFNGLDEPTHRANGEARRAYVPROC := DllCall(wglGetProcAddress, astr, "glDepthRangeArrayv", ptr)
  PFNGLDEPTHRANGEINDEXEDPROC := DllCall(wglGetProcAddress, astr, "glDepthRangeIndexed", ptr)
  PFNGLGETFLOATI_VPROC := DllCall(wglGetProcAddress, astr, "glGetFloati_v", ptr)
  PFNGLGETDOUBLEI_VPROC := DllCall(wglGetProcAddress, astr, "glGetDoublei_v", ptr)
  PFNGLDEBUGMESSAGECONTROLARBPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageControlARB", ptr)
  PFNGLDEBUGMESSAGEINSERTARBPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageInsertARB", ptr)
  PFNGLDEBUGMESSAGECALLBACKARBPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageCallbackARB", ptr)
  PFNGLGETNMAPDVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnMapdvARB", ptr)
  PFNGLGETNMAPFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnMapfvARB", ptr)
  PFNGLGETNMAPIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnMapivARB", ptr)
  PFNGLGETNPIXELMAPFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnPixelMapfvARB", ptr)
  PFNGLGETNPIXELMAPUIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnPixelMapuivARB", ptr)
  PFNGLGETNPIXELMAPUSVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnPixelMapusvARB", ptr)
  PFNGLGETNPOLYGONSTIPPLEARBPROC := DllCall(wglGetProcAddress, astr, "glGetnPolygonStippleARB", ptr)
  PFNGLGETNCOLORTABLEARBPROC := DllCall(wglGetProcAddress, astr, "glGetnColorTableARB", ptr)
  PFNGLGETNCONVOLUTIONFILTERARBPROC := DllCall(wglGetProcAddress, astr, "glGetnConvolutionFilterARB", ptr)
  PFNGLGETNSEPARABLEFILTERARBPROC := DllCall(wglGetProcAddress, astr, "glGetnSeparableFilterARB", ptr)
  PFNGLGETNHISTOGRAMARBPROC := DllCall(wglGetProcAddress, astr, "glGetnHistogramARB", ptr)
  PFNGLGETNMINMAXARBPROC := DllCall(wglGetProcAddress, astr, "glGetnMinmaxARB", ptr)
  PFNGLGETNTEXIMAGEARBPROC := DllCall(wglGetProcAddress, astr, "glGetnTexImageARB", ptr)
  PFNGLREADNPIXELSARBPROC := DllCall(wglGetProcAddress, astr, "glReadnPixelsARB", ptr)
  PFNGLGETNCOMPRESSEDTEXIMAGEARBPROC := DllCall(wglGetProcAddress, astr, "glGetnCompressedTexImageARB", ptr)
  PFNGLGETNUNIFORMFVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnUniformfvARB", ptr)
  PFNGLGETNUNIFORMIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnUniformivARB", ptr)
  PFNGLGETNUNIFORMUIVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnUniformuivARB", ptr)
  PFNGLGETNUNIFORMDVARBPROC := DllCall(wglGetProcAddress, astr, "glGetnUniformdvARB", ptr)
  PFNGLBLENDCOLOREXTPROC := DllCall(wglGetProcAddress, astr, "glBlendColorEXT", ptr)
  PFNGLPOLYGONOFFSETEXTPROC := DllCall(wglGetProcAddress, astr, "glPolygonOffsetEXT", ptr)
  PFNGLTEXIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glTexImage3DEXT", ptr)
  PFNGLTEXSUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glTexSubImage3DEXT", ptr)
  PFNGLGETTEXFILTERFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glGetTexFilterFuncSGIS", ptr)
  PFNGLTEXFILTERFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glTexFilterFuncSGIS", ptr)
  PFNGLTEXSUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glTexSubImage1DEXT", ptr)
  PFNGLTEXSUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glTexSubImage2DEXT", ptr)
  PFNGLCOPYTEXIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTexImage1DEXT", ptr)
  PFNGLCOPYTEXIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTexImage2DEXT", ptr)
  PFNGLCOPYTEXSUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTexSubImage1DEXT", ptr)
  PFNGLCOPYTEXSUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTexSubImage2DEXT", ptr)
  PFNGLCOPYTEXSUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTexSubImage3DEXT", ptr)
  PFNGLGETHISTOGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glGetHistogramEXT", ptr)
  PFNGLGETHISTOGRAMPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetHistogramParameterfvEXT", ptr)
  PFNGLGETHISTOGRAMPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetHistogramParameterivEXT", ptr)
  PFNGLGETMINMAXEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMinmaxEXT", ptr)
  PFNGLGETMINMAXPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMinmaxParameterfvEXT", ptr)
  PFNGLGETMINMAXPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMinmaxParameterivEXT", ptr)
  PFNGLHISTOGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glHistogramEXT", ptr)
  PFNGLMINMAXEXTPROC := DllCall(wglGetProcAddress, astr, "glMinmaxEXT", ptr)
  PFNGLRESETHISTOGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glResetHistogramEXT", ptr)
  PFNGLRESETMINMAXEXTPROC := DllCall(wglGetProcAddress, astr, "glResetMinmaxEXT", ptr)
  PFNGLCONVOLUTIONFILTER1DEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionFilter1DEXT", ptr)
  PFNGLCONVOLUTIONFILTER2DEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionFilter2DEXT", ptr)
  PFNGLCONVOLUTIONPARAMETERFEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameterfEXT", ptr)
  PFNGLCONVOLUTIONPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameterfvEXT", ptr)
  PFNGLCONVOLUTIONPARAMETERIEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameteriEXT", ptr)
  PFNGLCONVOLUTIONPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glConvolutionParameterivEXT", ptr)
  PFNGLCOPYCONVOLUTIONFILTER1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyConvolutionFilter1DEXT", ptr)
  PFNGLCOPYCONVOLUTIONFILTER2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyConvolutionFilter2DEXT", ptr)
  PFNGLGETCONVOLUTIONFILTEREXTPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionFilterEXT", ptr)
  PFNGLGETCONVOLUTIONPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionParameterfvEXT", ptr)
  PFNGLGETCONVOLUTIONPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetConvolutionParameterivEXT", ptr)
  PFNGLGETSEPARABLEFILTEREXTPROC := DllCall(wglGetProcAddress, astr, "glGetSeparableFilterEXT", ptr)
  PFNGLSEPARABLEFILTER2DEXTPROC := DllCall(wglGetProcAddress, astr, "glSeparableFilter2DEXT", ptr)
  PFNGLCOLORTABLESGIPROC := DllCall(wglGetProcAddress, astr, "glColorTableSGI", ptr)
  PFNGLCOLORTABLEPARAMETERFVSGIPROC := DllCall(wglGetProcAddress, astr, "glColorTableParameterfvSGI", ptr)
  PFNGLCOLORTABLEPARAMETERIVSGIPROC := DllCall(wglGetProcAddress, astr, "glColorTableParameterivSGI", ptr)
  PFNGLCOPYCOLORTABLESGIPROC := DllCall(wglGetProcAddress, astr, "glCopyColorTableSGI", ptr)
  PFNGLGETCOLORTABLESGIPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableSGI", ptr)
  PFNGLGETCOLORTABLEPARAMETERFVSGIPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameterfvSGI", ptr)
  PFNGLGETCOLORTABLEPARAMETERIVSGIPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameterivSGI", ptr)
  PFNGLPIXELTEXGENSGIXPROC := DllCall(wglGetProcAddress, astr, "glPixelTexGenSGIX", ptr)
  PFNGLPIXELTEXGENPARAMETERISGISPROC := DllCall(wglGetProcAddress, astr, "glPixelTexGenParameteriSGIS", ptr)
  PFNGLPIXELTEXGENPARAMETERIVSGISPROC := DllCall(wglGetProcAddress, astr, "glPixelTexGenParameterivSGIS", ptr)
  PFNGLPIXELTEXGENPARAMETERFSGISPROC := DllCall(wglGetProcAddress, astr, "glPixelTexGenParameterfSGIS", ptr)
  PFNGLPIXELTEXGENPARAMETERFVSGISPROC := DllCall(wglGetProcAddress, astr, "glPixelTexGenParameterfvSGIS", ptr)
  PFNGLGETPIXELTEXGENPARAMETERIVSGISPROC := DllCall(wglGetProcAddress, astr, "glGetPixelTexGenParameterivSGIS", ptr)
  PFNGLGETPIXELTEXGENPARAMETERFVSGISPROC := DllCall(wglGetProcAddress, astr, "glGetPixelTexGenParameterfvSGIS", ptr)
  PFNGLTEXIMAGE4DSGISPROC := DllCall(wglGetProcAddress, astr, "glTexImage4DSGIS", ptr)
  PFNGLTEXSUBIMAGE4DSGISPROC := DllCall(wglGetProcAddress, astr, "glTexSubImage4DSGIS", ptr)
  PFNGLBINDTEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glBindTextureEXT", ptr)
  PFNGLDELETETEXTURESEXTPROC := DllCall(wglGetProcAddress, astr, "glDeleteTexturesEXT", ptr)
  PFNGLGENTEXTURESEXTPROC := DllCall(wglGetProcAddress, astr, "glGenTexturesEXT", ptr)
  PFNGLPRIORITIZETEXTURESEXTPROC := DllCall(wglGetProcAddress, astr, "glPrioritizeTexturesEXT", ptr)
  PFNGLDETAILTEXFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glDetailTexFuncSGIS", ptr)
  PFNGLGETDETAILTEXFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glGetDetailTexFuncSGIS", ptr)
  PFNGLSHARPENTEXFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glSharpenTexFuncSGIS", ptr)
  PFNGLGETSHARPENTEXFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glGetSharpenTexFuncSGIS", ptr)
  PFNGLSAMPLEMASKSGISPROC := DllCall(wglGetProcAddress, astr, "glSampleMaskSGIS", ptr)
  PFNGLSAMPLEPATTERNSGISPROC := DllCall(wglGetProcAddress, astr, "glSamplePatternSGIS", ptr)
  PFNGLARRAYELEMENTEXTPROC := DllCall(wglGetProcAddress, astr, "glArrayElementEXT", ptr)
  PFNGLCOLORPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glColorPointerEXT", ptr)
  PFNGLDRAWARRAYSEXTPROC := DllCall(wglGetProcAddress, astr, "glDrawArraysEXT", ptr)
  PFNGLEDGEFLAGPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glEdgeFlagPointerEXT", ptr)
  PFNGLGETPOINTERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetPointervEXT", ptr)
  PFNGLINDEXPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glIndexPointerEXT", ptr)
  PFNGLNORMALPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glNormalPointerEXT", ptr)
  PFNGLTEXCOORDPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glTexCoordPointerEXT", ptr)
  PFNGLVERTEXPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glVertexPointerEXT", ptr)
  PFNGLBLENDEQUATIONEXTPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationEXT", ptr)
  PFNGLSPRITEPARAMETERFSGIXPROC := DllCall(wglGetProcAddress, astr, "glSpriteParameterfSGIX", ptr)
  PFNGLSPRITEPARAMETERFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glSpriteParameterfvSGIX", ptr)
  PFNGLSPRITEPARAMETERISGIXPROC := DllCall(wglGetProcAddress, astr, "glSpriteParameteriSGIX", ptr)
  PFNGLSPRITEPARAMETERIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glSpriteParameterivSGIX", ptr)
  PFNGLPOINTPARAMETERFEXTPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfEXT", ptr)
  PFNGLPOINTPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfvEXT", ptr)
  PFNGLPOINTPARAMETERFSGISPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfSGIS", ptr)
  PFNGLPOINTPARAMETERFVSGISPROC := DllCall(wglGetProcAddress, astr, "glPointParameterfvSGIS", ptr)
  PFNGLINSTRUMENTSBUFFERSGIXPROC := DllCall(wglGetProcAddress, astr, "glInstrumentsBufferSGIX", ptr)
  PFNGLREADINSTRUMENTSSGIXPROC := DllCall(wglGetProcAddress, astr, "glReadInstrumentsSGIX", ptr)
  PFNGLSTARTINSTRUMENTSSGIXPROC := DllCall(wglGetProcAddress, astr, "glStartInstrumentsSGIX", ptr)
  PFNGLSTOPINSTRUMENTSSGIXPROC := DllCall(wglGetProcAddress, astr, "glStopInstrumentsSGIX", ptr)
  PFNGLFRAMEZOOMSGIXPROC := DllCall(wglGetProcAddress, astr, "glFrameZoomSGIX", ptr)
  PFNGLTAGSAMPLEBUFFERSGIXPROC := DllCall(wglGetProcAddress, astr, "glTagSampleBufferSGIX", ptr)
  PFNGLDEFORMATIONMAP3DSGIXPROC := DllCall(wglGetProcAddress, astr, "glDeformationMap3dSGIX", ptr)
  PFNGLDEFORMATIONMAP3FSGIXPROC := DllCall(wglGetProcAddress, astr, "glDeformationMap3fSGIX", ptr)
  PFNGLDEFORMSGIXPROC := DllCall(wglGetProcAddress, astr, "glDeformSGIX", ptr)
  PFNGLLOADIDENTITYDEFORMATIONMAPSGIXPROC := DllCall(wglGetProcAddress, astr, "glLoadIdentityDeformationMapSGIX", ptr)
  PFNGLREFERENCEPLANESGIXPROC := DllCall(wglGetProcAddress, astr, "glReferencePlaneSGIX", ptr)
  PFNGLFLUSHRASTERSGIXPROC := DllCall(wglGetProcAddress, astr, "glFlushRasterSGIX", ptr)
  PFNGLFOGFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glFogFuncSGIS", ptr)
  PFNGLGETFOGFUNCSGISPROC := DllCall(wglGetProcAddress, astr, "glGetFogFuncSGIS", ptr)
  PFNGLIMAGETRANSFORMPARAMETERIHPPROC := DllCall(wglGetProcAddress, astr, "glImageTransformParameteriHP", ptr)
  PFNGLIMAGETRANSFORMPARAMETERFHPPROC := DllCall(wglGetProcAddress, astr, "glImageTransformParameterfHP", ptr)
  PFNGLIMAGETRANSFORMPARAMETERIVHPPROC := DllCall(wglGetProcAddress, astr, "glImageTransformParameterivHP", ptr)
  PFNGLIMAGETRANSFORMPARAMETERFVHPPROC := DllCall(wglGetProcAddress, astr, "glImageTransformParameterfvHP", ptr)
  PFNGLGETIMAGETRANSFORMPARAMETERIVHPPROC := DllCall(wglGetProcAddress, astr, "glGetImageTransformParameterivHP", ptr)
  PFNGLGETIMAGETRANSFORMPARAMETERFVHPPROC := DllCall(wglGetProcAddress, astr, "glGetImageTransformParameterfvHP", ptr)
  PFNGLCOLORSUBTABLEEXTPROC := DllCall(wglGetProcAddress, astr, "glColorSubTableEXT", ptr)
  PFNGLCOPYCOLORSUBTABLEEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyColorSubTableEXT", ptr)
  PFNGLHINTPGIPROC := DllCall(wglGetProcAddress, astr, "glHintPGI", ptr)
  PFNGLCOLORTABLEEXTPROC := DllCall(wglGetProcAddress, astr, "glColorTableEXT", ptr)
  PFNGLGETCOLORTABLEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableEXT", ptr)
  PFNGLGETCOLORTABLEPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameterivEXT", ptr)
  PFNGLGETCOLORTABLEPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetColorTableParameterfvEXT", ptr)
  PFNGLGETLISTPARAMETERFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetListParameterfvSGIX", ptr)
  PFNGLGETLISTPARAMETERIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetListParameterivSGIX", ptr)
  PFNGLLISTPARAMETERFSGIXPROC := DllCall(wglGetProcAddress, astr, "glListParameterfSGIX", ptr)
  PFNGLLISTPARAMETERFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glListParameterfvSGIX", ptr)
  PFNGLLISTPARAMETERISGIXPROC := DllCall(wglGetProcAddress, astr, "glListParameteriSGIX", ptr)
  PFNGLLISTPARAMETERIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glListParameterivSGIX", ptr)
  PFNGLINDEXMATERIALEXTPROC := DllCall(wglGetProcAddress, astr, "glIndexMaterialEXT", ptr)
  PFNGLINDEXFUNCEXTPROC := DllCall(wglGetProcAddress, astr, "glIndexFuncEXT", ptr)
  PFNGLLOCKARRAYSEXTPROC := DllCall(wglGetProcAddress, astr, "glLockArraysEXT", ptr)
  PFNGLUNLOCKARRAYSEXTPROC := DllCall(wglGetProcAddress, astr, "glUnlockArraysEXT", ptr)
  PFNGLCULLPARAMETERDVEXTPROC := DllCall(wglGetProcAddress, astr, "glCullParameterdvEXT", ptr)
  PFNGLCULLPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glCullParameterfvEXT", ptr)
  PFNGLFRAGMENTCOLORMATERIALSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentColorMaterialSGIX", ptr)
  PFNGLFRAGMENTLIGHTFSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightfSGIX", ptr)
  PFNGLFRAGMENTLIGHTFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightfvSGIX", ptr)
  PFNGLFRAGMENTLIGHTISGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightiSGIX", ptr)
  PFNGLFRAGMENTLIGHTIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightivSGIX", ptr)
  PFNGLFRAGMENTLIGHTMODELFSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightModelfSGIX", ptr)
  PFNGLFRAGMENTLIGHTMODELFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightModelfvSGIX", ptr)
  PFNGLFRAGMENTLIGHTMODELISGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightModeliSGIX", ptr)
  PFNGLFRAGMENTLIGHTMODELIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentLightModelivSGIX", ptr)
  PFNGLFRAGMENTMATERIALFSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentMaterialfSGIX", ptr)
  PFNGLFRAGMENTMATERIALFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentMaterialfvSGIX", ptr)
  PFNGLFRAGMENTMATERIALISGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentMaterialiSGIX", ptr)
  PFNGLFRAGMENTMATERIALIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glFragmentMaterialivSGIX", ptr)
  PFNGLGETFRAGMENTLIGHTFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetFragmentLightfvSGIX", ptr)
  PFNGLGETFRAGMENTLIGHTIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetFragmentLightivSGIX", ptr)
  PFNGLGETFRAGMENTMATERIALFVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetFragmentMaterialfvSGIX", ptr)
  PFNGLGETFRAGMENTMATERIALIVSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetFragmentMaterialivSGIX", ptr)
  PFNGLLIGHTENVISGIXPROC := DllCall(wglGetProcAddress, astr, "glLightEnviSGIX", ptr)
  PFNGLDRAWRANGEELEMENTSEXTPROC := DllCall(wglGetProcAddress, astr, "glDrawRangeElementsEXT", ptr)
  PFNGLAPPLYTEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glApplyTextureEXT", ptr)
  PFNGLTEXTURELIGHTEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureLightEXT", ptr)
  PFNGLTEXTUREMATERIALEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureMaterialEXT", ptr)
  PFNGLASYNCMARKERSGIXPROC := DllCall(wglGetProcAddress, astr, "glAsyncMarkerSGIX", ptr)
  PFNGLDELETEASYNCMARKERSSGIXPROC := DllCall(wglGetProcAddress, astr, "glDeleteAsyncMarkersSGIX", ptr)
  PFNGLVERTEXPOINTERVINTELPROC := DllCall(wglGetProcAddress, astr, "glVertexPointervINTEL", ptr)
  PFNGLNORMALPOINTERVINTELPROC := DllCall(wglGetProcAddress, astr, "glNormalPointervINTEL", ptr)
  PFNGLCOLORPOINTERVINTELPROC := DllCall(wglGetProcAddress, astr, "glColorPointervINTEL", ptr)
  PFNGLTEXCOORDPOINTERVINTELPROC := DllCall(wglGetProcAddress, astr, "glTexCoordPointervINTEL", ptr)
  PFNGLPIXELTRANSFORMPARAMETERIEXTPROC := DllCall(wglGetProcAddress, astr, "glPixelTransformParameteriEXT", ptr)
  PFNGLPIXELTRANSFORMPARAMETERFEXTPROC := DllCall(wglGetProcAddress, astr, "glPixelTransformParameterfEXT", ptr)
  PFNGLPIXELTRANSFORMPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glPixelTransformParameterivEXT", ptr)
  PFNGLPIXELTRANSFORMPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glPixelTransformParameterfvEXT", ptr)
  PFNGLSECONDARYCOLOR3BEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3bEXT", ptr)
  PFNGLSECONDARYCOLOR3BVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3bvEXT", ptr)
  PFNGLSECONDARYCOLOR3DEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3dEXT", ptr)
  PFNGLSECONDARYCOLOR3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3dvEXT", ptr)
  PFNGLSECONDARYCOLOR3FEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3fEXT", ptr)
  PFNGLSECONDARYCOLOR3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3fvEXT", ptr)
  PFNGLSECONDARYCOLOR3IEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3iEXT", ptr)
  PFNGLSECONDARYCOLOR3IVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ivEXT", ptr)
  PFNGLSECONDARYCOLOR3SEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3sEXT", ptr)
  PFNGLSECONDARYCOLOR3SVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3svEXT", ptr)
  PFNGLSECONDARYCOLOR3UBEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ubEXT", ptr)
  PFNGLSECONDARYCOLOR3UBVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3ubvEXT", ptr)
  PFNGLSECONDARYCOLOR3UIEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3uiEXT", ptr)
  PFNGLSECONDARYCOLOR3UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3uivEXT", ptr)
  PFNGLSECONDARYCOLOR3USEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3usEXT", ptr)
  PFNGLSECONDARYCOLOR3USVEXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3usvEXT", ptr)
  PFNGLSECONDARYCOLORPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorPointerEXT", ptr)
  PFNGLTEXTURENORMALEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureNormalEXT", ptr)
  PFNGLMULTIDRAWARRAYSEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawArraysEXT", ptr)
  PFNGLMULTIDRAWELEMENTSEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawElementsEXT", ptr)
  PFNGLFOGCOORDFEXTPROC := DllCall(wglGetProcAddress, astr, "glFogCoordfEXT", ptr)
  PFNGLFOGCOORDFVEXTPROC := DllCall(wglGetProcAddress, astr, "glFogCoordfvEXT", ptr)
  PFNGLFOGCOORDDEXTPROC := DllCall(wglGetProcAddress, astr, "glFogCoorddEXT", ptr)
  PFNGLFOGCOORDDVEXTPROC := DllCall(wglGetProcAddress, astr, "glFogCoorddvEXT", ptr)
  PFNGLFOGCOORDPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glFogCoordPointerEXT", ptr)
  PFNGLTANGENT3BEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3bEXT", ptr)
  PFNGLTANGENT3BVEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3bvEXT", ptr)
  PFNGLTANGENT3DEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3dEXT", ptr)
  PFNGLTANGENT3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3dvEXT", ptr)
  PFNGLTANGENT3FEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3fEXT", ptr)
  PFNGLTANGENT3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3fvEXT", ptr)
  PFNGLTANGENT3IEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3iEXT", ptr)
  PFNGLTANGENT3IVEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3ivEXT", ptr)
  PFNGLTANGENT3SEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3sEXT", ptr)
  PFNGLTANGENT3SVEXTPROC := DllCall(wglGetProcAddress, astr, "glTangent3svEXT", ptr)
  PFNGLBINORMAL3BEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3bEXT", ptr)
  PFNGLBINORMAL3BVEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3bvEXT", ptr)
  PFNGLBINORMAL3DEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3dEXT", ptr)
  PFNGLBINORMAL3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3dvEXT", ptr)
  PFNGLBINORMAL3FEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3fEXT", ptr)
  PFNGLBINORMAL3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3fvEXT", ptr)
  PFNGLBINORMAL3IEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3iEXT", ptr)
  PFNGLBINORMAL3IVEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3ivEXT", ptr)
  PFNGLBINORMAL3SEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3sEXT", ptr)
  PFNGLBINORMAL3SVEXTPROC := DllCall(wglGetProcAddress, astr, "glBinormal3svEXT", ptr)
  PFNGLTANGENTPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glTangentPointerEXT", ptr)
  PFNGLBINORMALPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glBinormalPointerEXT", ptr)
  PFNGLFINISHTEXTURESUNXPROC := DllCall(wglGetProcAddress, astr, "glFinishTextureSUNX", ptr)
  PFNGLGLOBALALPHAFACTORBSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactorbSUN", ptr)
  PFNGLGLOBALALPHAFACTORSSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactorsSUN", ptr)
  PFNGLGLOBALALPHAFACTORISUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactoriSUN", ptr)
  PFNGLGLOBALALPHAFACTORFSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactorfSUN", ptr)
  PFNGLGLOBALALPHAFACTORDSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactordSUN", ptr)
  PFNGLGLOBALALPHAFACTORUBSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactorubSUN", ptr)
  PFNGLGLOBALALPHAFACTORUSSUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactorusSUN", ptr)
  PFNGLGLOBALALPHAFACTORUISUNPROC := DllCall(wglGetProcAddress, astr, "glGlobalAlphaFactoruiSUN", ptr)
  PFNGLREPLACEMENTCODEUISUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiSUN", ptr)
  PFNGLREPLACEMENTCODEUSSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeusSUN", ptr)
  PFNGLREPLACEMENTCODEUBSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeubSUN", ptr)
  PFNGLREPLACEMENTCODEUIVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuivSUN", ptr)
  PFNGLREPLACEMENTCODEUSVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeusvSUN", ptr)
  PFNGLREPLACEMENTCODEUBVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeubvSUN", ptr)
  PFNGLREPLACEMENTCODEPOINTERSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodePointerSUN", ptr)
  PFNGLCOLOR4UBVERTEX2FSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4ubVertex2fSUN", ptr)
  PFNGLCOLOR4UBVERTEX2FVSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4ubVertex2fvSUN", ptr)
  PFNGLCOLOR4UBVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4ubVertex3fSUN", ptr)
  PFNGLCOLOR4UBVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4ubVertex3fvSUN", ptr)
  PFNGLCOLOR3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glColor3fVertex3fSUN", ptr)
  PFNGLCOLOR3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glColor3fVertex3fvSUN", ptr)
  PFNGLNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glNormal3fVertex3fSUN", ptr)
  PFNGLNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glNormal3fVertex3fvSUN", ptr)
  PFNGLCOLOR4FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4fNormal3fVertex3fSUN", ptr)
  PFNGLCOLOR4FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glColor4fNormal3fVertex3fvSUN", ptr)
  PFNGLTEXCOORD2FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fVertex3fSUN", ptr)
  PFNGLTEXCOORD2FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fVertex3fvSUN", ptr)
  PFNGLTEXCOORD4FVERTEX4FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4fVertex4fSUN", ptr)
  PFNGLTEXCOORD4FVERTEX4FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4fVertex4fvSUN", ptr)
  PFNGLTEXCOORD2FCOLOR4UBVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor4ubVertex3fSUN", ptr)
  PFNGLTEXCOORD2FCOLOR4UBVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor4ubVertex3fvSUN", ptr)
  PFNGLTEXCOORD2FCOLOR3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor3fVertex3fSUN", ptr)
  PFNGLTEXCOORD2FCOLOR3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor3fVertex3fvSUN", ptr)
  PFNGLTEXCOORD2FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fNormal3fVertex3fSUN", ptr)
  PFNGLTEXCOORD2FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fNormal3fVertex3fvSUN", ptr)
  PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor4fNormal3fVertex3fSUN", ptr)
  PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2fColor4fNormal3fVertex3fvSUN", ptr)
  PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4fColor4fNormal3fVertex4fSUN", ptr)
  PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FVSUNPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4fColor4fNormal3fVertex4fvSUN", ptr)
  PFNGLREPLACEMENTCODEUIVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUIVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor4ubVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor4ubVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor3fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor3fVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiNormal3fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiNormal3fVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor4fNormal3fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiColor4fNormal3fVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN", ptr)
  PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC := DllCall(wglGetProcAddress, astr, "glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN", ptr)
  PFNGLBLENDFUNCSEPARATEEXTPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparateEXT", ptr)
  PFNGLBLENDFUNCSEPARATEINGRPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparateINGR", ptr)
  PFNGLVERTEXWEIGHTFEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexWeightfEXT", ptr)
  PFNGLVERTEXWEIGHTFVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexWeightfvEXT", ptr)
  PFNGLVERTEXWEIGHTPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glVertexWeightPointerEXT", ptr)
  PFNGLFLUSHVERTEXARRAYRANGENVPROC := DllCall(wglGetProcAddress, astr, "glFlushVertexArrayRangeNV", ptr)
  PFNGLVERTEXARRAYRANGENVPROC := DllCall(wglGetProcAddress, astr, "glVertexArrayRangeNV", ptr)
  PFNGLCOMBINERPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerParameterfvNV", ptr)
  PFNGLCOMBINERPARAMETERFNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerParameterfNV", ptr)
  PFNGLCOMBINERPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerParameterivNV", ptr)
  PFNGLCOMBINERPARAMETERINVPROC := DllCall(wglGetProcAddress, astr, "glCombinerParameteriNV", ptr)
  PFNGLCOMBINERINPUTNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerInputNV", ptr)
  PFNGLCOMBINEROUTPUTNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerOutputNV", ptr)
  PFNGLFINALCOMBINERINPUTNVPROC := DllCall(wglGetProcAddress, astr, "glFinalCombinerInputNV", ptr)
  PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetCombinerInputParameterfvNV", ptr)
  PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetCombinerInputParameterivNV", ptr)
  PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetCombinerOutputParameterfvNV", ptr)
  PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetCombinerOutputParameterivNV", ptr)
  PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetFinalCombinerInputParameterfvNV", ptr)
  PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetFinalCombinerInputParameterivNV", ptr)
  PFNGLRESIZEBUFFERSMESAPROC := DllCall(wglGetProcAddress, astr, "glResizeBuffersMESA", ptr)
  PFNGLWINDOWPOS2DMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2dMESA", ptr)
  PFNGLWINDOWPOS2DVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2dvMESA", ptr)
  PFNGLWINDOWPOS2FMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2fMESA", ptr)
  PFNGLWINDOWPOS2FVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2fvMESA", ptr)
  PFNGLWINDOWPOS2IMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2iMESA", ptr)
  PFNGLWINDOWPOS2IVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2ivMESA", ptr)
  PFNGLWINDOWPOS2SMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2sMESA", ptr)
  PFNGLWINDOWPOS2SVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos2svMESA", ptr)
  PFNGLWINDOWPOS3DMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3dMESA", ptr)
  PFNGLWINDOWPOS3DVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3dvMESA", ptr)
  PFNGLWINDOWPOS3FMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3fMESA", ptr)
  PFNGLWINDOWPOS3FVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3fvMESA", ptr)
  PFNGLWINDOWPOS3IMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3iMESA", ptr)
  PFNGLWINDOWPOS3IVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3ivMESA", ptr)
  PFNGLWINDOWPOS3SMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3sMESA", ptr)
  PFNGLWINDOWPOS3SVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos3svMESA", ptr)
  PFNGLWINDOWPOS4DMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4dMESA", ptr)
  PFNGLWINDOWPOS4DVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4dvMESA", ptr)
  PFNGLWINDOWPOS4FMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4fMESA", ptr)
  PFNGLWINDOWPOS4FVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4fvMESA", ptr)
  PFNGLWINDOWPOS4IMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4iMESA", ptr)
  PFNGLWINDOWPOS4IVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4ivMESA", ptr)
  PFNGLWINDOWPOS4SMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4sMESA", ptr)
  PFNGLWINDOWPOS4SVMESAPROC := DllCall(wglGetProcAddress, astr, "glWindowPos4svMESA", ptr)
  PFNGLMULTIMODEDRAWARRAYSIBMPROC := DllCall(wglGetProcAddress, astr, "glMultiModeDrawArraysIBM", ptr)
  PFNGLMULTIMODEDRAWELEMENTSIBMPROC := DllCall(wglGetProcAddress, astr, "glMultiModeDrawElementsIBM", ptr)
  PFNGLCOLORPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glColorPointerListIBM", ptr)
  PFNGLSECONDARYCOLORPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorPointerListIBM", ptr)
  PFNGLEDGEFLAGPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glEdgeFlagPointerListIBM", ptr)
  PFNGLFOGCOORDPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glFogCoordPointerListIBM", ptr)
  PFNGLINDEXPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glIndexPointerListIBM", ptr)
  PFNGLNORMALPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glNormalPointerListIBM", ptr)
  PFNGLTEXCOORDPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glTexCoordPointerListIBM", ptr)
  PFNGLVERTEXPOINTERLISTIBMPROC := DllCall(wglGetProcAddress, astr, "glVertexPointerListIBM", ptr)
  PFNGLTBUFFERMASK3DFXPROC := DllCall(wglGetProcAddress, astr, "glTbufferMask3DFX", ptr)
  PFNGLSAMPLEMASKEXTPROC := DllCall(wglGetProcAddress, astr, "glSampleMaskEXT", ptr)
  PFNGLSAMPLEPATTERNEXTPROC := DllCall(wglGetProcAddress, astr, "glSamplePatternEXT", ptr)
  PFNGLTEXTURECOLORMASKSGISPROC := DllCall(wglGetProcAddress, astr, "glTextureColorMaskSGIS", ptr)
  PFNGLIGLOOINTERFACESGIXPROC := DllCall(wglGetProcAddress, astr, "glIglooInterfaceSGIX", ptr)
  PFNGLDELETEFENCESNVPROC := DllCall(wglGetProcAddress, astr, "glDeleteFencesNV", ptr)
  PFNGLGENFENCESNVPROC := DllCall(wglGetProcAddress, astr, "glGenFencesNV", ptr)
  PFNGLGETFENCEIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetFenceivNV", ptr)
  PFNGLFINISHFENCENVPROC := DllCall(wglGetProcAddress, astr, "glFinishFenceNV", ptr)
  PFNGLSETFENCENVPROC := DllCall(wglGetProcAddress, astr, "glSetFenceNV", ptr)
  PFNGLMAPCONTROLPOINTSNVPROC := DllCall(wglGetProcAddress, astr, "glMapControlPointsNV", ptr)
  PFNGLMAPPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glMapParameterivNV", ptr)
  PFNGLMAPPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glMapParameterfvNV", ptr)
  PFNGLGETMAPCONTROLPOINTSNVPROC := DllCall(wglGetProcAddress, astr, "glGetMapControlPointsNV", ptr)
  PFNGLGETMAPPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetMapParameterivNV", ptr)
  PFNGLGETMAPPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetMapParameterfvNV", ptr)
  PFNGLGETMAPATTRIBPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetMapAttribParameterivNV", ptr)
  PFNGLGETMAPATTRIBPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetMapAttribParameterfvNV", ptr)
  PFNGLEVALMAPSNVPROC := DllCall(wglGetProcAddress, astr, "glEvalMapsNV", ptr)
  PFNGLCOMBINERSTAGEPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glCombinerStageParameterfvNV", ptr)
  PFNGLGETCOMBINERSTAGEPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetCombinerStageParameterfvNV", ptr)
  PFNGLBINDPROGRAMNVPROC := DllCall(wglGetProcAddress, astr, "glBindProgramNV", ptr)
  PFNGLDELETEPROGRAMSNVPROC := DllCall(wglGetProcAddress, astr, "glDeleteProgramsNV", ptr)
  PFNGLEXECUTEPROGRAMNVPROC := DllCall(wglGetProcAddress, astr, "glExecuteProgramNV", ptr)
  PFNGLGENPROGRAMSNVPROC := DllCall(wglGetProcAddress, astr, "glGenProgramsNV", ptr)
  PFNGLGETPROGRAMPARAMETERDVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramParameterdvNV", ptr)
  PFNGLGETPROGRAMPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramParameterfvNV", ptr)
  PFNGLGETPROGRAMIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramivNV", ptr)
  PFNGLGETPROGRAMSTRINGNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramStringNV", ptr)
  PFNGLGETTRACKMATRIXIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetTrackMatrixivNV", ptr)
  PFNGLGETVERTEXATTRIBDVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribdvNV", ptr)
  PFNGLGETVERTEXATTRIBFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribfvNV", ptr)
  PFNGLGETVERTEXATTRIBIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribivNV", ptr)
  PFNGLGETVERTEXATTRIBPOINTERVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribPointervNV", ptr)
  PFNGLLOADPROGRAMNVPROC := DllCall(wglGetProcAddress, astr, "glLoadProgramNV", ptr)
  PFNGLPROGRAMPARAMETER4DNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameter4dNV", ptr)
  PFNGLPROGRAMPARAMETER4DVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameter4dvNV", ptr)
  PFNGLPROGRAMPARAMETER4FNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameter4fNV", ptr)
  PFNGLPROGRAMPARAMETER4FVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameter4fvNV", ptr)
  PFNGLPROGRAMPARAMETERS4DVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameters4dvNV", ptr)
  PFNGLPROGRAMPARAMETERS4FVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramParameters4fvNV", ptr)
  PFNGLREQUESTRESIDENTPROGRAMSNVPROC := DllCall(wglGetProcAddress, astr, "glRequestResidentProgramsNV", ptr)
  PFNGLTRACKMATRIXNVPROC := DllCall(wglGetProcAddress, astr, "glTrackMatrixNV", ptr)
  PFNGLVERTEXATTRIBPOINTERNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribPointerNV", ptr)
  PFNGLVERTEXATTRIB1DNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1dNV", ptr)
  PFNGLVERTEXATTRIB1DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1dvNV", ptr)
  PFNGLVERTEXATTRIB1FNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1fNV", ptr)
  PFNGLVERTEXATTRIB1FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1fvNV", ptr)
  PFNGLVERTEXATTRIB1SNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1sNV", ptr)
  PFNGLVERTEXATTRIB1SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1svNV", ptr)
  PFNGLVERTEXATTRIB2DNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2dNV", ptr)
  PFNGLVERTEXATTRIB2DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2dvNV", ptr)
  PFNGLVERTEXATTRIB2FNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2fNV", ptr)
  PFNGLVERTEXATTRIB2FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2fvNV", ptr)
  PFNGLVERTEXATTRIB2SNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2sNV", ptr)
  PFNGLVERTEXATTRIB2SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2svNV", ptr)
  PFNGLVERTEXATTRIB3DNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3dNV", ptr)
  PFNGLVERTEXATTRIB3DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3dvNV", ptr)
  PFNGLVERTEXATTRIB3FNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3fNV", ptr)
  PFNGLVERTEXATTRIB3FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3fvNV", ptr)
  PFNGLVERTEXATTRIB3SNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3sNV", ptr)
  PFNGLVERTEXATTRIB3SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3svNV", ptr)
  PFNGLVERTEXATTRIB4DNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4dNV", ptr)
  PFNGLVERTEXATTRIB4DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4dvNV", ptr)
  PFNGLVERTEXATTRIB4FNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4fNV", ptr)
  PFNGLVERTEXATTRIB4FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4fvNV", ptr)
  PFNGLVERTEXATTRIB4SNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4sNV", ptr)
  PFNGLVERTEXATTRIB4SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4svNV", ptr)
  PFNGLVERTEXATTRIB4UBNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4ubNV", ptr)
  PFNGLVERTEXATTRIB4UBVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4ubvNV", ptr)
  PFNGLVERTEXATTRIBS1DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs1dvNV", ptr)
  PFNGLVERTEXATTRIBS1FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs1fvNV", ptr)
  PFNGLVERTEXATTRIBS1SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs1svNV", ptr)
  PFNGLVERTEXATTRIBS2DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs2dvNV", ptr)
  PFNGLVERTEXATTRIBS2FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs2fvNV", ptr)
  PFNGLVERTEXATTRIBS2SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs2svNV", ptr)
  PFNGLVERTEXATTRIBS3DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs3dvNV", ptr)
  PFNGLVERTEXATTRIBS3FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs3fvNV", ptr)
  PFNGLVERTEXATTRIBS3SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs3svNV", ptr)
  PFNGLVERTEXATTRIBS4DVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs4dvNV", ptr)
  PFNGLVERTEXATTRIBS4FVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs4fvNV", ptr)
  PFNGLVERTEXATTRIBS4SVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs4svNV", ptr)
  PFNGLVERTEXATTRIBS4UBVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs4ubvNV", ptr)
  PFNGLTEXBUMPPARAMETERIVATIPROC := DllCall(wglGetProcAddress, astr, "glTexBumpParameterivATI", ptr)
  PFNGLTEXBUMPPARAMETERFVATIPROC := DllCall(wglGetProcAddress, astr, "glTexBumpParameterfvATI", ptr)
  PFNGLGETTEXBUMPPARAMETERIVATIPROC := DllCall(wglGetProcAddress, astr, "glGetTexBumpParameterivATI", ptr)
  PFNGLGETTEXBUMPPARAMETERFVATIPROC := DllCall(wglGetProcAddress, astr, "glGetTexBumpParameterfvATI", ptr)
  PFNGLBINDFRAGMENTSHADERATIPROC := DllCall(wglGetProcAddress, astr, "glBindFragmentShaderATI", ptr)
  PFNGLDELETEFRAGMENTSHADERATIPROC := DllCall(wglGetProcAddress, astr, "glDeleteFragmentShaderATI", ptr)
  PFNGLBEGINFRAGMENTSHADERATIPROC := DllCall(wglGetProcAddress, astr, "glBeginFragmentShaderATI", ptr)
  PFNGLENDFRAGMENTSHADERATIPROC := DllCall(wglGetProcAddress, astr, "glEndFragmentShaderATI", ptr)
  PFNGLPASSTEXCOORDATIPROC := DllCall(wglGetProcAddress, astr, "glPassTexCoordATI", ptr)
  PFNGLSAMPLEMAPATIPROC := DllCall(wglGetProcAddress, astr, "glSampleMapATI", ptr)
  PFNGLCOLORFRAGMENTOP1ATIPROC := DllCall(wglGetProcAddress, astr, "glColorFragmentOp1ATI", ptr)
  PFNGLCOLORFRAGMENTOP2ATIPROC := DllCall(wglGetProcAddress, astr, "glColorFragmentOp2ATI", ptr)
  PFNGLCOLORFRAGMENTOP3ATIPROC := DllCall(wglGetProcAddress, astr, "glColorFragmentOp3ATI", ptr)
  PFNGLALPHAFRAGMENTOP1ATIPROC := DllCall(wglGetProcAddress, astr, "glAlphaFragmentOp1ATI", ptr)
  PFNGLALPHAFRAGMENTOP2ATIPROC := DllCall(wglGetProcAddress, astr, "glAlphaFragmentOp2ATI", ptr)
  PFNGLALPHAFRAGMENTOP3ATIPROC := DllCall(wglGetProcAddress, astr, "glAlphaFragmentOp3ATI", ptr)
  PFNGLSETFRAGMENTSHADERCONSTANTATIPROC := DllCall(wglGetProcAddress, astr, "glSetFragmentShaderConstantATI", ptr)
  PFNGLPNTRIANGLESIATIPROC := DllCall(wglGetProcAddress, astr, "glPNTrianglesiATI", ptr)
  PFNGLPNTRIANGLESFATIPROC := DllCall(wglGetProcAddress, astr, "glPNTrianglesfATI", ptr)
  PFNGLUPDATEOBJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glUpdateObjectBufferATI", ptr)
  PFNGLGETOBJECTBUFFERFVATIPROC := DllCall(wglGetProcAddress, astr, "glGetObjectBufferfvATI", ptr)
  PFNGLGETOBJECTBUFFERIVATIPROC := DllCall(wglGetProcAddress, astr, "glGetObjectBufferivATI", ptr)
  PFNGLFREEOBJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glFreeObjectBufferATI", ptr)
  PFNGLARRAYOBJECTATIPROC := DllCall(wglGetProcAddress, astr, "glArrayObjectATI", ptr)
  PFNGLGETARRAYOBJECTFVATIPROC := DllCall(wglGetProcAddress, astr, "glGetArrayObjectfvATI", ptr)
  PFNGLGETARRAYOBJECTIVATIPROC := DllCall(wglGetProcAddress, astr, "glGetArrayObjectivATI", ptr)
  PFNGLVARIANTARRAYOBJECTATIPROC := DllCall(wglGetProcAddress, astr, "glVariantArrayObjectATI", ptr)
  PFNGLGETVARIANTARRAYOBJECTFVATIPROC := DllCall(wglGetProcAddress, astr, "glGetVariantArrayObjectfvATI", ptr)
  PFNGLGETVARIANTARRAYOBJECTIVATIPROC := DllCall(wglGetProcAddress, astr, "glGetVariantArrayObjectivATI", ptr)
  PFNGLBEGINVERTEXSHADEREXTPROC := DllCall(wglGetProcAddress, astr, "glBeginVertexShaderEXT", ptr)
  PFNGLENDVERTEXSHADEREXTPROC := DllCall(wglGetProcAddress, astr, "glEndVertexShaderEXT", ptr)
  PFNGLBINDVERTEXSHADEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindVertexShaderEXT", ptr)
  PFNGLDELETEVERTEXSHADEREXTPROC := DllCall(wglGetProcAddress, astr, "glDeleteVertexShaderEXT", ptr)
  PFNGLSHADEROP1EXTPROC := DllCall(wglGetProcAddress, astr, "glShaderOp1EXT", ptr)
  PFNGLSHADEROP2EXTPROC := DllCall(wglGetProcAddress, astr, "glShaderOp2EXT", ptr)
  PFNGLSHADEROP3EXTPROC := DllCall(wglGetProcAddress, astr, "glShaderOp3EXT", ptr)
  PFNGLSWIZZLEEXTPROC := DllCall(wglGetProcAddress, astr, "glSwizzleEXT", ptr)
  PFNGLWRITEMASKEXTPROC := DllCall(wglGetProcAddress, astr, "glWriteMaskEXT", ptr)
  PFNGLINSERTCOMPONENTEXTPROC := DllCall(wglGetProcAddress, astr, "glInsertComponentEXT", ptr)
  PFNGLEXTRACTCOMPONENTEXTPROC := DllCall(wglGetProcAddress, astr, "glExtractComponentEXT", ptr)
  PFNGLSETINVARIANTEXTPROC := DllCall(wglGetProcAddress, astr, "glSetInvariantEXT", ptr)
  PFNGLSETLOCALCONSTANTEXTPROC := DllCall(wglGetProcAddress, astr, "glSetLocalConstantEXT", ptr)
  PFNGLVARIANTBVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantbvEXT", ptr)
  PFNGLVARIANTSVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantsvEXT", ptr)
  PFNGLVARIANTIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantivEXT", ptr)
  PFNGLVARIANTFVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantfvEXT", ptr)
  PFNGLVARIANTDVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantdvEXT", ptr)
  PFNGLVARIANTUBVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantubvEXT", ptr)
  PFNGLVARIANTUSVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantusvEXT", ptr)
  PFNGLVARIANTUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVariantuivEXT", ptr)
  PFNGLVARIANTPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glVariantPointerEXT", ptr)
  PFNGLENABLEVARIANTCLIENTSTATEEXTPROC := DllCall(wglGetProcAddress, astr, "glEnableVariantClientStateEXT", ptr)
  PFNGLDISABLEVARIANTCLIENTSTATEEXTPROC := DllCall(wglGetProcAddress, astr, "glDisableVariantClientStateEXT", ptr)
  PFNGLGETVARIANTBOOLEANVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVariantBooleanvEXT", ptr)
  PFNGLGETVARIANTINTEGERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVariantIntegervEXT", ptr)
  PFNGLGETVARIANTFLOATVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVariantFloatvEXT", ptr)
  PFNGLGETVARIANTPOINTERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVariantPointervEXT", ptr)
  PFNGLGETINVARIANTBOOLEANVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetInvariantBooleanvEXT", ptr)
  PFNGLGETINVARIANTINTEGERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetInvariantIntegervEXT", ptr)
  PFNGLGETINVARIANTFLOATVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetInvariantFloatvEXT", ptr)
  PFNGLGETLOCALCONSTANTBOOLEANVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetLocalConstantBooleanvEXT", ptr)
  PFNGLGETLOCALCONSTANTINTEGERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetLocalConstantIntegervEXT", ptr)
  PFNGLGETLOCALCONSTANTFLOATVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetLocalConstantFloatvEXT", ptr)
  PFNGLVERTEXSTREAM1SATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1sATI", ptr)
  PFNGLVERTEXSTREAM1SVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1svATI", ptr)
  PFNGLVERTEXSTREAM1IATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1iATI", ptr)
  PFNGLVERTEXSTREAM1IVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1ivATI", ptr)
  PFNGLVERTEXSTREAM1FATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1fATI", ptr)
  PFNGLVERTEXSTREAM1FVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1fvATI", ptr)
  PFNGLVERTEXSTREAM1DATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1dATI", ptr)
  PFNGLVERTEXSTREAM1DVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream1dvATI", ptr)
  PFNGLVERTEXSTREAM2SATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2sATI", ptr)
  PFNGLVERTEXSTREAM2SVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2svATI", ptr)
  PFNGLVERTEXSTREAM2IATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2iATI", ptr)
  PFNGLVERTEXSTREAM2IVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2ivATI", ptr)
  PFNGLVERTEXSTREAM2FATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2fATI", ptr)
  PFNGLVERTEXSTREAM2FVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2fvATI", ptr)
  PFNGLVERTEXSTREAM2DATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2dATI", ptr)
  PFNGLVERTEXSTREAM2DVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream2dvATI", ptr)
  PFNGLVERTEXSTREAM3SATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3sATI", ptr)
  PFNGLVERTEXSTREAM3SVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3svATI", ptr)
  PFNGLVERTEXSTREAM3IATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3iATI", ptr)
  PFNGLVERTEXSTREAM3IVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3ivATI", ptr)
  PFNGLVERTEXSTREAM3FATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3fATI", ptr)
  PFNGLVERTEXSTREAM3FVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3fvATI", ptr)
  PFNGLVERTEXSTREAM3DATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3dATI", ptr)
  PFNGLVERTEXSTREAM3DVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream3dvATI", ptr)
  PFNGLVERTEXSTREAM4SATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4sATI", ptr)
  PFNGLVERTEXSTREAM4SVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4svATI", ptr)
  PFNGLVERTEXSTREAM4IATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4iATI", ptr)
  PFNGLVERTEXSTREAM4IVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4ivATI", ptr)
  PFNGLVERTEXSTREAM4FATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4fATI", ptr)
  PFNGLVERTEXSTREAM4FVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4fvATI", ptr)
  PFNGLVERTEXSTREAM4DATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4dATI", ptr)
  PFNGLVERTEXSTREAM4DVATIPROC := DllCall(wglGetProcAddress, astr, "glVertexStream4dvATI", ptr)
  PFNGLNORMALSTREAM3BATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3bATI", ptr)
  PFNGLNORMALSTREAM3BVATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3bvATI", ptr)
  PFNGLNORMALSTREAM3SATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3sATI", ptr)
  PFNGLNORMALSTREAM3SVATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3svATI", ptr)
  PFNGLNORMALSTREAM3IATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3iATI", ptr)
  PFNGLNORMALSTREAM3IVATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3ivATI", ptr)
  PFNGLNORMALSTREAM3FATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3fATI", ptr)
  PFNGLNORMALSTREAM3FVATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3fvATI", ptr)
  PFNGLNORMALSTREAM3DATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3dATI", ptr)
  PFNGLNORMALSTREAM3DVATIPROC := DllCall(wglGetProcAddress, astr, "glNormalStream3dvATI", ptr)
  PFNGLCLIENTACTIVEVERTEXSTREAMATIPROC := DllCall(wglGetProcAddress, astr, "glClientActiveVertexStreamATI", ptr)
  PFNGLVERTEXBLENDENVIATIPROC := DllCall(wglGetProcAddress, astr, "glVertexBlendEnviATI", ptr)
  PFNGLVERTEXBLENDENVFATIPROC := DllCall(wglGetProcAddress, astr, "glVertexBlendEnvfATI", ptr)
  PFNGLELEMENTPOINTERATIPROC := DllCall(wglGetProcAddress, astr, "glElementPointerATI", ptr)
  PFNGLDRAWELEMENTARRAYATIPROC := DllCall(wglGetProcAddress, astr, "glDrawElementArrayATI", ptr)
  PFNGLDRAWRANGEELEMENTARRAYATIPROC := DllCall(wglGetProcAddress, astr, "glDrawRangeElementArrayATI", ptr)
  PFNGLDRAWMESHARRAYSSUNPROC := DllCall(wglGetProcAddress, astr, "glDrawMeshArraysSUN", ptr)
  PFNGLGENOCCLUSIONQUERIESNVPROC := DllCall(wglGetProcAddress, astr, "glGenOcclusionQueriesNV", ptr)
  PFNGLDELETEOCCLUSIONQUERIESNVPROC := DllCall(wglGetProcAddress, astr, "glDeleteOcclusionQueriesNV", ptr)
  PFNGLBEGINOCCLUSIONQUERYNVPROC := DllCall(wglGetProcAddress, astr, "glBeginOcclusionQueryNV", ptr)
  PFNGLENDOCCLUSIONQUERYNVPROC := DllCall(wglGetProcAddress, astr, "glEndOcclusionQueryNV", ptr)
  PFNGLGETOCCLUSIONQUERYIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetOcclusionQueryivNV", ptr)
  PFNGLGETOCCLUSIONQUERYUIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetOcclusionQueryuivNV", ptr)
  PFNGLPOINTPARAMETERINVPROC := DllCall(wglGetProcAddress, astr, "glPointParameteriNV", ptr)
  PFNGLPOINTPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glPointParameterivNV", ptr)
  PFNGLACTIVESTENCILFACEEXTPROC := DllCall(wglGetProcAddress, astr, "glActiveStencilFaceEXT", ptr)
  PFNGLELEMENTPOINTERAPPLEPROC := DllCall(wglGetProcAddress, astr, "glElementPointerAPPLE", ptr)
  PFNGLDRAWELEMENTARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glDrawElementArrayAPPLE", ptr)
  PFNGLDRAWRANGEELEMENTARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glDrawRangeElementArrayAPPLE", ptr)
  PFNGLMULTIDRAWELEMENTARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawElementArrayAPPLE", ptr)
  PFNGLMULTIDRAWRANGEELEMENTARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMultiDrawRangeElementArrayAPPLE", ptr)
  PFNGLGENFENCESAPPLEPROC := DllCall(wglGetProcAddress, astr, "glGenFencesAPPLE", ptr)
  PFNGLDELETEFENCESAPPLEPROC := DllCall(wglGetProcAddress, astr, "glDeleteFencesAPPLE", ptr)
  PFNGLSETFENCEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glSetFenceAPPLE", ptr)
  PFNGLFINISHFENCEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glFinishFenceAPPLE", ptr)
  PFNGLFINISHOBJECTAPPLEPROC := DllCall(wglGetProcAddress, astr, "glFinishObjectAPPLE", ptr)
  PFNGLBINDVERTEXARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glBindVertexArrayAPPLE", ptr)
  PFNGLDELETEVERTEXARRAYSAPPLEPROC := DllCall(wglGetProcAddress, astr, "glDeleteVertexArraysAPPLE", ptr)
  PFNGLGENVERTEXARRAYSAPPLEPROC := DllCall(wglGetProcAddress, astr, "glGenVertexArraysAPPLE", ptr)
  PFNGLVERTEXARRAYRANGEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glVertexArrayRangeAPPLE", ptr)
  PFNGLFLUSHVERTEXARRAYRANGEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glFlushVertexArrayRangeAPPLE", ptr)
  PFNGLVERTEXARRAYPARAMETERIAPPLEPROC := DllCall(wglGetProcAddress, astr, "glVertexArrayParameteriAPPLE", ptr)
  PFNGLDRAWBUFFERSATIPROC := DllCall(wglGetProcAddress, astr, "glDrawBuffersATI", ptr)
  PFNGLPROGRAMNAMEDPARAMETER4FNVPROC := DllCall(wglGetProcAddress, astr, "glProgramNamedParameter4fNV", ptr)
  PFNGLPROGRAMNAMEDPARAMETER4DNVPROC := DllCall(wglGetProcAddress, astr, "glProgramNamedParameter4dNV", ptr)
  PFNGLPROGRAMNAMEDPARAMETER4FVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramNamedParameter4fvNV", ptr)
  PFNGLPROGRAMNAMEDPARAMETER4DVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramNamedParameter4dvNV", ptr)
  PFNGLGETPROGRAMNAMEDPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramNamedParameterfvNV", ptr)
  PFNGLGETPROGRAMNAMEDPARAMETERDVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramNamedParameterdvNV", ptr)
  PFNGLVERTEX2HNVPROC := DllCall(wglGetProcAddress, astr, "glVertex2hNV", ptr)
  PFNGLVERTEX2HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertex2hvNV", ptr)
  PFNGLVERTEX3HNVPROC := DllCall(wglGetProcAddress, astr, "glVertex3hNV", ptr)
  PFNGLVERTEX3HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertex3hvNV", ptr)
  PFNGLVERTEX4HNVPROC := DllCall(wglGetProcAddress, astr, "glVertex4hNV", ptr)
  PFNGLVERTEX4HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertex4hvNV", ptr)
  PFNGLNORMAL3HNVPROC := DllCall(wglGetProcAddress, astr, "glNormal3hNV", ptr)
  PFNGLNORMAL3HVNVPROC := DllCall(wglGetProcAddress, astr, "glNormal3hvNV", ptr)
  PFNGLCOLOR3HNVPROC := DllCall(wglGetProcAddress, astr, "glColor3hNV", ptr)
  PFNGLCOLOR3HVNVPROC := DllCall(wglGetProcAddress, astr, "glColor3hvNV", ptr)
  PFNGLCOLOR4HNVPROC := DllCall(wglGetProcAddress, astr, "glColor4hNV", ptr)
  PFNGLCOLOR4HVNVPROC := DllCall(wglGetProcAddress, astr, "glColor4hvNV", ptr)
  PFNGLTEXCOORD1HNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord1hNV", ptr)
  PFNGLTEXCOORD1HVNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord1hvNV", ptr)
  PFNGLTEXCOORD2HNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2hNV", ptr)
  PFNGLTEXCOORD2HVNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord2hvNV", ptr)
  PFNGLTEXCOORD3HNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord3hNV", ptr)
  PFNGLTEXCOORD3HVNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord3hvNV", ptr)
  PFNGLTEXCOORD4HNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4hNV", ptr)
  PFNGLTEXCOORD4HVNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoord4hvNV", ptr)
  PFNGLMULTITEXCOORD1HNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1hNV", ptr)
  PFNGLMULTITEXCOORD1HVNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord1hvNV", ptr)
  PFNGLMULTITEXCOORD2HNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2hNV", ptr)
  PFNGLMULTITEXCOORD2HVNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord2hvNV", ptr)
  PFNGLMULTITEXCOORD3HNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3hNV", ptr)
  PFNGLMULTITEXCOORD3HVNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord3hvNV", ptr)
  PFNGLMULTITEXCOORD4HNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4hNV", ptr)
  PFNGLMULTITEXCOORD4HVNVPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoord4hvNV", ptr)
  PFNGLFOGCOORDHNVPROC := DllCall(wglGetProcAddress, astr, "glFogCoordhNV", ptr)
  PFNGLFOGCOORDHVNVPROC := DllCall(wglGetProcAddress, astr, "glFogCoordhvNV", ptr)
  PFNGLSECONDARYCOLOR3HNVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3hNV", ptr)
  PFNGLSECONDARYCOLOR3HVNVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColor3hvNV", ptr)
  PFNGLVERTEXWEIGHTHNVPROC := DllCall(wglGetProcAddress, astr, "glVertexWeighthNV", ptr)
  PFNGLVERTEXWEIGHTHVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexWeighthvNV", ptr)
  PFNGLVERTEXATTRIB1HNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1hNV", ptr)
  PFNGLVERTEXATTRIB1HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib1hvNV", ptr)
  PFNGLVERTEXATTRIB2HNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2hNV", ptr)
  PFNGLVERTEXATTRIB2HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib2hvNV", ptr)
  PFNGLVERTEXATTRIB3HNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3hNV", ptr)
  PFNGLVERTEXATTRIB3HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib3hvNV", ptr)
  PFNGLVERTEXATTRIB4HNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4hNV", ptr)
  PFNGLVERTEXATTRIB4HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttrib4hvNV", ptr)
  PFNGLVERTEXATTRIBS1HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs1hvNV", ptr)
  PFNGLVERTEXATTRIBS2HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs2hvNV", ptr)
  PFNGLVERTEXATTRIBS3HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs3hvNV", ptr)
  PFNGLVERTEXATTRIBS4HVNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribs4hvNV", ptr)
  PFNGLPIXELDATARANGENVPROC := DllCall(wglGetProcAddress, astr, "glPixelDataRangeNV", ptr)
  PFNGLFLUSHPIXELDATARANGENVPROC := DllCall(wglGetProcAddress, astr, "glFlushPixelDataRangeNV", ptr)
  PFNGLPRIMITIVERESTARTNVPROC := DllCall(wglGetProcAddress, astr, "glPrimitiveRestartNV", ptr)
  PFNGLPRIMITIVERESTARTINDEXNVPROC := DllCall(wglGetProcAddress, astr, "glPrimitiveRestartIndexNV", ptr)
  PFNGLUNMAPOBJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glUnmapObjectBufferATI", ptr)
  PFNGLSTENCILOPSEPARATEATIPROC := DllCall(wglGetProcAddress, astr, "glStencilOpSeparateATI", ptr)
  PFNGLSTENCILFUNCSEPARATEATIPROC := DllCall(wglGetProcAddress, astr, "glStencilFuncSeparateATI", ptr)
  PFNGLVERTEXATTRIBARRAYOBJECTATIPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribArrayObjectATI", ptr)
  PFNGLGETVERTEXATTRIBARRAYOBJECTFVATIPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribArrayObjectfvATI", ptr)
  PFNGLGETVERTEXATTRIBARRAYOBJECTIVATIPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribArrayObjectivATI", ptr)
  PFNGLDEPTHBOUNDSEXTPROC := DllCall(wglGetProcAddress, astr, "glDepthBoundsEXT", ptr)
  PFNGLBLENDEQUATIONSEPARATEEXTPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationSeparateEXT", ptr)
  PFNGLBINDRENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindRenderbufferEXT", ptr)
  PFNGLDELETERENDERBUFFERSEXTPROC := DllCall(wglGetProcAddress, astr, "glDeleteRenderbuffersEXT", ptr)
  PFNGLGENRENDERBUFFERSEXTPROC := DllCall(wglGetProcAddress, astr, "glGenRenderbuffersEXT", ptr)
  PFNGLRENDERBUFFERSTORAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glRenderbufferStorageEXT", ptr)
  PFNGLGETRENDERBUFFERPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetRenderbufferParameterivEXT", ptr)
  PFNGLBINDFRAMEBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindFramebufferEXT", ptr)
  PFNGLDELETEFRAMEBUFFERSEXTPROC := DllCall(wglGetProcAddress, astr, "glDeleteFramebuffersEXT", ptr)
  PFNGLGENFRAMEBUFFERSEXTPROC := DllCall(wglGetProcAddress, astr, "glGenFramebuffersEXT", ptr)
  PFNGLFRAMEBUFFERTEXTURE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture1DEXT", ptr)
  PFNGLFRAMEBUFFERTEXTURE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture2DEXT", ptr)
  PFNGLFRAMEBUFFERTEXTURE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTexture3DEXT", ptr)
  PFNGLFRAMEBUFFERRENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferRenderbufferEXT", ptr)
  PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetFramebufferAttachmentParameterivEXT", ptr)
  PFNGLGENERATEMIPMAPEXTPROC := DllCall(wglGetProcAddress, astr, "glGenerateMipmapEXT", ptr)
  PFNGLSTRINGMARKERGREMEDYPROC := DllCall(wglGetProcAddress, astr, "glStringMarkerGREMEDY", ptr)
  PFNGLSTENCILCLEARTAGEXTPROC := DllCall(wglGetProcAddress, astr, "glStencilClearTagEXT", ptr)
  PFNGLBLITFRAMEBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glBlitFramebufferEXT", ptr)
  PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC := DllCall(wglGetProcAddress, astr, "glRenderbufferStorageMultisampleEXT", ptr)
  PFNGLGETQUERYOBJECTI64VEXTPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjecti64vEXT", ptr)
  PFNGLGETQUERYOBJECTUI64VEXTPROC := DllCall(wglGetProcAddress, astr, "glGetQueryObjectui64vEXT", ptr)
  PFNGLPROGRAMENVPARAMETERS4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameters4fvEXT", ptr)
  PFNGLPROGRAMLOCALPARAMETERS4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameters4fvEXT", ptr)
  PFNGLBUFFERPARAMETERIAPPLEPROC := DllCall(wglGetProcAddress, astr, "glBufferParameteriAPPLE", ptr)
  PFNGLFLUSHMAPPEDBUFFERRANGEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glFlushMappedBufferRangeAPPLE", ptr)
  PFNGLPROGRAMLOCALPARAMETERI4INVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameterI4iNV", ptr)
  PFNGLPROGRAMLOCALPARAMETERI4IVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameterI4ivNV", ptr)
  PFNGLPROGRAMLOCALPARAMETERSI4IVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParametersI4ivNV", ptr)
  PFNGLPROGRAMLOCALPARAMETERI4UINVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameterI4uiNV", ptr)
  PFNGLPROGRAMLOCALPARAMETERI4UIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParameterI4uivNV", ptr)
  PFNGLPROGRAMLOCALPARAMETERSI4UIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramLocalParametersI4uivNV", ptr)
  PFNGLPROGRAMENVPARAMETERI4INVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameterI4iNV", ptr)
  PFNGLPROGRAMENVPARAMETERI4IVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameterI4ivNV", ptr)
  PFNGLPROGRAMENVPARAMETERSI4IVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParametersI4ivNV", ptr)
  PFNGLPROGRAMENVPARAMETERI4UINVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameterI4uiNV", ptr)
  PFNGLPROGRAMENVPARAMETERI4UIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParameterI4uivNV", ptr)
  PFNGLPROGRAMENVPARAMETERSI4UIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramEnvParametersI4uivNV", ptr)
  PFNGLGETPROGRAMLOCALPARAMETERIIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramLocalParameterIivNV", ptr)
  PFNGLGETPROGRAMLOCALPARAMETERIUIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramLocalParameterIuivNV", ptr)
  PFNGLGETPROGRAMENVPARAMETERIIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramEnvParameterIivNV", ptr)
  PFNGLGETPROGRAMENVPARAMETERIUIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramEnvParameterIuivNV", ptr)
  PFNGLPROGRAMVERTEXLIMITNVPROC := DllCall(wglGetProcAddress, astr, "glProgramVertexLimitNV", ptr)
  PFNGLFRAMEBUFFERTEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureEXT", ptr)
  PFNGLFRAMEBUFFERTEXTURELAYEREXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureLayerEXT", ptr)
  PFNGLFRAMEBUFFERTEXTUREFACEEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferTextureFaceEXT", ptr)
  PFNGLPROGRAMPARAMETERIEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramParameteriEXT", ptr)
  PFNGLVERTEXATTRIBI1IEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1iEXT", ptr)
  PFNGLVERTEXATTRIBI2IEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2iEXT", ptr)
  PFNGLVERTEXATTRIBI3IEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3iEXT", ptr)
  PFNGLVERTEXATTRIBI4IEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4iEXT", ptr)
  PFNGLVERTEXATTRIBI1UIEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1uiEXT", ptr)
  PFNGLVERTEXATTRIBI2UIEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2uiEXT", ptr)
  PFNGLVERTEXATTRIBI3UIEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3uiEXT", ptr)
  PFNGLVERTEXATTRIBI4UIEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4uiEXT", ptr)
  PFNGLVERTEXATTRIBI1IVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1ivEXT", ptr)
  PFNGLVERTEXATTRIBI2IVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2ivEXT", ptr)
  PFNGLVERTEXATTRIBI3IVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3ivEXT", ptr)
  PFNGLVERTEXATTRIBI4IVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4ivEXT", ptr)
  PFNGLVERTEXATTRIBI1UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI1uivEXT", ptr)
  PFNGLVERTEXATTRIBI2UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI2uivEXT", ptr)
  PFNGLVERTEXATTRIBI3UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI3uivEXT", ptr)
  PFNGLVERTEXATTRIBI4UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4uivEXT", ptr)
  PFNGLVERTEXATTRIBI4BVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4bvEXT", ptr)
  PFNGLVERTEXATTRIBI4SVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4svEXT", ptr)
  PFNGLVERTEXATTRIBI4UBVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4ubvEXT", ptr)
  PFNGLVERTEXATTRIBI4USVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribI4usvEXT", ptr)
  PFNGLVERTEXATTRIBIPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribIPointerEXT", ptr)
  PFNGLGETVERTEXATTRIBIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribIivEXT", ptr)
  PFNGLGETVERTEXATTRIBIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribIuivEXT", ptr)
  PFNGLGETUNIFORMUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetUniformuivEXT", ptr)
  PFNGLBINDFRAGDATALOCATIONEXTPROC := DllCall(wglGetProcAddress, astr, "glBindFragDataLocationEXT", ptr)
  PFNGLUNIFORM1UIEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform1uiEXT", ptr)
  PFNGLUNIFORM2UIEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform2uiEXT", ptr)
  PFNGLUNIFORM3UIEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform3uiEXT", ptr)
  PFNGLUNIFORM4UIEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform4uiEXT", ptr)
  PFNGLUNIFORM1UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform1uivEXT", ptr)
  PFNGLUNIFORM2UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform2uivEXT", ptr)
  PFNGLUNIFORM3UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform3uivEXT", ptr)
  PFNGLUNIFORM4UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glUniform4uivEXT", ptr)
  PFNGLDRAWARRAYSINSTANCEDEXTPROC := DllCall(wglGetProcAddress, astr, "glDrawArraysInstancedEXT", ptr)
  PFNGLDRAWELEMENTSINSTANCEDEXTPROC := DllCall(wglGetProcAddress, astr, "glDrawElementsInstancedEXT", ptr)
  PFNGLTEXBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glTexBufferEXT", ptr)
  PFNGLDEPTHRANGEDNVPROC := DllCall(wglGetProcAddress, astr, "glDepthRangedNV", ptr)
  PFNGLCLEARDEPTHDNVPROC := DllCall(wglGetProcAddress, astr, "glClearDepthdNV", ptr)
  PFNGLDEPTHBOUNDSDNVPROC := DllCall(wglGetProcAddress, astr, "glDepthBoundsdNV", ptr)
  PFNGLRENDERBUFFERSTORAGEMULTISAMPLECOVERAGENVPROC := DllCall(wglGetProcAddress, astr, "glRenderbufferStorageMultisampleCoverageNV", ptr)
  PFNGLPROGRAMBUFFERPARAMETERSFVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramBufferParametersfvNV", ptr)
  PFNGLPROGRAMBUFFERPARAMETERSIIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramBufferParametersIivNV", ptr)
  PFNGLPROGRAMBUFFERPARAMETERSIUIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramBufferParametersIuivNV", ptr)
  PFNGLCOLORMASKINDEXEDEXTPROC := DllCall(wglGetProcAddress, astr, "glColorMaskIndexedEXT", ptr)
  PFNGLGETBOOLEANINDEXEDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetBooleanIndexedvEXT", ptr)
  PFNGLGETINTEGERINDEXEDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetIntegerIndexedvEXT", ptr)
  PFNGLENABLEINDEXEDEXTPROC := DllCall(wglGetProcAddress, astr, "glEnableIndexedEXT", ptr)
  PFNGLDISABLEINDEXEDEXTPROC := DllCall(wglGetProcAddress, astr, "glDisableIndexedEXT", ptr)
  PFNGLBEGINTRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glBeginTransformFeedbackNV", ptr)
  PFNGLENDTRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glEndTransformFeedbackNV", ptr)
  PFNGLTRANSFORMFEEDBACKATTRIBSNVPROC := DllCall(wglGetProcAddress, astr, "glTransformFeedbackAttribsNV", ptr)
  PFNGLBINDBUFFERRANGENVPROC := DllCall(wglGetProcAddress, astr, "glBindBufferRangeNV", ptr)
  PFNGLBINDBUFFEROFFSETNVPROC := DllCall(wglGetProcAddress, astr, "glBindBufferOffsetNV", ptr)
  PFNGLBINDBUFFERBASENVPROC := DllCall(wglGetProcAddress, astr, "glBindBufferBaseNV", ptr)
  PFNGLTRANSFORMFEEDBACKVARYINGSNVPROC := DllCall(wglGetProcAddress, astr, "glTransformFeedbackVaryingsNV", ptr)
  PFNGLACTIVEVARYINGNVPROC := DllCall(wglGetProcAddress, astr, "glActiveVaryingNV", ptr)
  PFNGLGETACTIVEVARYINGNVPROC := DllCall(wglGetProcAddress, astr, "glGetActiveVaryingNV", ptr)
  PFNGLGETTRANSFORMFEEDBACKVARYINGNVPROC := DllCall(wglGetProcAddress, astr, "glGetTransformFeedbackVaryingNV", ptr)
  PFNGLTRANSFORMFEEDBACKSTREAMATTRIBSNVPROC := DllCall(wglGetProcAddress, astr, "glTransformFeedbackStreamAttribsNV", ptr)
  PFNGLUNIFORMBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glUniformBufferEXT", ptr)
  PFNGLTEXPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glTexParameterIivEXT", ptr)
  PFNGLTEXPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glTexParameterIuivEXT", ptr)
  PFNGLGETTEXPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTexParameterIivEXT", ptr)
  PFNGLGETTEXPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTexParameterIuivEXT", ptr)
  PFNGLCLEARCOLORIIEXTPROC := DllCall(wglGetProcAddress, astr, "glClearColorIiEXT", ptr)
  PFNGLCLEARCOLORIUIEXTPROC := DllCall(wglGetProcAddress, astr, "glClearColorIuiEXT", ptr)
  PFNGLFRAMETERMINATORGREMEDYPROC := DllCall(wglGetProcAddress, astr, "glFrameTerminatorGREMEDY", ptr)
  PFNGLBEGINCONDITIONALRENDERNVPROC := DllCall(wglGetProcAddress, astr, "glBeginConditionalRenderNV", ptr)
  PFNGLENDCONDITIONALRENDERNVPROC := DllCall(wglGetProcAddress, astr, "glEndConditionalRenderNV", ptr)
  PFNGLPRESENTFRAMEKEYEDNVPROC := DllCall(wglGetProcAddress, astr, "glPresentFrameKeyedNV", ptr)
  PFNGLPRESENTFRAMEDUALFILLNVPROC := DllCall(wglGetProcAddress, astr, "glPresentFrameDualFillNV", ptr)
  PFNGLGETVIDEOIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoivNV", ptr)
  PFNGLGETVIDEOUIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideouivNV", ptr)
  PFNGLGETVIDEOI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoi64vNV", ptr)
  PFNGLGETVIDEOUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoui64vNV", ptr)
  PFNGLBEGINTRANSFORMFEEDBACKEXTPROC := DllCall(wglGetProcAddress, astr, "glBeginTransformFeedbackEXT", ptr)
  PFNGLENDTRANSFORMFEEDBACKEXTPROC := DllCall(wglGetProcAddress, astr, "glEndTransformFeedbackEXT", ptr)
  PFNGLBINDBUFFERRANGEEXTPROC := DllCall(wglGetProcAddress, astr, "glBindBufferRangeEXT", ptr)
  PFNGLBINDBUFFEROFFSETEXTPROC := DllCall(wglGetProcAddress, astr, "glBindBufferOffsetEXT", ptr)
  PFNGLBINDBUFFERBASEEXTPROC := DllCall(wglGetProcAddress, astr, "glBindBufferBaseEXT", ptr)
  PFNGLTRANSFORMFEEDBACKVARYINGSEXTPROC := DllCall(wglGetProcAddress, astr, "glTransformFeedbackVaryingsEXT", ptr)
  PFNGLGETTRANSFORMFEEDBACKVARYINGEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTransformFeedbackVaryingEXT", ptr)
  PFNGLCLIENTATTRIBDEFAULTEXTPROC := DllCall(wglGetProcAddress, astr, "glClientAttribDefaultEXT", ptr)
  PFNGLPUSHCLIENTATTRIBDEFAULTEXTPROC := DllCall(wglGetProcAddress, astr, "glPushClientAttribDefaultEXT", ptr)
  PFNGLMATRIXLOADFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixLoadfEXT", ptr)
  PFNGLMATRIXLOADDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixLoaddEXT", ptr)
  PFNGLMATRIXMULTFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixMultfEXT", ptr)
  PFNGLMATRIXMULTDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixMultdEXT", ptr)
  PFNGLMATRIXLOADIDENTITYEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixLoadIdentityEXT", ptr)
  PFNGLMATRIXROTATEFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixRotatefEXT", ptr)
  PFNGLMATRIXROTATEDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixRotatedEXT", ptr)
  PFNGLMATRIXSCALEFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixScalefEXT", ptr)
  PFNGLMATRIXSCALEDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixScaledEXT", ptr)
  PFNGLMATRIXTRANSLATEFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixTranslatefEXT", ptr)
  PFNGLMATRIXTRANSLATEDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixTranslatedEXT", ptr)
  PFNGLMATRIXFRUSTUMEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixFrustumEXT", ptr)
  PFNGLMATRIXORTHOEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixOrthoEXT", ptr)
  PFNGLMATRIXPOPEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixPopEXT", ptr)
  PFNGLMATRIXPUSHEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixPushEXT", ptr)
  PFNGLMATRIXLOADTRANSPOSEFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixLoadTransposefEXT", ptr)
  PFNGLMATRIXLOADTRANSPOSEDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixLoadTransposedEXT", ptr)
  PFNGLMATRIXMULTTRANSPOSEFEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixMultTransposefEXT", ptr)
  PFNGLMATRIXMULTTRANSPOSEDEXTPROC := DllCall(wglGetProcAddress, astr, "glMatrixMultTransposedEXT", ptr)
  PFNGLTEXTUREPARAMETERFEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameterfEXT", ptr)
  PFNGLTEXTUREPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameterfvEXT", ptr)
  PFNGLTEXTUREPARAMETERIEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameteriEXT", ptr)
  PFNGLTEXTUREPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameterivEXT", ptr)
  PFNGLTEXTUREIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureImage1DEXT", ptr)
  PFNGLTEXTUREIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureImage2DEXT", ptr)
  PFNGLTEXTURESUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureSubImage1DEXT", ptr)
  PFNGLTEXTURESUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureSubImage2DEXT", ptr)
  PFNGLCOPYTEXTUREIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTextureImage1DEXT", ptr)
  PFNGLCOPYTEXTUREIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTextureImage2DEXT", ptr)
  PFNGLCOPYTEXTURESUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTextureSubImage1DEXT", ptr)
  PFNGLCOPYTEXTURESUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTextureSubImage2DEXT", ptr)
  PFNGLGETTEXTUREIMAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureImageEXT", ptr)
  PFNGLGETTEXTUREPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureParameterfvEXT", ptr)
  PFNGLGETTEXTUREPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureParameterivEXT", ptr)
  PFNGLGETTEXTURELEVELPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureLevelParameterfvEXT", ptr)
  PFNGLGETTEXTURELEVELPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureLevelParameterivEXT", ptr)
  PFNGLTEXTUREIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureImage3DEXT", ptr)
  PFNGLTEXTURESUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureSubImage3DEXT", ptr)
  PFNGLCOPYTEXTURESUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyTextureSubImage3DEXT", ptr)
  PFNGLMULTITEXPARAMETERFEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameterfEXT", ptr)
  PFNGLMULTITEXPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameterfvEXT", ptr)
  PFNGLMULTITEXPARAMETERIEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameteriEXT", ptr)
  PFNGLMULTITEXPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameterivEXT", ptr)
  PFNGLMULTITEXIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexImage1DEXT", ptr)
  PFNGLMULTITEXIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexImage2DEXT", ptr)
  PFNGLMULTITEXSUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexSubImage1DEXT", ptr)
  PFNGLMULTITEXSUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexSubImage2DEXT", ptr)
  PFNGLCOPYMULTITEXIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyMultiTexImage1DEXT", ptr)
  PFNGLCOPYMULTITEXIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyMultiTexImage2DEXT", ptr)
  PFNGLCOPYMULTITEXSUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyMultiTexSubImage1DEXT", ptr)
  PFNGLCOPYMULTITEXSUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyMultiTexSubImage2DEXT", ptr)
  PFNGLGETMULTITEXIMAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexImageEXT", ptr)
  PFNGLGETMULTITEXPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexParameterfvEXT", ptr)
  PFNGLGETMULTITEXPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexParameterivEXT", ptr)
  PFNGLGETMULTITEXLEVELPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexLevelParameterfvEXT", ptr)
  PFNGLGETMULTITEXLEVELPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexLevelParameterivEXT", ptr)
  PFNGLMULTITEXIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexImage3DEXT", ptr)
  PFNGLMULTITEXSUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexSubImage3DEXT", ptr)
  PFNGLCOPYMULTITEXSUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCopyMultiTexSubImage3DEXT", ptr)
  PFNGLBINDMULTITEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glBindMultiTextureEXT", ptr)
  PFNGLENABLECLIENTSTATEINDEXEDEXTPROC := DllCall(wglGetProcAddress, astr, "glEnableClientStateIndexedEXT", ptr)
  PFNGLDISABLECLIENTSTATEINDEXEDEXTPROC := DllCall(wglGetProcAddress, astr, "glDisableClientStateIndexedEXT", ptr)
  PFNGLMULTITEXCOORDPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexCoordPointerEXT", ptr)
  PFNGLMULTITEXENVFEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexEnvfEXT", ptr)
  PFNGLMULTITEXENVFVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexEnvfvEXT", ptr)
  PFNGLMULTITEXENVIEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexEnviEXT", ptr)
  PFNGLMULTITEXENVIVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexEnvivEXT", ptr)
  PFNGLMULTITEXGENDEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGendEXT", ptr)
  PFNGLMULTITEXGENDVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGendvEXT", ptr)
  PFNGLMULTITEXGENFEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGenfEXT", ptr)
  PFNGLMULTITEXGENFVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGenfvEXT", ptr)
  PFNGLMULTITEXGENIEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGeniEXT", ptr)
  PFNGLMULTITEXGENIVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexGenivEXT", ptr)
  PFNGLGETMULTITEXENVFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexEnvfvEXT", ptr)
  PFNGLGETMULTITEXENVIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexEnvivEXT", ptr)
  PFNGLGETMULTITEXGENDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexGendvEXT", ptr)
  PFNGLGETMULTITEXGENFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexGenfvEXT", ptr)
  PFNGLGETMULTITEXGENIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexGenivEXT", ptr)
  PFNGLGETFLOATINDEXEDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetFloatIndexedvEXT", ptr)
  PFNGLGETDOUBLEINDEXEDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetDoubleIndexedvEXT", ptr)
  PFNGLGETPOINTERINDEXEDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetPointerIndexedvEXT", ptr)
  PFNGLCOMPRESSEDTEXTUREIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureImage3DEXT", ptr)
  PFNGLCOMPRESSEDTEXTUREIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureImage2DEXT", ptr)
  PFNGLCOMPRESSEDTEXTUREIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureImage1DEXT", ptr)
  PFNGLCOMPRESSEDTEXTURESUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureSubImage3DEXT", ptr)
  PFNGLCOMPRESSEDTEXTURESUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureSubImage2DEXT", ptr)
  PFNGLCOMPRESSEDTEXTURESUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedTextureSubImage1DEXT", ptr)
  PFNGLGETCOMPRESSEDTEXTUREIMAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetCompressedTextureImageEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexImage3DEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexImage2DEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexImage1DEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXSUBIMAGE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexSubImage3DEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXSUBIMAGE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexSubImage2DEXT", ptr)
  PFNGLCOMPRESSEDMULTITEXSUBIMAGE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glCompressedMultiTexSubImage1DEXT", ptr)
  PFNGLGETCOMPRESSEDMULTITEXIMAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetCompressedMultiTexImageEXT", ptr)
  PFNGLNAMEDPROGRAMSTRINGEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramStringEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETER4DEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameter4dEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETER4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameter4dvEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETER4FEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameter4fEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETER4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameter4fvEXT", ptr)
  PFNGLGETNAMEDPROGRAMLOCALPARAMETERDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramLocalParameterdvEXT", ptr)
  PFNGLGETNAMEDPROGRAMLOCALPARAMETERFVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramLocalParameterfvEXT", ptr)
  PFNGLGETNAMEDPROGRAMIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramivEXT", ptr)
  PFNGLGETNAMEDPROGRAMSTRINGEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramStringEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERS4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameters4fvEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERI4IEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameterI4iEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERI4IVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameterI4ivEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERSI4IVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParametersI4ivEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameterI4uiEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParameterI4uivEXT", ptr)
  PFNGLNAMEDPROGRAMLOCALPARAMETERSI4UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedProgramLocalParametersI4uivEXT", ptr)
  PFNGLGETNAMEDPROGRAMLOCALPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramLocalParameterIivEXT", ptr)
  PFNGLGETNAMEDPROGRAMLOCALPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedProgramLocalParameterIuivEXT", ptr)
  PFNGLTEXTUREPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameterIivEXT", ptr)
  PFNGLTEXTUREPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glTextureParameterIuivEXT", ptr)
  PFNGLGETTEXTUREPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureParameterIivEXT", ptr)
  PFNGLGETTEXTUREPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetTextureParameterIuivEXT", ptr)
  PFNGLMULTITEXPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameterIivEXT", ptr)
  PFNGLMULTITEXPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexParameterIuivEXT", ptr)
  PFNGLGETMULTITEXPARAMETERIIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexParameterIivEXT", ptr)
  PFNGLGETMULTITEXPARAMETERIUIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetMultiTexParameterIuivEXT", ptr)
  PFNGLPROGRAMUNIFORM1FEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1fEXT", ptr)
  PFNGLPROGRAMUNIFORM2FEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2fEXT", ptr)
  PFNGLPROGRAMUNIFORM3FEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3fEXT", ptr)
  PFNGLPROGRAMUNIFORM4FEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4fEXT", ptr)
  PFNGLPROGRAMUNIFORM1IEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1iEXT", ptr)
  PFNGLPROGRAMUNIFORM2IEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2iEXT", ptr)
  PFNGLPROGRAMUNIFORM3IEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3iEXT", ptr)
  PFNGLPROGRAMUNIFORM4IEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4iEXT", ptr)
  PFNGLPROGRAMUNIFORM1FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1fvEXT", ptr)
  PFNGLPROGRAMUNIFORM2FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2fvEXT", ptr)
  PFNGLPROGRAMUNIFORM3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3fvEXT", ptr)
  PFNGLPROGRAMUNIFORM4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4fvEXT", ptr)
  PFNGLPROGRAMUNIFORM1IVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1ivEXT", ptr)
  PFNGLPROGRAMUNIFORM2IVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2ivEXT", ptr)
  PFNGLPROGRAMUNIFORM3IVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3ivEXT", ptr)
  PFNGLPROGRAMUNIFORM4IVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4ivEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x3fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X2FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x2fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x4fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X2FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x2fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X4FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x4fvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X3FVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x3fvEXT", ptr)
  PFNGLPROGRAMUNIFORM1UIEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1uiEXT", ptr)
  PFNGLPROGRAMUNIFORM2UIEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2uiEXT", ptr)
  PFNGLPROGRAMUNIFORM3UIEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3uiEXT", ptr)
  PFNGLPROGRAMUNIFORM4UIEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4uiEXT", ptr)
  PFNGLPROGRAMUNIFORM1UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1uivEXT", ptr)
  PFNGLPROGRAMUNIFORM2UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2uivEXT", ptr)
  PFNGLPROGRAMUNIFORM3UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3uivEXT", ptr)
  PFNGLPROGRAMUNIFORM4UIVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4uivEXT", ptr)
  PFNGLNAMEDBUFFERDATAEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedBufferDataEXT", ptr)
  PFNGLNAMEDBUFFERSUBDATAEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedBufferSubDataEXT", ptr)
  PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEEXTPROC := DllCall(wglGetProcAddress, astr, "glFlushMappedNamedBufferRangeEXT", ptr)
  PFNGLNAMEDCOPYBUFFERSUBDATAEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedCopyBufferSubDataEXT", ptr)
  PFNGLGETNAMEDBUFFERPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedBufferParameterivEXT", ptr)
  PFNGLGETNAMEDBUFFERPOINTERVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedBufferPointervEXT", ptr)
  PFNGLGETNAMEDBUFFERSUBDATAEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedBufferSubDataEXT", ptr)
  PFNGLTEXTUREBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glTextureBufferEXT", ptr)
  PFNGLMULTITEXBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexBufferEXT", ptr)
  PFNGLNAMEDRENDERBUFFERSTORAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedRenderbufferStorageEXT", ptr)
  PFNGLGETNAMEDRENDERBUFFERPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedRenderbufferParameterivEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTURE1DEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTexture1DEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTURE2DEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTexture2DEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTURE3DEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTexture3DEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERRENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferRenderbufferEXT", ptr)
  PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetNamedFramebufferAttachmentParameterivEXT", ptr)
  PFNGLGENERATETEXTUREMIPMAPEXTPROC := DllCall(wglGetProcAddress, astr, "glGenerateTextureMipmapEXT", ptr)
  PFNGLGENERATEMULTITEXMIPMAPEXTPROC := DllCall(wglGetProcAddress, astr, "glGenerateMultiTexMipmapEXT", ptr)
  PFNGLFRAMEBUFFERDRAWBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferDrawBufferEXT", ptr)
  PFNGLFRAMEBUFFERDRAWBUFFERSEXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferDrawBuffersEXT", ptr)
  PFNGLFRAMEBUFFERREADBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glFramebufferReadBufferEXT", ptr)
  PFNGLGETFRAMEBUFFERPARAMETERIVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetFramebufferParameterivEXT", ptr)
  PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedRenderbufferStorageMultisampleEXT", ptr)
  PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLECOVERAGEEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedRenderbufferStorageMultisampleCoverageEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTextureEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTURELAYEREXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTextureLayerEXT", ptr)
  PFNGLNAMEDFRAMEBUFFERTEXTUREFACEEXTPROC := DllCall(wglGetProcAddress, astr, "glNamedFramebufferTextureFaceEXT", ptr)
  PFNGLTEXTURERENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glTextureRenderbufferEXT", ptr)
  PFNGLMULTITEXRENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glMultiTexRenderbufferEXT", ptr)
  PFNGLPROGRAMUNIFORM1DEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1dEXT", ptr)
  PFNGLPROGRAMUNIFORM2DEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2dEXT", ptr)
  PFNGLPROGRAMUNIFORM3DEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3dEXT", ptr)
  PFNGLPROGRAMUNIFORM4DEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4dEXT", ptr)
  PFNGLPROGRAMUNIFORM1DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1dvEXT", ptr)
  PFNGLPROGRAMUNIFORM2DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2dvEXT", ptr)
  PFNGLPROGRAMUNIFORM3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3dvEXT", ptr)
  PFNGLPROGRAMUNIFORM4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x3dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX2X4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix2x4dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X2DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x2dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX3X4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix3x4dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X2DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x2dvEXT", ptr)
  PFNGLPROGRAMUNIFORMMATRIX4X3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformMatrix4x3dvEXT", ptr)
  PFNGLGETMULTISAMPLEFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetMultisamplefvNV", ptr)
  PFNGLSAMPLEMASKINDEXEDNVPROC := DllCall(wglGetProcAddress, astr, "glSampleMaskIndexedNV", ptr)
  PFNGLTEXRENDERBUFFERNVPROC := DllCall(wglGetProcAddress, astr, "glTexRenderbufferNV", ptr)
  PFNGLBINDTRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glBindTransformFeedbackNV", ptr)
  PFNGLDELETETRANSFORMFEEDBACKSNVPROC := DllCall(wglGetProcAddress, astr, "glDeleteTransformFeedbacksNV", ptr)
  PFNGLGENTRANSFORMFEEDBACKSNVPROC := DllCall(wglGetProcAddress, astr, "glGenTransformFeedbacksNV", ptr)
  PFNGLPAUSETRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glPauseTransformFeedbackNV", ptr)
  PFNGLRESUMETRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glResumeTransformFeedbackNV", ptr)
  PFNGLDRAWTRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glDrawTransformFeedbackNV", ptr)
  PFNGLGETPERFMONITORGROUPSAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorGroupsAMD", ptr)
  PFNGLGETPERFMONITORCOUNTERSAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorCountersAMD", ptr)
  PFNGLGETPERFMONITORGROUPSTRINGAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorGroupStringAMD", ptr)
  PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorCounterStringAMD", ptr)
  PFNGLGETPERFMONITORCOUNTERINFOAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorCounterInfoAMD", ptr)
  PFNGLGENPERFMONITORSAMDPROC := DllCall(wglGetProcAddress, astr, "glGenPerfMonitorsAMD", ptr)
  PFNGLDELETEPERFMONITORSAMDPROC := DllCall(wglGetProcAddress, astr, "glDeletePerfMonitorsAMD", ptr)
  PFNGLSELECTPERFMONITORCOUNTERSAMDPROC := DllCall(wglGetProcAddress, astr, "glSelectPerfMonitorCountersAMD", ptr)
  PFNGLBEGINPERFMONITORAMDPROC := DllCall(wglGetProcAddress, astr, "glBeginPerfMonitorAMD", ptr)
  PFNGLENDPERFMONITORAMDPROC := DllCall(wglGetProcAddress, astr, "glEndPerfMonitorAMD", ptr)
  PFNGLGETPERFMONITORCOUNTERDATAAMDPROC := DllCall(wglGetProcAddress, astr, "glGetPerfMonitorCounterDataAMD", ptr)
  PFNGLTESSELLATIONFACTORAMDPROC := DllCall(wglGetProcAddress, astr, "glTessellationFactorAMD", ptr)
  PFNGLTESSELLATIONMODEAMDPROC := DllCall(wglGetProcAddress, astr, "glTessellationModeAMD", ptr)
  PFNGLPROVOKINGVERTEXEXTPROC := DllCall(wglGetProcAddress, astr, "glProvokingVertexEXT", ptr)
  PFNGLBLENDFUNCINDEXEDAMDPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncIndexedAMD", ptr)
  PFNGLBLENDFUNCSEPARATEINDEXEDAMDPROC := DllCall(wglGetProcAddress, astr, "glBlendFuncSeparateIndexedAMD", ptr)
  PFNGLBLENDEQUATIONINDEXEDAMDPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationIndexedAMD", ptr)
  PFNGLBLENDEQUATIONSEPARATEINDEXEDAMDPROC := DllCall(wglGetProcAddress, astr, "glBlendEquationSeparateIndexedAMD", ptr)
  PFNGLTEXTURERANGEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glTextureRangeAPPLE", ptr)
  PFNGLGETTEXPARAMETERPOINTERVAPPLEPROC := DllCall(wglGetProcAddress, astr, "glGetTexParameterPointervAPPLE", ptr)
  PFNGLENABLEVERTEXATTRIBAPPLEPROC := DllCall(wglGetProcAddress, astr, "glEnableVertexAttribAPPLE", ptr)
  PFNGLDISABLEVERTEXATTRIBAPPLEPROC := DllCall(wglGetProcAddress, astr, "glDisableVertexAttribAPPLE", ptr)
  PFNGLMAPVERTEXATTRIB1DAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMapVertexAttrib1dAPPLE", ptr)
  PFNGLMAPVERTEXATTRIB1FAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMapVertexAttrib1fAPPLE", ptr)
  PFNGLMAPVERTEXATTRIB2DAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMapVertexAttrib2dAPPLE", ptr)
  PFNGLMAPVERTEXATTRIB2FAPPLEPROC := DllCall(wglGetProcAddress, astr, "glMapVertexAttrib2fAPPLE", ptr)
  PFNGLGETOBJECTPARAMETERIVAPPLEPROC := DllCall(wglGetProcAddress, astr, "glGetObjectParameterivAPPLE", ptr)
  PFNGLBEGINVIDEOCAPTURENVPROC := DllCall(wglGetProcAddress, astr, "glBeginVideoCaptureNV", ptr)
  PFNGLBINDVIDEOCAPTURESTREAMBUFFERNVPROC := DllCall(wglGetProcAddress, astr, "glBindVideoCaptureStreamBufferNV", ptr)
  PFNGLBINDVIDEOCAPTURESTREAMTEXTURENVPROC := DllCall(wglGetProcAddress, astr, "glBindVideoCaptureStreamTextureNV", ptr)
  PFNGLENDVIDEOCAPTURENVPROC := DllCall(wglGetProcAddress, astr, "glEndVideoCaptureNV", ptr)
  PFNGLGETVIDEOCAPTUREIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoCaptureivNV", ptr)
  PFNGLGETVIDEOCAPTURESTREAMIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoCaptureStreamivNV", ptr)
  PFNGLGETVIDEOCAPTURESTREAMFVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoCaptureStreamfvNV", ptr)
  PFNGLGETVIDEOCAPTURESTREAMDVNVPROC := DllCall(wglGetProcAddress, astr, "glGetVideoCaptureStreamdvNV", ptr)
  PFNGLVIDEOCAPTURESTREAMPARAMETERIVNVPROC := DllCall(wglGetProcAddress, astr, "glVideoCaptureStreamParameterivNV", ptr)
  PFNGLVIDEOCAPTURESTREAMPARAMETERFVNVPROC := DllCall(wglGetProcAddress, astr, "glVideoCaptureStreamParameterfvNV", ptr)
  PFNGLVIDEOCAPTURESTREAMPARAMETERDVNVPROC := DllCall(wglGetProcAddress, astr, "glVideoCaptureStreamParameterdvNV", ptr)
  PFNGLCOPYIMAGESUBDATANVPROC := DllCall(wglGetProcAddress, astr, "glCopyImageSubDataNV", ptr)
  PFNGLUSESHADERPROGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glUseShaderProgramEXT", ptr)
  PFNGLACTIVEPROGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glActiveProgramEXT", ptr)
  PFNGLMAKEBUFFERRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glMakeBufferResidentNV", ptr)
  PFNGLMAKEBUFFERNONRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glMakeBufferNonResidentNV", ptr)
  PFNGLMAKENAMEDBUFFERRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glMakeNamedBufferResidentNV", ptr)
  PFNGLMAKENAMEDBUFFERNONRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glMakeNamedBufferNonResidentNV", ptr)
  PFNGLGETBUFFERPARAMETERUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetBufferParameterui64vNV", ptr)
  PFNGLGETNAMEDBUFFERPARAMETERUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetNamedBufferParameterui64vNV", ptr)
  PFNGLGETINTEGERUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetIntegerui64vNV", ptr)
  PFNGLUNIFORMUI64NVPROC := DllCall(wglGetProcAddress, astr, "glUniformui64NV", ptr)
  PFNGLUNIFORMUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniformui64vNV", ptr)
  PFNGLGETUNIFORMUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformui64vNV", ptr)
  PFNGLPROGRAMUNIFORMUI64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformui64NV", ptr)
  PFNGLPROGRAMUNIFORMUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniformui64vNV", ptr)
  PFNGLBUFFERADDRESSRANGENVPROC := DllCall(wglGetProcAddress, astr, "glBufferAddressRangeNV", ptr)
  PFNGLVERTEXFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glVertexFormatNV", ptr)
  PFNGLNORMALFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glNormalFormatNV", ptr)
  PFNGLCOLORFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glColorFormatNV", ptr)
  PFNGLINDEXFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glIndexFormatNV", ptr)
  PFNGLTEXCOORDFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glTexCoordFormatNV", ptr)
  PFNGLEDGEFLAGFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glEdgeFlagFormatNV", ptr)
  PFNGLSECONDARYCOLORFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glSecondaryColorFormatNV", ptr)
  PFNGLFOGCOORDFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glFogCoordFormatNV", ptr)
  PFNGLVERTEXATTRIBFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribFormatNV", ptr)
  PFNGLVERTEXATTRIBIFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribIFormatNV", ptr)
  PFNGLGETINTEGERUI64I_VNVPROC := DllCall(wglGetProcAddress, astr, "glGetIntegerui64i_vNV", ptr)
  PFNGLTEXTUREBARRIERNVPROC := DllCall(wglGetProcAddress, astr, "glTextureBarrierNV", ptr)
  PFNGLBINDIMAGETEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glBindImageTextureEXT", ptr)
  PFNGLMEMORYBARRIEREXTPROC := DllCall(wglGetProcAddress, astr, "glMemoryBarrierEXT", ptr)
  PFNGLVERTEXATTRIBL1DEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1dEXT", ptr)
  PFNGLVERTEXATTRIBL2DEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2dEXT", ptr)
  PFNGLVERTEXATTRIBL3DEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3dEXT", ptr)
  PFNGLVERTEXATTRIBL4DEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4dEXT", ptr)
  PFNGLVERTEXATTRIBL1DVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1dvEXT", ptr)
  PFNGLVERTEXATTRIBL2DVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2dvEXT", ptr)
  PFNGLVERTEXATTRIBL3DVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3dvEXT", ptr)
  PFNGLVERTEXATTRIBL4DVEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4dvEXT", ptr)
  PFNGLVERTEXATTRIBLPOINTEREXTPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribLPointerEXT", ptr)
  PFNGLGETVERTEXATTRIBLDVEXTPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribLdvEXT", ptr)
  PFNGLVERTEXARRAYVERTEXATTRIBLOFFSETEXTPROC := DllCall(wglGetProcAddress, astr, "glVertexArrayVertexAttribLOffsetEXT", ptr)
  PFNGLPROGRAMSUBROUTINEPARAMETERSUIVNVPROC := DllCall(wglGetProcAddress, astr, "glProgramSubroutineParametersuivNV", ptr)
  PFNGLGETPROGRAMSUBROUTINEPARAMETERUIVNVPROC := DllCall(wglGetProcAddress, astr, "glGetProgramSubroutineParameteruivNV", ptr)
  PFNGLUNIFORM1I64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform1i64NV", ptr)
  PFNGLUNIFORM2I64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform2i64NV", ptr)
  PFNGLUNIFORM3I64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform3i64NV", ptr)
  PFNGLUNIFORM4I64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform4i64NV", ptr)
  PFNGLUNIFORM1I64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform1i64vNV", ptr)
  PFNGLUNIFORM2I64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform2i64vNV", ptr)
  PFNGLUNIFORM3I64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform3i64vNV", ptr)
  PFNGLUNIFORM4I64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform4i64vNV", ptr)
  PFNGLUNIFORM1UI64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform1ui64NV", ptr)
  PFNGLUNIFORM2UI64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform2ui64NV", ptr)
  PFNGLUNIFORM3UI64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform3ui64NV", ptr)
  PFNGLUNIFORM4UI64NVPROC := DllCall(wglGetProcAddress, astr, "glUniform4ui64NV", ptr)
  PFNGLUNIFORM1UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform1ui64vNV", ptr)
  PFNGLUNIFORM2UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform2ui64vNV", ptr)
  PFNGLUNIFORM3UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform3ui64vNV", ptr)
  PFNGLUNIFORM4UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glUniform4ui64vNV", ptr)
  PFNGLGETUNIFORMI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetUniformi64vNV", ptr)
  PFNGLPROGRAMUNIFORM1I64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1i64NV", ptr)
  PFNGLPROGRAMUNIFORM2I64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2i64NV", ptr)
  PFNGLPROGRAMUNIFORM3I64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3i64NV", ptr)
  PFNGLPROGRAMUNIFORM4I64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4i64NV", ptr)
  PFNGLPROGRAMUNIFORM1I64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1i64vNV", ptr)
  PFNGLPROGRAMUNIFORM2I64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2i64vNV", ptr)
  PFNGLPROGRAMUNIFORM3I64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3i64vNV", ptr)
  PFNGLPROGRAMUNIFORM4I64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4i64vNV", ptr)
  PFNGLPROGRAMUNIFORM1UI64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1ui64NV", ptr)
  PFNGLPROGRAMUNIFORM2UI64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2ui64NV", ptr)
  PFNGLPROGRAMUNIFORM3UI64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3ui64NV", ptr)
  PFNGLPROGRAMUNIFORM4UI64NVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4ui64NV", ptr)
  PFNGLPROGRAMUNIFORM1UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform1ui64vNV", ptr)
  PFNGLPROGRAMUNIFORM2UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform2ui64vNV", ptr)
  PFNGLPROGRAMUNIFORM3UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform3ui64vNV", ptr)
  PFNGLPROGRAMUNIFORM4UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glProgramUniform4ui64vNV", ptr)
  PFNGLVERTEXATTRIBL1I64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1i64NV", ptr)
  PFNGLVERTEXATTRIBL2I64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2i64NV", ptr)
  PFNGLVERTEXATTRIBL3I64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3i64NV", ptr)
  PFNGLVERTEXATTRIBL4I64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4i64NV", ptr)
  PFNGLVERTEXATTRIBL1I64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1i64vNV", ptr)
  PFNGLVERTEXATTRIBL2I64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2i64vNV", ptr)
  PFNGLVERTEXATTRIBL3I64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3i64vNV", ptr)
  PFNGLVERTEXATTRIBL4I64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4i64vNV", ptr)
  PFNGLVERTEXATTRIBL1UI64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1ui64NV", ptr)
  PFNGLVERTEXATTRIBL2UI64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2ui64NV", ptr)
  PFNGLVERTEXATTRIBL3UI64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3ui64NV", ptr)
  PFNGLVERTEXATTRIBL4UI64NVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4ui64NV", ptr)
  PFNGLVERTEXATTRIBL1UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL1ui64vNV", ptr)
  PFNGLVERTEXATTRIBL2UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL2ui64vNV", ptr)
  PFNGLVERTEXATTRIBL3UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL3ui64vNV", ptr)
  PFNGLVERTEXATTRIBL4UI64VNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribL4ui64vNV", ptr)
  PFNGLGETVERTEXATTRIBLI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribLi64vNV", ptr)
  PFNGLGETVERTEXATTRIBLUI64VNVPROC := DllCall(wglGetProcAddress, astr, "glGetVertexAttribLui64vNV", ptr)
  PFNGLVERTEXATTRIBLFORMATNVPROC := DllCall(wglGetProcAddress, astr, "glVertexAttribLFormatNV", ptr)
  PFNGLGENNAMESAMDPROC := DllCall(wglGetProcAddress, astr, "glGenNamesAMD", ptr)
  PFNGLDELETENAMESAMDPROC := DllCall(wglGetProcAddress, astr, "glDeleteNamesAMD", ptr)
  PFNGLDEBUGMESSAGEENABLEAMDPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageEnableAMD", ptr)
  PFNGLDEBUGMESSAGEINSERTAMDPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageInsertAMD", ptr)
  PFNGLDEBUGMESSAGECALLBACKAMDPROC := DllCall(wglGetProcAddress, astr, "glDebugMessageCallbackAMD", ptr)
  PFNGLVDPAUINITNVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUInitNV", ptr)
  PFNGLVDPAUFININVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUFiniNV", ptr)
  PFNGLVDPAUISSURFACENVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUIsSurfaceNV", ptr)
  PFNGLVDPAUUNREGISTERSURFACENVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUUnregisterSurfaceNV", ptr)
  PFNGLVDPAUGETSURFACEIVNVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUGetSurfaceivNV", ptr)
  PFNGLVDPAUSURFACEACCESSNVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUSurfaceAccessNV", ptr)
  PFNGLVDPAUMAPSURFACESNVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUMapSurfacesNV", ptr)
  PFNGLVDPAUUNMAPSURFACESNVPROC := DllCall(wglGetProcAddress, astr, "glVDPAUUnmapSurfacesNV", ptr)
  PFNGLISPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glIsProgram", ptr)
  PFNGLISSHADERPROC := DllCall(wglGetProcAddress, astr, "glIsShader", ptr)
  PFNGLISENABLEDIPROC := DllCall(wglGetProcAddress, astr, "glIsEnabledi", ptr)
  PFNGLISPROGRAMARBPROC := DllCall(wglGetProcAddress, astr, "glIsProgramARB", ptr)
  PFNGLISBUFFERARBPROC := DllCall(wglGetProcAddress, astr, "glIsBufferARB", ptr)
  PFNGLMAPBUFFERARBPROC := DllCall(wglGetProcAddress, astr, "glMapBufferARB", ptr)
  PFNGLUNMAPBUFFERARBPROC := DllCall(wglGetProcAddress, astr, "glUnmapBufferARB", ptr)
  PFNGLISQUERYARBPROC := DllCall(wglGetProcAddress, astr, "glIsQueryARB", ptr)
  PFNGLISRENDERBUFFERPROC := DllCall(wglGetProcAddress, astr, "glIsRenderbuffer", ptr)
  PFNGLISFRAMEBUFFERPROC := DllCall(wglGetProcAddress, astr, "glIsFramebuffer", ptr)
  PFNGLISVERTEXARRAYPROC := DllCall(wglGetProcAddress, astr, "glIsVertexArray", ptr)
  PFNGLFENCESYNCPROC := DllCall(wglGetProcAddress, astr, "glFenceSync", ptr)
  PFNGLISSYNCPROC := DllCall(wglGetProcAddress, astr, "glIsSync", ptr)
  PFNGLISNAMEDSTRINGARBPROC := DllCall(wglGetProcAddress, astr, "glIsNamedStringARB", ptr)
  PFNGLISSAMPLERPROC := DllCall(wglGetProcAddress, astr, "glIsSampler", ptr)
  PFNGLISTRANSFORMFEEDBACKPROC := DllCall(wglGetProcAddress, astr, "glIsTransformFeedback", ptr)
  PFNGLISPROGRAMPIPELINEPROC := DllCall(wglGetProcAddress, astr, "glIsProgramPipeline", ptr)
  PFNGLARETEXTURESRESIDENTEXTPROC := DllCall(wglGetProcAddress, astr, "glAreTexturesResidentEXT", ptr)
  PFNGLISTEXTUREEXTPROC := DllCall(wglGetProcAddress, astr, "glIsTextureEXT", ptr)
  PFNGLISASYNCMARKERSGIXPROC := DllCall(wglGetProcAddress, astr, "glIsAsyncMarkerSGIX", ptr)
  PFNGLISFENCENVPROC := DllCall(wglGetProcAddress, astr, "glIsFenceNV", ptr)
  PFNGLTESTFENCENVPROC := DllCall(wglGetProcAddress, astr, "glTestFenceNV", ptr)
  PFNGLAREPROGRAMSRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glAreProgramsResidentNV", ptr)
  PFNGLISPROGRAMNVPROC := DllCall(wglGetProcAddress, astr, "glIsProgramNV", ptr)
  PFNGLNEWOCJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glNewOcjectBufferATI", ptr)
  PFNGLISOBJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glIsObjectBufferATI", ptr)
  PFNGLISVARIANTENABLEDEXTPROC := DllCall(wglGetProcAddress, astr, "glIsVariantEnabledEXT", ptr)
  PFNGLBINDLIGHTPARAMETEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindLightParameterEXT", ptr)
  PFNGLBINDMATERIALPARAMETEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindMaterialParameterEXT", ptr)
  PFNGLBINDTEXGENPARAMETEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindTexGenParameterEXT", ptr)
  PFNGLBINDTEXTUREUNITPARAMETEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindTextureUnitParameterEXT", ptr)
  PFNGLBINDPARAMETEREXTPROC := DllCall(wglGetProcAddress, astr, "glBindParameterEXT", ptr)
  PFNGLISOCCLUSIONQUERYNVPROC := DllCall(wglGetProcAddress, astr, "glIsOcclusionQueryNV", ptr)
  PFNGLISFENCEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glIsFenceAPPLE", ptr)
  PFNGLTESTFENCEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glTestFenceAPPLE", ptr)
  PFNGLTESTOBJECTAPPLEPROC := DllCall(wglGetProcAddress, astr, "glTestObjectAPPLE", ptr)
  PFNGLISVERTEXARRAYAPPLEPROC := DllCall(wglGetProcAddress, astr, "glIsVertexArrayAPPLE", ptr)
  PFNGLISRENDERBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glIsRenderbufferEXT", ptr)
  PFNGLISFRAMEBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glIsFramebufferEXT", ptr)
  PFNGLISENABLEDINDEXEXTPROC := DllCall(wglGetProcAddress, astr, "glIsEnabledIndexEXT", ptr)
  PFNGLMAPNAMEDBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glMapNamedBufferEXT", ptr)
  PFNGLUNMAPNAMEDBUFFEREXTPROC := DllCall(wglGetProcAddress, astr, "glUnmapNamedBufferEXT", ptr)
  PFNGLMAPNAMEDBUFFERRANGEEXTPROC := DllCall(wglGetProcAddress, astr, "glMapNamedBufferRangeEXT", ptr)
  PFNGLISTRANSFORMFEEDBACKNVPROC := DllCall(wglGetProcAddress, astr, "glIsTransformFeedbackNV", ptr)
  PFNGLISVERTEXATTRIBENABLEDAPPLEPROC := DllCall(wglGetProcAddress, astr, "glIsVertexAttribEnabledAPPLE", ptr)
  PFNGLISBUFFERRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glIsBufferResidentNV", ptr)
  PFNGLISNAMEDBUFFERRESIDENTNVPROC := DllCall(wglGetProcAddress, astr, "glIsNamedBufferResidentNV", ptr)
  PFNGLISNAMEAMDPROC := DllCall(wglGetProcAddress, astr, "glIsNameAMD", ptr)
  PFNGLMAPBUFFERPROC := DllCall(wglGetProcAddress, astr, "glMapBuffer", ptr)
  PFNGLUNMAPBUFFERPROC := DllCall(wglGetProcAddress, astr, "glUnmapBuffer", ptr)
  PFNGLGETSTRINGIPROC := DllCall(wglGetProcAddress, astr, "glGetStringi", ptr)
  PFNGLMAPBUFFERRANGEPROC := DllCall(wglGetProcAddress, astr, "glMapBufferRange", ptr)
  PFNGLMAPOBJECTBUFFERATIPROC := DllCall(wglGetProcAddress, astr, "glMapObjectBufferATI", ptr)
  PFNGLCREATEPROGRAMPROC := DllCall(wglGetProcAddress, astr, "glCreateProgram", ptr)
  PFNGLCREATESHADERPROC := DllCall(wglGetProcAddress, astr, "glCreateShader", ptr)
  PFNGLGETUNIFORMBLOCKINDEXPROC := DllCall(wglGetProcAddress, astr, "glGetUniformBlockIndex", ptr)
  PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC := DllCall(wglGetProcAddress, astr, "glGetSubroutineUniformLocation", ptr)
  PFNGLGETSUBROUTINEINDEXPROC := DllCall(wglGetProcAddress, astr, "glGetSubroutineIndex", ptr)
  PFNGLCREATESHADERPROGRAMVPROC := DllCall(wglGetProcAddress, astr, "glCreateShaderProgramv", ptr)
  PFNGLGETDEBUGMESSAGELOGARBPROC := DllCall(wglGetProcAddress, astr, "glGetDebugMessageLogARB", ptr)
  PFNGLGETGRAPHICSRESETSTATUSARBPROC := DllCall(wglGetProcAddress, astr, "glGetGraphicsResetStatusARB", ptr)
  PFNGLFINISHASYNCSGIXPROC := DllCall(wglGetProcAddress, astr, "glFinishAsyncSGIX", ptr)
  PFNGLPOLLASYNCSGIXPROC := DllCall(wglGetProcAddress, astr, "glPollAsyncSGIX", ptr)
  PFNGLGENASYNCMARKERSSGIXPROC := DllCall(wglGetProcAddress, astr, "glGenAsyncMarkersSGIX", ptr)
  PFNGLGENFRAGMENTSHADERSATIPROC := DllCall(wglGetProcAddress, astr, "glGenFragmentShadersATI", ptr)
  PFNGLGENVERTEXSHADERSEXTPROC := DllCall(wglGetProcAddress, astr, "glGenVertexShadersEXT", ptr)
  PFNGLGENSYMBOLSEXTPROC := DllCall(wglGetProcAddress, astr, "glGenSymbolsEXT", ptr)
  PFNGLCREATESHADERPROGRAMEXTPROC := DllCall(wglGetProcAddress, astr, "glCreateShaderProgramEXT", ptr)
  PFNGLGETDEBUGMESSAGELOGAMDPROC := DllCall(wglGetProcAddress, astr, "glGetDebugMessageLogAMD", ptr)
  PFNGLGETATTRIBLOCATIONPROC := DllCall(wglGetProcAddress, astr, "glGetAttribLocation", ptr)
  PFNGLGETUNIFORMLOCATIONPROC := DllCall(wglGetProcAddress, astr, "glGetUniformLocation", ptr)
  PFNGLGETFRAGDATALOCATIONPROC := DllCall(wglGetProcAddress, astr, "glGetFragDataLocation", ptr)
  PFNGLGETUNIFORMLOCATIONARBPROC := DllCall(wglGetProcAddress, astr, "glGetUniformLocationARB", ptr)
  PFNGLGETATTRIBLOCATIONARBPROC := DllCall(wglGetProcAddress, astr, "glGetAttribLocationARB", ptr)
  PFNGLGETFRAGDATAINDEXPROC := DllCall(wglGetProcAddress, astr, "glGetFragDataIndex", ptr)
  PFNGLGETINSTRUMENTSSGIXPROC := DllCall(wglGetProcAddress, astr, "glGetInstrumentsSGIX", ptr)
  PFNGLPOLLINSTRUMENTSSGIXPROC := DllCall(wglGetProcAddress, astr, "glPollInstrumentsSGIX", ptr)
  PFNGLGETFRAGDATALOCATIONEXTPROC := DllCall(wglGetProcAddress, astr, "glGetFragDataLocationEXT", ptr)
  PFNGLGETVARYINGLOCATIONNVPROC := DllCall(wglGetProcAddress, astr, "glGetVaryingLocationNV", ptr)
  PFNGLGETUNIFORMBUFFERSIZEEXTPROC := DllCall(wglGetProcAddress, astr, "glGetUniformBufferSizeEXT", ptr)
  PFNGLGETUNIFORMOFFSETEXTPROC := DllCall(wglGetProcAddress, astr, "glGetUniformOffsetEXT", ptr)
  PFNGLGETHANDLEARBPROC := DllCall(wglGetProcAddress, astr, "glGetHandleARB", ptr)
  PFNGLCREATESHADEROBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glCreateShaderObjectARB", ptr)
  PFNGLCREATEPROGRAMOBJECTARBPROC := DllCall(wglGetProcAddress, astr, "glCreateProgramObjectARB", ptr)
  PFNGLCHECKFRAMEBUFFERSTATUSPROC := DllCall(wglGetProcAddress, astr, "glCheckFramebufferStatus", ptr)
  PFNGLCLIENTWAITSYNCPROC := DllCall(wglGetProcAddress, astr, "glClientWaitSync", ptr)
  PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC := DllCall(wglGetProcAddress, astr, "glCheckFramebufferStatusEXT", ptr)
  PFNGLCHECKNAMEDFRAMEBUFFERSTATUSEXTPROC := DllCall(wglGetProcAddress, astr, "glCheckNamedFramebufferStatusEXT", ptr)
  PFNGLOBJECTPURGEABLEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glObjectPurgeableAPPLE", ptr)
  PFNGLOBJECTUNPURGEABLEAPPLEPROC := DllCall(wglGetProcAddress, astr, "glObjectUnpurgeableAPPLE", ptr)
  PFNGLVIDEOCAPTURENVPROC := DllCall(wglGetProcAddress, astr, "glVideoCaptureNV", ptr)
  PFNGLVDPAUREGISTERVIDEOSURFACENVPROC := DllCall(wglGetProcAddress, astr, "glVDPAURegisterVideoSurfaceNV", ptr)
  PFNGLVDPAUREGISTEROUTPUTSURFACENVPROC := DllCall(wglGetProcAddress, astr, "glVDPAURegisterOutputSurfaceNV", ptr)
  if (DllCall("opengl32\wglGetCurrentContext", ptr))
    return 1
  return 0
}


;aglIsExt tests if the implementation supports the specified extension.
;ext - The extension of interrest.
;return - 1 if the extension exist, 0 if the extension NOT exist or nothing ("") if the function fails.
;Use this function AFTER you created a rendercontext.
;for example: aglIsExt("GL_ARB_imaging")

aglIsExt(ext)
{
  astr := (A_IsUnicode) ? "astr" : "str"
  extensions := DllCall("opengl32\glGetString", "uint", 0x1F03, astr)
  if (instr(" " extensions " ", " " ext " "))
    return 1
  return 0
}


aglIsWglExt(extension)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"
  PFNWGLGETEXTENSIONSSTRINGARBPROC := DllCall("opengl32\wglGetProcAddress", astr, "wglGetExtensionsStringARB", ptr)
  extensions := DllCall(PFNWGLGETEXTENSIONSSTRINGARBPROC, ptr, DllCall("opengl32\wglGetCurrentDC", ptr), astr)
  if (instr(" " extensions " ", " " extension " "))
    return 1
  return aglIsExt(extension)
}


;aglGetVersion returns the versionnumber of the OpenGL-implementation
;The format of the returnvalue is [Major].[Minor]

aglGetVersion()
{
  astr := (A_IsUnicode) ? "astr" : "str"
  if (!version := DllCall("opengl32\glGetString", "uint", 0x1F02, astr))
    return 0
  maj := substr(version, 1, (p := instr(version, "."))-1)
  min := substr(version, p+1)
  if (p := instr(min, "."))
    min := substr(min, 1, p-1)
  if (p := instr(min, " "))
    min := substr(min, 1, p-1)
  if (!min)
    min := 0
  return maj "." min
}


;aglGetInteger returns a single integer (no arrays like glGetIntegerv)

aglGetInteger(pname)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(param, 4, 0)
  DllCall("opengl32\glGetIntegerv", "uint", pname, ptr, &param)
  return NumGet(param, 0, "int")
}


;aglGetFloat returns a single float (no arrays like glGetFloatv)

aglGetFloat(pname)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(param, 4, 0)
  DllCall("opengl32\glGetFloatv", "uint", pname, ptr, &param)
  return NumGet(param, 0, "float")
}


;aglGetDouble returns a single double (no arrays like glGetDoublev)

aglGetDouble(pname)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(param, 8, 0)
  DllCall("opengl32\glGetDoublev", "uint", pname, ptr, &param)
  return NumGet(param, 0, "double")
}


;aglGetBoolean returns a single boolean (no arrays like glGetBooleanv)

aglGetBoolean(pname)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(param, 1, 0)
  DllCall("opengl32\glGetBooleanv", "uint", pname, ptr, &param)
  return NumGet(param, 0, "uchar")
}


;aglLoadTexImage1D loads a texture from an imagefile.
;This function can load BMP and uncompressed TGA formats.
;If GDI+ ist installed (Windows XP Service Pack 2) it can load BMP, PNG, JPG, JPEG, GIF, TIF and TIFF images.
;If the Image is higher than 1 pixel, only the first line will be used

aglLoadTexImage1D(target, filename, internalformat=4, minfilter=0x2601, magfilter=0x2601, loadonce=0)
{
  static
  if (loadonce)
  {
    loop, % loaded
    {
      if (tex_%A_Index% = filename)
        return texnum_%A_Index%
    }
  }
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(__aglTextureBitmap(filename, 1, w, h, format, type, data)))
    return 0
  tex := aglGenTexture()
  DllCall("opengl32\glBindTexture", "uint", target, "uint", tex)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2800, "uint", magfilter)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2801, "uint", minfilter)
  DllCall("opengl32\glTexImage1D", "uint", target, "int", 0, "uint", internalformat, "int", w, "int", 0, "int", format, "uint", type, ptr, data)
  DllCall("DeleteObject", ptr, hBitmap)
  loaded := (!loaded) ? 1 : loaded+1
  tex_%loaded% := filename
  texnum_%loaded% := tex
  return tex
}


;aglLoadTexImage2D loads a texture from an imagefile.
;This function can load BMP and uncompressed TGA formats.
;If GDI+ ist installed (Windows XP Service Pack 2) it can load BMP, PNG, JPG, JPEG, GIF, TIF and TIFF images.

aglLoadTexImage2D(target, filename, internalformat=4, minfilter=0x2601, magfilter=0x2601, loadonce=0)
{
  static
  if (loadonce)
  {
    loop, % loaded
    {
      if (tex_%A_Index% = filename)
        return texnum_%A_Index%
    }
  }
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(__aglTextureBitmap(filename, 1, w, h, format, type, data)))
    return 0
  tex := aglGenTexture()
  DllCall("opengl32\glBindTexture", "uint", target, "uint", tex)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2800, "uint", magfilter)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2801, "uint", minfilter)
  DllCall("opengl32\glTexImage2D", "uint", target, "int", 0, "uint", internalformat, "int", w, "int", h, "int", 0, "int", format, "uint", type, ptr, data)
  DllCall("DeleteObject", ptr, hBitmap)
  loaded := (!loaded) ? 1 : loaded+1
  tex_%loaded% := filename
  texnum_%loaded% := tex
  return tex
}


;aglLoadMipmaps1D loads a mipmap-texture from an imagefile.
;This function can load BMP and uncompressed TGA formats.
;If GDI+ ist installed (Windows XP Service Pack 2) it can load BMP, PNG, JPG, JPEG, GIF, TIF and TIFF images.
;If the Image is higher than 1 pixel, only the first line will be used

aglLoadMipmaps1D(target, filename, internalformat=4, minfilter=0x2601, magfilter=0x2601, loadonce=0)
{
  static
  if (loadonce)
  {
    loop, % loaded
    {
      if (tex_%A_Index% = filename)
        return texnum_%A_Index%
    }
  }
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(__aglTextureBitmap(filename, 0, w, h, format, type, data)))
    return 0
  tex := aglGenTexture()
  DllCall("opengl32\glBindTexture", "uint", target, "uint", tex)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2800, "uint", magfilter)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2801, "uint", minfilter)
  DllCall("glu32\gluBuild1DMipmaps", "uint", target, "uint", internalformat, "int", w, "int", format, "uint", type, ptr, data)
  DllCall("DeleteObject", ptr, hBitmap)
  loaded := (!loaded) ? 1 : loaded+1
  tex_%loaded% := filename
  texnum_%loaded% := tex
  return tex
}


;aglLoadMipmaps2D loads a mipmap-texture from an imagefile.
;This function can load BMP and uncompressed TGA formats.
;If GDI+ ist installed (Windows XP Service Pack 2) it can load BMP, PNG, JPG, JPEG, GIF, TIF and TIFF images.

aglLoadMipmaps2D(target, filename, components=4, minfilter=0x2601, magfilter=0x2601, loadonce=0)
{
  static
  if (loadonce)
  {
    loop, % loaded
    {
      if (tex_%A_Index% = filename)
        return texnum_%A_Index%
    }
  }
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(__aglTextureBitmap(filename, 0, w, h, format, type, data)))
    return 0
  tex := aglGenTexture()
  DllCall("opengl32\glBindTexture", "uint", target, "uint", tex)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2800, "uint", magfilter)
  DllCall("opengl32\glTexParameteri", "uint", target, "uint", 0x2801, "uint", minfilter)
  DllCall("glu32\gluBuild2DMipmaps", "uint", target, "uint", components, "int", w, "int", h, "int", format, "uint", type, ptr, data)
  DllCall("DeleteObject", ptr, hBitmap)
  loaded := (!loaded) ? 1 : loaded+1
  tex_%loaded% := filename
  texnum_%loaded% := tex
  return tex
}

AglSetActiveTex(Name)
{
static
DllCall("opengl32\glBindTexture", "uint", 0x0DE1, "uint", Name)
}

aglGenTexture()
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(tex, 4, 0)
  DllCall("opengl32\glGenTextures", "int", 1, ptr, &tex)
  return NumGet(tex, 0, "uint")
}

aglDeleteTexture(texture)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  VarSetCapacity(tex, 4, 0)
  NumPut(texture, tex, 0, "int")
  DllCall("opengl32\glDeleteTextures", "int", 1, ptr, &tex)
  return 1
}

aglRenderToTexture(texture, x=0, y=0, width=0, height=0, internalformat=4, minfilter=0x2601, magfilter=0x2601)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!texture)
    return 0
  if ((!width) || (!height))
  {
    VarSetCapacity(viewport, 16, 0)
    DllCall("opengl32\glGetIntegerv", "uint", 0x0BA2, ptr, &viewport)
    if (!width)
      width := NumGet(viewport, 8, "int")
    if (!height)
      height := NumGet(viewport, 12, "int")
  }
  DllCall("opengl32\glFlush")
  VarSetCapacity(pixels, width*height*4)
  DllCall("opengl32\glReadPixels", "int", x, "int", y, "int", width, "int", height, "uint", 0x1908, "uint", 0x1401, ptr, &pixels)
  __aglCalcTexSize(width, height, neww, newh)
  if ((width!=neww) || (height!=newh))
  {
    VarSetCapacity(new_pixels, neww*newh*4)
    DllCall("glu32\gluScaleImage", "uint", 0x1908, "int", width, "int", height, "uint", 0x1401, ptr, &pixels, "int", neww, "int", newh, "uint", 0x1401, ptr, &new_pixels)
    ppixels := &new_pixels
  }
  else
    ppixels := &pixels
  DllCall("opengl32\glBindTexture", "uint", 0x0DE1, "uint", texture)
  DllCall("opengl32\glTexParameteri", "uint", 0x0DE1, "uint", 0x2800, "uint", magfilter)
  DllCall("opengl32\glTexParameteri", "uint", 0x0DE1, "uint", 0x2801, "uint", minfilter)
  DllCall("opengl32\glTexImage2D", "uint", 0x0DE1, "int", 0, "int", internalformat, "int", neww, "int", newh, "int", 0, "int", 0x1908, "uint", 0x1401, ptr, ppixels)
  return 1
}


aglSetLoadWarnings(warnings)
{
  if warnings in -1,0,1
  {
    __aglLoad("warnings", warnings)
    return 1
  }
  return 0
}

aglLoadModel(filename, model="", loadmaterials=1, loadtextures=1)
{
  if (!FileExist(filename))
    return 0
  if ((warnings := __aglLoad("warnings"))="")
    warnings := 0
  workingdir := (p := instr(filename, "\", 0, 0)) ? substr(filename, 1, p) : ""
  mati := 0
  inmod := (!model) ? 1 : 0
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"
  PFNGLMULTITEXCOORD4FPROC := DllCall("opengl32\wglGetProcAddress", astr, "glMultiTexCoord4f", ptr)
  Loop, read, % filename
  {
    l := A_LoopReadLine
    StringReplace, l, l, % "`t", % " ", 1
    while (instr(l, "  "))
      StringReplace, l, l, % "  ", % " ", 1
    StringSplit, l, l, % " "
    if ((l1 = "o") && (l2 = model))
      inmod := 1
    else if ((l1 = "o") && (inmod) && (model!=""))
      break
    else if (l1 = "mtllib")
      mtllib := workingdir l2
    else if ((inmod) && (loadmaterials))
    {
      if (l1 = "usemtl")
      {
        if (l2 = "(null)")
          continue
        mati++
        mat_%mati%_name := l2
        if (!mat_%mati% := aglLoadMaterial(mtllib, l2, loadtextures))
        {
          mati--
          if (warnings=1)
          {
            MsgBox, 16, Error, Material "%l2%", defined in "%filename%", can't be loaded from "%mtllib%"
            return 0
          }
          if (warnings=0)
            return 0
        }
      }
    }
  }
  if (inmod=0)
  {
    if (warnings=1)
      MsgBox, 16, Error, Model "%model%", wasn't found in "%filename%"!
    return 0
  }
  list := DllCall("opengl32\glGenLists", "int", 1, "uint")
  DllCall("opengl32\glNewList", "uint", list, "uint", 0x1300) ;GL_COMPILE
  vi := vni := vti := 0
  inmod := (!model) ? 1 : 0
  Loop, read, % filename
  {
    l := A_LoopReadLine
    StringReplace, l, l, % "`t", % " ", 1
    while (instr(l, "  "))
      StringReplace, l, l, % "  ", % " ", 1
    StringSplit, l, l, % " "
    if (l1 = "mtllib")
      mtllib := workingdir l2
    else if (l1 = "v")
    {
      vi ++
      v_%vi%_x := (l0 > 1) ? l2 : 0
      v_%vi%_y := (l0 > 2) ? l3 : 0
      v_%vi%_z := (l0 > 3) ? l4 : 0
      v_%vi%_w := (l0 > 4) ? l5 : 1
    }
    else if (l1 = "vn")
    {
      vni ++
      vn_%vni%_x := (l0 > 1) ? l2 : 0
       vn_%vni%_y := (l0 > 2) ? l3 : 0
      vn_%vni%_z := (l0 > 3) ? l4 : 0
    }
    else if (l1 = "vt")
    {
      vti ++
      vt_%vti%_s := (l0 > 1) ? l2 : 0
      vt_%vti%_t := (l0 > 2) ? l3 : 0
      vt_%vti%_r := (l0 > 3) ? l4 : 0
      vt_%vti%_q := (l0 > 4) ? l5 : 1
    }
    else if ((l1 = "o") && (l2 = model))
      inmod := 1
    else if ((l1 = "o") && (inmod) && (model))
      break
    else if (inmod)
    {
      if (l1 = "f")
      {
        if ((l0 >= 2) && (l0 <=5))
        {
          if (l0 = 2)
            DllCall("opengl32\glBegin", "uint", 0x0000) ;GL_POINTS
          else if (l0 = 3)
            DllCall("opengl32\glBegin", "uint", 0x0001) ;GL_LINES
          else if (l0 = 4)
            DllCall("opengl32\glBegin", "uint", 0x0004) ;GL_TRIANGLES
          else if (l0 = 5)
            DllCall("opengl32\glBegin", "uint", 0x0007) ;GL_QUADS
          Loop, % l0 - 1
          {
            vertex := A_Index+1
            vertex := l%vertex%
            Loop, parse, vertex, /
            {
              if ((i := A_LoopField)="")
                continue
              if (A_Index=2)
              {
                if ((loadtextures < 2) && (PFNGLMULTITEXCOORD4FPROC))
                  DllCall("opengl32\glTexCoord4f", "float", vt_%i%_s, "float", vt_%i%_t, "float", vt_%i%_r, "float", vt_%i%_q)
                else
                {
                  Loop, % loadtextures
                    DllCall(PFNGLMULTITEXCOORD4FPROC, "uint", 0x84C0+A_Index-1, "float", vt_%i%_s, "float", vt_%i%_t, "float", vt_%i%_r, "float", vt_%i%_q)
                }
              }
              if (A_Index=3)
                DllCall("opengl32\glNormal3f", "float", vn_%i%_x, "float", vn_%i%_y, "float", vn_%i%_z)
            }
            Loop, parse, vertex, /
            {
              if ((i := A_LoopField)="")
                continue
              if (A_Index=1)
                DllCall("opengl32\glVertex4f", "float", v_%i%_x, "float", v_%i%_y, "float", v_%i%_z, "float", v_%i%_w)
            }
          }
          DllCall("opengl32\glEnd")
        }
      }
      else if ((l1 = "usemtl") && (loadmaterials))
      {
        if (l2 = "(null)")
        {
          DllCall("opengl32\glDisable", "uint", 0x0DE1) ;GL_TEXTURE_2D
          DllCall("opengl32\glDisable", "uint", 0x0B50) ;GL_LIGHTING
          continue
        }
        else
        {
          loop, % mati
          {
            if (mat_%A_Index%_name = l2)
            {
              aglCallMaterial(mat_%A_Index%)
              break
            }
          }
        }
      }
    }
  }
  DllCall("opengl32\glEndList")
  if (!(nmodels := __aglLoad("nmodels")))
    nmodels := 0
  nmodels ++
  __aglLoad("nmodels", nmodels)
  __aglLoad("model" nmodels, list)
  Loop, % __aglLoad("model" nmodels "_materials", mati)
    __aglLoad("model" nmodels "_material" A_Index, mat_%A_Index%)
  return nmodels
}

aglCallModel(model)
{
  DllCall("opengl32\glCallList", "uint", list := __aglLoad("model" model))
  return list
}

aglDeleteModel(model)
{
  DllCall("opengl32\glDeleteList", "uint", __aglLoad("model" model), "int", 1)
  Loop, % __aglLoad("model" model "_materials")
    aglDeleteMaterial(__aglLoad("model" model "_material" A_Index))
  __aglLoad("model" model, 0)
  return 1
}




aglLoadMaterial(filename, mat, loadtextures=1)
{
  if (!FileExist(filename))
    return 0
  if ((warnings := __aglLoad("warnings"))="")
    warnings := 0
  ptr := (A_PtrSize) ? "ptr" : "uint"
  workingdir := (p := instr(filename, "\", 0, 0)) ? substr(filename, 1, p) : ""
  inmtl := 0
  texi := 0
  Loop, read, % filename
  {
    lm := A_LoopReadLine
    StringReplace, lm, lm, % "`t", % " ", 1
    while (instr(lm, "  "))
      StringReplace, lm, lm, % "  ", % " ", 1
    StringSplit, lm, lm, % " "
    if ((lm1 = "newmtl") && (inmtl))
      break
    else if ((lm1 = "newmtl") && (lm2 = mat) && (!inmtl))
      inmtl := 1
    else if (inmtl)
    {
      if ((lm1 = "map_Kd") && (loadtextures))
      {
        if (lm2 = "(null)")
          continue
        texi++
        tex_%texi%_name := lm2
        if (!(tex_%texi% := aglLoadTexImage2D(0x0DE1, workingdir lm2)))
        {
          texi--
          if (warnings=1)
          {
            MsgBox, 16, Error, Texture "%lm2%", defined in "%filename%",  can't be loaded from "%mat%"!
            return 0
          }
          if (warnings=0)
            return 0
        }
      }
    }
  }
  if (!inmtl)
    return 0
  inmtl := 0
  VarSetCapacity(params, 16, 0)
  list := DllCall("opengl32\glGenLists", "int", 1, "uint")
  DllCall("opengl32\glNewList", "uint", list, "uint", 0x1300) ;GL_COMPILE
  lighting := texture_2d := 0
  Loop, read, % filename
  {
    lm := A_LoopReadLine
    StringReplace, lm, lm, % "`t", % " ", 1
    while (instr(lm, "  "))
      StringReplace, lm, lm, % "  ", % " ", 1
    StringSplit, lm, lm, % " "
    if ((lm1 = "newmtl") && (inmtl))
      break
    else if ((lm1 = "newmtl") && (lm2 = mat) && (!inmtl))
      inmtl := 1
    else if (inmtl)
    {
      if ((lm1 = "Ka") && (lm2 != "spectral") && (lm2 != "xyz"))
      {
        NumPut(lm2, params, 0, "float") ;material ambient red
        NumPut(lm3, params, 4, "float") ;material ambient green
        NumPut(lm4, params, 8, "float") ;material ambient blue
        DllCall("opengl32\glMaterialfv", "uint", 0x0408, "uint", 0x1200, ptr, &params)
        lighting := 1
      }
      else if ((lm1 = "Kd") && (lm2 != "spectral") && (lm2 != "xyz"))
      {
        NumPut(lm2, params, 0, "float") ;material diffuse red
        NumPut(lm3, params, 4, "float") ;material diffuse green
        NumPut(lm4, params, 8, "float") ;material diffuse blue
        DllCall("opengl32\glMaterialfv", "uint", 0x0408, "uint", 0x1201, ptr, &params)
        lighting := 1
      }
      else if ((lm1 = "Ks") && (lm2 != "spectral") && (lm2 != "xyz"))
      {
        NumPut(lm2, params, 0, "float") ;material specular red
        NumPut(lm3, params, 4, "float") ;material specular green
        NumPut(lm4, params, 8, "float") ;material specular blue
        DllCall("opengl32\glMaterialfv", "uint", 0x0408, "uint", 0x1202, ptr, &params)
        lighting := 1
      }
      else if ((lm1 = "map_Kd") && (loadtextures))
      {
        Loop, % texi
        {
          if (tex_%A_Index%_name = lm2)
          {
            DllCall("opengl32\glBindTexture", "uint", 0x0DE1, "uint", tex_%A_Index%)
            texture_2d := 1
            break
          }
        }
      }
    }
  }
  if (loadtextures)
    DllCall("opengl32\gl" ((texture_2d) ? "Enable" : "Disable"), "uint", 0x0DE1) ;GL_TEXTURE_2D
  DllCall("opengl32\gl" ((lighting) ? "Enable" : "Disable"), "uint", 0x0B50) ;GL_LIGHTING
  DllCall("opengl32\glEndList") ;GL_COMPILE

  if (!(nmaterials := __aglLoad("nmaterials")))
    nmaterials := 0
  nmaterials ++
  __aglLoad("nmaterials", nmaterials)
  __aglLoad("material" nmaterials, list)
  Loop, % __aglLoad("material" nmaterials "_textures", texi)
    __aglLoad("material" nmaterials "_texture" A_Index, tex_%A_Index%)
  return nmaterials
}

aglCallMaterial(material)
{
  DllCall("opengl32\glCallList", "uint", list := __aglLoad("material" material))
  return list
}

aglDeleteMaterial(material)
{
  DllCall("opengl32\glDeleteList", "uint", __aglLoad("material" material), "int", 1)
  Loop, % __aglLoad("material" material "_textures")
    aglDeleteTexture(__aglLoad("material" material "_texture" A_Index))
  __aglLoad("material" material, 0)
}



aglBlur(level=2)
{
  static
  ptr := (A_PtrSize) ? "ptr" : "uint"
  astr := (A_IsUnicode) ? "astr" : "str"
  if (!init)
  {
    if ((aglGetVersion() < 2.1) && (!aglIsExt("GL_ARB_texture_non_power_of_two")))
      return 0
    shader =
    (Join`n ltrim
      #AGL_VERTEX_SHADER
      void main()
      {
        gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
      }
      #AGL_FRAGMENT_SHADER
      uniform sampler2D texture;
      uniform vec2 shift;
      uniform float level;
      void main()
      {
	    vec3 color = vec3(texture2D(texture, vec2(gl_TexCoord[0]))) * (1.0 - level);
        color += vec3(texture2D(texture, vec2(gl_TexCoord[0].x + shift.x, gl_TexCoord[0].y))) * (level / 4.0);
        color += vec3(texture2D(texture, vec2(gl_TexCoord[0].x - shift.x, gl_TexCoord[0].y))) * (level / 4.0);
        color += vec3(texture2D(texture, vec2(gl_TexCoord[0].x, gl_TexCoord[0].y + shift.y))) * (level / 4.0);
        color += vec3(texture2D(texture, vec2(gl_TexCoord[0].x, gl_TexCoord[0].y - shift.y))) * (level / 4.0);
        gl_FragColor = vec4(color, 1.0);
      }
    )
    if (!(prog := aglLoadProgram(shader, log)))
      return 0
    tex := aglGenTexture()
    texture_loc := DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "texture", "int")
    shift_loc := DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "shift", "int")
    level_loc := DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "level", "int")
    list := DllCall("opengl32\glGenLists", "int", 2, "uint")
    DllCall("opengl32\glNewList", "uint", list, "uint", 0x1300) ;GL_COMPILE
    DllCall("opengl32\glMatrixMode", "uint", 0x1701) ;GL_PROJECTION
    DllCall("opengl32\glLoadIdentity")
    DllCall("opengl32\glOrtho", "double", -1, "double", 1, "double", -1, "double", 1, "double", -1, "double", 1)
    DllCall("opengl32\glMatrixMode", "uint", 0x1700) ;GL_MODELVIEW
    DllCall("opengl32\glLoadIdentity")
    DllCall("opengl32\glEndList")

    DllCall("opengl32\glNewList", "uint", list+1, "uint", 0x1300) ;GL_COMPILE
    DllCall("opengl32\glBegin", "uint", 0x0007) ;GL_QUADS
    DllCall("opengl32\glTexCoord2f", "float", 0, "float", 0)  DllCall("opengl32\glVertex2f", "float", -1, "float", -1)
    DllCall("opengl32\glTexCoord2f", "float", 1, "float", 0)  DllCall("opengl32\glVertex2f", "float", 1, "float", -1)
    DllCall("opengl32\glTexCoord2f", "float", 1, "float", 1)  DllCall("opengl32\glVertex2f", "float", 1, "float", 1)
    DllCall("opengl32\glTexCoord2f", "float", 0, "float", 1)  DllCall("opengl32\glVertex2f", "float", -1, "float", 1)
    DllCall("opengl32\glEnd")
    DllCall("opengl32\glPopMatrix")
    DllCall("opengl32\glEndList")
    init := 1
  }
  VarSetCapacity(viewport, 16, 0)
  DllCall("opengl32\glGetIntegerv", "uint", 0x0BA2, ptr, &viewport)
  w := NumGet(viewport, 8, "int")
  h := NumGet(viewport, 12, "int")
  DllCall("opengl32\glPushMatrix")
  DllCall("opengl32\glCallList", "uint", list)
  Loop, % level
  {
    aglRenderToTexture(tex, 0, 0, w, h)
    DllCall("opengl32\glUseProgram", "uint", prog)
    DllCall("opengl32\glUniform2f", "int", DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "shift", "int"), "float", 1/w, "float", 1/h)
    DllCall("opengl32\glUniform1f", "int", DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "level", "int"), "float", 0.60)
    DllCall("opengl32\glUniform1i", "int", DllCall("opengl32\glGetUniformLocation", "uint", prog, astr, "texture", "int"), "int", 0)
    DllCall("opengl32\glCallList", "uint", list+1)
    DllCall("opengl32\glUseProgram", "uint", 0)
  }
  DllCall("opengl32\glPopMatrix")
  return 1
}




aglLoadProgram(shader, byref log="")
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4
  astr := (A_IsUnicode) ? "astr" : "str"
  StrPut := "StrPut"
  log := ""

  if ((!instr(shader, "`n")) && (fileexist(shader)))
    FileRead, shader, % shader

  log := "Create program`n----------`n"
  if ((!(program := DllCall(proc := DllCall("opengl32\wglGetProcAddress", astr, "glCreateProgram", ptr), "uint"))) || (!proc))
  {
    log .= "Failed!"
    return 0
  }
  else
    log .= "Success (program handle: " program ")`n`n`n"

  nvert := nfrag := ngeom := 0
  while (shader)
  {
    next := ""
    p := strlen(shader)
    if (pvert := instr(shader, "#AGL_VERTEX_SHADER"))
    {
      next := "vert"
      p := pvert
    }
    if ((pfrag := instr(shader, "#AGL_FRAGMENT_SHADER")) && (pfrag < p))
    {
      next := "frag"
      p := pfrag
    }
    if ((pgeom := instr(shader, "#AGL_GEOMETRY_SHADER")) && (pgeom < p))
    {
      next := "geom"
      p := pgeom
    }
    if (!next)
      break
    else if (next = "vert")
      shader := substr(shader, p + strlen("#AGL_VERTEX_SHADER"))
    else if (next = "frag")
      shader := substr(shader, p + strlen("#AGL_FRAGMENT_SHADER"))
    else if (next = "geom")
      shader := substr(shader, p + strlen("#AGL_GEOMETRY_SHADER"))
    else
      break
    p := strlen(shader)+1
    if (pvert := instr(shader, "#AGL_VERTEX_SHADER"))
      p := pvert
    if ((pfrag := instr(shader, "#AGL_FRAGMENT_SHADER")) && (pfrag < p))
      p := pfrag
    if ((pgeom := instr(shader, "#AGL_GEOMETRY_SHADER")) && (pgeom < p))
      p := pgeom
    n%next% ++
    n := n%next%
    %next%_src%n% := substr(shader, 1, p-1)
    shader := substr(shader, p)
  }
  if ((nvert=0) && (nfrag=0) && (ngeom=0))
  {
    log .= "Parse shaders (agl.ahk)`n----------`nNo shaders found!"
    return 0
  }
  else
  {
    log .= "Parse shaders (agl.ahk)`n----------`n" (nvert+nfrag+ngeom) " shader" ((nvert+nfrag+ngeom > 1) ? "s" : "") " found...`n"
    log .= " - " nvert " vertex shader" ((nvert != 1) ? "s" : "") "`n"
    log .= " - " nfrag " fragment shader" ((nfrag != 1) ? "s" : "") "`n"
    log .= " - " ngeom " geometry shader" ((ngeom != 1) ? "s" : "") "`n`n`n"
  }
  if (nvert > 0)
  {
    log .= "Compile vertex shader(s)`n----------`n"
    if (!(shader := DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCreateShader", ptr), "uint", 0x8B31, "uint"))) ;GL_VERTEX_SHADER
    {
      log .= "Failed!"
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    VarSetCapacity(sources, sptr*nvert, 0)
    Loop, % nvert
    {
      if (A_IsUnicode)
      {
        VarSetCapacity(bsrc%A_Index%, strlen(vert_src%A_Index%)+1, 0)
        %StrPut%(vert_src%A_Index%, &bsrc%A_Index%, strlen(vert_src%A_Index%), "cp0")
        NumPut(&bsrc%A_Index%, sources, (A_Index-1)*sptr, ptr)
      }
      else
        NumPut(&vert_src%A_Index%, sources, (A_Index-1)*sptr, ptr)
    }
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glShaderSource", ptr), "uint", shader, "int", nvert, ptr, &sources, ptr, 0)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCompileShader", ptr), "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetShaderiv", ptr), "uint", shader, "uint", 0x8B81, "int*", status) ;GL_COMPILE_STATUS
    if (!status)
    {
      log .= (!(shaderlog := aglGetShaderInfoLog(shader))) ? "Failed!" : shaderlog
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    log .= ((!(shaderlog := aglGetShaderInfoLog(shader))) ? "Success" : shaderlog) "`n`n`n"
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glAttachShader", ptr), "uint", program, "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
  }
  if (nfrag > 0)
  {
    log .= "Compile fragment shader(s)`n----------`n"
    if (!(shader := DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCreateShader", ptr), "uint", 0x8B30, "uint"))) ;GL_FRAGMENT_SHADER
    {
      log .= "Failed!"
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    VarSetCapacity(sources, sptr*nfrag, 0)
    Loop, % nfrag
    {
      if (A_IsUnicode)
      {
        VarSetCapacity(bsrc%A_Index%, strlen(frag_src%A_Index%)+1, 0)
        %StrPut%(frag_src%A_Index%, &bsrc%A_Index%, strlen(frag_src%A_Index%), "cp0")
        NumPut(&bsrc%A_Index%, sources, (A_Index-1)*sptr, ptr)
      }
      else
        NumPut(&frag_src%A_Index%, sources, (A_Index-1)*sptr, ptr)
    }
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glShaderSource", ptr), "uint", shader, "int", nfrag, ptr, &sources, ptr, 0)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCompileShader", ptr), "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetShaderiv", ptr), "uint", shader, "uint", 0x8B81, "int*", status) ;GL_COMPILE_STATUS
    if (!status)
    {
      log .= (!(shaderlog := aglGetShaderInfoLog(shader))) ? "Failed!" : shaderlog
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    log .= ((!(shaderlog := aglGetShaderInfoLog(shader))) ? "Success" : shaderlog) "`n`n`n"
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glAttachShader", ptr), "uint", program, "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
  }
  if (ngeom > 0)
  {
    log .= "Compile geometry shader(s)`n----------`n"
    if (!(shader := DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCreateShader", ptr), "uint", 0x8DD9, "uint"))) ;GL_GEOMETRY_SHADER
    {
      log .= "Failed!"
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    VarSetCapacity(sources, sptr*ngeom, 0)
    Loop, % ngeom
    {
      if (A_IsUnicode)
      {
        VarSetCapacity(bsrc%A_Index%, strlen(geom_src%A_Index%)+1, 0)
        %StrPut%(geom_src%A_Index%, &bsrc%A_Index%, strlen(geom_src%A_Index%), "cp0")
        NumPut(&bsrc%A_Index%, sources, (A_Index-1)*sptr, ptr)
      }
      else
        NumPut(&geom_src%A_Index%, sources, (A_Index-1)*sptr, ptr)
    }
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glShaderSource", ptr), "uint", shader, "int", ngeom, ptr, &sources, ptr, 0)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glCompileShader", ptr), "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetShaderiv", ptr), "uint", shader, "uint", 0x8B81, "int*", status) ;GL_COMPILE_STATUS
    if (!status)
    {
      log .= (!(shaderlog := aglGetShaderInfoLog(shader))) ? "Failed!" : shaderlog
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
      DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
      return 0
    }
    log .= ((!(shaderlog := aglGetShaderInfoLog(shader))) ? "Success" : shaderlog) "`n`n`n"
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glAttachShader", ptr), "uint", program, "uint", shader)
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteShader", ptr), "uint", shader)
  }
  log .= "Link program`n----------`n"
  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glLinkProgram", ptr), "uint", program)
  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetProgramiv", ptr), "uint", program, "uint", 0x8B82, "int*", status) ;GL_LINK_STATUS
  if (!status)
  {
    log .= (!(programlog := aglGetProgramInfoLog(program))) ? "Failed!" : programlog
    return 0
  }
  log .= (!(programlog := aglGetProgramInfoLog(program))) ? "Success" : programlog
  return program


  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glLinkProgram", ptr), "uint", program)
  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetProgramiv", ptr), "uint", fragment, "uint", 0x8B82, "int*", status) ;GL_LINK_STATUS
  if (programlog := aglGetProgramInfoLog(program))
    log .= "Linking program:`n----------`n" programlog "`n`n"
  if (!status)
  {
    DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glDeleteProgram", ptr), "uint", program)
    return 0
  }
  return program
}

aglShaderSource(shader, source)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4
  astr := (A_IsUnicode) ? "astr" : "str"

  VarSetCapacity(shaders, sptr, 0)
  if (A_IsUnicode)
  {
    StrPut := "StrPut"
    VarSetCapacity(bshader, strlen(source)+1, 0)
    %StrPut%(source, &bshader, strlen(source), "cp0")
    NumPut(&bshader, shaders, 0, ptr)
  }
  else
    NumPut(&source, shaders, 0, ptr)
  DllCall(proc := DllCall("opengl32\wglGetProcAddress", astr, "glShaderSource", ptr), "uint", shader, "int", 1, ptr, &shaders, ptr, 0)
  return (proc) ? 1 : 0
}

aglGetShaderInfoLog(shader)
{
  astr := (A_IsUnicode) ? "astr" : "str"
  ptr := (A_PtrSize) ? "ptr" : "uint"

  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetShaderiv", ptr), "uint", shader, "uint", 0x8B84, "int*", loglength)
  VarSetCapacity(log, loglength+1, 0)
  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetShaderInfoLog", ptr), "uint", shader, "int", loglength+1, "int", 0, ptr, &log)
  if (IsFunc(StrGet := "StrGet"))
    return %StrGet%(&log, "cp0")
  Loop, % loglength
    infolog .= chr(NumGet(log, A_Index-1, "uchar"))
  return infolog
}

aglGetProgramInfoLog(program)
{
  astr := (A_IsUnicode) ? "astr" : "str"
  ptr := (A_PtrSize) ? "ptr" : "uint"

  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetProgramiv", ptr), "uint", program, "uint", 0x8B84, "int*", loglength)
  VarSetCapacity(log, loglength+1, 0)
  DllCall(DllCall("opengl32\wglGetProcAddress", astr, "glGetProgramInfoLog", ptr), "uint", program, "int", loglength+1, "int", 0, ptr, &log)
  if (IsFunc(StrGet := "StrGet"))
    return %StrGet%(&log, "cp0")
  Loop, % loglength
    infolog .= chr(NumGet(log, A_Index-1, "uchar"))
  return infolog
}






;The following functions are used intern.

__aglLoadTextureGdi(filename)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (hBitmap := DllCall("LoadImage", ptr, 0, "str", filename, "uint", 0, "int", 0, "int", 0, "uint", 0x10))
    return hBitmap
  return 0
}

__aglLoadTextureTga(filename)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  if (!(hFile := DllCall("CreateFile", "str", filename, "uint", 0x80000000, "uint", 1, ptr, 0, "uint", 3, "uint", 0, ptr, 0, ptr)))
    return 0
  size := DllCall("GetFileSize", ptr, hFile, ptr, 0, "uint")
  if (size > 4096*4096*4 + 300)
    return 0

  VarSetCapacity(file, size, 0)
  if ((!DllCall("ReadFile", ptr, hFile, ptr, &file, "uint", size, "uint*", read, ptr, 0)) || (read < size))
  {
    DllCall("CloseHandle", ptr, hFile)
    return 0
  }
  DllCall("CloseHandle", ptr, hFile)

  identicationlength := NumGet(file, 0, "uchar")
  colormaptype := NumGet(file, 1, "uchar")
  imagetype := NumGet(file, 2, "uchar")
  colormaporign := NumGet(file, 3, "ushort")
  colormaplength := NumGet(file, 5, "ushort")
  colormapentrysize := NumGet(file, 7, "uchar")
  xorign := NumGet(file, 8, "ushort")
  yorign := NumGet(file, 10, "ushort")
  w := NumGet(file, 12, "ushort")
  h := NumGet(file, 14, "ushort")
  bitcount := NumGet(file, 16, "uchar")
  imagedescriptor := NumGet(file, 17, "uchar")
  numattrib := imagedescriptor & 0xF
  screenorign := imagedescriptor & 0x20
  interleaving := (imagedescriptor & 0xC0) >> 6

  identication := &file + 18
  colormap := identication + identicationlength
  imagedata := colormap + (colormaplength * colormapentrysize)
  imagedatalength := size - (18 + identicationlength + (colormaplength * colormapentrysize))

  if imagetype not in 1,2,3,9,10,11,32,33 ;all types
    return 0

  ;0  -  No image data included.
  ;1  -  Uncompressed, color-mapped images.
  ;2  -  Uncompressed, RGB images.
  ;3  -  Uncompressed, black and white images.
  ;9  -  Runlength encoded color-mapped images.
  ;10  -  Runlength encoded RGB images.
  ;11  -  Compressed, black and white images.
  ;32  -  Compressed color-mapped data, using Huffman, Delta, and runlength encoding.
  ;33  -  Compressed color-mapped data, using Huffman, Delta, and runlength encoding.  4-pass quadtree-type process.

  if imagetype not in 2,3 ;currently supportet types
    return 0

  VarSetCapacity(bmi, 40, 0)
  NumPut(40, bmi, 0, "int")
  NumPut(w, bmi, 4, "int")
  NumPut((screenorign) ? -h : h, bmi, 8, "int")
  NumPut(1, bmi, 12, "ushort")
  if imagetype in 1,9,32
    NumPut(bpp := colormapentrysize, bmi, 14, "ushort")
  else
    NumPut(bpp := bitcount, bmi, 14, "ushort")
  if imagetype in 9,10
    NumPut(2, bmi, 16, "uint")

  datasize := w*h*Round(bpp/8)
  if (imagedatalength > datasize)
    imagedatalength := datasize

  hDC := DllCall("GetDC", ptr, 0, ptr)
  hDCbm := DllCall("CreateCompatibleDC", ptr, hDC, ptr)
  DllCall("ReleaseDC", ptr, hDC)
  if (hBitmap := DllCall("CreateDIBSection", ptr, hDCbm, ptr, &bmi, "uint", 0, ptr "*", bits, ptr, 0, ptr))
      DllCall("RtlMoveMemory", ptr, bits, ptr, imagedata, "uint", imagedatalength)
  DllCall("DeleteDC", ptr, hDCbm)
  return hBitmap
}

__aglLoadTextureGdip(filename)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4
  astr := (A_IsUnicode) ? "astr" : "str"

  if (!DllCall("GetModuleHandle", "str", "gdiplus", ptr))
  {
    if (!(hGdip := DllCall("LoadLibrary", "str", "gdiplus", ptr)))
      return 0
  }
  VarSetCapacity(token, sptr, 0)
  VarSetCapacity(input, 12+sptr, 0)
  NumPut(1, input, 0, "uint")
  DllCall("gdiplus\GdiplusStartup", ptr, &token, ptr, &input, ptr, 0)

  VarSetCapacity(wfilename, wfilenamesize := (strlen(filename)*2+2), 0)
  DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, astr, filename, "int", -1, ptr, &wfilename, "int", wfilenamesize)

  DllCall("gdiplus\GdipCreateBitmapFromFile", ptr, &wfilename, ptr "*", bitmap)
  DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", ptr, bitmap, ptr "*", hBitmap, "uint", 0xFF000000)
  DllCall("gdiplus\GdipDisposeImage", ptr, bitmap)

  DllCall("gdiplus\GdiplusShutdown", ptr, &token)
  if (hGdip)
    DllCall("FreeLibrary", ptr, hGdip)
  return hBitmap
}

__aglTextureBitmap(filename, resize, byref w, byref h, byref format, byref type, byref data)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4

  if (!fileexist(filename))
    return 0

  if (!(hBitmap := __aglLoadTextureGdip(filename)))
  {
    if (!(hBitmap := __aglLoadTextureGdi(filename)))
      hBitmap := __aglLoadTextureTga(filename)
  }
  if (!hBitmap)
    return 0

  size := DllCall("GetObject", ptr, hBitmap, "int", 0, ptr, 0)
  VarSetCapacity(bmi, size, 0)
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")
  bpp := NumGet(bmi, 14+sptr, "short")

  if (resize)
  {
    __aglCalcTexSize(w, h, neww, newh)
    if ((neww != w) || (newh != h))
    {
      if (!__aglResizeTexture(hBitmap, neww, newh))
      {
        DllCall("DeleteObject", ptr, hBitmap)
        return 0
      }
    }
  }
  bmformat := "BGR"
  if ((aglGetVersion() < 1.2) || (!resize))
  {
    if (__aglRecolorTexture(hBitmap))
      bmformat := "RGB"
  }
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")
  bpp := NumGet(bmi, 14+sptr, "short")
  data := NumGet(bmi, 16+sptr, ptr)
  
  if (bpp=32)
  {
    format := (bmformat="RGB") ? 0x1908 : 0x80E1 ;GL_RGBA : GL_BGRA_EXT
    type := 0x1401 ;GL_UNSIGNED_BYTE
    if (data)
      return 1
  }
  else if (bpp=24)
  {
    format := (bmformat="RGB") ? 0x1907 : 0x80E0 ;GL_RGB : GL_BGR_EXT
    type := 0x1401 ;GL_UNSIGNED_BYTE
    if (data)
      return 1
  }
  
  if (!__aglChangeTextureColorDepth(hBitmap))
  {
    DllCall("DeleteObject", ptr, hBitmap)
    return 0
  }
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")
  bpp := NumGet(bmi, 14+sptr, "short")
  data := NumGet(bmi, 16+sptr, ptr)
  format := (bmformat="RGB") ? 0x1908 : 0x80E1 ;GL_RGBA : GL_BGRA_EXT
  type := 0x1401 ;GL_UNSIGNED_BYTE
  return 1
}

__aglChangeTextureColorDepth(byref hBitmap)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"

  size := DllCall("GetObject", ptr, hBitmap, "int", 0, ptr, 0)
  VarSetCapacity(bmi, size, 0)
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")

  hDC := DllCall("GetDC", ptr, 0, ptr)
  hDCsrc := DllCall("CreateCompatibleDC", ptr, hDC, ptr)
  hDCdst := DllCall("CreateCompatibleDC", ptr, hDC, ptr)
  DllCall("ReleaseDC", ptr, hDC)
  DllCall("SelectObject", ptr, hDCsrc, ptr, hBitmap)

  VarSetCapacity(bmi, 40, 0)
  NumPut(40, bmi, 0, "uint")
  NumPut(w, bmi, 4, "int")
  NumPut(h, bmi, 8, "int")
  NumPut(1, bmi, 12, "ushort")
  NumPut(32, bmi, 14, "ushort")

  hBitmapDst := DllCall("CreateDIBSection", ptr, hDCdst, ptr, &bmi, "uint", 0, ptr, 0, ptr, 0, ptr)
  DllCall("SelectObject", ptr, hDCdst, ptr, hBitmapDst)
  DllCall("BitBlt", ptr, hDCdst, "int", 0, "int", 0, "int", w, "int", h, ptr, hDCsrc, "int", 0, "int", 0, "uint", 0x00CC0020)
  DllCall("DeleteDC", ptr, hDCsrc)
  DllCall("DeleteDC", ptr, hDCdst)
  DllCall("DeleteObject", ptr, hBitmap)
  hBitmap := hBitmapDst
  return 1
}

__aglResizeTexture(byref hBitmap, neww, newh)
{
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4

  size := DllCall("GetObject", ptr, hBitmap, "int", 0, ptr, 0)
  VarSetCapacity(bmi, size, 0)
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")

  if (!DllCall("GetModuleHandle", "str", "gdiplus", ptr))
  {
    if (!(hGdip := DllCall("LoadLibrary", "str", "gdiplus", ptr)))
      nogdip := 1
  }
  if (!nogdip)
  {
    VarSetCapacity(token, sptr, 0)
    VarSetCapacity(input, 12+sptr, 0)
    NumPut(1, input, 0, "uint")
    DllCall("gdiplus\GdiplusStartup", ptr, &token, ptr, &input, ptr, 0)

    DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", ptr, hBitmap, "int", 0, ptr "*", srcbitmap)
    DllCall("DeleteObject", ptr, hBitmap)
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", neww, "int", newh, "int", 0, "int", 0x26200A, ptr, 0, ptr "*", dstbitmap)
    DllCall("gdiplus\GdipGetImageGraphicsContext", ptr, dstbitmap, ptr "*", dstgraphic)
    DllCall("gdiplus\GdipCreateImageAttributes", ptr "*", attrib)

    DllCall("gdiplus\GdipSetImageAttributesColorMatrix", ptr, attrib, "int", 1, "int", 1, ptr, 0, "int", 0, "int", 0)
    DllCall("gdiplus\GdipSetInterpolationMode", ptr, dstgraphic, "int", 3)
    DllCall("gdiplus\GdipDrawImageRectRectI", ptr, dstgraphic, ptr, srcbitmap, "int", 0, "int", 0, "int", neww, "int", newh, "int", 0, "int", 0, "int", w, "int", h, "int", 2, ptr, attrib, ptr, 0, ptr, 0)

    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", ptr, dstbitmap, ptr "*", hBitmap, "uint", 0xFF000000)
    DllCall("gdiplus\GdipDeleteGraphics", ptr, dstgraphic)
    DllCall("gdiplus\GdipDisposeImage", ptr, srcbitmap)
    DllCall("gdiplus\GdipDisposeImage", ptr, dstbitmap)
    DllCall("gdiplus\GdipDisposeImageAttributes", ptr, attrib)

    DllCall("gdiplus\GdiplusShutdown", ptr, &token)
    if (hGdip)
      DllCall("FreeLibrary", ptr, hGdip)
    return 1
  }

  hDC := DllCall("GetDC", ptr, 0, ptr)
  hDCsrc := DllCall("CreateCompatibleDC", ptr, hDC, ptr)
  hDCdst := DllCall("CreateCompatibleDC", ptr, hDC, ptr)
  DllCall("ReleaseDC", ptr, hDC)
  DllCall("SelectObject", ptr, hDCsrc, ptr, hBitmap)

  VarSetCapacity(bmi, 40, 0)
  NumPut(40, bmi, 0, "uint")
  NumPut(neww, bmi, 4, "int")
  NumPut(newh, bmi, 8, "int")
  NumPut(1, bmi, 12, "ushort")
  NumPut(32, bmi, 14, "ushort")

  hBitmapDst := DllCall("CreateDIBSection", ptr, hDCdst, ptr, &bmi, "uint", 0, ptr, 0, ptr, 0, ptr)
  DllCall("SelectObject", ptr, hDCdst, ptr, hBitmapDst)
  DllCall("SetStretchBltMode", ptr, hDCdst, "int", 4)
  DllCall("SetBrushOrgEx", ptr, hDCdst, "int", 2, "int", 2, ptr, 0)
  DllCall("StretchBlt", ptr, hDCdst, "int", 0, "int", 0, "int", neww, "int", newh, ptr, hDCsrc, "int", 0, "int", 0, "int", w, "int", h, "uint", 0x00CC0020)
  DllCall("DeleteDC", ptr, hDCsrc)
  DllCall("DeleteDC", ptr, hDCdst)
  DllCall("DeleteObject", ptr, hBitmap)
  hBitmap := hBitmapDst
  return 1
}

__aglRecolorTexture(byref hBitmap)
{
  static matrixstr := "0|0|1|0|0|0|1|0|0|0|1|0|0|0|0|0|0|0|1|0|0|0|0|0|1"
  ptr := (A_PtrSize) ? "ptr" : "uint"
  sptr := (A_PtrSize) ? A_PtrSize : 4

  size := DllCall("GetObject", ptr, hBitmap, "int", 0, ptr, 0)
  VarSetCapacity(bmi, size, 0)
  DllCall("GetObject", ptr, hBitmap, "int", size, ptr, &bmi)
  w := NumGet(bmi, 4, "int")
  h := NumGet(bmi, 8, "int")

  if (!DllCall("GetModuleHandle", "str", "gdiplus", ptr))
  {
    if (!(hGdip := DllCall("LoadLibrary", "str", "gdiplus", ptr)))
      nogdip := 1
  }
  if (!nogdip)
  {
    VarSetCapacity(token, sptr, 0)
    VarSetCapacity(input, 12+sptr, 0)
    NumPut(1, input, 0, "uint")
    DllCall("gdiplus\GdiplusStartup", ptr, &token, ptr, &input, ptr, 0)

    DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", ptr, hBitmap, "int", 0, ptr "*", srcbitmap)
    DllCall("DeleteObject", ptr, hBitmap)
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", w, "int", h, "int", 0, "int", 0x26200A, ptr, 0, ptr "*", dstbitmap)
    DllCall("gdiplus\GdipGetImageGraphicsContext", ptr, dstbitmap, ptr "*", dstgraphic)
    DllCall("gdiplus\GdipCreateImageAttributes", ptr "*", attrib)

    VarSetCapacity(matrix, 100, 0)
    Loop, parse, matrixstr, |
      NumPut(A_LoopField, matrix, (A_Index-1)*4, "float")
    DllCall("gdiplus\GdipSetImageAttributesColorMatrix", ptr, attrib, "int", 1, "int", 1, ptr, &matrix, "int", 0, "int", 0)
    DllCall("gdiplus\GdipDrawImageRectRectI", ptr, dstgraphic, ptr, srcbitmap, "int", 0, "int", 0, "int", w, "int", h, "int", 0, "int", 0, "int", w, "int", h, "int", 2, ptr, attrib, ptr, 0, ptr, 0)

    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", ptr, dstbitmap, ptr "*", hBitmap, "uint", 0xFF000000)
    DllCall("gdiplus\GdipDeleteGraphics", ptr, dstgraphic)
    DllCall("gdiplus\GdipDisposeImage", ptr, srcbitmap)
    DllCall("gdiplus\GdipDisposeImage", ptr, dstbitmap)
    DllCall("gdiplus\GdipDisposeImageAttributes", ptr, attrib)

    DllCall("gdiplus\GdiplusShutdown", ptr, &token)
    if (hGdip)
      DllCall("FreeLibrary", ptr, hGdip)
    return 1
  }
  return 0
}

__aglCalcTexSize(w, h, byref neww, byref newh)
{
  maxsize := aglGetInteger(0x0D33) ;GL_MAX_TEXTURE_SIZE
  if ((w > maxsize) || (h > maxsize) || ((aglGetVersion() < 2.1) && (!aglIsExt("GL_ARB_texture_non_power_of_two"))))
  {
    sizes := 0
    Loop
    {
      if ((2**(A_Index-1)) > maxsize)
        break
      sizes ++
    }
    Loop, % sizes-1
    {
      if ((2**(A_Index-1))>=w)
        break
      neww := (2**A_Index)
    }
    Loop, % sizes-1
    {
      if ((2**(A_Index-1))>=h)
        break
      newh := (2**A_Index)
    }
    return 1
  }
  neww := w
  newh := h
  return 1
}

__aglLoad(var, val="__?")
{
  static
  if (val="__?")
    return _%var%
  return (_%var% := val)
}
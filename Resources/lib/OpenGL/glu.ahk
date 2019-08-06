; AutoHotkey header file for OpenGL utilities.
; glu.ahk last updated Date: 2011-03-08 (Tuesday, 08 Mar 2011)
; Converted by: Bentschi (bentschi1337@yahoo.de)

;=============================================================

/*
** Copyright 1991-1993, Silicon Graphics, Inc.
** All Rights Reserved.
** 
** This is UNPUBLISHED PROPRIETARY SOURCE CODE of Silicon Graphics, Inc.;
** the contents of this file may not be disclosed to third parties, copied or
** duplicated in any form, in whole or in part, without the prior written
** permission of Silicon Graphics, Inc.
** 
** RESTRICTED RIGHTS LEGEND:
** Use, duplication or disclosure by the Government is subject to restrictions
** as set forth in subdivision (c)(1)(ii) of the Rights in Technical Data
** and Computer Software clause at DFARS 252.227-7013, and/or in similar or
** successor clauses in the FAR, DOD or NASA FAR Supplement. Unpublished -
** rights reserved under the Copyright Laws of the United States.
*/

;=============================================================

GLptr := (A_PtrSize) ? "ptr" : "uint" ;AutoHotkey definition
GLastr := (A_IsUnicode) ? "astr" : "str" ;AutoHotkey definition

/*
** Return the error string associated with a particular error code.
** This will return 0 for an invalid error code.
**
** The generic function prototype that can be compiled for ANSI or Unicode
** is defined as follows:
**
** LPCTSTR APIENTRY gluErrorStringWIN (GLenum errCode);
*/

gluErrorStringWIN(errCode)
{
  if (A_IsUnicode)
    return gluErrorUnicodeStringEXT(errCode)
  else
    return gluErrorString(errCode)
}

gluErrorString(errCode)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, errCode, GLastr)
}

gluErrorUnicodeStringEXT(errCode)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, errCode, "wstr")
}

gluGetString(name)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, name, GLastr)
}

gluOrtho2D(left, right, bottom, top)
{
  global
  DllCall("glu32\" A_ThisFunc, GLdouble, left, GLdouble, right, GLdouble, bottom, GLdouble, top)
}

gluPerspective(fovy, aspect, zNear, zFar)
{
  global
  DllCall("glu32\" A_ThisFunc, GLdouble, fovy, GLdouble, aspect, GLdouble, zNear, GLdouble, zFar)
}

gluPickMatrix(x, y, width, height, viewport)
{
  global
  DllCall("glu32\" A_ThisFunc, GLdouble, x, GLdouble, y, GLdouble, width, GLdouble, height, GLptr viewport)
}

gluLookAt(eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz)
{
  global
  DllCall("glu32\" A_ThisFunc, GLdouble, eyex, GLdouble, eyey, GLdouble, eyez, GLdouble, centerx, GLdouble, centery, GLdouble, centerz, GLdouble, upx, GLdouble, upy, GLdouble, upz)
}

gluProject(objx, objy, objz, modelMatrix, projMatrix, viewport, byref winx, byref winy, byref winz)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLdouble, objx, GLdouble, objy, GLdouble, objz, GLptr, modelMatrix, GLptr, projMatrix, GLptr, viewport, GLdouble "*", winx, GLdouble "*", winy, GLdouble "*", winz, "int")
}

gluUnProject(winx, winy, winz, modelMatrix, projMatrix, viewport, byref objx, byref objy, byref objz)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLdouble, winx, GLdouble, winy, GLdouble, winz, GLptr, modelMatrix, GLptr, projMatrix, GLptr, viewport, GLdouble "*", objx, GLdouble "*", objy, GLdouble "*", objz, "int")
}

gluScaleImage(format, widthin, heightin, typein, datain, widthout, heightout, typeout, dataout)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, format, GLint, widthin, GLint, heightin, GLenum, typein, GLptr, datain, GLint, widthout, GLint, heightout, GLenum, typeout, GLptr, dataout, "int")
}

gluBuild1DMipmaps(target, components, width, format, type, data)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, target, GLint, components, GLint, width, GLenum, format, GLenum, type, GLptr, data, "int")
}

gluBuild2DMipmaps(target, components, width, height, format, type, data)
{
  global
  return DllCall("glu32\" A_ThisFunc, GLenum, target, GLint, components, GLint, width, GLint, height, GLenum, format, GLenum, type, GLptr, data, "int")
}

GLUnurbs := GLptr
GLUquadric := GLptr
GLUtesselator := GLptr

;backwards compatibility:
GLUnurbsObj := GLUnurbs
GLUquadricObj := GLUquadric
GLUtesselatorObj := GLUtesselator
GLUtriangulator := GLUtesselator

gluNewQuadric()
{
  global
  return DllCall("glu32\" A_ThisFunc, GLUquadric)
}

gluDeleteQuadric(state)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, state)
}

gluQuadricNormals(quadObject, normals)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, quadObject, GLenum, normals)
}

gluQuadricTexture(quadObject, textureCoords)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, quadObject, GLboolean, textureCoords)
}

gluQuadricOrientation(quadObject, orientation)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, quadObject, GLenum, orientation)
}

gluQuadricDrawStyle(quadObject, drawStyle)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, quadObject, GLenum, drawStyle)
}

gluCylinder(qobj, baseRadius, topRadius, height, slices, stacks)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, qobj, GLdouble, baseRadius, GLdouble, topRadius, GLdouble, height, GLint, slices, GLint, stacks)
}

gluDisk(qobj, innerRadius, outerRadius, slices, loops)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, qobj, GLdouble, innerRadius, GLdouble, outerRadius, GLint, slices, GLint, loops)
}

gluPartialDisk(qobj, innerRadius, outerRadius, slices, loops, startAngle, sweepAngle)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, qobj, GLdouble, innerRadius, GLdouble, outerRadius, GLint, slices, GLint, loops, GLdouble, startAngle, GLdouble, sweepAngle)
}

gluSphere(qobj, radius, slices, stacks)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, qobj, GLdouble, radius, GLint, slices, GLint, stacks)
}

gluQuadricCallback(qobj, which, fn)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUquadric, qobj, GLenum, which, GLptr, fn)
}

gluNewTess()
{
  global
  return DllCall("glu32\" A_ThisFunc, GLUtesselator)
}

gluDeleteTess(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess)
}

gluTessBeginPolygon(tess, polygon_data)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLptr, polygon_data)
}

gluTessBeginContour(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess)
}

gluTessVertex(tess, coords, data)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLptr, coords, GLptr, data)
}

gluTessEndContour(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess)
}

gluTessEndPolygon(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess)
}

gluTessProperty(tess, which, value)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLenum, which, GLdouble, value)
}

gluTessNormal(tess, x, y, z)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLdouble, x, GLdouble, y, GLdouble, z)
}

gluTessCallback(tess, which, fn)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLenum, which, GLptr, fn)
}

gluGetTessProperty(tess, which, byref value)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUtesselator, tess, GLenum, which, GLdouble "*", value)
}

gluNewNurbsRenderer()
{
  global
  return DllCall("glu32\" A_ThisFunc, GLUnurbs)
}

gluDeleteNurbsRenderer(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluBeginSurface(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluBeginCurve(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluEndCurve(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluEndSurface(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluBeginTrim(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluEndTrim(nobj)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj)
}

gluPwlCurve(nobj, count, array, stride, type)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLint, count, GLptr, array, GLint, stride, GLenum, type)
}

gluNurbsCurve(nobj, nknots, knot, stride, ctlarray, order, type)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLint, nknots, GLptr, knot, GLint, stride, GLptr, ctlarray, GLint, order, GLenum, type)
}

gluNurbsSurface(nobj, sknot_count, sknot, tknot_count, tknot, s_stride, t_stride, ctlarray, sorder, torder, type)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLint, sknot_count, GLptr, sknot, GLint, tknot_count, GLptr, tknot, GLint, s_stride, GLint, t_stride, GLptr, ctlarray, GLint, sorder, GLint, torder, GLenum, type)
}

gluLoadSamplingMatrices(nobj, modelMatrix, projMatrix, viewport)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLptr, modelMatrix, GLptr, projMatrix, GLptr, viewport)
}

gluNurbsProperty(nobj, property, value)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLenum, property, GLfloat, value)
}

gluGetNurbsProperty(nobj, property, byref value)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLenum, property, GLfloat "*", value)
}

gluNurbsCallback(nobj, which, fn)
{
  global
  DllCall("glu32\" A_ThisFunc, GLUnurbs, nobj, GLenum, which, GLptr, fn)
}

/****           Callback function prototypes    ****/

;gluQuadricCallback
;typedef void (CALLBACK* GLUquadricErrorProc) (GLenum);

;gluTessCallback
;typedef void (CALLBACK* GLUtessBeginProc)        (GLenum);
;typedef void (CALLBACK* GLUtessEdgeFlagProc)     (GLboolean);
;typedef void (CALLBACK* GLUtessVertexProc)       (void *);
;typedef void (CALLBACK* GLUtessEndProc)          (void);
;typedef void (CALLBACK* GLUtessErrorProc)        (GLenum);
;typedef void (CALLBACK* GLUtessCombineProc)      (GLdouble[3], void*[4], GLfloat[4], void**);
;typedef void (CALLBACK* GLUtessBeginDataProc)    (GLenum, void *);
;typedef void (CALLBACK* GLUtessEdgeFlagDataProc) (GLboolean, void *);
;typedef void (CALLBACK* GLUtessVertexDataProc)   (void *, void *);
;typedef void (CALLBACK* GLUtessEndDataProc)      (void *);
;typedef void (CALLBACK* GLUtessErrorDataProc)    (GLenum, void *);
;typedef void (CALLBACK* GLUtessCombineDataProc)  (GLdouble[3], void*[4], GLfloat[4], void**, void*);

;gluNurbsCallback
;typedef void (CALLBACK* GLUnurbsErrorProc)   (GLenum);


/****           Generic constants               ****/


;Version
GLU_VERSION_1_1                 := 1
GLU_VERSION_1_2                 := 1

;Errors: (return value 0 = no error)
GLU_INVALID_ENUM        := 100900
GLU_INVALID_VALUE       := 100901
GLU_OUT_OF_MEMORY       := 100902
GLU_INCOMPATIBLE_GL_VERSION     := 100903

;StringName
GLU_VERSION             := 100800
GLU_EXTENSIONS          := 100801

;Boolean
GLU_TRUE                := GL_TRUE
GLU_FALSE               := GL_FALSE


;Quadric constants

;QuadricNormal
GLU_SMOOTH              := 100000
GLU_FLAT                := 100001
GLU_NONE                := 100002

;QuadricDrawStyle
GLU_POINT               := 100010
GLU_LINE                := 100011
GLU_FILL                := 100012
GLU_SILHOUETTE          := 100013

;QuadricOrientation
GLU_OUTSIDE             := 100020
GLU_INSIDE              := 100021

;Callback types:
;     GLU_ERROR               := 100103


;Tesselation constants

GLU_TESS_MAX_COORD              := 1.0

;TessProperty
GLU_TESS_WINDING_RULE           := 100140
GLU_TESS_BOUNDARY_ONLY          := 100141
GLU_TESS_TOLERANCE              := 100142

;TessWinding
GLU_TESS_WINDING_ODD            := 100130
GLU_TESS_WINDING_NONZERO        := 100131
GLU_TESS_WINDING_POSITIVE       := 100132
GLU_TESS_WINDING_NEGATIVE       := 100133
GLU_TESS_WINDING_ABS_GEQ_TWO    := 100134

;TessCallback
GLU_TESS_BEGIN          := 100100  ;void (CALLBACK*)(GLenum type) 
GLU_TESS_VERTEX         := 100101  ;void (CALLBACK*)(void *data)
GLU_TESS_END            := 100102  ;void (CALLBACK*)(void)           
GLU_TESS_ERROR          := 100103  ;void (CALLBACK*)(GLenum errno)
GLU_TESS_EDGE_FLAG      := 100104  ;void (CALLBACK*)(GLboolean boundaryEdge) 
GLU_TESS_COMBINE        := 100105  ;void (CALLBACK*)(GLdouble coords[3], void *data[4], GLfloat weight[4], void **dataOut)    
GLU_TESS_BEGIN_DATA     := 100106  ;void (CALLBACK*)(GLenum type, void *polygon_data)
GLU_TESS_VERTEX_DATA    := 100107  ;void (CALLBACK*)(void *data, void *polygon_data)
GLU_TESS_END_DATA       := 100108  ;void (CALLBACK*)(void *polygon_data)
GLU_TESS_ERROR_DATA     := 100109  ;void (CALLBACK*)(GLenum errno, void *polygon_data)
GLU_TESS_EDGE_FLAG_DATA := 100110  ;void (CALLBACK*)(GLboolean boundaryEdge, void *polygon_data)
GLU_TESS_COMBINE_DATA   := 100111  ;void (CALLBACK*)(GLdouble coords[3], void *data[4], GLfloat weight[4], void **dataOut, void *polygon_data)

;TessError
GLU_TESS_ERROR1     := 100151
GLU_TESS_ERROR2     := 100152
GLU_TESS_ERROR3     := 100153
GLU_TESS_ERROR4     := 100154
GLU_TESS_ERROR5     := 100155
GLU_TESS_ERROR6     := 100156
GLU_TESS_ERROR7     := 100157
GLU_TESS_ERROR8     := 100158

GLU_TESS_MISSING_BEGIN_POLYGON  := GLU_TESS_ERROR1
GLU_TESS_MISSING_BEGIN_CONTOUR  := GLU_TESS_ERROR2
GLU_TESS_MISSING_END_POLYGON    := GLU_TESS_ERROR3
GLU_TESS_MISSING_END_CONTOUR    := GLU_TESS_ERROR4
GLU_TESS_COORD_TOO_LARGE        := GLU_TESS_ERROR5
GLU_TESS_NEED_COMBINE_CALLBACK  := GLU_TESS_ERROR6

;NURBS constants

;NurbsProperty
GLU_AUTO_LOAD_MATRIX    := 100200
GLU_CULLING             := 100201
GLU_SAMPLING_TOLERANCE  := 100203
GLU_DISPLAY_MODE        := 100204
GLU_PARAMETRIC_TOLERANCE        := 100202
GLU_SAMPLING_METHOD             := 100205
GLU_U_STEP                      := 100206
GLU_V_STEP                      := 100207

;NurbsSampling
GLU_PATH_LENGTH                 := 100215
GLU_PARAMETRIC_ERROR            := 100216
GLU_DOMAIN_DISTANCE             := 100217


;NurbsTrim
GLU_MAP1_TRIM_2         := 100210
GLU_MAP1_TRIM_3         := 100211

;NurbsDisplay
;     GLU_FILL                := 100012
GLU_OUTLINE_POLYGON     := 100240
GLU_OUTLINE_PATCH       := 100241

;NurbsCallback
;     GLU_ERROR               := 100103

;NurbsErrors
GLU_NURBS_ERROR1        := 100251
GLU_NURBS_ERROR2        := 100252
GLU_NURBS_ERROR3        := 100253
GLU_NURBS_ERROR4        := 100254
GLU_NURBS_ERROR5        := 100255
GLU_NURBS_ERROR6        := 100256
GLU_NURBS_ERROR7        := 100257
GLU_NURBS_ERROR8        := 100258
GLU_NURBS_ERROR9        := 100259
GLU_NURBS_ERROR10       := 100260
GLU_NURBS_ERROR11       := 100261
GLU_NURBS_ERROR12       := 100262
GLU_NURBS_ERROR13       := 100263
GLU_NURBS_ERROR14       := 100264
GLU_NURBS_ERROR15       := 100265
GLU_NURBS_ERROR16       := 100266
GLU_NURBS_ERROR17       := 100267
GLU_NURBS_ERROR18       := 100268
GLU_NURBS_ERROR19       := 100269
GLU_NURBS_ERROR20       := 100270
GLU_NURBS_ERROR21       := 100271
GLU_NURBS_ERROR22       := 100272
GLU_NURBS_ERROR23       := 100273
GLU_NURBS_ERROR24       := 100274
GLU_NURBS_ERROR25       := 100275
GLU_NURBS_ERROR26       := 100276
GLU_NURBS_ERROR27       := 100277
GLU_NURBS_ERROR28       := 100278
GLU_NURBS_ERROR29       := 100279
GLU_NURBS_ERROR30       := 100280
GLU_NURBS_ERROR31       := 100281
GLU_NURBS_ERROR32       := 100282
GLU_NURBS_ERROR33       := 100283
GLU_NURBS_ERROR34       := 100284
GLU_NURBS_ERROR35       := 100285
GLU_NURBS_ERROR36       := 100286
GLU_NURBS_ERROR37       := 100287

;Backwards compatibility for old tesselator/

gluBeginPolygon(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLtesselator, tess)
}

gluNextContour(tess, type)
{
  global
  DllCall("glu32\" A_ThisFunc, GLtesselator, tess, GLenum, type)
}

gluEndPolygon(tess)
{
  global
  DllCall("glu32\" A_ThisFunc, GLtesselator, tess)
}

;Contours types -- obsolete!
GLU_CW          := 100120
GLU_CCW         := 100121
GLU_INTERIOR    := 100122
GLU_EXTERIOR    := 100123
GLU_UNKNOWN     := 100124

;Names without "TESS_" prefix
GLU_BEGIN       := GLU_TESS_BEGIN
GLU_VERTEX      := GLU_TESS_VERTEX
GLU_END         := GLU_TESS_END
GLU_ERROR       := GLU_TESS_ERROR
GLU_EDGE_FLAG   := GLU_TESS_EDGE_FLAG

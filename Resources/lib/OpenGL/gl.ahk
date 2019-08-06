; AutoHotkey header file for OpenGL.
; gl.ahk last updated Date: 2011-03-08 (Tuesday, 08 Mar 2011)
; Converted by: Bentschi (bentschi1337@yahoo.de)

;=============================================================

/*
** Copyright 1996 Silicon Graphics, Inc.
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

GLenum := "uint"
GLboolean := "uchar"
GLbitfield := "uint"
GLbyte := "char"
GLshort := "short"
GLint := "int"
GLsizei := "int"
GLubyte := "uchar"
GLushort := "ushort"
GLuint := "uint"
GLfloat := "float"
GLclampf := "float"
GLdouble := "double"
GLclampd := "double"
GLvoid := ""

;=============================================================

;Version
GL_VERSION_1_1                    := 1

;AccumOp
GL_ACCUM                          := 0x0100
GL_LOAD                           := 0x0101
GL_RETURN                         := 0x0102
GL_MULT                           := 0x0103
GL_ADD                            := 0x0104

;AlphaFunction
GL_NEVER                          := 0x0200
GL_LESS                           := 0x0201
GL_EQUAL                          := 0x0202
GL_LEQUAL                         := 0x0203
GL_GREATER                        := 0x0204
GL_NOTEQUAL                       := 0x0205
GL_GEQUAL                         := 0x0206
GL_ALWAYS                         := 0x0207

;AttribMask
GL_CURRENT_BIT                    := 0x00000001
GL_POINT_BIT                      := 0x00000002
GL_LINE_BIT                       := 0x00000004
GL_POLYGON_BIT                    := 0x00000008
GL_POLYGON_STIPPLE_BIT            := 0x00000010
GL_PIXEL_MODE_BIT                 := 0x00000020
GL_LIGHTING_BIT                   := 0x00000040
GL_FOG_BIT                        := 0x00000080
GL_DEPTH_BUFFER_BIT               := 0x00000100
GL_ACCUM_BUFFER_BIT               := 0x00000200
GL_STENCIL_BUFFER_BIT             := 0x00000400
GL_VIEWPORT_BIT                   := 0x00000800
GL_TRANSFORM_BIT                  := 0x00001000
GL_ENABLE_BIT                     := 0x00002000
GL_COLOR_BUFFER_BIT               := 0x00004000
GL_HINT_BIT                       := 0x00008000
GL_EVAL_BIT                       := 0x00010000
GL_LIST_BIT                       := 0x00020000
GL_TEXTURE_BIT                    := 0x00040000
GL_SCISSOR_BIT                    := 0x00080000
GL_ALL_ATTRIB_BITS                := 0x000fffff

;BeginMode
GL_POINTS                         := 0x0000
GL_LINES                          := 0x0001
GL_LINE_LOOP                      := 0x0002
GL_LINE_STRIP                     := 0x0003
GL_TRIANGLES                      := 0x0004
GL_TRIANGLE_STRIP                 := 0x0005
GL_TRIANGLE_FAN                   := 0x0006
GL_QUADS                          := 0x0007
GL_QUAD_STRIP                     := 0x0008
GL_POLYGON                        := 0x0009

;BlendingFactorDest
GL_ZERO                           := 0
GL_ONE                            := 1
GL_SRC_COLOR                      := 0x0300
GL_ONE_MINUS_SRC_COLOR            := 0x0301
GL_SRC_ALPHA                      := 0x0302
GL_ONE_MINUS_SRC_ALPHA            := 0x0303
GL_DST_ALPHA                      := 0x0304
GL_ONE_MINUS_DST_ALPHA            := 0x0305

;BlendingFactorSrc
;     GL_ZERO
;     GL_ONE
GL_DST_COLOR                      := 0x0306
GL_ONE_MINUS_DST_COLOR            := 0x0307
GL_SRC_ALPHA_SATURATE             := 0x0308
;     GL_SRC_ALPHA
;     GL_ONE_MINUS_SRC_ALPHA
;     GL_DST_ALPHA
;     GL_ONE_MINUS_DST_ALPHA

;Boolean
GL_TRUE                           := 1
GL_FALSE                          := 0

;ClearBufferMask
;     GL_COLOR_BUFFER_BIT
;     GL_ACCUM_BUFFER_BIT
;     GL_STENCIL_BUFFER_BIT
;     GL_DEPTH_BUFFER_BIT

;ClientArrayType
;     GL_VERTEX_ARRAY
;     GL_NORMAL_ARRAY
;     GL_COLOR_ARRAY
;     GL_INDEX_ARRAY
;     GL_TEXTURE_COORD_ARRAY
;     GL_EDGE_FLAG_ARRAY

;ClipPlaneName
GL_CLIP_PLANE0                    := 0x3000
GL_CLIP_PLANE1                    := 0x3001
GL_CLIP_PLANE2                    := 0x3002
GL_CLIP_PLANE3                    := 0x3003
GL_CLIP_PLANE4                    := 0x3004
GL_CLIP_PLANE5                    := 0x3005

;ColorMaterialFace
;     GL_FRONT
;     GL_BACK
;     GL_FRONT_AND_BACK

;ColorMaterialParameter
;     GL_AMBIENT
;     GL_DIFFUSE
;     GL_SPECULAR
;     GL_EMISSION
;     GL_AMBIENT_AND_DIFFUSE

;ColorPointerType
;     GL_BYTE
;     GL_UNSIGNED_BYTE
;     GL_SHORT
;     GL_UNSIGNED_SHORT
;     GL_INT
;     GL_UNSIGNED_INT
;     GL_FLOAT
;     GL_DOUBLE

;CullFaceMode
;     GL_FRONT
;     GL_BACK
;     GL_FRONT_AND_BACK

;DataType
GL_BYTE                           := 0x1400
GL_UNSIGNED_BYTE                  := 0x1401
GL_SHORT                          := 0x1402
GL_UNSIGNED_SHORT                 := 0x1403
GL_INT                            := 0x1404
GL_UNSIGNED_INT                   := 0x1405
GL_FLOAT                          := 0x1406
GL_2_BYTES                        := 0x1407
GL_3_BYTES                        := 0x1408
GL_4_BYTES                        := 0x1409
GL_DOUBLE                         := 0x140A

;DepthFunction
;     GL_NEVER
;     GL_LESS
;     GL_EQUAL
;     GL_LEQUAL
;     GL_GREATER
;     GL_NOTEQUAL
;     GL_GEQUAL
;     GL_ALWAYS

;DrawBufferMode
GL_NONE                           := 0
GL_FRONT_LEFT                     := 0x0400
GL_FRONT_RIGHT                    := 0x0401
GL_BACK_LEFT                      := 0x0402
GL_BACK_RIGHT                     := 0x0403
GL_FRONT                          := 0x0404
GL_BACK                           := 0x0405
GL_LEFT                           := 0x0406
GL_RIGHT                          := 0x0407
GL_FRONT_AND_BACK                 := 0x0408
GL_AUX0                           := 0x0409
GL_AUX1                           := 0x040A
GL_AUX2                           := 0x040B
GL_AUX3                           := 0x040C

;Enable
;     GL_FOG
;     GL_LIGHTING
;     GL_TEXTURE_1D
;     GL_TEXTURE_2D
;     GL_LINE_STIPPLE
;     GL_POLYGON_STIPPLE
;     GL_CULL_FACE
;     GL_ALPHA_TEST
;     GL_BLEND
;     GL_INDEX_LOGIC_OP
;     GL_COLOR_LOGIC_OP
;     GL_DITHER
;     GL_STENCIL_TEST
;     GL_DEPTH_TEST
;     GL_CLIP_PLANE0
;     GL_CLIP_PLANE1
;     GL_CLIP_PLANE2
;     GL_CLIP_PLANE3
;     GL_CLIP_PLANE4
;     GL_CLIP_PLANE5
;     GL_LIGHT0
;     GL_LIGHT1
;     GL_LIGHT2
;     GL_LIGHT3
;     GL_LIGHT4
;     GL_LIGHT5
;     GL_LIGHT6
;     GL_LIGHT7
;     GL_TEXTURE_GEN_S
;     GL_TEXTURE_GEN_T
;     GL_TEXTURE_GEN_R
;     GL_TEXTURE_GEN_Q
;     GL_MAP1_VERTEX_3
;     GL_MAP1_VERTEX_4
;     GL_MAP1_COLOR_4
;     GL_MAP1_INDEX
;     GL_MAP1_NORMAL
;     GL_MAP1_TEXTURE_COORD_1
;     GL_MAP1_TEXTURE_COORD_2
;     GL_MAP1_TEXTURE_COORD_3
;     GL_MAP1_TEXTURE_COORD_4
;     GL_MAP2_VERTEX_3
;     GL_MAP2_VERTEX_4
;     GL_MAP2_COLOR_4
;     GL_MAP2_INDEX
;     GL_MAP2_NORMAL
;     GL_MAP2_TEXTURE_COORD_1
;     GL_MAP2_TEXTURE_COORD_2
;     GL_MAP2_TEXTURE_COORD_3
;     GL_MAP2_TEXTURE_COORD_4
;     GL_POINT_SMOOTH
;     GL_LINE_SMOOTH
;     GL_POLYGON_SMOOTH
;     GL_SCISSOR_TEST
;     GL_COLOR_MATERIAL
;     GL_NORMALIZE
;     GL_AUTO_NORMAL
;     GL_VERTEX_ARRAY
;     GL_NORMAL_ARRAY
;     GL_COLOR_ARRAY
;     GL_INDEX_ARRAY
;     GL_TEXTURE_COORD_ARRAY
;     GL_EDGE_FLAG_ARRAY
;     GL_POLYGON_OFFSET_POINT
;     GL_POLYGON_OFFSET_LINE
;     GL_POLYGON_OFFSET_FILL

;ErrorCode
GL_NO_ERROR                       := 0
GL_INVALID_ENUM                   := 0x0500
GL_INVALID_VALUE                  := 0x0501
GL_INVALID_OPERATION              := 0x0502
GL_STACK_OVERFLOW                 := 0x0503
GL_STACK_UNDERFLOW                := 0x0504
GL_OUT_OF_MEMORY                  := 0x0505

;FeedBackMode
GL_2D                             := 0x0600
GL_3D                             := 0x0601
GL_3D_COLOR                       := 0x0602
GL_3D_COLOR_TEXTURE               := 0x0603
GL_4D_COLOR_TEXTURE               := 0x0604

;FeedBackToken
GL_PASS_THROUGH_TOKEN             := 0x0700
GL_POINT_TOKEN                    := 0x0701
GL_LINE_TOKEN                     := 0x0702
GL_POLYGON_TOKEN                  := 0x0703
GL_BITMAP_TOKEN                   := 0x0704
GL_DRAW_PIXEL_TOKEN               := 0x0705
GL_COPY_PIXEL_TOKEN               := 0x0706
GL_LINE_RESET_TOKEN               := 0x0707

;FogMode
;     GL_LINEAR
GL_EXP                            := 0x0800
GL_EXP2                           := 0x0801


;FogParameter
;     GL_FOG_COLOR
;     GL_FOG_DENSITY
;     GL_FOG_END
;     GL_FOG_INDEX
;     GL_FOG_MODE
;     GL_FOG_START

;FrontFaceDirection
GL_CW                             := 0x0900
GL_CCW                            := 0x0901

;GetMapTarget
GL_COEFF                          := 0x0A00
GL_ORDER                          := 0x0A01
GL_DOMAIN                         := 0x0A02

;GetPixelMap
;     GL_PIXEL_MAP_I_TO_I
;     GL_PIXEL_MAP_S_TO_S
;     GL_PIXEL_MAP_I_TO_R
;     GL_PIXEL_MAP_I_TO_G
;     GL_PIXEL_MAP_I_TO_B
;     GL_PIXEL_MAP_I_TO_A
;     GL_PIXEL_MAP_R_TO_R
;     GL_PIXEL_MAP_G_TO_G
;     GL_PIXEL_MAP_B_TO_B
;     GL_PIXEL_MAP_A_TO_A

;GetPointerTarget
;     GL_VERTEX_ARRAY_POINTER
;     GL_NORMAL_ARRAY_POINTER
;     GL_COLOR_ARRAY_POINTER
;     GL_INDEX_ARRAY_POINTER
;     GL_TEXTURE_COORD_ARRAY_POINTER
;     GL_EDGE_FLAG_ARRAY_POINTER

;GetTarget
GL_CURRENT_COLOR                  := 0x0B00
GL_CURRENT_INDEX                  := 0x0B01
GL_CURRENT_NORMAL                 := 0x0B02
GL_CURRENT_TEXTURE_COORDS         := 0x0B03
GL_CURRENT_RASTER_COLOR           := 0x0B04
GL_CURRENT_RASTER_INDEX           := 0x0B05
GL_CURRENT_RASTER_TEXTURE_COORDS  := 0x0B06
GL_CURRENT_RASTER_POSITION        := 0x0B07
GL_CURRENT_RASTER_POSITION_VALID  := 0x0B08
GL_CURRENT_RASTER_DISTANCE        := 0x0B09
GL_POINT_SMOOTH                   := 0x0B10
GL_POINT_SIZE                     := 0x0B11
GL_POINT_SIZE_RANGE               := 0x0B12
GL_POINT_SIZE_GRANULARITY         := 0x0B13
GL_LINE_SMOOTH                    := 0x0B20
GL_LINE_WIDTH                     := 0x0B21
GL_LINE_WIDTH_RANGE               := 0x0B22
GL_LINE_WIDTH_GRANULARITY         := 0x0B23
GL_LINE_STIPPLE                   := 0x0B24
GL_LINE_STIPPLE_PATTERN           := 0x0B25
GL_LINE_STIPPLE_REPEAT            := 0x0B26
GL_LIST_MODE                      := 0x0B30
GL_MAX_LIST_NESTING               := 0x0B31
GL_LIST_BASE                      := 0x0B32
GL_LIST_INDEX                     := 0x0B33
GL_POLYGON_MODE                   := 0x0B40
GL_POLYGON_SMOOTH                 := 0x0B41
GL_POLYGON_STIPPLE                := 0x0B42
GL_EDGE_FLAG                      := 0x0B43
GL_CULL_FACE                      := 0x0B44
GL_CULL_FACE_MODE                 := 0x0B45
GL_FRONT_FACE                     := 0x0B46
GL_LIGHTING                       := 0x0B50
GL_LIGHT_MODEL_LOCAL_VIEWER       := 0x0B51
GL_LIGHT_MODEL_TWO_SIDE           := 0x0B52
GL_LIGHT_MODEL_AMBIENT            := 0x0B53
GL_SHADE_MODEL                    := 0x0B54
GL_COLOR_MATERIAL_FACE            := 0x0B55
GL_COLOR_MATERIAL_PARAMETER       := 0x0B56
GL_COLOR_MATERIAL                 := 0x0B57
GL_FOG                            := 0x0B60
GL_FOG_INDEX                      := 0x0B61
GL_FOG_DENSITY                    := 0x0B62
GL_FOG_START                      := 0x0B63
GL_FOG_END                        := 0x0B64
GL_FOG_MODE                       := 0x0B65
GL_FOG_COLOR                      := 0x0B66
GL_DEPTH_RANGE                    := 0x0B70
GL_DEPTH_TEST                     := 0x0B71
GL_DEPTH_WRITEMASK                := 0x0B72
GL_DEPTH_CLEAR_VALUE              := 0x0B73
GL_DEPTH_FUNC                     := 0x0B74
GL_ACCUM_CLEAR_VALUE              := 0x0B80
GL_STENCIL_TEST                   := 0x0B90
GL_STENCIL_CLEAR_VALUE            := 0x0B91
GL_STENCIL_FUNC                   := 0x0B92
GL_STENCIL_VALUE_MASK             := 0x0B93
GL_STENCIL_FAIL                   := 0x0B94
GL_STENCIL_PASS_DEPTH_FAIL        := 0x0B95
GL_STENCIL_PASS_DEPTH_PASS        := 0x0B96
GL_STENCIL_REF                    := 0x0B97
GL_STENCIL_WRITEMASK              := 0x0B98
GL_MATRIX_MODE                    := 0x0BA0
GL_NORMALIZE                      := 0x0BA1
GL_VIEWPORT                       := 0x0BA2
GL_MODELVIEW_STACK_DEPTH          := 0x0BA3
GL_PROJECTION_STACK_DEPTH         := 0x0BA4
GL_TEXTURE_STACK_DEPTH            := 0x0BA5
GL_MODELVIEW_MATRIX               := 0x0BA6
GL_PROJECTION_MATRIX              := 0x0BA7
GL_TEXTURE_MATRIX                 := 0x0BA8
GL_ATTRIB_STACK_DEPTH             := 0x0BB0
GL_CLIENT_ATTRIB_STACK_DEPTH      := 0x0BB1
GL_ALPHA_TEST                     := 0x0BC0
GL_ALPHA_TEST_FUNC                := 0x0BC1
GL_ALPHA_TEST_REF                 := 0x0BC2
GL_DITHER                         := 0x0BD0
GL_BLEND_DST                      := 0x0BE0
GL_BLEND_SRC                      := 0x0BE1
GL_BLEND                          := 0x0BE2
GL_LOGIC_OP_MODE                  := 0x0BF0
GL_INDEX_LOGIC_OP                 := 0x0BF1
GL_COLOR_LOGIC_OP                 := 0x0BF2
GL_AUX_BUFFERS                    := 0x0C00
GL_DRAW_BUFFER                    := 0x0C01
GL_READ_BUFFER                    := 0x0C02
GL_SCISSOR_BOX                    := 0x0C10
GL_SCISSOR_TEST                   := 0x0C11
GL_INDEX_CLEAR_VALUE              := 0x0C20
GL_INDEX_WRITEMASK                := 0x0C21
GL_COLOR_CLEAR_VALUE              := 0x0C22
GL_COLOR_WRITEMASK                := 0x0C23
GL_INDEX_MODE                     := 0x0C30
GL_RGBA_MODE                      := 0x0C31
GL_DOUBLEBUFFER                   := 0x0C32
GL_STEREO                         := 0x0C33
GL_RENDER_MODE                    := 0x0C40
GL_PERSPECTIVE_CORRECTION_HINT    := 0x0C50
GL_POINT_SMOOTH_HINT              := 0x0C51
GL_LINE_SMOOTH_HINT               := 0x0C52
GL_POLYGON_SMOOTH_HINT            := 0x0C53
GL_FOG_HINT                       := 0x0C54
GL_TEXTURE_GEN_S                  := 0x0C60
GL_TEXTURE_GEN_T                  := 0x0C61
GL_TEXTURE_GEN_R                  := 0x0C62
GL_TEXTURE_GEN_Q                  := 0x0C63
GL_PIXEL_MAP_I_TO_I               := 0x0C70
GL_PIXEL_MAP_S_TO_S               := 0x0C71
GL_PIXEL_MAP_I_TO_R               := 0x0C72
GL_PIXEL_MAP_I_TO_G               := 0x0C73
GL_PIXEL_MAP_I_TO_B               := 0x0C74
GL_PIXEL_MAP_I_TO_A               := 0x0C75
GL_PIXEL_MAP_R_TO_R               := 0x0C76
GL_PIXEL_MAP_G_TO_G               := 0x0C77
GL_PIXEL_MAP_B_TO_B               := 0x0C78
GL_PIXEL_MAP_A_TO_A               := 0x0C79
GL_PIXEL_MAP_I_TO_I_SIZE          := 0x0CB0
GL_PIXEL_MAP_S_TO_S_SIZE          := 0x0CB1
GL_PIXEL_MAP_I_TO_R_SIZE          := 0x0CB2
GL_PIXEL_MAP_I_TO_G_SIZE          := 0x0CB3
GL_PIXEL_MAP_I_TO_B_SIZE          := 0x0CB4
GL_PIXEL_MAP_I_TO_A_SIZE          := 0x0CB5
GL_PIXEL_MAP_R_TO_R_SIZE          := 0x0CB6
GL_PIXEL_MAP_G_TO_G_SIZE          := 0x0CB7
GL_PIXEL_MAP_B_TO_B_SIZE          := 0x0CB8
GL_PIXEL_MAP_A_TO_A_SIZE          := 0x0CB9
GL_UNPACK_SWAP_BYTES              := 0x0CF0
GL_UNPACK_LSB_FIRST               := 0x0CF1
GL_UNPACK_ROW_LENGTH              := 0x0CF2
GL_UNPACK_SKIP_ROWS               := 0x0CF3
GL_UNPACK_SKIP_PIXELS             := 0x0CF4
GL_UNPACK_ALIGNMENT               := 0x0CF5
GL_PACK_SWAP_BYTES                := 0x0D00
GL_PACK_LSB_FIRST                 := 0x0D01
GL_PACK_ROW_LENGTH                := 0x0D02
GL_PACK_SKIP_ROWS                 := 0x0D03
GL_PACK_SKIP_PIXELS               := 0x0D04
GL_PACK_ALIGNMENT                 := 0x0D05
GL_MAP_COLOR                      := 0x0D10
GL_MAP_STENCIL                    := 0x0D11
GL_INDEX_SHIFT                    := 0x0D12
GL_INDEX_OFFSET                   := 0x0D13
GL_RED_SCALE                      := 0x0D14
GL_RED_BIAS                       := 0x0D15
GL_ZOOM_X                         := 0x0D16
GL_ZOOM_Y                         := 0x0D17
GL_GREEN_SCALE                    := 0x0D18
GL_GREEN_BIAS                     := 0x0D19
GL_BLUE_SCALE                     := 0x0D1A
GL_BLUE_BIAS                      := 0x0D1B
GL_ALPHA_SCALE                    := 0x0D1C
GL_ALPHA_BIAS                     := 0x0D1D
GL_DEPTH_SCALE                    := 0x0D1E
GL_DEPTH_BIAS                     := 0x0D1F
GL_MAX_EVAL_ORDER                 := 0x0D30
GL_MAX_LIGHTS                     := 0x0D31
GL_MAX_CLIP_PLANES                := 0x0D32
GL_MAX_TEXTURE_SIZE               := 0x0D33
GL_MAX_PIXEL_MAP_TABLE            := 0x0D34
GL_MAX_ATTRIB_STACK_DEPTH         := 0x0D35
GL_MAX_MODELVIEW_STACK_DEPTH      := 0x0D36
GL_MAX_NAME_STACK_DEPTH           := 0x0D37
GL_MAX_PROJECTION_STACK_DEPTH     := 0x0D38
GL_MAX_TEXTURE_STACK_DEPTH        := 0x0D39
GL_MAX_VIEWPORT_DIMS              := 0x0D3A
GL_MAX_CLIENT_ATTRIB_STACK_DEPTH  := 0x0D3B
GL_SUBPIXEL_BITS                  := 0x0D50
GL_INDEX_BITS                     := 0x0D51
GL_RED_BITS                       := 0x0D52
GL_GREEN_BITS                     := 0x0D53
GL_BLUE_BITS                      := 0x0D54
GL_ALPHA_BITS                     := 0x0D55
GL_DEPTH_BITS                     := 0x0D56
GL_STENCIL_BITS                   := 0x0D57
GL_ACCUM_RED_BITS                 := 0x0D58
GL_ACCUM_GREEN_BITS               := 0x0D59
GL_ACCUM_BLUE_BITS                := 0x0D5A
GL_ACCUM_ALPHA_BITS               := 0x0D5B
GL_NAME_STACK_DEPTH               := 0x0D70
GL_AUTO_NORMAL                    := 0x0D80
GL_MAP1_COLOR_4                   := 0x0D90
GL_MAP1_INDEX                     := 0x0D91
GL_MAP1_NORMAL                    := 0x0D92
GL_MAP1_TEXTURE_COORD_1           := 0x0D93
GL_MAP1_TEXTURE_COORD_2           := 0x0D94
GL_MAP1_TEXTURE_COORD_3           := 0x0D95
GL_MAP1_TEXTURE_COORD_4           := 0x0D96
GL_MAP1_VERTEX_3                  := 0x0D97
GL_MAP1_VERTEX_4                  := 0x0D98
GL_MAP2_COLOR_4                   := 0x0DB0
GL_MAP2_INDEX                     := 0x0DB1
GL_MAP2_NORMAL                    := 0x0DB2
GL_MAP2_TEXTURE_COORD_1           := 0x0DB3
GL_MAP2_TEXTURE_COORD_2           := 0x0DB4
GL_MAP2_TEXTURE_COORD_3           := 0x0DB5
GL_MAP2_TEXTURE_COORD_4           := 0x0DB6
GL_MAP2_VERTEX_3                  := 0x0DB7
GL_MAP2_VERTEX_4                  := 0x0DB8
GL_MAP1_GRID_DOMAIN               := 0x0DD0
GL_MAP1_GRID_SEGMENTS             := 0x0DD1
GL_MAP2_GRID_DOMAIN               := 0x0DD2
GL_MAP2_GRID_SEGMENTS             := 0x0DD3
GL_TEXTURE_1D                     := 0x0DE0
GL_TEXTURE_2D                     := 0x0DE1
GL_FEEDBACK_BUFFER_POINTER        := 0x0DF0
GL_FEEDBACK_BUFFER_SIZE           := 0x0DF1
GL_FEEDBACK_BUFFER_TYPE           := 0x0DF2
GL_SELECTION_BUFFER_POINTER       := 0x0DF3
GL_SELECTION_BUFFER_SIZE          := 0x0DF4
;     GL_TEXTURE_BINDING_1D
;     GL_TEXTURE_BINDING_2D
;     GL_VERTEX_ARRAY
;     GL_NORMAL_ARRAY
;     GL_COLOR_ARRAY
;     GL_INDEX_ARRAY
;     GL_TEXTURE_COORD_ARRAY
;     GL_EDGE_FLAG_ARRAY
;     GL_VERTEX_ARRAY_SIZE
;     GL_VERTEX_ARRAY_TYPE
;     GL_VERTEX_ARRAY_STRIDE
;     GL_NORMAL_ARRAY_TYPE
;     GL_NORMAL_ARRAY_STRIDE
;     GL_COLOR_ARRAY_SIZE
;     GL_COLOR_ARRAY_TYPE
;     GL_COLOR_ARRAY_STRIDE
;     GL_INDEX_ARRAY_TYPE
;     GL_INDEX_ARRAY_STRIDE
;     GL_TEXTURE_COORD_ARRAY_SIZE
;     GL_TEXTURE_COORD_ARRAY_TYPE
;     GL_TEXTURE_COORD_ARRAY_STRIDE
;     GL_EDGE_FLAG_ARRAY_STRIDE
;     GL_POLYGON_OFFSET_FACTOR
;     GL_POLYGON_OFFSET_UNITS

;GetTextureParameter
;     GL_TEXTURE_MAG_FILTER
;     GL_TEXTURE_MIN_FILTER
;     GL_TEXTURE_WRAP_S
;     GL_TEXTURE_WRAP_T
GL_TEXTURE_WIDTH                  := 0x1000
GL_TEXTURE_HEIGHT                 := 0x1001
GL_TEXTURE_INTERNAL_FORMAT        := 0x1003
GL_TEXTURE_BORDER_COLOR           := 0x1004
GL_TEXTURE_BORDER                 := 0x1005
;     GL_TEXTURE_RED_SIZE
;     GL_TEXTURE_GREEN_SIZE
;     GL_TEXTURE_BLUE_SIZE
;     GL_TEXTURE_ALPHA_SIZE
;     GL_TEXTURE_LUMINANCE_SIZE
;     GL_TEXTURE_INTENSITY_SIZE
;     GL_TEXTURE_PRIORITY
;     GL_TEXTURE_RESIDENT

;HintMode
GL_DONT_CARE                      := 0x1100
GL_FASTEST                        := 0x1101
GL_NICEST                         := 0x1102

;HintTarget
;     GL_PERSPECTIVE_CORRECTION_HINT
;     GL_POINT_SMOOTH_HINT
;     GL_LINE_SMOOTH_HINT
;     GL_POLYGON_SMOOTH_HINT
;     GL_FOG_HINT
;     GL_PHONG_HINT

;IndexPointerType
;     GL_SHORT
;     GL_INT
;     GL_FLOAT
;     GL_DOUBLE

;LightModelParameter
;     GL_LIGHT_MODEL_AMBIENT
;     GL_LIGHT_MODEL_LOCAL_VIEWER
;     GL_LIGHT_MODEL_TWO_SIDE

;LightName
GL_LIGHT0                         := 0x4000
GL_LIGHT1                         := 0x4001
GL_LIGHT2                         := 0x4002
GL_LIGHT3                         := 0x4003
GL_LIGHT4                         := 0x4004
GL_LIGHT5                         := 0x4005
GL_LIGHT6                         := 0x4006
GL_LIGHT7                         := 0x4007

;LightParameter
GL_AMBIENT                        := 0x1200
GL_DIFFUSE                        := 0x1201
GL_SPECULAR                       := 0x1202
GL_POSITION                       := 0x1203
GL_SPOT_DIRECTION                 := 0x1204
GL_SPOT_EXPONENT                  := 0x1205
GL_SPOT_CUTOFF                    := 0x1206
GL_CONSTANT_ATTENUATION           := 0x1207
GL_LINEAR_ATTENUATION             := 0x1208
GL_QUADRATIC_ATTENUATION          := 0x1209

;InterleavedArrays
;     GL_V2F
;     GL_V3F
;     GL_C4UB_V2F
;     GL_C4UB_V3F
;     GL_C3F_V3F
;     GL_N3F_V3F
;     GL_C4F_N3F_V3F
;     GL_T2F_V3F
;     GL_T4F_V4F
;     GL_T2F_C4UB_V3F
;     GL_T2F_C3F_V3F
;     GL_T2F_N3F_V3F
;     GL_T2F_C4F_N3F_V3F
;     GL_T4F_C4F_N3F_V4F

;ListMode
GL_COMPILE                        := 0x1300
GL_COMPILE_AND_EXECUTE            := 0x1301

;ListNameType
;     GL_BYTE
;     GL_UNSIGNED_BYTE
;     GL_SHORT
;     GL_UNSIGNED_SHORT
;     GL_INT
;     GL_UNSIGNED_INT
;     GL_FLOAT
;     GL_2_BYTES
;     GL_3_BYTES
;     GL_4_BYTES

;LogicOp
GL_CLEAR                          := 0x1500
GL_AND                            := 0x1501
GL_AND_REVERSE                    := 0x1502
GL_COPY                           := 0x1503
GL_AND_INVERTED                   := 0x1504
GL_NOOP                           := 0x1505
GL_XOR                            := 0x1506
GL_OR                             := 0x1507
GL_NOR                            := 0x1508
GL_EQUIV                          := 0x1509
GL_INVERT                         := 0x150A
GL_OR_REVERSE                     := 0x150B
GL_COPY_INVERTED                  := 0x150C
GL_OR_INVERTED                    := 0x150D
GL_NAND                           := 0x150E
GL_SET                            := 0x150F

;MapTarget
;     GL_MAP1_COLOR_4
;     GL_MAP1_INDEX
;     GL_MAP1_NORMAL
;     GL_MAP1_TEXTURE_COORD_1
;     GL_MAP1_TEXTURE_COORD_2
;     GL_MAP1_TEXTURE_COORD_3
;     GL_MAP1_TEXTURE_COORD_4
;     GL_MAP1_VERTEX_3
;     GL_MAP1_VERTEX_4
;     GL_MAP2_COLOR_4
;     GL_MAP2_INDEX
;     GL_MAP2_NORMAL
;     GL_MAP2_TEXTURE_COORD_1
;     GL_MAP2_TEXTURE_COORD_2
;     GL_MAP2_TEXTURE_COORD_3
;     GL_MAP2_TEXTURE_COORD_4
;     GL_MAP2_VERTEX_3
;     GL_MAP2_VERTEX_4

;MaterialFace
;     GL_FRONT
;     GL_BACK
;     GL_FRONT_AND_BACK

;MaterialParameter
GL_EMISSION                       := 0x1600
GL_SHININESS                      := 0x1601
GL_AMBIENT_AND_DIFFUSE            := 0x1602
GL_COLOR_INDEXES                  := 0x1603
;     GL_AMBIENT
;     GL_DIFFUSE
;     GL_SPECULAR

;MatrixMode
GL_MODELVIEW                      := 0x1700
GL_PROJECTION                     := 0x1701
GL_TEXTURE                        := 0x1702

;MeshMode1
;     GL_POINT
;     GL_LINE

;MeshMode2
;     GL_POINT
;     GL_LINE
;     GL_FILL

;NormalPointerType
;     GL_BYTE
;     GL_SHORT
;     GL_INT
;     GL_FLOAT
;     GL_DOUBLE

;PixelCopyType
GL_COLOR                          := 0x1800
GL_DEPTH                          := 0x1801
GL_STENCIL                        := 0x1802

;PixelFormat
GL_COLOR_INDEX                    := 0x1900
GL_STENCIL_INDEX                  := 0x1901
GL_DEPTH_COMPONENT                := 0x1902
GL_RED                            := 0x1903
GL_GREEN                          := 0x1904
GL_BLUE                           := 0x1905
GL_ALPHA                          := 0x1906
GL_RGB                            := 0x1907
GL_RGBA                           := 0x1908
GL_LUMINANCE                      := 0x1909
GL_LUMINANCE_ALPHA                := 0x190A

;PixelMap
;     GL_PIXEL_MAP_I_TO_I
;     GL_PIXEL_MAP_S_TO_S
;     GL_PIXEL_MAP_I_TO_R
;     GL_PIXEL_MAP_I_TO_G
;     GL_PIXEL_MAP_I_TO_B
;     GL_PIXEL_MAP_I_TO_A
;     GL_PIXEL_MAP_R_TO_R
;     GL_PIXEL_MAP_G_TO_G
;     GL_PIXEL_MAP_B_TO_B
;     GL_PIXEL_MAP_A_TO_A

;PixelStore
;     GL_UNPACK_SWAP_BYTES
;     GL_UNPACK_LSB_FIRST
;     GL_UNPACK_ROW_LENGTH
;     GL_UNPACK_SKIP_ROWS
;     GL_UNPACK_SKIP_PIXELS
;     GL_UNPACK_ALIGNMENT
;     GL_PACK_SWAP_BYTES
;     GL_PACK_LSB_FIRST
;     GL_PACK_ROW_LENGTH
;     GL_PACK_SKIP_ROWS
;     GL_PACK_SKIP_PIXELS
;     GL_PACK_ALIGNMENT

;PixelTransfer
;     GL_MAP_COLOR
;     GL_MAP_STENCIL
;     GL_INDEX_SHIFT
;     GL_INDEX_OFFSET
;     GL_RED_SCALE
;     GL_RED_BIAS
;     GL_GREEN_SCALE
;     GL_GREEN_BIAS
;     GL_BLUE_SCALE
;     GL_BLUE_BIAS
;     GL_ALPHA_SCALE
;     GL_ALPHA_BIAS
;     GL_DEPTH_SCALE
;     GL_DEPTH_BIAS

;PixelType
GL_BITMAP                         := 0x1A00
;     GL_BYTE
;     GL_UNSIGNED_BYTE
;     GL_SHORT
;     GL_UNSIGNED_SHORT
;     GL_INT
;     GL_UNSIGNED_INT
;     GL_FLOAT

;PolygonMode
GL_POINT                          := 0x1B00
GL_LINE                           := 0x1B01
GL_FILL                           := 0x1B02

;ReadBufferMode
;     GL_FRONT_LEFT
;     GL_FRONT_RIGHT
;     GL_BACK_LEFT
;     GL_BACK_RIGHT
;     GL_FRONT
;     GL_BACK
;     GL_LEFT
;     GL_RIGHT
;     GL_AUX0
;     GL_AUX1
;     GL_AUX2
;     GL_AUX3

;RenderingMode
GL_RENDER                         := 0x1C00
GL_FEEDBACK                       := 0x1C01
GL_SELECT                         := 0x1C02

;ShadingModel
GL_FLAT                           := 0x1D00
GL_SMOOTH                         := 0x1D01


;StencilFunction
;     GL_NEVER
;     GL_LESS
;     GL_EQUAL
;     GL_LEQUAL
;     GL_GREATER
;     GL_NOTEQUAL
;     GL_GEQUAL
;     GL_ALWAYS

;StencilOp
;     GL_ZERO
GL_KEEP                           := 0x1E00
GL_REPLACE                        := 0x1E01
GL_INCR                           := 0x1E02
GL_DECR                           := 0x1E03
;     GL_INVERT

;StringName
GL_VENDOR                         := 0x1F00
GL_RENDERER                       := 0x1F01
GL_VERSION                        := 0x1F02
GL_EXTENSIONS                     := 0x1F03

;TextureCoordName
GL_S                              := 0x2000
GL_T                              := 0x2001
GL_R                              := 0x2002
GL_Q                              := 0x2003

;TexCoordPointerType
;     GL_SHORT
;     GL_INT
;     GL_FLOAT
;     GL_DOUBLE

;TextureEnvMode
GL_MODULATE                       := 0x2100
GL_DECAL                          := 0x2101
;     GL_BLEND
;     GL_REPLACE

;TextureEnvParameter
GL_TEXTURE_ENV_MODE               := 0x2200
GL_TEXTURE_ENV_COLOR              := 0x2201

;TextureEnvTarget
GL_TEXTURE_ENV                    := 0x2300

;TextureGenMode
GL_EYE_LINEAR                     := 0x2400
GL_OBJECT_LINEAR                  := 0x2401
GL_SPHERE_MAP                     := 0x2402

;TextureGenParameter
GL_TEXTURE_GEN_MODE               := 0x2500
GL_OBJECT_PLANE                   := 0x2501
GL_EYE_PLANE                      := 0x2502

;TextureMagFilter
GL_NEAREST                        := 0x2600
GL_LINEAR                         := 0x2601

;TextureMinFilter
;     GL_NEAREST
;     GL_LINEAR
GL_NEAREST_MIPMAP_NEAREST         := 0x2700
GL_LINEAR_MIPMAP_NEAREST          := 0x2701
GL_NEAREST_MIPMAP_LINEAR          := 0x2702
GL_LINEAR_MIPMAP_LINEAR           := 0x2703

;TextureParameterName
GL_TEXTURE_MAG_FILTER             := 0x2800
GL_TEXTURE_MIN_FILTER             := 0x2801
GL_TEXTURE_WRAP_S                 := 0x2802
GL_TEXTURE_WRAP_T                 := 0x2803
;     GL_TEXTURE_BORDER_COLOR
;     GL_TEXTURE_PRIORITY

;TextureTarget
;     GL_TEXTURE_1D
;     GL_TEXTURE_2D
;     GL_PROXY_TEXTURE_1D
;     GL_PROXY_TEXTURE_2D

;TextureWrapMode
GL_CLAMP                          := 0x2900
GL_REPEAT                         := 0x2901

;VertexPointerType
;     GL_SHORT
;     GL_INT
;     GL_FLOAT
;     GL_DOUBLE

;ClientAttribMask
GL_CLIENT_PIXEL_STORE_BIT         := 0x00000001
GL_CLIENT_VERTEX_ARRAY_BIT        := 0x00000002
GL_CLIENT_ALL_ATTRIB_BITS         := 0xffffffff

;polygon_offset
GL_POLYGON_OFFSET_FACTOR          := 0x8038
GL_POLYGON_OFFSET_UNITS           := 0x2A00
GL_POLYGON_OFFSET_POINT           := 0x2A01
GL_POLYGON_OFFSET_LINE            := 0x2A02
GL_POLYGON_OFFSET_FILL            := 0x8037

;texture
GL_ALPHA4                         := 0x803B
GL_ALPHA8                         := 0x803C
GL_ALPHA12                        := 0x803D
GL_ALPHA16                        := 0x803E
GL_LUMINANCE4                     := 0x803F
GL_LUMINANCE8                     := 0x8040
GL_LUMINANCE12                    := 0x8041
GL_LUMINANCE16                    := 0x8042
GL_LUMINANCE4_ALPHA4              := 0x8043
GL_LUMINANCE6_ALPHA2              := 0x8044
GL_LUMINANCE8_ALPHA8              := 0x8045
GL_LUMINANCE12_ALPHA4             := 0x8046
GL_LUMINANCE12_ALPHA12            := 0x8047
GL_LUMINANCE16_ALPHA16            := 0x8048
GL_INTENSITY                      := 0x8049
GL_INTENSITY4                     := 0x804A
GL_INTENSITY8                     := 0x804B
GL_INTENSITY12                    := 0x804C
GL_INTENSITY16                    := 0x804D
GL_R3_G3_B2                       := 0x2A10
GL_RGB4                           := 0x804F
GL_RGB5                           := 0x8050
GL_RGB8                           := 0x8051
GL_RGB10                          := 0x8052
GL_RGB12                          := 0x8053
GL_RGB16                          := 0x8054
GL_RGBA2                          := 0x8055
GL_RGBA4                          := 0x8056
GL_RGB5_A1                        := 0x8057
GL_RGBA8                          := 0x8058
GL_RGB10_A2                       := 0x8059
GL_RGBA12                         := 0x805A
GL_RGBA16                         := 0x805B
GL_TEXTURE_RED_SIZE               := 0x805C
GL_TEXTURE_GREEN_SIZE             := 0x805D
GL_TEXTURE_BLUE_SIZE              := 0x805E
GL_TEXTURE_ALPHA_SIZE             := 0x805F
GL_TEXTURE_LUMINANCE_SIZE         := 0x8060
GL_TEXTURE_INTENSITY_SIZE         := 0x8061
GL_PROXY_TEXTURE_1D               := 0x8063
GL_PROXY_TEXTURE_2D               := 0x8064

;texture_object
GL_TEXTURE_PRIORITY               := 0x8066
GL_TEXTURE_RESIDENT               := 0x8067
GL_TEXTURE_BINDING_1D             := 0x8068
GL_TEXTURE_BINDING_2D             := 0x8069

;vertex_array
GL_VERTEX_ARRAY                   := 0x8074
GL_NORMAL_ARRAY                   := 0x8075
GL_COLOR_ARRAY                    := 0x8076
GL_INDEX_ARRAY                    := 0x8077
GL_TEXTURE_COORD_ARRAY            := 0x8078
GL_EDGE_FLAG_ARRAY                := 0x8079
GL_VERTEX_ARRAY_SIZE              := 0x807A
GL_VERTEX_ARRAY_TYPE              := 0x807B
GL_VERTEX_ARRAY_STRIDE            := 0x807C
GL_NORMAL_ARRAY_TYPE              := 0x807E
GL_NORMAL_ARRAY_STRIDE            := 0x807F
GL_COLOR_ARRAY_SIZE               := 0x8081
GL_COLOR_ARRAY_TYPE               := 0x8082
GL_COLOR_ARRAY_STRIDE             := 0x8083
GL_INDEX_ARRAY_TYPE               := 0x8085
GL_INDEX_ARRAY_STRIDE             := 0x8086
GL_TEXTURE_COORD_ARRAY_SIZE       := 0x8088
GL_TEXTURE_COORD_ARRAY_TYPE       := 0x8089
GL_TEXTURE_COORD_ARRAY_STRIDE     := 0x808A
GL_EDGE_FLAG_ARRAY_STRIDE         := 0x808C
GL_VERTEX_ARRAY_POINTER           := 0x808E
GL_NORMAL_ARRAY_POINTER           := 0x808F
GL_COLOR_ARRAY_POINTER            := 0x8090
GL_INDEX_ARRAY_POINTER            := 0x8091
GL_TEXTURE_COORD_ARRAY_POINTER    := 0x8092
GL_EDGE_FLAG_ARRAY_POINTER        := 0x8093
GL_V2F                            := 0x2A20
GL_V3F                            := 0x2A21
GL_C4UB_V2F                       := 0x2A22
GL_C4UB_V3F                       := 0x2A23
GL_C3F_V3F                        := 0x2A24
GL_N3F_V3F                        := 0x2A25
GL_C4F_N3F_V3F                    := 0x2A26
GL_T2F_V3F                        := 0x2A27
GL_T4F_V4F                        := 0x2A28
GL_T2F_C4UB_V3F                   := 0x2A29
GL_T2F_C3F_V3F                    := 0x2A2A
GL_T2F_N3F_V3F                    := 0x2A2B
GL_T2F_C4F_N3F_V3F                := 0x2A2C
GL_T4F_C4F_N3F_V4F                := 0x2A2D

;Extensions
GL_EXT_vertex_array               := 1
GL_EXT_bgra                       := 1
GL_EXT_paletted_texture           := 1
GL_WIN_swap_hint                  := 1
GL_WIN_draw_range_elements        := 1
; GL_WIN_phong_shading              := 1
; GL_WIN_specular_fog               := 1

;EXT_vertex_array
GL_VERTEX_ARRAY_EXT               := 0x8074
GL_NORMAL_ARRAY_EXT               := 0x8075
GL_COLOR_ARRAY_EXT                := 0x8076
GL_INDEX_ARRAY_EXT                := 0x8077
GL_TEXTURE_COORD_ARRAY_EXT        := 0x8078
GL_EDGE_FLAG_ARRAY_EXT            := 0x8079
GL_VERTEX_ARRAY_SIZE_EXT          := 0x807A
GL_VERTEX_ARRAY_TYPE_EXT          := 0x807B
GL_VERTEX_ARRAY_STRIDE_EXT        := 0x807C
GL_VERTEX_ARRAY_COUNT_EXT         := 0x807D
GL_NORMAL_ARRAY_TYPE_EXT          := 0x807E
GL_NORMAL_ARRAY_STRIDE_EXT        := 0x807F
GL_NORMAL_ARRAY_COUNT_EXT         := 0x8080
GL_COLOR_ARRAY_SIZE_EXT           := 0x8081
GL_COLOR_ARRAY_TYPE_EXT           := 0x8082
GL_COLOR_ARRAY_STRIDE_EXT         := 0x8083
GL_COLOR_ARRAY_COUNT_EXT          := 0x8084
GL_INDEX_ARRAY_TYPE_EXT           := 0x8085
GL_INDEX_ARRAY_STRIDE_EXT         := 0x8086
GL_INDEX_ARRAY_COUNT_EXT          := 0x8087
GL_TEXTURE_COORD_ARRAY_SIZE_EXT   := 0x8088
GL_TEXTURE_COORD_ARRAY_TYPE_EXT   := 0x8089
GL_TEXTURE_COORD_ARRAY_STRIDE_EXT := 0x808A
GL_TEXTURE_COORD_ARRAY_COUNT_EXT  := 0x808B
GL_EDGE_FLAG_ARRAY_STRIDE_EXT     := 0x808C
GL_EDGE_FLAG_ARRAY_COUNT_EXT      := 0x808D
GL_VERTEX_ARRAY_POINTER_EXT       := 0x808E
GL_NORMAL_ARRAY_POINTER_EXT       := 0x808F
GL_COLOR_ARRAY_POINTER_EXT        := 0x8090
GL_INDEX_ARRAY_POINTER_EXT        := 0x8091
GL_TEXTURE_COORD_ARRAY_POINTER_EXT := 0x8092
GL_EDGE_FLAG_ARRAY_POINTER_EXT    := 0x8093
GL_DOUBLE_EXT                     := GL_DOUBLE

;EXT_bgra
GL_BGR_EXT                        := 0x80E0
GL_BGRA_EXT                       := 0x80E1

;EXT_paletted_texture

;These must match the GL_COLOR_TABLE_*_SGI enumerants
GL_COLOR_TABLE_FORMAT_EXT         := 0x80D8
GL_COLOR_TABLE_WIDTH_EXT          := 0x80D9
GL_COLOR_TABLE_RED_SIZE_EXT       := 0x80DA
GL_COLOR_TABLE_GREEN_SIZE_EXT     := 0x80DB
GL_COLOR_TABLE_BLUE_SIZE_EXT      := 0x80DC
GL_COLOR_TABLE_ALPHA_SIZE_EXT     := 0x80DD
GL_COLOR_TABLE_LUMINANCE_SIZE_EXT := 0x80DE
GL_COLOR_TABLE_INTENSITY_SIZE_EXT := 0x80DF

GL_COLOR_INDEX1_EXT               := 0x80E2
GL_COLOR_INDEX2_EXT               := 0x80E3
GL_COLOR_INDEX4_EXT               := 0x80E4
GL_COLOR_INDEX8_EXT               := 0x80E5
GL_COLOR_INDEX12_EXT              := 0x80E6
GL_COLOR_INDEX16_EXT              := 0x80E7

;WIN_draw_range_elements
GL_MAX_ELEMENTS_VERTICES_WIN      := 0x80E8
GL_MAX_ELEMENTS_INDICES_WIN       := 0x80E9

;WIN_phong_shading
GL_PHONG_WIN                      := 0x80EA 
GL_PHONG_HINT_WIN                 := 0x80EB 

;WIN_specular_fog
GL_FOG_SPECULAR_TEXTURE_WIN       := 0x80EC

;For compatibility with OpenGL v1.0
GL_LOGIC_OP := GL_INDEX_LOGIC_OP
GL_TEXTURE_COMPONENTS := GL_TEXTURE_INTERNAL_FORMAT

;=============================================================

PFNGLACCUMPROC := "opengl32\glAccum"
PFNGLALPHAFUNCPROC := "opengl32\glAlphaFunc"
PFNGLARETEXTURESRESIDENTPROC := "opengl32\glAreTexturesResident"
PFNGLARRAYELEMENTPROC := "opengl32\glArrayElement"
PFNGLBEGINPROC := "opengl32\glBegin"
PFNGLBINDTEXTUREPROC := "opengl32\glBindTexture"
PFNGLBITMAPPROC := "opengl32\glBitmap"
PFNGLBLENDFUNCPROC := "opengl32\glBlendFunc"
PFNGLCALLLISTPROC := "opengl32\glCallList"
PFNGLCALLLISTSPROC := "opengl32\glCallLists"
PFNGLCLEARPROC := "opengl32\glClear"
PFNGLCLEARACCUMPROC := "opengl32\glClearAccum"
PFNGLCLEARCOLORPROC := "opengl32\glClearColor"
PFNGLCLEARDEPTHPROC := "opengl32\glClearDepth"
PFNGLCLEARINDEXPROC := "opengl32\glClearIndex"
PFNGLCLEARSTENCILPROC := "opengl32\glClearStencil"
PFNGLCLIPPLANEPROC := "opengl32\glClipPlane"
PFNGLCOLOR3BPROC := "opengl32\glColor3b"
PFNGLCOLOR3BVPROC := "opengl32\glColor3bv"
PFNGLCOLOR3DPROC := "opengl32\glColor3d"
PFNGLCOLOR3DVPROC := "opengl32\glColor3dv"
PFNGLCOLOR3FPROC := "opengl32\glColor3f"
PFNGLCOLOR3FVPROC := "opengl32\glColor3fv"
PFNGLCOLOR3IPROC := "opengl32\glColor3i"
PFNGLCOLOR3IVPROC := "opengl32\glColor3iv"
PFNGLCOLOR3SPROC := "opengl32\glColor3s"
PFNGLCOLOR3SVPROC := "opengl32\glColor3sv"
PFNGLCOLOR3UBPROC := "opengl32\glColor3ub"
PFNGLCOLOR3UBVPROC := "opengl32\glColor3ubv"
PFNGLCOLOR3UIPROC := "opengl32\glColor3ui"
PFNGLCOLOR3UIVPROC := "opengl32\glColor3uiv"
PFNGLCOLOR3USPROC := "opengl32\glColor3us"
PFNGLCOLOR3USVPROC := "opengl32\glColor3usv"
PFNGLCOLOR4BPROC := "opengl32\glColor4b"
PFNGLCOLOR4BVPROC := "opengl32\glColor4bv"
PFNGLCOLOR4DPROC := "opengl32\glColor4d"
PFNGLCOLOR4DVPROC := "opengl32\glColor4dv"
PFNGLCOLOR4FPROC := "opengl32\glColor4f"
PFNGLCOLOR4FVPROC := "opengl32\glColor4fv"
PFNGLCOLOR4IPROC := "opengl32\glColor4i"
PFNGLCOLOR4IVPROC := "opengl32\glColor4iv"
PFNGLCOLOR4SPROC := "opengl32\glColor4s"
PFNGLCOLOR4SVPROC := "opengl32\glColor4sv"
PFNGLCOLOR4UBPROC := "opengl32\glColor4ub"
PFNGLCOLOR4UBVPROC := "opengl32\glColor4ubv"
PFNGLCOLOR4UIPROC := "opengl32\glColor4ui"
PFNGLCOLOR4UIVPROC := "opengl32\glColor4uiv"
PFNGLCOLOR4USPROC := "opengl32\glColor4us"
PFNGLCOLOR4USVPROC := "opengl32\glColor4usv"
PFNGLCOLORMASKPROC := "opengl32\glColorMask"
PFNGLCOLORMATERIALPROC := "opengl32\glColorMaterial"
PFNGLCOLORPOINTERPROC := "opengl32\glColorPointer"
PFNGLCOPYPIXELSPROC := "opengl32\glCopyPixels"
PFNGLCOPYTEXIMAGE1DPROC := "opengl32\glCopyTexImage1D"
PFNGLCOPYTEXIMAGE2DPROC := "opengl32\glCopyTexImage2D"
PFNGLCOPYTEXSUBIMAGE1DPROC := "opengl32\glCopyTexSubImage1D"
PFNGLCOPYTEXSUBIMAGE2DPROC := "opengl32\glCopyTexSubImage2D"
PFNGLCULLFACEPROC := "opengl32\glCullFace"
PFNGLDELETELISTSPROC := "opengl32\glDeleteLists"
PFNGLDELETETEXTURESPROC := "opengl32\glDeleteTextures"
PFNGLDEPTHFUNCPROC := "opengl32\glDepthFunc"
PFNGLDEPTHMASKPROC := "opengl32\glDepthMask"
PFNGLDEPTHRANGEPROC := "opengl32\glDepthRange"
PFNGLDISABLEPROC := "opengl32\glDisable"
PFNGLDISABLECLIENTSTATEPROC := "opengl32\glDisableClientState"
PFNGLDRAWARRAYSPROC := "opengl32\glDrawArrays"
PFNGLDRAWBUFFERPROC := "opengl32\glDrawBuffer"
PFNGLDRAWELEMENTSPROC := "opengl32\glDrawElements"
PFNGLDRAWPIXELSPROC := "opengl32\glDrawPixels"
PFNGLEDGEFLAGPROC := "opengl32\glEdgeFlag"
PFNGLEDGEFLAGPOINTERPROC := "opengl32\glEdgeFlagPointer"
PFNGLEDGEFLAGVPROC := "opengl32\glEdgeFlagv"
PFNGLENABLEPROC := "opengl32\glEnable"
PFNGLENABLECLIENTSTATEPROC := "opengl32\glEnableClientState"
PFNGLENDPROC := "opengl32\glEnd"
PFNGLENDLISTPROC := "opengl32\glEndList"
PFNGLEVALCOORD1DPROC := "opengl32\glEvalCoord1d"
PFNGLEVALCOORD1DVPROC := "opengl32\glEvalCoord1dv"
PFNGLEVALCOORD1FPROC := "opengl32\glEvalCoord1f"
PFNGLEVALCOORD1FVPROC := "opengl32\glEvalCoord1fv"
PFNGLEVALCOORD2DPROC := "opengl32\glEvalCoord2d"
PFNGLEVALCOORD2DVPROC := "opengl32\glEvalCoord2dv"
PFNGLEVALCOORD2FPROC := "opengl32\glEvalCoord2f"
PFNGLEVALCOORD2FVPROC := "opengl32\glEvalCoord2fv"
PFNGLEVALMESH1PROC := "opengl32\glEvalMesh1"
PFNGLEVALMESH2PROC := "opengl32\glEvalMesh2"
PFNGLEVALPOINT1PROC := "opengl32\glEvalPoint1"
PFNGLEVALPOINT2PROC := "opengl32\glEvalPoint2"
PFNGLFEEDBACKBUFFERPROC := "opengl32\glFeedbackBuffer"
PFNGLFINISHPROC := "opengl32\glFinish"
PFNGLFLUSHPROC := "opengl32\glFlush"
PFNGLFOGFPROC := "opengl32\glFogf"
PFNGLFOGFVPROC := "opengl32\glFogfv"
PFNGLFOGIPROC := "opengl32\glFogi"
PFNGLFOGIVPROC := "opengl32\glFogiv"
PFNGLFRONTFACEPROC := "opengl32\glFrontFace"
PFNGLFRUSTUMPROC := "opengl32\glFrustum"
PFNGLGENLISTSPROC := "opengl32\glGenLists"
PFNGLGENTEXTURESPROC := "opengl32\glGenTextures"
PFNGLGETBOOLEANVPROC := "opengl32\glGetBooleanv"
PFNGLGETCLIPPLANEPROC := "opengl32\glGetClipPlane"
PFNGLGETDOUBLEVPROC := "opengl32\glGetDoublev"
PFNGLGETERRORPROC := "opengl32\glGetError"
PFNGLGETFLOATVPROC := "opengl32\glGetFloatv"
PFNGLGETINTEGERVPROC := "opengl32\glGetIntegerv"
PFNGLGETLIGHTFVPROC := "opengl32\glGetLightfv"
PFNGLGETLIGHTIVPROC := "opengl32\glGetLightiv"
PFNGLGETMAPDVPROC := "opengl32\glGetMapdv"
PFNGLGETMAPFVPROC := "opengl32\glGetMapfv"
PFNGLGETMAPIVPROC := "opengl32\glGetMapiv"
PFNGLGETMATERIALFVPROC := "opengl32\glGetMaterialfv"
PFNGLGETMATERIALIVPROC := "opengl32\glGetMaterialiv"
PFNGLGETPIXELMAPFVPROC := "opengl32\glGetPixelMapfv"
PFNGLGETPIXELMAPUIVPROC := "opengl32\glGetPixelMapuiv"
PFNGLGETPIXELMAPUSVPROC := "opengl32\glGetPixelMapusv"
PFNGLGETPOINTERVPROC := "opengl32\glGetPointerv"
PFNGLGETPOLYGONSTIPPLEPROC := "opengl32\glGetPolygonStipple"
PFNGLGETSTRINGPROC := "opengl32\glGetString"
PFNGLGETTEXENVFVPROC := "opengl32\glGetTexEnvfv"
PFNGLGETTEXENVIVPROC := "opengl32\glGetTexEnviv"
PFNGLGETTEXGENDVPROC := "opengl32\glGetTexGendv"
PFNGLGETTEXGENFVPROC := "opengl32\glGetTexGenfv"
PFNGLGETTEXGENIVPROC := "opengl32\glGetTexGeniv"
PFNGLGETTEXIMAGEPROC := "opengl32\glGetTexImage"
PFNGLGETTEXLEVELPARAMETERFVPROC := "opengl32\glGetTexLevelParameterfv"
PFNGLGETTEXLEVELPARAMETERIVPROC := "opengl32\glGetTexLevelParameteriv"
PFNGLGETTEXPARAMETERFVPROC := "opengl32\glGetTexParameterfv"
PFNGLGETTEXPARAMETERIVPROC := "opengl32\glGetTexParameteriv"
PFNGLHINTPROC := "opengl32\glHint"
PFNGLINDEXMASKPROC := "opengl32\glIndexMask"
PFNGLINDEXPOINTERPROC := "opengl32\glIndexPointer"
PFNGLINDEXDPROC := "opengl32\glIndexd"
PFNGLINDEXDVPROC := "opengl32\glIndexdv"
PFNGLINDEXFPROC := "opengl32\glIndexf"
PFNGLINDEXFVPROC := "opengl32\glIndexfv"
PFNGLINDEXIPROC := "opengl32\glIndexi"
PFNGLINDEXIVPROC := "opengl32\glIndexiv"
PFNGLINDEXSPROC := "opengl32\glIndexs"
PFNGLINDEXSVPROC := "opengl32\glIndexsv"
PFNGLINDEXUBPROC := "opengl32\glIndexub"
PFNGLINDEXUBVPROC := "opengl32\glIndexubv"
PFNGLINITNAMESPROC := "opengl32\glInitNames"
PFNGLINTERLEAVEDARRAYSPROC := "opengl32\glInterleavedArrays"
PFNGLISENABLEDPROC := "opengl32\glIsEnabled"
PFNGLISLISTPROC := "opengl32\glIsList"
PFNGLISTEXTUREPROC := "opengl32\glIsTexture"
PFNGLLIGHTMODELFPROC := "opengl32\glLightModelf"
PFNGLLIGHTMODELFVPROC := "opengl32\glLightModelfv"
PFNGLLIGHTMODELIPROC := "opengl32\glLightModeli"
PFNGLLIGHTMODELIVPROC := "opengl32\glLightModeliv"
PFNGLLIGHTFPROC := "opengl32\glLightf"
PFNGLLIGHTFVPROC := "opengl32\glLightfv"
PFNGLLIGHTIPROC := "opengl32\glLighti"
PFNGLLIGHTIVPROC := "opengl32\glLightiv"
PFNGLLINESTIPPLEPROC := "opengl32\glLineStipple"
PFNGLLINEWIDTHPROC := "opengl32\glLineWidth"
PFNGLLISTBASEPROC := "opengl32\glListBase"
PFNGLLOADIDENTITYPROC := "opengl32\glLoadIdentity"
PFNGLLOADMATRIXDPROC := "opengl32\glLoadMatrixd"
PFNGLLOADMATRIXFPROC := "opengl32\glLoadMatrixf"
PFNGLLOADNAMEPROC := "opengl32\glLoadName"
PFNGLLOGICOPPROC := "opengl32\glLogicOp"
PFNGLMAP1DPROC := "opengl32\glMap1d"
PFNGLMAP1FPROC := "opengl32\glMap1f"
PFNGLMAP2DPROC := "opengl32\glMap2d"
PFNGLMAP2FPROC := "opengl32\glMap2f"
PFNGLMAPGRID1DPROC := "opengl32\glMapGrid1d"
PFNGLMAPGRID1FPROC := "opengl32\glMapGrid1f"
PFNGLMAPGRID2DPROC := "opengl32\glMapGrid2d"
PFNGLMAPGRID2FPROC := "opengl32\glMapGrid2f"
PFNGLMATERIALFPROC := "opengl32\glMaterialf"
PFNGLMATERIALFVPROC := "opengl32\glMaterialfv"
PFNGLMATERIALIPROC := "opengl32\glMateriali"
PFNGLMATERIALIVPROC := "opengl32\glMaterialiv"
PFNGLMATRIXMODEPROC := "opengl32\glMatrixMode"
PFNGLMULTMATRIXDPROC := "opengl32\glMultMatrixd"
PFNGLMULTMATRIXFPROC := "opengl32\glMultMatrixf"
PFNGLNEWLISTPROC := "opengl32\glNewList"
PFNGLNORMAL3BPROC := "opengl32\glNormal3b"
PFNGLNORMAL3BVPROC := "opengl32\glNormal3bv"
PFNGLNORMAL3DPROC := "opengl32\glNormal3d"
PFNGLNORMAL3DVPROC := "opengl32\glNormal3dv"
PFNGLNORMAL3FPROC := "opengl32\glNormal3f"
PFNGLNORMAL3FVPROC := "opengl32\glNormal3fv"
PFNGLNORMAL3IPROC := "opengl32\glNormal3i"
PFNGLNORMAL3IVPROC := "opengl32\glNormal3iv"
PFNGLNORMAL3SPROC := "opengl32\glNormal3s"
PFNGLNORMAL3SVPROC := "opengl32\glNormal3sv"
PFNGLNORMALPOINTERPROC := "opengl32\glNormalPointer"
PFNGLORTHOPROC := "opengl32\glOrtho"
PFNGLPASSTHROUGHPROC := "opengl32\glPassThrough"
PFNGLPIXELMAPFVPROC := "opengl32\glPixelMapfv"
PFNGLPIXELMAPUIVPROC := "opengl32\glPixelMapuiv"
PFNGLPIXELMAPUSVPROC := "opengl32\glPixelMapusv"
PFNGLPIXELSTOREFPROC := "opengl32\glPixelStoref"
PFNGLPIXELSTOREIPROC := "opengl32\glPixelStorei"
PFNGLPIXELTRANSFERFPROC := "opengl32\glPixelTransferf"
PFNGLPIXELTRANSFERIPROC := "opengl32\glPixelTransferi"
PFNGLPIXELZOOMPROC := "opengl32\glPixelZoom"
PFNGLPOINTSIZEPROC := "opengl32\glPointSize"
PFNGLPOLYGONMODEPROC := "opengl32\glPolygonMode"
PFNGLPOLYGONOFFSETPROC := "opengl32\glPolygonOffset"
PFNGLPOLYGONSTIPPLEPROC := "opengl32\glPolygonStipple"
PFNGLPOPATTRIBPROC := "opengl32\glPopAttrib"
PFNGLPOPCLIENTATTRIBPROC := "opengl32\glPopClientAttrib"
PFNGLPOPMATRIXPROC := "opengl32\glPopMatrix"
PFNGLPOPNAMEPROC := "opengl32\glPopName"
PFNGLPRIORITIZETEXTURESPROC := "opengl32\glPrioritizeTextures"
PFNGLPUSHATTRIBPROC := "opengl32\glPushAttrib"
PFNGLPUSHCLIENTATTRIBPROC := "opengl32\glPushClientAttrib"
PFNGLPUSHMATRIXPROC := "opengl32\glPushMatrix"
PFNGLPUSHNAMEPROC := "opengl32\glPushName"
PFNGLRASTERPOS2DPROC := "opengl32\glRasterPos2d"
PFNGLRASTERPOS2DVPROC := "opengl32\glRasterPos2dv"
PFNGLRASTERPOS2FPROC := "opengl32\glRasterPos2f"
PFNGLRASTERPOS2FVPROC := "opengl32\glRasterPos2fv"
PFNGLRASTERPOS2IPROC := "opengl32\glRasterPos2i"
PFNGLRASTERPOS2IVPROC := "opengl32\glRasterPos2iv"
PFNGLRASTERPOS2SPROC := "opengl32\glRasterPos2s"
PFNGLRASTERPOS2SVPROC := "opengl32\glRasterPos2sv"
PFNGLRASTERPOS3DPROC := "opengl32\glRasterPos3d"
PFNGLRASTERPOS3DVPROC := "opengl32\glRasterPos3dv"
PFNGLRASTERPOS3FPROC := "opengl32\glRasterPos3f"
PFNGLRASTERPOS3FVPROC := "opengl32\glRasterPos3fv"
PFNGLRASTERPOS3IPROC := "opengl32\glRasterPos3i"
PFNGLRASTERPOS3IVPROC := "opengl32\glRasterPos3iv"
PFNGLRASTERPOS3SPROC := "opengl32\glRasterPos3s"
PFNGLRASTERPOS3SVPROC := "opengl32\glRasterPos3sv"
PFNGLRASTERPOS4DPROC := "opengl32\glRasterPos4d"
PFNGLRASTERPOS4DVPROC := "opengl32\glRasterPos4dv"
PFNGLRASTERPOS4FPROC := "opengl32\glRasterPos4f"
PFNGLRASTERPOS4FVPROC := "opengl32\glRasterPos4fv"
PFNGLRASTERPOS4IPROC := "opengl32\glRasterPos4i"
PFNGLRASTERPOS4IVPROC := "opengl32\glRasterPos4iv"
PFNGLRASTERPOS4SPROC := "opengl32\glRasterPos4s"
PFNGLRASTERPOS4SVPROC := "opengl32\glRasterPos4sv"
PFNGLREADBUFFERPROC := "opengl32\glReadBuffer"
PFNGLREADPIXELSPROC := "opengl32\glReadPixels"
PFNGLRECTDPROC := "opengl32\glRectd"
PFNGLRECTDVPROC := "opengl32\glRectdv"
PFNGLRECTFPROC := "opengl32\glRectf"
PFNGLRECTFVPROC := "opengl32\glRectfv"
PFNGLRECTIPROC := "opengl32\glRecti"
PFNGLRECTIVPROC := "opengl32\glRectiv"
PFNGLRECTSPROC := "opengl32\glRects"
PFNGLRECTSVPROC := "opengl32\glRectsv"
PFNGLRENDERMODEPROC := "opengl32\glRenderMode"
PFNGLROTATEDPROC := "opengl32\glRotated"
PFNGLROTATEFPROC := "opengl32\glRotatef"
PFNGLSCALEDPROC := "opengl32\glScaled"
PFNGLSCALEFPROC := "opengl32\glScalef"
PFNGLSCISSORPROC := "opengl32\glScissor"
PFNGLSELECTBUFFERPROC := "opengl32\glSelectBuffer"
PFNGLSHADEMODELPROC := "opengl32\glShadeModel"
PFNGLSTENCILFUNCPROC := "opengl32\glStencilFunc"
PFNGLSTENCILMASKPROC := "opengl32\glStencilMask"
PFNGLSTENCILOPPROC := "opengl32\glStencilOp"
PFNGLTEXCOORD1DPROC := "opengl32\glTexCoord1d"
PFNGLTEXCOORD1DVPROC := "opengl32\glTexCoord1dv"
PFNGLTEXCOORD1FPROC := "opengl32\glTexCoord1f"
PFNGLTEXCOORD1FVPROC := "opengl32\glTexCoord1fv"
PFNGLTEXCOORD1IPROC := "opengl32\glTexCoord1i"
PFNGLTEXCOORD1IVPROC := "opengl32\glTexCoord1iv"
PFNGLTEXCOORD1SPROC := "opengl32\glTexCoord1s"
PFNGLTEXCOORD1SVPROC := "opengl32\glTexCoord1sv"
PFNGLTEXCOORD2DPROC := "opengl32\glTexCoord2d"
PFNGLTEXCOORD2DVPROC := "opengl32\glTexCoord2dv"
PFNGLTEXCOORD2FPROC := "opengl32\glTexCoord2f"
PFNGLTEXCOORD2FVPROC := "opengl32\glTexCoord2fv"
PFNGLTEXCOORD2IPROC := "opengl32\glTexCoord2i"
PFNGLTEXCOORD2IVPROC := "opengl32\glTexCoord2iv"
PFNGLTEXCOORD2SPROC := "opengl32\glTexCoord2s"
PFNGLTEXCOORD2SVPROC := "opengl32\glTexCoord2sv"
PFNGLTEXCOORD3DPROC := "opengl32\glTexCoord3d"
PFNGLTEXCOORD3DVPROC := "opengl32\glTexCoord3dv"
PFNGLTEXCOORD3FPROC := "opengl32\glTexCoord3f"
PFNGLTEXCOORD3FVPROC := "opengl32\glTexCoord3fv"
PFNGLTEXCOORD3IPROC := "opengl32\glTexCoord3i"
PFNGLTEXCOORD3IVPROC := "opengl32\glTexCoord3iv"
PFNGLTEXCOORD3SPROC := "opengl32\glTexCoord3s"
PFNGLTEXCOORD3SVPROC := "opengl32\glTexCoord3sv"
PFNGLTEXCOORD4DPROC := "opengl32\glTexCoord4d"
PFNGLTEXCOORD4DVPROC := "opengl32\glTexCoord4dv"
PFNGLTEXCOORD4FPROC := "opengl32\glTexCoord4f"
PFNGLTEXCOORD4FVPROC := "opengl32\glTexCoord4fv"
PFNGLTEXCOORD4IPROC := "opengl32\glTexCoord4i"
PFNGLTEXCOORD4IVPROC := "opengl32\glTexCoord4iv"
PFNGLTEXCOORD4SPROC := "opengl32\glTexCoord4s"
PFNGLTEXCOORD4SVPROC := "opengl32\glTexCoord4sv"
PFNGLTEXCOORDPOINTERPROC := "opengl32\glTexCoordPointer"
PFNGLTEXENVFPROC := "opengl32\glTexEnvf"
PFNGLTEXENVFVPROC := "opengl32\glTexEnvfv"
PFNGLTEXENVIPROC := "opengl32\glTexEnvi"
PFNGLTEXENVIVPROC := "opengl32\glTexEnviv"
PFNGLTEXGENDPROC := "opengl32\glTexGend"
PFNGLTEXGENDVPROC := "opengl32\glTexGendv"
PFNGLTEXGENFPROC := "opengl32\glTexGenf"
PFNGLTEXGENFVPROC := "opengl32\glTexGenfv"
PFNGLTEXGENIPROC := "opengl32\glTexGeni"
PFNGLTEXGENIVPROC := "opengl32\glTexGeniv"
PFNGLTEXIMAGE1DPROC := "opengl32\glTexImage1D"
PFNGLTEXIMAGE2DPROC := "opengl32\glTexImage2D"
PFNGLTEXPARAMETERFPROC := "opengl32\glTexParameterf"
PFNGLTEXPARAMETERFVPROC := "opengl32\glTexParameterfv"
PFNGLTEXPARAMETERIPROC := "opengl32\glTexParameteri"
PFNGLTEXPARAMETERIVPROC := "opengl32\glTexParameteriv"
PFNGLTEXSUBIMAGE1DPROC := "opengl32\glTexSubImage1D"
PFNGLTEXSUBIMAGE2DPROC := "opengl32\glTexSubImage2D"
PFNGLTRANSLATEDPROC := "opengl32\glTranslated"
PFNGLTRANSLATEFPROC := "opengl32\glTranslatef"
PFNGLVERTEX2DPROC := "opengl32\glVertex2d"
PFNGLVERTEX2DVPROC := "opengl32\glVertex2dv"
PFNGLVERTEX2FPROC := "opengl32\glVertex2f"
PFNGLVERTEX2FVPROC := "opengl32\glVertex2fv"
PFNGLVERTEX2IPROC := "opengl32\glVertex2i"
PFNGLVERTEX2IVPROC := "opengl32\glVertex2iv"
PFNGLVERTEX2SPROC := "opengl32\glVertex2s"
PFNGLVERTEX2SVPROC := "opengl32\glVertex2sv"
PFNGLVERTEX3DPROC := "opengl32\glVertex3d"
PFNGLVERTEX3DVPROC := "opengl32\glVertex3dv"
PFNGLVERTEX3FPROC := "opengl32\glVertex3f"
PFNGLVERTEX3FVPROC := "opengl32\glVertex3fv"
PFNGLVERTEX3IPROC := "opengl32\glVertex3i"
PFNGLVERTEX3IVPROC := "opengl32\glVertex3iv"
PFNGLVERTEX3SPROC := "opengl32\glVertex3s"
PFNGLVERTEX3SVPROC := "opengl32\glVertex3sv"
PFNGLVERTEX4DPROC := "opengl32\glVertex4d"
PFNGLVERTEX4DVPROC := "opengl32\glVertex4dv"
PFNGLVERTEX4FPROC := "opengl32\glVertex4f"
PFNGLVERTEX4FVPROC := "opengl32\glVertex4fv"
PFNGLVERTEX4IPROC := "opengl32\glVertex4i"
PFNGLVERTEX4IVPROC := "opengl32\glVertex4iv"
PFNGLVERTEX4SPROC := "opengl32\glVertex4s"
PFNGLVERTEX4SVPROC := "opengl32\glVertex4sv"
PFNGLVERTEXPOINTERPROC := "opengl32\glVertexPointer"
PFNGLVIEWPORTPROC := "opengl32\glViewport"

glAccum(op, value)
{
  global
  DllCall(PFNGLACCUMPROC, GLenum, op, GLfloat, value)
}

glAlphaFunc(func, ref)
{
  global
  DllCall(PFNGLALPHAFUNCPROC, GLenum, func, GLclampf, ref)
}

glAreTexturesResident(n, textures, residences)
{
  global
  return DllCall(PFNGLARETEXTURESRESIDENTPROC, GLsizei, n, GLptr, textures, GLptr, residences, GLboolean)
}

glArrayElement(i)
{
  global
  DllCall(PFNGLARRAYELEMENTPROC, GLint, i)
}

glBegin(mode)
{
  global
  DllCall(PFNGLBEGINPROC, GLenum, mode)
}

glBindTexture(target, texture)
{
  global
  DllCall(PFNGLBINDTEXTUREPROC, GLenum, target, GLuint, texture)
}

glBitmap(width, height, xorig, yorig, xmove, ymove, bitmap)
{
  global
  DllCall(PFNGLBITMAPPROC, GLsizei, width, GLsizei, height, GLfloat, xorig, GLfloat, yorig, GLfloat, xmove, GLfloat, ymove, GLptr, bitmap)
}

glBlendFunc(sfactor, dfactor)
{
  global
  DllCall(PFNGLBLENDFUNCPROC, GLenum, sfactor, GLenum, dfactor)
}

glCallList(list)
{
  global
  DllCall(PFNGLCALLLISTPROC, GLuint, list)
}

glCallLists(n, type, lists)
{
  global
  DllCall(PFNGLCALLLISTSPROC, GLsizei, n, GLenum, type, GLptr, lists)
}

glClear(mask)
{
  global
  DllCall(PFNGLCLEARPROC, GLbitfield, mask)
}

glClearAccum(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCLEARACCUMPROC, GLfloat, red, GLfloat, green, GLfloat, blue, GLfloat, alpha)
}

glClearColor(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCLEARCOLORPROC, GLclampf, red, GLclampf, green, GLclampf, blue, GLclampf, alpha)
}

glClearDepth(depth)
{
  global
  DllCall(PFNGLCLEARDEPTHPROC, GLclampd, depth)
}

glClearIndex(c)
{
  global
  DllCall(PFNGLCLEARINDEXPROC, GLfloat, c)
}

glClearStencil(s)
{
  global
  DllCall(PFNGLCLEARSTENCILPROC, GLint, s)
}

glClipPlane(plane, equation)
{
  global
  DllCall(PFNGLCLIPPLANEPROC, GLenum, plane, GLptr, equation)
}

glColor3b(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3BPROC, GLbyte, red, GLbyte, green, GLbyte, blue)
}

glColor3bv(v)
{
  global
  DllCall(PFNGLCOLOR3BVPROC, GLptr, v)
}

glColor3d(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3DPROC, GLdouble, red, GLdouble, green, GLdouble, blue)
}

glColor3dv(v)
{
  global
  DllCall(PFNGLCOLOR3DVPROC, GLptr, v)
}

glColor3f(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3FPROC, GLfloat, red, GLfloat, green, GLfloat, blue)
}

glColor3fv(v)
{
  global
  DllCall(PFNGLCOLOR3FVPROC, GLptr, v)
}

glColor3i(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3IPROC, GLint, red, GLint, green, GLint, blue)
}

glColor3iv(v)
{
  global
  DllCall(PFNGLCOLOR3IVPROC, GLptr, v)
}

glColor3s(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3SPROC, GLshort, red, GLshort, green, GLshort, blue)
}

glColor3sv(v)
{
  global
  DllCall(PFNGLCOLOR3SVPROC, GLptr, v)
}

glColor3ub(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3UBPROC, GLubyte, red, GLubyte, green, GLubyte, blue)
}

glColor3ubv(v)
{
  global
  DllCall(PFNGLCOLOR3UBVPROC, GLptr, v)
}

glColor3ui(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3UIPROC, GLuint, red, GLuint, green, GLuint, blue)
}

glColor3uiv(v)
{
  global
  DllCall(PFNGLCOLOR3UIVPROC, GLptr, v)
}

glColor3us(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3USPROC, GLushort, red, GLushort, green, GLushort, blue)
}

glColor3usv(v)
{
  global
  DllCall(PFNGLCOLOR3USVPROC, GLptr, v)
}

glColor4b(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4BPROC, GLbyte, red, GLbyte, green, GLbyte, blue, GLbyte, alpha)
}

glColor4bv(v)
{
  global
  DllCall(PFNGLCOLOR4BVPROC, GLptr, v)
}

glColor4d(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4DPROC, GLdouble, red, GLdouble, green, GLdouble, blue, GLdouble, alpha)
}

glColor4dv(v)
{
  global
  DllCall(PFNGLCOLOR4DVPROC, GLptr, v)
}

glColor4f(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4FPROC, GLfloat, red, GLfloat, green, GLfloat, blue, GLfloat, alpha)
}

glColor4fv(v)
{
  global
  DllCall(PFNGLCOLOR4FVPROC, GLptr, v)
}

glColor4i(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4IPROC, GLint, red, GLint, green, GLint, blue, GLint, alpha)
}

glColor4iv(v)
{
  global
  DllCall(PFNGLCOLOR4IVPROC, GLptr, v)
}

glColor4s(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4SPROC, GLshort, red, GLshort, green, GLshort, blue, GLshort, alpha)
}

glColor4sv(v)
{
  global
  DllCall(PFNGLCOLOR4SVPROC, GLptr, v)
}

glColor4ub(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4UBPROC, GLubyte, red, GLubyte, green, GLubyte, blue, GLubyte, alpha)
}

glColor4ubv(v)
{
  global
  DllCall(PFNGLCOLOR4UBVPROC, GLptr, v)
}

glColor4ui(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4UIPROC, GLuint, red, GLuint, green, GLuint, blue, GLuint, alpha)
}

glColor4uiv(v)
{
  global
  DllCall(PFNGLCOLOR4UIVPROC, GLptr, v)
}

glColor4us(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4USPROC, GLushort, red, GLushort, green, GLushort, blue, GLushort, alpha)
}

glColor4usv(v)
{
  global
  DllCall(PFNGLCOLOR4USVPROC, GLptr, v)
}

glColorMask(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLORMASKPROC, GLboolean, red, GLboolean, green, GLboolean, blue, GLboolean, alpha)
}

glColorMaterial(face, mode)
{
  global
  DllCall(PFNGLCOLORMATERIALPROC, GLenum, face, GLenum, mode)
}

glColorPointer(size, type, stride, pointer)
{
  global
  DllCall(PFNGLCOLORPOINTERPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glCopyPixels(x, y, width, height, type)
{
  global
  DllCall(PFNGLCOPYPIXELSPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLenum, type)
}

glCopyTexImage1D(target, level, internalFormat, x, y, width, border)
{
  global
  DllCall(PFNGLCOPYTEXIMAGE1DPROC, GLenum, target, GLint, level, GLenum, internalFormat, GLint, x, GLint, y, GLsizei, width, GLint, border)
}

glCopyTexImage2D(target, level, internalFormat, x, y, width, height, border)
{
  global
  DllCall(PFNGLCOPYTEXIMAGE2DPROC, GLenum, target, GLint, level, GLenum, internalFormat, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLint, border)
}

glCopyTexSubImage1D(target, level, xoffset, x, y, width)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE1DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, x, GLint, y, GLsizei, width)
}

glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE2DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glCullFace(mode)
{
  global
  DllCall(PFNGLCULLFACEPROC, GLenum, mode)
}

glDeleteLists(list, range)
{
  global
  DllCall(PFNGLDELETELISTSPROC, GLuint, list, GLsizei, range)
}

glDeleteTextures(n, textures)
{
  global
  DllCall(PFNGLDELETETEXTURESPROC, GLsizei, n, GLptr, textures)
}

glDepthFunc(func)
{
  global
  DllCall(PFNGLDEPTHFUNCPROC, GLenum, func)
}

glDepthMask(flag)
{
  global
  DllCall(PFNGLDEPTHMASKPROC, GLboolean, flag)
}

glDepthRange(zNear, zFar)
{
  global
  DllCall(PFNGLDEPTHRANGEPROC, GLclampd, zNear, GLclampd, zFar)
}

glDisable(cap)
{
  global
  DllCall(PFNGLDISABLEPROC, GLenum, cap)
}

glDisableClientState(array)
{
  global
  DllCall(PFNGLDISABLECLIENTSTATEPROC, GLenum, array)
}

glDrawArrays(mode, first, count)
{
  global
  DllCall(PFNGLDRAWARRAYSPROC, GLenum, mode, GLint, first, GLsizei, count)
}

glDrawBuffer(mode)
{
  global
  DllCall(PFNGLDRAWBUFFERPROC, GLenum, mode)
}

glDrawElements(mode, count, type, indices)
{
  global
  DllCall(PFNGLDRAWELEMENTSPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices)
}

glDrawPixels(width, height, format, type, pixels)
{
  global
  DllCall(PFNGLDRAWPIXELSPROC, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}

glEdgeFlag(flag)
{
  global
  DllCall(PFNGLEDGEFLAGPROC, GLboolean, flag)
}

glEdgeFlagPointer(stride, pointer)
{
  global
  DllCall(PFNGLEDGEFLAGPOINTERPROC, GLsizei, stride, GLptr, pointer)
}

glEdgeFlagv(flag)
{
  global
  DllCall(PFNGLEDGEFLAGVPROC, GLptr, flag)
}

glEnable(cap)
{
  global
  DllCall(PFNGLENABLEPROC, GLenum, cap)
}

glEnableClientState(array)
{
  global
  DllCall(PFNGLENABLECLIENTSTATEPROC, GLenum, array)
}

glEnd()
{
  global
  DllCall(PFNGLENDPROC)
}

glEndList()
{
  global
  DllCall(PFNGLENDLISTPROC)
}

glEvalCoord1d(u)
{
  global
  DllCall(PFNGLEVALCOORD1DPROC, GLdouble, u)
}

glEvalCoord1dv(u)
{
  global
  DllCall(PFNGLEVALCOORD1DVPROC, GLptr, u)
}

glEvalCoord1f(u)
{
  global
  DllCall(PFNGLEVALCOORD1FPROC, GLfloat, u)
}

glEvalCoord1fv(u)
{
  global
  DllCall(PFNGLEVALCOORD1FVPROC, GLptr, u)
}

glEvalCoord2d(u, v)
{
  global
  DllCall(PFNGLEVALCOORD2DPROC, GLdouble, u, GLdouble, v)
}

glEvalCoord2dv(u)
{
  global
  DllCall(PFNGLEVALCOORD2DVPROC, GLptr, u)
}

glEvalCoord2f(u, v)
{
  global
  DllCall(PFNGLEVALCOORD2FPROC, GLfloat, u, GLfloat, v)
}

glEvalCoord2fv(u)
{
  global
  DllCall(PFNGLEVALCOORD2FVPROC, GLptr, u)
}

glEvalMesh1(mode, i1, i2)
{
  global
  DllCall(PFNGLEVALMESH1PROC, GLenum, mode, GLint, i1, GLint, i2)
}

glEvalMesh2(mode, i1, i2, j1, j2)
{
  global
  DllCall(PFNGLEVALMESH2PROC, GLenum, mode, GLint, i1, GLint, i2, GLint, j1, GLint, j2)
}

glEvalPoint1(i)
{
  global
  DllCall(PFNGLEVALPOINT1PROC, GLint, i)
}

glEvalPoint2(i, j)
{
  global
  DllCall(PFNGLEVALPOINT2PROC, GLint, i, GLint, j)
}

glFeedbackBuffer(size, type, buffer)
{
  global
  DllCall(PFNGLFEEDBACKBUFFERPROC, GLsizei, size, GLenum, type, GLptr, buffer)
}

glFinish()
{
  global
  DllCall(PFNGLFINISHPROC)
}

glFlush()
{
  global
  DllCall(PFNGLFLUSHPROC)
}

glFogf(pname, param)
{
  global
  DllCall(PFNGLFOGFPROC, GLenum, pname, GLfloat, param)
}

glFogfv(pname, params)
{
  global
  DllCall(PFNGLFOGFVPROC, GLenum, pname, GLptr, params)
}

glFogi(pname, param)
{
  global
  DllCall(PFNGLFOGIPROC, GLenum, pname, GLint, param)
}

glFogiv(pname, params)
{
  global
  DllCall(PFNGLFOGIVPROC, GLenum, pname, GLptr, params)
}

glFrontFace(mode)
{
  global
  DllCall(PFNGLFRONTFACEPROC, GLenum, mode)
}

glFrustum(left, right, bottom, top, zNear, zFar)
{
  global
  DllCall(PFNGLFRUSTUMPROC, GLdouble, left, GLdouble, right, GLdouble, bottom, GLdouble, top, GLdouble, zNear, GLdouble, zFar)
}

glGenLists(range)
{
  global
  return DllCall(PFNGLGENLISTSPROC, GLsizei, range, GLuint)
}

glGenTextures(n, textures)
{
  global
  DllCall(PFNGLGENTEXTURESPROC, GLsizei, n, GLptr, textures)
}

glGetBooleanv(pname, params)
{
  global
  DllCall(PFNGLGETBOOLEANVPROC, GLenum, pname, GLptr, params)
}

glGetClipPlane(plane, equation)
{
  global
  DllCall(PFNGLGETCLIPPLANEPROC, GLenum, plane, GLptr, equation)
}

glGetDoublev(pname, params)
{
  global
  DllCall(PFNGLGETDOUBLEVPROC, GLenum, pname, GLptr, params)
}

glGetError()
{
  global
  return DllCall(PFNGLGETERRORPROC)
}

glGetFloatv(pname, params)
{
  global
  DllCall(PFNGLGETFLOATVPROC, GLenum, pname, GLptr, params)
}

glGetIntegerv(pname, params)
{
  global
  DllCall(PFNGLGETINTEGERVPROC, GLenum, pname, GLptr, params)
}

glGetLightfv(light, pname, params)
{
  global
  DllCall(PFNGLGETLIGHTFVPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glGetLightiv(light, pname, params)
{
  global
  DllCall(PFNGLGETLIGHTIVPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glGetMapdv(target, query, v)
{
  global
  DllCall(PFNGLGETMAPDVPROC, GLenum, target, GLenum, query, GLptr, v)
}

glGetMapfv(target, query, v)
{
  global
  DllCall(PFNGLGETMAPFVPROC, GLenum, target, GLenum, query, GLptr, v)
}

glGetMapiv(target, query, v)
{
  global
  DllCall(PFNGLGETMAPIVPROC, GLenum, target, GLenum, query, GLptr, v)
}

glGetMaterialfv(face, pname, params)
{
  global
  DllCall(PFNGLGETMATERIALFVPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glGetMaterialiv(face, pname, params)
{
  global
  DllCall(PFNGLGETMATERIALIVPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glGetPixelMapfv(map, values)
{
  global
  DllCall(PFNGLGETPIXELMAPFVPROC, GLenum, map, GLptr, values)
}

glGetPixelMapuiv(map, values)
{
  global
  DllCall(PFNGLGETPIXELMAPUIVPROC, GLenum, map, GLptr, values)
}

glGetPixelMapusv(map, values)
{
  global
  DllCall(PFNGLGETPIXELMAPUSVPROC, GLenum, map, GLptr, values)
}

glGetPointerv(pname, params)
{
  global
  DllCall(PFNGLGETPOINTERVPROC, GLenum, pname, GLptr, params)
}

glGetPolygonStipple(mask)
{
  global
  DllCall(PFNGLGETPOLYGONSTIPPLEPROC, GLptr, mask)
}

glGetString(name)
{
  global
  return DllCall(PFNGLGETSTRINGPROC, GLenum, name, GLastr)
}

glGetTexEnvfv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXENVFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexEnviv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXENVIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexGendv(coord, pname, params)
{
  global
  DllCall(PFNGLGETTEXGENDVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetTexGenfv(coord, pname, params)
{
  global
  DllCall(PFNGLGETTEXGENFVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetTexGeniv(coord, pname, params)
{
  global
  DllCall(PFNGLGETTEXGENIVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetTexImage(target, level, format, type, pixels)
{
  global
  DllCall(PFNGLGETTEXIMAGEPROC, GLenum, target, GLint, level, GLenum, format, GLenum, type, GLptr, pixels)
}

glGetTexLevelParameterfv(target, level, pname, params)
{
  global
  DllCall(PFNGLGETTEXLEVELPARAMETERFVPROC, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glGetTexLevelParameteriv(target, level, pname, params)
{
  global
  DllCall(PFNGLGETTEXLEVELPARAMETERIVPROC, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glGetTexParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glHint(target, mode)
{
  global
  DllCall(PFNGLHINTPROC, GLenum, target, GLenum, mode)
}

glIndexMask(mask)
{
  global
  DllCall(PFNGLINDEXMASKPROC, GLuint, mask)
}

glIndexPointer(type, stride, pointer)
{
  global
  DllCall(PFNGLINDEXPOINTERPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glIndexd(c)
{
  global
  DllCall(PFNGLINDEXDPROC, GLdouble, c)
}

glIndexdv(c)
{
  global
  DllCall(PFNGLINDEXDVPROC, GLptr, c)
}

glIndexf(c)
{
  global
  DllCall(PFNGLINDEXFPROC, GLfloat, c)
}

glIndexfv(c)
{
  global
  DllCall(PFNGLINDEXFVPROC, GLptr, c)
}

glIndexi(c)
{
  global
  DllCall(PFNGLINDEXIPROC, GLint, c)
}

glIndexiv(c)
{
  global
  DllCall(PFNGLINDEXIVPROC, GLptr, c)
}

glIndexs(c)
{
  global
  DllCall(PFNGLINDEXSPROC, GLshort, c)
}

glIndexsv(c)
{
  global
  DllCall(PFNGLINDEXSVPROC, GLptr, c)
}

glIndexub(c)
{
  global
  DllCall(PFNGLINDEXUBPROC, GLubyte, c)
}

glIndexubv(c)
{
  global
  DllCall(PFNGLINDEXUBVPROC, GLptr, c)
}

glInitNames()
{
  global
  DllCall(PFNGLINITNAMESPROC)
}

glInterleavedArrays(format, stride, pointer)
{
  global
  DllCall(PFNGLINTERLEAVEDARRAYSPROC, GLenum, format, GLsizei, stride, GLptr, pointer)
}

glIsEnabled(cap)
{
  global
  return DllCall(PFNGLISENABLEDPROC, GLenum, cap, GLboolean)
}

glIsList(list)
{
  global
  return DllCall(PFNGLISLISTPROC, GLuint, list, GLboolean)
}

glIsTexture(texture)
{
  global
  return DllCall(PFNGLISTEXTUREPROC, GLuint, texture, GLboolean)
}

glLightModelf(pname, param)
{
  global
  DllCall(PFNGLLIGHTMODELFPROC, GLenum, pname, GLfloat, param)
}

glLightModelfv(pname, params)
{
  global
  DllCall(PFNGLLIGHTMODELFVPROC, GLenum, pname, GLptr, params)
}

glLightModeli(pname, param)
{
  global
  DllCall(PFNGLLIGHTMODELIPROC, GLenum, pname, GLint, param)
}

glLightModeliv(pname, params)
{
  global
  DllCall(PFNGLLIGHTMODELIVPROC, GLenum, pname, GLptr, params)
}

glLightf(light, pname, param)
{
  global
  DllCall(PFNGLLIGHTFPROC, GLenum, light, GLenum, pname, GLfloat, param)
}

glLightfv(light, pname, params)
{
  global
  DllCall(PFNGLLIGHTFVPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glLighti(light, pname, param)
{
  global
  DllCall(PFNGLLIGHTIPROC, GLenum, light, GLenum, pname, GLint, param)
}

glLightiv(light, pname, params)
{
  global
  DllCall(PFNGLLIGHTIVPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glLineStipple(factor, pattern)
{
  global
  DllCall(PFNGLLINESTIPPLEPROC, GLint, factor, GLushort, pattern)
}

glLineWidth(width)
{
  global
  DllCall(PFNGLLINEWIDTHPROC, GLfloat, width)
}

glListBase(base)
{
  global
  DllCall(PFNGLLISTBASEPROC, GLuint, base)
}

glLoadIdentity()
{
  global
  DllCall(PFNGLLOADIDENTITYPROC)
}

glLoadMatrixd(m)
{
  global
  DllCall(PFNGLLOADMATRIXDPROC, GLptr, m)
}

glLoadMatrixf(m)
{
  global
  DllCall(PFNGLLOADMATRIXFPROC, GLptr, m)
}

glLoadName(name)
{
  global
  DllCall(PFNGLLOADNAMEPROC, GLuint, name)
}

glLogicOp(opcode)
{
  global
  DllCall(PFNGLLOGICOPPROC, GLenum, opcode)
}

glMap1d(target, u1, u2, stride, order, points)
{
  global
  DllCall(PFNGLMAP1DPROC, GLenum, target, GLdouble, u1, GLdouble, u2, GLint, stride, GLint, order, GLptr, points)
}

glMap1f(target, u1, u2, stride, order, points)
{
  global
  DllCall(PFNGLMAP1FPROC, GLenum, target, GLfloat, u1, GLfloat, u2, GLint, stride, GLint, order, GLptr, points)
}

glMap2d(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
{
  global
  DllCall(PFNGLMAP2DPROC, GLenum, target, GLdouble, u1, GLdouble, u2, GLint, ustride, GLint, uorder, GLdouble, v1, GLdouble, v2, GLint, vstride, GLint, vorder, GLptr, points)
}

glMap2f(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
{
  global
  DllCall(PFNGLMAP2FPROC, GLenum, target, GLfloat, u1, GLfloat, u2, GLint, ustride, GLint, uorder, GLfloat, v1, GLfloat, v2, GLint, vstride, GLint, vorder, GLptr, points)
}

glMapGrid1d(un, u1, u2)
{
  global
  DllCall(PFNGLMAPGRID1DPROC, GLint, un, GLdouble, u1, GLdouble, u2)
}

glMapGrid1f(un, u1, u2)
{
  global
  DllCall(PFNGLMAPGRID1FPROC, GLint, un, GLfloat, u1, GLfloat, u2)
}

glMapGrid2d(un, u1, u2, vn, v1, v2)
{
  global
  DllCall(PFNGLMAPGRID2DPROC, GLint, un, GLdouble, u1, GLdouble, u2, GLint, vn, GLdouble, v1, GLdouble, v2)
}

glMapGrid2f(un, u1, u2, vn, v1, v2)
{
  global
  DllCall(PFNGLMAPGRID2FPROC, GLint, un, GLfloat, u1, GLfloat, u2, GLint, vn, GLfloat, v1, GLfloat, v2)
}

glMaterialf(face, pname, param)
{
  global
  DllCall(PFNGLMATERIALFPROC, GLenum, face, GLenum, pname, GLfloat, param)
}

glMaterialfv(face, pname, params)
{
  global
  DllCall(PFNGLMATERIALFVPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glMateriali(face, pname, param)
{
  global
  DllCall(PFNGLMATERIALIPROC, GLenum, face, GLenum, pname, GLint, param)
}

glMaterialiv(face, pname, params)
{
  global
  DllCall(PFNGLMATERIALIVPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glMatrixMode(mode)
{
  global
  DllCall(PFNGLMATRIXMODEPROC, GLenum, mode)
}

glMultMatrixd(m)
{
  global
  DllCall(PFNGLMULTMATRIXDPROC, GLptr, m)
}

glMultMatrixf(m)
{
  global
  DllCall(PFNGLMULTMATRIXFPROC, GLptr, m)
}

glNewList(list, mode)
{
  global
  DllCall(PFNGLNEWLISTPROC, GLuint, list, GLenum, mode)
}

glNormal3b(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3BPROC, GLbyte, nx, GLbyte, ny, GLbyte, nz)
}

glNormal3bv(v)
{
  global
  DllCall(PFNGLNORMAL3BVPROC, GLptr, v)
}

glNormal3d(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3DPROC, GLdouble, nx, GLdouble, ny, GLdouble, nz)
}

glNormal3dv(v)
{
  global
  DllCall(PFNGLNORMAL3DVPROC, GLptr, v)
}

glNormal3f(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3FPROC, GLfloat, nx, GLfloat, ny, GLfloat, nz)
}

glNormal3fv(v)
{
  global
  DllCall(PFNGLNORMAL3FVPROC, GLptr, v)
}

glNormal3i(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3IPROC, GLint, nx, GLint, ny, GLint, nz)
}

glNormal3iv(v)
{
  global
  DllCall(PFNGLNORMAL3IVPROC, GLptr, v)
}

glNormal3s(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3SPROC, GLshort, nx, GLshort, ny, GLshort, nz)
}

glNormal3sv(v)
{
  global
  DllCall(PFNGLNORMAL3SVPROC, GLptr, v)
}

glNormalPointer(type, stride, pointer)
{
  global
  DllCall(PFNGLNORMALPOINTERPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glOrtho(left, right, bottom, top, zNear, zFar)
{
  global
  DllCall(PFNGLORTHOPROC, GLdouble, left, GLdouble, right, GLdouble, bottom, GLdouble, top, GLdouble, zNear, GLdouble, zFar)
}

glPassThrough(token)
{
  global
  DllCall(PFNGLPASSTHROUGHPROC, GLfloat, token)
}

glPixelMapfv(map, mapsize, values)
{
  global
  DllCall(PFNGLPIXELMAPFVPROC, GLenum, map, GLsizei, mapsize, GLptr, values)
}

glPixelMapuiv(map, mapsize, values)
{
  global
  DllCall(PFNGLPIXELMAPUIVPROC, GLenum, map, GLsizei, mapsize, GLptr, values)
}

glPixelMapusv(map, mapsize, values)
{
  global
  DllCall(PFNGLPIXELMAPUSVPROC, GLenum, map, GLsizei, mapsize, GLptr, values)
}

glPixelStoref(pname, param)
{
  global
  DllCall(PFNGLPIXELSTOREFPROC, GLenum, pname, GLfloat, param)
}

glPixelStorei(pname, param)
{
  global
  DllCall(PFNGLPIXELSTOREIPROC, GLenum, pname, GLint, param)
}

glPixelTransferf(pname, param)
{
  global
  DllCall(PFNGLPIXELTRANSFERFPROC, GLenum, pname, GLfloat, param)
}

glPixelTransferi(pname, param)
{
  global
  DllCall(PFNGLPIXELTRANSFERIPROC, GLenum, pname, GLint, param)
}

glPixelZoom(xfactor, yfactor)
{
  global
  DllCall(PFNGLPIXELZOOMPROC, GLfloat, xfactor, GLfloat, yfactor)
}

glPointSize(size)
{
  global
  DllCall(PFNGLPOINTSIZEPROC, GLfloat, size)
}

glPolygonMode(face, mode)
{
  global
  DllCall(PFNGLPOLYGONMODEPROC, GLenum, face, GLenum, mode)
}

glPolygonOffset(factor, units)
{
  global
  DllCall(PFNGLPOLYGONOFFSETPROC, GLfloat, factor, GLfloat, units)
}

glPolygonStipple(mask)
{
  global
  DllCall(PFNGLPOLYGONSTIPPLEPROC, GLptr, mask)
}

glPopAttrib()
{
  global
  DllCall(PFNGLPOPATTRIBPROC)
}

glPopClientAttrib()
{
  global
  DllCall(PFNGLPOPCLIENTATTRIBPROC)
}

glPopMatrix()
{
  global
  DllCall(PFNGLPOPMATRIXPROC)
}

glPopName()
{
  global
  DllCall(PFNGLPOPNAMEPROC)
}

glPrioritizeTextures(n, textures, priorities)
{
  global
  DllCall(PFNGLPRIORITIZETEXTURESPROC, GLsizei, n, GLptr, textures, GLptr, priorities)
}

glPushAttrib(mask)
{
  global
  DllCall(PFNGLPUSHATTRIBPROC, GLbitfield, mask)
}

glPushClientAttrib(mask)
{
  global
  DllCall(PFNGLPUSHCLIENTATTRIBPROC, GLbitfield, mask)
}

glPushMatrix()
{
  global
  DllCall(PFNGLPUSHMATRIXPROC)
}

glPushName(name)
{
  global
  DllCall(PFNGLPUSHNAMEPROC, GLuint, name)
}

glRasterPos2d(x, y)
{
  global
  DllCall(PFNGLRASTERPOS2DPROC, GLdouble, x, GLdouble, y)
}

glRasterPos2dv(v)
{
  global
  DllCall(PFNGLRASTERPOS2DVPROC, GLptr, v)
}

glRasterPos2f(x, y)
{
  global
  DllCall(PFNGLRASTERPOS2FPROC, GLfloat, x, GLfloat, y)
}

glRasterPos2fv(v)
{
  global
  DllCall(PFNGLRASTERPOS2FVPROC, GLptr, v)
}

glRasterPos2i(x, y)
{
  global
  DllCall(PFNGLRASTERPOS2IPROC, GLint, x, GLint, y)
}

glRasterPos2iv(v)
{
  global
  DllCall(PFNGLRASTERPOS2IVPROC, GLptr, v)
}

glRasterPos2s(x, y)
{
  global
  DllCall(PFNGLRASTERPOS2SPROC, GLshort, x, GLshort, y)
}

glRasterPos2sv(v)
{
  global
  DllCall(PFNGLRASTERPOS2SVPROC, GLptr, v)
}

glRasterPos3d(x, y, z)
{
  global
  DllCall(PFNGLRASTERPOS3DPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glRasterPos3dv(v)
{
  global
  DllCall(PFNGLRASTERPOS3DVPROC, GLptr, v)
}

glRasterPos3f(x, y, z)
{
  global
  DllCall(PFNGLRASTERPOS3FPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glRasterPos3fv(v)
{
  global
  DllCall(PFNGLRASTERPOS3FVPROC, GLptr, v)
}

glRasterPos3i(x, y, z)
{
  global
  DllCall(PFNGLRASTERPOS3IPROC, GLint, x, GLint, y, GLint, z)
}

glRasterPos3iv(v)
{
  global
  DllCall(PFNGLRASTERPOS3IVPROC, GLptr, v)
}

glRasterPos3s(x, y, z)
{
  global
  DllCall(PFNGLRASTERPOS3SPROC, GLshort, x, GLshort, y, GLshort, z)
}

glRasterPos3sv(v)
{
  global
  DllCall(PFNGLRASTERPOS3SVPROC, GLptr, v)
}

glRasterPos4d(x, y, z, w)
{
  global
  DllCall(PFNGLRASTERPOS4DPROC, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glRasterPos4dv(v)
{
  global
  DllCall(PFNGLRASTERPOS4DVPROC, GLptr, v)
}

glRasterPos4f(x, y, z, w)
{
  global
  DllCall(PFNGLRASTERPOS4FPROC, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glRasterPos4fv(v)
{
  global
  DllCall(PFNGLRASTERPOS4FVPROC, GLptr, v)
}

glRasterPos4i(x, y, z, w)
{
  global
  DllCall(PFNGLRASTERPOS4IPROC, GLint, x, GLint, y, GLint, z, GLint, w)
}

glRasterPos4iv(v)
{
  global
  DllCall(PFNGLRASTERPOS4IVPROC, GLptr, v)
}

glRasterPos4s(x, y, z, w)
{
  global
  DllCall(PFNGLRASTERPOS4SPROC, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glRasterPos4sv(v)
{
  global
  DllCall(PFNGLRASTERPOS4SVPROC, GLptr, v)
}

glReadBuffer(mode)
{
  global
  DllCall(PFNGLREADBUFFERPROC, GLenum, mode)
}

glReadPixels(x, y, width, height, format, type, pixels)
{
  global
  DllCall(PFNGLREADPIXELSPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}

glRectd(x1, y1, x2, y2)
{
  global
  DllCall(PFNGLRECTDPROC, GLdouble, x1, GLdouble, y1, GLdouble, x2, GLdouble, y2)
}

glRectdv(v1, v2)
{
  global
  DllCall(PFNGLRECTDVPROC, GLptr, v1, GLptr, v2)
}

glRectf(x1, y1, x2, y2)
{
  global
  DllCall(PFNGLRECTFPROC, GLfloat, x1, GLfloat, y1, GLfloat, x2, GLfloat, y2)
}

glRectfv(v1, v2)
{
  global
  DllCall(PFNGLRECTFVPROC, GLptr, v1, GLptr, v2)
}

glRecti(x1, y1, x2, y2)
{
  global
  DllCall(PFNGLRECTIPROC, GLint, x1, GLint, y1, GLint, x2, GLint, y2)
}

glRectiv(v1, v2)
{
  global
  DllCall(PFNGLRECTIVPROC, GLptr, v1, GLptr, v2)
}

glRects(x1, y1, x2, y2)
{
  global
  DllCall(PFNGLRECTSPROC, GLshort, x1, GLshort, y1, GLshort, x2, GLshort, y2)
}

glRectsv(v1, v2)
{
  global
  DllCall(PFNGLRECTSVPROC, GLptr, v1, GLptr, v2)
}

glRenderMode(mode)
{
  global
  return DllCall(PFNGLRENDERMODEPROC, GLenum, mode, GLint)
}

glRotated(angle, x, y, z)
{
  global
  DllCall(PFNGLROTATEDPROC, GLdouble, angle, GLdouble, x, GLdouble, y, GLdouble, z)
}

glRotatef(angle, x, y, z)
{
  global
  DllCall(PFNGLROTATEFPROC, GLfloat, angle, GLfloat, x, GLfloat, y, GLfloat, z)
}

glScaled(x, y, z)
{
  global
  DllCall(PFNGLSCALEDPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glScalef(x, y, z)
{
  global
  DllCall(PFNGLSCALEFPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glScissor(x, y, width, height)
{
  global
  DllCall(PFNGLSCISSORPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glSelectBuffer(size, buffer)
{
  global
  DllCall(PFNGLSELECTBUFFERPROC, GLsizei, size, GLptr, buffer)
}

glShadeModel(mode)
{
  global
  DllCall(PFNGLSHADEMODELPROC, GLenum, mode)
}

glStencilFunc(func, ref, mask)
{
  global
  DllCall(PFNGLSTENCILFUNCPROC, GLenum, func, GLint, ref, GLuint, mask)
}

glStencilMask(mask)
{
  global
  DllCall(PFNGLSTENCILMASKPROC, GLuint, mask)
}

glStencilOp(fail, zfail, zpass)
{
  global
  DllCall(PFNGLSTENCILOPPROC, GLenum, fail, GLenum, zfail, GLenum, zpass)
}

glTexCoord1d(s)
{
  global
  DllCall(PFNGLTEXCOORD1DPROC, GLdouble, s)
}

glTexCoord1dv(v)
{
  global
  DllCall(PFNGLTEXCOORD1DVPROC, GLptr, v)
}

glTexCoord1f(s)
{
  global
  DllCall(PFNGLTEXCOORD1FPROC, GLfloat, s)
}

glTexCoord1fv(v)
{
  global
  DllCall(PFNGLTEXCOORD1FVPROC, GLptr, v)
}

glTexCoord1i(s)
{
  global
  DllCall(PFNGLTEXCOORD1IPROC, GLint, s)
}

glTexCoord1iv(v)
{
  global
  DllCall(PFNGLTEXCOORD1IVPROC, GLptr, v)
}

glTexCoord1s(s)
{
  global
  DllCall(PFNGLTEXCOORD1SPROC, GLshort, s)
}

glTexCoord1sv(v)
{
  global
  DllCall(PFNGLTEXCOORD1SVPROC, GLptr, v)
}

glTexCoord2d(s, t)
{
  global
  DllCall(PFNGLTEXCOORD2DPROC, GLdouble, s, GLdouble, t)
}

glTexCoord2dv(v)
{
  global
  DllCall(PFNGLTEXCOORD2DVPROC, GLptr, v)
}

glTexCoord2f(s, t)
{
  global
  DllCall(PFNGLTEXCOORD2FPROC, GLfloat, s, GLfloat, t)
}

glTexCoord2fv(v)
{
  global
  DllCall(PFNGLTEXCOORD2FVPROC, GLptr, v)
}

glTexCoord2i(s, t)
{
  global
  DllCall(PFNGLTEXCOORD2IPROC, GLint, s, GLint, t)
}

glTexCoord2iv(v)
{
  global
  DllCall(PFNGLTEXCOORD2IVPROC, GLptr, v)
}

glTexCoord2s(s, t)
{
  global
  DllCall(PFNGLTEXCOORD2SPROC, GLshort, s, GLshort, t)
}

glTexCoord2sv(v)
{
  global
  DllCall(PFNGLTEXCOORD2SVPROC, GLptr, v)
}

glTexCoord3d(s, t, r)
{
  global
  DllCall(PFNGLTEXCOORD3DPROC, GLdouble, s, GLdouble, t, GLdouble, r)
}

glTexCoord3dv(v)
{
  global
  DllCall(PFNGLTEXCOORD3DVPROC, GLptr, v)
}

glTexCoord3f(s, t, r)
{
  global
  DllCall(PFNGLTEXCOORD3FPROC, GLfloat, s, GLfloat, t, GLfloat, r)
}

glTexCoord3fv(v)
{
  global
  DllCall(PFNGLTEXCOORD3FVPROC, GLptr, v)
}

glTexCoord3i(s, t, r)
{
  global
  DllCall(PFNGLTEXCOORD3IPROC, GLint, s, GLint, t, GLint, r)
}

glTexCoord3iv(v)
{
  global
  DllCall(PFNGLTEXCOORD3IVPROC, GLptr, v)
}

glTexCoord3s(s, t, r)
{
  global
  DllCall(PFNGLTEXCOORD3SPROC, GLshort, s, GLshort, t, GLshort, r)
}

glTexCoord3sv(v)
{
  global
  DllCall(PFNGLTEXCOORD3SVPROC, GLptr, v)
}

glTexCoord4d(s, t, r, q)
{
  global
  DllCall(PFNGLTEXCOORD4DPROC, GLdouble, s, GLdouble, t, GLdouble, r, GLdouble, q)
}

glTexCoord4dv(v)
{
  global
  DllCall(PFNGLTEXCOORD4DVPROC, GLptr, v)
}

glTexCoord4f(s, t, r, q)
{
  global
  DllCall(PFNGLTEXCOORD4FPROC, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, q)
}

glTexCoord4fv(v)
{
  global
  DllCall(PFNGLTEXCOORD4FVPROC, GLptr, v)
}

glTexCoord4i(s, t, r, q)
{
  global
  DllCall(PFNGLTEXCOORD4IPROC, GLint, s, GLint, t, GLint, r, GLint, q)
}

glTexCoord4iv(v)
{
  global
  DllCall(PFNGLTEXCOORD4IVPROC, GLptr, v)
}

glTexCoord4s(s, t, r, q)
{
  global
  DllCall(PFNGLTEXCOORD4SPROC, GLshort, s, GLshort, t, GLshort, r, GLshort, q)
}

glTexCoord4sv(v)
{
  global
  DllCall(PFNGLTEXCOORD4SVPROC, GLptr, v)
}

glTexCoordPointer(size, type, stride, pointer)
{
  global
  DllCall(PFNGLTEXCOORDPOINTERPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glTexEnvf(target, pname, param)
{
  global
  DllCall(PFNGLTEXENVFPROC, GLenum, target, GLenum, pname, GLfloat, param)
}

glTexEnvfv(target, pname, params)
{
  global
  DllCall(PFNGLTEXENVFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexEnvi(target, pname, param)
{
  global
  DllCall(PFNGLTEXENVIPROC, GLenum, target, GLenum, pname, GLint, param)
}

glTexEnviv(target, pname, params)
{
  global
  DllCall(PFNGLTEXENVIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexGend(coord, pname, param)
{
  global
  DllCall(PFNGLTEXGENDPROC, GLenum, coord, GLenum, pname, GLdouble, param)
}

glTexGendv(coord, pname, params)
{
  global
  DllCall(PFNGLTEXGENDVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glTexGenf(coord, pname, param)
{
  global
  DllCall(PFNGLTEXGENFPROC, GLenum, coord, GLenum, pname, GLfloat, param)
}

glTexGenfv(coord, pname, params)
{
  global
  DllCall(PFNGLTEXGENFVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glTexGeni(coord, pname, param)
{
  global
  DllCall(PFNGLTEXGENIPROC, GLenum, coord, GLenum, pname, GLint, param)
}

glTexGeniv(coord, pname, params)
{
  global
  DllCall(PFNGLTEXGENIVPROC, GLenum, coord, GLenum, pname, GLptr, params)
}

glTexImage1D(target, level, internalformat, width, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXIMAGE1DPROC, GLenum, target, GLint, level, GLint, internalformat, GLsizei, width, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXIMAGE2DPROC, GLenum, target, GLint, level, GLint, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexParameterf(target, pname, param)
{
  global
  DllCall(PFNGLTEXPARAMETERFPROC, GLenum, target, GLenum, pname, GLfloat, param)
}

glTexParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexParameteri(target, pname, param)
{
  global
  DllCall(PFNGLTEXPARAMETERIPROC, GLenum, target, GLenum, pname, GLint, param)
}

glTexParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexSubImage1D(target, level, xoffset, width, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE1DPROC, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE2DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}

glTranslated(x, y, z)
{
  global
  DllCall(PFNGLTRANSLATEDPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glTranslatef(x, y, z)
{
  global
  DllCall(PFNGLTRANSLATEFPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertex2d(x, y)
{
  global
  DllCall(PFNGLVERTEX2DPROC, GLdouble, x, GLdouble, y)
}

glVertex2dv(v)
{
  global
  DllCall(PFNGLVERTEX2DVPROC, GLptr, v)
}

glVertex2f(x, y)
{
  global
  DllCall(PFNGLVERTEX2FPROC, GLfloat, x, GLfloat, y)
}

glVertex2fv(v)
{
  global
  DllCall(PFNGLVERTEX2FVPROC, GLptr, v)
}

glVertex2i(x, y)
{
  global
  DllCall(PFNGLVERTEX2IPROC, GLint, x, GLint, y)
}

glVertex2iv(v)
{
  global
  DllCall(PFNGLVERTEX2IVPROC, GLptr, v)
}

glVertex2s(x, y)
{
  global
  DllCall(PFNGLVERTEX2SPROC, GLshort, x, GLshort, y)
}

glVertex2sv(v)
{
  global
  DllCall(PFNGLVERTEX2SVPROC, GLptr, v)
}

glVertex3d(x, y, z)
{
  global
  DllCall(PFNGLVERTEX3DPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertex3dv(v)
{
  global
  DllCall(PFNGLVERTEX3DVPROC, GLptr, v)
}

glVertex3f(x, y, z)
{
  global
  DllCall(PFNGLVERTEX3FPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertex3fv(v)
{
  global
  DllCall(PFNGLVERTEX3FVPROC, GLptr, v)
}

glVertex3i(x, y, z)
{
  global
  DllCall(PFNGLVERTEX3IPROC, GLint, x, GLint, y, GLint, z)
}

glVertex3iv(v)
{
  global
  DllCall(PFNGLVERTEX3IVPROC, GLptr, v)
}

glVertex3s(x, y, z)
{
  global
  DllCall(PFNGLVERTEX3SPROC, GLshort, x, GLshort, y, GLshort, z)
}

glVertex3sv(v)
{
  global
  DllCall(PFNGLVERTEX3SVPROC, GLptr, v)
}

glVertex4d(x, y, z, w)
{
  global
  DllCall(PFNGLVERTEX4DPROC, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertex4dv(v)
{
  global
  DllCall(PFNGLVERTEX4DVPROC, GLptr, v)
}

glVertex4f(x, y, z, w)
{
  global
  DllCall(PFNGLVERTEX4FPROC, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glVertex4fv(v)
{
  global
  DllCall(PFNGLVERTEX4FVPROC, GLptr, v)
}

glVertex4i(x, y, z, w)
{
  global
  DllCall(PFNGLVERTEX4IPROC, GLint, x, GLint, y, GLint, z, GLint, w)
}

glVertex4iv(v)
{
  global
  DllCall(PFNGLVERTEX4IVPROC, GLptr, v)
}

glVertex4s(x, y, z, w)
{
  global
  DllCall(PFNGLVERTEX4SPROC, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glVertex4sv(v)
{
  global
  DllCall(PFNGLVERTEX4SVPROC, GLptr, v)
}

glVertexPointer(size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXPOINTERPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glViewport(x, y, width, height)
{
  global
  DllCall(PFNGLVIEWPORTPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

;EXT_vertex_array

glArrayElementEXT(i)
{
  global
  DllCall(PFNGLARRAYELEMENTEXTPROC, GLint, i)
}

glDrawArraysEXT(mode, first, count)
{
  global
  DllCall(PFNGLDRAWARRAYSEXTPROC, GLenum, mode, GLint, first, GLsizei, count)
}

glVertexPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLVERTEXPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glNormalPointerEXT(type, stride, count, pointer)
{
  global
  DllCall(PFNGLNORMALPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glColorPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLCOLORPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glIndexPointerEXT(type, stride, count, pointer)
{
  global
  DllCall(PFNGLINDEXPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glTexCoordPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLTEXCOORDPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glEdgeFlagPointerEXT(stride, count, pointer)
{
  global
  DllCall(PFNGLEDGEFLAGPOINTEREXTPROC, GLsizei, stride, GLsizei, count, GLptr, pointer)
}

glGetPointervEXT(pname, params)
{
  global
  DllCall(PFNGLGETPOINTERVEXTPROC, GLenum, pname, GLptr, params)
}

glArrayElementArrayEXT(mode, count, pi)
{
  global
  DllCall(PFNGLARRAYELEMENTARRAYEXTPROC, GLenum, mode, GLsizei, count, const GLvoid*, pi)
}

;WIN_draw_range_elements

glDrawRangeElementsWIN(mode, start, end, count, type, indices)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTSWINPROC, GLenum, mode, GLuint, start, GLuint, end, GLsizei, count, GLenum, type, GLptr, indices)
}

;WIN_swap_hint

glAddSwapHintRectWIN(x, y, width, height)
{
  global
  DllCall(PFNGLADDSWAPHINTRECTWINPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

;EXT_paletted_texture

glColorTableEXT(target, internalFormat, width, format, type, data)
{
  global
  DllCall(PFNGLCOLORTABLEEXTPROC, GLenum, target, GLenum, internalFormat, GLsizei, width, GLenum, format, GLenum, type, GLptr, data)
}

glColorSubTableEXT(target, start, count, format, type, data)
{
  global
  DllCall(PFNGLCOLORSUBTABLEEXTPROC, GLenum, target, GLsizei, start, GLsizei, count, GLenum, format, GLenum, type, GLptr, data)
}

glGetColorTableEXT(target, format, type, data)
{
  global
  DllCall(PFNGLGETCOLORTABLEEXTPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, data)
}

glGetColorTableParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetColorTableParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}


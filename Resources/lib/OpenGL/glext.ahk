; AutoHotkey header file for OpenGL extensions.
; glext.ahk last updated Date: 2011-03-08 (Tuesday, 08 Mar 2011)
; Converted by: Bentschi (bentschi1337@yahoo.de)

;=============================================================

/*
** Copyright (c) 2007-2010 The Khronos Group Inc.
** 
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
** 
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
** 
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/

/*
Header file version number, required by OpenGL ABI for Linux
glext.h last updated $Date: 2010-12-09 02:15:08 -0800 (Thu, 09 Dec 2010) $
Current version at http://www.opengl.org/registry/
#define GL_GLEXT_VERSION 67
Function declaration macros - to move into glplatform.h
*/

;=============================================================

GLptr := (A_PtrSize) ? "ptr" : "uint" ;AutoHotkey definition
GLastr := (A_IsUnicode) ? "astr" : "str" ;AutoHotkey definition

GL_GLEXT_VERSION := 67

;=============================================================

if (!GL_VERSION_1_2)
{
  GL_UNSIGNED_BYTE_3_3_2            := 0x8032
  GL_UNSIGNED_SHORT_4_4_4_4         := 0x8033
  GL_UNSIGNED_SHORT_5_5_5_1         := 0x8034
  GL_UNSIGNED_INT_8_8_8_8           := 0x8035
  GL_UNSIGNED_INT_10_10_10_2        := 0x8036
  GL_TEXTURE_BINDING_3D             := 0x806A
  GL_PACK_SKIP_IMAGES               := 0x806B
  GL_PACK_IMAGE_HEIGHT              := 0x806C
  GL_UNPACK_SKIP_IMAGES             := 0x806D
  GL_UNPACK_IMAGE_HEIGHT            := 0x806E
  GL_TEXTURE_3D                     := 0x806F
  GL_PROXY_TEXTURE_3D               := 0x8070
  GL_TEXTURE_DEPTH                  := 0x8071
  GL_TEXTURE_WRAP_R                 := 0x8072
  GL_MAX_3D_TEXTURE_SIZE            := 0x8073
  GL_UNSIGNED_BYTE_2_3_3_REV        := 0x8362
  GL_UNSIGNED_SHORT_5_6_5           := 0x8363
  GL_UNSIGNED_SHORT_5_6_5_REV       := 0x8364
  GL_UNSIGNED_SHORT_4_4_4_4_REV     := 0x8365
  GL_UNSIGNED_SHORT_1_5_5_5_REV     := 0x8366
  GL_UNSIGNED_INT_8_8_8_8_REV       := 0x8367
  GL_UNSIGNED_INT_2_10_10_10_REV    := 0x8368
  GL_BGR                            := 0x80E0
  GL_BGRA                           := 0x80E1
  GL_MAX_ELEMENTS_VERTICES          := 0x80E8
  GL_MAX_ELEMENTS_INDICES           := 0x80E9
  GL_CLAMP_TO_EDGE                  := 0x812F
  GL_TEXTURE_MIN_LOD                := 0x813A
  GL_TEXTURE_MAX_LOD                := 0x813B
  GL_TEXTURE_BASE_LEVEL             := 0x813C
  GL_TEXTURE_MAX_LEVEL              := 0x813D
  GL_SMOOTH_POINT_SIZE_RANGE        := 0x0B12
  GL_SMOOTH_POINT_SIZE_GRANULARITY  := 0x0B13
  GL_SMOOTH_LINE_WIDTH_RANGE        := 0x0B22
  GL_SMOOTH_LINE_WIDTH_GRANULARITY  := 0x0B23
  GL_ALIASED_LINE_WIDTH_RANGE       := 0x846E
}

if (!GL_VERSION_1_2_DEPRECATED)
{
  GL_RESCALE_NORMAL                 := 0x803A
  GL_LIGHT_MODEL_COLOR_CONTROL      := 0x81F8
  GL_SINGLE_COLOR                   := 0x81F9
  GL_SEPARATE_SPECULAR_COLOR        := 0x81FA
  GL_ALIASED_POINT_SIZE_RANGE       := 0x846D
}

if (!GL_ARB_imaging)
{
  GL_CONSTANT_COLOR                 := 0x8001
  GL_ONE_MINUS_CONSTANT_COLOR       := 0x8002
  GL_CONSTANT_ALPHA                 := 0x8003
  GL_ONE_MINUS_CONSTANT_ALPHA       := 0x8004
  GL_BLEND_COLOR                    := 0x8005
  GL_FUNC_ADD                       := 0x8006
  GL_MIN                            := 0x8007
  GL_MAX                            := 0x8008
  GL_BLEND_EQUATION                 := 0x8009
  GL_FUNC_SUBTRACT                  := 0x800A
  GL_FUNC_REVERSE_SUBTRACT          := 0x800B
}

if (!GL_ARB_imaging_DEPRECATED)
{
  GL_CONVOLUTION_1D                 := 0x8010
  GL_CONVOLUTION_2D                 := 0x8011
  GL_SEPARABLE_2D                   := 0x8012
  GL_CONVOLUTION_BORDER_MODE        := 0x8013
  GL_CONVOLUTION_FILTER_SCALE       := 0x8014
  GL_CONVOLUTION_FILTER_BIAS        := 0x8015
  GL_REDUCE                         := 0x8016
  GL_CONVOLUTION_FORMAT             := 0x8017
  GL_CONVOLUTION_WIDTH              := 0x8018
  GL_CONVOLUTION_HEIGHT             := 0x8019
  GL_MAX_CONVOLUTION_WIDTH          := 0x801A
  GL_MAX_CONVOLUTION_HEIGHT         := 0x801B
  GL_POST_CONVOLUTION_RED_SCALE     := 0x801C
  GL_POST_CONVOLUTION_GREEN_SCALE   := 0x801D
  GL_POST_CONVOLUTION_BLUE_SCALE    := 0x801E
  GL_POST_CONVOLUTION_ALPHA_SCALE   := 0x801F
  GL_POST_CONVOLUTION_RED_BIAS      := 0x8020
  GL_POST_CONVOLUTION_GREEN_BIAS    := 0x8021
  GL_POST_CONVOLUTION_BLUE_BIAS     := 0x8022
  GL_POST_CONVOLUTION_ALPHA_BIAS    := 0x8023
  GL_HISTOGRAM                      := 0x8024
  GL_PROXY_HISTOGRAM                := 0x8025
  GL_HISTOGRAM_WIDTH                := 0x8026
  GL_HISTOGRAM_FORMAT               := 0x8027
  GL_HISTOGRAM_RED_SIZE             := 0x8028
  GL_HISTOGRAM_GREEN_SIZE           := 0x8029
  GL_HISTOGRAM_BLUE_SIZE            := 0x802A
  GL_HISTOGRAM_ALPHA_SIZE           := 0x802B
  GL_HISTOGRAM_LUMINANCE_SIZE       := 0x802C
  GL_HISTOGRAM_SINK                 := 0x802D
  GL_MINMAX                         := 0x802E
  GL_MINMAX_FORMAT                  := 0x802F
  GL_MINMAX_SINK                    := 0x8030
  GL_TABLE_TOO_LARGE                := 0x8031
  GL_COLOR_MATRIX                   := 0x80B1
  GL_COLOR_MATRIX_STACK_DEPTH       := 0x80B2
  GL_MAX_COLOR_MATRIX_STACK_DEPTH   := 0x80B3
  GL_POST_COLOR_MATRIX_RED_SCALE    := 0x80B4
  GL_POST_COLOR_MATRIX_GREEN_SCALE  := 0x80B5
  GL_POST_COLOR_MATRIX_BLUE_SCALE   := 0x80B6
  GL_POST_COLOR_MATRIX_ALPHA_SCALE  := 0x80B7
  GL_POST_COLOR_MATRIX_RED_BIAS     := 0x80B8
  GL_POST_COLOR_MATRIX_GREEN_BIAS   := 0x80B9
  GL_POST_COLOR_MATRIX_BLUE_BIAS    := 0x80BA
  GL_POST_COLOR_MATRIX_ALPHA_BIAS   := 0x80BB
  GL_COLOR_TABLE                    := 0x80D0
  GL_POST_CONVOLUTION_COLOR_TABLE   := 0x80D1
  GL_POST_COLOR_MATRIX_COLOR_TABLE  := 0x80D2
  GL_PROXY_COLOR_TABLE              := 0x80D3
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE := 0x80D4
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE := 0x80D5
  GL_COLOR_TABLE_SCALE              := 0x80D6
  GL_COLOR_TABLE_BIAS               := 0x80D7
  GL_COLOR_TABLE_FORMAT             := 0x80D8
  GL_COLOR_TABLE_WIDTH              := 0x80D9
  GL_COLOR_TABLE_RED_SIZE           := 0x80DA
  GL_COLOR_TABLE_GREEN_SIZE         := 0x80DB
  GL_COLOR_TABLE_BLUE_SIZE          := 0x80DC
  GL_COLOR_TABLE_ALPHA_SIZE         := 0x80DD
  GL_COLOR_TABLE_LUMINANCE_SIZE     := 0x80DE
  GL_COLOR_TABLE_INTENSITY_SIZE     := 0x80DF
  GL_CONSTANT_BORDER                := 0x8151
  GL_REPLICATE_BORDER               := 0x8153
  GL_CONVOLUTION_BORDER_COLOR       := 0x8154
}

if (!GL_VERSION_1_3)
{
  GL_TEXTURE0                       := 0x84C0
  GL_TEXTURE1                       := 0x84C1
  GL_TEXTURE2                       := 0x84C2
  GL_TEXTURE3                       := 0x84C3
  GL_TEXTURE4                       := 0x84C4
  GL_TEXTURE5                       := 0x84C5
  GL_TEXTURE6                       := 0x84C6
  GL_TEXTURE7                       := 0x84C7
  GL_TEXTURE8                       := 0x84C8
  GL_TEXTURE9                       := 0x84C9
  GL_TEXTURE10                      := 0x84CA
  GL_TEXTURE11                      := 0x84CB
  GL_TEXTURE12                      := 0x84CC
  GL_TEXTURE13                      := 0x84CD
  GL_TEXTURE14                      := 0x84CE
  GL_TEXTURE15                      := 0x84CF
  GL_TEXTURE16                      := 0x84D0
  GL_TEXTURE17                      := 0x84D1
  GL_TEXTURE18                      := 0x84D2
  GL_TEXTURE19                      := 0x84D3
  GL_TEXTURE20                      := 0x84D4
  GL_TEXTURE21                      := 0x84D5
  GL_TEXTURE22                      := 0x84D6
  GL_TEXTURE23                      := 0x84D7
  GL_TEXTURE24                      := 0x84D8
  GL_TEXTURE25                      := 0x84D9
  GL_TEXTURE26                      := 0x84DA
  GL_TEXTURE27                      := 0x84DB
  GL_TEXTURE28                      := 0x84DC
  GL_TEXTURE29                      := 0x84DD
  GL_TEXTURE30                      := 0x84DE
  GL_TEXTURE31                      := 0x84DF
  GL_ACTIVE_TEXTURE                 := 0x84E0
  GL_MULTISAMPLE                    := 0x809D
  GL_SAMPLE_ALPHA_TO_COVERAGE       := 0x809E
  GL_SAMPLE_ALPHA_TO_ONE            := 0x809F
  GL_SAMPLE_COVERAGE                := 0x80A0
  GL_SAMPLE_BUFFERS                 := 0x80A8
  GL_SAMPLES                        := 0x80A9
  GL_SAMPLE_COVERAGE_VALUE          := 0x80AA
  GL_SAMPLE_COVERAGE_INVERT         := 0x80AB
  GL_TEXTURE_CUBE_MAP               := 0x8513
  GL_TEXTURE_BINDING_CUBE_MAP       := 0x8514
  GL_TEXTURE_CUBE_MAP_POSITIVE_X    := 0x8515
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X    := 0x8516
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y    := 0x8517
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    := 0x8518
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z    := 0x8519
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    := 0x851A
  GL_PROXY_TEXTURE_CUBE_MAP         := 0x851B
  GL_MAX_CUBE_MAP_TEXTURE_SIZE      := 0x851C
  GL_COMPRESSED_RGB                 := 0x84ED
  GL_COMPRESSED_RGBA                := 0x84EE
  GL_TEXTURE_COMPRESSION_HINT       := 0x84EF
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE  := 0x86A0
  GL_TEXTURE_COMPRESSED             := 0x86A1
  GL_NUM_COMPRESSED_TEXTURE_FORMATS := 0x86A2
  GL_COMPRESSED_TEXTURE_FORMATS     := 0x86A3
  GL_CLAMP_TO_BORDER                := 0x812D
}

if (!GL_VERSION_1_3_DEPRECATED)
{
  GL_CLIENT_ACTIVE_TEXTURE          := 0x84E1
  GL_MAX_TEXTURE_UNITS              := 0x84E2
  GL_TRANSPOSE_MODELVIEW_MATRIX     := 0x84E3
  GL_TRANSPOSE_PROJECTION_MATRIX    := 0x84E4
  GL_TRANSPOSE_TEXTURE_MATRIX       := 0x84E5
  GL_TRANSPOSE_COLOR_MATRIX         := 0x84E6
  GL_MULTISAMPLE_BIT                := 0x20000000
  GL_NORMAL_MAP                     := 0x8511
  GL_REFLECTION_MAP                 := 0x8512
  GL_COMPRESSED_ALPHA               := 0x84E9
  GL_COMPRESSED_LUMINANCE           := 0x84EA
  GL_COMPRESSED_LUMINANCE_ALPHA     := 0x84EB
  GL_COMPRESSED_INTENSITY           := 0x84EC
  GL_COMBINE                        := 0x8570
  GL_COMBINE_RGB                    := 0x8571
  GL_COMBINE_ALPHA                  := 0x8572
  GL_SOURCE0_RGB                    := 0x8580
  GL_SOURCE1_RGB                    := 0x8581
  GL_SOURCE2_RGB                    := 0x8582
  GL_SOURCE0_ALPHA                  := 0x8588
  GL_SOURCE1_ALPHA                  := 0x8589
  GL_SOURCE2_ALPHA                  := 0x858A
  GL_OPERAND0_RGB                   := 0x8590
  GL_OPERAND1_RGB                   := 0x8591
  GL_OPERAND2_RGB                   := 0x8592
  GL_OPERAND0_ALPHA                 := 0x8598
  GL_OPERAND1_ALPHA                 := 0x8599
  GL_OPERAND2_ALPHA                 := 0x859A
  GL_RGB_SCALE                      := 0x8573
  GL_ADD_SIGNED                     := 0x8574
  GL_INTERPOLATE                    := 0x8575
  GL_SUBTRACT                       := 0x84E7
  GL_CONSTANT                       := 0x8576
  GL_PRIMARY_COLOR                  := 0x8577
  GL_PREVIOUS                       := 0x8578
  GL_DOT3_RGB                       := 0x86AE
  GL_DOT3_RGBA                      := 0x86AF
}

if (!GL_VERSION_1_4)
{
  GL_BLEND_DST_RGB                  := 0x80C8
  GL_BLEND_SRC_RGB                  := 0x80C9
  GL_BLEND_DST_ALPHA                := 0x80CA
  GL_BLEND_SRC_ALPHA                := 0x80CB
  GL_POINT_FADE_THRESHOLD_SIZE      := 0x8128
  GL_DEPTH_COMPONENT16              := 0x81A5
  GL_DEPTH_COMPONENT24              := 0x81A6
  GL_DEPTH_COMPONENT32              := 0x81A7
  GL_MIRRORED_REPEAT                := 0x8370
  GL_MAX_TEXTURE_LOD_BIAS           := 0x84FD
  GL_TEXTURE_LOD_BIAS               := 0x8501
  GL_INCR_WRAP                      := 0x8507
  GL_DECR_WRAP                      := 0x8508
  GL_TEXTURE_DEPTH_SIZE             := 0x884A
  GL_TEXTURE_COMPARE_MODE           := 0x884C
  GL_TEXTURE_COMPARE_FUNC           := 0x884D
}

if (!GL_VERSION_1_4_DEPRECATED)
{
  GL_POINT_SIZE_MIN                 := 0x8126
  GL_POINT_SIZE_MAX                 := 0x8127
  GL_POINT_DISTANCE_ATTENUATION     := 0x8129
  GL_GENERATE_MIPMAP                := 0x8191
  GL_GENERATE_MIPMAP_HINT           := 0x8192
  GL_FOG_COORDINATE_SOURCE          := 0x8450
  GL_FOG_COORDINATE                 := 0x8451
  GL_FRAGMENT_DEPTH                 := 0x8452
  GL_CURRENT_FOG_COORDINATE         := 0x8453
  GL_FOG_COORDINATE_ARRAY_TYPE      := 0x8454
  GL_FOG_COORDINATE_ARRAY_STRIDE    := 0x8455
  GL_FOG_COORDINATE_ARRAY_POINTER   := 0x8456
  GL_FOG_COORDINATE_ARRAY           := 0x8457
  GL_COLOR_SUM                      := 0x8458
  GL_CURRENT_SECONDARY_COLOR        := 0x8459
  GL_SECONDARY_COLOR_ARRAY_SIZE     := 0x845A
  GL_SECONDARY_COLOR_ARRAY_TYPE     := 0x845B
  GL_SECONDARY_COLOR_ARRAY_STRIDE   := 0x845C
  GL_SECONDARY_COLOR_ARRAY_POINTER  := 0x845D
  GL_SECONDARY_COLOR_ARRAY          := 0x845E
  GL_TEXTURE_FILTER_CONTROL         := 0x8500
  GL_DEPTH_TEXTURE_MODE             := 0x884B
  GL_COMPARE_R_TO_TEXTURE           := 0x884E
}

if (!GL_VERSION_1_5)
{
  GL_BUFFER_SIZE                    := 0x8764
  GL_BUFFER_USAGE                   := 0x8765
  GL_QUERY_COUNTER_BITS             := 0x8864
  GL_CURRENT_QUERY                  := 0x8865
  GL_QUERY_RESULT                   := 0x8866
  GL_QUERY_RESULT_AVAILABLE         := 0x8867
  GL_ARRAY_BUFFER                   := 0x8892
  GL_ELEMENT_ARRAY_BUFFER           := 0x8893
  GL_ARRAY_BUFFER_BINDING           := 0x8894
  GL_ELEMENT_ARRAY_BUFFER_BINDING   := 0x8895
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING := 0x889F
  GL_READ_ONLY                      := 0x88B8
  GL_WRITE_ONLY                     := 0x88B9
  GL_READ_WRITE                     := 0x88BA
  GL_BUFFER_ACCESS                  := 0x88BB
  GL_BUFFER_MAPPED                  := 0x88BC
  GL_BUFFER_MAP_POINTER             := 0x88BD
  GL_STREAM_DRAW                    := 0x88E0
  GL_STREAM_READ                    := 0x88E1
  GL_STREAM_COPY                    := 0x88E2
  GL_STATIC_DRAW                    := 0x88E4
  GL_STATIC_READ                    := 0x88E5
  GL_STATIC_COPY                    := 0x88E6
  GL_DYNAMIC_DRAW                   := 0x88E8
  GL_DYNAMIC_READ                   := 0x88E9
  GL_DYNAMIC_COPY                   := 0x88EA
  GL_SAMPLES_PASSED                 := 0x8914
}

if (!GL_VERSION_1_5_DEPRECATED)
{
  GL_VERTEX_ARRAY_BUFFER_BINDING    := 0x8896
  GL_NORMAL_ARRAY_BUFFER_BINDING    := 0x8897
  GL_COLOR_ARRAY_BUFFER_BINDING     := 0x8898
  GL_INDEX_ARRAY_BUFFER_BINDING     := 0x8899
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING := 0x889A
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING := 0x889B
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING := 0x889C
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING := 0x889D
  GL_WEIGHT_ARRAY_BUFFER_BINDING    := 0x889E
  GL_FOG_COORD_SRC                  := 0x8450
  GL_FOG_COORD                      := 0x8451
  GL_CURRENT_FOG_COORD              := 0x8453
  GL_FOG_COORD_ARRAY_TYPE           := 0x8454
  GL_FOG_COORD_ARRAY_STRIDE         := 0x8455
  GL_FOG_COORD_ARRAY_POINTER        := 0x8456
  GL_FOG_COORD_ARRAY                := 0x8457
  GL_FOG_COORD_ARRAY_BUFFER_BINDING := 0x889D
  GL_SRC0_RGB                       := 0x8580
  GL_SRC1_RGB                       := 0x8581
  GL_SRC2_RGB                       := 0x8582
  GL_SRC0_ALPHA                     := 0x8588
  GL_SRC1_ALPHA                     := 0x8589
  GL_SRC2_ALPHA                     := 0x858A
}

if (!GL_VERSION_2_0)
{
  GL_BLEND_EQUATION_RGB             := 0x8009
  GL_VERTEX_ATTRIB_ARRAY_ENABLED    := 0x8622
  GL_VERTEX_ATTRIB_ARRAY_SIZE       := 0x8623
  GL_VERTEX_ATTRIB_ARRAY_STRIDE     := 0x8624
  GL_VERTEX_ATTRIB_ARRAY_TYPE       := 0x8625
  GL_CURRENT_VERTEX_ATTRIB          := 0x8626
  GL_VERTEX_PROGRAM_POINT_SIZE      := 0x8642
  GL_VERTEX_ATTRIB_ARRAY_POINTER    := 0x8645
  GL_STENCIL_BACK_FUNC              := 0x8800
  GL_STENCIL_BACK_FAIL              := 0x8801
  GL_STENCIL_BACK_PASS_DEPTH_FAIL   := 0x8802
  GL_STENCIL_BACK_PASS_DEPTH_PASS   := 0x8803
  GL_MAX_DRAW_BUFFERS               := 0x8824
  GL_DRAW_BUFFER0                   := 0x8825
  GL_DRAW_BUFFER1                   := 0x8826
  GL_DRAW_BUFFER2                   := 0x8827
  GL_DRAW_BUFFER3                   := 0x8828
  GL_DRAW_BUFFER4                   := 0x8829
  GL_DRAW_BUFFER5                   := 0x882A
  GL_DRAW_BUFFER6                   := 0x882B
  GL_DRAW_BUFFER7                   := 0x882C
  GL_DRAW_BUFFER8                   := 0x882D
  GL_DRAW_BUFFER9                   := 0x882E
  GL_DRAW_BUFFER10                  := 0x882F
  GL_DRAW_BUFFER11                  := 0x8830
  GL_DRAW_BUFFER12                  := 0x8831
  GL_DRAW_BUFFER13                  := 0x8832
  GL_DRAW_BUFFER14                  := 0x8833
  GL_DRAW_BUFFER15                  := 0x8834
  GL_BLEND_EQUATION_ALPHA           := 0x883D
  GL_MAX_VERTEX_ATTRIBS             := 0x8869
  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED := 0x886A
  GL_MAX_TEXTURE_IMAGE_UNITS        := 0x8872
  GL_FRAGMENT_SHADER                := 0x8B30
  GL_VERTEX_SHADER                  := 0x8B31
  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS := 0x8B49
  GL_MAX_VERTEX_UNIFORM_COMPONENTS  := 0x8B4A
  GL_MAX_VARYING_FLOATS             := 0x8B4B
  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS := 0x8B4C
  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS := 0x8B4D
  GL_SHADER_TYPE                    := 0x8B4F
  GL_FLOAT_VEC2                     := 0x8B50
  GL_FLOAT_VEC3                     := 0x8B51
  GL_FLOAT_VEC4                     := 0x8B52
  GL_INT_VEC2                       := 0x8B53
  GL_INT_VEC3                       := 0x8B54
  GL_INT_VEC4                       := 0x8B55
  GL_BOOL                           := 0x8B56
  GL_BOOL_VEC2                      := 0x8B57
  GL_BOOL_VEC3                      := 0x8B58
  GL_BOOL_VEC4                      := 0x8B59
  GL_FLOAT_MAT2                     := 0x8B5A
  GL_FLOAT_MAT3                     := 0x8B5B
  GL_FLOAT_MAT4                     := 0x8B5C
  GL_SAMPLER_1D                     := 0x8B5D
  GL_SAMPLER_2D                     := 0x8B5E
  GL_SAMPLER_3D                     := 0x8B5F
  GL_SAMPLER_CUBE                   := 0x8B60
  GL_SAMPLER_1D_SHADOW              := 0x8B61
  GL_SAMPLER_2D_SHADOW              := 0x8B62
  GL_DELETE_STATUS                  := 0x8B80
  GL_COMPILE_STATUS                 := 0x8B81
  GL_LINK_STATUS                    := 0x8B82
  GL_VALIDATE_STATUS                := 0x8B83
  GL_INFO_LOG_LENGTH                := 0x8B84
  GL_ATTACHED_SHADERS               := 0x8B85
  GL_ACTIVE_UNIFORMS                := 0x8B86
  GL_ACTIVE_UNIFORM_MAX_LENGTH      := 0x8B87
  GL_SHADER_SOURCE_LENGTH           := 0x8B88
  GL_ACTIVE_ATTRIBUTES              := 0x8B89
  GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    := 0x8B8A
  GL_FRAGMENT_SHADER_DERIVATIVE_HINT := 0x8B8B
  GL_SHADING_LANGUAGE_VERSION       := 0x8B8C
  GL_CURRENT_PROGRAM                := 0x8B8D
  GL_POINT_SPRITE_COORD_ORIGIN      := 0x8CA0
  GL_LOWER_LEFT                     := 0x8CA1
  GL_UPPER_LEFT                     := 0x8CA2
  GL_STENCIL_BACK_REF               := 0x8CA3
  GL_STENCIL_BACK_VALUE_MASK        := 0x8CA4
  GL_STENCIL_BACK_WRITEMASK         := 0x8CA5
}

if (!GL_VERSION_2_0_DEPRECATED)
{
  GL_VERTEX_PROGRAM_TWO_SIDE        := 0x8643
  GL_POINT_SPRITE                   := 0x8861
  GL_COORD_REPLACE                  := 0x8862
  GL_MAX_TEXTURE_COORDS             := 0x8871
}

if (!GL_VERSION_2_1)
{
  GL_PIXEL_PACK_BUFFER              := 0x88EB
  GL_PIXEL_UNPACK_BUFFER            := 0x88EC
  GL_PIXEL_PACK_BUFFER_BINDING      := 0x88ED
  GL_PIXEL_UNPACK_BUFFER_BINDING    := 0x88EF
  GL_FLOAT_MAT2x3                   := 0x8B65
  GL_FLOAT_MAT2x4                   := 0x8B66
  GL_FLOAT_MAT3x2                   := 0x8B67
  GL_FLOAT_MAT3x4                   := 0x8B68
  GL_FLOAT_MAT4x2                   := 0x8B69
  GL_FLOAT_MAT4x3                   := 0x8B6A
  GL_SRGB                           := 0x8C40
  GL_SRGB8                          := 0x8C41
  GL_SRGB_ALPHA                     := 0x8C42
  GL_SRGB8_ALPHA8                   := 0x8C43
  GL_COMPRESSED_SRGB                := 0x8C48
  GL_COMPRESSED_SRGB_ALPHA          := 0x8C49
}

if (!GL_VERSION_2_1_DEPRECATED)
{
  GL_CURRENT_RASTER_SECONDARY_COLOR := 0x845F
  GL_SLUMINANCE_ALPHA               := 0x8C44
  GL_SLUMINANCE8_ALPHA8             := 0x8C45
  GL_SLUMINANCE                     := 0x8C46
  GL_SLUMINANCE8                    := 0x8C47
  GL_COMPRESSED_SLUMINANCE          := 0x8C4A
  GL_COMPRESSED_SLUMINANCE_ALPHA    := 0x8C4B
}

if (!GL_VERSION_3_0)
{
  GL_COMPARE_REF_TO_TEXTURE         := 0x884E
  GL_CLIP_DISTANCE0                 := 0x3000
  GL_CLIP_DISTANCE1                 := 0x3001
  GL_CLIP_DISTANCE2                 := 0x3002
  GL_CLIP_DISTANCE3                 := 0x3003
  GL_CLIP_DISTANCE4                 := 0x3004
  GL_CLIP_DISTANCE5                 := 0x3005
  GL_CLIP_DISTANCE6                 := 0x3006
  GL_CLIP_DISTANCE7                 := 0x3007
  GL_MAX_CLIP_DISTANCES             := 0x0D32
  GL_MAJOR_VERSION                  := 0x821B
  GL_MINOR_VERSION                  := 0x821C
  GL_NUM_EXTENSIONS                 := 0x821D
  GL_CONTEXT_FLAGS                  := 0x821E
  GL_DEPTH_BUFFER                   := 0x8223
  GL_STENCIL_BUFFER                 := 0x8224
  GL_COMPRESSED_RED                 := 0x8225
  GL_COMPRESSED_RG                  := 0x8226
  GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT := 0x0001
  GL_RGBA32F                        := 0x8814
  GL_RGB32F                         := 0x8815
  GL_RGBA16F                        := 0x881A
  GL_RGB16F                         := 0x881B
  GL_VERTEX_ATTRIB_ARRAY_INTEGER    := 0x88FD
  GL_MAX_ARRAY_TEXTURE_LAYERS       := 0x88FF
  GL_MIN_PROGRAM_TEXEL_OFFSET       := 0x8904
  GL_MAX_PROGRAM_TEXEL_OFFSET       := 0x8905
  GL_CLAMP_READ_COLOR               := 0x891C
  GL_FIXED_ONLY                     := 0x891D
  GL_MAX_VARYING_COMPONENTS         := 0x8B4B
  GL_TEXTURE_1D_ARRAY               := 0x8C18
  GL_PROXY_TEXTURE_1D_ARRAY         := 0x8C19
  GL_TEXTURE_2D_ARRAY               := 0x8C1A
  GL_PROXY_TEXTURE_2D_ARRAY         := 0x8C1B
  GL_TEXTURE_BINDING_1D_ARRAY       := 0x8C1C
  GL_TEXTURE_BINDING_2D_ARRAY       := 0x8C1D
  GL_R11F_G11F_B10F                 := 0x8C3A
  GL_UNSIGNED_INT_10F_11F_11F_REV   := 0x8C3B
  GL_RGB9_E5                        := 0x8C3D
  GL_UNSIGNED_INT_5_9_9_9_REV       := 0x8C3E
  GL_TEXTURE_SHARED_SIZE            := 0x8C3F
  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH := 0x8C76
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE := 0x8C7F
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS := 0x8C80
  GL_TRANSFORM_FEEDBACK_VARYINGS    := 0x8C83
  GL_TRANSFORM_FEEDBACK_BUFFER_START := 0x8C84
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE := 0x8C85
  GL_PRIMITIVES_GENERATED           := 0x8C87
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN := 0x8C88
  GL_RASTERIZER_DISCARD             := 0x8C89
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS := 0x8C8A
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS := 0x8C8B
  GL_INTERLEAVED_ATTRIBS            := 0x8C8C
  GL_SEPARATE_ATTRIBS               := 0x8C8D
  GL_TRANSFORM_FEEDBACK_BUFFER      := 0x8C8E
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING := 0x8C8F
  GL_RGBA32UI                       := 0x8D70
  GL_RGB32UI                        := 0x8D71
  GL_RGBA16UI                       := 0x8D76
  GL_RGB16UI                        := 0x8D77
  GL_RGBA8UI                        := 0x8D7C
  GL_RGB8UI                         := 0x8D7D
  GL_RGBA32I                        := 0x8D82
  GL_RGB32I                         := 0x8D83
  GL_RGBA16I                        := 0x8D88
  GL_RGB16I                         := 0x8D89
  GL_RGBA8I                         := 0x8D8E
  GL_RGB8I                          := 0x8D8F
  GL_RED_INTEGER                    := 0x8D94
  GL_GREEN_INTEGER                  := 0x8D95
  GL_BLUE_INTEGER                   := 0x8D96
  GL_RGB_INTEGER                    := 0x8D98
  GL_RGBA_INTEGER                   := 0x8D99
  GL_BGR_INTEGER                    := 0x8D9A
  GL_BGRA_INTEGER                   := 0x8D9B
  GL_SAMPLER_1D_ARRAY               := 0x8DC0
  GL_SAMPLER_2D_ARRAY               := 0x8DC1
  GL_SAMPLER_1D_ARRAY_SHADOW        := 0x8DC3
  GL_SAMPLER_2D_ARRAY_SHADOW        := 0x8DC4
  GL_SAMPLER_CUBE_SHADOW            := 0x8DC5
  GL_UNSIGNED_INT_VEC2              := 0x8DC6
  GL_UNSIGNED_INT_VEC3              := 0x8DC7
  GL_UNSIGNED_INT_VEC4              := 0x8DC8
  GL_INT_SAMPLER_1D                 := 0x8DC9
  GL_INT_SAMPLER_2D                 := 0x8DCA
  GL_INT_SAMPLER_3D                 := 0x8DCB
  GL_INT_SAMPLER_CUBE               := 0x8DCC
  GL_INT_SAMPLER_1D_ARRAY           := 0x8DCE
  GL_INT_SAMPLER_2D_ARRAY           := 0x8DCF
  GL_UNSIGNED_INT_SAMPLER_1D        := 0x8DD1
  GL_UNSIGNED_INT_SAMPLER_2D        := 0x8DD2
  GL_UNSIGNED_INT_SAMPLER_3D        := 0x8DD3
  GL_UNSIGNED_INT_SAMPLER_CUBE      := 0x8DD4
  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY  := 0x8DD6
  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY  := 0x8DD7
  GL_QUERY_WAIT                     := 0x8E13
  GL_QUERY_NO_WAIT                  := 0x8E14
  GL_QUERY_BY_REGION_WAIT           := 0x8E15
  GL_QUERY_BY_REGION_NO_WAIT        := 0x8E16
  GL_BUFFER_ACCESS_FLAGS            := 0x911F
  GL_BUFFER_MAP_LENGTH              := 0x9120
  GL_BUFFER_MAP_OFFSET              := 0x9121
  ;Reuse tokens from ARB_depth_buffer_float
  ;reuse GL_DEPTH_COMPONENT32F
  ;reuse GL_DEPTH32F_STENCIL8
  ;reuse GL_FLOAT_32_UNSIGNED_INT_24_8_REV
  ;Reuse tokens from ARB_framebuffer_object
  ;reuse GL_INVALID_FRAMEBUFFER_OPERATION
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE
  ;reuse GL_FRAMEBUFFER_DEFAULT
  ;reuse GL_FRAMEBUFFER_UNDEFINED
  ;reuse GL_DEPTH_STENCIL_ATTACHMENT
  ;reuse GL_INDEX
  ;reuse GL_MAX_RENDERBUFFER_SIZE
  ;reuse GL_DEPTH_STENCIL
  ;reuse GL_UNSIGNED_INT_24_8
  ;reuse GL_DEPTH24_STENCIL8
  ;reuse GL_TEXTURE_STENCIL_SIZE
  ;reuse GL_TEXTURE_RED_TYPE
  ;reuse GL_TEXTURE_GREEN_TYPE
  ;reuse GL_TEXTURE_BLUE_TYPE
  ;reuse GL_TEXTURE_ALPHA_TYPE
  ;reuse GL_TEXTURE_DEPTH_TYPE
  ;reuse GL_UNSIGNED_NORMALIZED
  ;reuse GL_FRAMEBUFFER_BINDING
  ;reuse GL_DRAW_FRAMEBUFFER_BINDING
  ;reuse GL_RENDERBUFFER_BINDING
  ;reuse GL_READ_FRAMEBUFFER
  ;reuse GL_DRAW_FRAMEBUFFER
  ;reuse GL_READ_FRAMEBUFFER_BINDING
  ;reuse GL_RENDERBUFFER_SAMPLES
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
  ;reuse GL_FRAMEBUFFER_COMPLETE
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER
  ;reuse GL_FRAMEBUFFER_UNSUPPORTED
  ;reuse GL_MAX_COLOR_ATTACHMENTS
  ;reuse GL_COLOR_ATTACHMENT0
  ;reuse GL_COLOR_ATTACHMENT1
  ;reuse GL_COLOR_ATTACHMENT2
  ;reuse GL_COLOR_ATTACHMENT3
  ;reuse GL_COLOR_ATTACHMENT4
  ;reuse GL_COLOR_ATTACHMENT5
  ;reuse GL_COLOR_ATTACHMENT6
  ;reuse GL_COLOR_ATTACHMENT7
  ;reuse GL_COLOR_ATTACHMENT8
  ;reuse GL_COLOR_ATTACHMENT9
  ;reuse GL_COLOR_ATTACHMENT10
  ;reuse GL_COLOR_ATTACHMENT11
  ;reuse GL_COLOR_ATTACHMENT12
  ;reuse GL_COLOR_ATTACHMENT13
  ;reuse GL_COLOR_ATTACHMENT14
  ;reuse GL_COLOR_ATTACHMENT15
  ;reuse GL_DEPTH_ATTACHMENT
  ;reuse GL_STENCIL_ATTACHMENT
  ;reuse GL_FRAMEBUFFER
  ;reuse GL_RENDERBUFFER
  ;reuse GL_RENDERBUFFER_WIDTH
  ;reuse GL_RENDERBUFFER_HEIGHT
  ;reuse GL_RENDERBUFFER_INTERNAL_FORMAT
  ;reuse GL_STENCIL_INDEX1
  ;reuse GL_STENCIL_INDEX4
  ;reuse GL_STENCIL_INDEX8
  ;reuse GL_STENCIL_INDEX16
  ;reuse GL_RENDERBUFFER_RED_SIZE
  ;reuse GL_RENDERBUFFER_GREEN_SIZE
  ;reuse GL_RENDERBUFFER_BLUE_SIZE
  ;reuse GL_RENDERBUFFER_ALPHA_SIZE
  ;reuse GL_RENDERBUFFER_DEPTH_SIZE
  ;reuse GL_RENDERBUFFER_STENCIL_SIZE
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE
  ;reuse GL_MAX_SAMPLES
  ;Reuse tokens from ARB_framebuffer_sRGB
  ;reuse GL_FRAMEBUFFER_SRGB
  ;Reuse tokens from ARB_half_float_vertex
  ;reuse GL_HALF_FLOAT
  ;Reuse tokens from ARB_map_buffer_range
  ;reuse GL_MAP_READ_BIT
  ;reuse GL_MAP_WRITE_BIT
  ;reuse GL_MAP_INVALIDATE_RANGE_BIT
  ;reuse GL_MAP_INVALIDATE_BUFFER_BIT
  ;reuse GL_MAP_FLUSH_EXPLICIT_BIT
  ;reuse GL_MAP_UNSYNCHRONIZED_BIT
  ;Reuse tokens from ARB_texture_compression_rgtc
  ;reuse GL_COMPRESSED_RED_RGTC1
  ;reuse GL_COMPRESSED_SIGNED_RED_RGTC1
  ;reuse GL_COMPRESSED_RG_RGTC2
  ;reuse GL_COMPRESSED_SIGNED_RG_RGTC2
  ;Reuse tokens from ARB_texture_rg
  ;reuse GL_RG
  ;reuse GL_RG_INTEGER
  ;reuse GL_R8
  ;reuse GL_R16
  ;reuse GL_RG8
  ;reuse GL_RG16
  ;reuse GL_R16F
  ;reuse GL_R32F
  ;reuse GL_RG16F
  ;reuse GL_RG32F
  ;reuse GL_R8I
  ;reuse GL_R8UI
  ;reuse GL_R16I
  ;reuse GL_R16UI
  ;reuse GL_R32I
  ;reuse GL_R32UI
  ;reuse GL_RG8I
  ;reuse GL_RG8UI
  ;reuse GL_RG16I
  ;reuse GL_RG16UI
  ;reuse GL_RG32I
  ;reuse GL_RG32UI
  ;Reuse tokens from ARB_vertex_array_object
  ;reuse GL_VERTEX_ARRAY_BINDING
}

if (!GL_VERSION_3_0_DEPRECATED)
{
  GL_CLAMP_VERTEX_COLOR             := 0x891A
  GL_CLAMP_FRAGMENT_COLOR           := 0x891B
  GL_ALPHA_INTEGER                  := 0x8D97
  ;Reuse tokens from ARB_framebuffer_object
  ;reuse GL_TEXTURE_LUMINANCE_TYPE
  ;reuse GL_TEXTURE_INTENSITY_TYPE
}

if (!GL_VERSION_3_1)
{
  GL_SAMPLER_2D_RECT                := 0x8B63
  GL_SAMPLER_2D_RECT_SHADOW         := 0x8B64
  GL_SAMPLER_BUFFER                 := 0x8DC2
  GL_INT_SAMPLER_2D_RECT            := 0x8DCD
  GL_INT_SAMPLER_BUFFER             := 0x8DD0
  GL_UNSIGNED_INT_SAMPLER_2D_RECT   := 0x8DD5
  GL_UNSIGNED_INT_SAMPLER_BUFFER    := 0x8DD8
  GL_TEXTURE_BUFFER                 := 0x8C2A
  GL_MAX_TEXTURE_BUFFER_SIZE        := 0x8C2B
  GL_TEXTURE_BINDING_BUFFER         := 0x8C2C
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING := 0x8C2D
  GL_TEXTURE_BUFFER_FORMAT          := 0x8C2E
  GL_TEXTURE_RECTANGLE              := 0x84F5
  GL_TEXTURE_BINDING_RECTANGLE      := 0x84F6
  GL_PROXY_TEXTURE_RECTANGLE        := 0x84F7
  GL_MAX_RECTANGLE_TEXTURE_SIZE     := 0x84F8
  GL_RED_SNORM                      := 0x8F90
  GL_RG_SNORM                       := 0x8F91
  GL_RGB_SNORM                      := 0x8F92
  GL_RGBA_SNORM                     := 0x8F93
  GL_R8_SNORM                       := 0x8F94
  GL_RG8_SNORM                      := 0x8F95
  GL_RGB8_SNORM                     := 0x8F96
  GL_RGBA8_SNORM                    := 0x8F97
  GL_R16_SNORM                      := 0x8F98
  GL_RG16_SNORM                     := 0x8F99
  GL_RGB16_SNORM                    := 0x8F9A
  GL_RGBA16_SNORM                   := 0x8F9B
  GL_SIGNED_NORMALIZED              := 0x8F9C
  GL_PRIMITIVE_RESTART              := 0x8F9D
  GL_PRIMITIVE_RESTART_INDEX        := 0x8F9E
  ;Reuse tokens from ARB_copy_buffer
  ;reuse GL_COPY_READ_BUFFER
  ;reuse GL_COPY_WRITE_BUFFER
  ;Reuse tokens from ARB_draw_instanced (none)
  ;Reuse tokens from ARB_uniform_buffer_object
  ;reuse GL_UNIFORM_BUFFER
  ;reuse GL_UNIFORM_BUFFER_BINDING
  ;reuse GL_UNIFORM_BUFFER_START
  ;reuse GL_UNIFORM_BUFFER_SIZE
  ;reuse GL_MAX_VERTEX_UNIFORM_BLOCKS
  ;reuse GL_MAX_FRAGMENT_UNIFORM_BLOCKS
  ;reuse GL_MAX_COMBINED_UNIFORM_BLOCKS
  ;reuse GL_MAX_UNIFORM_BUFFER_BINDINGS
  ;reuse GL_MAX_UNIFORM_BLOCK_SIZE
  ;reuse GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS
  ;reuse GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS
  ;reuse GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT
  ;reuse GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH
  ;reuse GL_ACTIVE_UNIFORM_BLOCKS
  ;reuse GL_UNIFORM_TYPE
  ;reuse GL_UNIFORM_SIZE
  ;reuse GL_UNIFORM_NAME_LENGTH
  ;reuse GL_UNIFORM_BLOCK_INDEX
  ;reuse GL_UNIFORM_OFFSET
  ;reuse GL_UNIFORM_ARRAY_STRIDE
  ;reuse GL_UNIFORM_MATRIX_STRIDE
  ;reuse GL_UNIFORM_IS_ROW_MAJOR
  ;reuse GL_UNIFORM_BLOCK_BINDING
  ;reuse GL_UNIFORM_BLOCK_DATA_SIZE
  ;reuse GL_UNIFORM_BLOCK_NAME_LENGTH
  ;reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS
  ;reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES
  ;reuse GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER
  ;reuse GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER
  ;reuse GL_INVALID_INDEX
}

if (!GL_VERSION_3_2)
{
  GL_CONTEXT_CORE_PROFILE_BIT       := 0x00000001
  GL_CONTEXT_COMPATIBILITY_PROFILE_BIT := 0x00000002
  GL_LINES_ADJACENCY                := 0x000A
  GL_LINE_STRIP_ADJACENCY           := 0x000B
  GL_TRIANGLES_ADJACENCY            := 0x000C
  GL_TRIANGLE_STRIP_ADJACENCY       := 0x000D
  GL_PROGRAM_POINT_SIZE             := 0x8642
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS := 0x8C29
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED := 0x8DA7
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS := 0x8DA8
  GL_GEOMETRY_SHADER                := 0x8DD9
  GL_GEOMETRY_VERTICES_OUT          := 0x8916
  GL_GEOMETRY_INPUT_TYPE            := 0x8917
  GL_GEOMETRY_OUTPUT_TYPE           := 0x8918
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS := 0x8DDF
  GL_MAX_GEOMETRY_OUTPUT_VERTICES   := 0x8DE0
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS := 0x8DE1
  GL_MAX_VERTEX_OUTPUT_COMPONENTS   := 0x9122
  GL_MAX_GEOMETRY_INPUT_COMPONENTS  := 0x9123
  GL_MAX_GEOMETRY_OUTPUT_COMPONENTS := 0x9124
  GL_MAX_FRAGMENT_INPUT_COMPONENTS  := 0x9125
  GL_CONTEXT_PROFILE_MASK           := 0x9126
  ;reuse GL_MAX_VARYING_COMPONENTS
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
  ;Reuse tokens from ARB_depth_clamp
  ;reuse GL_DEPTH_CLAMP
  ;Reuse tokens from ARB_draw_elements_base_vertex (none)
  ;Reuse tokens from ARB_fragment_coord_conventions (none)
  ;Reuse tokens from ARB_provoking_vertex
  ;reuse GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION
  ;reuse GL_FIRST_VERTEX_CONVENTION
  ;reuse GL_LAST_VERTEX_CONVENTION
  ;reuse GL_PROVOKING_VERTEX
  ;Reuse tokens from ARB_seamless_cube_map
  ;reuse GL_TEXTURE_CUBE_MAP_SEAMLESS
  ;Reuse tokens from ARB_sync
  ;reuse GL_MAX_SERVER_WAIT_TIMEOUT
  ;reuse GL_OBJECT_TYPE
  ;reuse GL_SYNC_CONDITION
  ;reuse GL_SYNC_STATUS
  ;reuse GL_SYNC_FLAGS
  ;reuse GL_SYNC_FENCE
  ;reuse GL_SYNC_GPU_COMMANDS_COMPLETE
  ;reuse GL_UNSIGNALED
  ;reuse GL_SIGNALED
  ;reuse GL_ALREADY_SIGNALED
  ;reuse GL_TIMEOUT_EXPIRED
  ;reuse GL_CONDITION_SATISFIED
  ;reuse GL_WAIT_FAILED
  ;reuse GL_TIMEOUT_IGNORED
  ;reuse GL_SYNC_FLUSH_COMMANDS_BIT
  ;reuse GL_TIMEOUT_IGNORED
  ;Reuse tokens from ARB_texture_multisample
  ;reuse GL_SAMPLE_POSITION
  ;reuse GL_SAMPLE_MASK
  ;reuse GL_SAMPLE_MASK_VALUE
  ;reuse GL_MAX_SAMPLE_MASK_WORDS
  ;reuse GL_TEXTURE_2D_MULTISAMPLE
  ;reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE
  ;reuse GL_TEXTURE_2D_MULTISAMPLE_ARRAY
  ;reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY
  ;reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE
  ;reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY
  ;reuse GL_TEXTURE_SAMPLES
  ;reuse GL_TEXTURE_FIXED_SAMPLE_LOCATIONS
  ;reuse GL_SAMPLER_2D_MULTISAMPLE
  ;reuse GL_INT_SAMPLER_2D_MULTISAMPLE
  ;reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE
  ;reuse GL_SAMPLER_2D_MULTISAMPLE_ARRAY
  ;reuse GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
  ;reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
  ;reuse GL_MAX_COLOR_TEXTURE_SAMPLES
  ;reuse GL_MAX_DEPTH_TEXTURE_SAMPLES
  ;reuse GL_MAX_INTEGER_SAMPLES
  ;Don't need to reuse tokens from ARB_vertex_array_bgra since they're already in 1.2 core
}

if (!GL_VERSION_3_3)
{
  GL_VERTEX_ATTRIB_ARRAY_DIVISOR    := 0x88FE
  ;Reuse tokens from ARB_blend_func_extended
  ;reuse GL_SRC1_COLOR
  ;reuse GL_ONE_MINUS_SRC1_COLOR
  ;reuse GL_ONE_MINUS_SRC1_ALPHA
  ;reuse GL_MAX_DUAL_SOURCE_DRAW_BUFFERS
  ;Reuse tokens from ARB_explicit_attrib_location (none)
  ;Reuse tokens from ARB_occlusion_query2
  ;reuse GL_ANY_SAMPLES_PASSED
  ;Reuse tokens from ARB_sampler_objects
  ;reuse GL_SAMPLER_BINDING
  ;Reuse tokens from ARB_shader_bit_encoding (none)
  ;Reuse tokens from ARB_texture_rgb10_a2ui
  ;reuse GL_RGB10_A2UI
  ;Reuse tokens from ARB_texture_swizzle
  ;reuse GL_TEXTURE_SWIZZLE_R
  ;reuse GL_TEXTURE_SWIZZLE_G
  ;reuse GL_TEXTURE_SWIZZLE_B
  ;reuse GL_TEXTURE_SWIZZLE_A
  ;reuse GL_TEXTURE_SWIZZLE_RGBA
  ;Reuse tokens from ARB_timer_query
  ;reuse GL_TIME_ELAPSED
  ;reuse GL_TIMESTAMP
  ;Reuse tokens from ARB_vertex_type_2_10_10_10_rev
  ;reuse GL_INT_2_10_10_10_REV
}

if (!GL_VERSION_4_0)
{
  GL_SAMPLE_SHADING                 := 0x8C36
  GL_MIN_SAMPLE_SHADING_VALUE       := 0x8C37
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET := 0x8E5E
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET := 0x8E5F
  GL_TEXTURE_CUBE_MAP_ARRAY         := 0x9009
  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY := 0x900A
  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY   := 0x900B
  GL_SAMPLER_CUBE_MAP_ARRAY         := 0x900C
  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW  := 0x900D
  GL_INT_SAMPLER_CUBE_MAP_ARRAY     := 0x900E
  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY := 0x900F
  ;Reuse tokens from ARB_texture_query_lod (none)
  ;Reuse tokens from ARB_draw_buffers_blend (none)
  ;Reuse tokens from ARB_draw_indirect
  ;reuse GL_DRAW_INDIRECT_BUFFER
  ;reuse GL_DRAW_INDIRECT_BUFFER_BINDING
  ;Reuse tokens from ARB_gpu_shader5
  ;reuse GL_GEOMETRY_SHADER_INVOCATIONS
  ;reuse GL_MAX_GEOMETRY_SHADER_INVOCATIONS
  ;reuse GL_MIN_FRAGMENT_INTERPOLATION_OFFSET
  ;reuse GL_MAX_FRAGMENT_INTERPOLATION_OFFSET
  ;reuse GL_FRAGMENT_INTERPOLATION_OFFSET_BITS
  ;reuse GL_MAX_VERTEX_STREAMS
  ;Reuse tokens from ARB_gpu_shader_fp64
  ;reuse GL_DOUBLE_VEC2
  ;reuse GL_DOUBLE_VEC3
  ;reuse GL_DOUBLE_VEC4
  ;reuse GL_DOUBLE_MAT2
  ;reuse GL_DOUBLE_MAT3
  ;reuse GL_DOUBLE_MAT4
  ;reuse GL_DOUBLE_MAT2x3
  ;reuse GL_DOUBLE_MAT2x4
  ;reuse GL_DOUBLE_MAT3x2
  ;reuse GL_DOUBLE_MAT3x4
  ;reuse GL_DOUBLE_MAT4x2
  ;reuse GL_DOUBLE_MAT4x3
  ;Reuse tokens from ARB_shader_subroutine
  ;reuse GL_ACTIVE_SUBROUTINES
  ;reuse GL_ACTIVE_SUBROUTINE_UNIFORMS
  ;reuse GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS
  ;reuse GL_ACTIVE_SUBROUTINE_MAX_LENGTH
  ;reuse GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH
  ;reuse GL_MAX_SUBROUTINES
  ;reuse GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS
  ;reuse GL_NUM_COMPATIBLE_SUBROUTINES
  ;reuse GL_COMPATIBLE_SUBROUTINES
  ;Reuse tokens from ARB_tessellation_shader
  ;reuse GL_PATCHES
  ;reuse GL_PATCH_VERTICES
  ;reuse GL_PATCH_DEFAULT_INNER_LEVEL
  ;reuse GL_PATCH_DEFAULT_OUTER_LEVEL
  ;reuse GL_TESS_CONTROL_OUTPUT_VERTICES
  ;reuse GL_TESS_GEN_MODE
  ;reuse GL_TESS_GEN_SPACING
  ;reuse GL_TESS_GEN_VERTEX_ORDER
  ;reuse GL_TESS_GEN_POINT_MODE
  ;reuse GL_ISOLINES
  ;reuse GL_FRACTIONAL_ODD
  ;reuse GL_FRACTIONAL_EVEN
  ;reuse GL_MAX_PATCH_VERTICES
  ;reuse GL_MAX_TESS_GEN_LEVEL
  ;reuse GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS
  ;reuse GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS
  ;reuse GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS
  ;reuse GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS
  ;reuse GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS
  ;reuse GL_MAX_TESS_PATCH_COMPONENTS
  ;reuse GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS
  ;reuse GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS
  ;reuse GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS
  ;reuse GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS
  ;reuse GL_MAX_TESS_CONTROL_INPUT_COMPONENTS
  ;reuse GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS
  ;reuse GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS
  ;reuse GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS
  ;reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER
  ;reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER
  ;reuse GL_TESS_EVALUATION_SHADER
  ;reuse GL_TESS_CONTROL_SHADER
  ;Reuse tokens from ARB_texture_buffer_object_rgb32 (none)
  ;Reuse tokens from ARB_transform_feedback2
  ;reuse GL_TRANSFORM_FEEDBACK
  ;reuse GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED
  ;reuse GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE
  ;reuse GL_TRANSFORM_FEEDBACK_BINDING
  ;Reuse tokens from ARB_transform_feedback3
  ;reuse GL_MAX_TRANSFORM_FEEDBACK_BUFFERS
  ;reuse GL_MAX_VERTEX_STREAMS
}

if (!GL_VERSION_4_1)
{
  ;Reuse tokens from ARB_ES2_compatibility
  ;reuse GL_FIXED
  ;reuse GL_IMPLEMENTATION_COLOR_READ_TYPE
  ;reuse GL_IMPLEMENTATION_COLOR_READ_FORMAT
  ;reuse GL_LOW_FLOAT
  ;reuse GL_MEDIUM_FLOAT
  ;reuse GL_HIGH_FLOAT
  ;reuse GL_LOW_INT
  ;reuse GL_MEDIUM_INT
  ;reuse GL_HIGH_INT
  ;reuse GL_SHADER_COMPILER
  ;reuse GL_NUM_SHADER_BINARY_FORMATS
  ;reuse GL_MAX_VERTEX_UNIFORM_VECTORS
  ;reuse GL_MAX_VARYING_VECTORS
  ;reuse GL_MAX_FRAGMENT_UNIFORM_VECTORS
  ;Reuse tokens from ARB_get_program_binary
  ;reuse GL_PROGRAM_BINARY_RETRIEVABLE_HINT
  ;reuse GL_PROGRAM_BINARY_LENGTH
  ;reuse GL_NUM_PROGRAM_BINARY_FORMATS
  ;reuse GL_PROGRAM_BINARY_FORMATS
  ;Reuse tokens from ARB_separate_shader_objects
  ;reuse GL_VERTEX_SHADER_BIT
  ;reuse GL_FRAGMENT_SHADER_BIT
  ;reuse GL_GEOMETRY_SHADER_BIT
  ;reuse GL_TESS_CONTROL_SHADER_BIT
  ;reuse GL_TESS_EVALUATION_SHADER_BIT
  ;reuse GL_ALL_SHADER_BITS
  ;reuse GL_PROGRAM_SEPARABLE
  ;reuse GL_ACTIVE_PROGRAM
  ;reuse GL_PROGRAM_PIPELINE_BINDING
  ;Reuse tokens from ARB_shader_precision (none)
  ;Reuse tokens from ARB_vertex_attrib_64bit - all are in GL 3.0 and 4.0 already
  ;Reuse tokens from ARB_viewport_array - some are in GL 1.1 and ARB_provoking_vertex already
  ;reuse GL_MAX_VIEWPORTS
  ;reuse GL_VIEWPORT_SUBPIXEL_BITS
  ;reuse GL_VIEWPORT_BOUNDS_RANGE
  ;reuse GL_LAYER_PROVOKING_VERTEX
  ;reuse GL_VIEWPORT_INDEX_PROVOKING_VERTEX
  ;reuse GL_UNDEFINED_VERTEX
}

if (!GL_ARB_multitexture)
{
  GL_TEXTURE0_ARB                   := 0x84C0
  GL_TEXTURE1_ARB                   := 0x84C1
  GL_TEXTURE2_ARB                   := 0x84C2
  GL_TEXTURE3_ARB                   := 0x84C3
  GL_TEXTURE4_ARB                   := 0x84C4
  GL_TEXTURE5_ARB                   := 0x84C5
  GL_TEXTURE6_ARB                   := 0x84C6
  GL_TEXTURE7_ARB                   := 0x84C7
  GL_TEXTURE8_ARB                   := 0x84C8
  GL_TEXTURE9_ARB                   := 0x84C9
  GL_TEXTURE10_ARB                  := 0x84CA
  GL_TEXTURE11_ARB                  := 0x84CB
  GL_TEXTURE12_ARB                  := 0x84CC
  GL_TEXTURE13_ARB                  := 0x84CD
  GL_TEXTURE14_ARB                  := 0x84CE
  GL_TEXTURE15_ARB                  := 0x84CF
  GL_TEXTURE16_ARB                  := 0x84D0
  GL_TEXTURE17_ARB                  := 0x84D1
  GL_TEXTURE18_ARB                  := 0x84D2
  GL_TEXTURE19_ARB                  := 0x84D3
  GL_TEXTURE20_ARB                  := 0x84D4
  GL_TEXTURE21_ARB                  := 0x84D5
  GL_TEXTURE22_ARB                  := 0x84D6
  GL_TEXTURE23_ARB                  := 0x84D7
  GL_TEXTURE24_ARB                  := 0x84D8
  GL_TEXTURE25_ARB                  := 0x84D9
  GL_TEXTURE26_ARB                  := 0x84DA
  GL_TEXTURE27_ARB                  := 0x84DB
  GL_TEXTURE28_ARB                  := 0x84DC
  GL_TEXTURE29_ARB                  := 0x84DD
  GL_TEXTURE30_ARB                  := 0x84DE
  GL_TEXTURE31_ARB                  := 0x84DF
  GL_ACTIVE_TEXTURE_ARB             := 0x84E0
  GL_CLIENT_ACTIVE_TEXTURE_ARB      := 0x84E1
  GL_MAX_TEXTURE_UNITS_ARB          := 0x84E2
}

if (!GL_ARB_transpose_matrix)
{
  GL_TRANSPOSE_MODELVIEW_MATRIX_ARB := 0x84E3
  GL_TRANSPOSE_PROJECTION_MATRIX_ARB := 0x84E4
  GL_TRANSPOSE_TEXTURE_MATRIX_ARB   := 0x84E5
  GL_TRANSPOSE_COLOR_MATRIX_ARB     := 0x84E6
}

if (!GL_ARB_multisample)
{
  GL_MULTISAMPLE_ARB                := 0x809D
  GL_SAMPLE_ALPHA_TO_COVERAGE_ARB   := 0x809E
  GL_SAMPLE_ALPHA_TO_ONE_ARB        := 0x809F
  GL_SAMPLE_COVERAGE_ARB            := 0x80A0
  GL_SAMPLE_BUFFERS_ARB             := 0x80A8
  GL_SAMPLES_ARB                    := 0x80A9
  GL_SAMPLE_COVERAGE_VALUE_ARB      := 0x80AA
  GL_SAMPLE_COVERAGE_INVERT_ARB     := 0x80AB
  GL_MULTISAMPLE_BIT_ARB            := 0x20000000
}

if (!GL_ARB_texture_env_add)
{
}

if (!GL_ARB_texture_cube_map)
{
  GL_NORMAL_MAP_ARB                 := 0x8511
  GL_REFLECTION_MAP_ARB             := 0x8512
  GL_TEXTURE_CUBE_MAP_ARB           := 0x8513
  GL_TEXTURE_BINDING_CUBE_MAP_ARB   := 0x8514
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB := 0x8515
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB := 0x8516
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB := 0x8517
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB := 0x8518
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB := 0x8519
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB := 0x851A
  GL_PROXY_TEXTURE_CUBE_MAP_ARB     := 0x851B
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB  := 0x851C
}

if (!GL_ARB_texture_compression)
{
  GL_COMPRESSED_ALPHA_ARB           := 0x84E9
  GL_COMPRESSED_LUMINANCE_ARB       := 0x84EA
  GL_COMPRESSED_LUMINANCE_ALPHA_ARB := 0x84EB
  GL_COMPRESSED_INTENSITY_ARB       := 0x84EC
  GL_COMPRESSED_RGB_ARB             := 0x84ED
  GL_COMPRESSED_RGBA_ARB            := 0x84EE
  GL_TEXTURE_COMPRESSION_HINT_ARB   := 0x84EF
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB := 0x86A0
  GL_TEXTURE_COMPRESSED_ARB         := 0x86A1
  GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB := 0x86A2
  GL_COMPRESSED_TEXTURE_FORMATS_ARB := 0x86A3
}

if (!GL_ARB_texture_border_clamp)
{
  GL_CLAMP_TO_BORDER_ARB            := 0x812D
}

if (!GL_ARB_point_parameters)
{
  GL_POINT_SIZE_MIN_ARB             := 0x8126
  GL_POINT_SIZE_MAX_ARB             := 0x8127
  GL_POINT_FADE_THRESHOLD_SIZE_ARB  := 0x8128
  GL_POINT_DISTANCE_ATTENUATION_ARB := 0x8129
}

if (!GL_ARB_vertex_blend)
{
  GL_MAX_VERTEX_UNITS_ARB           := 0x86A4
  GL_ACTIVE_VERTEX_UNITS_ARB        := 0x86A5
  GL_WEIGHT_SUM_UNITY_ARB           := 0x86A6
  GL_VERTEX_BLEND_ARB               := 0x86A7
  GL_CURRENT_WEIGHT_ARB             := 0x86A8
  GL_WEIGHT_ARRAY_TYPE_ARB          := 0x86A9
  GL_WEIGHT_ARRAY_STRIDE_ARB        := 0x86AA
  GL_WEIGHT_ARRAY_SIZE_ARB          := 0x86AB
  GL_WEIGHT_ARRAY_POINTER_ARB       := 0x86AC
  GL_WEIGHT_ARRAY_ARB               := 0x86AD
  GL_MODELVIEW0_ARB                 := 0x1700
  GL_MODELVIEW1_ARB                 := 0x850A
  GL_MODELVIEW2_ARB                 := 0x8722
  GL_MODELVIEW3_ARB                 := 0x8723
  GL_MODELVIEW4_ARB                 := 0x8724
  GL_MODELVIEW5_ARB                 := 0x8725
  GL_MODELVIEW6_ARB                 := 0x8726
  GL_MODELVIEW7_ARB                 := 0x8727
  GL_MODELVIEW8_ARB                 := 0x8728
  GL_MODELVIEW9_ARB                 := 0x8729
  GL_MODELVIEW10_ARB                := 0x872A
  GL_MODELVIEW11_ARB                := 0x872B
  GL_MODELVIEW12_ARB                := 0x872C
  GL_MODELVIEW13_ARB                := 0x872D
  GL_MODELVIEW14_ARB                := 0x872E
  GL_MODELVIEW15_ARB                := 0x872F
  GL_MODELVIEW16_ARB                := 0x8730
  GL_MODELVIEW17_ARB                := 0x8731
  GL_MODELVIEW18_ARB                := 0x8732
  GL_MODELVIEW19_ARB                := 0x8733
  GL_MODELVIEW20_ARB                := 0x8734
  GL_MODELVIEW21_ARB                := 0x8735
  GL_MODELVIEW22_ARB                := 0x8736
  GL_MODELVIEW23_ARB                := 0x8737
  GL_MODELVIEW24_ARB                := 0x8738
  GL_MODELVIEW25_ARB                := 0x8739
  GL_MODELVIEW26_ARB                := 0x873A
  GL_MODELVIEW27_ARB                := 0x873B
  GL_MODELVIEW28_ARB                := 0x873C
  GL_MODELVIEW29_ARB                := 0x873D
  GL_MODELVIEW30_ARB                := 0x873E
  GL_MODELVIEW31_ARB                := 0x873F
}

if (!GL_ARB_matrix_palette)
{
  GL_MATRIX_PALETTE_ARB             := 0x8840
  GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB := 0x8841
  GL_MAX_PALETTE_MATRICES_ARB       := 0x8842
  GL_CURRENT_PALETTE_MATRIX_ARB     := 0x8843
  GL_MATRIX_INDEX_ARRAY_ARB         := 0x8844
  GL_CURRENT_MATRIX_INDEX_ARB       := 0x8845
  GL_MATRIX_INDEX_ARRAY_SIZE_ARB    := 0x8846
  GL_MATRIX_INDEX_ARRAY_TYPE_ARB    := 0x8847
  GL_MATRIX_INDEX_ARRAY_STRIDE_ARB  := 0x8848
  GL_MATRIX_INDEX_ARRAY_POINTER_ARB := 0x8849
}

if (!GL_ARB_texture_env_combine)
{
  GL_COMBINE_ARB                    := 0x8570
  GL_COMBINE_RGB_ARB                := 0x8571
  GL_COMBINE_ALPHA_ARB              := 0x8572
  GL_SOURCE0_RGB_ARB                := 0x8580
  GL_SOURCE1_RGB_ARB                := 0x8581
  GL_SOURCE2_RGB_ARB                := 0x8582
  GL_SOURCE0_ALPHA_ARB              := 0x8588
  GL_SOURCE1_ALPHA_ARB              := 0x8589
  GL_SOURCE2_ALPHA_ARB              := 0x858A
  GL_OPERAND0_RGB_ARB               := 0x8590
  GL_OPERAND1_RGB_ARB               := 0x8591
  GL_OPERAND2_RGB_ARB               := 0x8592
  GL_OPERAND0_ALPHA_ARB             := 0x8598
  GL_OPERAND1_ALPHA_ARB             := 0x8599
  GL_OPERAND2_ALPHA_ARB             := 0x859A
  GL_RGB_SCALE_ARB                  := 0x8573
  GL_ADD_SIGNED_ARB                 := 0x8574
  GL_INTERPOLATE_ARB                := 0x8575
  GL_SUBTRACT_ARB                   := 0x84E7
  GL_CONSTANT_ARB                   := 0x8576
  GL_PRIMARY_COLOR_ARB              := 0x8577
  GL_PREVIOUS_ARB                   := 0x8578
}

if (!GL_ARB_texture_env_crossbar)
{
}

if (!GL_ARB_texture_env_dot3)
{
  GL_DOT3_RGB_ARB                   := 0x86AE
  GL_DOT3_RGBA_ARB                  := 0x86AF
}

if (!GL_ARB_texture_mirrored_repeat)
{
  GL_MIRRORED_REPEAT_ARB            := 0x8370
}

if (!GL_ARB_depth_texture)
{
  GL_DEPTH_COMPONENT16_ARB          := 0x81A5
  GL_DEPTH_COMPONENT24_ARB          := 0x81A6
  GL_DEPTH_COMPONENT32_ARB          := 0x81A7
  GL_TEXTURE_DEPTH_SIZE_ARB         := 0x884A
  GL_DEPTH_TEXTURE_MODE_ARB         := 0x884B
}

if (!GL_ARB_shadow)
{
  GL_TEXTURE_COMPARE_MODE_ARB       := 0x884C
  GL_TEXTURE_COMPARE_FUNC_ARB       := 0x884D
  GL_COMPARE_R_TO_TEXTURE_ARB       := 0x884E
}

if (!GL_ARB_shadow_ambient)
{
  GL_TEXTURE_COMPARE_FAIL_VALUE_ARB := 0x80BF
}

if (!GL_ARB_window_pos)
{
}

if (!GL_ARB_vertex_program)
{
  GL_COLOR_SUM_ARB                  := 0x8458
  GL_VERTEX_PROGRAM_ARB             := 0x8620
  GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB := 0x8622
  GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB   := 0x8623
  GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB := 0x8624
  GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB   := 0x8625
  GL_CURRENT_VERTEX_ATTRIB_ARB      := 0x8626
  GL_PROGRAM_LENGTH_ARB             := 0x8627
  GL_PROGRAM_STRING_ARB             := 0x8628
  GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB := 0x862E
  GL_MAX_PROGRAM_MATRICES_ARB       := 0x862F
  GL_CURRENT_MATRIX_STACK_DEPTH_ARB := 0x8640
  GL_CURRENT_MATRIX_ARB             := 0x8641
  GL_VERTEX_PROGRAM_POINT_SIZE_ARB  := 0x8642
  GL_VERTEX_PROGRAM_TWO_SIDE_ARB    := 0x8643
  GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB := 0x8645
  GL_PROGRAM_ERROR_POSITION_ARB     := 0x864B
  GL_PROGRAM_BINDING_ARB            := 0x8677
  GL_MAX_VERTEX_ATTRIBS_ARB         := 0x8869
  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB := 0x886A
  GL_PROGRAM_ERROR_STRING_ARB       := 0x8874
  GL_PROGRAM_FORMAT_ASCII_ARB       := 0x8875
  GL_PROGRAM_FORMAT_ARB             := 0x8876
  GL_PROGRAM_INSTRUCTIONS_ARB       := 0x88A0
  GL_MAX_PROGRAM_INSTRUCTIONS_ARB   := 0x88A1
  GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB := 0x88A2
  GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB := 0x88A3
  GL_PROGRAM_TEMPORARIES_ARB        := 0x88A4
  GL_MAX_PROGRAM_TEMPORARIES_ARB    := 0x88A5
  GL_PROGRAM_NATIVE_TEMPORARIES_ARB := 0x88A6
  GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB := 0x88A7
  GL_PROGRAM_PARAMETERS_ARB         := 0x88A8
  GL_MAX_PROGRAM_PARAMETERS_ARB     := 0x88A9
  GL_PROGRAM_NATIVE_PARAMETERS_ARB  := 0x88AA
  GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB := 0x88AB
  GL_PROGRAM_ATTRIBS_ARB            := 0x88AC
  GL_MAX_PROGRAM_ATTRIBS_ARB        := 0x88AD
  GL_PROGRAM_NATIVE_ATTRIBS_ARB     := 0x88AE
  GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB := 0x88AF
  GL_PROGRAM_ADDRESS_REGISTERS_ARB  := 0x88B0
  GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB := 0x88B1
  GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB := 0x88B2
  GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB := 0x88B3
  GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB := 0x88B4
  GL_MAX_PROGRAM_ENV_PARAMETERS_ARB := 0x88B5
  GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB := 0x88B6
  GL_TRANSPOSE_CURRENT_MATRIX_ARB   := 0x88B7
  GL_MATRIX0_ARB                    := 0x88C0
  GL_MATRIX1_ARB                    := 0x88C1
  GL_MATRIX2_ARB                    := 0x88C2
  GL_MATRIX3_ARB                    := 0x88C3
  GL_MATRIX4_ARB                    := 0x88C4
  GL_MATRIX5_ARB                    := 0x88C5
  GL_MATRIX6_ARB                    := 0x88C6
  GL_MATRIX7_ARB                    := 0x88C7
  GL_MATRIX8_ARB                    := 0x88C8
  GL_MATRIX9_ARB                    := 0x88C9
  GL_MATRIX10_ARB                   := 0x88CA
  GL_MATRIX11_ARB                   := 0x88CB
  GL_MATRIX12_ARB                   := 0x88CC
  GL_MATRIX13_ARB                   := 0x88CD
  GL_MATRIX14_ARB                   := 0x88CE
  GL_MATRIX15_ARB                   := 0x88CF
  GL_MATRIX16_ARB                   := 0x88D0
  GL_MATRIX17_ARB                   := 0x88D1
  GL_MATRIX18_ARB                   := 0x88D2
  GL_MATRIX19_ARB                   := 0x88D3
  GL_MATRIX20_ARB                   := 0x88D4
  GL_MATRIX21_ARB                   := 0x88D5
  GL_MATRIX22_ARB                   := 0x88D6
  GL_MATRIX23_ARB                   := 0x88D7
  GL_MATRIX24_ARB                   := 0x88D8
  GL_MATRIX25_ARB                   := 0x88D9
  GL_MATRIX26_ARB                   := 0x88DA
  GL_MATRIX27_ARB                   := 0x88DB
  GL_MATRIX28_ARB                   := 0x88DC
  GL_MATRIX29_ARB                   := 0x88DD
  GL_MATRIX30_ARB                   := 0x88DE
  GL_MATRIX31_ARB                   := 0x88DF
}

if (!GL_ARB_fragment_program)
{
  GL_FRAGMENT_PROGRAM_ARB           := 0x8804
  GL_PROGRAM_ALU_INSTRUCTIONS_ARB   := 0x8805
  GL_PROGRAM_TEX_INSTRUCTIONS_ARB   := 0x8806
  GL_PROGRAM_TEX_INDIRECTIONS_ARB   := 0x8807
  GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB := 0x8808
  GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB := 0x8809
  GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB := 0x880A
  GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB := 0x880B
  GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB := 0x880C
  GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB := 0x880D
  GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB := 0x880E
  GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB := 0x880F
  GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB := 0x8810
  GL_MAX_TEXTURE_COORDS_ARB         := 0x8871
  GL_MAX_TEXTURE_IMAGE_UNITS_ARB    := 0x8872
}

if (!GL_ARB_vertex_buffer_object)
{
  GL_BUFFER_SIZE_ARB                := 0x8764
  GL_BUFFER_USAGE_ARB               := 0x8765
  GL_ARRAY_BUFFER_ARB               := 0x8892
  GL_ELEMENT_ARRAY_BUFFER_ARB       := 0x8893
  GL_ARRAY_BUFFER_BINDING_ARB       := 0x8894
  GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB := 0x8895
  GL_VERTEX_ARRAY_BUFFER_BINDING_ARB := 0x8896
  GL_NORMAL_ARRAY_BUFFER_BINDING_ARB := 0x8897
  GL_COLOR_ARRAY_BUFFER_BINDING_ARB := 0x8898
  GL_INDEX_ARRAY_BUFFER_BINDING_ARB := 0x8899
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB := 0x889A
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB := 0x889B
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB := 0x889C
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB := 0x889D
  GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB := 0x889E
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB := 0x889F
  GL_READ_ONLY_ARB                  := 0x88B8
  GL_WRITE_ONLY_ARB                 := 0x88B9
  GL_READ_WRITE_ARB                 := 0x88BA
  GL_BUFFER_ACCESS_ARB              := 0x88BB
  GL_BUFFER_MAPPED_ARB              := 0x88BC
  GL_BUFFER_MAP_POINTER_ARB         := 0x88BD
  GL_STREAM_DRAW_ARB                := 0x88E0
  GL_STREAM_READ_ARB                := 0x88E1
  GL_STREAM_COPY_ARB                := 0x88E2
  GL_STATIC_DRAW_ARB                := 0x88E4
  GL_STATIC_READ_ARB                := 0x88E5
  GL_STATIC_COPY_ARB                := 0x88E6
  GL_DYNAMIC_DRAW_ARB               := 0x88E8
  GL_DYNAMIC_READ_ARB               := 0x88E9
  GL_DYNAMIC_COPY_ARB               := 0x88EA
}

if (!GL_ARB_occlusion_query)
{
  GL_QUERY_COUNTER_BITS_ARB         := 0x8864
  GL_CURRENT_QUERY_ARB              := 0x8865
  GL_QUERY_RESULT_ARB               := 0x8866
  GL_QUERY_RESULT_AVAILABLE_ARB     := 0x8867
  GL_SAMPLES_PASSED_ARB             := 0x8914
}

if (!GL_ARB_shader_objects)
{
  GL_PROGRAM_OBJECT_ARB             := 0x8B40
  GL_SHADER_OBJECT_ARB              := 0x8B48
  GL_OBJECT_TYPE_ARB                := 0x8B4E
  GL_OBJECT_SUBTYPE_ARB             := 0x8B4F
  GL_FLOAT_VEC2_ARB                 := 0x8B50
  GL_FLOAT_VEC3_ARB                 := 0x8B51
  GL_FLOAT_VEC4_ARB                 := 0x8B52
  GL_INT_VEC2_ARB                   := 0x8B53
  GL_INT_VEC3_ARB                   := 0x8B54
  GL_INT_VEC4_ARB                   := 0x8B55
  GL_BOOL_ARB                       := 0x8B56
  GL_BOOL_VEC2_ARB                  := 0x8B57
  GL_BOOL_VEC3_ARB                  := 0x8B58
  GL_BOOL_VEC4_ARB                  := 0x8B59
  GL_FLOAT_MAT2_ARB                 := 0x8B5A
  GL_FLOAT_MAT3_ARB                 := 0x8B5B
  GL_FLOAT_MAT4_ARB                 := 0x8B5C
  GL_SAMPLER_1D_ARB                 := 0x8B5D
  GL_SAMPLER_2D_ARB                 := 0x8B5E
  GL_SAMPLER_3D_ARB                 := 0x8B5F
  GL_SAMPLER_CUBE_ARB               := 0x8B60
  GL_SAMPLER_1D_SHADOW_ARB          := 0x8B61
  GL_SAMPLER_2D_SHADOW_ARB          := 0x8B62
  GL_SAMPLER_2D_RECT_ARB            := 0x8B63
  GL_SAMPLER_2D_RECT_SHADOW_ARB     := 0x8B64
  GL_OBJECT_DELETE_STATUS_ARB       := 0x8B80
  GL_OBJECT_COMPILE_STATUS_ARB      := 0x8B81
  GL_OBJECT_LINK_STATUS_ARB         := 0x8B82
  GL_OBJECT_VALIDATE_STATUS_ARB     := 0x8B83
  GL_OBJECT_INFO_LOG_LENGTH_ARB     := 0x8B84
  GL_OBJECT_ATTACHED_OBJECTS_ARB    := 0x8B85
  GL_OBJECT_ACTIVE_UNIFORMS_ARB     := 0x8B86
  GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB := 0x8B87
  GL_OBJECT_SHADER_SOURCE_LENGTH_ARB := 0x8B88
}

if (!GL_ARB_vertex_shader)
{
  GL_VERTEX_SHADER_ARB              := 0x8B31
  GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB := 0x8B4A
  GL_MAX_VARYING_FLOATS_ARB         := 0x8B4B
  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB := 0x8B4C
  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB := 0x8B4D
  GL_OBJECT_ACTIVE_ATTRIBUTES_ARB   := 0x8B89
  GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB := 0x8B8A
}

if (!GL_ARB_fragment_shader)
{
  GL_FRAGMENT_SHADER_ARB            := 0x8B30
  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB := 0x8B49
  GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB := 0x8B8B
}

if (!GL_ARB_shading_language_100)
{
  GL_SHADING_LANGUAGE_VERSION_ARB   := 0x8B8C
}

if (!GL_ARB_texture_non_power_of_two)
{
}

if (!GL_ARB_point_sprite)
{
  GL_POINT_SPRITE_ARB               := 0x8861
  GL_COORD_REPLACE_ARB              := 0x8862
}

if (!GL_ARB_fragment_program_shadow)
{
}

if (!GL_ARB_draw_buffers)
{
  GL_MAX_DRAW_BUFFERS_ARB           := 0x8824
  GL_DRAW_BUFFER0_ARB               := 0x8825
  GL_DRAW_BUFFER1_ARB               := 0x8826
  GL_DRAW_BUFFER2_ARB               := 0x8827
  GL_DRAW_BUFFER3_ARB               := 0x8828
  GL_DRAW_BUFFER4_ARB               := 0x8829
  GL_DRAW_BUFFER5_ARB               := 0x882A
  GL_DRAW_BUFFER6_ARB               := 0x882B
  GL_DRAW_BUFFER7_ARB               := 0x882C
  GL_DRAW_BUFFER8_ARB               := 0x882D
  GL_DRAW_BUFFER9_ARB               := 0x882E
  GL_DRAW_BUFFER10_ARB              := 0x882F
  GL_DRAW_BUFFER11_ARB              := 0x8830
  GL_DRAW_BUFFER12_ARB              := 0x8831
  GL_DRAW_BUFFER13_ARB              := 0x8832
  GL_DRAW_BUFFER14_ARB              := 0x8833
  GL_DRAW_BUFFER15_ARB              := 0x8834
}

if (!GL_ARB_texture_rectangle)
{
  GL_TEXTURE_RECTANGLE_ARB          := 0x84F5
  GL_TEXTURE_BINDING_RECTANGLE_ARB  := 0x84F6
  GL_PROXY_TEXTURE_RECTANGLE_ARB    := 0x84F7
  GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB := 0x84F8
}

if (!GL_ARB_color_buffer_float)
{
  GL_RGBA_FLOAT_MODE_ARB            := 0x8820
  GL_CLAMP_VERTEX_COLOR_ARB         := 0x891A
  GL_CLAMP_FRAGMENT_COLOR_ARB       := 0x891B
  GL_CLAMP_READ_COLOR_ARB           := 0x891C
  GL_FIXED_ONLY_ARB                 := 0x891D
}

if (!GL_ARB_half_float_pixel)
{
  GL_HALF_FLOAT_ARB                 := 0x140B
}

if (!GL_ARB_texture_float)
{
  GL_TEXTURE_RED_TYPE_ARB           := 0x8C10
  GL_TEXTURE_GREEN_TYPE_ARB         := 0x8C11
  GL_TEXTURE_BLUE_TYPE_ARB          := 0x8C12
  GL_TEXTURE_ALPHA_TYPE_ARB         := 0x8C13
  GL_TEXTURE_LUMINANCE_TYPE_ARB     := 0x8C14
  GL_TEXTURE_INTENSITY_TYPE_ARB     := 0x8C15
  GL_TEXTURE_DEPTH_TYPE_ARB         := 0x8C16
  GL_UNSIGNED_NORMALIZED_ARB        := 0x8C17
  GL_RGBA32F_ARB                    := 0x8814
  GL_RGB32F_ARB                     := 0x8815
  GL_ALPHA32F_ARB                   := 0x8816
  GL_INTENSITY32F_ARB               := 0x8817
  GL_LUMINANCE32F_ARB               := 0x8818
  GL_LUMINANCE_ALPHA32F_ARB         := 0x8819
  GL_RGBA16F_ARB                    := 0x881A
  GL_RGB16F_ARB                     := 0x881B
  GL_ALPHA16F_ARB                   := 0x881C
  GL_INTENSITY16F_ARB               := 0x881D
  GL_LUMINANCE16F_ARB               := 0x881E
  GL_LUMINANCE_ALPHA16F_ARB         := 0x881F
}

if (!GL_ARB_pixel_buffer_object)
{
  GL_PIXEL_PACK_BUFFER_ARB          := 0x88EB
  GL_PIXEL_UNPACK_BUFFER_ARB        := 0x88EC
  GL_PIXEL_PACK_BUFFER_BINDING_ARB  := 0x88ED
  GL_PIXEL_UNPACK_BUFFER_BINDING_ARB := 0x88EF
}

if (!GL_ARB_depth_buffer_float)
{
  GL_DEPTH_COMPONENT32F             := 0x8CAC
  GL_DEPTH32F_STENCIL8              := 0x8CAD
  GL_FLOAT_32_UNSIGNED_INT_24_8_REV := 0x8DAD
}

if (!GL_ARB_draw_instanced)
{
}

if (!GL_ARB_framebuffer_object)
{
  GL_INVALID_FRAMEBUFFER_OPERATION  := 0x0506
  GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING := 0x8210
  GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE := 0x8211
  GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE := 0x8212
  GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE := 0x8213
  GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE := 0x8214
  GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE := 0x8215
  GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE := 0x8216
  GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE := 0x8217
  GL_FRAMEBUFFER_DEFAULT            := 0x8218
  GL_FRAMEBUFFER_UNDEFINED          := 0x8219
  GL_DEPTH_STENCIL_ATTACHMENT       := 0x821A
  GL_MAX_RENDERBUFFER_SIZE          := 0x84E8
  GL_DEPTH_STENCIL                  := 0x84F9
  GL_UNSIGNED_INT_24_8              := 0x84FA
  GL_DEPTH24_STENCIL8               := 0x88F0
  GL_TEXTURE_STENCIL_SIZE           := 0x88F1
  GL_TEXTURE_RED_TYPE               := 0x8C10
  GL_TEXTURE_GREEN_TYPE             := 0x8C11
  GL_TEXTURE_BLUE_TYPE              := 0x8C12
  GL_TEXTURE_ALPHA_TYPE             := 0x8C13
  GL_TEXTURE_DEPTH_TYPE             := 0x8C16
  GL_UNSIGNED_NORMALIZED            := 0x8C17
  GL_FRAMEBUFFER_BINDING            := 0x8CA6
  GL_DRAW_FRAMEBUFFER_BINDING       := GL_FRAMEBUFFER_BINDING
  GL_RENDERBUFFER_BINDING           := 0x8CA7
  GL_READ_FRAMEBUFFER               := 0x8CA8
  GL_DRAW_FRAMEBUFFER               := 0x8CA9
  GL_READ_FRAMEBUFFER_BINDING       := 0x8CAA
  GL_RENDERBUFFER_SAMPLES           := 0x8CAB
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE := 0x8CD0
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME := 0x8CD1
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL := 0x8CD2
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE := 0x8CD3
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER := 0x8CD4
  GL_FRAMEBUFFER_COMPLETE           := 0x8CD5
  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT := 0x8CD6
  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT := 0x8CD7
  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER := 0x8CDB
  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER := 0x8CDC
  GL_FRAMEBUFFER_UNSUPPORTED        := 0x8CDD
  GL_MAX_COLOR_ATTACHMENTS          := 0x8CDF
  GL_COLOR_ATTACHMENT0              := 0x8CE0
  GL_COLOR_ATTACHMENT1              := 0x8CE1
  GL_COLOR_ATTACHMENT2              := 0x8CE2
  GL_COLOR_ATTACHMENT3              := 0x8CE3
  GL_COLOR_ATTACHMENT4              := 0x8CE4
  GL_COLOR_ATTACHMENT5              := 0x8CE5
  GL_COLOR_ATTACHMENT6              := 0x8CE6
  GL_COLOR_ATTACHMENT7              := 0x8CE7
  GL_COLOR_ATTACHMENT8              := 0x8CE8
  GL_COLOR_ATTACHMENT9              := 0x8CE9
  GL_COLOR_ATTACHMENT10             := 0x8CEA
  GL_COLOR_ATTACHMENT11             := 0x8CEB
  GL_COLOR_ATTACHMENT12             := 0x8CEC
  GL_COLOR_ATTACHMENT13             := 0x8CED
  GL_COLOR_ATTACHMENT14             := 0x8CEE
  GL_COLOR_ATTACHMENT15             := 0x8CEF
  GL_DEPTH_ATTACHMENT               := 0x8D00
  GL_STENCIL_ATTACHMENT             := 0x8D20
  GL_FRAMEBUFFER                    := 0x8D40
  GL_RENDERBUFFER                   := 0x8D41
  GL_RENDERBUFFER_WIDTH             := 0x8D42
  GL_RENDERBUFFER_HEIGHT            := 0x8D43
  GL_RENDERBUFFER_INTERNAL_FORMAT   := 0x8D44
  GL_STENCIL_INDEX1                 := 0x8D46
  GL_STENCIL_INDEX4                 := 0x8D47
  GL_STENCIL_INDEX8                 := 0x8D48
  GL_STENCIL_INDEX16                := 0x8D49
  GL_RENDERBUFFER_RED_SIZE          := 0x8D50
  GL_RENDERBUFFER_GREEN_SIZE        := 0x8D51
  GL_RENDERBUFFER_BLUE_SIZE         := 0x8D52
  GL_RENDERBUFFER_ALPHA_SIZE        := 0x8D53
  GL_RENDERBUFFER_DEPTH_SIZE        := 0x8D54
  GL_RENDERBUFFER_STENCIL_SIZE      := 0x8D55
  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE := 0x8D56
  GL_MAX_SAMPLES                    := 0x8D57
}

if (!GL_ARB_framebuffer_object_DEPRECATED)
{
  GL_INDEX                          := 0x8222
  GL_TEXTURE_LUMINANCE_TYPE         := 0x8C14
  GL_TEXTURE_INTENSITY_TYPE         := 0x8C15
}

if (!GL_ARB_framebuffer_sRGB)
{
  GL_FRAMEBUFFER_SRGB               := 0x8DB9
}

if (!GL_ARB_geometry_shader4)
{
  GL_LINES_ADJACENCY_ARB            := 0x000A
  GL_LINE_STRIP_ADJACENCY_ARB       := 0x000B
  GL_TRIANGLES_ADJACENCY_ARB        := 0x000C
  GL_TRIANGLE_STRIP_ADJACENCY_ARB   := 0x000D
  GL_PROGRAM_POINT_SIZE_ARB         := 0x8642
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB := 0x8C29
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB := 0x8DA7
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB := 0x8DA8
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB := 0x8DA9
  GL_GEOMETRY_SHADER_ARB            := 0x8DD9
  GL_GEOMETRY_VERTICES_OUT_ARB      := 0x8DDA
  GL_GEOMETRY_INPUT_TYPE_ARB        := 0x8DDB
  GL_GEOMETRY_OUTPUT_TYPE_ARB       := 0x8DDC
  GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB := 0x8DDD
  GL_MAX_VERTEX_VARYING_COMPONENTS_ARB := 0x8DDE
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB := 0x8DDF
  GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB := 0x8DE0
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB := 0x8DE1
  ;reuse GL_MAX_VARYING_COMPONENTS
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
}

if (!GL_ARB_half_float_vertex)
{
  GL_HALF_FLOAT                     := 0x140B
}

if (!GL_ARB_instanced_arrays)
{
  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB := 0x88FE
}

if (!GL_ARB_map_buffer_range)
{
  GL_MAP_READ_BIT                   := 0x0001
  GL_MAP_WRITE_BIT                  := 0x0002
  GL_MAP_INVALIDATE_RANGE_BIT       := 0x0004
  GL_MAP_INVALIDATE_BUFFER_BIT      := 0x0008
  GL_MAP_FLUSH_EXPLICIT_BIT         := 0x0010
  GL_MAP_UNSYNCHRONIZED_BIT         := 0x0020
}

if (!GL_ARB_texture_buffer_object)
{
  GL_TEXTURE_BUFFER_ARB             := 0x8C2A
  GL_MAX_TEXTURE_BUFFER_SIZE_ARB    := 0x8C2B
  GL_TEXTURE_BINDING_BUFFER_ARB     := 0x8C2C
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB := 0x8C2D
  GL_TEXTURE_BUFFER_FORMAT_ARB      := 0x8C2E
}

if (!GL_ARB_texture_compression_rgtc)
{
  GL_COMPRESSED_RED_RGTC1           := 0x8DBB
  GL_COMPRESSED_SIGNED_RED_RGTC1    := 0x8DBC
  GL_COMPRESSED_RG_RGTC2            := 0x8DBD
  GL_COMPRESSED_SIGNED_RG_RGTC2     := 0x8DBE
}

if (!GL_ARB_texture_rg)
{
  GL_RG                             := 0x8227
  GL_RG_INTEGER                     := 0x8228
  GL_R8                             := 0x8229
  GL_R16                            := 0x822A
  GL_RG8                            := 0x822B
  GL_RG16                           := 0x822C
  GL_R16F                           := 0x822D
  GL_R32F                           := 0x822E
  GL_RG16F                          := 0x822F
  GL_RG32F                          := 0x8230
  GL_R8I                            := 0x8231
  GL_R8UI                           := 0x8232
  GL_R16I                           := 0x8233
  GL_R16UI                          := 0x8234
  GL_R32I                           := 0x8235
  GL_R32UI                          := 0x8236
  GL_RG8I                           := 0x8237
  GL_RG8UI                          := 0x8238
  GL_RG16I                          := 0x8239
  GL_RG16UI                         := 0x823A
  GL_RG32I                          := 0x823B
  GL_RG32UI                         := 0x823C
}

if (!GL_ARB_vertex_array_object)
{
  GL_VERTEX_ARRAY_BINDING           := 0x85B5
}

if (!GL_ARB_uniform_buffer_object)
{
  GL_UNIFORM_BUFFER                 := 0x8A11
  GL_UNIFORM_BUFFER_BINDING         := 0x8A28
  GL_UNIFORM_BUFFER_START           := 0x8A29
  GL_UNIFORM_BUFFER_SIZE            := 0x8A2A
  GL_MAX_VERTEX_UNIFORM_BLOCKS      := 0x8A2B
  GL_MAX_GEOMETRY_UNIFORM_BLOCKS    := 0x8A2C
  GL_MAX_FRAGMENT_UNIFORM_BLOCKS    := 0x8A2D
  GL_MAX_COMBINED_UNIFORM_BLOCKS    := 0x8A2E
  GL_MAX_UNIFORM_BUFFER_BINDINGS    := 0x8A2F
  GL_MAX_UNIFORM_BLOCK_SIZE         := 0x8A30
  GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS := 0x8A31
  GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS := 0x8A32
  GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS := 0x8A33
  GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT := 0x8A34
  GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH := 0x8A35
  GL_ACTIVE_UNIFORM_BLOCKS          := 0x8A36
  GL_UNIFORM_TYPE                   := 0x8A37
  GL_UNIFORM_SIZE                   := 0x8A38
  GL_UNIFORM_NAME_LENGTH            := 0x8A39
  GL_UNIFORM_BLOCK_INDEX            := 0x8A3A
  GL_UNIFORM_OFFSET                 := 0x8A3B
  GL_UNIFORM_ARRAY_STRIDE           := 0x8A3C
  GL_UNIFORM_MATRIX_STRIDE          := 0x8A3D
  GL_UNIFORM_IS_ROW_MAJOR           := 0x8A3E
  GL_UNIFORM_BLOCK_BINDING          := 0x8A3F
  GL_UNIFORM_BLOCK_DATA_SIZE        := 0x8A40
  GL_UNIFORM_BLOCK_NAME_LENGTH      := 0x8A41
  GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS  := 0x8A42
  GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES := 0x8A43
  GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER := 0x8A44
  GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER := 0x8A45
  GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER := 0x8A46
  GL_INVALID_INDEX                  := 0xFFFFFFFFu
}

if (!GL_ARB_compatibility)
{
  ;ARB_compatibility just defines tokens from core 3.0
}

if (!GL_ARB_copy_buffer)
{
  GL_COPY_READ_BUFFER               := 0x8F36
  GL_COPY_WRITE_BUFFER              := 0x8F37
}

if (!GL_ARB_shader_texture_lod)
{
}

if (!GL_ARB_depth_clamp)
{
  GL_DEPTH_CLAMP                    := 0x864F
}

if (!GL_ARB_draw_elements_base_vertex)
{
}

if (!GL_ARB_fragment_coord_conventions)
{
}

if (!GL_ARB_provoking_vertex)
{
  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION := 0x8E4C
  GL_FIRST_VERTEX_CONVENTION        := 0x8E4D
  GL_LAST_VERTEX_CONVENTION         := 0x8E4E
  GL_PROVOKING_VERTEX               := 0x8E4F
}

if (!GL_ARB_seamless_cube_map)
{
  GL_TEXTURE_CUBE_MAP_SEAMLESS      := 0x884F
}

if (!GL_ARB_sync)
{
  GL_MAX_SERVER_WAIT_TIMEOUT        := 0x9111
  GL_OBJECT_TYPE                    := 0x9112
  GL_SYNC_CONDITION                 := 0x9113
  GL_SYNC_STATUS                    := 0x9114
  GL_SYNC_FLAGS                     := 0x9115
  GL_SYNC_FENCE                     := 0x9116
  GL_SYNC_GPU_COMMANDS_COMPLETE     := 0x9117
  GL_UNSIGNALED                     := 0x9118
  GL_SIGNALED                       := 0x9119
  GL_ALREADY_SIGNALED               := 0x911A
  GL_TIMEOUT_EXPIRED                := 0x911B
  GL_CONDITION_SATISFIED            := 0x911C
  GL_WAIT_FAILED                    := 0x911D
  GL_SYNC_FLUSH_COMMANDS_BIT        := 0x00000001
  GL_TIMEOUT_IGNORED                := 0xFFFFFFFFFFFFFFFF
}

if (!GL_ARB_texture_multisample)
{
  GL_SAMPLE_POSITION                := 0x8E50
  GL_SAMPLE_MASK                    := 0x8E51
  GL_SAMPLE_MASK_VALUE              := 0x8E52
  GL_MAX_SAMPLE_MASK_WORDS          := 0x8E59
  GL_TEXTURE_2D_MULTISAMPLE         := 0x9100
  GL_PROXY_TEXTURE_2D_MULTISAMPLE   := 0x9101
  GL_TEXTURE_2D_MULTISAMPLE_ARRAY   := 0x9102
  GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY := 0x9103
  GL_TEXTURE_BINDING_2D_MULTISAMPLE := 0x9104
  GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY := 0x9105
  GL_TEXTURE_SAMPLES                := 0x9106
  GL_TEXTURE_FIXED_SAMPLE_LOCATIONS := 0x9107
  GL_SAMPLER_2D_MULTISAMPLE         := 0x9108
  GL_INT_SAMPLER_2D_MULTISAMPLE     := 0x9109
  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE := 0x910A
  GL_SAMPLER_2D_MULTISAMPLE_ARRAY   := 0x910B
  GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY := 0x910C
  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY := 0x910D
  GL_MAX_COLOR_TEXTURE_SAMPLES      := 0x910E
  GL_MAX_DEPTH_TEXTURE_SAMPLES      := 0x910F
  GL_MAX_INTEGER_SAMPLES            := 0x9110
}

if (!GL_ARB_vertex_array_bgra)
{
  ;reuse GL_BGRA
}

if (!GL_ARB_draw_buffers_blend)
{
}

if (!GL_ARB_sample_shading)
{
  GL_SAMPLE_SHADING_ARB             := 0x8C36
  GL_MIN_SAMPLE_SHADING_VALUE_ARB   := 0x8C37
}

if (!GL_ARB_texture_cube_map_array)
{
  GL_TEXTURE_CUBE_MAP_ARRAY_ARB     := 0x9009
  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB := 0x900A
  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB := 0x900B
  GL_SAMPLER_CUBE_MAP_ARRAY_ARB     := 0x900C
  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB := 0x900D
  GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB := 0x900E
  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB := 0x900F
}

if (!GL_ARB_texture_gather)
{
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB := 0x8E5E
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB := 0x8E5F
}

if (!GL_ARB_texture_query_lod)
{
}

if (!GL_ARB_shading_language_include)
{
  GL_SHADER_INCLUDE_ARB             := 0x8DAE
  GL_NAMED_STRING_LENGTH_ARB        := 0x8DE9
  GL_NAMED_STRING_TYPE_ARB          := 0x8DEA
}

if (!GL_ARB_texture_compression_bptc)
{
  GL_COMPRESSED_RGBA_BPTC_UNORM_ARB := 0x8E8C
  GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB := 0x8E8D
  GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB := 0x8E8E
  GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB := 0x8E8F
}

if (!GL_ARB_blend_func_extended)
{
  GL_SRC1_COLOR                     := 0x88F9
  ;reuse GL_SRC1_ALPHA
  GL_ONE_MINUS_SRC1_COLOR           := 0x88FA
  GL_ONE_MINUS_SRC1_ALPHA           := 0x88FB
  GL_MAX_DUAL_SOURCE_DRAW_BUFFERS   := 0x88FC
}

if (!GL_ARB_explicit_attrib_location)
{
}

if (!GL_ARB_occlusion_query2)
{
  GL_ANY_SAMPLES_PASSED             := 0x8C2F
}

if (!GL_ARB_sampler_objects)
{
  GL_SAMPLER_BINDING                := 0x8919
}

if (!GL_ARB_shader_bit_encoding)
{
}

if (!GL_ARB_texture_rgb10_a2ui)
{
  GL_RGB10_A2UI                     := 0x906F
}

if (!GL_ARB_texture_swizzle)
{
  GL_TEXTURE_SWIZZLE_R              := 0x8E42
  GL_TEXTURE_SWIZZLE_G              := 0x8E43
  GL_TEXTURE_SWIZZLE_B              := 0x8E44
  GL_TEXTURE_SWIZZLE_A              := 0x8E45
  GL_TEXTURE_SWIZZLE_RGBA           := 0x8E46
}

if (!GL_ARB_timer_query)
{
  GL_TIME_ELAPSED                   := 0x88BF
  GL_TIMESTAMP                      := 0x8E28
}

if (!GL_ARB_vertex_type_2_10_10_10_rev)
{
  ;reuse GL_UNSIGNED_INT_2_10_10_10_REV
  GL_INT_2_10_10_10_REV             := 0x8D9F
}

if (!GL_ARB_draw_indirect)
{
  GL_DRAW_INDIRECT_BUFFER           := 0x8F3F
  GL_DRAW_INDIRECT_BUFFER_BINDING   := 0x8F43
}

if (!GL_ARB_gpu_shader5)
{
  GL_GEOMETRY_SHADER_INVOCATIONS    := 0x887F
  GL_MAX_GEOMETRY_SHADER_INVOCATIONS := 0x8E5A
  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET := 0x8E5B
  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET := 0x8E5C
  GL_FRAGMENT_INTERPOLATION_OFFSET_BITS := 0x8E5D
  ;reuse GL_MAX_VERTEX_STREAMS
}

if (!GL_ARB_gpu_shader_fp64)
{
  ;reuse GL_DOUBLE
  GL_DOUBLE_VEC2                    := 0x8FFC
  GL_DOUBLE_VEC3                    := 0x8FFD
  GL_DOUBLE_VEC4                    := 0x8FFE
  GL_DOUBLE_MAT2                    := 0x8F46
  GL_DOUBLE_MAT3                    := 0x8F47
  GL_DOUBLE_MAT4                    := 0x8F48
  GL_DOUBLE_MAT2x3                  := 0x8F49
  GL_DOUBLE_MAT2x4                  := 0x8F4A
  GL_DOUBLE_MAT3x2                  := 0x8F4B
  GL_DOUBLE_MAT3x4                  := 0x8F4C
  GL_DOUBLE_MAT4x2                  := 0x8F4D
  GL_DOUBLE_MAT4x3                  := 0x8F4E
}

if (!GL_ARB_shader_subroutine)
{
  GL_ACTIVE_SUBROUTINES             := 0x8DE5
  GL_ACTIVE_SUBROUTINE_UNIFORMS     := 0x8DE6
  GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS := 0x8E47
  GL_ACTIVE_SUBROUTINE_MAX_LENGTH   := 0x8E48
  GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH := 0x8E49
  GL_MAX_SUBROUTINES                := 0x8DE7
  GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS := 0x8DE8
  GL_NUM_COMPATIBLE_SUBROUTINES     := 0x8E4A
  GL_COMPATIBLE_SUBROUTINES         := 0x8E4B
  ;reuse GL_UNIFORM_SIZE
  ;reuse GL_UNIFORM_NAME_LENGTH
}

if (!GL_ARB_tessellation_shader)
{
  GL_PATCHES                        := 0x000E
  GL_PATCH_VERTICES                 := 0x8E72
  GL_PATCH_DEFAULT_INNER_LEVEL      := 0x8E73
  GL_PATCH_DEFAULT_OUTER_LEVEL      := 0x8E74
  GL_TESS_CONTROL_OUTPUT_VERTICES   := 0x8E75
  GL_TESS_GEN_MODE                  := 0x8E76
  GL_TESS_GEN_SPACING               := 0x8E77
  GL_TESS_GEN_VERTEX_ORDER          := 0x8E78
  GL_TESS_GEN_POINT_MODE            := 0x8E79
  ;reuse GL_TRIANGLES
  ;reuse GL_QUADS
  GL_ISOLINES                       := 0x8E7A
  ;reuse GL_EQUAL
  GL_FRACTIONAL_ODD                 := 0x8E7B
  GL_FRACTIONAL_EVEN                := 0x8E7C
  ;reuse GL_CCW
  ;reuse GL_CW
  GL_MAX_PATCH_VERTICES             := 0x8E7D
  GL_MAX_TESS_GEN_LEVEL             := 0x8E7E
  GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS := 0x8E7F
  GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS := 0x8E80
  GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS := 0x8E81
  GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS := 0x8E82
  GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS := 0x8E83
  GL_MAX_TESS_PATCH_COMPONENTS      := 0x8E84
  GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS := 0x8E85
  GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS := 0x8E86
  GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS := 0x8E89
  GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS := 0x8E8A
  GL_MAX_TESS_CONTROL_INPUT_COMPONENTS := 0x886C
  GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS := 0x886D
  GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS := 0x8E1E
  GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS := 0x8E1F
  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER := 0x84F0
  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER := 0x84F1
  GL_TESS_EVALUATION_SHADER         := 0x8E87
  GL_TESS_CONTROL_SHADER            := 0x8E88
}

if (!GL_ARB_texture_buffer_object_rgb32)
{
  ;reuse GL_RGB32F
  ;reuse GL_RGB32UI
  ;reuse GL_RGB32I
}

if (!GL_ARB_transform_feedback2)
{
  GL_TRANSFORM_FEEDBACK             := 0x8E22
  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED := 0x8E23
  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE := 0x8E24
  GL_TRANSFORM_FEEDBACK_BINDING     := 0x8E25
}

if (!GL_ARB_transform_feedback3)
{
  GL_MAX_TRANSFORM_FEEDBACK_BUFFERS := 0x8E70
  GL_MAX_VERTEX_STREAMS             := 0x8E71
}

if (!GL_ARB_ES2_compatibility)
{
  GL_FIXED                          := 0x140C
  GL_IMPLEMENTATION_COLOR_READ_TYPE := 0x8B9A
  GL_IMPLEMENTATION_COLOR_READ_FORMAT := 0x8B9B
  GL_LOW_FLOAT                      := 0x8DF0
  GL_MEDIUM_FLOAT                   := 0x8DF1
  GL_HIGH_FLOAT                     := 0x8DF2
  GL_LOW_INT                        := 0x8DF3
  GL_MEDIUM_INT                     := 0x8DF4
  GL_HIGH_INT                       := 0x8DF5
  GL_SHADER_COMPILER                := 0x8DFA
  GL_NUM_SHADER_BINARY_FORMATS      := 0x8DF9
  GL_MAX_VERTEX_UNIFORM_VECTORS     := 0x8DFB
  GL_MAX_VARYING_VECTORS            := 0x8DFC
  GL_MAX_FRAGMENT_UNIFORM_VECTORS   := 0x8DFD
}

if (!GL_ARB_get_program_binary)
{
  GL_PROGRAM_BINARY_RETRIEVABLE_HINT := 0x8257
  GL_PROGRAM_BINARY_LENGTH          := 0x8741
  GL_NUM_PROGRAM_BINARY_FORMATS     := 0x87FE
  GL_PROGRAM_BINARY_FORMATS         := 0x87FF
}

if (!GL_ARB_separate_shader_objects)
{
  GL_VERTEX_SHADER_BIT              := 0x00000001
  GL_FRAGMENT_SHADER_BIT            := 0x00000002
  GL_GEOMETRY_SHADER_BIT            := 0x00000004
  GL_TESS_CONTROL_SHADER_BIT        := 0x00000008
  GL_TESS_EVALUATION_SHADER_BIT     := 0x00000010
  GL_ALL_SHADER_BITS                := 0xFFFFFFFF
  GL_PROGRAM_SEPARABLE              := 0x8258
  GL_ACTIVE_PROGRAM                 := 0x8259
  GL_PROGRAM_PIPELINE_BINDING       := 0x825A
}

if (!GL_ARB_shader_precision)
{
}

if (!GL_ARB_vertex_attrib_64bit)
{
  ;reuse GL_RGB32I
  ;reuse GL_DOUBLE_VEC2
  ;reuse GL_DOUBLE_VEC3
  ;reuse GL_DOUBLE_VEC4
  ;reuse GL_DOUBLE_MAT2
  ;reuse GL_DOUBLE_MAT3
  ;reuse GL_DOUBLE_MAT4
  ;reuse GL_DOUBLE_MAT2x3
  ;reuse GL_DOUBLE_MAT2x4
  ;reuse GL_DOUBLE_MAT3x2
  ;reuse GL_DOUBLE_MAT3x4
  ;reuse GL_DOUBLE_MAT4x2
  ;reuse GL_DOUBLE_MAT4x3
}

if (!GL_ARB_viewport_array)
{
  ;reuse GL_SCISSOR_BOX
  ;reuse GL_VIEWPORT
  ;reuse GL_DEPTH_RANGE
  ;reuse GL_SCISSOR_TEST
  GL_MAX_VIEWPORTS                  := 0x825B
  GL_VIEWPORT_SUBPIXEL_BITS         := 0x825C
  GL_VIEWPORT_BOUNDS_RANGE          := 0x825D
  GL_LAYER_PROVOKING_VERTEX         := 0x825E
  GL_VIEWPORT_INDEX_PROVOKING_VERTEX := 0x825F
  GL_UNDEFINED_VERTEX               := 0x8260
  ;reuse GL_FIRST_VERTEX_CONVENTION
  ;reuse GL_LAST_VERTEX_CONVENTION
  ;reuse GL_PROVOKING_VERTEX
}

if (!GL_ARB_cl_event)
{
  GL_SYNC_CL_EVENT_ARB              := 0x8240
  GL_SYNC_CL_EVENT_COMPLETE_ARB     := 0x8241
}

if (!GL_ARB_debug_output)
{
  GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   := 0x8242
  GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB := 0x8243
  GL_DEBUG_CALLBACK_FUNCTION_ARB    := 0x8244
  GL_DEBUG_CALLBACK_USER_PARAM_ARB  := 0x8245
  GL_DEBUG_SOURCE_API_ARB           := 0x8246
  GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB := 0x8247
  GL_DEBUG_SOURCE_SHADER_COMPILER_ARB := 0x8248
  GL_DEBUG_SOURCE_THIRD_PARTY_ARB   := 0x8249
  GL_DEBUG_SOURCE_APPLICATION_ARB   := 0x824A
  GL_DEBUG_SOURCE_OTHER_ARB         := 0x824B
  GL_DEBUG_TYPE_ERROR_ARB           := 0x824C
  GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB := 0x824D
  GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB := 0x824E
  GL_DEBUG_TYPE_PORTABILITY_ARB     := 0x824F
  GL_DEBUG_TYPE_PERFORMANCE_ARB     := 0x8250
  GL_DEBUG_TYPE_OTHER_ARB           := 0x8251
  GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   := 0x9143
  GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  := 0x9144
  GL_DEBUG_LOGGED_MESSAGES_ARB      := 0x9145
  GL_DEBUG_SEVERITY_HIGH_ARB        := 0x9146
  GL_DEBUG_SEVERITY_MEDIUM_ARB      := 0x9147
  GL_DEBUG_SEVERITY_LOW_ARB         := 0x9148
}

if (!GL_ARB_robustness)
{
  ;reuse GL_NO_ERROR
  GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB := 0x00000004
  GL_LOSE_CONTEXT_ON_RESET_ARB      := 0x8252
  GL_GUILTY_CONTEXT_RESET_ARB       := 0x8253
  GL_INNOCENT_CONTEXT_RESET_ARB     := 0x8254
  GL_UNKNOWN_CONTEXT_RESET_ARB      := 0x8255
  GL_RESET_NOTIFICATION_STRATEGY_ARB := 0x8256
  GL_NO_RESET_NOTIFICATION_ARB      := 0x8261
}

if (!GL_ARB_shader_stencil_export)
{
}

if (!GL_EXT_abgr)
{
  GL_ABGR_EXT                       := 0x8000
}

if (!GL_EXT_blend_color)
{
  GL_CONSTANT_COLOR_EXT             := 0x8001
  GL_ONE_MINUS_CONSTANT_COLOR_EXT   := 0x8002
  GL_CONSTANT_ALPHA_EXT             := 0x8003
  GL_ONE_MINUS_CONSTANT_ALPHA_EXT   := 0x8004
  GL_BLEND_COLOR_EXT                := 0x8005
}

if (!GL_EXT_polygon_offset)
{
  GL_POLYGON_OFFSET_EXT             := 0x8037
  GL_POLYGON_OFFSET_FACTOR_EXT      := 0x8038
  GL_POLYGON_OFFSET_BIAS_EXT        := 0x8039
}

if (!GL_EXT_texture)
{
  GL_ALPHA4_EXT                     := 0x803B
  GL_ALPHA8_EXT                     := 0x803C
  GL_ALPHA12_EXT                    := 0x803D
  GL_ALPHA16_EXT                    := 0x803E
  GL_LUMINANCE4_EXT                 := 0x803F
  GL_LUMINANCE8_EXT                 := 0x8040
  GL_LUMINANCE12_EXT                := 0x8041
  GL_LUMINANCE16_EXT                := 0x8042
  GL_LUMINANCE4_ALPHA4_EXT          := 0x8043
  GL_LUMINANCE6_ALPHA2_EXT          := 0x8044
  GL_LUMINANCE8_ALPHA8_EXT          := 0x8045
  GL_LUMINANCE12_ALPHA4_EXT         := 0x8046
  GL_LUMINANCE12_ALPHA12_EXT        := 0x8047
  GL_LUMINANCE16_ALPHA16_EXT        := 0x8048
  GL_INTENSITY_EXT                  := 0x8049
  GL_INTENSITY4_EXT                 := 0x804A
  GL_INTENSITY8_EXT                 := 0x804B
  GL_INTENSITY12_EXT                := 0x804C
  GL_INTENSITY16_EXT                := 0x804D
  GL_RGB2_EXT                       := 0x804E
  GL_RGB4_EXT                       := 0x804F
  GL_RGB5_EXT                       := 0x8050
  GL_RGB8_EXT                       := 0x8051
  GL_RGB10_EXT                      := 0x8052
  GL_RGB12_EXT                      := 0x8053
  GL_RGB16_EXT                      := 0x8054
  GL_RGBA2_EXT                      := 0x8055
  GL_RGBA4_EXT                      := 0x8056
  GL_RGB5_A1_EXT                    := 0x8057
  GL_RGBA8_EXT                      := 0x8058
  GL_RGB10_A2_EXT                   := 0x8059
  GL_RGBA12_EXT                     := 0x805A
  GL_RGBA16_EXT                     := 0x805B
  GL_TEXTURE_RED_SIZE_EXT           := 0x805C
  GL_TEXTURE_GREEN_SIZE_EXT         := 0x805D
  GL_TEXTURE_BLUE_SIZE_EXT          := 0x805E
  GL_TEXTURE_ALPHA_SIZE_EXT         := 0x805F
  GL_TEXTURE_LUMINANCE_SIZE_EXT     := 0x8060
  GL_TEXTURE_INTENSITY_SIZE_EXT     := 0x8061
  GL_REPLACE_EXT                    := 0x8062
  GL_PROXY_TEXTURE_1D_EXT           := 0x8063
  GL_PROXY_TEXTURE_2D_EXT           := 0x8064
  GL_TEXTURE_TOO_LARGE_EXT          := 0x8065
}

if (!GL_EXT_texture3D)
{
  GL_PACK_SKIP_IMAGES_EXT           := 0x806B
  GL_PACK_IMAGE_HEIGHT_EXT          := 0x806C
  GL_UNPACK_SKIP_IMAGES_EXT         := 0x806D
  GL_UNPACK_IMAGE_HEIGHT_EXT        := 0x806E
  GL_TEXTURE_3D_EXT                 := 0x806F
  GL_PROXY_TEXTURE_3D_EXT           := 0x8070
  GL_TEXTURE_DEPTH_EXT              := 0x8071
  GL_TEXTURE_WRAP_R_EXT             := 0x8072
  GL_MAX_3D_TEXTURE_SIZE_EXT        := 0x8073
}

if (!GL_SGIS_texture_filter4)
{
  GL_FILTER4_SGIS                   := 0x8146
  GL_TEXTURE_FILTER4_SIZE_SGIS      := 0x8147
}

if (!GL_EXT_subtexture)
{
}

if (!GL_EXT_copy_texture)
{
}

if (!GL_EXT_histogram)
{
  GL_HISTOGRAM_EXT                  := 0x8024
  GL_PROXY_HISTOGRAM_EXT            := 0x8025
  GL_HISTOGRAM_WIDTH_EXT            := 0x8026
  GL_HISTOGRAM_FORMAT_EXT           := 0x8027
  GL_HISTOGRAM_RED_SIZE_EXT         := 0x8028
  GL_HISTOGRAM_GREEN_SIZE_EXT       := 0x8029
  GL_HISTOGRAM_BLUE_SIZE_EXT        := 0x802A
  GL_HISTOGRAM_ALPHA_SIZE_EXT       := 0x802B
  GL_HISTOGRAM_LUMINANCE_SIZE_EXT   := 0x802C
  GL_HISTOGRAM_SINK_EXT             := 0x802D
  GL_MINMAX_EXT                     := 0x802E
  GL_MINMAX_FORMAT_EXT              := 0x802F
  GL_MINMAX_SINK_EXT                := 0x8030
  GL_TABLE_TOO_LARGE_EXT            := 0x8031
}

if (!GL_EXT_convolution)
{
  GL_CONVOLUTION_1D_EXT             := 0x8010
  GL_CONVOLUTION_2D_EXT             := 0x8011
  GL_SEPARABLE_2D_EXT               := 0x8012
  GL_CONVOLUTION_BORDER_MODE_EXT    := 0x8013
  GL_CONVOLUTION_FILTER_SCALE_EXT   := 0x8014
  GL_CONVOLUTION_FILTER_BIAS_EXT    := 0x8015
  GL_REDUCE_EXT                     := 0x8016
  GL_CONVOLUTION_FORMAT_EXT         := 0x8017
  GL_CONVOLUTION_WIDTH_EXT          := 0x8018
  GL_CONVOLUTION_HEIGHT_EXT         := 0x8019
  GL_MAX_CONVOLUTION_WIDTH_EXT      := 0x801A
  GL_MAX_CONVOLUTION_HEIGHT_EXT     := 0x801B
  GL_POST_CONVOLUTION_RED_SCALE_EXT := 0x801C
  GL_POST_CONVOLUTION_GREEN_SCALE_EXT := 0x801D
  GL_POST_CONVOLUTION_BLUE_SCALE_EXT := 0x801E
  GL_POST_CONVOLUTION_ALPHA_SCALE_EXT := 0x801F
  GL_POST_CONVOLUTION_RED_BIAS_EXT  := 0x8020
  GL_POST_CONVOLUTION_GREEN_BIAS_EXT := 0x8021
  GL_POST_CONVOLUTION_BLUE_BIAS_EXT := 0x8022
  GL_POST_CONVOLUTION_ALPHA_BIAS_EXT := 0x8023
}

if (!GL_SGI_color_matrix)
{
  GL_COLOR_MATRIX_SGI               := 0x80B1
  GL_COLOR_MATRIX_STACK_DEPTH_SGI   := 0x80B2
  GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI := 0x80B3
  GL_POST_COLOR_MATRIX_RED_SCALE_SGI := 0x80B4
  GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI := 0x80B5
  GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI := 0x80B6
  GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI := 0x80B7
  GL_POST_COLOR_MATRIX_RED_BIAS_SGI := 0x80B8
  GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI := 0x80B9
  GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI := 0x80BA
  GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI := 0x80BB
}

if (!GL_SGI_color_table)
{
  GL_COLOR_TABLE_SGI                := 0x80D0
  GL_POST_CONVOLUTION_COLOR_TABLE_SGI := 0x80D1
  GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI := 0x80D2
  GL_PROXY_COLOR_TABLE_SGI          := 0x80D3
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI := 0x80D4
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI := 0x80D5
  GL_COLOR_TABLE_SCALE_SGI          := 0x80D6
  GL_COLOR_TABLE_BIAS_SGI           := 0x80D7
  GL_COLOR_TABLE_FORMAT_SGI         := 0x80D8
  GL_COLOR_TABLE_WIDTH_SGI          := 0x80D9
  GL_COLOR_TABLE_RED_SIZE_SGI       := 0x80DA
  GL_COLOR_TABLE_GREEN_SIZE_SGI     := 0x80DB
  GL_COLOR_TABLE_BLUE_SIZE_SGI      := 0x80DC
  GL_COLOR_TABLE_ALPHA_SIZE_SGI     := 0x80DD
  GL_COLOR_TABLE_LUMINANCE_SIZE_SGI := 0x80DE
  GL_COLOR_TABLE_INTENSITY_SIZE_SGI := 0x80DF
}

if (!GL_SGIS_pixel_texture)
{
  GL_PIXEL_TEXTURE_SGIS             := 0x8353
  GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS := 0x8354
  GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS := 0x8355
  GL_PIXEL_GROUP_COLOR_SGIS         := 0x8356
}

if (!GL_SGIX_pixel_texture)
{
  GL_PIXEL_TEX_GEN_SGIX             := 0x8139
  GL_PIXEL_TEX_GEN_MODE_SGIX        := 0x832B
}

if (!GL_SGIS_texture4D)
{
  GL_PACK_SKIP_VOLUMES_SGIS         := 0x8130
  GL_PACK_IMAGE_DEPTH_SGIS          := 0x8131
  GL_UNPACK_SKIP_VOLUMES_SGIS       := 0x8132
  GL_UNPACK_IMAGE_DEPTH_SGIS        := 0x8133
  GL_TEXTURE_4D_SGIS                := 0x8134
  GL_PROXY_TEXTURE_4D_SGIS          := 0x8135
  GL_TEXTURE_4DSIZE_SGIS            := 0x8136
  GL_TEXTURE_WRAP_Q_SGIS            := 0x8137
  GL_MAX_4D_TEXTURE_SIZE_SGIS       := 0x8138
  GL_TEXTURE_4D_BINDING_SGIS        := 0x814F
}

if (!GL_SGI_texture_color_table)
{
  GL_TEXTURE_COLOR_TABLE_SGI        := 0x80BC
  GL_PROXY_TEXTURE_COLOR_TABLE_SGI  := 0x80BD
}

if (!GL_EXT_cmyka)
{
  GL_CMYK_EXT                       := 0x800C
  GL_CMYKA_EXT                      := 0x800D
  GL_PACK_CMYK_HINT_EXT             := 0x800E
  GL_UNPACK_CMYK_HINT_EXT           := 0x800F
}

if (!GL_EXT_texture_object)
{
  GL_TEXTURE_PRIORITY_EXT           := 0x8066
  GL_TEXTURE_RESIDENT_EXT           := 0x8067
  GL_TEXTURE_1D_BINDING_EXT         := 0x8068
  GL_TEXTURE_2D_BINDING_EXT         := 0x8069
  GL_TEXTURE_3D_BINDING_EXT         := 0x806A
}

if (!GL_SGIS_detail_texture)
{
  GL_DETAIL_TEXTURE_2D_SGIS         := 0x8095
  GL_DETAIL_TEXTURE_2D_BINDING_SGIS := 0x8096
  GL_LINEAR_DETAIL_SGIS             := 0x8097
  GL_LINEAR_DETAIL_ALPHA_SGIS       := 0x8098
  GL_LINEAR_DETAIL_COLOR_SGIS       := 0x8099
  GL_DETAIL_TEXTURE_LEVEL_SGIS      := 0x809A
  GL_DETAIL_TEXTURE_MODE_SGIS       := 0x809B
  GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS := 0x809C
}

if (!GL_SGIS_sharpen_texture)
{
  GL_LINEAR_SHARPEN_SGIS            := 0x80AD
  GL_LINEAR_SHARPEN_ALPHA_SGIS      := 0x80AE
  GL_LINEAR_SHARPEN_COLOR_SGIS      := 0x80AF
  GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS := 0x80B0
}

if (!GL_EXT_packed_pixels)
{
  GL_UNSIGNED_BYTE_3_3_2_EXT        := 0x8032
  GL_UNSIGNED_SHORT_4_4_4_4_EXT     := 0x8033
  GL_UNSIGNED_SHORT_5_5_5_1_EXT     := 0x8034
  GL_UNSIGNED_INT_8_8_8_8_EXT       := 0x8035
  GL_UNSIGNED_INT_10_10_10_2_EXT    := 0x8036
}

if (!GL_SGIS_texture_lod)
{
  GL_TEXTURE_MIN_LOD_SGIS           := 0x813A
  GL_TEXTURE_MAX_LOD_SGIS           := 0x813B
  GL_TEXTURE_BASE_LEVEL_SGIS        := 0x813C
  GL_TEXTURE_MAX_LEVEL_SGIS         := 0x813D
}

if (!GL_SGIS_multisample)
{
  GL_MULTISAMPLE_SGIS               := 0x809D
  GL_SAMPLE_ALPHA_TO_MASK_SGIS      := 0x809E
  GL_SAMPLE_ALPHA_TO_ONE_SGIS       := 0x809F
  GL_SAMPLE_MASK_SGIS               := 0x80A0
  GL_1PASS_SGIS                     := 0x80A1
  GL_2PASS_0_SGIS                   := 0x80A2
  GL_2PASS_1_SGIS                   := 0x80A3
  GL_4PASS_0_SGIS                   := 0x80A4
  GL_4PASS_1_SGIS                   := 0x80A5
  GL_4PASS_2_SGIS                   := 0x80A6
  GL_4PASS_3_SGIS                   := 0x80A7
  GL_SAMPLE_BUFFERS_SGIS            := 0x80A8
  GL_SAMPLES_SGIS                   := 0x80A9
  GL_SAMPLE_MASK_VALUE_SGIS         := 0x80AA
  GL_SAMPLE_MASK_INVERT_SGIS        := 0x80AB
  GL_SAMPLE_PATTERN_SGIS            := 0x80AC
}

if (!GL_EXT_rescale_normal)
{
  GL_RESCALE_NORMAL_EXT             := 0x803A
}

if (!GL_EXT_vertex_array)
{
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
}

if (!GL_EXT_misc_attribute)
{
}

if (!GL_SGIS_generate_mipmap)
{
  GL_GENERATE_MIPMAP_SGIS           := 0x8191
  GL_GENERATE_MIPMAP_HINT_SGIS      := 0x8192
}

if (!GL_SGIX_clipmap)
{
  GL_LINEAR_CLIPMAP_LINEAR_SGIX     := 0x8170
  GL_TEXTURE_CLIPMAP_CENTER_SGIX    := 0x8171
  GL_TEXTURE_CLIPMAP_FRAME_SGIX     := 0x8172
  GL_TEXTURE_CLIPMAP_OFFSET_SGIX    := 0x8173
  GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX := 0x8174
  GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX := 0x8175
  GL_TEXTURE_CLIPMAP_DEPTH_SGIX     := 0x8176
  GL_MAX_CLIPMAP_DEPTH_SGIX         := 0x8177
  GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX := 0x8178
  GL_NEAREST_CLIPMAP_NEAREST_SGIX   := 0x844D
  GL_NEAREST_CLIPMAP_LINEAR_SGIX    := 0x844E
  GL_LINEAR_CLIPMAP_NEAREST_SGIX    := 0x844F
}

if (!GL_SGIX_shadow)
{
  GL_TEXTURE_COMPARE_SGIX           := 0x819A
  GL_TEXTURE_COMPARE_OPERATOR_SGIX  := 0x819B
  GL_TEXTURE_LEQUAL_R_SGIX          := 0x819C
  GL_TEXTURE_GEQUAL_R_SGIX          := 0x819D
}

if (!GL_SGIS_texture_edge_clamp)
{
  GL_CLAMP_TO_EDGE_SGIS             := 0x812F
}

if (!GL_SGIS_texture_border_clamp)
{
  GL_CLAMP_TO_BORDER_SGIS           := 0x812D
}

if (!GL_EXT_blend_minmax)
{
  GL_FUNC_ADD_EXT                   := 0x8006
  GL_MIN_EXT                        := 0x8007
  GL_MAX_EXT                        := 0x8008
  GL_BLEND_EQUATION_EXT             := 0x8009
}

if (!GL_EXT_blend_subtract)
{
  GL_FUNC_SUBTRACT_EXT              := 0x800A
  GL_FUNC_REVERSE_SUBTRACT_EXT      := 0x800B
}

if (!GL_EXT_blend_logic_op)
{
}

if (!GL_SGIX_interlace)
{
  GL_INTERLACE_SGIX                 := 0x8094
}

if (!GL_SGIX_pixel_tiles)
{
  GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX := 0x813E
  GL_PIXEL_TILE_CACHE_INCREMENT_SGIX := 0x813F
  GL_PIXEL_TILE_WIDTH_SGIX          := 0x8140
  GL_PIXEL_TILE_HEIGHT_SGIX         := 0x8141
  GL_PIXEL_TILE_GRID_WIDTH_SGIX     := 0x8142
  GL_PIXEL_TILE_GRID_HEIGHT_SGIX    := 0x8143
  GL_PIXEL_TILE_GRID_DEPTH_SGIX     := 0x8144
  GL_PIXEL_TILE_CACHE_SIZE_SGIX     := 0x8145
}

if (!GL_SGIS_texture_select)
{
  GL_DUAL_ALPHA4_SGIS               := 0x8110
  GL_DUAL_ALPHA8_SGIS               := 0x8111
  GL_DUAL_ALPHA12_SGIS              := 0x8112
  GL_DUAL_ALPHA16_SGIS              := 0x8113
  GL_DUAL_LUMINANCE4_SGIS           := 0x8114
  GL_DUAL_LUMINANCE8_SGIS           := 0x8115
  GL_DUAL_LUMINANCE12_SGIS          := 0x8116
  GL_DUAL_LUMINANCE16_SGIS          := 0x8117
  GL_DUAL_INTENSITY4_SGIS           := 0x8118
  GL_DUAL_INTENSITY8_SGIS           := 0x8119
  GL_DUAL_INTENSITY12_SGIS          := 0x811A
  GL_DUAL_INTENSITY16_SGIS          := 0x811B
  GL_DUAL_LUMINANCE_ALPHA4_SGIS     := 0x811C
  GL_DUAL_LUMINANCE_ALPHA8_SGIS     := 0x811D
  GL_QUAD_ALPHA4_SGIS               := 0x811E
  GL_QUAD_ALPHA8_SGIS               := 0x811F
  GL_QUAD_LUMINANCE4_SGIS           := 0x8120
  GL_QUAD_LUMINANCE8_SGIS           := 0x8121
  GL_QUAD_INTENSITY4_SGIS           := 0x8122
  GL_QUAD_INTENSITY8_SGIS           := 0x8123
  GL_DUAL_TEXTURE_SELECT_SGIS       := 0x8124
  GL_QUAD_TEXTURE_SELECT_SGIS       := 0x8125
}

if (!GL_SGIX_sprite)
{
  GL_SPRITE_SGIX                    := 0x8148
  GL_SPRITE_MODE_SGIX               := 0x8149
  GL_SPRITE_AXIS_SGIX               := 0x814A
  GL_SPRITE_TRANSLATION_SGIX        := 0x814B
  GL_SPRITE_AXIAL_SGIX              := 0x814C
  GL_SPRITE_OBJECT_ALIGNED_SGIX     := 0x814D
  GL_SPRITE_EYE_ALIGNED_SGIX        := 0x814E
}

if (!GL_SGIX_texture_multi_buffer)
{
  GL_TEXTURE_MULTI_BUFFER_HINT_SGIX := 0x812E
}

if (!GL_EXT_point_parameters)
{
  GL_POINT_SIZE_MIN_EXT             := 0x8126
  GL_POINT_SIZE_MAX_EXT             := 0x8127
  GL_POINT_FADE_THRESHOLD_SIZE_EXT  := 0x8128
  GL_DISTANCE_ATTENUATION_EXT       := 0x8129
}

if (!GL_SGIS_point_parameters)
{
  GL_POINT_SIZE_MIN_SGIS            := 0x8126
  GL_POINT_SIZE_MAX_SGIS            := 0x8127
  GL_POINT_FADE_THRESHOLD_SIZE_SGIS := 0x8128
  GL_DISTANCE_ATTENUATION_SGIS      := 0x8129
}

if (!GL_SGIX_instruments)
{
  GL_INSTRUMENT_BUFFER_POINTER_SGIX := 0x8180
  GL_INSTRUMENT_MEASUREMENTS_SGIX   := 0x8181
}

if (!GL_SGIX_texture_scale_bias)
{
  GL_POST_TEXTURE_FILTER_BIAS_SGIX  := 0x8179
  GL_POST_TEXTURE_FILTER_SCALE_SGIX := 0x817A
  GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX := 0x817B
  GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX := 0x817C
}

if (!GL_SGIX_framezoom)
{
  GL_FRAMEZOOM_SGIX                 := 0x818B
  GL_FRAMEZOOM_FACTOR_SGIX          := 0x818C
  GL_MAX_FRAMEZOOM_FACTOR_SGIX      := 0x818D
}

if (!GL_SGIX_tag_sample_buffer)
{
}

if (!GL_FfdMaskSGIX)
{
  GL_TEXTURE_DEFORMATION_BIT_SGIX   := 0x00000001
  GL_GEOMETRY_DEFORMATION_BIT_SGIX  := 0x00000002
}

if (!GL_SGIX_polynomial_ffd)
{
  GL_GEOMETRY_DEFORMATION_SGIX      := 0x8194
  GL_TEXTURE_DEFORMATION_SGIX       := 0x8195
  GL_DEFORMATIONS_MASK_SGIX         := 0x8196
  GL_MAX_DEFORMATION_ORDER_SGIX     := 0x8197
}

if (!GL_SGIX_reference_plane)
{
  GL_REFERENCE_PLANE_SGIX           := 0x817D
  GL_REFERENCE_PLANE_EQUATION_SGIX  := 0x817E
}

if (!GL_SGIX_flush_raster)
{
}

if (!GL_SGIX_depth_texture)
{
  GL_DEPTH_COMPONENT16_SGIX         := 0x81A5
  GL_DEPTH_COMPONENT24_SGIX         := 0x81A6
  GL_DEPTH_COMPONENT32_SGIX         := 0x81A7
}

if (!GL_SGIS_fog_function)
{
  GL_FOG_FUNC_SGIS                  := 0x812A
  GL_FOG_FUNC_POINTS_SGIS           := 0x812B
  GL_MAX_FOG_FUNC_POINTS_SGIS       := 0x812C
}

if (!GL_SGIX_fog_offset)
{
  GL_FOG_OFFSET_SGIX                := 0x8198
  GL_FOG_OFFSET_VALUE_SGIX          := 0x8199
}

if (!GL_HP_image_transform)
{
  GL_IMAGE_SCALE_X_HP               := 0x8155
  GL_IMAGE_SCALE_Y_HP               := 0x8156
  GL_IMAGE_TRANSLATE_X_HP           := 0x8157
  GL_IMAGE_TRANSLATE_Y_HP           := 0x8158
  GL_IMAGE_ROTATE_ANGLE_HP          := 0x8159
  GL_IMAGE_ROTATE_ORIGIN_X_HP       := 0x815A
  GL_IMAGE_ROTATE_ORIGIN_Y_HP       := 0x815B
  GL_IMAGE_MAG_FILTER_HP            := 0x815C
  GL_IMAGE_MIN_FILTER_HP            := 0x815D
  GL_IMAGE_CUBIC_WEIGHT_HP          := 0x815E
  GL_CUBIC_HP                       := 0x815F
  GL_AVERAGE_HP                     := 0x8160
  GL_IMAGE_TRANSFORM_2D_HP          := 0x8161
  GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP := 0x8162
  GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP := 0x8163
}

if (!GL_HP_convolution_border_modes)
{
  GL_IGNORE_BORDER_HP               := 0x8150
  GL_CONSTANT_BORDER_HP             := 0x8151
  GL_REPLICATE_BORDER_HP            := 0x8153
  GL_CONVOLUTION_BORDER_COLOR_HP    := 0x8154
}

if (!GL_INGR_palette_buffer)
{
}

if (!GL_SGIX_texture_add_env)
{
  GL_TEXTURE_ENV_BIAS_SGIX          := 0x80BE
}

if (!GL_EXT_color_subtable)
{
}

if (!GL_PGI_vertex_hints)
{
  GL_VERTEX_DATA_HINT_PGI           := 0x1A22A
  GL_VERTEX_CONSISTENT_HINT_PGI     := 0x1A22B
  GL_MATERIAL_SIDE_HINT_PGI         := 0x1A22C
  GL_MAX_VERTEX_HINT_PGI            := 0x1A22D
  GL_COLOR3_BIT_PGI                 := 0x00010000
  GL_COLOR4_BIT_PGI                 := 0x00020000
  GL_EDGEFLAG_BIT_PGI               := 0x00040000
  GL_INDEX_BIT_PGI                  := 0x00080000
  GL_MAT_AMBIENT_BIT_PGI            := 0x00100000
  GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI := 0x00200000
  GL_MAT_DIFFUSE_BIT_PGI            := 0x00400000
  GL_MAT_EMISSION_BIT_PGI           := 0x00800000
  GL_MAT_COLOR_INDEXES_BIT_PGI      := 0x01000000
  GL_MAT_SHININESS_BIT_PGI          := 0x02000000
  GL_MAT_SPECULAR_BIT_PGI           := 0x04000000
  GL_NORMAL_BIT_PGI                 := 0x08000000
  GL_TEXCOORD1_BIT_PGI              := 0x10000000
  GL_TEXCOORD2_BIT_PGI              := 0x20000000
  GL_TEXCOORD3_BIT_PGI              := 0x40000000
  GL_TEXCOORD4_BIT_PGI              := 0x80000000
  GL_VERTEX23_BIT_PGI               := 0x00000004
  GL_VERTEX4_BIT_PGI                := 0x00000008
}

if (!GL_PGI_misc_hints)
{
  GL_PREFER_DOUBLEBUFFER_HINT_PGI   := 0x1A1F8
  GL_CONSERVE_MEMORY_HINT_PGI       := 0x1A1FD
  GL_RECLAIM_MEMORY_HINT_PGI        := 0x1A1FE
  GL_NATIVE_GRAPHICS_HANDLE_PGI     := 0x1A202
  GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI := 0x1A203
  GL_NATIVE_GRAPHICS_END_HINT_PGI   := 0x1A204
  GL_ALWAYS_FAST_HINT_PGI           := 0x1A20C
  GL_ALWAYS_SOFT_HINT_PGI           := 0x1A20D
  GL_ALLOW_DRAW_OBJ_HINT_PGI        := 0x1A20E
  GL_ALLOW_DRAW_WIN_HINT_PGI        := 0x1A20F
  GL_ALLOW_DRAW_FRG_HINT_PGI        := 0x1A210
  GL_ALLOW_DRAW_MEM_HINT_PGI        := 0x1A211
  GL_STRICT_DEPTHFUNC_HINT_PGI      := 0x1A216
  GL_STRICT_LIGHTING_HINT_PGI       := 0x1A217
  GL_STRICT_SCISSOR_HINT_PGI        := 0x1A218
  GL_FULL_STIPPLE_HINT_PGI          := 0x1A219
  GL_CLIP_NEAR_HINT_PGI             := 0x1A220
  GL_CLIP_FAR_HINT_PGI              := 0x1A221
  GL_WIDE_LINE_HINT_PGI             := 0x1A222
  GL_BACK_NORMALS_HINT_PGI          := 0x1A223
}

if (!GL_EXT_paletted_texture)
{
  GL_COLOR_INDEX1_EXT               := 0x80E2
  GL_COLOR_INDEX2_EXT               := 0x80E3
  GL_COLOR_INDEX4_EXT               := 0x80E4
  GL_COLOR_INDEX8_EXT               := 0x80E5
  GL_COLOR_INDEX12_EXT              := 0x80E6
  GL_COLOR_INDEX16_EXT              := 0x80E7
  GL_TEXTURE_INDEX_SIZE_EXT         := 0x80ED
}

if (!GL_EXT_clip_volume_hint)
{
  GL_CLIP_VOLUME_CLIPPING_HINT_EXT  := 0x80F0
}

if (!GL_SGIX_list_priority)
{
  GL_LIST_PRIORITY_SGIX             := 0x8182
}

if (!GL_SGIX_ir_instrument1)
{
  GL_IR_INSTRUMENT1_SGIX            := 0x817F
}

if (!GL_SGIX_calligraphic_fragment)
{
  GL_CALLIGRAPHIC_FRAGMENT_SGIX     := 0x8183
}

if (!GL_SGIX_texture_lod_bias)
{
  GL_TEXTURE_LOD_BIAS_S_SGIX        := 0x818E
  GL_TEXTURE_LOD_BIAS_T_SGIX        := 0x818F
  GL_TEXTURE_LOD_BIAS_R_SGIX        := 0x8190
}

if (!GL_SGIX_shadow_ambient)
{
  GL_SHADOW_AMBIENT_SGIX            := 0x80BF
}

if (!GL_EXT_index_texture)
{
}

if (!GL_EXT_index_material)
{
  GL_INDEX_MATERIAL_EXT             := 0x81B8
  GL_INDEX_MATERIAL_PARAMETER_EXT   := 0x81B9
  GL_INDEX_MATERIAL_FACE_EXT        := 0x81BA
}

if (!GL_EXT_index_func)
{
  GL_INDEX_TEST_EXT                 := 0x81B5
  GL_INDEX_TEST_FUNC_EXT            := 0x81B6
  GL_INDEX_TEST_REF_EXT             := 0x81B7
}

if (!GL_EXT_index_array_formats)
{
  GL_IUI_V2F_EXT                    := 0x81AD
  GL_IUI_V3F_EXT                    := 0x81AE
  GL_IUI_N3F_V2F_EXT                := 0x81AF
  GL_IUI_N3F_V3F_EXT                := 0x81B0
  GL_T2F_IUI_V2F_EXT                := 0x81B1
  GL_T2F_IUI_V3F_EXT                := 0x81B2
  GL_T2F_IUI_N3F_V2F_EXT            := 0x81B3
  GL_T2F_IUI_N3F_V3F_EXT            := 0x81B4
}

if (!GL_EXT_compiled_vertex_array)
{
  GL_ARRAY_ELEMENT_LOCK_FIRST_EXT   := 0x81A8
  GL_ARRAY_ELEMENT_LOCK_COUNT_EXT   := 0x81A9
}

if (!GL_EXT_cull_vertex)
{
  GL_CULL_VERTEX_EXT                := 0x81AA
  GL_CULL_VERTEX_EYE_POSITION_EXT   := 0x81AB
  GL_CULL_VERTEX_OBJECT_POSITION_EXT := 0x81AC
}

if (!GL_SGIX_ycrcb)
{
  GL_YCRCB_422_SGIX                 := 0x81BB
  GL_YCRCB_444_SGIX                 := 0x81BC
}

if (!GL_SGIX_fragment_lighting)
{
  GL_FRAGMENT_LIGHTING_SGIX         := 0x8400
  GL_FRAGMENT_COLOR_MATERIAL_SGIX   := 0x8401
  GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX := 0x8402
  GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX := 0x8403
  GL_MAX_FRAGMENT_LIGHTS_SGIX       := 0x8404
  GL_MAX_ACTIVE_LIGHTS_SGIX         := 0x8405
  GL_CURRENT_RASTER_NORMAL_SGIX     := 0x8406
  GL_LIGHT_ENV_MODE_SGIX            := 0x8407
  GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX := 0x8408
  GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX := 0x8409
  GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX := 0x840A
  GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX := 0x840B
  GL_FRAGMENT_LIGHT0_SGIX           := 0x840C
  GL_FRAGMENT_LIGHT1_SGIX           := 0x840D
  GL_FRAGMENT_LIGHT2_SGIX           := 0x840E
  GL_FRAGMENT_LIGHT3_SGIX           := 0x840F
  GL_FRAGMENT_LIGHT4_SGIX           := 0x8410
  GL_FRAGMENT_LIGHT5_SGIX           := 0x8411
  GL_FRAGMENT_LIGHT6_SGIX           := 0x8412
  GL_FRAGMENT_LIGHT7_SGIX           := 0x8413
}

if (!GL_IBM_rasterpos_clip)
{
  GL_RASTER_POSITION_UNCLIPPED_IBM  := 0x19262
}

if (!GL_HP_texture_lighting)
{
  GL_TEXTURE_LIGHTING_MODE_HP       := 0x8167
  GL_TEXTURE_POST_SPECULAR_HP       := 0x8168
  GL_TEXTURE_PRE_SPECULAR_HP        := 0x8169
}

if (!GL_EXT_draw_range_elements)
{
  GL_MAX_ELEMENTS_VERTICES_EXT      := 0x80E8
  GL_MAX_ELEMENTS_INDICES_EXT       := 0x80E9
}

if (!GL_WIN_phong_shading)
{
  GL_PHONG_WIN                      := 0x80EA
  GL_PHONG_HINT_WIN                 := 0x80EB
}

if (!GL_WIN_specular_fog)
{
  GL_FOG_SPECULAR_TEXTURE_WIN       := 0x80EC
}

if (!GL_EXT_light_texture)
{
  GL_FRAGMENT_MATERIAL_EXT          := 0x8349
  GL_FRAGMENT_NORMAL_EXT            := 0x834A
  GL_FRAGMENT_COLOR_EXT             := 0x834C
  GL_ATTENUATION_EXT                := 0x834D
  GL_SHADOW_ATTENUATION_EXT         := 0x834E
  GL_TEXTURE_APPLICATION_MODE_EXT   := 0x834F
  GL_TEXTURE_LIGHT_EXT              := 0x8350
  GL_TEXTURE_MATERIAL_FACE_EXT      := 0x8351
  GL_TEXTURE_MATERIAL_PARAMETER_EXT := 0x8352
  ;reuse GL_FRAGMENT_DEPTH_EXT
}

if (!GL_SGIX_blend_alpha_minmax)
{
  GL_ALPHA_MIN_SGIX                 := 0x8320
  GL_ALPHA_MAX_SGIX                 := 0x8321
}

if (!GL_SGIX_impact_pixel_texture)
{
  GL_PIXEL_TEX_GEN_Q_CEILING_SGIX   := 0x8184
  GL_PIXEL_TEX_GEN_Q_ROUND_SGIX     := 0x8185
  GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX     := 0x8186
  GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX := 0x8187
  GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX := 0x8188
  GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX    := 0x8189
  GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX    := 0x818A
}

if (!GL_EXT_bgra)
{
  GL_BGR_EXT                        := 0x80E0
  GL_BGRA_EXT                       := 0x80E1
}

if (!GL_SGIX_async)
{
  GL_ASYNC_MARKER_SGIX              := 0x8329
}

if (!GL_SGIX_async_pixel)
{
  GL_ASYNC_TEX_IMAGE_SGIX           := 0x835C
  GL_ASYNC_DRAW_PIXELS_SGIX         := 0x835D
  GL_ASYNC_READ_PIXELS_SGIX         := 0x835E
  GL_MAX_ASYNC_TEX_IMAGE_SGIX       := 0x835F
  GL_MAX_ASYNC_DRAW_PIXELS_SGIX     := 0x8360
  GL_MAX_ASYNC_READ_PIXELS_SGIX     := 0x8361
}

if (!GL_SGIX_async_histogram)
{
  GL_ASYNC_HISTOGRAM_SGIX           := 0x832C
  GL_MAX_ASYNC_HISTOGRAM_SGIX       := 0x832D
}

if (!GL_INTEL_texture_scissor)
{
}

if (!GL_INTEL_parallel_arrays)
{
  GL_PARALLEL_ARRAYS_INTEL          := 0x83F4
  GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL := 0x83F5
  GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL := 0x83F6
  GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL := 0x83F7
  GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL := 0x83F8
}

if (!GL_HP_occlusion_test)
{
  GL_OCCLUSION_TEST_HP              := 0x8165
  GL_OCCLUSION_TEST_RESULT_HP       := 0x8166
}

if (!GL_EXT_pixel_transform)
{
  GL_PIXEL_TRANSFORM_2D_EXT         := 0x8330
  GL_PIXEL_MAG_FILTER_EXT           := 0x8331
  GL_PIXEL_MIN_FILTER_EXT           := 0x8332
  GL_PIXEL_CUBIC_WEIGHT_EXT         := 0x8333
  GL_CUBIC_EXT                      := 0x8334
  GL_AVERAGE_EXT                    := 0x8335
  GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT := 0x8336
  GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT := 0x8337
  GL_PIXEL_TRANSFORM_2D_MATRIX_EXT  := 0x8338
}

if (!GL_EXT_pixel_transform_color_table)
{
}

if (!GL_EXT_shared_texture_palette)
{
  GL_SHARED_TEXTURE_PALETTE_EXT     := 0x81FB
}

if (!GL_EXT_separate_specular_color)
{
  GL_LIGHT_MODEL_COLOR_CONTROL_EXT  := 0x81F8
  GL_SINGLE_COLOR_EXT               := 0x81F9
  GL_SEPARATE_SPECULAR_COLOR_EXT    := 0x81FA
}

if (!GL_EXT_secondary_color)
{
  GL_COLOR_SUM_EXT                  := 0x8458
  GL_CURRENT_SECONDARY_COLOR_EXT    := 0x8459
  GL_SECONDARY_COLOR_ARRAY_SIZE_EXT := 0x845A
  GL_SECONDARY_COLOR_ARRAY_TYPE_EXT := 0x845B
  GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT := 0x845C
  GL_SECONDARY_COLOR_ARRAY_POINTER_EXT := 0x845D
  GL_SECONDARY_COLOR_ARRAY_EXT      := 0x845E
}

if (!GL_EXT_texture_perturb_normal)
{
  GL_PERTURB_EXT                    := 0x85AE
  GL_TEXTURE_NORMAL_EXT             := 0x85AF
}

if (!GL_EXT_multi_draw_arrays)
{
}

if (!GL_EXT_fog_coord)
{
  GL_FOG_COORDINATE_SOURCE_EXT      := 0x8450
  GL_FOG_COORDINATE_EXT             := 0x8451
  GL_FRAGMENT_DEPTH_EXT             := 0x8452
  GL_CURRENT_FOG_COORDINATE_EXT     := 0x8453
  GL_FOG_COORDINATE_ARRAY_TYPE_EXT  := 0x8454
  GL_FOG_COORDINATE_ARRAY_STRIDE_EXT := 0x8455
  GL_FOG_COORDINATE_ARRAY_POINTER_EXT := 0x8456
  GL_FOG_COORDINATE_ARRAY_EXT       := 0x8457
}

if (!GL_REND_screen_coordinates)
{
  GL_SCREEN_COORDINATES_REND        := 0x8490
  GL_INVERTED_SCREEN_W_REND         := 0x8491
}

if (!GL_EXT_coordinate_frame)
{
  GL_TANGENT_ARRAY_EXT              := 0x8439
  GL_BINORMAL_ARRAY_EXT             := 0x843A
  GL_CURRENT_TANGENT_EXT            := 0x843B
  GL_CURRENT_BINORMAL_EXT           := 0x843C
  GL_TANGENT_ARRAY_TYPE_EXT         := 0x843E
  GL_TANGENT_ARRAY_STRIDE_EXT       := 0x843F
  GL_BINORMAL_ARRAY_TYPE_EXT        := 0x8440
  GL_BINORMAL_ARRAY_STRIDE_EXT      := 0x8441
  GL_TANGENT_ARRAY_POINTER_EXT      := 0x8442
  GL_BINORMAL_ARRAY_POINTER_EXT     := 0x8443
  GL_MAP1_TANGENT_EXT               := 0x8444
  GL_MAP2_TANGENT_EXT               := 0x8445
  GL_MAP1_BINORMAL_EXT              := 0x8446
  GL_MAP2_BINORMAL_EXT              := 0x8447
}

if (!GL_EXT_texture_env_combine)
{
  GL_COMBINE_EXT                    := 0x8570
  GL_COMBINE_RGB_EXT                := 0x8571
  GL_COMBINE_ALPHA_EXT              := 0x8572
  GL_RGB_SCALE_EXT                  := 0x8573
  GL_ADD_SIGNED_EXT                 := 0x8574
  GL_INTERPOLATE_EXT                := 0x8575
  GL_CONSTANT_EXT                   := 0x8576
  GL_PRIMARY_COLOR_EXT              := 0x8577
  GL_PREVIOUS_EXT                   := 0x8578
  GL_SOURCE0_RGB_EXT                := 0x8580
  GL_SOURCE1_RGB_EXT                := 0x8581
  GL_SOURCE2_RGB_EXT                := 0x8582
  GL_SOURCE0_ALPHA_EXT              := 0x8588
  GL_SOURCE1_ALPHA_EXT              := 0x8589
  GL_SOURCE2_ALPHA_EXT              := 0x858A
  GL_OPERAND0_RGB_EXT               := 0x8590
  GL_OPERAND1_RGB_EXT               := 0x8591
  GL_OPERAND2_RGB_EXT               := 0x8592
  GL_OPERAND0_ALPHA_EXT             := 0x8598
  GL_OPERAND1_ALPHA_EXT             := 0x8599
  GL_OPERAND2_ALPHA_EXT             := 0x859A
}

if (!GL_APPLE_specular_vector)
{
  GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE := 0x85B0
}

if (!GL_APPLE_transform_hint)
{
  GL_TRANSFORM_HINT_APPLE           := 0x85B1
}

if (!GL_SGIX_fog_scale)
{
  GL_FOG_SCALE_SGIX                 := 0x81FC
  GL_FOG_SCALE_VALUE_SGIX           := 0x81FD
}

if (!GL_SUNX_constant_data)
{
  GL_UNPACK_CONSTANT_DATA_SUNX      := 0x81D5
  GL_TEXTURE_CONSTANT_DATA_SUNX     := 0x81D6
}

if (!GL_SUN_global_alpha)
{
  GL_GLOBAL_ALPHA_SUN               := 0x81D9
  GL_GLOBAL_ALPHA_FACTOR_SUN        := 0x81DA
}

if (!GL_SUN_triangle_list)
{
  GL_RESTART_SUN                    := 0x0001
  GL_REPLACE_MIDDLE_SUN             := 0x0002
  GL_REPLACE_OLDEST_SUN             := 0x0003
  GL_TRIANGLE_LIST_SUN              := 0x81D7
  GL_REPLACEMENT_CODE_SUN           := 0x81D8
  GL_REPLACEMENT_CODE_ARRAY_SUN     := 0x85C0
  GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN := 0x85C1
  GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN := 0x85C2
  GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN := 0x85C3
  GL_R1UI_V3F_SUN                   := 0x85C4
  GL_R1UI_C4UB_V3F_SUN              := 0x85C5
  GL_R1UI_C3F_V3F_SUN               := 0x85C6
  GL_R1UI_N3F_V3F_SUN               := 0x85C7
  GL_R1UI_C4F_N3F_V3F_SUN           := 0x85C8
  GL_R1UI_T2F_V3F_SUN               := 0x85C9
  GL_R1UI_T2F_N3F_V3F_SUN           := 0x85CA
  GL_R1UI_T2F_C4F_N3F_V3F_SUN       := 0x85CB
}

if (!GL_SUN_vertex)
{
}

if (!GL_EXT_blend_func_separate)
{
  GL_BLEND_DST_RGB_EXT              := 0x80C8
  GL_BLEND_SRC_RGB_EXT              := 0x80C9
  GL_BLEND_DST_ALPHA_EXT            := 0x80CA
  GL_BLEND_SRC_ALPHA_EXT            := 0x80CB
}

if (!GL_INGR_color_clamp)
{
  GL_RED_MIN_CLAMP_INGR             := 0x8560
  GL_GREEN_MIN_CLAMP_INGR           := 0x8561
  GL_BLUE_MIN_CLAMP_INGR            := 0x8562
  GL_ALPHA_MIN_CLAMP_INGR           := 0x8563
  GL_RED_MAX_CLAMP_INGR             := 0x8564
  GL_GREEN_MAX_CLAMP_INGR           := 0x8565
  GL_BLUE_MAX_CLAMP_INGR            := 0x8566
  GL_ALPHA_MAX_CLAMP_INGR           := 0x8567
}

if (!GL_INGR_interlace_read)
{
  GL_INTERLACE_READ_INGR            := 0x8568
}

if (!GL_EXT_stencil_wrap)
{
  GL_INCR_WRAP_EXT                  := 0x8507
  GL_DECR_WRAP_EXT                  := 0x8508
}

if (!GL_EXT_422_pixels)
{
  GL_422_EXT                        := 0x80CC
  GL_422_REV_EXT                    := 0x80CD
  GL_422_AVERAGE_EXT                := 0x80CE
  GL_422_REV_AVERAGE_EXT            := 0x80CF
}

if (!GL_NV_texgen_reflection)
{
  GL_NORMAL_MAP_NV                  := 0x8511
  GL_REFLECTION_MAP_NV              := 0x8512
}

if (!GL_EXT_texture_cube_map)
{
  GL_NORMAL_MAP_EXT                 := 0x8511
  GL_REFLECTION_MAP_EXT             := 0x8512
  GL_TEXTURE_CUBE_MAP_EXT           := 0x8513
  GL_TEXTURE_BINDING_CUBE_MAP_EXT   := 0x8514
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT := 0x8515
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT := 0x8516
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT := 0x8517
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT := 0x8518
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT := 0x8519
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT := 0x851A
  GL_PROXY_TEXTURE_CUBE_MAP_EXT     := 0x851B
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT  := 0x851C
}

if (!GL_SUN_convolution_border_modes)
{
  GL_WRAP_BORDER_SUN                := 0x81D4
}

if (!GL_EXT_texture_env_add)
{
}

if (!GL_EXT_texture_lod_bias)
{
  GL_MAX_TEXTURE_LOD_BIAS_EXT       := 0x84FD
  GL_TEXTURE_FILTER_CONTROL_EXT     := 0x8500
  GL_TEXTURE_LOD_BIAS_EXT           := 0x8501
}

if (!GL_EXT_texture_filter_anisotropic)
{
  GL_TEXTURE_MAX_ANISOTROPY_EXT     := 0x84FE
  GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT := 0x84FF
}

if (!GL_EXT_vertex_weighting)
{
  GL_MODELVIEW0_STACK_DEPTH_EXT     := GL_MODELVIEW_STACK_DEPTH
  GL_MODELVIEW1_STACK_DEPTH_EXT     := 0x8502
  GL_MODELVIEW0_MATRIX_EXT          := GL_MODELVIEW_MATRIX
  GL_MODELVIEW1_MATRIX_EXT          := 0x8506
  GL_VERTEX_WEIGHTING_EXT           := 0x8509
  GL_MODELVIEW0_EXT                 := GL_MODELVIEW
  GL_MODELVIEW1_EXT                 := 0x850A
  GL_CURRENT_VERTEX_WEIGHT_EXT      := 0x850B
  GL_VERTEX_WEIGHT_ARRAY_EXT        := 0x850C
  GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT   := 0x850D
  GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT   := 0x850E
  GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT := 0x850F
  GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT := 0x8510
}

if (!GL_NV_light_max_exponent)
{
  GL_MAX_SHININESS_NV               := 0x8504
  GL_MAX_SPOT_EXPONENT_NV           := 0x8505
}

if (!GL_NV_vertex_array_range)
{
  GL_VERTEX_ARRAY_RANGE_NV          := 0x851D
  GL_VERTEX_ARRAY_RANGE_LENGTH_NV   := 0x851E
  GL_VERTEX_ARRAY_RANGE_VALID_NV    := 0x851F
  GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV := 0x8520
  GL_VERTEX_ARRAY_RANGE_POINTER_NV  := 0x8521
}

if (!GL_NV_register_combiners)
{
  GL_REGISTER_COMBINERS_NV          := 0x8522
  GL_VARIABLE_A_NV                  := 0x8523
  GL_VARIABLE_B_NV                  := 0x8524
  GL_VARIABLE_C_NV                  := 0x8525
  GL_VARIABLE_D_NV                  := 0x8526
  GL_VARIABLE_E_NV                  := 0x8527
  GL_VARIABLE_F_NV                  := 0x8528
  GL_VARIABLE_G_NV                  := 0x8529
  GL_CONSTANT_COLOR0_NV             := 0x852A
  GL_CONSTANT_COLOR1_NV             := 0x852B
  GL_PRIMARY_COLOR_NV               := 0x852C
  GL_SECONDARY_COLOR_NV             := 0x852D
  GL_SPARE0_NV                      := 0x852E
  GL_SPARE1_NV                      := 0x852F
  GL_DISCARD_NV                     := 0x8530
  GL_E_TIMES_F_NV                   := 0x8531
  GL_SPARE0_PLUS_SECONDARY_COLOR_NV := 0x8532
  GL_UNSIGNED_IDENTITY_NV           := 0x8536
  GL_UNSIGNED_INVERT_NV             := 0x8537
  GL_EXPAND_NORMAL_NV               := 0x8538
  GL_EXPAND_NEGATE_NV               := 0x8539
  GL_HALF_BIAS_NORMAL_NV            := 0x853A
  GL_HALF_BIAS_NEGATE_NV            := 0x853B
  GL_SIGNED_IDENTITY_NV             := 0x853C
  GL_SIGNED_NEGATE_NV               := 0x853D
  GL_SCALE_BY_TWO_NV                := 0x853E
  GL_SCALE_BY_FOUR_NV               := 0x853F
  GL_SCALE_BY_ONE_HALF_NV           := 0x8540
  GL_BIAS_BY_NEGATIVE_ONE_HALF_NV   := 0x8541
  GL_COMBINER_INPUT_NV              := 0x8542
  GL_COMBINER_MAPPING_NV            := 0x8543
  GL_COMBINER_COMPONENT_USAGE_NV    := 0x8544
  GL_COMBINER_AB_DOT_PRODUCT_NV     := 0x8545
  GL_COMBINER_CD_DOT_PRODUCT_NV     := 0x8546
  GL_COMBINER_MUX_SUM_NV            := 0x8547
  GL_COMBINER_SCALE_NV              := 0x8548
  GL_COMBINER_BIAS_NV               := 0x8549
  GL_COMBINER_AB_OUTPUT_NV          := 0x854A
  GL_COMBINER_CD_OUTPUT_NV          := 0x854B
  GL_COMBINER_SUM_OUTPUT_NV         := 0x854C
  GL_MAX_GENERAL_COMBINERS_NV       := 0x854D
  GL_NUM_GENERAL_COMBINERS_NV       := 0x854E
  GL_COLOR_SUM_CLAMP_NV             := 0x854F
  GL_COMBINER0_NV                   := 0x8550
  GL_COMBINER1_NV                   := 0x8551
  GL_COMBINER2_NV                   := 0x8552
  GL_COMBINER3_NV                   := 0x8553
  GL_COMBINER4_NV                   := 0x8554
  GL_COMBINER5_NV                   := 0x8555
  GL_COMBINER6_NV                   := 0x8556
  GL_COMBINER7_NV                   := 0x8557
  ;reuse GL_TEXTURE0_ARB
  ;reuse GL_TEXTURE1_ARB
  ;reuse GL_ZERO
  ;reuse GL_NONE
  ;reuse GL_FOG
}

if (!GL_NV_fog_distance)
{
  GL_FOG_DISTANCE_MODE_NV           := 0x855A
  GL_EYE_RADIAL_NV                  := 0x855B
  GL_EYE_PLANE_ABSOLUTE_NV          := 0x855C
  ;reuse GL_EYE_PLANE
}

if (!GL_NV_texgen_emboss)
{
  GL_EMBOSS_LIGHT_NV                := 0x855D
  GL_EMBOSS_CONSTANT_NV             := 0x855E
  GL_EMBOSS_MAP_NV                  := 0x855F
}

if (!GL_NV_blend_square)
{
}

if (!GL_NV_texture_env_combine4)
{
  GL_COMBINE4_NV                    := 0x8503
  GL_SOURCE3_RGB_NV                 := 0x8583
  GL_SOURCE3_ALPHA_NV               := 0x858B
  GL_OPERAND3_RGB_NV                := 0x8593
  GL_OPERAND3_ALPHA_NV              := 0x859B
}

if (!GL_MESA_resize_buffers)
{
}

if (!GL_MESA_window_pos)
{
}

if (!GL_EXT_texture_compression_s3tc)
{
  GL_COMPRESSED_RGB_S3TC_DXT1_EXT   := 0x83F0
  GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  := 0x83F1
  GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  := 0x83F2
  GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  := 0x83F3
}

if (!GL_IBM_cull_vertex)
{
  GL_CULL_VERTEX_IBM                := 103050
}

if (!GL_IBM_multimode_draw_arrays)
{
}

if (!GL_IBM_vertex_array_lists)
{
  GL_VERTEX_ARRAY_LIST_IBM          := 103070
  GL_NORMAL_ARRAY_LIST_IBM          := 103071
  GL_COLOR_ARRAY_LIST_IBM           := 103072
  GL_INDEX_ARRAY_LIST_IBM           := 103073
  GL_TEXTURE_COORD_ARRAY_LIST_IBM   := 103074
  GL_EDGE_FLAG_ARRAY_LIST_IBM       := 103075
  GL_FOG_COORDINATE_ARRAY_LIST_IBM  := 103076
  GL_SECONDARY_COLOR_ARRAY_LIST_IBM := 103077
  GL_VERTEX_ARRAY_LIST_STRIDE_IBM   := 103080
  GL_NORMAL_ARRAY_LIST_STRIDE_IBM   := 103081
  GL_COLOR_ARRAY_LIST_STRIDE_IBM    := 103082
  GL_INDEX_ARRAY_LIST_STRIDE_IBM    := 103083
  GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM := 103084
  GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM := 103085
  GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM := 103086
  GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM := 103087
}

if (!GL_SGIX_subsample)
{
  GL_PACK_SUBSAMPLE_RATE_SGIX       := 0x85A0
  GL_UNPACK_SUBSAMPLE_RATE_SGIX     := 0x85A1
  GL_PIXEL_SUBSAMPLE_4444_SGIX      := 0x85A2
  GL_PIXEL_SUBSAMPLE_2424_SGIX      := 0x85A3
  GL_PIXEL_SUBSAMPLE_4242_SGIX      := 0x85A4
}

if (!GL_SGIX_ycrcb_subsample)
{
}

if (!GL_SGIX_ycrcba)
{
  GL_YCRCB_SGIX                     := 0x8318
  GL_YCRCBA_SGIX                    := 0x8319
}

if (!GL_SGI_depth_pass_instrument)
{
  GL_DEPTH_PASS_INSTRUMENT_SGIX     := 0x8310
  GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX := 0x8311
  GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX := 0x8312
}

if (!GL_3DFX_texture_compression_FXT1)
{
  GL_COMPRESSED_RGB_FXT1_3DFX       := 0x86B0
  GL_COMPRESSED_RGBA_FXT1_3DFX      := 0x86B1
}

if (!GL_3DFX_multisample)
{
  GL_MULTISAMPLE_3DFX               := 0x86B2
  GL_SAMPLE_BUFFERS_3DFX            := 0x86B3
  GL_SAMPLES_3DFX                   := 0x86B4
  GL_MULTISAMPLE_BIT_3DFX           := 0x20000000
}

if (!GL_3DFX_tbuffer)
{
}

if (!GL_EXT_multisample)
{
  GL_MULTISAMPLE_EXT                := 0x809D
  GL_SAMPLE_ALPHA_TO_MASK_EXT       := 0x809E
  GL_SAMPLE_ALPHA_TO_ONE_EXT        := 0x809F
  GL_SAMPLE_MASK_EXT                := 0x80A0
  GL_1PASS_EXT                      := 0x80A1
  GL_2PASS_0_EXT                    := 0x80A2
  GL_2PASS_1_EXT                    := 0x80A3
  GL_4PASS_0_EXT                    := 0x80A4
  GL_4PASS_1_EXT                    := 0x80A5
  GL_4PASS_2_EXT                    := 0x80A6
  GL_4PASS_3_EXT                    := 0x80A7
  GL_SAMPLE_BUFFERS_EXT             := 0x80A8
  GL_SAMPLES_EXT                    := 0x80A9
  GL_SAMPLE_MASK_VALUE_EXT          := 0x80AA
  GL_SAMPLE_MASK_INVERT_EXT         := 0x80AB
  GL_SAMPLE_PATTERN_EXT             := 0x80AC
  GL_MULTISAMPLE_BIT_EXT            := 0x20000000
}

if (!GL_SGIX_vertex_preclip)
{
  GL_VERTEX_PRECLIP_SGIX            := 0x83EE
  GL_VERTEX_PRECLIP_HINT_SGIX       := 0x83EF
}

if (!GL_SGIX_convolution_accuracy)
{
  GL_CONVOLUTION_HINT_SGIX          := 0x8316
}

if (!GL_SGIX_resample)
{
  GL_PACK_RESAMPLE_SGIX             := 0x842C
  GL_UNPACK_RESAMPLE_SGIX           := 0x842D
  GL_RESAMPLE_REPLICATE_SGIX        := 0x842E
  GL_RESAMPLE_ZERO_FILL_SGIX        := 0x842F
  GL_RESAMPLE_DECIMATE_SGIX         := 0x8430
}

if (!GL_SGIS_point_line_texgen)
{
  GL_EYE_DISTANCE_TO_POINT_SGIS     := 0x81F0
  GL_OBJECT_DISTANCE_TO_POINT_SGIS  := 0x81F1
  GL_EYE_DISTANCE_TO_LINE_SGIS      := 0x81F2
  GL_OBJECT_DISTANCE_TO_LINE_SGIS   := 0x81F3
  GL_EYE_POINT_SGIS                 := 0x81F4
  GL_OBJECT_POINT_SGIS              := 0x81F5
  GL_EYE_LINE_SGIS                  := 0x81F6
  GL_OBJECT_LINE_SGIS               := 0x81F7
}

if (!GL_SGIS_texture_color_mask)
{
  GL_TEXTURE_COLOR_WRITEMASK_SGIS   := 0x81EF
}

if (!GL_EXT_texture_env_dot3)
{
  GL_DOT3_RGB_EXT                   := 0x8740
  GL_DOT3_RGBA_EXT                  := 0x8741
}

if (!GL_ATI_texture_mirror_once)
{
  GL_MIRROR_CLAMP_ATI               := 0x8742
  GL_MIRROR_CLAMP_TO_EDGE_ATI       := 0x8743
}

if (!GL_NV_fence)
{
  GL_ALL_COMPLETED_NV               := 0x84F2
  GL_FENCE_STATUS_NV                := 0x84F3
  GL_FENCE_CONDITION_NV             := 0x84F4
}

if (!GL_IBM_texture_mirrored_repeat)
{
  GL_MIRRORED_REPEAT_IBM            := 0x8370
}

if (!GL_NV_evaluators)
{
  GL_EVAL_2D_NV                     := 0x86C0
  GL_EVAL_TRIANGULAR_2D_NV          := 0x86C1
  GL_MAP_TESSELLATION_NV            := 0x86C2
  GL_MAP_ATTRIB_U_ORDER_NV          := 0x86C3
  GL_MAP_ATTRIB_V_ORDER_NV          := 0x86C4
  GL_EVAL_FRACTIONAL_TESSELLATION_NV := 0x86C5
  GL_EVAL_VERTEX_ATTRIB0_NV         := 0x86C6
  GL_EVAL_VERTEX_ATTRIB1_NV         := 0x86C7
  GL_EVAL_VERTEX_ATTRIB2_NV         := 0x86C8
  GL_EVAL_VERTEX_ATTRIB3_NV         := 0x86C9
  GL_EVAL_VERTEX_ATTRIB4_NV         := 0x86CA
  GL_EVAL_VERTEX_ATTRIB5_NV         := 0x86CB
  GL_EVAL_VERTEX_ATTRIB6_NV         := 0x86CC
  GL_EVAL_VERTEX_ATTRIB7_NV         := 0x86CD
  GL_EVAL_VERTEX_ATTRIB8_NV         := 0x86CE
  GL_EVAL_VERTEX_ATTRIB9_NV         := 0x86CF
  GL_EVAL_VERTEX_ATTRIB10_NV        := 0x86D0
  GL_EVAL_VERTEX_ATTRIB11_NV        := 0x86D1
  GL_EVAL_VERTEX_ATTRIB12_NV        := 0x86D2
  GL_EVAL_VERTEX_ATTRIB13_NV        := 0x86D3
  GL_EVAL_VERTEX_ATTRIB14_NV        := 0x86D4
  GL_EVAL_VERTEX_ATTRIB15_NV        := 0x86D5
  GL_MAX_MAP_TESSELLATION_NV        := 0x86D6
  GL_MAX_RATIONAL_EVAL_ORDER_NV     := 0x86D7
}

if (!GL_NV_packed_depth_stencil)
{
  GL_DEPTH_STENCIL_NV               := 0x84F9
  GL_UNSIGNED_INT_24_8_NV           := 0x84FA
}

if (!GL_NV_register_combiners2)
{
  GL_PER_STAGE_CONSTANTS_NV         := 0x8535
}

if (!GL_NV_texture_compression_vtc)
{
}

if (!GL_NV_texture_rectangle)
{
  GL_TEXTURE_RECTANGLE_NV           := 0x84F5
  GL_TEXTURE_BINDING_RECTANGLE_NV   := 0x84F6
  GL_PROXY_TEXTURE_RECTANGLE_NV     := 0x84F7
  GL_MAX_RECTANGLE_TEXTURE_SIZE_NV  := 0x84F8
}

if (!GL_NV_texture_shader)
{
  GL_OFFSET_TEXTURE_RECTANGLE_NV    := 0x864C
  GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV := 0x864D
  GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV := 0x864E
  GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV := 0x86D9
  GL_UNSIGNED_INT_S8_S8_8_8_NV      := 0x86DA
  GL_UNSIGNED_INT_8_8_S8_S8_REV_NV  := 0x86DB
  GL_DSDT_MAG_INTENSITY_NV          := 0x86DC
  GL_SHADER_CONSISTENT_NV           := 0x86DD
  GL_TEXTURE_SHADER_NV              := 0x86DE
  GL_SHADER_OPERATION_NV            := 0x86DF
  GL_CULL_MODES_NV                  := 0x86E0
  GL_OFFSET_TEXTURE_MATRIX_NV       := 0x86E1
  GL_OFFSET_TEXTURE_SCALE_NV        := 0x86E2
  GL_OFFSET_TEXTURE_BIAS_NV         := 0x86E3
  GL_OFFSET_TEXTURE_2D_MATRIX_NV    := GL_OFFSET_TEXTURE_MATRIX_NV
  GL_OFFSET_TEXTURE_2D_SCALE_NV     := GL_OFFSET_TEXTURE_SCALE_NV
  GL_OFFSET_TEXTURE_2D_BIAS_NV      := GL_OFFSET_TEXTURE_BIAS_NV
  GL_PREVIOUS_TEXTURE_INPUT_NV      := 0x86E4
  GL_CONST_EYE_NV                   := 0x86E5
  GL_PASS_THROUGH_NV                := 0x86E6
  GL_CULL_FRAGMENT_NV               := 0x86E7
  GL_OFFSET_TEXTURE_2D_NV           := 0x86E8
  GL_DEPENDENT_AR_TEXTURE_2D_NV     := 0x86E9
  GL_DEPENDENT_GB_TEXTURE_2D_NV     := 0x86EA
  GL_DOT_PRODUCT_NV                 := 0x86EC
  GL_DOT_PRODUCT_DEPTH_REPLACE_NV   := 0x86ED
  GL_DOT_PRODUCT_TEXTURE_2D_NV      := 0x86EE
  GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV := 0x86F0
  GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV := 0x86F1
  GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV := 0x86F2
  GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV := 0x86F3
  GL_HILO_NV                        := 0x86F4
  GL_DSDT_NV                        := 0x86F5
  GL_DSDT_MAG_NV                    := 0x86F6
  GL_DSDT_MAG_VIB_NV                := 0x86F7
  GL_HILO16_NV                      := 0x86F8
  GL_SIGNED_HILO_NV                 := 0x86F9
  GL_SIGNED_HILO16_NV               := 0x86FA
  GL_SIGNED_RGBA_NV                 := 0x86FB
  GL_SIGNED_RGBA8_NV                := 0x86FC
  GL_SIGNED_RGB_NV                  := 0x86FE
  GL_SIGNED_RGB8_NV                 := 0x86FF
  GL_SIGNED_LUMINANCE_NV            := 0x8701
  GL_SIGNED_LUMINANCE8_NV           := 0x8702
  GL_SIGNED_LUMINANCE_ALPHA_NV      := 0x8703
  GL_SIGNED_LUMINANCE8_ALPHA8_NV    := 0x8704
  GL_SIGNED_ALPHA_NV                := 0x8705
  GL_SIGNED_ALPHA8_NV               := 0x8706
  GL_SIGNED_INTENSITY_NV            := 0x8707
  GL_SIGNED_INTENSITY8_NV           := 0x8708
  GL_DSDT8_NV                       := 0x8709
  GL_DSDT8_MAG8_NV                  := 0x870A
  GL_DSDT8_MAG8_INTENSITY8_NV       := 0x870B
  GL_SIGNED_RGB_UNSIGNED_ALPHA_NV   := 0x870C
  GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV := 0x870D
  GL_HI_SCALE_NV                    := 0x870E
  GL_LO_SCALE_NV                    := 0x870F
  GL_DS_SCALE_NV                    := 0x8710
  GL_DT_SCALE_NV                    := 0x8711
  GL_MAGNITUDE_SCALE_NV             := 0x8712
  GL_VIBRANCE_SCALE_NV              := 0x8713
  GL_HI_BIAS_NV                     := 0x8714
  GL_LO_BIAS_NV                     := 0x8715
  GL_DS_BIAS_NV                     := 0x8716
  GL_DT_BIAS_NV                     := 0x8717
  GL_MAGNITUDE_BIAS_NV              := 0x8718
  GL_VIBRANCE_BIAS_NV               := 0x8719
  GL_TEXTURE_BORDER_VALUES_NV       := 0x871A
  GL_TEXTURE_HI_SIZE_NV             := 0x871B
  GL_TEXTURE_LO_SIZE_NV             := 0x871C
  GL_TEXTURE_DS_SIZE_NV             := 0x871D
  GL_TEXTURE_DT_SIZE_NV             := 0x871E
  GL_TEXTURE_MAG_SIZE_NV            := 0x871F
}

if (!GL_NV_texture_shader2)
{
  GL_DOT_PRODUCT_TEXTURE_3D_NV      := 0x86EF
}

if (!GL_NV_vertex_array_range2)
{
  GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV := 0x8533
}

if (!GL_NV_vertex_program)
{
  GL_VERTEX_PROGRAM_NV              := 0x8620
  GL_VERTEX_STATE_PROGRAM_NV        := 0x8621
  GL_ATTRIB_ARRAY_SIZE_NV           := 0x8623
  GL_ATTRIB_ARRAY_STRIDE_NV         := 0x8624
  GL_ATTRIB_ARRAY_TYPE_NV           := 0x8625
  GL_CURRENT_ATTRIB_NV              := 0x8626
  GL_PROGRAM_LENGTH_NV              := 0x8627
  GL_PROGRAM_STRING_NV              := 0x8628
  GL_MODELVIEW_PROJECTION_NV        := 0x8629
  GL_IDENTITY_NV                    := 0x862A
  GL_INVERSE_NV                     := 0x862B
  GL_TRANSPOSE_NV                   := 0x862C
  GL_INVERSE_TRANSPOSE_NV           := 0x862D
  GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV := 0x862E
  GL_MAX_TRACK_MATRICES_NV          := 0x862F
  GL_MATRIX0_NV                     := 0x8630
  GL_MATRIX1_NV                     := 0x8631
  GL_MATRIX2_NV                     := 0x8632
  GL_MATRIX3_NV                     := 0x8633
  GL_MATRIX4_NV                     := 0x8634
  GL_MATRIX5_NV                     := 0x8635
  GL_MATRIX6_NV                     := 0x8636
  GL_MATRIX7_NV                     := 0x8637
  GL_CURRENT_MATRIX_STACK_DEPTH_NV  := 0x8640
  GL_CURRENT_MATRIX_NV              := 0x8641
  GL_VERTEX_PROGRAM_POINT_SIZE_NV   := 0x8642
  GL_VERTEX_PROGRAM_TWO_SIDE_NV     := 0x8643
  GL_PROGRAM_PARAMETER_NV           := 0x8644
  GL_ATTRIB_ARRAY_POINTER_NV        := 0x8645
  GL_PROGRAM_TARGET_NV              := 0x8646
  GL_PROGRAM_RESIDENT_NV            := 0x8647
  GL_TRACK_MATRIX_NV                := 0x8648
  GL_TRACK_MATRIX_TRANSFORM_NV      := 0x8649
  GL_VERTEX_PROGRAM_BINDING_NV      := 0x864A
  GL_PROGRAM_ERROR_POSITION_NV      := 0x864B
  GL_VERTEX_ATTRIB_ARRAY0_NV        := 0x8650
  GL_VERTEX_ATTRIB_ARRAY1_NV        := 0x8651
  GL_VERTEX_ATTRIB_ARRAY2_NV        := 0x8652
  GL_VERTEX_ATTRIB_ARRAY3_NV        := 0x8653
  GL_VERTEX_ATTRIB_ARRAY4_NV        := 0x8654
  GL_VERTEX_ATTRIB_ARRAY5_NV        := 0x8655
  GL_VERTEX_ATTRIB_ARRAY6_NV        := 0x8656
  GL_VERTEX_ATTRIB_ARRAY7_NV        := 0x8657
  GL_VERTEX_ATTRIB_ARRAY8_NV        := 0x8658
  GL_VERTEX_ATTRIB_ARRAY9_NV        := 0x8659
  GL_VERTEX_ATTRIB_ARRAY10_NV       := 0x865A
  GL_VERTEX_ATTRIB_ARRAY11_NV       := 0x865B
  GL_VERTEX_ATTRIB_ARRAY12_NV       := 0x865C
  GL_VERTEX_ATTRIB_ARRAY13_NV       := 0x865D
  GL_VERTEX_ATTRIB_ARRAY14_NV       := 0x865E
  GL_VERTEX_ATTRIB_ARRAY15_NV       := 0x865F
  GL_MAP1_VERTEX_ATTRIB0_4_NV       := 0x8660
  GL_MAP1_VERTEX_ATTRIB1_4_NV       := 0x8661
  GL_MAP1_VERTEX_ATTRIB2_4_NV       := 0x8662
  GL_MAP1_VERTEX_ATTRIB3_4_NV       := 0x8663
  GL_MAP1_VERTEX_ATTRIB4_4_NV       := 0x8664
  GL_MAP1_VERTEX_ATTRIB5_4_NV       := 0x8665
  GL_MAP1_VERTEX_ATTRIB6_4_NV       := 0x8666
  GL_MAP1_VERTEX_ATTRIB7_4_NV       := 0x8667
  GL_MAP1_VERTEX_ATTRIB8_4_NV       := 0x8668
  GL_MAP1_VERTEX_ATTRIB9_4_NV       := 0x8669
  GL_MAP1_VERTEX_ATTRIB10_4_NV      := 0x866A
  GL_MAP1_VERTEX_ATTRIB11_4_NV      := 0x866B
  GL_MAP1_VERTEX_ATTRIB12_4_NV      := 0x866C
  GL_MAP1_VERTEX_ATTRIB13_4_NV      := 0x866D
  GL_MAP1_VERTEX_ATTRIB14_4_NV      := 0x866E
  GL_MAP1_VERTEX_ATTRIB15_4_NV      := 0x866F
  GL_MAP2_VERTEX_ATTRIB0_4_NV       := 0x8670
  GL_MAP2_VERTEX_ATTRIB1_4_NV       := 0x8671
  GL_MAP2_VERTEX_ATTRIB2_4_NV       := 0x8672
  GL_MAP2_VERTEX_ATTRIB3_4_NV       := 0x8673
  GL_MAP2_VERTEX_ATTRIB4_4_NV       := 0x8674
  GL_MAP2_VERTEX_ATTRIB5_4_NV       := 0x8675
  GL_MAP2_VERTEX_ATTRIB6_4_NV       := 0x8676
  GL_MAP2_VERTEX_ATTRIB7_4_NV       := 0x8677
  GL_MAP2_VERTEX_ATTRIB8_4_NV       := 0x8678
  GL_MAP2_VERTEX_ATTRIB9_4_NV       := 0x8679
  GL_MAP2_VERTEX_ATTRIB10_4_NV      := 0x867A
  GL_MAP2_VERTEX_ATTRIB11_4_NV      := 0x867B
  GL_MAP2_VERTEX_ATTRIB12_4_NV      := 0x867C
  GL_MAP2_VERTEX_ATTRIB13_4_NV      := 0x867D
  GL_MAP2_VERTEX_ATTRIB14_4_NV      := 0x867E
  GL_MAP2_VERTEX_ATTRIB15_4_NV      := 0x867F
}

if (!GL_SGIX_texture_coordinate_clamp)
{
  GL_TEXTURE_MAX_CLAMP_S_SGIX       := 0x8369
  GL_TEXTURE_MAX_CLAMP_T_SGIX       := 0x836A
  GL_TEXTURE_MAX_CLAMP_R_SGIX       := 0x836B
}

if (!GL_SGIX_scalebias_hint)
{
  GL_SCALEBIAS_HINT_SGIX            := 0x8322
}

if (!GL_OML_interlace)
{
  GL_INTERLACE_OML                  := 0x8980
  GL_INTERLACE_READ_OML             := 0x8981
}

if (!GL_OML_subsample)
{
  GL_FORMAT_SUBSAMPLE_24_24_OML     := 0x8982
  GL_FORMAT_SUBSAMPLE_244_244_OML   := 0x8983
}

if (!GL_OML_resample)
{
  GL_PACK_RESAMPLE_OML              := 0x8984
  GL_UNPACK_RESAMPLE_OML            := 0x8985
  GL_RESAMPLE_REPLICATE_OML         := 0x8986
  GL_RESAMPLE_ZERO_FILL_OML         := 0x8987
  GL_RESAMPLE_AVERAGE_OML           := 0x8988
  GL_RESAMPLE_DECIMATE_OML          := 0x8989
}

if (!GL_NV_copy_depth_to_color)
{
  GL_DEPTH_STENCIL_TO_RGBA_NV       := 0x886E
  GL_DEPTH_STENCIL_TO_BGRA_NV       := 0x886F
}

if (!GL_ATI_envmap_bumpmap)
{
  GL_BUMP_ROT_MATRIX_ATI            := 0x8775
  GL_BUMP_ROT_MATRIX_SIZE_ATI       := 0x8776
  GL_BUMP_NUM_TEX_UNITS_ATI         := 0x8777
  GL_BUMP_TEX_UNITS_ATI             := 0x8778
  GL_DUDV_ATI                       := 0x8779
  GL_DU8DV8_ATI                     := 0x877A
  GL_BUMP_ENVMAP_ATI                := 0x877B
  GL_BUMP_TARGET_ATI                := 0x877C
}

if (!GL_ATI_fragment_shader)
{
  GL_FRAGMENT_SHADER_ATI            := 0x8920
  GL_REG_0_ATI                      := 0x8921
  GL_REG_1_ATI                      := 0x8922
  GL_REG_2_ATI                      := 0x8923
  GL_REG_3_ATI                      := 0x8924
  GL_REG_4_ATI                      := 0x8925
  GL_REG_5_ATI                      := 0x8926
  GL_REG_6_ATI                      := 0x8927
  GL_REG_7_ATI                      := 0x8928
  GL_REG_8_ATI                      := 0x8929
  GL_REG_9_ATI                      := 0x892A
  GL_REG_10_ATI                     := 0x892B
  GL_REG_11_ATI                     := 0x892C
  GL_REG_12_ATI                     := 0x892D
  GL_REG_13_ATI                     := 0x892E
  GL_REG_14_ATI                     := 0x892F
  GL_REG_15_ATI                     := 0x8930
  GL_REG_16_ATI                     := 0x8931
  GL_REG_17_ATI                     := 0x8932
  GL_REG_18_ATI                     := 0x8933
  GL_REG_19_ATI                     := 0x8934
  GL_REG_20_ATI                     := 0x8935
  GL_REG_21_ATI                     := 0x8936
  GL_REG_22_ATI                     := 0x8937
  GL_REG_23_ATI                     := 0x8938
  GL_REG_24_ATI                     := 0x8939
  GL_REG_25_ATI                     := 0x893A
  GL_REG_26_ATI                     := 0x893B
  GL_REG_27_ATI                     := 0x893C
  GL_REG_28_ATI                     := 0x893D
  GL_REG_29_ATI                     := 0x893E
  GL_REG_30_ATI                     := 0x893F
  GL_REG_31_ATI                     := 0x8940
  GL_CON_0_ATI                      := 0x8941
  GL_CON_1_ATI                      := 0x8942
  GL_CON_2_ATI                      := 0x8943
  GL_CON_3_ATI                      := 0x8944
  GL_CON_4_ATI                      := 0x8945
  GL_CON_5_ATI                      := 0x8946
  GL_CON_6_ATI                      := 0x8947
  GL_CON_7_ATI                      := 0x8948
  GL_CON_8_ATI                      := 0x8949
  GL_CON_9_ATI                      := 0x894A
  GL_CON_10_ATI                     := 0x894B
  GL_CON_11_ATI                     := 0x894C
  GL_CON_12_ATI                     := 0x894D
  GL_CON_13_ATI                     := 0x894E
  GL_CON_14_ATI                     := 0x894F
  GL_CON_15_ATI                     := 0x8950
  GL_CON_16_ATI                     := 0x8951
  GL_CON_17_ATI                     := 0x8952
  GL_CON_18_ATI                     := 0x8953
  GL_CON_19_ATI                     := 0x8954
  GL_CON_20_ATI                     := 0x8955
  GL_CON_21_ATI                     := 0x8956
  GL_CON_22_ATI                     := 0x8957
  GL_CON_23_ATI                     := 0x8958
  GL_CON_24_ATI                     := 0x8959
  GL_CON_25_ATI                     := 0x895A
  GL_CON_26_ATI                     := 0x895B
  GL_CON_27_ATI                     := 0x895C
  GL_CON_28_ATI                     := 0x895D
  GL_CON_29_ATI                     := 0x895E
  GL_CON_30_ATI                     := 0x895F
  GL_CON_31_ATI                     := 0x8960
  GL_MOV_ATI                        := 0x8961
  GL_ADD_ATI                        := 0x8963
  GL_MUL_ATI                        := 0x8964
  GL_SUB_ATI                        := 0x8965
  GL_DOT3_ATI                       := 0x8966
  GL_DOT4_ATI                       := 0x8967
  GL_MAD_ATI                        := 0x8968
  GL_LERP_ATI                       := 0x8969
  GL_CND_ATI                        := 0x896A
  GL_CND0_ATI                       := 0x896B
  GL_DOT2_ADD_ATI                   := 0x896C
  GL_SECONDARY_INTERPOLATOR_ATI     := 0x896D
  GL_NUM_FRAGMENT_REGISTERS_ATI     := 0x896E
  GL_NUM_FRAGMENT_CONSTANTS_ATI     := 0x896F
  GL_NUM_PASSES_ATI                 := 0x8970
  GL_NUM_INSTRUCTIONS_PER_PASS_ATI  := 0x8971
  GL_NUM_INSTRUCTIONS_TOTAL_ATI     := 0x8972
  GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI := 0x8973
  GL_NUM_LOOPBACK_COMPONENTS_ATI    := 0x8974
  GL_COLOR_ALPHA_PAIRING_ATI        := 0x8975
  GL_SWIZZLE_STR_ATI                := 0x8976
  GL_SWIZZLE_STQ_ATI                := 0x8977
  GL_SWIZZLE_STR_DR_ATI             := 0x8978
  GL_SWIZZLE_STQ_DQ_ATI             := 0x8979
  GL_SWIZZLE_STRQ_ATI               := 0x897A
  GL_SWIZZLE_STRQ_DQ_ATI            := 0x897B
  GL_RED_BIT_ATI                    := 0x00000001
  GL_GREEN_BIT_ATI                  := 0x00000002
  GL_BLUE_BIT_ATI                   := 0x00000004
  GL_2X_BIT_ATI                     := 0x00000001
  GL_4X_BIT_ATI                     := 0x00000002
  GL_8X_BIT_ATI                     := 0x00000004
  GL_HALF_BIT_ATI                   := 0x00000008
  GL_QUARTER_BIT_ATI                := 0x00000010
  GL_EIGHTH_BIT_ATI                 := 0x00000020
  GL_SATURATE_BIT_ATI               := 0x00000040
  GL_COMP_BIT_ATI                   := 0x00000002
  GL_NEGATE_BIT_ATI                 := 0x00000004
  GL_BIAS_BIT_ATI                   := 0x00000008
}

if (!GL_ATI_pn_triangles)
{
  GL_PN_TRIANGLES_ATI               := 0x87F0
  GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI := 0x87F1
  GL_PN_TRIANGLES_POINT_MODE_ATI    := 0x87F2
  GL_PN_TRIANGLES_NORMAL_MODE_ATI   := 0x87F3
  GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI := 0x87F4
  GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI := 0x87F5
  GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI := 0x87F6
  GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI := 0x87F7
  GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI := 0x87F8
}

if (!GL_ATI_vertex_array_object)
{
  GL_STATIC_ATI                     := 0x8760
  GL_DYNAMIC_ATI                    := 0x8761
  GL_PRESERVE_ATI                   := 0x8762
  GL_DISCARD_ATI                    := 0x8763
  GL_OBJECT_BUFFER_SIZE_ATI         := 0x8764
  GL_OBJECT_BUFFER_USAGE_ATI        := 0x8765
  GL_ARRAY_OBJECT_BUFFER_ATI        := 0x8766
  GL_ARRAY_OBJECT_OFFSET_ATI        := 0x8767
}

if (!GL_EXT_vertex_shader)
{
  GL_VERTEX_SHADER_EXT              := 0x8780
  GL_VERTEX_SHADER_BINDING_EXT      := 0x8781
  GL_OP_INDEX_EXT                   := 0x8782
  GL_OP_NEGATE_EXT                  := 0x8783
  GL_OP_DOT3_EXT                    := 0x8784
  GL_OP_DOT4_EXT                    := 0x8785
  GL_OP_MUL_EXT                     := 0x8786
  GL_OP_ADD_EXT                     := 0x8787
  GL_OP_MADD_EXT                    := 0x8788
  GL_OP_FRAC_EXT                    := 0x8789
  GL_OP_MAX_EXT                     := 0x878A
  GL_OP_MIN_EXT                     := 0x878B
  GL_OP_SET_GE_EXT                  := 0x878C
  GL_OP_SET_LT_EXT                  := 0x878D
  GL_OP_CLAMP_EXT                   := 0x878E
  GL_OP_FLOOR_EXT                   := 0x878F
  GL_OP_ROUND_EXT                   := 0x8790
  GL_OP_EXP_BASE_2_EXT              := 0x8791
  GL_OP_LOG_BASE_2_EXT              := 0x8792
  GL_OP_POWER_EXT                   := 0x8793
  GL_OP_RECIP_EXT                   := 0x8794
  GL_OP_RECIP_SQRT_EXT              := 0x8795
  GL_OP_SUB_EXT                     := 0x8796
  GL_OP_CROSS_PRODUCT_EXT           := 0x8797
  GL_OP_MULTIPLY_MATRIX_EXT         := 0x8798
  GL_OP_MOV_EXT                     := 0x8799
  GL_OUTPUT_VERTEX_EXT              := 0x879A
  GL_OUTPUT_COLOR0_EXT              := 0x879B
  GL_OUTPUT_COLOR1_EXT              := 0x879C
  GL_OUTPUT_TEXTURE_COORD0_EXT      := 0x879D
  GL_OUTPUT_TEXTURE_COORD1_EXT      := 0x879E
  GL_OUTPUT_TEXTURE_COORD2_EXT      := 0x879F
  GL_OUTPUT_TEXTURE_COORD3_EXT      := 0x87A0
  GL_OUTPUT_TEXTURE_COORD4_EXT      := 0x87A1
  GL_OUTPUT_TEXTURE_COORD5_EXT      := 0x87A2
  GL_OUTPUT_TEXTURE_COORD6_EXT      := 0x87A3
  GL_OUTPUT_TEXTURE_COORD7_EXT      := 0x87A4
  GL_OUTPUT_TEXTURE_COORD8_EXT      := 0x87A5
  GL_OUTPUT_TEXTURE_COORD9_EXT      := 0x87A6
  GL_OUTPUT_TEXTURE_COORD10_EXT     := 0x87A7
  GL_OUTPUT_TEXTURE_COORD11_EXT     := 0x87A8
  GL_OUTPUT_TEXTURE_COORD12_EXT     := 0x87A9
  GL_OUTPUT_TEXTURE_COORD13_EXT     := 0x87AA
  GL_OUTPUT_TEXTURE_COORD14_EXT     := 0x87AB
  GL_OUTPUT_TEXTURE_COORD15_EXT     := 0x87AC
  GL_OUTPUT_TEXTURE_COORD16_EXT     := 0x87AD
  GL_OUTPUT_TEXTURE_COORD17_EXT     := 0x87AE
  GL_OUTPUT_TEXTURE_COORD18_EXT     := 0x87AF
  GL_OUTPUT_TEXTURE_COORD19_EXT     := 0x87B0
  GL_OUTPUT_TEXTURE_COORD20_EXT     := 0x87B1
  GL_OUTPUT_TEXTURE_COORD21_EXT     := 0x87B2
  GL_OUTPUT_TEXTURE_COORD22_EXT     := 0x87B3
  GL_OUTPUT_TEXTURE_COORD23_EXT     := 0x87B4
  GL_OUTPUT_TEXTURE_COORD24_EXT     := 0x87B5
  GL_OUTPUT_TEXTURE_COORD25_EXT     := 0x87B6
  GL_OUTPUT_TEXTURE_COORD26_EXT     := 0x87B7
  GL_OUTPUT_TEXTURE_COORD27_EXT     := 0x87B8
  GL_OUTPUT_TEXTURE_COORD28_EXT     := 0x87B9
  GL_OUTPUT_TEXTURE_COORD29_EXT     := 0x87BA
  GL_OUTPUT_TEXTURE_COORD30_EXT     := 0x87BB
  GL_OUTPUT_TEXTURE_COORD31_EXT     := 0x87BC
  GL_OUTPUT_FOG_EXT                 := 0x87BD
  GL_SCALAR_EXT                     := 0x87BE
  GL_VECTOR_EXT                     := 0x87BF
  GL_MATRIX_EXT                     := 0x87C0
  GL_VARIANT_EXT                    := 0x87C1
  GL_INVARIANT_EXT                  := 0x87C2
  GL_LOCAL_CONSTANT_EXT             := 0x87C3
  GL_LOCAL_EXT                      := 0x87C4
  GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT := 0x87C5
  GL_MAX_VERTEX_SHADER_VARIANTS_EXT := 0x87C6
  GL_MAX_VERTEX_SHADER_INVARIANTS_EXT := 0x87C7
  GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT := 0x87C8
  GL_MAX_VERTEX_SHADER_LOCALS_EXT   := 0x87C9
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT := 0x87CA
  GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT := 0x87CB
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT := 0x87CC
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT := 0x87CD
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT := 0x87CE
  GL_VERTEX_SHADER_INSTRUCTIONS_EXT := 0x87CF
  GL_VERTEX_SHADER_VARIANTS_EXT     := 0x87D0
  GL_VERTEX_SHADER_INVARIANTS_EXT   := 0x87D1
  GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT := 0x87D2
  GL_VERTEX_SHADER_LOCALS_EXT       := 0x87D3
  GL_VERTEX_SHADER_OPTIMIZED_EXT    := 0x87D4
  GL_X_EXT                          := 0x87D5
  GL_Y_EXT                          := 0x87D6
  GL_Z_EXT                          := 0x87D7
  GL_W_EXT                          := 0x87D8
  GL_NEGATIVE_X_EXT                 := 0x87D9
  GL_NEGATIVE_Y_EXT                 := 0x87DA
  GL_NEGATIVE_Z_EXT                 := 0x87DB
  GL_NEGATIVE_W_EXT                 := 0x87DC
  GL_ZERO_EXT                       := 0x87DD
  GL_ONE_EXT                        := 0x87DE
  GL_NEGATIVE_ONE_EXT               := 0x87DF
  GL_NORMALIZED_RANGE_EXT           := 0x87E0
  GL_FULL_RANGE_EXT                 := 0x87E1
  GL_CURRENT_VERTEX_EXT             := 0x87E2
  GL_MVP_MATRIX_EXT                 := 0x87E3
  GL_VARIANT_VALUE_EXT              := 0x87E4
  GL_VARIANT_DATATYPE_EXT           := 0x87E5
  GL_VARIANT_ARRAY_STRIDE_EXT       := 0x87E6
  GL_VARIANT_ARRAY_TYPE_EXT         := 0x87E7
  GL_VARIANT_ARRAY_EXT              := 0x87E8
  GL_VARIANT_ARRAY_POINTER_EXT      := 0x87E9
  GL_INVARIANT_VALUE_EXT            := 0x87EA
  GL_INVARIANT_DATATYPE_EXT         := 0x87EB
  GL_LOCAL_CONSTANT_VALUE_EXT       := 0x87EC
  GL_LOCAL_CONSTANT_DATATYPE_EXT    := 0x87ED
}

if (!GL_ATI_vertex_streams)
{
  GL_MAX_VERTEX_STREAMS_ATI         := 0x876B
  GL_VERTEX_STREAM0_ATI             := 0x876C
  GL_VERTEX_STREAM1_ATI             := 0x876D
  GL_VERTEX_STREAM2_ATI             := 0x876E
  GL_VERTEX_STREAM3_ATI             := 0x876F
  GL_VERTEX_STREAM4_ATI             := 0x8770
  GL_VERTEX_STREAM5_ATI             := 0x8771
  GL_VERTEX_STREAM6_ATI             := 0x8772
  GL_VERTEX_STREAM7_ATI             := 0x8773
  GL_VERTEX_SOURCE_ATI              := 0x8774
}

if (!GL_ATI_element_array)
{
  GL_ELEMENT_ARRAY_ATI              := 0x8768
  GL_ELEMENT_ARRAY_TYPE_ATI         := 0x8769
  GL_ELEMENT_ARRAY_POINTER_ATI      := 0x876A
}

if (!GL_SUN_mesh_array)
{
  GL_QUAD_MESH_SUN                  := 0x8614
  GL_TRIANGLE_MESH_SUN              := 0x8615
}

if (!GL_SUN_slice_accum)
{
  GL_SLICE_ACCUM_SUN                := 0x85CC
}

if (!GL_NV_multisample_filter_hint)
{
  GL_MULTISAMPLE_FILTER_HINT_NV     := 0x8534
}

if (!GL_NV_depth_clamp)
{
  GL_DEPTH_CLAMP_NV                 := 0x864F
}

if (!GL_NV_occlusion_query)
{
  GL_PIXEL_COUNTER_BITS_NV          := 0x8864
  GL_CURRENT_OCCLUSION_QUERY_ID_NV  := 0x8865
  GL_PIXEL_COUNT_NV                 := 0x8866
  GL_PIXEL_COUNT_AVAILABLE_NV       := 0x8867
}

if (!GL_NV_point_sprite)
{
  GL_POINT_SPRITE_NV                := 0x8861
  GL_COORD_REPLACE_NV               := 0x8862
  GL_POINT_SPRITE_R_MODE_NV         := 0x8863
}

if (!GL_NV_texture_shader3)
{
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV := 0x8850
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV := 0x8851
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV := 0x8852
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV := 0x8853
  GL_OFFSET_HILO_TEXTURE_2D_NV      := 0x8854
  GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV := 0x8855
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV := 0x8856
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV := 0x8857
  GL_DEPENDENT_HILO_TEXTURE_2D_NV   := 0x8858
  GL_DEPENDENT_RGB_TEXTURE_3D_NV    := 0x8859
  GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV := 0x885A
  GL_DOT_PRODUCT_PASS_THROUGH_NV    := 0x885B
  GL_DOT_PRODUCT_TEXTURE_1D_NV      := 0x885C
  GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV := 0x885D
  GL_HILO8_NV                       := 0x885E
  GL_SIGNED_HILO8_NV                := 0x885F
  GL_FORCE_BLUE_TO_ONE_NV           := 0x8860
}

if (!GL_NV_vertex_program1_1)
{
}

if (!GL_EXT_shadow_funcs)
{
}

if (!GL_EXT_stencil_two_side)
{
  GL_STENCIL_TEST_TWO_SIDE_EXT      := 0x8910
  GL_ACTIVE_STENCIL_FACE_EXT        := 0x8911
}

if (!GL_ATI_text_fragment_shader)
{
  GL_TEXT_FRAGMENT_SHADER_ATI       := 0x8200
}

if (!GL_APPLE_client_storage)
{
  GL_UNPACK_CLIENT_STORAGE_APPLE    := 0x85B2
}

if (!GL_APPLE_element_array)
{
  GL_ELEMENT_ARRAY_APPLE            := 0x8A0C
  GL_ELEMENT_ARRAY_TYPE_APPLE       := 0x8A0D
  GL_ELEMENT_ARRAY_POINTER_APPLE    := 0x8A0E
}

if (!GL_APPLE_fence)
{
  GL_DRAW_PIXELS_APPLE              := 0x8A0A
  GL_FENCE_APPLE                    := 0x8A0B
}

if (!GL_APPLE_vertex_array_object)
{
  GL_VERTEX_ARRAY_BINDING_APPLE     := 0x85B5
}

if (!GL_APPLE_vertex_array_range)
{
  GL_VERTEX_ARRAY_RANGE_APPLE       := 0x851D
  GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE := 0x851E
  GL_VERTEX_ARRAY_STORAGE_HINT_APPLE := 0x851F
  GL_VERTEX_ARRAY_RANGE_POINTER_APPLE := 0x8521
  GL_STORAGE_CLIENT_APPLE           := 0x85B4
  GL_STORAGE_CACHED_APPLE           := 0x85BE
  GL_STORAGE_SHARED_APPLE           := 0x85BF
}

if (!GL_APPLE_ycbcr_422)
{
  GL_YCBCR_422_APPLE                := 0x85B9
  GL_UNSIGNED_SHORT_8_8_APPLE       := 0x85BA
  GL_UNSIGNED_SHORT_8_8_REV_APPLE   := 0x85BB
}

if (!GL_S3_s3tc)
{
  GL_RGB_S3TC                       := 0x83A0
  GL_RGB4_S3TC                      := 0x83A1
  GL_RGBA_S3TC                      := 0x83A2
  GL_RGBA4_S3TC                     := 0x83A3
}

if (!GL_ATI_draw_buffers)
{
  GL_MAX_DRAW_BUFFERS_ATI           := 0x8824
  GL_DRAW_BUFFER0_ATI               := 0x8825
  GL_DRAW_BUFFER1_ATI               := 0x8826
  GL_DRAW_BUFFER2_ATI               := 0x8827
  GL_DRAW_BUFFER3_ATI               := 0x8828
  GL_DRAW_BUFFER4_ATI               := 0x8829
  GL_DRAW_BUFFER5_ATI               := 0x882A
  GL_DRAW_BUFFER6_ATI               := 0x882B
  GL_DRAW_BUFFER7_ATI               := 0x882C
  GL_DRAW_BUFFER8_ATI               := 0x882D
  GL_DRAW_BUFFER9_ATI               := 0x882E
  GL_DRAW_BUFFER10_ATI              := 0x882F
  GL_DRAW_BUFFER11_ATI              := 0x8830
  GL_DRAW_BUFFER12_ATI              := 0x8831
  GL_DRAW_BUFFER13_ATI              := 0x8832
  GL_DRAW_BUFFER14_ATI              := 0x8833
  GL_DRAW_BUFFER15_ATI              := 0x8834
}

if (!GL_ATI_pixel_format_float)
{
  GL_TYPE_RGBA_FLOAT_ATI            := 0x8820
  GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI := 0x8835
}

if (!GL_ATI_texture_env_combine3)
{
  GL_MODULATE_ADD_ATI               := 0x8744
  GL_MODULATE_SIGNED_ADD_ATI        := 0x8745
  GL_MODULATE_SUBTRACT_ATI          := 0x8746
}

if (!GL_ATI_texture_float)
{
  GL_RGBA_FLOAT32_ATI               := 0x8814
  GL_RGB_FLOAT32_ATI                := 0x8815
  GL_ALPHA_FLOAT32_ATI              := 0x8816
  GL_INTENSITY_FLOAT32_ATI          := 0x8817
  GL_LUMINANCE_FLOAT32_ATI          := 0x8818
  GL_LUMINANCE_ALPHA_FLOAT32_ATI    := 0x8819
  GL_RGBA_FLOAT16_ATI               := 0x881A
  GL_RGB_FLOAT16_ATI                := 0x881B
  GL_ALPHA_FLOAT16_ATI              := 0x881C
  GL_INTENSITY_FLOAT16_ATI          := 0x881D
  GL_LUMINANCE_FLOAT16_ATI          := 0x881E
  GL_LUMINANCE_ALPHA_FLOAT16_ATI    := 0x881F
}

if (!GL_NV_float_buffer)
{
  GL_FLOAT_R_NV                     := 0x8880
  GL_FLOAT_RG_NV                    := 0x8881
  GL_FLOAT_RGB_NV                   := 0x8882
  GL_FLOAT_RGBA_NV                  := 0x8883
  GL_FLOAT_R16_NV                   := 0x8884
  GL_FLOAT_R32_NV                   := 0x8885
  GL_FLOAT_RG16_NV                  := 0x8886
  GL_FLOAT_RG32_NV                  := 0x8887
  GL_FLOAT_RGB16_NV                 := 0x8888
  GL_FLOAT_RGB32_NV                 := 0x8889
  GL_FLOAT_RGBA16_NV                := 0x888A
  GL_FLOAT_RGBA32_NV                := 0x888B
  GL_TEXTURE_FLOAT_COMPONENTS_NV    := 0x888C
  GL_FLOAT_CLEAR_COLOR_VALUE_NV     := 0x888D
  GL_FLOAT_RGBA_MODE_NV             := 0x888E
}

if (!GL_NV_fragment_program)
{
  GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV := 0x8868
  GL_FRAGMENT_PROGRAM_NV            := 0x8870
  GL_MAX_TEXTURE_COORDS_NV          := 0x8871
  GL_MAX_TEXTURE_IMAGE_UNITS_NV     := 0x8872
  GL_FRAGMENT_PROGRAM_BINDING_NV    := 0x8873
  GL_PROGRAM_ERROR_STRING_NV        := 0x8874
}

if (!GL_NV_half_float)
{
  GL_HALF_FLOAT_NV                  := 0x140B
}

if (!GL_NV_pixel_data_range)
{
  GL_WRITE_PIXEL_DATA_RANGE_NV      := 0x8878
  GL_READ_PIXEL_DATA_RANGE_NV       := 0x8879
  GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV := 0x887A
  GL_READ_PIXEL_DATA_RANGE_LENGTH_NV := 0x887B
  GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV := 0x887C
  GL_READ_PIXEL_DATA_RANGE_POINTER_NV := 0x887D
}

if (!GL_NV_primitive_restart)
{
  GL_PRIMITIVE_RESTART_NV           := 0x8558
  GL_PRIMITIVE_RESTART_INDEX_NV     := 0x8559
}

if (!GL_NV_texture_expand_normal)
{
  GL_TEXTURE_UNSIGNED_REMAP_MODE_NV := 0x888F
}

if (!GL_NV_vertex_program2)
{
}

if (!GL_ATI_map_object_buffer)
{
}

if (!GL_ATI_separate_stencil)
{
  GL_STENCIL_BACK_FUNC_ATI          := 0x8800
  GL_STENCIL_BACK_FAIL_ATI          := 0x8801
  GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI := 0x8802
  GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI := 0x8803
}

if (!GL_ATI_vertex_attrib_array_object)
{
}

if (!GL_OES_read_format)
{
  GL_IMPLEMENTATION_COLOR_READ_TYPE_OES := 0x8B9A
  GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES := 0x8B9B
}

if (!GL_EXT_depth_bounds_test)
{
  GL_DEPTH_BOUNDS_TEST_EXT          := 0x8890
  GL_DEPTH_BOUNDS_EXT               := 0x8891
}

if (!GL_EXT_texture_mirror_clamp)
{
  GL_MIRROR_CLAMP_EXT               := 0x8742
  GL_MIRROR_CLAMP_TO_EDGE_EXT       := 0x8743
  GL_MIRROR_CLAMP_TO_BORDER_EXT     := 0x8912
}

if (!GL_EXT_blend_equation_separate)
{
  GL_BLEND_EQUATION_RGB_EXT         := 0x8009
  GL_BLEND_EQUATION_ALPHA_EXT       := 0x883D
}

if (!GL_MESA_pack_invert)
{
  GL_PACK_INVERT_MESA               := 0x8758
}

if (!GL_MESA_ycbcr_texture)
{
  GL_UNSIGNED_SHORT_8_8_MESA        := 0x85BA
  GL_UNSIGNED_SHORT_8_8_REV_MESA    := 0x85BB
  GL_YCBCR_MESA                     := 0x8757
}

if (!GL_EXT_pixel_buffer_object)
{
  GL_PIXEL_PACK_BUFFER_EXT          := 0x88EB
  GL_PIXEL_UNPACK_BUFFER_EXT        := 0x88EC
  GL_PIXEL_PACK_BUFFER_BINDING_EXT  := 0x88ED
  GL_PIXEL_UNPACK_BUFFER_BINDING_EXT := 0x88EF
}

if (!GL_NV_fragment_program_option)
{
}

if (!GL_NV_fragment_program2)
{
  GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV := 0x88F4
  GL_MAX_PROGRAM_CALL_DEPTH_NV      := 0x88F5
  GL_MAX_PROGRAM_IF_DEPTH_NV        := 0x88F6
  GL_MAX_PROGRAM_LOOP_DEPTH_NV      := 0x88F7
  GL_MAX_PROGRAM_LOOP_COUNT_NV      := 0x88F8
}

if (!GL_NV_vertex_program2_option)
{
  ;reuse GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV
  ;reuse GL_MAX_PROGRAM_CALL_DEPTH_NV
}

if (!GL_NV_vertex_program3)
{
  ;reuse GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB
}

if (!GL_EXT_framebuffer_object)
{
  GL_INVALID_FRAMEBUFFER_OPERATION_EXT := 0x0506
  GL_MAX_RENDERBUFFER_SIZE_EXT      := 0x84E8
  GL_FRAMEBUFFER_BINDING_EXT        := 0x8CA6
  GL_RENDERBUFFER_BINDING_EXT       := 0x8CA7
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT := 0x8CD0
  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT := 0x8CD1
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT := 0x8CD2
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT := 0x8CD3
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT := 0x8CD4
  GL_FRAMEBUFFER_COMPLETE_EXT       := 0x8CD5
  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT := 0x8CD6
  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT := 0x8CD7
  GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT := 0x8CD9
  GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT := 0x8CDA
  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT := 0x8CDB
  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT := 0x8CDC
  GL_FRAMEBUFFER_UNSUPPORTED_EXT    := 0x8CDD
  GL_MAX_COLOR_ATTACHMENTS_EXT      := 0x8CDF
  GL_COLOR_ATTACHMENT0_EXT          := 0x8CE0
  GL_COLOR_ATTACHMENT1_EXT          := 0x8CE1
  GL_COLOR_ATTACHMENT2_EXT          := 0x8CE2
  GL_COLOR_ATTACHMENT3_EXT          := 0x8CE3
  GL_COLOR_ATTACHMENT4_EXT          := 0x8CE4
  GL_COLOR_ATTACHMENT5_EXT          := 0x8CE5
  GL_COLOR_ATTACHMENT6_EXT          := 0x8CE6
  GL_COLOR_ATTACHMENT7_EXT          := 0x8CE7
  GL_COLOR_ATTACHMENT8_EXT          := 0x8CE8
  GL_COLOR_ATTACHMENT9_EXT          := 0x8CE9
  GL_COLOR_ATTACHMENT10_EXT         := 0x8CEA
  GL_COLOR_ATTACHMENT11_EXT         := 0x8CEB
  GL_COLOR_ATTACHMENT12_EXT         := 0x8CEC
  GL_COLOR_ATTACHMENT13_EXT         := 0x8CED
  GL_COLOR_ATTACHMENT14_EXT         := 0x8CEE
  GL_COLOR_ATTACHMENT15_EXT         := 0x8CEF
  GL_DEPTH_ATTACHMENT_EXT           := 0x8D00
  GL_STENCIL_ATTACHMENT_EXT         := 0x8D20
  GL_FRAMEBUFFER_EXT                := 0x8D40
  GL_RENDERBUFFER_EXT               := 0x8D41
  GL_RENDERBUFFER_WIDTH_EXT         := 0x8D42
  GL_RENDERBUFFER_HEIGHT_EXT        := 0x8D43
  GL_RENDERBUFFER_INTERNAL_FORMAT_EXT := 0x8D44
  GL_STENCIL_INDEX1_EXT             := 0x8D46
  GL_STENCIL_INDEX4_EXT             := 0x8D47
  GL_STENCIL_INDEX8_EXT             := 0x8D48
  GL_STENCIL_INDEX16_EXT            := 0x8D49
  GL_RENDERBUFFER_RED_SIZE_EXT      := 0x8D50
  GL_RENDERBUFFER_GREEN_SIZE_EXT    := 0x8D51
  GL_RENDERBUFFER_BLUE_SIZE_EXT     := 0x8D52
  GL_RENDERBUFFER_ALPHA_SIZE_EXT    := 0x8D53
  GL_RENDERBUFFER_DEPTH_SIZE_EXT    := 0x8D54
  GL_RENDERBUFFER_STENCIL_SIZE_EXT  := 0x8D55
}

if (!GL_GREMEDY_string_marker)
{
}

if (!GL_EXT_packed_depth_stencil)
{
  GL_DEPTH_STENCIL_EXT              := 0x84F9
  GL_UNSIGNED_INT_24_8_EXT          := 0x84FA
  GL_DEPTH24_STENCIL8_EXT           := 0x88F0
  GL_TEXTURE_STENCIL_SIZE_EXT       := 0x88F1
}

if (!GL_EXT_stencil_clear_tag)
{
  GL_STENCIL_TAG_BITS_EXT           := 0x88F2
  GL_STENCIL_CLEAR_TAG_VALUE_EXT    := 0x88F3
}

if (!GL_EXT_texture_sRGB)
{
  GL_SRGB_EXT                       := 0x8C40
  GL_SRGB8_EXT                      := 0x8C41
  GL_SRGB_ALPHA_EXT                 := 0x8C42
  GL_SRGB8_ALPHA8_EXT               := 0x8C43
  GL_SLUMINANCE_ALPHA_EXT           := 0x8C44
  GL_SLUMINANCE8_ALPHA8_EXT         := 0x8C45
  GL_SLUMINANCE_EXT                 := 0x8C46
  GL_SLUMINANCE8_EXT                := 0x8C47
  GL_COMPRESSED_SRGB_EXT            := 0x8C48
  GL_COMPRESSED_SRGB_ALPHA_EXT      := 0x8C49
  GL_COMPRESSED_SLUMINANCE_EXT      := 0x8C4A
  GL_COMPRESSED_SLUMINANCE_ALPHA_EXT := 0x8C4B
  GL_COMPRESSED_SRGB_S3TC_DXT1_EXT  := 0x8C4C
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT := 0x8C4D
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT := 0x8C4E
  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT := 0x8C4F
}

if (!GL_EXT_framebuffer_blit)
{
  GL_READ_FRAMEBUFFER_EXT           := 0x8CA8
  GL_DRAW_FRAMEBUFFER_EXT           := 0x8CA9
  GL_DRAW_FRAMEBUFFER_BINDING_EXT   := GL_FRAMEBUFFER_BINDING_EXT
  GL_READ_FRAMEBUFFER_BINDING_EXT   := 0x8CAA
}

if (!GL_EXT_framebuffer_multisample)
{
  GL_RENDERBUFFER_SAMPLES_EXT       := 0x8CAB
  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT := 0x8D56
  GL_MAX_SAMPLES_EXT                := 0x8D57
}

if (!GL_MESAX_texture_stack)
{
  GL_TEXTURE_1D_STACK_MESAX         := 0x8759
  GL_TEXTURE_2D_STACK_MESAX         := 0x875A
  GL_PROXY_TEXTURE_1D_STACK_MESAX   := 0x875B
  GL_PROXY_TEXTURE_2D_STACK_MESAX   := 0x875C
  GL_TEXTURE_1D_STACK_BINDING_MESAX := 0x875D
  GL_TEXTURE_2D_STACK_BINDING_MESAX := 0x875E
}

if (!GL_EXT_timer_query)
{
  GL_TIME_ELAPSED_EXT               := 0x88BF
}

if (!GL_EXT_gpu_program_parameters)
{
}

if (!GL_APPLE_flush_buffer_range)
{
  GL_BUFFER_SERIALIZED_MODIFY_APPLE := 0x8A12
  GL_BUFFER_FLUSHING_UNMAP_APPLE    := 0x8A13
}

if (!GL_NV_gpu_program4)
{
  GL_MIN_PROGRAM_TEXEL_OFFSET_NV    := 0x8904
  GL_MAX_PROGRAM_TEXEL_OFFSET_NV    := 0x8905
  GL_PROGRAM_ATTRIB_COMPONENTS_NV   := 0x8906
  GL_PROGRAM_RESULT_COMPONENTS_NV   := 0x8907
  GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV := 0x8908
  GL_MAX_PROGRAM_RESULT_COMPONENTS_NV := 0x8909
  GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV := 0x8DA5
  GL_MAX_PROGRAM_GENERIC_RESULTS_NV := 0x8DA6
}

if (!GL_NV_geometry_program4)
{
  GL_LINES_ADJACENCY_EXT            := 0x000A
  GL_LINE_STRIP_ADJACENCY_EXT       := 0x000B
  GL_TRIANGLES_ADJACENCY_EXT        := 0x000C
  GL_TRIANGLE_STRIP_ADJACENCY_EXT   := 0x000D
  GL_GEOMETRY_PROGRAM_NV            := 0x8C26
  GL_MAX_PROGRAM_OUTPUT_VERTICES_NV := 0x8C27
  GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV := 0x8C28
  GL_GEOMETRY_VERTICES_OUT_EXT      := 0x8DDA
  GL_GEOMETRY_INPUT_TYPE_EXT        := 0x8DDB
  GL_GEOMETRY_OUTPUT_TYPE_EXT       := 0x8DDC
  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT := 0x8C29
  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT := 0x8DA7
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT := 0x8DA8
  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT := 0x8DA9
  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT := 0x8CD4
  GL_PROGRAM_POINT_SIZE_EXT         := 0x8642
}

if (!GL_EXT_geometry_shader4)
{
  GL_GEOMETRY_SHADER_EXT            := 0x8DD9
  ;reuse GL_GEOMETRY_VERTICES_OUT_EXT
  ;reuse GL_GEOMETRY_INPUT_TYPE_EXT
  ;reuse GL_GEOMETRY_OUTPUT_TYPE_EXT
  ;reuse GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT
  GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT := 0x8DDD
  GL_MAX_VERTEX_VARYING_COMPONENTS_EXT := 0x8DDE
  GL_MAX_VARYING_COMPONENTS_EXT     := 0x8B4B
  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT := 0x8DDF
  GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT := 0x8DE0
  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT := 0x8DE1
  ;reuse GL_LINES_ADJACENCY_EXT
  ;reuse GL_LINE_STRIP_ADJACENCY_EXT
  ;reuse GL_TRIANGLES_ADJACENCY_EXT
  ;reuse GL_TRIANGLE_STRIP_ADJACENCY_EXT
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT
  ;reuse GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT
  ;reuse GL_PROGRAM_POINT_SIZE_EXT
}

if (!GL_NV_vertex_program4)
{
  GL_VERTEX_ATTRIB_ARRAY_INTEGER_NV := 0x88FD
}

if (!GL_EXT_gpu_shader4)
{
  GL_SAMPLER_1D_ARRAY_EXT           := 0x8DC0
  GL_SAMPLER_2D_ARRAY_EXT           := 0x8DC1
  GL_SAMPLER_BUFFER_EXT             := 0x8DC2
  GL_SAMPLER_1D_ARRAY_SHADOW_EXT    := 0x8DC3
  GL_SAMPLER_2D_ARRAY_SHADOW_EXT    := 0x8DC4
  GL_SAMPLER_CUBE_SHADOW_EXT        := 0x8DC5
  GL_UNSIGNED_INT_VEC2_EXT          := 0x8DC6
  GL_UNSIGNED_INT_VEC3_EXT          := 0x8DC7
  GL_UNSIGNED_INT_VEC4_EXT          := 0x8DC8
  GL_INT_SAMPLER_1D_EXT             := 0x8DC9
  GL_INT_SAMPLER_2D_EXT             := 0x8DCA
  GL_INT_SAMPLER_3D_EXT             := 0x8DCB
  GL_INT_SAMPLER_CUBE_EXT           := 0x8DCC
  GL_INT_SAMPLER_2D_RECT_EXT        := 0x8DCD
  GL_INT_SAMPLER_1D_ARRAY_EXT       := 0x8DCE
  GL_INT_SAMPLER_2D_ARRAY_EXT       := 0x8DCF
  GL_INT_SAMPLER_BUFFER_EXT         := 0x8DD0
  GL_UNSIGNED_INT_SAMPLER_1D_EXT    := 0x8DD1
  GL_UNSIGNED_INT_SAMPLER_2D_EXT    := 0x8DD2
  GL_UNSIGNED_INT_SAMPLER_3D_EXT    := 0x8DD3
  GL_UNSIGNED_INT_SAMPLER_CUBE_EXT  := 0x8DD4
  GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT := 0x8DD5
  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT := 0x8DD6
  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT := 0x8DD7
  GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT := 0x8DD8
}

if (!GL_EXT_draw_instanced)
{
}

if (!GL_EXT_packed_float)
{
  GL_R11F_G11F_B10F_EXT             := 0x8C3A
  GL_UNSIGNED_INT_10F_11F_11F_REV_EXT := 0x8C3B
  GL_RGBA_SIGNED_COMPONENTS_EXT     := 0x8C3C
}

if (!GL_EXT_texture_array)
{
  GL_TEXTURE_1D_ARRAY_EXT           := 0x8C18
  GL_PROXY_TEXTURE_1D_ARRAY_EXT     := 0x8C19
  GL_TEXTURE_2D_ARRAY_EXT           := 0x8C1A
  GL_PROXY_TEXTURE_2D_ARRAY_EXT     := 0x8C1B
  GL_TEXTURE_BINDING_1D_ARRAY_EXT   := 0x8C1C
  GL_TEXTURE_BINDING_2D_ARRAY_EXT   := 0x8C1D
  GL_MAX_ARRAY_TEXTURE_LAYERS_EXT   := 0x88FF
  GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT := 0x884E
  ;reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT
}

if (!GL_EXT_texture_buffer_object)
{
  GL_TEXTURE_BUFFER_EXT             := 0x8C2A
  GL_MAX_TEXTURE_BUFFER_SIZE_EXT    := 0x8C2B
  GL_TEXTURE_BINDING_BUFFER_EXT     := 0x8C2C
  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT := 0x8C2D
  GL_TEXTURE_BUFFER_FORMAT_EXT      := 0x8C2E
}

if (!GL_EXT_texture_compression_latc)
{
  GL_COMPRESSED_LUMINANCE_LATC1_EXT := 0x8C70
  GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT := 0x8C71
  GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT := 0x8C72
  GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT := 0x8C73
}

if (!GL_EXT_texture_compression_rgtc)
{
  GL_COMPRESSED_RED_RGTC1_EXT       := 0x8DBB
  GL_COMPRESSED_SIGNED_RED_RGTC1_EXT := 0x8DBC
  GL_COMPRESSED_RED_GREEN_RGTC2_EXT := 0x8DBD
  GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT := 0x8DBE
}

if (!GL_EXT_texture_shared_exponent)
{
  GL_RGB9_E5_EXT                    := 0x8C3D
  GL_UNSIGNED_INT_5_9_9_9_REV_EXT   := 0x8C3E
  GL_TEXTURE_SHARED_SIZE_EXT        := 0x8C3F
}

if (!GL_NV_depth_buffer_float)
{
  GL_DEPTH_COMPONENT32F_NV          := 0x8DAB
  GL_DEPTH32F_STENCIL8_NV           := 0x8DAC
  GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV := 0x8DAD
  GL_DEPTH_BUFFER_FLOAT_MODE_NV     := 0x8DAF
}

if (!GL_NV_fragment_program4)
{
}

if (!GL_NV_framebuffer_multisample_coverage)
{
  GL_RENDERBUFFER_COVERAGE_SAMPLES_NV := 0x8CAB
  GL_RENDERBUFFER_COLOR_SAMPLES_NV  := 0x8E10
  GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV := 0x8E11
  GL_MULTISAMPLE_COVERAGE_MODES_NV  := 0x8E12
}

if (!GL_EXT_framebuffer_sRGB)
{
  GL_FRAMEBUFFER_SRGB_EXT           := 0x8DB9
  GL_FRAMEBUFFER_SRGB_CAPABLE_EXT   := 0x8DBA
}

if (!GL_NV_geometry_shader4)
{
}

if (!GL_NV_parameter_buffer_object)
{
  GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV := 0x8DA0
  GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV := 0x8DA1
  GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV := 0x8DA2
  GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV := 0x8DA3
  GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV := 0x8DA4
}

if (!GL_EXT_draw_buffers2)
{
}

if (!GL_NV_transform_feedback)
{
  GL_BACK_PRIMARY_COLOR_NV          := 0x8C77
  GL_BACK_SECONDARY_COLOR_NV        := 0x8C78
  GL_TEXTURE_COORD_NV               := 0x8C79
  GL_CLIP_DISTANCE_NV               := 0x8C7A
  GL_VERTEX_ID_NV                   := 0x8C7B
  GL_PRIMITIVE_ID_NV                := 0x8C7C
  GL_GENERIC_ATTRIB_NV              := 0x8C7D
  GL_TRANSFORM_FEEDBACK_ATTRIBS_NV  := 0x8C7E
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV := 0x8C7F
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV := 0x8C80
  GL_ACTIVE_VARYINGS_NV             := 0x8C81
  GL_ACTIVE_VARYING_MAX_LENGTH_NV   := 0x8C82
  GL_TRANSFORM_FEEDBACK_VARYINGS_NV := 0x8C83
  GL_TRANSFORM_FEEDBACK_BUFFER_START_NV := 0x8C84
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV := 0x8C85
  GL_TRANSFORM_FEEDBACK_RECORD_NV   := 0x8C86
  GL_PRIMITIVES_GENERATED_NV        := 0x8C87
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV := 0x8C88
  GL_RASTERIZER_DISCARD_NV          := 0x8C89
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_ATTRIBS_NV := 0x8C8A
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV := 0x8C8B
  GL_INTERLEAVED_ATTRIBS_NV         := 0x8C8C
  GL_SEPARATE_ATTRIBS_NV            := 0x8C8D
  GL_TRANSFORM_FEEDBACK_BUFFER_NV   := 0x8C8E
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV := 0x8C8F
  GL_LAYER_NV                       := 0x8DAA
  GL_NEXT_BUFFER_NV                 := -2
  GL_SKIP_COMPONENTS4_NV            := -3
  GL_SKIP_COMPONENTS3_NV            := -4
  GL_SKIP_COMPONENTS2_NV            := -5
  GL_SKIP_COMPONENTS1_NV            := -6
}

if (!GL_EXT_bindable_uniform)
{
  GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT := 0x8DE2
  GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT := 0x8DE3
  GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT := 0x8DE4
  GL_MAX_BINDABLE_UNIFORM_SIZE_EXT  := 0x8DED
  GL_UNIFORM_BUFFER_EXT             := 0x8DEE
  GL_UNIFORM_BUFFER_BINDING_EXT     := 0x8DEF
}

if (!GL_EXT_texture_integer)
{
  GL_RGBA32UI_EXT                   := 0x8D70
  GL_RGB32UI_EXT                    := 0x8D71
  GL_ALPHA32UI_EXT                  := 0x8D72
  GL_INTENSITY32UI_EXT              := 0x8D73
  GL_LUMINANCE32UI_EXT              := 0x8D74
  GL_LUMINANCE_ALPHA32UI_EXT        := 0x8D75
  GL_RGBA16UI_EXT                   := 0x8D76
  GL_RGB16UI_EXT                    := 0x8D77
  GL_ALPHA16UI_EXT                  := 0x8D78
  GL_INTENSITY16UI_EXT              := 0x8D79
  GL_LUMINANCE16UI_EXT              := 0x8D7A
  GL_LUMINANCE_ALPHA16UI_EXT        := 0x8D7B
  GL_RGBA8UI_EXT                    := 0x8D7C
  GL_RGB8UI_EXT                     := 0x8D7D
  GL_ALPHA8UI_EXT                   := 0x8D7E
  GL_INTENSITY8UI_EXT               := 0x8D7F
  GL_LUMINANCE8UI_EXT               := 0x8D80
  GL_LUMINANCE_ALPHA8UI_EXT         := 0x8D81
  GL_RGBA32I_EXT                    := 0x8D82
  GL_RGB32I_EXT                     := 0x8D83
  GL_ALPHA32I_EXT                   := 0x8D84
  GL_INTENSITY32I_EXT               := 0x8D85
  GL_LUMINANCE32I_EXT               := 0x8D86
  GL_LUMINANCE_ALPHA32I_EXT         := 0x8D87
  GL_RGBA16I_EXT                    := 0x8D88
  GL_RGB16I_EXT                     := 0x8D89
  GL_ALPHA16I_EXT                   := 0x8D8A
  GL_INTENSITY16I_EXT               := 0x8D8B
  GL_LUMINANCE16I_EXT               := 0x8D8C
  GL_LUMINANCE_ALPHA16I_EXT         := 0x8D8D
  GL_RGBA8I_EXT                     := 0x8D8E
  GL_RGB8I_EXT                      := 0x8D8F
  GL_ALPHA8I_EXT                    := 0x8D90
  GL_INTENSITY8I_EXT                := 0x8D91
  GL_LUMINANCE8I_EXT                := 0x8D92
  GL_LUMINANCE_ALPHA8I_EXT          := 0x8D93
  GL_RED_INTEGER_EXT                := 0x8D94
  GL_GREEN_INTEGER_EXT              := 0x8D95
  GL_BLUE_INTEGER_EXT               := 0x8D96
  GL_ALPHA_INTEGER_EXT              := 0x8D97
  GL_RGB_INTEGER_EXT                := 0x8D98
  GL_RGBA_INTEGER_EXT               := 0x8D99
  GL_BGR_INTEGER_EXT                := 0x8D9A
  GL_BGRA_INTEGER_EXT               := 0x8D9B
  GL_LUMINANCE_INTEGER_EXT          := 0x8D9C
  GL_LUMINANCE_ALPHA_INTEGER_EXT    := 0x8D9D
  GL_RGBA_INTEGER_MODE_EXT          := 0x8D9E
}

if (!GL_GREMEDY_frame_terminator)
{
}

if (!GL_NV_conditional_render)
{
  GL_QUERY_WAIT_NV                  := 0x8E13
  GL_QUERY_NO_WAIT_NV               := 0x8E14
  GL_QUERY_BY_REGION_WAIT_NV        := 0x8E15
  GL_QUERY_BY_REGION_NO_WAIT_NV     := 0x8E16
}

if (!GL_NV_present_video)
{
  GL_FRAME_NV                       := 0x8E26
  GL_FIELDS_NV                      := 0x8E27
  GL_CURRENT_TIME_NV                := 0x8E28
  GL_NUM_FILL_STREAMS_NV            := 0x8E29
  GL_PRESENT_TIME_NV                := 0x8E2A
  GL_PRESENT_DURATION_NV            := 0x8E2B
}

if (!GL_EXT_transform_feedback)
{
  GL_TRANSFORM_FEEDBACK_BUFFER_EXT  := 0x8C8E
  GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT := 0x8C84
  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT := 0x8C85
  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT := 0x8C8F
  GL_INTERLEAVED_ATTRIBS_EXT        := 0x8C8C
  GL_SEPARATE_ATTRIBS_EXT           := 0x8C8D
  GL_PRIMITIVES_GENERATED_EXT       := 0x8C87
  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT := 0x8C88
  GL_RASTERIZER_DISCARD_EXT         := 0x8C89
  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT := 0x8C8A
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT := 0x8C8B
  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT := 0x8C80
  GL_TRANSFORM_FEEDBACK_VARYINGS_EXT := 0x8C83
  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT := 0x8C7F
  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT := 0x8C76
}

if (!GL_EXT_direct_state_access)
{
  GL_PROGRAM_MATRIX_EXT             := 0x8E2D
  GL_TRANSPOSE_PROGRAM_MATRIX_EXT   := 0x8E2E
  GL_PROGRAM_MATRIX_STACK_DEPTH_EXT := 0x8E2F
}

if (!GL_EXT_vertex_array_bgra)
{
  ;reuse GL_BGRA
}

if (!GL_EXT_texture_swizzle)
{
  GL_TEXTURE_SWIZZLE_R_EXT          := 0x8E42
  GL_TEXTURE_SWIZZLE_G_EXT          := 0x8E43
  GL_TEXTURE_SWIZZLE_B_EXT          := 0x8E44
  GL_TEXTURE_SWIZZLE_A_EXT          := 0x8E45
  GL_TEXTURE_SWIZZLE_RGBA_EXT       := 0x8E46
}

if (!GL_NV_explicit_multisample)
{
  GL_SAMPLE_POSITION_NV             := 0x8E50
  GL_SAMPLE_MASK_NV                 := 0x8E51
  GL_SAMPLE_MASK_VALUE_NV           := 0x8E52
  GL_TEXTURE_BINDING_RENDERBUFFER_NV := 0x8E53
  GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV := 0x8E54
  GL_TEXTURE_RENDERBUFFER_NV        := 0x8E55
  GL_SAMPLER_RENDERBUFFER_NV        := 0x8E56
  GL_INT_SAMPLER_RENDERBUFFER_NV    := 0x8E57
  GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV := 0x8E58
  GL_MAX_SAMPLE_MASK_WORDS_NV       := 0x8E59
}

if (!GL_NV_transform_feedback2)
{
  GL_TRANSFORM_FEEDBACK_NV          := 0x8E22
  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV := 0x8E23
  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV := 0x8E24
  GL_TRANSFORM_FEEDBACK_BINDING_NV  := 0x8E25
}

if (!GL_ATI_meminfo)
{
  GL_VBO_FREE_MEMORY_ATI            := 0x87FB
  GL_TEXTURE_FREE_MEMORY_ATI        := 0x87FC
  GL_RENDERBUFFER_FREE_MEMORY_ATI   := 0x87FD
}

if (!GL_AMD_performance_monitor)
{
  GL_COUNTER_TYPE_AMD               := 0x8BC0
  GL_COUNTER_RANGE_AMD              := 0x8BC1
  GL_UNSIGNED_INT64_AMD             := 0x8BC2
  GL_PERCENTAGE_AMD                 := 0x8BC3
  GL_PERFMON_RESULT_AVAILABLE_AMD   := 0x8BC4
  GL_PERFMON_RESULT_SIZE_AMD        := 0x8BC5
  GL_PERFMON_RESULT_AMD             := 0x8BC6
}

if (!GL_AMD_texture_texture4)
{
}

if (!GL_AMD_vertex_shader_tesselator)
{
  GL_SAMPLER_BUFFER_AMD             := 0x9001
  GL_INT_SAMPLER_BUFFER_AMD         := 0x9002
  GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD := 0x9003
  GL_TESSELLATION_MODE_AMD          := 0x9004
  GL_TESSELLATION_FACTOR_AMD        := 0x9005
  GL_DISCRETE_AMD                   := 0x9006
  GL_CONTINUOUS_AMD                 := 0x9007
}

if (!GL_EXT_provoking_vertex)
{
  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT := 0x8E4C
  GL_FIRST_VERTEX_CONVENTION_EXT    := 0x8E4D
  GL_LAST_VERTEX_CONVENTION_EXT     := 0x8E4E
  GL_PROVOKING_VERTEX_EXT           := 0x8E4F
}

if (!GL_EXT_texture_snorm)
{
  GL_ALPHA_SNORM                    := 0x9010
  GL_LUMINANCE_SNORM                := 0x9011
  GL_LUMINANCE_ALPHA_SNORM          := 0x9012
  GL_INTENSITY_SNORM                := 0x9013
  GL_ALPHA8_SNORM                   := 0x9014
  GL_LUMINANCE8_SNORM               := 0x9015
  GL_LUMINANCE8_ALPHA8_SNORM        := 0x9016
  GL_INTENSITY8_SNORM               := 0x9017
  GL_ALPHA16_SNORM                  := 0x9018
  GL_LUMINANCE16_SNORM              := 0x9019
  GL_LUMINANCE16_ALPHA16_SNORM      := 0x901A
  GL_INTENSITY16_SNORM              := 0x901B
  ;reuse GL_RED_SNORM
  ;reuse GL_RG_SNORM
  ;reuse GL_RGB_SNORM
  ;reuse GL_RGBA_SNORM
  ;reuse GL_R8_SNORM
  ;reuse GL_RG8_SNORM
  ;reuse GL_RGB8_SNORM
  ;reuse GL_RGBA8_SNORM
  ;reuse GL_R16_SNORM
  ;reuse GL_RG16_SNORM
  ;reuse GL_RGB16_SNORM
  ;reuse GL_RGBA16_SNORM
  ;reuse GL_SIGNED_NORMALIZED
}

if (!GL_AMD_draw_buffers_blend)
{
}

if (!GL_APPLE_texture_range)
{
  GL_TEXTURE_RANGE_LENGTH_APPLE     := 0x85B7
  GL_TEXTURE_RANGE_POINTER_APPLE    := 0x85B8
  GL_TEXTURE_STORAGE_HINT_APPLE     := 0x85BC
  GL_STORAGE_PRIVATE_APPLE          := 0x85BD
  ;reuse GL_STORAGE_CACHED_APPLE
  ;reuse GL_STORAGE_SHARED_APPLE
}

if (!GL_APPLE_float_pixels)
{
  GL_HALF_APPLE                     := 0x140B
  GL_RGBA_FLOAT32_APPLE             := 0x8814
  GL_RGB_FLOAT32_APPLE              := 0x8815
  GL_ALPHA_FLOAT32_APPLE            := 0x8816
  GL_INTENSITY_FLOAT32_APPLE        := 0x8817
  GL_LUMINANCE_FLOAT32_APPLE        := 0x8818
  GL_LUMINANCE_ALPHA_FLOAT32_APPLE  := 0x8819
  GL_RGBA_FLOAT16_APPLE             := 0x881A
  GL_RGB_FLOAT16_APPLE              := 0x881B
  GL_ALPHA_FLOAT16_APPLE            := 0x881C
  GL_INTENSITY_FLOAT16_APPLE        := 0x881D
  GL_LUMINANCE_FLOAT16_APPLE        := 0x881E
  GL_LUMINANCE_ALPHA_FLOAT16_APPLE  := 0x881F
  GL_COLOR_FLOAT_APPLE              := 0x8A0F
}

if (!GL_APPLE_vertex_program_evaluators)
{
  GL_VERTEX_ATTRIB_MAP1_APPLE       := 0x8A00
  GL_VERTEX_ATTRIB_MAP2_APPLE       := 0x8A01
  GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE  := 0x8A02
  GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE := 0x8A03
  GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE := 0x8A04
  GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE := 0x8A05
  GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE  := 0x8A06
  GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE := 0x8A07
  GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE := 0x8A08
  GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE := 0x8A09
}

if (!GL_APPLE_aux_depth_stencil)
{
  GL_AUX_DEPTH_STENCIL_APPLE        := 0x8A14
}

if (!GL_APPLE_object_purgeable)
{
  GL_BUFFER_OBJECT_APPLE            := 0x85B3
  GL_RELEASED_APPLE                 := 0x8A19
  GL_VOLATILE_APPLE                 := 0x8A1A
  GL_RETAINED_APPLE                 := 0x8A1B
  GL_UNDEFINED_APPLE                := 0x8A1C
  GL_PURGEABLE_APPLE                := 0x8A1D
}

if (!GL_APPLE_row_bytes)
{
  GL_PACK_ROW_BYTES_APPLE           := 0x8A15
  GL_UNPACK_ROW_BYTES_APPLE         := 0x8A16
}

if (!GL_APPLE_rgb_422)
{
  GL_RGB_422_APPLE                  := 0x8A1F
  ;reuse GL_UNSIGNED_SHORT_8_8_APPLE
  ;reuse GL_UNSIGNED_SHORT_8_8_REV_APPLE
}

if (!GL_NV_video_capture)
{
  GL_VIDEO_BUFFER_NV                := 0x9020
  GL_VIDEO_BUFFER_BINDING_NV        := 0x9021
  GL_FIELD_UPPER_NV                 := 0x9022
  GL_FIELD_LOWER_NV                 := 0x9023
  GL_NUM_VIDEO_CAPTURE_STREAMS_NV   := 0x9024
  GL_NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV := 0x9025
  GL_VIDEO_CAPTURE_TO_422_SUPPORTED_NV := 0x9026
  GL_LAST_VIDEO_CAPTURE_STATUS_NV   := 0x9027
  GL_VIDEO_BUFFER_PITCH_NV          := 0x9028
  GL_VIDEO_COLOR_CONVERSION_MATRIX_NV := 0x9029
  GL_VIDEO_COLOR_CONVERSION_MAX_NV  := 0x902A
  GL_VIDEO_COLOR_CONVERSION_MIN_NV  := 0x902B
  GL_VIDEO_COLOR_CONVERSION_OFFSET_NV := 0x902C
  GL_VIDEO_BUFFER_INTERNAL_FORMAT_NV := 0x902D
  GL_PARTIAL_SUCCESS_NV             := 0x902E
  GL_SUCCESS_NV                     := 0x902F
  GL_FAILURE_NV                     := 0x9030
  GL_YCBYCR8_422_NV                 := 0x9031
  GL_YCBAYCR8A_4224_NV              := 0x9032
  GL_Z6Y10Z6CB10Z6Y10Z6CR10_422_NV  := 0x9033
  GL_Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV := 0x9034
  GL_Z4Y12Z4CB12Z4Y12Z4CR12_422_NV  := 0x9035
  GL_Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV := 0x9036
  GL_Z4Y12Z4CB12Z4CR12_444_NV       := 0x9037
  GL_VIDEO_CAPTURE_FRAME_WIDTH_NV   := 0x9038
  GL_VIDEO_CAPTURE_FRAME_HEIGHT_NV  := 0x9039
  GL_VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV := 0x903A
  GL_VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV := 0x903B
  GL_VIDEO_CAPTURE_SURFACE_ORIGIN_NV := 0x903C
}

if (!GL_NV_copy_image)
{
}

if (!GL_EXT_separate_shader_objects)
{
  GL_ACTIVE_PROGRAM_EXT             := 0x8B8D
}

if (!GL_NV_parameter_buffer_object2)
{
}

if (!GL_NV_shader_buffer_load)
{
  GL_BUFFER_GPU_ADDRESS_NV          := 0x8F1D
  GL_GPU_ADDRESS_NV                 := 0x8F34
  GL_MAX_SHADER_BUFFER_ADDRESS_NV   := 0x8F35
}

if (!GL_NV_vertex_buffer_unified_memory)
{
  GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV := 0x8F1E
  GL_ELEMENT_ARRAY_UNIFIED_NV       := 0x8F1F
  GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV := 0x8F20
  GL_VERTEX_ARRAY_ADDRESS_NV        := 0x8F21
  GL_NORMAL_ARRAY_ADDRESS_NV        := 0x8F22
  GL_COLOR_ARRAY_ADDRESS_NV         := 0x8F23
  GL_INDEX_ARRAY_ADDRESS_NV         := 0x8F24
  GL_TEXTURE_COORD_ARRAY_ADDRESS_NV := 0x8F25
  GL_EDGE_FLAG_ARRAY_ADDRESS_NV     := 0x8F26
  GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV := 0x8F27
  GL_FOG_COORD_ARRAY_ADDRESS_NV     := 0x8F28
  GL_ELEMENT_ARRAY_ADDRESS_NV       := 0x8F29
  GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV  := 0x8F2A
  GL_VERTEX_ARRAY_LENGTH_NV         := 0x8F2B
  GL_NORMAL_ARRAY_LENGTH_NV         := 0x8F2C
  GL_COLOR_ARRAY_LENGTH_NV          := 0x8F2D
  GL_INDEX_ARRAY_LENGTH_NV          := 0x8F2E
  GL_TEXTURE_COORD_ARRAY_LENGTH_NV  := 0x8F2F
  GL_EDGE_FLAG_ARRAY_LENGTH_NV      := 0x8F30
  GL_SECONDARY_COLOR_ARRAY_LENGTH_NV := 0x8F31
  GL_FOG_COORD_ARRAY_LENGTH_NV      := 0x8F32
  GL_ELEMENT_ARRAY_LENGTH_NV        := 0x8F33
  GL_DRAW_INDIRECT_UNIFIED_NV       := 0x8F40
  GL_DRAW_INDIRECT_ADDRESS_NV       := 0x8F41
  GL_DRAW_INDIRECT_LENGTH_NV        := 0x8F42
}

if (!GL_NV_texture_barrier)
{
}

if (!GL_AMD_shader_stencil_export)
{
}

if (!GL_AMD_seamless_cubemap_per_texture)
{
  ;reuse GL_TEXTURE_CUBE_MAP_SEAMLESS
}

if (!GL_AMD_conservative_depth)
{
}

if (!GL_EXT_shader_image_load_store)
{
  GL_MAX_IMAGE_UNITS_EXT            := 0x8F38
  GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT := 0x8F39
  GL_IMAGE_BINDING_NAME_EXT         := 0x8F3A
  GL_IMAGE_BINDING_LEVEL_EXT        := 0x8F3B
  GL_IMAGE_BINDING_LAYERED_EXT      := 0x8F3C
  GL_IMAGE_BINDING_LAYER_EXT        := 0x8F3D
  GL_IMAGE_BINDING_ACCESS_EXT       := 0x8F3E
  GL_IMAGE_1D_EXT                   := 0x904C
  GL_IMAGE_2D_EXT                   := 0x904D
  GL_IMAGE_3D_EXT                   := 0x904E
  GL_IMAGE_2D_RECT_EXT              := 0x904F
  GL_IMAGE_CUBE_EXT                 := 0x9050
  GL_IMAGE_BUFFER_EXT               := 0x9051
  GL_IMAGE_1D_ARRAY_EXT             := 0x9052
  GL_IMAGE_2D_ARRAY_EXT             := 0x9053
  GL_IMAGE_CUBE_MAP_ARRAY_EXT       := 0x9054
  GL_IMAGE_2D_MULTISAMPLE_EXT       := 0x9055
  GL_IMAGE_2D_MULTISAMPLE_ARRAY_EXT := 0x9056
  GL_INT_IMAGE_1D_EXT               := 0x9057
  GL_INT_IMAGE_2D_EXT               := 0x9058
  GL_INT_IMAGE_3D_EXT               := 0x9059
  GL_INT_IMAGE_2D_RECT_EXT          := 0x905A
  GL_INT_IMAGE_CUBE_EXT             := 0x905B
  GL_INT_IMAGE_BUFFER_EXT           := 0x905C
  GL_INT_IMAGE_1D_ARRAY_EXT         := 0x905D
  GL_INT_IMAGE_2D_ARRAY_EXT         := 0x905E
  GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT   := 0x905F
  GL_INT_IMAGE_2D_MULTISAMPLE_EXT   := 0x9060
  GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT := 0x9061
  GL_UNSIGNED_INT_IMAGE_1D_EXT      := 0x9062
  GL_UNSIGNED_INT_IMAGE_2D_EXT      := 0x9063
  GL_UNSIGNED_INT_IMAGE_3D_EXT      := 0x9064
  GL_UNSIGNED_INT_IMAGE_2D_RECT_EXT := 0x9065
  GL_UNSIGNED_INT_IMAGE_CUBE_EXT    := 0x9066
  GL_UNSIGNED_INT_IMAGE_BUFFER_EXT  := 0x9067
  GL_UNSIGNED_INT_IMAGE_1D_ARRAY_EXT := 0x9068
  GL_UNSIGNED_INT_IMAGE_2D_ARRAY_EXT := 0x9069
  GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT := 0x906A
  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT := 0x906B
  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT := 0x906C
  GL_MAX_IMAGE_SAMPLES_EXT          := 0x906D
  GL_IMAGE_BINDING_FORMAT_EXT       := 0x906E
  GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT := 0x00000001
  GL_ELEMENT_ARRAY_BARRIER_BIT_EXT  := 0x00000002
  GL_UNIFORM_BARRIER_BIT_EXT        := 0x00000004
  GL_TEXTURE_FETCH_BARRIER_BIT_EXT  := 0x00000008
  GL_SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT := 0x00000020
  GL_COMMAND_BARRIER_BIT_EXT        := 0x00000040
  GL_PIXEL_BUFFER_BARRIER_BIT_EXT   := 0x00000080
  GL_TEXTURE_UPDATE_BARRIER_BIT_EXT := 0x00000100
  GL_BUFFER_UPDATE_BARRIER_BIT_EXT  := 0x00000200
  GL_FRAMEBUFFER_BARRIER_BIT_EXT    := 0x00000400
  GL_TRANSFORM_FEEDBACK_BARRIER_BIT_EXT := 0x00000800
  GL_ATOMIC_COUNTER_BARRIER_BIT_EXT := 0x00001000
  GL_ALL_BARRIER_BITS_EXT           := 0xFFFFFFFF
}

if (!GL_EXT_vertex_attrib_64bit)
{
  ;reuse GL_DOUBLE
  GL_DOUBLE_VEC2_EXT                := 0x8FFC
  GL_DOUBLE_VEC3_EXT                := 0x8FFD
  GL_DOUBLE_VEC4_EXT                := 0x8FFE
  GL_DOUBLE_MAT2_EXT                := 0x8F46
  GL_DOUBLE_MAT3_EXT                := 0x8F47
  GL_DOUBLE_MAT4_EXT                := 0x8F48
  GL_DOUBLE_MAT2x3_EXT              := 0x8F49
  GL_DOUBLE_MAT2x4_EXT              := 0x8F4A
  GL_DOUBLE_MAT3x2_EXT              := 0x8F4B
  GL_DOUBLE_MAT3x4_EXT              := 0x8F4C
  GL_DOUBLE_MAT4x2_EXT              := 0x8F4D
  GL_DOUBLE_MAT4x3_EXT              := 0x8F4E
}

if (!GL_NV_gpu_program5)
{
  GL_MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV := 0x8E5A
  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET_NV := 0x8E5B
  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET_NV := 0x8E5C
  GL_FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV := 0x8E5D
  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV := 0x8E5E
  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV := 0x8E5F
  GL_MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV := 0x8F44
  GL_MAX_PROGRAM_SUBROUTINE_NUM_NV  := 0x8F45
}

if (!GL_NV_gpu_shader5)
{
  GL_INT64_NV                       := 0x140E
  GL_UNSIGNED_INT64_NV              := 0x140F
  GL_INT8_NV                        := 0x8FE0
  GL_INT8_VEC2_NV                   := 0x8FE1
  GL_INT8_VEC3_NV                   := 0x8FE2
  GL_INT8_VEC4_NV                   := 0x8FE3
  GL_INT16_NV                       := 0x8FE4
  GL_INT16_VEC2_NV                  := 0x8FE5
  GL_INT16_VEC3_NV                  := 0x8FE6
  GL_INT16_VEC4_NV                  := 0x8FE7
  GL_INT64_VEC2_NV                  := 0x8FE9
  GL_INT64_VEC3_NV                  := 0x8FEA
  GL_INT64_VEC4_NV                  := 0x8FEB
  GL_UNSIGNED_INT8_NV               := 0x8FEC
  GL_UNSIGNED_INT8_VEC2_NV          := 0x8FED
  GL_UNSIGNED_INT8_VEC3_NV          := 0x8FEE
  GL_UNSIGNED_INT8_VEC4_NV          := 0x8FEF
  GL_UNSIGNED_INT16_NV              := 0x8FF0
  GL_UNSIGNED_INT16_VEC2_NV         := 0x8FF1
  GL_UNSIGNED_INT16_VEC3_NV         := 0x8FF2
  GL_UNSIGNED_INT16_VEC4_NV         := 0x8FF3
  GL_UNSIGNED_INT64_VEC2_NV         := 0x8FF5
  GL_UNSIGNED_INT64_VEC3_NV         := 0x8FF6
  GL_UNSIGNED_INT64_VEC4_NV         := 0x8FF7
  GL_FLOAT16_NV                     := 0x8FF8
  GL_FLOAT16_VEC2_NV                := 0x8FF9
  GL_FLOAT16_VEC3_NV                := 0x8FFA
  GL_FLOAT16_VEC4_NV                := 0x8FFB
  ;reuse GL_PATCHES
}

if (!GL_NV_shader_buffer_store)
{
  GL_SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV := 0x00000010
  ;reuse GL_READ_WRITE
  ;reuse GL_WRITE_ONLY
}

if (!GL_NV_tessellation_program5)
{
  GL_MAX_PROGRAM_PATCH_ATTRIBS_NV   := 0x86D8
  GL_TESS_CONTROL_PROGRAM_NV        := 0x891E
  GL_TESS_EVALUATION_PROGRAM_NV     := 0x891F
  GL_TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV := 0x8C74
  GL_TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV := 0x8C75
}

if (!GL_NV_vertex_attrib_integer_64bit)
{
  ;reuse GL_INT64_NV
  ;reuse GL_UNSIGNED_INT64_NV
}

if (!GL_NV_multisample_coverage)
{
  GL_COVERAGE_SAMPLES_NV            := 0x80A9
  GL_COLOR_SAMPLES_NV               := 0x8E20
}

if (!GL_AMD_name_gen_delete)
{
  GL_DATA_BUFFER_AMD                := 0x9151
  GL_PERFORMANCE_MONITOR_AMD        := 0x9152
  GL_QUERY_OBJECT_AMD               := 0x9153
  GL_VERTEX_ARRAY_OBJECT_AMD        := 0x9154
  GL_SAMPLER_OBJECT_AMD             := 0x9155
}

if (!GL_AMD_debug_output)
{
  GL_MAX_DEBUG_LOGGED_MESSAGES_AMD  := 0x9144
  GL_DEBUG_LOGGED_MESSAGES_AMD      := 0x9145
  GL_DEBUG_SEVERITY_HIGH_AMD        := 0x9146
  GL_DEBUG_SEVERITY_MEDIUM_AMD      := 0x9147
  GL_DEBUG_SEVERITY_LOW_AMD         := 0x9148
  GL_DEBUG_CATEGORY_API_ERROR_AMD   := 0x9149
  GL_DEBUG_CATEGORY_WINDOW_SYSTEM_AMD := 0x914A
  GL_DEBUG_CATEGORY_DEPRECATION_AMD := 0x914B
  GL_DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD := 0x914C
  GL_DEBUG_CATEGORY_PERFORMANCE_AMD := 0x914D
  GL_DEBUG_CATEGORY_SHADER_COMPILER_AMD := 0x914E
  GL_DEBUG_CATEGORY_APPLICATION_AMD := 0x914F
  GL_DEBUG_CATEGORY_OTHER_AMD       := 0x9150
}

if (!GL_NV_vdpau_interop)
{
  GL_SURFACE_STATE_NV               := 0x86EB
  GL_SURFACE_REGISTERED_NV          := 0x86FD
  GL_SURFACE_MAPPED_NV              := 0x8700
  GL_WRITE_DISCARD_NV               := 0x88BE
}

if (!GL_AMD_transform_feedback3_lines_triangles)
{
}

if (!GL_AMD_depth_clamp_separate)
{
  GL_DEPTH_CLAMP_NEAR_AMD           := 0x901E
  GL_DEPTH_CLAMP_FAR_AMD            := 0x901F
}

if (!GL_EXT_texture_sRGB_decode)
{
  GL_TEXTURE_SRGB_DECODE_EXT        := 0x8A48
  GL_DECODE_EXT                     := 0x8A49
  GL_SKIP_DECODE_EXT                := 0x8A4A
}


;*************************************************************

if (!GL_VERSION_2_0)
{
  ;GL type for program/shader text
  GLchar := "char"
}

if (!GL_VERSION_1_5)
{
  ;GL types for handling large vertex buffer objects
  GLintptr := "int*"
  GLsizeiptr := "int*"
}

if (!GL_ARB_vertex_buffer_object)
{
  ;GL types for handling large vertex buffer objects
  GLintptrARB := "int*"
  GLsizeiptrARB := "int*"
}

if (!GL_ARB_shader_objects)
{
  ;GL types for program/shader text and shader object handles
  GLcharARB := "char"
  GLhandleARB := "uint"
}

;GL type for "half" precision (s10e5) float data in host memory
if (!GL_ARB_half_float_pixel)
{
  GLhalfARB := "ushort"
}

if (!GL_NV_half_float)
{
  GLhalfNV := "ushort"
}

if (!GLEXT_64_TYPES_DEFINED)
{
  ;This code block is duplicated in glxext.h, so must be protected
  GLEXT_64_TYPES_DEFINED := 1
  ;Define int32_t, int64_t, and uint64_t types for UST/MSC
  ;(as used in the GL_EXT_timer_query extension).
  int64_t := "int64"
  uint64_t := "uint64"
  int32_t := "int"
}

if (!GL_EXT_timer_query)
{
  GLint64EXT := int64_t
  GLuint64EXT := uint64_t
}

if (!GL_ARB_sync)
{
  GLint64 := int64_t
  GLuint64 := uint64_t
  GLsync := GLptr
}

if (!GL_ARB_cl_event)
{
  ;These incomplete types let us declare types compatible with OpenCL's cl_context and cl_event
  _cl_context := GLptr
  _cl_event := GLptr
}

glDebugProcARB(source, type, id, severity, length, message, userParam)
{
  global
  DllCall(GLDEBUGPROCARB, GLenum, source, GLenum, type, GLuint, id, GLenum, severity, GLsizei, length, (A_IsUnicode) ? "astr" : "str", message, GLptr, userParam)
}

glDebugProcAMD(id, category, severity, length, message, userParam)
{
  global
  DllCall(GLDEBUGPROCAMD, GLuint, id, GLenum, category, GLenum, severity, GLsizei, length, (A_IsUnicode) ? "astr" : "str", message, GLptr, userParam)
}

if (!GL_NV_vdpau_interop)
{
  GLvdpauSurfaceNV := GLintptr
}



if (!GL_VERSION_1_2)
{
  GL_VERSION_1_2 := 1
}

glBlendColor(red, green, blue, alpha)
{
  global
  DllCall(PFNGLBLENDCOLORPROC, GLclampf, red, GLclampf, green, GLclampf, blue, GLclampf, alpha)
}

glBlendEquation(mode)
{
  global
  DllCall(PFNGLBLENDEQUATIONPROC, GLenum, mode)
}

glDrawRangeElements(mode, start, end, count, type, indices)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTSPROC, GLenum, mode, GLuint, start, GLuint, end, GLsizei, count, GLenum, type, GLptr, indices)
}

glTexImage3D(target, level, internalformat, width, height, depth, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXIMAGE3DPROC, GLenum, target, GLint, level, GLint, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE3DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLenum, type, GLptr, pixels)
}

glCopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE3DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}


if (!GL_VERSION_1_2_DEPRECATED)
{
  GL_VERSION_1_2_DEPRECATED := 1
}

glColorTable(target, internalformat, width, format, type, table)
{
  global
  DllCall(PFNGLCOLORTABLEPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLenum, format, GLenum, type, GLptr, table)
}

glColorTableParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLCOLORTABLEPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glColorTableParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLCOLORTABLEPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glCopyColorTable(target, internalformat, x, y, width)
{
  global
  DllCall(PFNGLCOPYCOLORTABLEPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width)
}

glGetColorTable(target, format, type, table)
{
  global
  DllCall(PFNGLGETCOLORTABLEPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, table)
}

glGetColorTableParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetColorTableParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glColorSubTable(target, start, count, format, type, data)
{
  global
  DllCall(PFNGLCOLORSUBTABLEPROC, GLenum, target, GLsizei, start, GLsizei, count, GLenum, format, GLenum, type, GLptr, data)
}

glCopyColorSubTable(target, start, x, y, width)
{
  global
  DllCall(PFNGLCOPYCOLORSUBTABLEPROC, GLenum, target, GLsizei, start, GLint, x, GLint, y, GLsizei, width)
}

glConvolutionFilter1D(target, internalformat, width, format, type, image)
{
  global
  DllCall(PFNGLCONVOLUTIONFILTER1DPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLenum, format, GLenum, type, GLptr, image)
}

glConvolutionFilter2D(target, internalformat, width, height, format, type, image)
{
  global
  DllCall(PFNGLCONVOLUTIONFILTER2DPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, image)
}

glConvolutionParameterf(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERFPROC, GLenum, target, GLenum, pname, GLfloat, params)
}

glConvolutionParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glConvolutionParameteri(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERIPROC, GLenum, target, GLenum, pname, GLint, params)
}

glConvolutionParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glCopyConvolutionFilter1D(target, internalformat, x, y, width)
{
  global
  DllCall(PFNGLCOPYCONVOLUTIONFILTER1DPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width)
}

glCopyConvolutionFilter2D(target, internalformat, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYCONVOLUTIONFILTER2DPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glGetConvolutionFilter(target, format, type, image)
{
  global
  DllCall(PFNGLGETCONVOLUTIONFILTERPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, image)
}

glGetConvolutionParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLGETCONVOLUTIONPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetConvolutionParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETCONVOLUTIONPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetSeparableFilter(target, format, type, row, column, span)
{
  global
  DllCall(PFNGLGETSEPARABLEFILTERPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, row, GLptr, column, GLptr, span)
}

glSeparableFilter2D(target, internalformat, width, height, format, type, row, column)
{
  global
  DllCall(PFNGLSEPARABLEFILTER2DPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, row, GLptr, column)
}

glGetHistogram(target, reset, format, type, values)
{
  global
  DllCall(PFNGLGETHISTOGRAMPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLptr, values)
}

glGetHistogramParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLGETHISTOGRAMPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetHistogramParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETHISTOGRAMPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMinmax(target, reset, format, type, values)
{
  global
  DllCall(PFNGLGETMINMAXPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLptr, values)
}

glGetMinmaxParameterfv(target, pname, params)
{
  global
  DllCall(PFNGLGETMINMAXPARAMETERFVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMinmaxParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETMINMAXPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glHistogram(target, width, internalformat, sink)
{
  global
  DllCall(PFNGLHISTOGRAMPROC, GLenum, target, GLsizei, width, GLenum, internalformat, GLboolean, sink)
}

glMinmax(target, internalformat, sink)
{
  global
  DllCall(PFNGLMINMAXPROC, GLenum, target, GLenum, internalformat, GLboolean, sink)
}

glResetHistogram(target)
{
  global
  DllCall(PFNGLRESETHISTOGRAMPROC, GLenum, target)
}

glResetMinmax(target)
{
  global
  DllCall(PFNGLRESETMINMAXPROC, GLenum, target)
}


if (!GL_VERSION_1_3)
{
  GL_VERSION_1_3 := 1
}

glActiveTexture(texture)
{
  global
  DllCall(PFNGLACTIVETEXTUREPROC, GLenum, texture)
}

glSampleCoverage(value, invert)
{
  global
  DllCall(PFNGLSAMPLECOVERAGEPROC, GLclampf, value, GLboolean, invert)
}

glCompressedTexImage3D(target, level, internalformat, width, height, depth, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE3DPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE2DPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexImage1D(target, level, internalformat, width, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE1DPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage1D(target, level, xoffset, width, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glGetCompressedTexImage(target, level, img)
{
  global
  DllCall(PFNGLGETCOMPRESSEDTEXIMAGEPROC, GLenum, target, GLint, level, GLptr, img)
}


if (!GL_VERSION_1_3_DEPRECATED)
{
  GL_VERSION_1_3_DEPRECATED := 1
}

glClientActiveTexture(texture)
{
  global
  DllCall(PFNGLCLIENTACTIVETEXTUREPROC, GLenum, texture)
}

glMultiTexCoord1d(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1DPROC, GLenum, target, GLdouble, s)
}

glMultiTexCoord1dv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1DVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1f(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1FPROC, GLenum, target, GLfloat, s)
}

glMultiTexCoord1fv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1FVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1i(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1IPROC, GLenum, target, GLint, s)
}

glMultiTexCoord1iv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1IVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1s(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1SPROC, GLenum, target, GLshort, s)
}

glMultiTexCoord1sv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1SVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2d(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2DPROC, GLenum, target, GLdouble, s, GLdouble, t)
}

glMultiTexCoord2dv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2DVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2f(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2FPROC, GLenum, target, GLfloat, s, GLfloat, t)
}

glMultiTexCoord2fv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2FVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2i(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2IPROC, GLenum, target, GLint, s, GLint, t)
}

glMultiTexCoord2iv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2IVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2s(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2SPROC, GLenum, target, GLshort, s, GLshort, t)
}

glMultiTexCoord2sv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2SVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3d(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3DPROC, GLenum, target, GLdouble, s, GLdouble, t, GLdouble, r)
}

glMultiTexCoord3dv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3DVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3f(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3FPROC, GLenum, target, GLfloat, s, GLfloat, t, GLfloat, r)
}

glMultiTexCoord3fv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3FVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3i(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3IPROC, GLenum, target, GLint, s, GLint, t, GLint, r)
}

glMultiTexCoord3iv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3IVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3s(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3SPROC, GLenum, target, GLshort, s, GLshort, t, GLshort, r)
}

glMultiTexCoord3sv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3SVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4d(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4DPROC, GLenum, target, GLdouble, s, GLdouble, t, GLdouble, r, GLdouble, q)
}

glMultiTexCoord4dv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4DVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4f(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4FPROC, GLenum, target, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, q)
}

glMultiTexCoord4fv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4FVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4i(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4IPROC, GLenum, target, GLint, s, GLint, t, GLint, r, GLint, q)
}

glMultiTexCoord4iv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4IVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4s(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4SPROC, GLenum, target, GLshort, s, GLshort, t, GLshort, r, GLshort, q)
}

glMultiTexCoord4sv(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4SVPROC, GLenum, target, GLptr, v)
}

glLoadTransposeMatrixf(m)
{
  global
  DllCall(PFNGLLOADTRANSPOSEMATRIXFPROC, GLptr, m)
}

glLoadTransposeMatrixd(m)
{
  global
  DllCall(PFNGLLOADTRANSPOSEMATRIXDPROC, GLptr, m)
}

glMultTransposeMatrixf(m)
{
  global
  DllCall(PFNGLMULTTRANSPOSEMATRIXFPROC, GLptr, m)
}

glMultTransposeMatrixd(m)
{
  global
  DllCall(PFNGLMULTTRANSPOSEMATRIXDPROC, GLptr, m)
}


if (!GL_VERSION_1_4)
{
  GL_VERSION_1_4 := 1
}

glBlendFuncSeparate(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEPROC, GLenum, sfactorRGB, GLenum, dfactorRGB, GLenum, sfactorAlpha, GLenum, dfactorAlpha)
}

glMultiDrawArrays(mode, first, count, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWARRAYSPROC, GLenum, mode, GLptr, first, GLptr, count, GLsizei, primcount)
}

glMultiDrawElements(mode, count, type, indices, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWELEMENTSPROC, GLenum, mode, GLptr, count, GLenum, type, GLptr, indices, GLsizei, primcount)
}

glPointParameterf(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERFPROC, GLenum, pname, GLfloat, param)
}

glPointParameterfv(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERFVPROC, GLenum, pname, GLptr, params)
}

glPointParameteri(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERIPROC, GLenum, pname, GLint, param)
}

glPointParameteriv(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERIVPROC, GLenum, pname, GLptr, params)
}


if (!GL_VERSION_1_4_DEPRECATED)
{
  GL_VERSION_1_4_DEPRECATED := 1
}

glFogCoordf(coord)
{
  global
  DllCall(PFNGLFOGCOORDFPROC, GLfloat, coord)
}

glFogCoordfv(coord)
{
  global
  DllCall(PFNGLFOGCOORDFVPROC, GLptr, coord)
}

glFogCoordd(coord)
{
  global
  DllCall(PFNGLFOGCOORDDPROC, GLdouble, coord)
}

glFogCoorddv(coord)
{
  global
  DllCall(PFNGLFOGCOORDDVPROC, GLptr, coord)
}

glFogCoordPointer(type, stride, pointer)
{
  global
  DllCall(PFNGLFOGCOORDPOINTERPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glSecondaryColor3b(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3BPROC, GLbyte, red, GLbyte, green, GLbyte, blue)
}

glSecondaryColor3bv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3BVPROC, GLptr, v)
}

glSecondaryColor3d(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3DPROC, GLdouble, red, GLdouble, green, GLdouble, blue)
}

glSecondaryColor3dv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3DVPROC, GLptr, v)
}

glSecondaryColor3f(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3FPROC, GLfloat, red, GLfloat, green, GLfloat, blue)
}

glSecondaryColor3fv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3FVPROC, GLptr, v)
}

glSecondaryColor3i(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3IPROC, GLint, red, GLint, green, GLint, blue)
}

glSecondaryColor3iv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3IVPROC, GLptr, v)
}

glSecondaryColor3s(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3SPROC, GLshort, red, GLshort, green, GLshort, blue)
}

glSecondaryColor3sv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3SVPROC, GLptr, v)
}

glSecondaryColor3ub(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UBPROC, GLubyte, red, GLubyte, green, GLubyte, blue)
}

glSecondaryColor3ubv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UBVPROC, GLptr, v)
}

glSecondaryColor3ui(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UIPROC, GLuint, red, GLuint, green, GLuint, blue)
}

glSecondaryColor3uiv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UIVPROC, GLptr, v)
}

glSecondaryColor3us(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3USPROC, GLushort, red, GLushort, green, GLushort, blue)
}

glSecondaryColor3usv(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3USVPROC, GLptr, v)
}

glSecondaryColorPointer(size, type, stride, pointer)
{
  global
  DllCall(PFNGLSECONDARYCOLORPOINTERPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glWindowPos2d(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2DPROC, GLdouble, x, GLdouble, y)
}

glWindowPos2dv(v)
{
  global
  DllCall(PFNGLWINDOWPOS2DVPROC, GLptr, v)
}

glWindowPos2f(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2FPROC, GLfloat, x, GLfloat, y)
}

glWindowPos2fv(v)
{
  global
  DllCall(PFNGLWINDOWPOS2FVPROC, GLptr, v)
}

glWindowPos2i(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2IPROC, GLint, x, GLint, y)
}

glWindowPos2iv(v)
{
  global
  DllCall(PFNGLWINDOWPOS2IVPROC, GLptr, v)
}

glWindowPos2s(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2SPROC, GLshort, x, GLshort, y)
}

glWindowPos2sv(v)
{
  global
  DllCall(PFNGLWINDOWPOS2SVPROC, GLptr, v)
}

glWindowPos3d(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3DPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glWindowPos3dv(v)
{
  global
  DllCall(PFNGLWINDOWPOS3DVPROC, GLptr, v)
}

glWindowPos3f(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3FPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glWindowPos3fv(v)
{
  global
  DllCall(PFNGLWINDOWPOS3FVPROC, GLptr, v)
}

glWindowPos3i(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3IPROC, GLint, x, GLint, y, GLint, z)
}

glWindowPos3iv(v)
{
  global
  DllCall(PFNGLWINDOWPOS3IVPROC, GLptr, v)
}

glWindowPos3s(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3SPROC, GLshort, x, GLshort, y, GLshort, z)
}

glWindowPos3sv(v)
{
  global
  DllCall(PFNGLWINDOWPOS3SVPROC, GLptr, v)
}


if (!GL_VERSION_1_5)
{
  GL_VERSION_1_5 := 1
}

glGenQueries(n, ids)
{
  global
  DllCall(PFNGLGENQUERIESPROC, GLsizei, n, GLptr, ids)
}

glDeleteQueries(n, ids)
{
  global
  DllCall(PFNGLDELETEQUERIESPROC, GLsizei, n, GLptr, ids)
}

glIsQuery(id)
{
  global
  return DllCall(PFNGLISQUERYPROC, GLuint, id, GLboolean)
}

glBeginQuery(target, id)
{
  global
  DllCall(PFNGLBEGINQUERYPROC, GLenum, target, GLuint, id)
}

glEndQuery(target)
{
  global
  DllCall(PFNGLENDQUERYPROC, GLenum, target)
}

glGetQueryiv(target, pname, params)
{
  global
  DllCall(PFNGLGETQUERYIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetQueryObjectiv(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTIVPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetQueryObjectuiv(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTUIVPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glBindBuffer(target, buffer)
{
  global
  DllCall(PFNGLBINDBUFFERPROC, GLenum, target, GLuint, buffer)
}

glDeleteBuffers(n, buffers)
{
  global
  DllCall(PFNGLDELETEBUFFERSPROC, GLsizei, n, GLptr, buffers)
}

glGenBuffers(n, buffers)
{
  global
  DllCall(PFNGLGENBUFFERSPROC, GLsizei, n, GLptr, buffers)
}

glIsBuffer(buffer)
{
  global
  return DllCall(PFNGLISBUFFERPROC, GLuint, buffer, GLboolean)
}

glBufferData(target, size, data, usage)
{
  global
  DllCall(PFNGLBUFFERDATAPROC, GLenum, target, GLsizeiptr, size, GLptr, data, GLenum, usage)
}

glBufferSubData(target, offset, size, data)
{
  global
  DllCall(PFNGLBUFFERSUBDATAPROC, GLenum, target, GLintptr, offset, GLsizeiptr, size, GLptr, data)
}

glGetBufferSubData(target, offset, size, data)
{
  global
  DllCall(PFNGLGETBUFFERSUBDATAPROC, GLenum, target, GLintptr, offset, GLsizeiptr, size, GLptr, data)
}

glMapBuffer(target, access)
{
  global
  return DllCall(PFNGLMAPBUFFERPROC, GLenum, target, GLenum, access, GLptr)
}

glUnmapBuffer(target)
{
  global
  return DllCall(PFNGLUNMAPBUFFERPROC, GLuint, target, GLboolean)
}

glGetBufferParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetBufferPointerv(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPOINTERVPROC, GLenum, target, GLenum, pname, GLptr, params)
}


if (!GL_VERSION_2_0)
{
  GL_VERSION_2_0 := 1
}

glBlendEquationSeparate(modeRGB, modeAlpha)
{
  global
  DllCall(PFNGLBLENDEQUATIONSEPARATEPROC, GLenum, modeRGB, GLenum, modeAlpha)
}

glDrawBuffers(n, bufs)
{
  global
  DllCall(PFNGLDRAWBUFFERSPROC, GLsizei, n, GLptr, bufs)
}

glStencilOpSeparate(face, sfail, dpfail, dppass)
{
  global
  DllCall(PFNGLSTENCILOPSEPARATEPROC, GLenum, face, GLenum, sfail, GLenum, dpfail, GLenum, dppass)
}

glStencilFuncSeparate(face, func, ref, mask)
{
  global
  DllCall(PFNGLSTENCILFUNCSEPARATEPROC, GLenum, face, GLenum, func, GLint, ref, GLuint, mask)
}

glStencilMaskSeparate(face, mask)
{
  global
  DllCall(PFNGLSTENCILMASKSEPARATEPROC, GLenum, face, GLuint, mask)
}

glAttachShader(program, shader)
{
  global
  DllCall(PFNGLATTACHSHADERPROC, GLuint, program, GLuint, shader)
}

glBindAttribLocation(program, index, name)
{
  global
  DllCall(PFNGLBINDATTRIBLOCATIONPROC, GLuint, program, GLuint, index, GLptr, name)
}

glCompileShader(shader)
{
  global
  DllCall(PFNGLCOMPILESHADERPROC, GLuint, shader)
}

glCreateProgram()
{
  global
  return DllCall(PFNGLCREATEPROGRAMPROC, GLuint)
}

glCreateShader(type)
{
  global
  return DllCall(PFNGLCREATESHADERPROC, GLenum, type, GLuint)
}

glDeleteProgram(program)
{
  global
  DllCall(PFNGLDELETEPROGRAMPROC, GLuint, program)
}

glDeleteShader(shader)
{
  global
  DllCall(PFNGLDELETESHADERPROC, GLuint, shader)
}

glDetachShader(program, shader)
{
  global
  DllCall(PFNGLDETACHSHADERPROC, GLuint, program, GLuint, shader)
}

glDisableVertexAttribArray(index)
{
  global
  DllCall(PFNGLDISABLEVERTEXATTRIBARRAYPROC, GLuint, index)
}

glEnableVertexAttribArray(index)
{
  global
  DllCall(PFNGLENABLEVERTEXATTRIBARRAYPROC, GLuint, index)
}

glGetActiveAttrib(program, index, bufSize, length, size, type, name)
{
  global
  DllCall(PFNGLGETACTIVEATTRIBPROC, GLuint, program, GLuint, index, GLsizei, bufSize, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glGetActiveUniform(program, index, bufSize, length, size, type, name)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMPROC, GLuint, program, GLuint, index, GLsizei, bufSize, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glGetAttachedShaders(program, maxCount, count, obj)
{
  global
  DllCall(PFNGLGETATTACHEDSHADERSPROC, GLuint, program, GLsizei, maxCount, GLptr, count, GLptr, obj)
}

glGetAttribLocation(program, name)
{                                
  global                                               
  return DllCall(PFNGLGETATTRIBLOCATIONPROC, GLuint, program, GLastr, name, GLint)
}

glGetProgramiv(program, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMIVPROC, GLuint, program, GLenum, pname, GLptr, params)
}

glGetProgramInfoLog(program, bufSize, length, infoLog)
{
  global
  DllCall(PFNGLGETPROGRAMINFOLOGPROC, GLuint, program, GLsizei, bufSize, GLptr, length, GLptr, infoLog)
}

glGetShaderiv(shader, pname, params)
{
  global
  DllCall(PFNGLGETSHADERIVPROC, GLuint, shader, GLenum, pname, GLptr, params)
}

glGetShaderInfoLog(shader, bufSize, length, infoLog)
{
  global
  DllCall(PFNGLGETSHADERINFOLOGPROC, GLuint, shader, GLsizei, bufSize, GLptr, length, GLptr, infoLog)
}

glGetShaderSource(shader, bufSize, length, source)
{
  global
  DllCall(PFNGLGETSHADERSOURCEPROC, GLuint, shader, GLsizei, bufSize, GLptr, length, GLptr, source)
}

glGetUniformLocation(program, name)
{
  global
  return DllCall(PFNGLGETUNIFORMLOCATIONPROC, GLuint, program, GLastr, name, GLint)
}

glGetUniformfv(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMFVPROC, GLuint, program, GLint, location, GLptr, params)
}

glGetUniformiv(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMIVPROC, GLuint, program, GLint, location, GLptr, params)
}

glGetVertexAttribdv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBDVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribfv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBFVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribiv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribPointerv(index, pname, pointer)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBPOINTERVPROC, GLuint, index, GLenum, pname, GLptr, pointer)
}

glIsProgram(program)
{
  global
  return DllCall(PFNGLISPROGRAMPROC, GLuint, program, GLboolean)
}

glIsShader(program)
{
  global
  return DllCall(PFNGLISSHADERPROC, GLuint, program, GLboolean)
}

glLinkProgram(program)
{
  global
  DllCall(PFNGLLINKPROGRAMPROC, GLuint, program)
}

glShaderSource(shader, count, string, length)
{
  global
  DllCall(PFNGLSHADERSOURCEPROC, GLuint, shader, GLsizei, count, GLptr, string, GLptr, length)
}

glUseProgram(program)
{
  global
  DllCall(PFNGLUSEPROGRAMPROC, GLuint, program)
}

glUniform1f(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1FPROC, GLint, location, GLfloat, v0)
}

glUniform2f(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2FPROC, GLint, location, GLfloat, v0, GLfloat, v1)
}

glUniform3f(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3FPROC, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2)
}

glUniform4f(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4FPROC, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2, GLfloat, v3)
}

glUniform1i(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1IPROC, GLint, location, GLint, v0)
}

glUniform2i(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2IPROC, GLint, location, GLint, v0, GLint, v1)
}

glUniform3i(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3IPROC, GLint, location, GLint, v0, GLint, v1, GLint, v2)
}

glUniform4i(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4IPROC, GLint, location, GLint, v0, GLint, v1, GLint, v2, GLint, v3)
}

glUniform1fv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1FVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2fv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2FVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3fv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3FVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4fv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4FVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform1iv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1IVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2iv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2IVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3iv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3IVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4iv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4IVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniformMatrix2fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glValidateProgram(program)
{
  global
  DllCall(PFNGLVALIDATEPROGRAMPROC, GLuint, program)
}

glVertexAttrib1d(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DPROC, GLuint, index, GLdouble, x)
}

glVertexAttrib1dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1f(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FPROC, GLuint, index, GLfloat, x)
}

glVertexAttrib1fv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1s(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SPROC, GLuint, index, GLshort, x)
}

glVertexAttrib1sv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2d(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DPROC, GLuint, index, GLdouble, x, GLdouble, y)
}

glVertexAttrib2dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2f(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FPROC, GLuint, index, GLfloat, x, GLfloat, y)
}

glVertexAttrib2fv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2s(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SPROC, GLuint, index, GLshort, x, GLshort, y)
}

glVertexAttrib2sv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3d(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexAttrib3dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3f(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertexAttrib3fv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3s(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z)
}

glVertexAttrib3sv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Nbv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NBVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Niv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NIVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Nsv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NSVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Nub(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUBPROC, GLuint, index, GLubyte, x, GLubyte, y, GLubyte, z, GLubyte, w)
}

glVertexAttrib4Nubv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUBVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Nuiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUIVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4Nusv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUSVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4bv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4BVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4d(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexAttrib4dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4f(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glVertexAttrib4fv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4iv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4IVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4s(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glVertexAttrib4sv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4ubv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UBVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4uiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UIVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4usv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4USVPROC, GLuint, index, GLptr, v)
}

glVertexAttribPointer(index, size, type, normalized, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBPOINTERPROC, GLuint, index, GLint, size, GLenum, type, GLboolean, normalized, GLsizei, stride, GLptr, pointer)
}


if (!GL_VERSION_2_1)
{
  GL_VERSION_2_1 := 1
}

glUniformMatrix2x3fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2X3FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3x2fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3X2FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix2x4fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2X4FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4x2fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4X2FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3x4fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3X4FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4x3fv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4X3FVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}


if (!GL_VERSION_3_0)
{
  GL_VERSION_3_0 := 1
  ;OpenGL 3.0 also reuses entry points from these extensions:
  ;ARB_framebuffer_object
  ;ARB_map_buffer_range
  ;ARB_vertex_array_object
}

glColorMaski(index, r, g, b, a)
{
  global
  DllCall(PFNGLCOLORMASKIPROC, GLuint, index, GLboolean, r, GLboolean, g, GLboolean, b, GLboolean, a)
}

glGetBooleani_v(target, index, data)
{
  global
  DllCall(PFNGLGETBOOLEANI_VPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetIntegeri_v(target, index, data)
{
  global
  DllCall(PFNGLGETINTEGERI_VPROC, GLenum, target, GLuint, index, GLptr, data)
}

glEnablei(target, index)
{
  global
  DllCall(PFNGLENABLEIPROC, GLenum, target, GLuint, index)
}

glDisablei(target, index)
{
  global
  DllCall(PFNGLDISABLEIPROC, GLenum, target, GLuint, index)
}

glIsEnabledi(target, index)
{
  global
  return DllCall(PFNGLISENABLEDIPROC, GLenum, target, GLuint, index, GLboolean)
}

glBeginTransformFeedback(primitiveMode)
{
  global
  DllCall(PFNGLBEGINTRANSFORMFEEDBACKPROC, GLenum, primitiveMode)
}

glEndTransformFeedback()
{
  global
  DllCall(PFNGLENDTRANSFORMFEEDBACKPROC)
}

glBindBufferRange(target, index, buffer, offset, size)
{
  global
  DllCall(PFNGLBINDBUFFERRANGEPROC, GLenum, target, GLuint, index, GLuint, buffer, GLintptr, offset, GLsizeiptr, size)
}

glBindBufferBase(target, index, buffer)
{
  global
  DllCall(PFNGLBINDBUFFERBASEPROC, GLenum, target, GLuint, index, GLuint, buffer)
}

glTransformFeedbackVaryings(program, count, varyings, bufferMode)
{
  global
  DllCall(PFNGLTRANSFORMFEEDBACKVARYINGSPROC, GLuint, program, GLsizei, count, GLastr, varyings, GLenum, bufferMode)
}

glGetTransformFeedbackVarying(program, index, bufSize, length, size, type, name)
{
  global
  DllCall(PFNGLGETTRANSFORMFEEDBACKVARYINGPROC, GLuint, program, GLuint, index, GLsizei, bufSize, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glClampColor(target, clamp)
{
  global
  DllCall(PFNGLCLAMPCOLORPROC, GLenum, target, GLenum, clamp)
}

glBeginConditionalRender(id, mode)
{
  global
  DllCall(PFNGLBEGINCONDITIONALRENDERPROC, GLuint, id, GLenum, mode)
}

glEndConditionalRender()
{
  global
  DllCall(PFNGLENDCONDITIONALRENDERPROC)
}

glVertexAttribIPointer(index, size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBIPOINTERPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glGetVertexAttribIiv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIIVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribIuiv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIUIVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glVertexAttribI1i(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1IPROC, GLuint, index, GLint, x)
}

glVertexAttribI2i(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2IPROC, GLuint, index, GLint, x, GLint, y)
}

glVertexAttribI3i(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3IPROC, GLuint, index, GLint, x, GLint, y, GLint, z)
}

glVertexAttribI4i(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4IPROC, GLuint, index, GLint, x, GLint, y, GLint, z, GLint, w)
}

glVertexAttribI1ui(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1UIPROC, GLuint, index, GLuint, x)
}

glVertexAttribI2ui(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2UIPROC, GLuint, index, GLuint, x, GLuint, y)
}

glVertexAttribI3ui(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3UIPROC, GLuint, index, GLuint, x, GLuint, y, GLuint, z)
}

glVertexAttribI4ui(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UIPROC, GLuint, index, GLuint, x, GLuint, y, GLuint, z, GLuint, w)
}

glVertexAttribI1iv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1IVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI2iv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2IVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI3iv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3IVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4iv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4IVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI1uiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1UIVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI2uiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2UIVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI3uiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3UIVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4uiv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UIVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4bv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4BVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4sv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4SVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4ubv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UBVPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4usv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4USVPROC, GLuint, index, GLptr, v)
}

glGetUniformuiv(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMUIVPROC, GLuint, program, GLint, location, GLptr, params)
}

glBindFragDataLocation(program, color, name)
{
  global
  DllCall(PFNGLBINDFRAGDATALOCATIONPROC, GLuint, program, GLuint, color, GLptr, name)
}

glGetFragDataLocation(program, name)
{
  global
  return DllCall(PFNGLGetFragDataLocationPROC, GLuint, program, GLptr, name, GLuint)
}

glUniform1ui(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1UIPROC, GLint, location, GLuint, v0)
}

glUniform2ui(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2UIPROC, GLint, location, GLuint, v0, GLuint, v1)
}

glUniform3ui(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3UIPROC, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2)
}

glUniform4ui(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4UIPROC, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2, GLuint, v3)
}

glUniform1uiv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1UIVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2uiv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2UIVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3uiv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3UIVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4uiv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4UIVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glTexParameterIiv(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERIIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexParameterIuiv(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERIUIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexParameterIiv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERIIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexParameterIuiv(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERIUIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glClearBufferiv(buffer, drawbuffer, value)
{
  global
  DllCall(PFNGLCLEARBUFFERIVPROC, GLenum, buffer, GLint, drawbuffer, GLptr, value)
}

glClearBufferuiv(buffer, drawbuffer, value)
{
  global
  DllCall(PFNGLCLEARBUFFERUIVPROC, GLenum, buffer, GLint, drawbuffer, GLptr, value)
}

glClearBufferfv(buffer, drawbuffer, value)
{
  global
  DllCall(PFNGLCLEARBUFFERFVPROC, GLenum, buffer, GLint, drawbuffer, GLptr, value)
}

glClearBufferfi(buffer, drawbuffer, depth, stencil)
{
  global
  DllCall(PFNGLCLEARBUFFERFIPROC, GLenum, buffer, GLint, drawbuffer, GLfloat, depth, GLint, stencil)
}

glGetStringi(name, index)
{
  global
  return DllCall(PFNGLGETSTRINGIPROC, GLenum, name, GLuint, index, GLastr)
}

if (!GL_VERSION_3_1)
{
  GL_VERSION_3_1 := 1
  ;OpenGL 3.1 also reuses entry points from these extensions:
  ;ARB_copy_buffer
  ;ARB_uniform_buffer_object
}

glDrawArraysInstanced(mode, first, count, primcount)
{
  global
  DllCall(PFNGLDRAWARRAYSINSTANCEDPROC, GLenum, mode, GLint, first, GLsizei, count, GLsizei, primcount)
}

glDrawElementsInstanced(mode, count, type, indices, primcount)
{
  global
  DllCall(PFNGLDRAWELEMENTSINSTANCEDPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices, GLsizei, primcount)
}

glTexBuffer(target, internalformat, buffer)
{
  global
  DllCall(PFNGLTEXBUFFERPROC, GLenum, target, GLenum, internalformat, GLuint, buffer)
}

glPrimitiveRestartIndex(index)
{
  global
  DllCall(PFNGLPRIMITIVERESTARTINDEXPROC, GLuint, index)
}


if (!GL_VERSION_3_2)
{
  GL_VERSION_3_2 := 1
  ;OpenGL 3.2 also reuses entry points from these extensions:
  ;ARB_draw_elements_base_vertex
  ;ARB_provoking_vertex
  ;ARB_sync
  ;ARB_texture_multisample
}

glGetInteger64i_v(target, index, data)
{
  global
  DllCall(PFNGLGETINTEGER64I_VPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetBufferParameteri64v(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPARAMETERI64VPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glFramebufferTexture(target, attachment, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTUREPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level)
}


if (!GL_VERSION_3_3)
{
  GL_VERSION_3_3 := 1
  ;OpenGL 3.3 also reuses entry points from these extensions:
  ;ARB_blend_func_extended
  ;ARB_sampler_objects
  ;ARB_explicit_attrib_location, but it has none
  ;ARB_occlusion_query2 (no entry points)
  ;ARB_shader_bit_encoding (no entry points)
  ;ARB_texture_rgb10_a2ui (no entry points)
  ;ARB_texture_swizzle (no entry points)
  ;ARB_timer_query
  ;ARB_vertex_type_2_10_10_10_rev
}

glVertexAttribDivisor(index, divisor)
{
  global
  DllCall(PFNGLVERTEXATTRIBDIVISORPROC, GLuint, index, GLuint, divisor)
}


if (!GL_VERSION_4_0)
{
  GL_VERSION_4_0 := 1
  ;OpenGL 4.0 also reuses entry points from these extensions:
  ;ARB_texture_query_lod (no entry points)
  ;ARB_draw_indirect
  ;ARB_gpu_shader5 (no entry points)
  ;ARB_gpu_shader_fp64
  ;ARB_shader_subroutine
  ;ARB_tessellation_shader
  ;ARB_texture_buffer_object_rgb32 (no entry points)
  ;ARB_texture_cube_map_array (no entry points)
  ;ARB_texture_gather (no entry points)
  ;ARB_transform_feedback2
  ;ARB_transform_feedback3
}

glMinSampleShading(value)
{
  global
  DllCall(PFNGLMINSAMPLESHADINGPROC, GLclampf, value)
}

glBlendEquationi(buf, mode)
{
  global
  DllCall(PFNGLBLENDEQUATIONIPROC, GLuint, buf, GLenum, mode)
}

glBlendEquationSeparatei(buf, modeRGB, modeAlpha)
{
  global
  DllCall(PFNGLBLENDEQUATIONSEPARATEIPROC, GLuint, buf, GLenum, modeRGB, GLenum, modeAlpha)
}

glBlendFunci(buf, src, dst)
{
  global
  DllCall(PFNGLBLENDFUNCIPROC, GLuint, buf, GLenum, src, GLenum, dst)
}

glBlendFuncSeparatei(buf, srcRGB, dstRGB, srcAlpha, dstAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEIPROC, GLuint, buf, GLenum, srcRGB, GLenum, dstRGB, GLenum, srcAlpha, GLenum, dstAlpha)
}


if (!GL_VERSION_4_1)
{
  GL_VERSION_4_1 := 1
  ;OpenGL 4.1 also reuses entry points from these extensions:
  ;ARB_ES2_compatibility
  ;ARB_get_program_binary
  ;ARB_separate_shader_objects
  ;ARB_shader_precision (no entry points)
  ;ARB_vertex_attrib_64bit
  ;ARB_viewport_array
}

GL_ARB_multitexture := 1

glActiveTextureARB(texture)
{
  global
  DllCall(PFNGLACTIVETEXTUREARBPROC, GLenum, texture)
}

glClientActiveTextureARB(texture)
{
  global
  DllCall(PFNGLCLIENTACTIVETEXTUREARBPROC, GLenum, texture)
}

glMultiTexCoord1dARB(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1DARBPROC, GLenum, target, GLdouble, s)
}

glMultiTexCoord1dvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1DVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1fARB(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1FARBPROC, GLenum, target, GLfloat, s)
}

glMultiTexCoord1fvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1FVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1iARB(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1IARBPROC, GLenum, target, GLint, s)
}

glMultiTexCoord1ivARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1IVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord1sARB(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1SARBPROC, GLenum, target, GLshort, s)
}

glMultiTexCoord1svARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1SVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2dARB(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2DARBPROC, GLenum, target, GLdouble, s, GLdouble, t)
}

glMultiTexCoord2dvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2DVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2fARB(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2FARBPROC, GLenum, target, GLfloat, s, GLfloat, t)
}

glMultiTexCoord2fvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2FVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2iARB(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2IARBPROC, GLenum, target, GLint, s, GLint, t)
}

glMultiTexCoord2ivARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2IVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2sARB(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2SARBPROC, GLenum, target, GLshort, s, GLshort, t)
}

glMultiTexCoord2svARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2SVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3dARB(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3DARBPROC, GLenum, target, GLdouble, s, GLdouble, t, GLdouble, r)
}

glMultiTexCoord3dvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3DVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3fARB(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3FARBPROC, GLenum, target, GLfloat, s, GLfloat, t, GLfloat, r)
}

glMultiTexCoord3fvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3FVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3iARB(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3IARBPROC, GLenum, target, GLint, s, GLint, t, GLint, r)
}

glMultiTexCoord3ivARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3IVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3sARB(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3SARBPROC, GLenum, target, GLshort, s, GLshort, t, GLshort, r)
}

glMultiTexCoord3svARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3SVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4dARB(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4DARBPROC, GLenum, target, GLdouble, s, GLdouble, t, GLdouble, r, GLdouble, q)
}

glMultiTexCoord4dvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4DVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4fARB(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4FARBPROC, GLenum, target, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, q)
}

glMultiTexCoord4fvARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4FVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4iARB(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4IARBPROC, GLenum, target, GLint, s, GLint, t, GLint, r, GLint, q)
}

glMultiTexCoord4ivARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4IVARBPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4sARB(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4SARBPROC, GLenum, target, GLshort, s, GLshort, t, GLshort, r, GLshort, q)
}

glMultiTexCoord4svARB(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4SVARBPROC, GLenum, target, GLptr, v)
}


GL_ARB_transpose_matrix := 1

glLoadTransposeMatrixfARB(m)
{
  global
  DllCall(PFNGLLOADTRANSPOSEMATRIXFARBPROC, GLptr, m)
}

glLoadTransposeMatrixdARB(m)
{
  global
  DllCall(PFNGLLOADTRANSPOSEMATRIXDARBPROC, GLptr, m)
}

glMultTransposeMatrixfARB(m)
{
  global
  DllCall(PFNGLMULTTRANSPOSEMATRIXFARBPROC, GLptr, m)
}

glMultTransposeMatrixdARB(m)
{
  global
  DllCall(PFNGLMULTTRANSPOSEMATRIXDARBPROC, GLptr, m)
}


GL_ARB_multisample := 1

glSampleCoverageARB(value, invert)
{
  global
  DllCall(PFNGLSAMPLECOVERAGEARBPROC, GLclampf, value, GLboolean, invert)
}


GL_ARB_texture_env_add := 1
GL_ARB_texture_cube_map := 1
GL_ARB_texture_compression := 1

glCompressedTexImage3DARB(target, level, internalformat, width, height, depth, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE3DARBPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexImage2DARB(target, level, internalformat, width, height, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE2DARBPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexImage1DARB(target, level, internalformat, width, border, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXIMAGE1DARBPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage3DARB(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage2DARB(target, level, xoffset, yoffset, width, height, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glCompressedTexSubImage1DARB(target, level, xoffset, width, format, imageSize, data)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLsizei, imageSize, GLptr, data)
}

glGetCompressedTexImageARB(target, level, img)
{
  global
  DllCall(PFNGLGETCOMPRESSEDTEXIMAGEARBPROC, GLenum, target, GLint, level, GLptr, img)
}


GL_ARB_texture_border_clamp := 1
GL_ARB_point_parameters := 1

glPointParameterfARB(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERFARBPROC, GLenum, pname, GLfloat, param)
}

glPointParameterfvARB(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERFVARBPROC, GLenum, pname, GLptr, params)
}


GL_ARB_vertex_blend := 1

glWeightbvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTBVARBPROC, GLint, size, GLptr, weights)
}

glWeightsvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTSVARBPROC, GLint, size, GLptr, weights)
}

glWeightivARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTIVARBPROC, GLint, size, GLptr, weights)
}

glWeightfvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTFVARBPROC, GLint, size, GLptr, weights)
}

glWeightdvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTDVARBPROC, GLint, size, GLptr, weights)
}

glWeightubvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTUBVARBPROC, GLint, size, GLptr, weights)
}

glWeightusvARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTUSVARBPROC, GLint, size, GLptr, weights)
}

glWeightuivARB(size, weights)
{
  global
  DllCall(PFNGLWEIGHTUIVARBPROC, GLint, size, GLptr, weights)
}

glWeightPointerARB(size, type, stride, pointer)
{
  global
  DllCall(PFNGLWEIGHTPOINTERARBPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glVertexBlendARB(count)
{
  global
  DllCall(PFNGLVERTEXBLENDARBPROC, GLint, count)
}


GL_ARB_matrix_palette := 1

glCurrentPaletteMatrixARB(index)
{
  global
  DllCall(PFNGLCURRENTPALETTEMATRIXARBPROC, GLint, index)
}

glMatrixIndexubvARB(size, indices)
{
  global
  DllCall(PFNGLMATRIXINDEXUBVARBPROC, GLint, size, GLptr, indices)
}

glMatrixIndexusvARB(size, indices)
{
  global
  DllCall(PFNGLMATRIXINDEXUSVARBPROC, GLint, size, GLptr, indices)
}

glMatrixIndexuivARB(size, indices)
{
  global
  DllCall(PFNGLMATRIXINDEXUIVARBPROC, GLint, size, GLptr, indices)
}

glMatrixIndexPointerARB(size, type, stride, pointer)
{
  global
  DllCall(PFNGLMATRIXINDEXPOINTERARBPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_ARB_texture_env_combine := 1
GL_ARB_texture_env_crossbar := 1
GL_ARB_texture_env_dot3 := 1
GL_ARB_texture_mirrored_repeat := 1
GL_ARB_depth_texture := 1
GL_ARB_shadow := 1
GL_ARB_shadow_ambient := 1
GL_ARB_window_pos := 1

glWindowPos2dARB(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2DARBPROC, GLdouble, x, GLdouble, y)
}

glWindowPos2dvARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS2DVARBPROC, GLptr, v)
}

glWindowPos2fARB(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2FARBPROC, GLfloat, x, GLfloat, y)
}

glWindowPos2fvARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS2FVARBPROC, GLptr, v)
}

glWindowPos2iARB(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2IARBPROC, GLint, x, GLint, y)
}

glWindowPos2ivARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS2IVARBPROC, GLptr, v)
}

glWindowPos2sARB(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2SARBPROC, GLshort, x, GLshort, y)
}

glWindowPos2svARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS2SVARBPROC, GLptr, v)
}

glWindowPos3dARB(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3DARBPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glWindowPos3dvARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS3DVARBPROC, GLptr, v)
}

glWindowPos3fARB(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3FARBPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glWindowPos3fvARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS3FVARBPROC, GLptr, v)
}

glWindowPos3iARB(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3IARBPROC, GLint, x, GLint, y, GLint, z)
}

glWindowPos3ivARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS3IVARBPROC, GLptr, v)
}

glWindowPos3sARB(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3SARBPROC, GLshort, x, GLshort, y, GLshort, z)
}

glWindowPos3svARB(v)
{
  global
  DllCall(PFNGLWINDOWPOS3SVARBPROC, GLptr, v)
}


GL_ARB_vertex_program := 1

glVertexAttrib1dARB(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DARBPROC, GLuint, index, GLdouble, x)
}

glVertexAttrib1dvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1fARB(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FARBPROC, GLuint, index, GLfloat, x)
}

glVertexAttrib1fvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1sARB(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SARBPROC, GLuint, index, GLshort, x)
}

glVertexAttrib1svARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2dARB(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DARBPROC, GLuint, index, GLdouble, x, GLdouble, y)
}

glVertexAttrib2dvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2fARB(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FARBPROC, GLuint, index, GLfloat, x, GLfloat, y)
}

glVertexAttrib2fvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2sARB(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SARBPROC, GLuint, index, GLshort, x, GLshort, y)
}

glVertexAttrib2svARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3dARB(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DARBPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexAttrib3dvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3fARB(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FARBPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertexAttrib3fvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3sARB(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SARBPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z)
}

glVertexAttrib3svARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NbvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NBVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NivARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NIVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NsvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NSVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NubARB(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUBARBPROC, GLuint, index, GLubyte, x, GLubyte, y, GLubyte, z, GLubyte, w)
}

glVertexAttrib4NubvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUBVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NuivARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUIVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4NusvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4NUSVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4bvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4BVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4dARB(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DARBPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexAttrib4dvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4fARB(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FARBPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glVertexAttrib4fvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4ivARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4IVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4sARB(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SARBPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glVertexAttrib4svARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4ubvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UBVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4uivARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UIVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4usvARB(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4USVARBPROC, GLuint, index, GLptr, v)
}

glVertexAttribPointerARB(index, size, type, normalized, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBPOINTERARBPROC, GLuint, index, GLint, size, GLenum, type, GLboolean, normalized, GLsizei, stride, GLptr, pointer)
}

glEnableVertexAttribArrayARB(index)
{
  global
  DllCall(PFNGLENABLEVERTEXATTRIBARRAYARBPROC, GLuint, index)
}

glDisableVertexAttribArrayARB(index)
{
  global
  DllCall(PFNGLDISABLEVERTEXATTRIBARRAYARBPROC, GLuint, index)
}

glProgramStringARB(target, format, len, string)
{
  global
  DllCall(PFNGLPROGRAMSTRINGARBPROC, GLenum, target, GLenum, format, GLsizei, len, GLptr, string)
}

glBindProgramARB(target, program)
{
  global
  DllCall(PFNGLBINDPROGRAMARBPROC, GLenum, target, GLuint, program)
}

glDeleteProgramsARB(n, programs)
{
  global
  DllCall(PFNGLDELETEPROGRAMSARBPROC, GLsizei, n, GLptr, programs)
}

glGenProgramsARB(n, programs)
{
  global
  DllCall(PFNGLGENPROGRAMSARBPROC, GLsizei, n, GLptr, programs)
}

glProgramEnvParameter4dARB(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETER4DARBPROC, GLenum, target, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glProgramEnvParameter4dvARB(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETER4DVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramEnvParameter4fARB(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETER4FARBPROC, GLenum, target, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glProgramEnvParameter4fvARB(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETER4FVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramLocalParameter4dARB(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETER4DARBPROC, GLenum, target, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glProgramLocalParameter4dvARB(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETER4DVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramLocalParameter4fARB(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETER4FARBPROC, GLenum, target, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glProgramLocalParameter4fvARB(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETER4FVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramEnvParameterdvARB(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMENVPARAMETERDVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramEnvParameterfvARB(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMENVPARAMETERFVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramLocalParameterdvARB(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramLocalParameterfvARB(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramivARB(target, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMIVARBPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetProgramStringARB(target, pname, string)
{
  global
  DllCall(PFNGLGETPROGRAMSTRINGARBPROC, GLenum, target, GLenum, pname, GLptr, string)
}

glGetVertexAttribdvARB(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBDVARBPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribfvARB(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBFVARBPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribivARB(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIVARBPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribPointervARB(index, pname, pointer)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBPOINTERVARBPROC, GLuint, index, GLenum, pname, GLptr, pointer)
}

glIsProgramARB(program)
{
  global
  return DllCall(PFNGLISPROGRAMARBPROC, GLuint, program, GLboolean)
}

GL_ARB_fragment_program := 1
GL_ARB_vertex_buffer_object := 1

glBindBufferARB(target, buffer)
{
  global
  DllCall(PFNGLBINDBUFFERARBPROC, GLenum, target, GLuint, buffer)
}

glDeleteBuffersARB(n, buffers)
{
  global
  DllCall(PFNGLDELETEBUFFERSARBPROC, GLsizei, n, GLptr, buffers)
}

glGenBuffersARB(n, buffers)
{
  global
  DllCall(PFNGLGENBUFFERSARBPROC, GLsizei, n, GLptr, buffers)
}

glIsBufferARB(buffer)
{
  global
  return DllCall(PFNGLISBUFFERARBPROC, GLuint, buffer, GLboolean)
}

glBufferDataARB(target, size, data, usage)
{
  global
  DllCall(PFNGLBUFFERDATAARBPROC, GLenum, target, GLsizeiptrARB, size, GLptr, data, GLenum, usage)
}

glBufferSubDataARB(target, offset, size, data)
{
  global
  DllCall(PFNGLBUFFERSUBDATAARBPROC, GLenum, target, GLintptrARB, offset, GLsizeiptrARB, size, GLptr, data)
}

glGetBufferSubDataARB(target, offset, size, data)
{
  global
  DllCall(PFNGLGETBUFFERSUBDATAARBPROC, GLenum, target, GLintptrARB, offset, GLsizeiptrARB, size, GLptr, data)
}

glMapBufferARB(target, access)
{
  global
  return DllCall(PFNGLMAPBUFFERARBPROC, GLenum, target, GLenum, access, GLptr)
}

glUnmapBufferARB(target)
{
  global
  return DllCall(PFNGLUNMAPBUFFERARBPROC, GLenum, target, GLboolean)
}

glGetBufferParameterivARB(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPARAMETERIVARBPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetBufferPointervARB(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPOINTERVARBPROC, GLenum, target, GLenum, pname, GLptr, params)
}


GL_ARB_occlusion_query := 1

glGenQueriesARB(n, ids)
{
  global
  DllCall(PFNGLGENQUERIESARBPROC, GLsizei, n, GLptr, ids)
}

glDeleteQueriesARB(n, ids)
{
  global
  DllCall(PFNGLDELETEQUERIESARBPROC, GLsizei, n, GLptr, ids)
}

glIsQueryARB(id)
{
  global
  return DllCall(PFNGLISQUERYARBPROC, GLuint, id, GLboolean)
}

glBeginQueryARB(target, id)
{
  global
  DllCall(PFNGLBEGINQUERYARBPROC, GLenum, target, GLuint, id)
}

glEndQueryARB(target)
{
  global
  DllCall(PFNGLENDQUERYARBPROC, GLenum, target)
}

glGetQueryivARB(target, pname, params)
{
  global
  DllCall(PFNGLGETQUERYIVARBPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetQueryObjectivARB(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTIVARBPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetQueryObjectuivARB(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTUIVARBPROC, GLuint, id, GLenum, pname, GLptr, params)
}


GL_ARB_shader_objects := 1

glDeleteObjectARB(obj)
{
  global
  DllCall(PFNGLDELETEOBJECTARBPROC, GLhandleARB, obj)
}

glGetHandleARB(pname)
{
  global
  return DllCall(PFNGLGETHANDLEARBPROC, GLenum, pname, GLhandleARB)
}

glDetachObjectARB(containerObj, attachedObj)
{
  global
  DllCall(PFNGLDETACHOBJECTARBPROC, GLhandleARB, containerObj, GLhandleARB, attachedObj)
}

glCreateShaderObjectARB(shaderType)
{
  global
  return DllCall(PFNGLCREATESHADEROBJECTARBPROC, GLenum, shaderType, GLhandleARB)
}

glShaderSourceARB(shaderObj, count, string, length)
{
  global
  DllCall(PFNGLSHADERSOURCEARBPROC, GLhandleARB, shaderObj, GLsizei, count, GLastr, string, GLptr, length)
}

glCompileShaderARB(shaderObj)
{
  global
  DllCall(PFNGLCOMPILESHADERARBPROC, GLhandleARB, shaderObj)
}

glCreateProgramObjectARB()
{
  global
  return DllCall(PFNGLCREATEPROGRAMOBJECTARBPROC, GLhandleARB)
}

glAttachObjectARB(containerObj, obj)
{
  global
  DllCall(PFNGLATTACHOBJECTARBPROC, GLhandleARB, containerObj, GLhandleARB, obj)
}

glLinkProgramARB(programObj)
{
  global
  DllCall(PFNGLLINKPROGRAMARBPROC, GLhandleARB, programObj)
}

glUseProgramObjectARB(programObj)
{
  global
  DllCall(PFNGLUSEPROGRAMOBJECTARBPROC, GLhandleARB, programObj)
}

glValidateProgramARB(programObj)
{
  global
  DllCall(PFNGLVALIDATEPROGRAMARBPROC, GLhandleARB, programObj)
}

glUniform1fARB(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1FARBPROC, GLint, location, GLfloat, v0)
}

glUniform2fARB(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2FARBPROC, GLint, location, GLfloat, v0, GLfloat, v1)
}

glUniform3fARB(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3FARBPROC, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2)
}

glUniform4fARB(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4FARBPROC, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2, GLfloat, v3)
}

glUniform1iARB(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1IARBPROC, GLint, location, GLint, v0)
}

glUniform2iARB(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2IARBPROC, GLint, location, GLint, v0, GLint, v1)
}

glUniform3iARB(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3IARBPROC, GLint, location, GLint, v0, GLint, v1, GLint, v2)
}

glUniform4iARB(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4IARBPROC, GLint, location, GLint, v0, GLint, v1, GLint, v2, GLint, v3)
}

glUniform1fvARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1FVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2fvARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2FVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3fvARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3FVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4fvARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4FVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform1ivARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1IVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2ivARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2IVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3ivARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3IVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4ivARB(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4IVARBPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniformMatrix2fvARB(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2FVARBPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3fvARB(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3FVARBPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4fvARB(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4FVARBPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glGetObjectParameterfvARB(obj, pname, params)
{
  global
  DllCall(PFNGLGETOBJECTPARAMETERFVARBPROC, GLhandleARB, obj, GLenum, pname, GLptr, params)
}

glGetObjectParameterivARB(obj, pname, params)
{
  global
  DllCall(PFNGLGETOBJECTPARAMETERIVARBPROC, GLhandleARB, obj, GLenum, pname, GLptr, params)
}

glGetInfoLogARB(obj, maxLength, length, infoLog)
{
  global
  DllCall(PFNGLGETINFOLOGARBPROC, GLhandleARB, obj, GLsizei, maxLength, GLptr, length, GLptr, infoLog)
}

glGetAttachedObjectsARB(containerObj, maxCount, count, obj)
{
  global
  DllCall(PFNGLGETATTACHEDOBJECTSARBPROC, GLhandleARB, containerObj, GLsizei, maxCount, GLptr, count, GLptr, obj)
}

glGetUniformLocationARB(programObj, name)
{
  global
  return DllCall(PFNGLGETUNIFORMLOCATIONARBPROC, GLhandleARB, programObj, GLptr, name, GLuint)
}

glGetActiveUniformARB(programObj, index, maxLength, length, size, type, name)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMARBPROC, GLhandleARB, programObj, GLuint, index, GLsizei, maxLength, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glGetUniformfvARB(programObj, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMFVARBPROC, GLhandleARB, programObj, GLint, location, GLptr, params)
}

glGetUniformivARB(programObj, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMIVARBPROC, GLhandleARB, programObj, GLint, location, GLptr, params)
}

glGetShaderSourceARB(obj, maxLength, length, source)
{
  global
  DllCall(PFNGLGETSHADERSOURCEARBPROC, GLhandleARB, obj, GLsizei, maxLength, GLptr, length, GLptr, source)
}


GL_ARB_vertex_shader := 1

glBindAttribLocationARB(programObj, index, name)
{
  global
  DllCall(PFNGLBINDATTRIBLOCATIONARBPROC, GLhandleARB, programObj, GLuint, index, GLptr, name)
}

glGetActiveAttribARB(programObj, index, maxLength, length, size, type, name)
{
  global
  DllCall(PFNGLGETACTIVEATTRIBARBPROC, GLhandleARB, programObj, GLuint, index, GLsizei, maxLength, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glGetAttribLocationARB(programObj, name)
{
  global
  return DllCall(PFNGLGETATTRIBLOCATIONPROC, GLhandleARB, programObj, GLptr, name, GLuint)
}

GL_ARB_fragment_shader := 1
GL_ARB_shading_language_100 := 1
GL_ARB_texture_non_power_of_two := 1
GL_ARB_point_sprite := 1
GL_ARB_fragment_program_shadow := 1
GL_ARB_draw_buffers := 1

glDrawBuffersARB(n, bufs)
{
  global
  DllCall(PFNGLDRAWBUFFERSARBPROC, GLsizei, n, GLptr, bufs)
}


GL_ARB_texture_rectangle := 1
GL_ARB_color_buffer_float := 1

glClampColorARB(target, clamp)
{
  global
  DllCall(PFNGLCLAMPCOLORARBPROC, GLenum, target, GLenum, clamp)
}


GL_ARB_half_float_pixel := 1
GL_ARB_texture_float := 1
GL_ARB_pixel_buffer_object := 1
GL_ARB_depth_buffer_float := 1
GL_ARB_draw_instanced := 1

glDrawArraysInstancedARB(mode, first, count, primcount)
{
  global
  DllCall(PFNGLDRAWARRAYSINSTANCEDARBPROC, GLenum, mode, GLint, first, GLsizei, count, GLsizei, primcount)
}

glDrawElementsInstancedARB(mode, count, type, indices, primcount)
{
  global
  DllCall(PFNGLDRAWELEMENTSINSTANCEDARBPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices, GLsizei, primcount)
}


GL_ARB_framebuffer_object := 1

glIsRenderbuffer(renderbuffer)
{
  global
  return DllCall(PFNGLISRENDERBUFFERPROC, GLuint, buffer, GLboolean)
}

glBindRenderbuffer(target, renderbuffer)
{
  global
  DllCall(PFNGLBINDRENDERBUFFERPROC, GLenum, target, GLuint, renderbuffer)
}

glDeleteRenderbuffers(n, renderbuffers)
{
  global
  DllCall(PFNGLDELETERENDERBUFFERSPROC, GLsizei, n, GLptr, renderbuffers)
}

glGenRenderbuffers(n, renderbuffers)
{
  global
  DllCall(PFNGLGENRENDERBUFFERSPROC, GLsizei, n, GLptr, renderbuffers)
}

glRenderbufferStorage(target, internalformat, width, height)
{
  global
  DllCall(PFNGLRENDERBUFFERSTORAGEPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glGetRenderbufferParameteriv(target, pname, params)
{
  global
  DllCall(PFNGLGETRENDERBUFFERPARAMETERIVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glIsFramebuffer(framebuffer)
{
  global
  return DllCall(PFNGLISFRAMEBUFFERPROC, GLuint, framebuffer, GLboolean)
}

glBindFramebuffer(target, framebuffer)
{
  global
  DllCall(PFNGLBINDFRAMEBUFFERPROC, GLenum, target, GLuint, framebuffer)
}

glDeleteFramebuffers(n, framebuffers)
{
  global
  DllCall(PFNGLDELETEFRAMEBUFFERSPROC, GLsizei, n, GLptr, framebuffers)
}

glGenFramebuffers(n, framebuffers)
{
  global
  DllCall(PFNGLGENFRAMEBUFFERSPROC, GLsizei, n, GLptr, framebuffers)
}

glCheckFramebufferStatus(target)
{
  global
  return DllCall(PFNGLCHECKFRAMEBUFFERSTATUSPROC, GLenum, target, GLenum)
}

glFramebufferTexture1D(target, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE1DPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glFramebufferTexture2D(target, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE2DPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glFramebufferTexture3D(target, attachment, textarget, texture, level, zoffset)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE3DPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level, GLint, zoffset)
}

glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer)
{
  global
  DllCall(PFNGLFRAMEBUFFERRENDERBUFFERPROC, GLenum, target, GLenum, attachment, GLenum, renderbuffertarget, GLuint, renderbuffer)
}

glGetFramebufferAttachmentParameteriv(target, attachment, pname, params)
{
  global
  DllCall(PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC, GLenum, target, GLenum, attachment, GLenum, pname, GLptr, params)
}

glGenerateMipmap(target)
{
  global
  DllCall(PFNGLGENERATEMIPMAPPROC, GLenum, target)
}

glBlitFramebuffer(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter)
{
  global
  DllCall(PFNGLBLITFRAMEBUFFERPROC, GLint, srcX0, GLint, srcY0, GLint, srcX1, GLint, srcY1, GLint, dstX0, GLint, dstY0, GLint, dstX1, GLint, dstY1, GLbitfield, mask, GLenum, filter)
}

glRenderbufferStorageMultisample(target, samples, internalformat, width, height)
{
  global
  DllCall(PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC, GLenum, target, GLsizei, samples, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glFramebufferTextureLayer(target, attachment, texture, level, layer)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURELAYERPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level, GLint, layer)
}


GL_ARB_framebuffer_sRGB := 1
GL_ARB_geometry_shader4 := 1

glProgramParameteriARB(program, pname, value)
{
  global
  DllCall(PFNGLPROGRAMPARAMETERIARBPROC, GLuint, program, GLenum, pname, GLint, value)
}

glFramebufferTextureARB(target, attachment, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTUREARBPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level)
}

glFramebufferTextureLayerARB(target, attachment, texture, level, layer)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURELAYERARBPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level, GLint, layer)
}

glFramebufferTextureFaceARB(target, attachment, texture, level, face)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTUREFACEARBPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level, GLenum, face)
}


GL_ARB_half_float_vertex := 1
GL_ARB_instanced_arrays := 1

glVertexAttribDivisorARB(index, divisor)
{
  global
  DllCall(PFNGLVERTEXATTRIBDIVISORARBPROC, GLuint, index, GLuint, divisor)
}


GL_ARB_map_buffer_range := 1

glMapBufferRange(target, offset, length, access)
{
  global
  return DllCall(PFNGLMAPBUFFERRANGEPROC, GLenum, target, GLintptr, offset, GLsizeiptr, length, GLbitfield, access, GLptr)
}

glFlushMappedBufferRange(target, offset, length)
{
  global
  DllCall(PFNGLFLUSHMAPPEDBUFFERRANGEPROC, GLenum, target, GLintptr, offset, GLsizeiptr, length)
}


GL_ARB_texture_buffer_object := 1

glTexBufferARB(target, internalformat, buffer)
{
  global
  DllCall(PFNGLTEXBUFFERARBPROC, GLenum, target, GLenum, internalformat, GLuint, buffer)
}


GL_ARB_texture_compression_rgtc := 1
GL_ARB_texture_rg := 1
GL_ARB_vertex_array_object := 1

glBindVertexArray(array)
{
  global
  DllCall(PFNGLBINDVERTEXARRAYPROC, GLuint, array)
}

glDeleteVertexArrays(n, arrays)
{
  global
  DllCall(PFNGLDELETEVERTEXARRAYSPROC, GLsizei, n, GLptr, arrays)
}

glGenVertexArrays(n, arrays)
{
  global
  DllCall(PFNGLGENVERTEXARRAYSPROC, GLsizei, n, GLptr, arrays)
}

glIsVertexArray(array)
{
  global
  return DllCall(PFNGLISVERTEXARRAYPROC, GLuint, array, GLboolean)
}

GL_ARB_uniform_buffer_object := 1

glGetUniformIndices(program, uniformCount, uniformNames, uniformIndices)
{
  global
  DllCall(PFNGLGETUNIFORMINDICESPROC, GLuint, program, GLsizei, uniformCount, GLastr, uniformNames, GLptr, uniformIndices)
}

glGetActiveUniformsiv(program, uniformCount, uniformIndices, pname, params)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMSIVPROC, GLuint, program, GLsizei, uniformCount, GLptr, uniformIndices, GLenum, pname, GLptr, params)
}

glGetActiveUniformName(program, uniformIndex, bufSize, length, uniformName)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMNAMEPROC, GLuint, program, GLuint, uniformIndex, GLsizei, bufSize, GLptr, length, GLptr, uniformName)
}

glGetUniformBlockIndex(program, uniformBlockName)
{
  global
  return DllCall(PFNGLGETUNIFORMBLOCKINDEXPROC, GLuint, program, GLptr, uniformBlockName, GLuint)
}

glGetActiveUniformBlockiv(program, uniformBlockIndex, pname, params)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMBLOCKIVPROC, GLuint, program, GLuint, uniformBlockIndex, GLenum, pname, GLptr, params)
}

glGetActiveUniformBlockName(program, uniformBlockIndex, bufSize, length, uniformBlockName)
{
  global
  DllCall(PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC, GLuint, program, GLuint, uniformBlockIndex, GLsizei, bufSize, GLptr, length, GLptr, uniformBlockName)
}

glUniformBlockBinding(program, uniformBlockIndex, uniformBlockBinding)
{
  global
  DllCall(PFNGLUNIFORMBLOCKBINDINGPROC, GLuint, program, GLuint, uniformBlockIndex, GLuint, uniformBlockBinding)
}


GL_ARB_compatibility := 1
GL_ARB_copy_buffer := 1

glCopyBufferSubData(readTarget, writeTarget, readOffset, writeOffset, size)
{
  global
  DllCall(PFNGLCOPYBUFFERSUBDATAPROC, GLenum, readTarget, GLenum, writeTarget, GLintptr, readOffset, GLintptr, writeOffset, GLsizeiptr, size)
}


GL_ARB_shader_texture_lod := 1
GL_ARB_depth_clamp := 1
GL_ARB_draw_elements_base_vertex := 1

glDrawElementsBaseVertex(mode, count, type, indices, basevertex)
{
  global
  DllCall(PFNGLDRAWELEMENTSBASEVERTEXPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices, GLint, basevertex)
}

glDrawRangeElementsBaseVertex(mode, start, end, count, type, indices, basevertex)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC, GLenum, mode, GLuint, start, GLuint, end, GLsizei, count, GLenum, type, GLptr, indices, GLint, basevertex)
}

glDrawElementsInstancedBaseVertex(mode, count, type, indices, primcount, basevertex)
{
  global
  DllCall(PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices, GLsizei, primcount, GLint, basevertex)
}

glMultiDrawElementsBaseVertex(mode, count, type, indices, primcount, basevertex)
{
  global
  DllCall(PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC, GLenum, mode, GLptr, count, GLenum, type, GLptr, indices, GLsizei, primcount, GLptr, basevertex)
}


GL_ARB_fragment_coord_conventions := 1
GL_ARB_provoking_vertex := 1

glProvokingVertex(mode)
{
  global
  DllCall(PFNGLPROVOKINGVERTEXPROC, GLenum, mode)
}


GL_ARB_seamless_cube_map := 1
GL_ARB_sync := 1

glFenceSync(condition, flags)
{
  global
  return DllCall(PFNGLFENCESYNCPROC, GLenum, condition, GLbitfield, flags, GLsync)
}

glIsSync(sync)
{
  global
  return DllCall(PFNGLISSYNCPROC, GLsync, sync, GLboolean)
}

glDeleteSync(sync)
{
  global
  DllCall(PFNGLDELETESYNCPROC, GLsync, sync)
}

glClientWaitSync(sync, flags, timeout)
{
  global
  return DllCall(PFNGLCLIENTWAITSYNCPROC, GLsync, sync, GLbitfield, flags, GLuint64, timeout, GLenum)
}

glWaitSync(sync, flags, timeout)
{
  global
  DllCall(PFNGLWAITSYNCPROC, GLsync, sync, GLbitfield, flags, GLuint64, timeout)
}

glGetInteger64v(pname, params)
{
  global
  DllCall(PFNGLGETINTEGER64VPROC, GLenum, pname, GLptr, params)
}

glGetSynciv(sync, pname, bufSize, length, values)
{
  global
  DllCall(PFNGLGETSYNCIVPROC, GLsync, sync, GLenum, pname, GLsizei, bufSize, GLptr, length, GLptr, values)
}


GL_ARB_texture_multisample := 1

glTexImage2DMultisample(target, samples, internalformat, width, height, fixedsamplelocations)
{
  global
  DllCall(PFNGLTEXIMAGE2DMULTISAMPLEPROC, GLenum, target, GLsizei, samples, GLint, internalformat, GLsizei, width, GLsizei, height, GLboolean, fixedsamplelocations)
}

glTexImage3DMultisample(target, samples, internalformat, width, height, depth, fixedsamplelocations)
{
  global
  DllCall(PFNGLTEXIMAGE3DMULTISAMPLEPROC, GLenum, target, GLsizei, samples, GLint, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLboolean, fixedsamplelocations)
}

glGetMultisamplefv(pname, index, val)
{
  global
  DllCall(PFNGLGETMULTISAMPLEFVPROC, GLenum, pname, GLuint, index, GLptr, val)
}

glSampleMaski(index, mask)
{
  global
  DllCall(PFNGLSAMPLEMASKIPROC, GLuint, index, GLbitfield, mask)
}


GL_ARB_vertex_array_bgra := 1
GL_ARB_draw_buffers_blend := 1

glBlendEquationiARB(buf, mode)
{
  global
  DllCall(PFNGLBLENDEQUATIONIARBPROC, GLuint, buf, GLenum, mode)
}

glBlendEquationSeparateiARB(buf, modeRGB, modeAlpha)
{
  global
  DllCall(PFNGLBLENDEQUATIONSEPARATEIARBPROC, GLuint, buf, GLenum, modeRGB, GLenum, modeAlpha)
}

glBlendFunciARB(buf, src, dst)
{
  global
  DllCall(PFNGLBLENDFUNCIARBPROC, GLuint, buf, GLenum, src, GLenum, dst)
}

glBlendFuncSeparateiARB(buf, srcRGB, dstRGB, srcAlpha, dstAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEIARBPROC, GLuint, buf, GLenum, srcRGB, GLenum, dstRGB, GLenum, srcAlpha, GLenum, dstAlpha)
}


GL_ARB_sample_shading := 1

glMinSampleShadingARB(value)
{
  global
  DllCall(PFNGLMINSAMPLESHADINGARBPROC, GLclampf, value)
}


GL_ARB_texture_cube_map_array := 1
GL_ARB_texture_gather := 1
GL_ARB_texture_query_lod := 1
GL_ARB_shading_language_include := 1

glNamedStringARB(type, namelen, name, stringlen, string)
{
  global
  DllCall(PFNGLNAMEDSTRINGARBPROC, GLenum, type, GLint, namelen, GLptr, name, GLint, stringlen, GLptr, string)
}

glDeleteNamedStringARB(namelen, name)
{
  global
  DllCall(PFNGLDELETENAMEDSTRINGARBPROC, GLint, namelen, GLptr, name)
}

glCompileShaderIncludeARB(shader, count, path, length)
{
  global
  DllCall(PFNGLCOMPILESHADERINCLUDEARBPROC, GLuint, shader, GLsizei, count, GLastr, path, GLptr, length)
}

glIsNamedStringARB(namelen, name)
{
  global
  return DllCall(PFNGLISNAMEDSTRINGARBPROC, GLint, namelen, GLptr, name, GLboolean)
}

glGetNamedStringARB(namelen, name, bufSize, stringlen, string)
{
  global
  DllCall(PFNGLGETNAMEDSTRINGARBPROC, GLint, namelen, GLptr, name, GLsizei, bufSize, GLptr, stringlen, GLptr, string)
}

glGetNamedStringivARB(namelen, name, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDSTRINGIVARBPROC, GLint, namelen, GLptr, name, GLenum, pname, GLptr, params)
}


GL_ARB_texture_compression_bptc := 1
GL_ARB_blend_func_extended := 1

glBindFragDataLocationIndexed(program, colorNumber, index, name)
{
  global
  DllCall(PFNGLBINDFRAGDATALOCATIONINDEXEDPROC, GLuint, program, GLuint, colorNumber, GLuint, index, GLptr, name)
}

glGetFragDataIndex(program, name)
{
  global
  return DllCall(PFNGLGETFRAGDATAINDEXPROC, GLuint, program, GLptr, name, GLuint)
}

GL_ARB_explicit_attrib_location := 1
GL_ARB_occlusion_query2 := 1
GL_ARB_sampler_objects := 1

glGenSamplers(count, samplers)
{
  global
  DllCall(PFNGLGENSAMPLERSPROC, GLsizei, count, GLptr, samplers)
}

glDeleteSamplers(count, samplers)
{
  global
  DllCall(PFNGLDELETESAMPLERSPROC, GLsizei, count, GLptr, samplers)
}

glIsSampler(sampler)
{
  global
  return DllCall(PFNGLISSAMPLERPROC, GLuint, sampler, GLboolean)
}

glBindSampler(unit, sampler)
{
  global
  DllCall(PFNGLBINDSAMPLERPROC, GLuint, unit, GLuint, sampler)
}

glSamplerParameteri(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERIPROC, GLuint, sampler, GLenum, pname, GLint, param)
}

glSamplerParameteriv(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERIVPROC, GLuint, sampler, GLenum, pname, GLptr, param)
}

glSamplerParameterf(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERFPROC, GLuint, sampler, GLenum, pname, GLfloat, param)
}

glSamplerParameterfv(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERFVPROC, GLuint, sampler, GLenum, pname, GLptr, param)
}

glSamplerParameterIiv(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERIIVPROC, GLuint, sampler, GLenum, pname, GLptr, param)
}

glSamplerParameterIuiv(sampler, pname, param)
{
  global
  DllCall(PFNGLSAMPLERPARAMETERIUIVPROC, GLuint, sampler, GLenum, pname, GLptr, param)
}

glGetSamplerParameteriv(sampler, pname, params)
{
  global
  DllCall(PFNGLGETSAMPLERPARAMETERIVPROC, GLuint, sampler, GLenum, pname, GLptr, params)
}

glGetSamplerParameterIiv(sampler, pname, params)
{
  global
  DllCall(PFNGLGETSAMPLERPARAMETERIIVPROC, GLuint, sampler, GLenum, pname, GLptr, params)
}

glGetSamplerParameterfv(sampler, pname, params)
{
  global
  DllCall(PFNGLGETSAMPLERPARAMETERFVPROC, GLuint, sampler, GLenum, pname, GLptr, params)
}

glGetSamplerParameterIuiv(sampler, pname, params)
{
  global
  DllCall(PFNGLGETSAMPLERPARAMETERIUIVPROC, GLuint, sampler, GLenum, pname, GLptr, params)
}


GL_ARB_texture_rgb10_a2ui := 1
GL_ARB_texture_swizzle := 1
GL_ARB_timer_query := 1

glQueryCounter(id, target)
{
  global
  DllCall(PFNGLQUERYCOUNTERPROC, GLuint, id, GLenum, target)
}

glGetQueryObjecti64v(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTI64VPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetQueryObjectui64v(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTUI64VPROC, GLuint, id, GLenum, pname, GLptr, params)
}


GL_ARB_vertex_type_2_10_10_10_rev := 1

glVertexP2ui(type, value)
{
  global
  DllCall(PFNGLVERTEXP2UIPROC, GLenum, type, GLuint, value)
}

glVertexP2uiv(type, value)
{
  global
  DllCall(PFNGLVERTEXP2UIVPROC, GLenum, type, GLptr, value)
}

glVertexP3ui(type, value)
{
  global
  DllCall(PFNGLVERTEXP3UIPROC, GLenum, type, GLuint, value)
}

glVertexP3uiv(type, value)
{
  global
  DllCall(PFNGLVERTEXP3UIVPROC, GLenum, type, GLptr, value)
}

glVertexP4ui(type, value)
{
  global
  DllCall(PFNGLVERTEXP4UIPROC, GLenum, type, GLuint, value)
}

glVertexP4uiv(type, value)
{
  global
  DllCall(PFNGLVERTEXP4UIVPROC, GLenum, type, GLptr, value)
}

glTexCoordP1ui(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP1UIPROC, GLenum, type, GLuint, coords)
}

glTexCoordP1uiv(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP1UIVPROC, GLenum, type, GLptr, coords)
}

glTexCoordP2ui(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP2UIPROC, GLenum, type, GLuint, coords)
}

glTexCoordP2uiv(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP2UIVPROC, GLenum, type, GLptr, coords)
}

glTexCoordP3ui(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP3UIPROC, GLenum, type, GLuint, coords)
}

glTexCoordP3uiv(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP3UIVPROC, GLenum, type, GLptr, coords)
}

glTexCoordP4ui(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP4UIPROC, GLenum, type, GLuint, coords)
}

glTexCoordP4uiv(type, coords)
{
  global
  DllCall(PFNGLTEXCOORDP4UIVPROC, GLenum, type, GLptr, coords)
}

glMultiTexCoordP1ui(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP1UIPROC, GLenum, texture, GLenum, type, GLuint, coords)
}

glMultiTexCoordP1uiv(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP1UIVPROC, GLenum, texture, GLenum, type, GLptr, coords)
}

glMultiTexCoordP2ui(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP2UIPROC, GLenum, texture, GLenum, type, GLuint, coords)
}

glMultiTexCoordP2uiv(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP2UIVPROC, GLenum, texture, GLenum, type, GLptr, coords)
}

glMultiTexCoordP3ui(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP3UIPROC, GLenum, texture, GLenum, type, GLuint, coords)
}

glMultiTexCoordP3uiv(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP3UIVPROC, GLenum, texture, GLenum, type, GLptr, coords)
}

glMultiTexCoordP4ui(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP4UIPROC, GLenum, texture, GLenum, type, GLuint, coords)
}

glMultiTexCoordP4uiv(texture, type, coords)
{
  global
  DllCall(PFNGLMULTITEXCOORDP4UIVPROC, GLenum, texture, GLenum, type, GLptr, coords)
}

glNormalP3ui(type, coords)
{
  global
  DllCall(PFNGLNORMALP3UIPROC, GLenum, type, GLuint, coords)
}

glNormalP3uiv(type, coords)
{
  global
  DllCall(PFNGLNORMALP3UIVPROC, GLenum, type, GLptr, coords)
}

glColorP3ui(type, color)
{
  global
  DllCall(PFNGLCOLORP3UIPROC, GLenum, type, GLuint, color)
}

glColorP3uiv(type, color)
{
  global
  DllCall(PFNGLCOLORP3UIVPROC, GLenum, type, GLptr, color)
}

glColorP4ui(type, color)
{
  global
  DllCall(PFNGLCOLORP4UIPROC, GLenum, type, GLuint, color)
}

glColorP4uiv(type, color)
{
  global
  DllCall(PFNGLCOLORP4UIVPROC, GLenum, type, GLptr, color)
}

glSecondaryColorP3ui(type, color)
{
  global
  DllCall(PFNGLSECONDARYCOLORP3UIPROC, GLenum, type, GLuint, color)
}

glSecondaryColorP3uiv(type, color)
{
  global
  DllCall(PFNGLSECONDARYCOLORP3UIVPROC, GLenum, type, GLptr, color)
}

glVertexAttribP1ui(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP1UIPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLuint, value)
}

glVertexAttribP1uiv(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP1UIVPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLptr, value)
}

glVertexAttribP2ui(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP2UIPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLuint, value)
}

glVertexAttribP2uiv(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP2UIVPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLptr, value)
}

glVertexAttribP3ui(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP3UIPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLuint, value)
}

glVertexAttribP3uiv(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP3UIVPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLptr, value)
}

glVertexAttribP4ui(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP4UIPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLuint, value)
}

glVertexAttribP4uiv(index, type, normalized, value)
{
  global
  DllCall(PFNGLVERTEXATTRIBP4UIVPROC, GLuint, index, GLenum, type, GLboolean, normalized, GLptr, value)
}


GL_ARB_draw_indirect := 1

glDrawArraysIndirect(mode, indirect)
{
  global
  DllCall(PFNGLDRAWARRAYSINDIRECTPROC, GLenum, mode, GLptr, indirect)
}

glDrawElementsIndirect(mode, type, indirect)
{
  global
  DllCall(PFNGLDRAWELEMENTSINDIRECTPROC, GLenum, mode, GLenum, type, GLptr, indirect)
}


GL_ARB_gpu_shader5 := 1
GL_ARB_gpu_shader_fp64 := 1

glUniform1d(location, x)
{
  global
  DllCall(PFNGLUNIFORM1DPROC, GLint, location, GLdouble, x)
}

glUniform2d(location, x, y)
{
  global
  DllCall(PFNGLUNIFORM2DPROC, GLint, location, GLdouble, x, GLdouble, y)
}

glUniform3d(location, x, y, z)
{
  global
  DllCall(PFNGLUNIFORM3DPROC, GLint, location, GLdouble, x, GLdouble, y, GLdouble, z)
}

glUniform4d(location, x, y, z, w)
{
  global
  DllCall(PFNGLUNIFORM4DPROC, GLint, location, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glUniform1dv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1DVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2dv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2DVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3dv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3DVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4dv(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4DVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniformMatrix2dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix2x3dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2X3DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix2x4dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX2X4DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3x2dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3X2DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix3x4dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX3X4DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4x2dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4X2DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glUniformMatrix4x3dv(location, count, transpose, value)
{
  global
  DllCall(PFNGLUNIFORMMATRIX4X3DVPROC, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glGetUniformdv(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMDVPROC, GLuint, program, GLint, location, GLptr, params)
}


GL_ARB_shader_subroutine := 1

glGetSubroutineUniformLocation(program, shadertype, name)
{
  global
  return DllCall(PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC, GLuint, program, GLenum, shadertype, GLptr, name, GLuint)
}

glGetSubroutineIndex(program, shadertype, name)
{
  global
  return DllCall(PFNGLGETSUBROUTINEINDEXPROC, GLuint, program, GLenum, shadertype, GLptr, name, GLuint)
}

glGetActiveSubroutineUniformiv(program, shadertype, index, pname, values)
{
  global
  DllCall(PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC, GLuint, program, GLenum, shadertype, GLuint, index, GLenum, pname, GLptr, values)
}

glGetActiveSubroutineUniformName(program, shadertype, index, bufsize, length, name)
{
  global
  DllCall(PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC, GLuint, program, GLenum, shadertype, GLuint, index, GLsizei, bufsize, GLptr, length, GLptr, name)
}

glGetActiveSubroutineName(program, shadertype, index, bufsize, length, name)
{
  global
  DllCall(PFNGLGETACTIVESUBROUTINENAMEPROC, GLuint, program, GLenum, shadertype, GLuint, index, GLsizei, bufsize, GLptr, length, GLptr, name)
}

glUniformSubroutinesuiv(shadertype, count, indices)
{
  global
  DllCall(PFNGLUNIFORMSUBROUTINESUIVPROC, GLenum, shadertype, GLsizei, count, GLptr, indices)
}

glGetUniformSubroutineuiv(shadertype, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMSUBROUTINEUIVPROC, GLenum, shadertype, GLint, location, GLptr, params)
}

glGetProgramStageiv(program, shadertype, pname, values)
{
  global
  DllCall(PFNGLGETPROGRAMSTAGEIVPROC, GLuint, program, GLenum, shadertype, GLenum, pname, GLptr, values)
}


GL_ARB_tessellation_shader := 1

glPatchParameteri(pname, value)
{
  global
  DllCall(PFNGLPATCHPARAMETERIPROC, GLenum, pname, GLint, value)
}

glPatchParameterfv(pname, values)
{
  global
  DllCall(PFNGLPATCHPARAMETERFVPROC, GLenum, pname, GLptr, values)
}


GL_ARB_texture_buffer_object_rgb32 := 1
GL_ARB_transform_feedback2 := 1

glBindTransformFeedback(target, id)
{
  global
  DllCall(PFNGLBINDTRANSFORMFEEDBACKPROC, GLenum, target, GLuint, id)
}

glDeleteTransformFeedbacks(n, ids)
{
  global
  DllCall(PFNGLDELETETRANSFORMFEEDBACKSPROC, GLsizei, n, GLptr, ids)
}

glGenTransformFeedbacks(n, ids)
{
  global
  DllCall(PFNGLGENTRANSFORMFEEDBACKSPROC, GLsizei, n, GLptr, ids)
}

glIsTransformFeedback(id)
{
  global
  return DllCall(PFNGLISTRANSFORMFEEDBACKPROC, GLuint, id, GLboolean)
}

glPauseTransformFeedback()
{
  global
  DllCall(PFNGLPAUSETRANSFORMFEEDBACKPROC)
}

glResumeTransformFeedback()
{
  global
  DllCall(PFNGLRESUMETRANSFORMFEEDBACKPROC)
}

glDrawTransformFeedback(mode, id)
{
  global
  DllCall(PFNGLDRAWTRANSFORMFEEDBACKPROC, GLenum, mode, GLuint, id)
}


GL_ARB_transform_feedback3 := 1

glDrawTransformFeedbackStream(mode, id, stream)
{
  global
  DllCall(PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC, GLenum, mode, GLuint, id, GLuint, stream)
}

glBeginQueryIndexed(target, index, id)
{
  global
  DllCall(PFNGLBEGINQUERYINDEXEDPROC, GLenum, target, GLuint, index, GLuint, id)
}

glEndQueryIndexed(target, index)
{
  global
  DllCall(PFNGLENDQUERYINDEXEDPROC, GLenum, target, GLuint, index)
}

glGetQueryIndexediv(target, index, pname, params)
{
  global
  DllCall(PFNGLGETQUERYINDEXEDIVPROC, GLenum, target, GLuint, index, GLenum, pname, GLptr, params)
}


GL_ARB_ES2_compatibility := 1

glReleaseShaderCompiler()
{
  global
  DllCall(PFNGLRELEASESHADERCOMPILERPROC)
}

glShaderBinary(count, shaders, binaryformat, binary, length)
{
  global
  DllCall(PFNGLSHADERBINARYPROC, GLsizei, count, GLptr, shaders, GLenum, binaryformat, GLptr, binary, GLsizei, length)
}

glGetShaderPrecisionFormat(shadertype, precisiontype, range, precision)
{
  global
  DllCall(PFNGLGETSHADERPRECISIONFORMATPROC, GLenum, shadertype, GLenum, precisiontype, GLptr, range, GLptr, precision)
}

glDepthRangef(n, f)
{
  global
  DllCall(PFNGLDEPTHRANGEFPROC, GLclampf, n, GLclampf, f)
}

glClearDepthf(d)
{
  global
  DllCall(PFNGLCLEARDEPTHFPROC, GLclampf, d)
}


GL_ARB_get_program_binary := 1

glGetProgramBinary(program, bufSize, length, binaryFormat, binary)
{
  global
  DllCall(PFNGLGETPROGRAMBINARYPROC, GLuint, program, GLsizei, bufSize, GLptr, length, GLptr, binaryFormat, GLptr, binary)
}

glProgramBinary(program, binaryFormat, binary, length)
{
  global
  DllCall(PFNGLPROGRAMBINARYPROC, GLuint, program, GLenum, binaryFormat, GLptr, binary, GLsizei, length)
}

glProgramParameteri(program, pname, value)
{
  global
  DllCall(PFNGLPROGRAMPARAMETERIPROC, GLuint, program, GLenum, pname, GLint, value)
}


GL_ARB_separate_shader_objects := 1

glUseProgramStages(pipeline, stages, program)
{
  global
  DllCall(PFNGLUSEPROGRAMSTAGESPROC, GLuint, pipeline, GLbitfield, stages, GLuint, program)
}

glActiveShaderProgram(pipeline, program)
{
  global
  DllCall(PFNGLACTIVESHADERPROGRAMPROC, GLuint, pipeline, GLuint, program)
}

glCreateShaderProgramv(type, count, strings)
{
  global
  return DllCall(PFNGLCREATESHADERPROGRAMVPROC, GLenum, type, GLsizei, count, GLastr, strings, GLuint)
}

glBindProgramPipeline(pipeline)
{
  global
  DllCall(PFNGLBINDPROGRAMPIPELINEPROC, GLuint, pipeline)
}

glDeleteProgramPipelines(n, pipelines)
{
  global
  DllCall(PFNGLDELETEPROGRAMPIPELINESPROC, GLsizei, n, GLptr, pipelines)
}

glGenProgramPipelines(n, pipelines)
{
  global
  DllCall(PFNGLGENPROGRAMPIPELINESPROC, GLsizei, n, GLptr, pipelines)
}

glIsProgramPipeline(pipeline)
{
  global
  return DllCall(PFNGLISPROGRAMPIPELINEPROC, GLuint, pipeline, GLboolean)
}

glGetProgramPipelineiv(pipeline, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMPIPELINEIVPROC, GLuint, pipeline, GLenum, pname, GLptr, params)
}

glProgramUniform1i(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1IPROC, GLuint, program, GLint, location, GLint, v0)
}

glProgramUniform1iv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1IVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform1f(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1FPROC, GLuint, program, GLint, location, GLfloat, v0)
}

glProgramUniform1fv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1FVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform1d(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1DPROC, GLuint, program, GLint, location, GLdouble, v0)
}

glProgramUniform1dv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1DVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform1ui(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UIPROC, GLuint, program, GLint, location, GLuint, v0)
}

glProgramUniform1uiv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UIVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2i(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2IPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1)
}

glProgramUniform2iv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2IVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2f(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2FPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1)
}

glProgramUniform2fv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2FVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2d(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2DPROC, GLuint, program, GLint, location, GLdouble, v0, GLdouble, v1)
}

glProgramUniform2dv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2DVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2ui(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UIPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1)
}

glProgramUniform2uiv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UIVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3i(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3IPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1, GLint, v2)
}

glProgramUniform3iv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3IVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3f(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3FPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2)
}

glProgramUniform3fv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3FVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3d(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3DPROC, GLuint, program, GLint, location, GLdouble, v0, GLdouble, v1, GLdouble, v2)
}

glProgramUniform3dv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3DVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3ui(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UIPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2)
}

glProgramUniform3uiv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UIVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4i(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4IPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1, GLint, v2, GLint, v3)
}

glProgramUniform4iv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4IVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4f(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4FPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2, GLfloat, v3)
}

glProgramUniform4fv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4FVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4d(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4DPROC, GLuint, program, GLint, location, GLdouble, v0, GLdouble, v1, GLdouble, v2, GLdouble, v3)
}

glProgramUniform4dv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4DVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4ui(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UIPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2, GLuint, v3)
}

glProgramUniform4uiv(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UIVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniformMatrix2fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x3fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x2fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x4fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x2fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x4fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x3fv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x3dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x2dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x4dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x2dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x4dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x3dv(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glValidateProgramPipeline(pipeline)
{
  global
  DllCall(PFNGLVALIDATEPROGRAMPIPELINEPROC, GLuint, pipeline)
}

glGetProgramPipelineInfoLog(pipeline, bufSize, length, infoLog)
{
  global
  DllCall(PFNGLGETPROGRAMPIPELINEINFOLOGPROC, GLuint, pipeline, GLsizei, bufSize, GLptr, length, GLptr, infoLog)
}


GL_ARB_vertex_attrib_64bit := 1

glVertexAttribL1d(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1DPROC, GLuint, index, GLdouble, x)
}

glVertexAttribL2d(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2DPROC, GLuint, index, GLdouble, x, GLdouble, y)
}

glVertexAttribL3d(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3DPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexAttribL4d(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4DPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexAttribL1dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1DVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL2dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2DVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL3dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3DVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL4dv(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4DVPROC, GLuint, index, GLptr, v)
}

glVertexAttribLPointer(index, size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBLPOINTERPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glGetVertexAttribLdv(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBLDVPROC, GLuint, index, GLenum, pname, GLptr, params)
}


GL_ARB_viewport_array := 1

glViewportArrayv(first, count, v)
{
  global
  DllCall(PFNGLVIEWPORTARRAYVPROC, GLuint, first, GLsizei, count, GLptr, v)
}

glViewportIndexedf(index, x, y, w, h)
{
  global
  DllCall(PFNGLVIEWPORTINDEXEDFPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, w, GLfloat, h)
}

glViewportIndexedfv(index, v)
{
  global
  DllCall(PFNGLVIEWPORTINDEXEDFVPROC, GLuint, index, GLptr, v)
}

glScissorArrayv(first, count, v)
{
  global
  DllCall(PFNGLSCISSORARRAYVPROC, GLuint, first, GLsizei, count, GLptr, v)
}

glScissorIndexed(index, left, bottom, width, height)
{
  global
  DllCall(PFNGLSCISSORINDEXEDPROC, GLuint, index, GLint, left, GLint, bottom, GLsizei, width, GLsizei, height)
}

glScissorIndexedv(index, v)
{
  global
  DllCall(PFNGLSCISSORINDEXEDVPROC, GLuint, index, GLptr, v)
}

glDepthRangeArrayv(first, count, v)
{
  global
  DllCall(PFNGLDEPTHRANGEARRAYVPROC, GLuint, first, GLsizei, count, GLptr, v)
}

glDepthRangeIndexed(index, n, f)
{
  global
  DllCall(PFNGLDEPTHRANGEINDEXEDPROC, GLuint, index, GLclampd, n, GLclampd, f)
}

glGetFloati_v(target, index, data)
{
  global
  DllCall(PFNGLGETFLOATI_VPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetDoublei_v(target, index, data)
{
  global
  DllCall(PFNGLGETDOUBLEI_VPROC, GLenum, target, GLuint, index, GLptr, data)
}


GL_ARB_cl_event := 1

glCreateSyncFromCLeventARB(context, event, flags)
{
  global
  return DllCall(PFNGLCREATESYNCFROMCLEVENTARBPROC, GLptr, context, GLptr, event, GLbitfield, flags, GLsync)
}

GL_ARB_debug_output := 1

glDebugMessageControlARB(source, type, severity, count, ids, enabled)
{
  global
  DllCall(PFNGLDEBUGMESSAGECONTROLARBPROC, GLenum, source, GLenum, type, GLenum, severity, GLsizei, count, GLptr, ids, GLboolean, enabled)
}

glDebugMessageInsertARB(source, type, id, severity, length, buf)
{
  global
  DllCall(PFNGLDEBUGMESSAGEINSERTARBPROC, GLenum, source, GLenum, type, GLuint, id, GLenum, severity, GLsizei, length, GLptr, buf)
}

glDebugMessageCallbackARB(callback, userParam)
{
  global
  DllCall(PFNGLDEBUGMESSAGECALLBACKARBPROC, GLDEBUGPROCARB, callback, GLptr, userParam)
}

glGetDebugMessageLogARB(count, bufsize, sources, types, ids, severities, lengths, messageLog)
{
  global
  return DllCall(PFNGLGETDEBUGMESSAGELOGARBPROC, GLuint, count, GLsizei, bufsize, GLptr, sources, GLptr, tpes, GLptr, ids, GLptr, severtities, GLptr, lengths, GLptr, messageLog, GLuint)
}

GL_ARB_robustness := 1

glGetGraphicsResetStatusARB()
{
  global
  return DllCall(PFNGLGETGRPHICSRESETSTATUSARBPROC, GLuint)
}

glGetnMapdvARB(target, query, bufSize, v)
{
  global
  DllCall(PFNGLGETNMAPDVARBPROC, GLenum, target, GLenum, query, GLsizei, bufSize, GLptr, v)
}

glGetnMapfvARB(target, query, bufSize, v)
{
  global
  DllCall(PFNGLGETNMAPFVARBPROC, GLenum, target, GLenum, query, GLsizei, bufSize, GLptr, v)
}

glGetnMapivARB(target, query, bufSize, v)
{
  global
  DllCall(PFNGLGETNMAPIVARBPROC, GLenum, target, GLenum, query, GLsizei, bufSize, GLptr, v)
}

glGetnPixelMapfvARB(map, bufSize, values)
{
  global
  DllCall(PFNGLGETNPIXELMAPFVARBPROC, GLenum, map, GLsizei, bufSize, GLptr, values)
}

glGetnPixelMapuivARB(map, bufSize, values)
{
  global
  DllCall(PFNGLGETNPIXELMAPUIVARBPROC, GLenum, map, GLsizei, bufSize, GLptr, values)
}

glGetnPixelMapusvARB(map, bufSize, values)
{
  global
  DllCall(PFNGLGETNPIXELMAPUSVARBPROC, GLenum, map, GLsizei, bufSize, GLptr, values)
}

glGetnPolygonStippleARB(bufSize, pattern)
{
  global
  DllCall(PFNGLGETNPOLYGONSTIPPLEARBPROC, GLsizei, bufSize, GLptr, pattern)
}

glGetnColorTableARB(target, format, type, bufSize, table)
{
  global
  DllCall(PFNGLGETNCOLORTABLEARBPROC, GLenum, target, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, table)
}

glGetnConvolutionFilterARB(target, format, type, bufSize, image)
{
  global
  DllCall(PFNGLGETNCONVOLUTIONFILTERARBPROC, GLenum, target, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, image)
}

glGetnSeparableFilterARB(target, format, type, rowBufSize, row, columnBufSize, column, span)
{
  global
  DllCall(PFNGLGETNSEPARABLEFILTERARBPROC, GLenum, target, GLenum, format, GLenum, type, GLsizei, rowBufSize, GLptr, row, GLsizei, columnBufSize, GLptr, column, GLptr, span)
}

glGetnHistogramARB(target, reset, format, type, bufSize, values)
{
  global
  DllCall(PFNGLGETNHISTOGRAMARBPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, values)
}

glGetnMinmaxARB(target, reset, format, type, bufSize, values)
{
  global
  DllCall(PFNGLGETNMINMAXARBPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, values)
}

glGetnTexImageARB(target, level, format, type, bufSize, img)
{
  global
  DllCall(PFNGLGETNTEXIMAGEARBPROC, GLenum, target, GLint, level, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, img)
}

glReadnPixelsARB(x, y, width, height, format, type, bufSize, data)
{
  global
  DllCall(PFNGLREADNPIXELSARBPROC, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLsizei, bufSize, GLptr, data)
}

glGetnCompressedTexImageARB(target, lod, bufSize, img)
{
  global
  DllCall(PFNGLGETNCOMPRESSEDTEXIMAGEARBPROC, GLenum, target, GLint, lod, GLsizei, bufSize, GLptr, img)
}

glGetnUniformfvARB(program, location, bufSize, params)
{
  global
  DllCall(PFNGLGETNUNIFORMFVARBPROC, GLuint, program, GLint, location, GLsizei, bufSize, GLptr, params)
}

glGetnUniformivARB(program, location, bufSize, params)
{
  global
  DllCall(PFNGLGETNUNIFORMIVARBPROC, GLuint, program, GLint, location, GLsizei, bufSize, GLptr, params)
}

glGetnUniformuivARB(program, location, bufSize, params)
{
  global
  DllCall(PFNGLGETNUNIFORMUIVARBPROC, GLuint, program, GLint, location, GLsizei, bufSize, GLptr, params)
}

glGetnUniformdvARB(program, location, bufSize, params)
{
  global
  DllCall(PFNGLGETNUNIFORMDVARBPROC, GLuint, program, GLint, location, GLsizei, bufSize, GLptr, params)
}


GL_ARB_shader_stencil_export := 1
GL_EXT_abgr := 1
GL_EXT_blend_color := 1

glBlendColorEXT(red, green, blue, alpha)
{
  global
  DllCall(PFNGLBLENDCOLOREXTPROC, GLclampf, red, GLclampf, green, GLclampf, blue, GLclampf, alpha)
}


GL_EXT_polygon_offset := 1

glPolygonOffsetEXT(factor, bias)
{
  global
  DllCall(PFNGLPOLYGONOFFSETEXTPROC, GLfloat, factor, GLfloat, bias)
}


GL_EXT_texture := 1
GL_EXT_texture3D := 1

glTexImage3DEXT(target, level, internalformat, width, height, depth, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXIMAGE3DEXTPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexSubImage3DEXT(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE3DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLenum, type, GLptr, pixels)
}


GL_SGIS_texture_filter4 := 1

glGetTexFilterFuncSGIS(target, filter, weights)
{
  global
  DllCall(PFNGLGETTEXFILTERFUNCSGISPROC, GLenum, target, GLenum, filter, GLptr, weights)
}

glTexFilterFuncSGIS(target, filter, n, weights)
{
  global
  DllCall(PFNGLTEXFILTERFUNCSGISPROC, GLenum, target, GLenum, filter, GLsizei, n, GLptr, weights)
}


GL_EXT_subtexture := 1

glTexSubImage1DEXT(target, level, xoffset, width, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE1DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexSubImage2DEXT(target, level, xoffset, yoffset, width, height, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE2DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}


GL_EXT_copy_texture := 1

glCopyTexImage1DEXT(target, level, internalformat, x, y, width, border)
{
  global
  DllCall(PFNGLCOPYTEXIMAGE1DEXTPROC, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLint, border)
}

glCopyTexImage2DEXT(target, level, internalformat, x, y, width, height, border)
{
  global
  DllCall(PFNGLCOPYTEXIMAGE2DEXTPROC, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLint, border)
}

glCopyTexSubImage1DEXT(target, level, xoffset, x, y, width)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE1DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, x, GLint, y, GLsizei, width)
}

glCopyTexSubImage2DEXT(target, level, xoffset, yoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE2DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glCopyTexSubImage3DEXT(target, level, xoffset, yoffset, zoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXSUBIMAGE3DEXTPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}


GL_EXT_histogram := 1

glGetHistogramEXT(target, reset, format, type, values)
{
  global
  DllCall(PFNGLGETHISTOGRAMEXTPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLptr, values)
}

glGetHistogramParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETHISTOGRAMPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetHistogramParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETHISTOGRAMPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMinmaxEXT(target, reset, format, type, values)
{
  global
  DllCall(PFNGLGETMINMAXEXTPROC, GLenum, target, GLboolean, reset, GLenum, format, GLenum, type, GLptr, values)
}

glGetMinmaxParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETMINMAXPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMinmaxParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETMINMAXPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glHistogramEXT(target, width, internalformat, sink)
{
  global
  DllCall(PFNGLHISTOGRAMEXTPROC, GLenum, target, GLsizei, width, GLenum, internalformat, GLboolean, sink)
}

glMinmaxEXT(target, internalformat, sink)
{
  global
  DllCall(PFNGLMINMAXEXTPROC, GLenum, target, GLenum, internalformat, GLboolean, sink)
}

glResetHistogramEXT(target)
{
  global
  DllCall(PFNGLRESETHISTOGRAMEXTPROC, GLenum, target)
}

glResetMinmaxEXT(target)
{
  global
  DllCall(PFNGLRESETMINMAXEXTPROC, GLenum, target)
}


GL_EXT_convolution := 1

glConvolutionFilter1DEXT(target, internalformat, width, format, type, image)
{
  global
  DllCall(PFNGLCONVOLUTIONFILTER1DEXTPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLenum, format, GLenum, type, GLptr, image)
}

glConvolutionFilter2DEXT(target, internalformat, width, height, format, type, image)
{
  global
  DllCall(PFNGLCONVOLUTIONFILTER2DEXTPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, image)
}

glConvolutionParameterfEXT(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERFEXTPROC, GLenum, target, GLenum, pname, GLfloat, params)
}

glConvolutionParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glConvolutionParameteriEXT(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERIEXTPROC, GLenum, target, GLenum, pname, GLint, params)
}

glConvolutionParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLCONVOLUTIONPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glCopyConvolutionFilter1DEXT(target, internalformat, x, y, width)
{
  global
  DllCall(PFNGLCOPYCONVOLUTIONFILTER1DEXTPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width)
}

glCopyConvolutionFilter2DEXT(target, internalformat, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYCONVOLUTIONFILTER2DEXTPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glGetConvolutionFilterEXT(target, format, type, image)
{
  global
  DllCall(PFNGLGETCONVOLUTIONFILTEREXTPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, image)
}

glGetConvolutionParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCONVOLUTIONPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetConvolutionParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCONVOLUTIONPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetSeparableFilterEXT(target, format, type, row, column, span)
{
  global
  DllCall(PFNGLGETSEPARABLEFILTEREXTPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, row, GLptr, column, GLptr, span)
}

glSeparableFilter2DEXT(target, internalformat, width, height, format, type, row, column)
{
  global
  DllCall(PFNGLSEPARABLEFILTER2DEXTPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, row, GLptr, column)
}


GL_SGI_color_matrix := 1
GL_SGI_color_table := 1

glColorTableSGI(target, internalformat, width, format, type, table)
{
  global
  DllCall(PFNGLCOLORTABLESGIPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLenum, format, GLenum, type, GLptr, table)
}

glColorTableParameterfvSGI(target, pname, params)
{
  global
  DllCall(PFNGLCOLORTABLEPARAMETERFVSGIPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glColorTableParameterivSGI(target, pname, params)
{
  global
  DllCall(PFNGLCOLORTABLEPARAMETERIVSGIPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glCopyColorTableSGI(target, internalformat, x, y, width)
{
  global
  DllCall(PFNGLCOPYCOLORTABLESGIPROC, GLenum, target, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width)
}

glGetColorTableSGI(target, format, type, table)
{
  global
  DllCall(PFNGLGETCOLORTABLESGIPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, table)
}

glGetColorTableParameterfvSGI(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERFVSGIPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetColorTableParameterivSGI(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERIVSGIPROC, GLenum, target, GLenum, pname, GLptr, params)
}


GL_SGIX_pixel_texture := 1

glPixelTexGenSGIX(mode)
{
  global
  DllCall(PFNGLPIXELTEXGENSGIXPROC, GLenum, mode)
}


GL_SGIS_pixel_texture := 1

glPixelTexGenParameteriSGIS(pname, param)
{
  global
  DllCall(PFNGLPIXELTEXGENPARAMETERISGISPROC, GLenum, pname, GLint, param)
}

glPixelTexGenParameterivSGIS(pname, params)
{
  global
  DllCall(PFNGLPIXELTEXGENPARAMETERIVSGISPROC, GLenum, pname, GLptr, params)
}

glPixelTexGenParameterfSGIS(pname, param)
{
  global
  DllCall(PFNGLPIXELTEXGENPARAMETERFSGISPROC, GLenum, pname, GLfloat, param)
}

glPixelTexGenParameterfvSGIS(pname, params)
{
  global
  DllCall(PFNGLPIXELTEXGENPARAMETERFVSGISPROC, GLenum, pname, GLptr, params)
}

glGetPixelTexGenParameterivSGIS(pname, params)
{
  global
  DllCall(PFNGLGETPIXELTEXGENPARAMETERIVSGISPROC, GLenum, pname, GLptr, params)
}

glGetPixelTexGenParameterfvSGIS(pname, params)
{
  global
  DllCall(PFNGLGETPIXELTEXGENPARAMETERFVSGISPROC, GLenum, pname, GLptr, params)
}


GL_SGIS_texture4D := 1

glTexImage4DSGIS(target, level, internalformat, width, height, depth, size4d, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXIMAGE4DSGISPROC, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLsizei, size4d, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTexSubImage4DSGIS(target, level, xoffset, yoffset, zoffset, woffset, width, height, depth, size4d, format, type, pixels)
{
  global
  DllCall(PFNGLTEXSUBIMAGE4DSGISPROC, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLint, woffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLsizei, size4d, GLenum, format, GLenum, type, GLptr, pixels)
}


GL_SGI_texture_color_table := 1

GL_EXT_cmyka := 1

GL_EXT_texture_object := 1

glAreTexturesResidentEXT(n, textures, residences)
{
  global
  return DllCall(PFNGLARETEXTURESRESIDENTEXTPROC, GLsizei, n, GLptr, textures, GLptr, residences, GLboolean)
}

glBindTextureEXT(target, texture)
{
  global
  DllCall(PFNGLBINDTEXTUREEXTPROC, GLenum, target, GLuint, texture)
}

glDeleteTexturesEXT(n, textures)
{
  global
  DllCall(PFNGLDELETETEXTURESEXTPROC, GLsizei, n, GLptr, textures)
}

glGenTexturesEXT(n, textures)
{
  global
  DllCall(PFNGLGENTEXTURESEXTPROC, GLsizei, n, GLptr, textures)
}

glIsTextureEXT(texture)
{
  global
  return DllCall(PFNGLISTEXTUREEXTPROC, GLuint, texture, GLboolean)
}

glPrioritizeTexturesEXT(n, textures, priorities)
{
  global
  DllCall(PFNGLPRIORITIZETEXTURESEXTPROC, GLsizei, n, GLptr, textures, GLptr, priorities)
}


GL_SGIS_detail_texture := 1

glDetailTexFuncSGIS(target, n, points)
{
  global
  DllCall(PFNGLDETAILTEXFUNCSGISPROC, GLenum, target, GLsizei, n, GLptr, points)
}

glGetDetailTexFuncSGIS(target, points)
{
  global
  DllCall(PFNGLGETDETAILTEXFUNCSGISPROC, GLenum, target, GLptr, points)
}


GL_SGIS_sharpen_texture := 1
glSharpenTexFuncSGIS(target, n, points)
{
  global
  DllCall(PFNGLSHARPENTEXFUNCSGISPROC, GLenum, target, GLsizei, n, GLptr, points)
}

glGetSharpenTexFuncSGIS(target, points)
{
  global
  DllCall(PFNGLGETSHARPENTEXFUNCSGISPROC, GLenum, target, GLptr, points)
}


GL_EXT_packed_pixels := 1
GL_SGIS_texture_lod := 1
GL_SGIS_multisample := 1

glSampleMaskSGIS(value, invert)
{
  global
  DllCall(PFNGLSAMPLEMASKSGISPROC, GLclampf, value, GLboolean, invert)
}

glSamplePatternSGIS(pattern)
{
  global
  DllCall(PFNGLSAMPLEPATTERNSGISPROC, GLenum, pattern)
}


GL_EXT_rescale_normal := 1
GL_EXT_vertex_array := 1

/*
;Duplicate function definition
glArrayElementEXT(i)
{
  global
  DllCall(PFNGLARRAYELEMENTEXTPROC, GLint, i)
}
*/

/*
;Duplicate function definition
glColorPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLCOLORPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/

/*
;Duplicate function definition
glDrawArraysEXT(mode, first, count)
{
  global
  DllCall(PFNGLDRAWARRAYSEXTPROC, GLenum, mode, GLint, first, GLsizei, count)
}
*/

/*
glEdgeFlagPointerEXT(stride, count, pointer)
{
  global
  DllCall(PFNGLEDGEFLAGPOINTEREXTPROC, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/
/*
glGetPointervEXT(pname, params)
{
  global
  DllCall(PFNGLGETPOINTERVEXTPROC, GLenum, pname, GLptr, params)
}
*/
/*
glIndexPointerEXT(type, stride, count, pointer)
{
  global
  DllCall(PFNGLINDEXPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/
/*
glNormalPointerEXT(type, stride, count, pointer)
{
  global
  DllCall(PFNGLNORMALPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/
/*
glTexCoordPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLTEXCOORDPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/
/*
glVertexPointerEXT(size, type, stride, count, pointer)
{
  global
  DllCall(PFNGLVERTEXPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLsizei, count, GLptr, pointer)
}
*/

GL_EXT_misc_attribute := 1
GL_SGIS_generate_mipmap := 1
GL_SGIX_clipmap := 1
GL_SGIX_shadow := 1
GL_SGIS_texture_edge_clamp := 1
GL_SGIS_texture_border_clamp := 1
GL_EXT_blend_minmax := 1

glBlendEquationEXT(mode)
{
  global
  DllCall(PFNGLBLENDEQUATIONEXTPROC, GLenum, mode)
}


GL_EXT_blend_subtract := 1
GL_EXT_blend_logic_op := 1
GL_SGIX_interlace := 1
GL_SGIX_pixel_tiles := 1
GL_SGIX_texture_select := 1
GL_SGIX_sprite := 1

glSpriteParameterfSGIX(pname, param)
{
  global
  DllCall(PFNGLSPRITEPARAMETERFSGIXPROC, GLenum, pname, GLfloat, param)
}

glSpriteParameterfvSGIX(pname, params)
{
  global
  DllCall(PFNGLSPRITEPARAMETERFVSGIXPROC, GLenum, pname, GLptr, params)
}

glSpriteParameteriSGIX(pname, param)
{
  global
  DllCall(PFNGLSPRITEPARAMETERISGIXPROC, GLenum, pname, GLint, param)
}

glSpriteParameterivSGIX(pname, params)
{
  global
  DllCall(PFNGLSPRITEPARAMETERIVSGIXPROC, GLenum, pname, GLptr, params)
}


GL_SGIX_texture_multi_buffer := 1
GL_EXT_point_parameters := 1

glPointParameterfEXT(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERFEXTPROC, GLenum, pname, GLfloat, param)
}

glPointParameterfvEXT(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERFVEXTPROC, GLenum, pname, GLptr, params)
}


GL_SGIS_point_parameters := 1

glPointParameterfSGIS(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERFSGISPROC, GLenum, pname, GLfloat, param)
}

glPointParameterfvSGIS(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERFVSGISPROC, GLenum, pname, GLptr, params)
}


GL_SGIX_instruments := 1

glGetInstrumentsSGIX()
{
  global
  return DllCall(PFNGLGETINSTRUMENTSSGIXPROC, GLint)
}

glInstrumentsBufferSGIX(size, buffer)
{
  global
  DllCall(PFNGLINSTRUMENTSBUFFERSGIXPROC, GLsizei, size, GLptr, buffer)
}

glPollInstrumentsSGIX(marker_p)
{
  global
  return DllCall(PFNGLPOLLINSTRUMENTSSGIXPROC, GLptr, marker_p, GLint)
}

glReadInstrumentsSGIX(marker)
{
  global
  DllCall(PFNGLREADINSTRUMENTSSGIXPROC, GLint, marker)
}

glStartInstrumentsSGIX()
{
  global
  DllCall(PFNGLSTARTINSTRUMENTSSGIXPROC)
}

glStopInstrumentsSGIX(marker)
{
  global
  DllCall(PFNGLSTOPINSTRUMENTSSGIXPROC, GLint, marker)
}


GL_SGIX_texture_scale_bias := 1
GL_SGIX_framezoom := 1

glFrameZoomSGIX(factor)
{
  global
  DllCall(PFNGLFRAMEZOOMSGIXPROC, GLint, factor)
}


GL_SGIX_tag_sample_buffer := 1

glTagSampleBufferSGIX()
{
  global
  DllCall(PFNGLTAGSAMPLEBUFFERSGIXPROC)
}


GL_SGIX_polynomial_ffd := 1

glDeformationMap3dSGIX(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, w1, w2, wstride, worder, points)
{
  global
  DllCall(PFNGLDEFORMATIONMAP3DSGIXPROC, GLenum, target, GLdouble, u1, GLdouble, u2, GLint, ustride, GLint, uorder, GLdouble, v1, GLdouble, v2, GLint, vstride, GLint, vorder, GLdouble, w1, GLdouble, w2, GLint, wstride, GLint, worder, GLptr, points)
}

glDeformationMap3fSGIX(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, w1, w2, wstride, worder, points)
{
  global
  DllCall(PFNGLDEFORMATIONMAP3FSGIXPROC, GLenum, target, GLfloat, u1, GLfloat, u2, GLint, ustride, GLint, uorder, GLfloat, v1, GLfloat, v2, GLint, vstride, GLint, vorder, GLfloat, w1, GLfloat, w2, GLint, wstride, GLint, worder, GLptr, points)
}

glDeformSGIX(mask)
{
  global
  DllCall(PFNGLDEFORMSGIXPROC, GLbitfield, mask)
}

glLoadIdentityDeformationMapSGIX(mask)
{
  global
  DllCall(PFNGLLOADIDENTITYDEFORMATIONMAPSGIXPROC, GLbitfield, mask)
}


GL_SGIX_reference_plane := 1

glReferencePlaneSGIX(equation)
{
  global
  DllCall(PFNGLREFERENCEPLANESGIXPROC, GLptr, equation)
}


GL_SGIX_flush_raster := 1

glFlushRasterSGIX()
{
  global
  DllCall(PFNGLFLUSHRASTERSGIXPROC)
}


GL_SGIX_depth_texture := 1
GL_SGIS_fog_function := 1

glFogFuncSGIS(n, points)
{
  global
  DllCall(PFNGLFOGFUNCSGISPROC, GLsizei, n, GLptr, points)
}

glGetFogFuncSGIS(points)
{
  global
  DllCall(PFNGLGETFOGFUNCSGISPROC, GLptr, points)
}


GL_SGIX_fog_offset := 1
GL_HP_image_transform := 1

glImageTransformParameteriHP(target, pname, param)
{
  global
  DllCall(PFNGLIMAGETRANSFORMPARAMETERIHPPROC, GLenum, target, GLenum, pname, GLint, param)
}

glImageTransformParameterfHP(target, pname, param)
{
  global
  DllCall(PFNGLIMAGETRANSFORMPARAMETERFHPPROC, GLenum, target, GLenum, pname, GLfloat, param)
}

glImageTransformParameterivHP(target, pname, params)
{
  global
  DllCall(PFNGLIMAGETRANSFORMPARAMETERIVHPPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glImageTransformParameterfvHP(target, pname, params)
{
  global
  DllCall(PFNGLIMAGETRANSFORMPARAMETERFVHPPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetImageTransformParameterivHP(target, pname, params)
{
  global
  DllCall(PFNGLGETIMAGETRANSFORMPARAMETERIVHPPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetImageTransformParameterfvHP(target, pname, params)
{
  global
  DllCall(PFNGLGETIMAGETRANSFORMPARAMETERFVHPPROC, GLenum, target, GLenum, pname, GLptr, params)
}


GL_HP_convolution_border_modes := 1
GL_SGIX_texture_add_env := 1
GL_EXT_color_subtable := 1

/*
glColorSubTableEXT(target, start, count, format, type, data)
{
  global
  DllCall(PFNGLCOLORSUBTABLEEXTPROC, GLenum, target, GLsizei, start, GLsizei, count, GLenum, format, GLenum, type, GLptr, data)
}
*/

glCopyColorSubTableEXT(target, start, x, y, width)
{
  global
  DllCall(PFNGLCOPYCOLORSUBTABLEEXTPROC, GLenum, target, GLsizei, start, GLint, x, GLint, y, GLsizei, width)
}


GL_PGI_vertex_hints := 1
GL_PGI_misc_hints := 1

glHintPGI(target, mode)
{
  global
  DllCall(PFNGLHINTPGIPROC, GLenum, target, GLint, mode)
}


GL_EXT_paletted_texture := 1

/*
glColorTableEXT(target, internalFormat, width, format, type, table)
{
  global
  DllCall(PFNGLCOLORTABLEEXTPROC, GLenum, target, GLenum, internalFormat, GLsizei, width, GLenum, format, GLenum, type, GLptr, table)
}
*/
/*
glGetColorTableEXT(target, format, type, data)
{
  global
  DllCall(PFNGLGETCOLORTABLEEXTPROC, GLenum, target, GLenum, format, GLenum, type, GLptr, data)
}
*/
/*
glGetColorTableParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}
*/
/*
glGetColorTableParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETCOLORTABLEPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}
*/


GL_EXT_clip_volume_hint := 1
GL_SGIX_list_priority := 1

glGetListParameterfvSGIX(list, pname, params)
{
  global
  DllCall(PFNGLGETLISTPARAMETERFVSGIXPROC, GLuint, list, GLenum, pname, GLptr, params)
}

glGetListParameterivSGIX(list, pname, params)
{
  global
  DllCall(PFNGLGETLISTPARAMETERIVSGIXPROC, GLuint, list, GLenum, pname, GLptr, params)
}

glListParameterfSGIX(list, pname, param)
{
  global
  DllCall(PFNGLLISTPARAMETERFSGIXPROC, GLuint, list, GLenum, pname, GLfloat, param)
}

glListParameterfvSGIX(list, pname, params)
{
  global
  DllCall(PFNGLLISTPARAMETERFVSGIXPROC, GLuint, list, GLenum, pname, GLptr, params)
}

glListParameteriSGIX(list, pname, param)
{
  global
  DllCall(PFNGLLISTPARAMETERISGIXPROC, GLuint, list, GLenum, pname, GLint, param)
}

glListParameterivSGIX(list, pname, params)
{
  global
  DllCall(PFNGLLISTPARAMETERIVSGIXPROC, GLuint, list, GLenum, pname, GLptr, params)
}


GL_SGIX_ir_instrument1 := 1
GL_SGIX_calligraphic_fragment := 1
GL_SGIX_texture_lod_bias := 1
GL_SGIX_shadow_ambient := 1
GL_EXT_index_texture := 1
GL_EXT_index_material := 1

glIndexMaterialEXT(face, mode)
{
  global
  DllCall(PFNGLINDEXMATERIALEXTPROC, GLenum, face, GLenum, mode)
}


GL_EXT_index_func := 1

glIndexFuncEXT(func, ref)
{
  global
  DllCall(PFNGLINDEXFUNCEXTPROC, GLenum, func, GLclampf, ref)
}


GL_EXT_index_array_formats := 1
GL_EXT_compiled_vertex_array := 1

glLockArraysEXT(first, count)
{
  global
  DllCall(PFNGLLOCKARRAYSEXTPROC, GLint, first, GLsizei, count)
}

glUnlockArraysEXT()
{
  global
  DllCall(PFNGLUNLOCKARRAYSEXTPROC)
}


GL_EXT_cull_vertex := 1

glCullParameterdvEXT(pname, params)
{
  global
  DllCall(PFNGLCULLPARAMETERDVEXTPROC, GLenum, pname, GLptr, params)
}

glCullParameterfvEXT(pname, params)
{
  global
  DllCall(PFNGLCULLPARAMETERFVEXTPROC, GLenum, pname, GLptr, params)
}


GL_SGIX_ycrcb := 1
GL_SGIX_fragment_lighting := 1

glFragmentColorMaterialSGIX(face, mode)
{
  global
  DllCall(PFNGLFRAGMENTCOLORMATERIALSGIXPROC, GLenum, face, GLenum, mode)
}

glFragmentLightfSGIX(light, pname, param)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTFSGIXPROC, GLenum, light, GLenum, pname, GLfloat, param)
}

glFragmentLightfvSGIX(light, pname, params)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTFVSGIXPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glFragmentLightiSGIX(light, pname, param)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTISGIXPROC, GLenum, light, GLenum, pname, GLint, param)
}

glFragmentLightivSGIX(light, pname, params)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTIVSGIXPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glFragmentLightModelfSGIX(pname, param)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTMODELFSGIXPROC, GLenum, pname, GLfloat, param)
}

glFragmentLightModelfvSGIX(pname, params)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTMODELFVSGIXPROC, GLenum, pname, GLptr, params)
}

glFragmentLightModeliSGIX(pname, param)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTMODELISGIXPROC, GLenum, pname, GLint, param)
}

glFragmentLightModelivSGIX(pname, params)
{
  global
  DllCall(PFNGLFRAGMENTLIGHTMODELIVSGIXPROC, GLenum, pname, GLptr, params)
}

glFragmentMaterialfSGIX(face, pname, param)
{
  global
  DllCall(PFNGLFRAGMENTMATERIALFSGIXPROC, GLenum, face, GLenum, pname, GLfloat, param)
}

glFragmentMaterialfvSGIX(face, pname, params)
{
  global
  DllCall(PFNGLFRAGMENTMATERIALFVSGIXPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glFragmentMaterialiSGIX(face, pname, param)
{
  global
  DllCall(PFNGLFRAGMENTMATERIALISGIXPROC, GLenum, face, GLenum, pname, GLint, param)
}

glFragmentMaterialivSGIX(face, pname, params)
{
  global
  DllCall(PFNGLFRAGMENTMATERIALIVSGIXPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glGetFragmentLightfvSGIX(light, pname, params)
{
  global
  DllCall(PFNGLGETFRAGMENTLIGHTFVSGIXPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glGetFragmentLightivSGIX(light, pname, params)
{
  global
  DllCall(PFNGLGETFRAGMENTLIGHTIVSGIXPROC, GLenum, light, GLenum, pname, GLptr, params)
}

glGetFragmentMaterialfvSGIX(face, pname, params)
{
  global
  DllCall(PFNGLGETFRAGMENTMATERIALFVSGIXPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glGetFragmentMaterialivSGIX(face, pname, params)
{
  global
  DllCall(PFNGLGETFRAGMENTMATERIALIVSGIXPROC, GLenum, face, GLenum, pname, GLptr, params)
}

glLightEnviSGIX(pname, param)
{
  global
  DllCall(PFNGLLIGHTENVISGIXPROC, GLenum, pname, GLint, param)
}


GL_IBM_rasterpos_clip := 1
GL_HP_texture_lighting := 1
GL_EXT_draw_range_elements := 1

glDrawRangeElementsEXT(mode, start, end, count, type, indices)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTSEXTPROC, GLenum, mode, GLuint, start, GLuint, end, GLsizei, count, GLenum, type, GLptr, indices)
}


GL_WIN_phong_shading := 1

GL_WIN_specular_fog := 1

GL_EXT_light_texture := 1

glApplyTextureEXT(mode)
{
  global
  DllCall(PFNGLAPPLYTEXTUREEXTPROC, GLenum, mode)
}

glTextureLightEXT(pname)
{
  global
  DllCall(PFNGLTEXTURELIGHTEXTPROC, GLenum, pname)
}

glTextureMaterialEXT(face, mode)
{
  global
  DllCall(PFNGLTEXTUREMATERIALEXTPROC, GLenum, face, GLenum, mode)
}


GL_SGIX_blend_alpha_minmax := 1
GL_EXT_bgra := 1
GL_SGIX_async := 1

glAsyncMarkerSGIX(marker)
{
  global
  DllCall(PFNGLASYNCMARKERSGIXPROC, GLuint, marker)
}

glFinishAsyncSGIX(markerp)
{
  global
  return DllCall(PFNGLFINISHASYNCSGIXPROC, GLptr, markerp, GLint)
}

glPollAsyncSGIX(markerp)
{
  global
  return DllCall(PFNGLPOLLASYNCSGIXPROC, GLptr, markerp, GLint)
}


glGenAsyncMarkersSGIX(range)
{
  global
  return DllCall(PFNGLGENASYNCMARKERSSGIXPROC, GLsizei, range, GLuint)
}

glDeleteAsyncMarkersSGIX(marker, range)
{
  global
  DllCall(PFNGLDELETEASYNCMARKERSSGIXPROC, GLuint, marker, GLsizei, range)
}

glIsAsyncMarkerSGIX(marker)
{
  global
  return DllCall(PFNGLISASYNCMARKERSGIXPROC, GLuint, marker, GLboolean)
}

GL_SGIX_async_pixel := 1
GL_SGIX_async_histogram := 1
GL_INTEL_parallel_arrays := 1

glVertexPointervINTEL(size, type, pointer)
{
  global
  DllCall(PFNGLVERTEXPOINTERVINTELPROC, GLint, size, GLenum, type, GLptr, pointer)
}

glNormalPointervINTEL(type, pointer)
{
  global
  DllCall(PFNGLNORMALPOINTERVINTELPROC, GLenum, type, GLptr, pointer)
}

glColorPointervINTEL(size, type, pointer)
{
  global
  DllCall(PFNGLCOLORPOINTERVINTELPROC, GLint, size, GLenum, type, GLptr, pointer)
}

glTexCoordPointervINTEL(size, type, pointer)
{
  global
  DllCall(PFNGLTEXCOORDPOINTERVINTELPROC, GLint, size, GLenum, type, GLptr, pointer)
}


GL_HP_occlusion_test := 1
GL_EXT_pixel_transform := 1

glPixelTransformParameteriEXT(target, pname, param)
{
  global
  DllCall(PFNGLPIXELTRANSFORMPARAMETERIEXTPROC, GLenum, target, GLenum, pname, GLint, param)
}

glPixelTransformParameterfEXT(target, pname, param)
{
  global
  DllCall(PFNGLPIXELTRANSFORMPARAMETERFEXTPROC, GLenum, target, GLenum, pname, GLfloat, param)
}

glPixelTransformParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLPIXELTRANSFORMPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glPixelTransformParameterfvEXT(target, pname, params)
{
  global
  DllCall(PFNGLPIXELTRANSFORMPARAMETERFVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}


GL_EXT_pixel_transform_color_table := 1
GL_EXT_shared_texture_palette := 1
GL_EXT_separate_specular_color := 1
GL_EXT_secondary_color := 1

glSecondaryColor3bEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3BEXTPROC, GLbyte, red, GLbyte, green, GLbyte, blue)
}

glSecondaryColor3bvEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3BVEXTPROC, GLptr, v)
}

glSecondaryColor3dEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3DEXTPROC, GLdouble, red, GLdouble, green, GLdouble, blue)
}

glSecondaryColor3dvEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3DVEXTPROC, GLptr, v)
}

glSecondaryColor3fEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3FEXTPROC, GLfloat, red, GLfloat, green, GLfloat, blue)
}

glSecondaryColor3fvEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3FVEXTPROC, GLptr, v)
}

glSecondaryColor3iEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3IEXTPROC, GLint, red, GLint, green, GLint, blue)
}

glSecondaryColor3ivEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3IVEXTPROC, GLptr, v)
}

glSecondaryColor3sEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3SEXTPROC, GLshort, red, GLshort, green, GLshort, blue)
}

glSecondaryColor3svEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3SVEXTPROC, GLptr, v)
}

glSecondaryColor3ubEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UBEXTPROC, GLubyte, red, GLubyte, green, GLubyte, blue)
}

glSecondaryColor3ubvEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UBVEXTPROC, GLptr, v)
}

glSecondaryColor3uiEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UIEXTPROC, GLuint, red, GLuint, green, GLuint, blue)
}

glSecondaryColor3uivEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3UIVEXTPROC, GLptr, v)
}

glSecondaryColor3usEXT(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3USEXTPROC, GLushort, red, GLushort, green, GLushort, blue)
}

glSecondaryColor3usvEXT(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3USVEXTPROC, GLptr, v)
}

glSecondaryColorPointerEXT(size, type, stride, pointer)
{
  global
  DllCall(PFNGLSECONDARYCOLORPOINTEREXTPROC, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_EXT_texture_perturb_normal := 1

glTextureNormalEXT(mode)
{
  global
  DllCall(PFNGLTEXTURENORMALEXTPROC, GLenum, mode)
}


GL_EXT_multi_draw_arrays := 1

glMultiDrawArraysEXT(mode, first, count, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWARRAYSEXTPROC, GLenum, mode, GLptr, first, GLptr, count, GLsizei, primcount)
}

glMultiDrawElementsEXT(mode, count, type, indices, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWELEMENTSEXTPROC, GLenum, mode, GLptr, count, GLenum, type, GLptr, indices, GLsizei, primcount)
}


GL_EXT_fog_coord := 1

glFogCoordfEXT(coord)
{
  global
  DllCall(PFNGLFOGCOORDFEXTPROC, GLfloat, coord)
}

glFogCoordfvEXT(coord)
{
  global
  DllCall(PFNGLFOGCOORDFVEXTPROC, GLptr, coord)
}

glFogCoorddEXT(coord)
{
  global
  DllCall(PFNGLFOGCOORDDEXTPROC, GLdouble, coord)
}

glFogCoorddvEXT(coord)
{
  global
  DllCall(PFNGLFOGCOORDDVEXTPROC, GLptr, coord)
}

glFogCoordPointerEXT(type, stride, pointer)
{
  global
  DllCall(PFNGLFOGCOORDPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_REND_screen_coordinates := 1
GL_EXT_coordinate_frame := 1

glTangent3bEXT(tx, ty, tz)
{
  global
  DllCall(PFNGLTANGENT3BEXTPROC, GLbyte, tx, GLbyte, ty, GLbyte, tz)
}

glTangent3bvEXT(v)
{
  global
  DllCall(PFNGLTANGENT3BVEXTPROC, GLptr, v)
}

glTangent3dEXT(tx, ty, tz)
{
  global
  DllCall(PFNGLTANGENT3DEXTPROC, GLdouble, tx, GLdouble, ty, GLdouble, tz)
}

glTangent3dvEXT(v)
{
  global
  DllCall(PFNGLTANGENT3DVEXTPROC, GLptr, v)
}

glTangent3fEXT(tx, ty, tz)
{
  global
  DllCall(PFNGLTANGENT3FEXTPROC, GLfloat, tx, GLfloat, ty, GLfloat, tz)
}

glTangent3fvEXT(v)
{
  global
  DllCall(PFNGLTANGENT3FVEXTPROC, GLptr, v)
}

glTangent3iEXT(tx, ty, tz)
{
  global
  DllCall(PFNGLTANGENT3IEXTPROC, GLint, tx, GLint, ty, GLint, tz)
}

glTangent3ivEXT(v)
{
  global
  DllCall(PFNGLTANGENT3IVEXTPROC, GLptr, v)
}

glTangent3sEXT(tx, ty, tz)
{
  global
  DllCall(PFNGLTANGENT3SEXTPROC, GLshort, tx, GLshort, ty, GLshort, tz)
}

glTangent3svEXT(v)
{
  global
  DllCall(PFNGLTANGENT3SVEXTPROC, GLptr, v)
}

glBinormal3bEXT(bx, by, bz)
{
  global
  DllCall(PFNGLBINORMAL3BEXTPROC, GLbyte, bx, GLbyte, by, GLbyte, bz)
}

glBinormal3bvEXT(v)
{
  global
  DllCall(PFNGLBINORMAL3BVEXTPROC, GLptr, v)
}

glBinormal3dEXT(bx, by, bz)
{
  global
  DllCall(PFNGLBINORMAL3DEXTPROC, GLdouble, bx, GLdouble, by, GLdouble, bz)
}

glBinormal3dvEXT(v)
{
  global
  DllCall(PFNGLBINORMAL3DVEXTPROC, GLptr, v)
}

glBinormal3fEXT(bx, by, bz)
{
  global
  DllCall(PFNGLBINORMAL3FEXTPROC, GLfloat, bx, GLfloat, by, GLfloat, bz)
}

glBinormal3fvEXT(v)
{
  global
  DllCall(PFNGLBINORMAL3FVEXTPROC, GLptr, v)
}

glBinormal3iEXT(bx, by, bz)
{
  global
  DllCall(PFNGLBINORMAL3IEXTPROC, GLint, bx, GLint, by, GLint, bz)
}

glBinormal3ivEXT(v)
{
  global
  DllCall(PFNGLBINORMAL3IVEXTPROC, GLptr, v)
}

glBinormal3sEXT(bx, by, bz)
{
  global
  DllCall(PFNGLBINORMAL3SEXTPROC, GLshort, bx, GLshort, by, GLshort, bz)
}

glBinormal3svEXT(v)
{
  global
  DllCall(PFNGLBINORMAL3SVEXTPROC, GLptr, v)
}

glTangentPointerEXT(type, stride, pointer)
{
  global
  DllCall(PFNGLTANGENTPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glBinormalPointerEXT(type, stride, pointer)
{
  global
  DllCall(PFNGLBINORMALPOINTEREXTPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_EXT_texture_env_combine := 1
GL_APPLE_specular_vector := 1
GL_APPLE_transform_hint := 1
GL_SGIX_fog_scale := 1
GL_SUNX_constant_data := 1

glFinishTextureSUNX()
{
  global
  DllCall(PFNGLFINISHTEXTURESUNXPROC)
}


GL_SUN_global_alpha := 1

glGlobalAlphaFactorbSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORBSUNPROC, GLbyte, factor)
}

glGlobalAlphaFactorsSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORSSUNPROC, GLshort, factor)
}

glGlobalAlphaFactoriSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORISUNPROC, GLint, factor)
}

glGlobalAlphaFactorfSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORFSUNPROC, GLfloat, factor)
}

glGlobalAlphaFactordSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORDSUNPROC, GLdouble, factor)
}

glGlobalAlphaFactorubSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORUBSUNPROC, GLubyte, factor)
}

glGlobalAlphaFactorusSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORUSSUNPROC, GLushort, factor)
}

glGlobalAlphaFactoruiSUN(factor)
{
  global
  DllCall(PFNGLGLOBALALPHAFACTORUISUNPROC, GLuint, factor)
}


GL_SUN_triangle_list := 1

glReplacementCodeuiSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUISUNPROC, GLuint, code)
}

glReplacementCodeusSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUSSUNPROC, GLushort, code)
}

glReplacementCodeubSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUBSUNPROC, GLubyte, code)
}

glReplacementCodeuivSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUIVSUNPROC, GLptr, code)
}

glReplacementCodeusvSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUSVSUNPROC, GLptr, code)
}

glReplacementCodeubvSUN(code)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUBVSUNPROC, GLptr, code)
}

glReplacementCodePointerSUN(type, stride, pointer)
{
  global
  DllCall(PFNGLREPLACEMENTCODEPOINTERSUNPROC, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_SUN_vertex := 1

glColor4ubVertex2fSUN(r, g, b, a, x, y)
{
  global
  DllCall(PFNGLCOLOR4UBVERTEX2FSUNPROC, GLubyte, r, GLubyte, g, GLubyte, b, GLubyte, a, GLfloat, x, GLfloat, y)
}

glColor4ubVertex2fvSUN(c, v)
{
  global
  DllCall(PFNGLCOLOR4UBVERTEX2FVSUNPROC, GLptr, c, GLptr, v)
}

glColor4ubVertex3fSUN(r, g, b, a, x, y, z)
{
  global
  DllCall(PFNGLCOLOR4UBVERTEX3FSUNPROC, GLubyte, r, GLubyte, g, GLubyte, b, GLubyte, a, GLfloat, x, GLfloat, y, GLfloat, z)
}

glColor4ubVertex3fvSUN(c, v)
{
  global
  DllCall(PFNGLCOLOR4UBVERTEX3FVSUNPROC, GLptr, c, GLptr, v)
}

glColor3fVertex3fSUN(r, g, b, x, y, z)
{
  global
  DllCall(PFNGLCOLOR3FVERTEX3FSUNPROC, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, x, GLfloat, y, GLfloat, z)
}

glColor3fVertex3fvSUN(c, v)
{
  global
  DllCall(PFNGLCOLOR3FVERTEX3FVSUNPROC, GLptr, c, GLptr, v)
}

glNormal3fVertex3fSUN(nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLNORMAL3FVERTEX3FSUNPROC, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glNormal3fVertex3fvSUN(n, v)
{
  global
  DllCall(PFNGLNORMAL3FVERTEX3FVSUNPROC, GLptr, n, GLptr, v)
}

glColor4fNormal3fVertex3fSUN(r, g, b, a, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLCOLOR4FNORMAL3FVERTEX3FSUNPROC, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, a, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glColor4fNormal3fVertex3fvSUN(c, n, v)
{
  global
  DllCall(PFNGLCOLOR4FNORMAL3FVERTEX3FVSUNPROC, GLptr, c, GLptr, n, GLptr, v)
}

glTexCoord2fVertex3fSUN(s, t, x, y, z)
{
  global
  DllCall(PFNGLTEXCOORD2FVERTEX3FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, x, GLfloat, y, GLfloat, z)
}

glTexCoord2fVertex3fvSUN(tc, v)
{
  global
  DllCall(PFNGLTEXCOORD2FVERTEX3FVSUNPROC, GLptr, tc, GLptr, v)
}

glTexCoord4fVertex4fSUN(s, t, p, q, x, y, z, w)
{
  global
  DllCall(PFNGLTEXCOORD4FVERTEX4FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, p, GLfloat, q, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glTexCoord4fVertex4fvSUN(tc, v)
{
  global
  DllCall(PFNGLTEXCOORD4FVERTEX4FVSUNPROC, GLptr, tc, GLptr, v)
}

glTexCoord2fColor4ubVertex3fSUN(s, t, r, g, b, a, x, y, z)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR4UBVERTEX3FSUNPROC, GLfloat, s, GLfloat, t, GLubyte, r, GLubyte, g, GLubyte, b, GLubyte, a, GLfloat, x, GLfloat, y, GLfloat, z)
}

glTexCoord2fColor4ubVertex3fvSUN(tc, c, v)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR4UBVERTEX3FVSUNPROC, GLptr, tc, GLptr, c, GLptr, v)
}

glTexCoord2fColor3fVertex3fSUN(s, t, r, g, b, x, y, z)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR3FVERTEX3FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, x, GLfloat, y, GLfloat, z)
}

glTexCoord2fColor3fVertex3fvSUN(tc, c, v)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR3FVERTEX3FVSUNPROC, GLptr, tc, GLptr, c, GLptr, v)
}

glTexCoord2fNormal3fVertex3fSUN(s, t, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLTEXCOORD2FNORMAL3FVERTEX3FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glTexCoord2fNormal3fVertex3fvSUN(tc, n, v)
{
  global
  DllCall(PFNGLTEXCOORD2FNORMAL3FVERTEX3FVSUNPROC, GLptr, tc, GLptr, n, GLptr, v)
}

glTexCoord2fColor4fNormal3fVertex3fSUN(s, t, r, g, b, a, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, a, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glTexCoord2fColor4fNormal3fVertex3fvSUN(tc, c, n, v)
{
  global
  DllCall(PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC, GLptr, tc, GLptr, c, GLptr, n, GLptr, v)
}

glTexCoord4fColor4fNormal3fVertex4fSUN(s, t, p, q, r, g, b, a, nx, ny, nz, x, y, z, w)
{
  global
  DllCall(PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FSUNPROC, GLfloat, s, GLfloat, t, GLfloat, p, GLfloat, q, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, a, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glTexCoord4fColor4fNormal3fVertex4fvSUN(tc, c, n, v)
{
  global
  DllCall(PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FVSUNPROC, GLptr, tc, GLptr, c, GLptr, n, GLptr, v)
}

glReplacementCodeuiVertex3fSUN(rc, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUIVERTEX3FSUNPROC, GLuint, rc, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiVertex3fvSUN(rc, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUIVERTEX3FVSUNPROC, GLptr, rc, GLptr, v)
}

glReplacementCodeuiColor4ubVertex3fSUN(rc, r, g, b, a, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FSUNPROC, GLuint, rc, GLubyte, r, GLubyte, g, GLubyte, b, GLubyte, a, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiColor4ubVertex3fvSUN(rc, c, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FVSUNPROC, GLptr, rc, GLptr, c, GLptr, v)
}

glReplacementCodeuiColor3fVertex3fSUN(rc, r, g, b, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FSUNPROC, GLuint, rc, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiColor3fVertex3fvSUN(rc, c, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FVSUNPROC, GLptr, rc, GLptr, c, GLptr, v)
}

glReplacementCodeuiNormal3fVertex3fSUN(rc, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FSUNPROC, GLuint, rc, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiNormal3fVertex3fvSUN(rc, n, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FVSUNPROC, GLptr, rc, GLptr, n, GLptr, v)
}

glReplacementCodeuiColor4fNormal3fVertex3fSUN(rc, r, g, b, a, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FSUNPROC, GLuint, rc, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, a, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiColor4fNormal3fVertex3fvSUN(rc, c, n, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FVSUNPROC, GLptr, rc, GLptr, c, GLptr, n, GLptr, v)
}

glReplacementCodeuiTexCoord2fVertex3fSUN(rc, s, t, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FSUNPROC, GLuint, rc, GLfloat, s, GLfloat, t, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiTexCoord2fVertex3fvSUN(rc, tc, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FVSUNPROC, GLptr, rc, GLptr, tc, GLptr, v)
}

glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN(rc, s, t, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FSUNPROC, GLuint, rc, GLfloat, s, GLfloat, t, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN(rc, tc, n, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FVSUNPROC, GLptr, rc, GLptr, tc, GLptr, n, GLptr, v)
}

glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN(rc, s, t, r, g, b, a, nx, ny, nz, x, y, z)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC, GLuint, rc, GLfloat, s, GLfloat, t, GLfloat, r, GLfloat, g, GLfloat, b, GLfloat, a, GLfloat, nx, GLfloat, ny, GLfloat, nz, GLfloat, x, GLfloat, y, GLfloat, z)
}

glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN(rc, tc, c, n, v)
{
  global
  DllCall(PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC, GLptr, rc, GLptr, tc, GLptr, c, GLptr, n, GLptr, v)
}


GL_EXT_blend_func_separate := 1

glBlendFuncSeparateEXT(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEEXTPROC, GLenum, sfactorRGB, GLenum, dfactorRGB, GLenum, sfactorAlpha, GLenum, dfactorAlpha)
}


GL_INGR_blend_func_separate := 1

glBlendFuncSeparateINGR(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEINGRPROC, GLenum, sfactorRGB, GLenum, dfactorRGB, GLenum, sfactorAlpha, GLenum, dfactorAlpha)
}


GL_INGR_color_clamp := 1
GL_INGR_interlace_read := 1
GL_EXT_stencil_wrap := 1
GL_EXT_422_pixels := 1
GL_NV_texgen_reflection := 1
GL_SUN_convolution_border_modes := 1
GL_EXT_texture_env_add := 1
GL_EXT_texture_lod_bias := 1
GL_EXT_texture_filter_anisotropic := 1
GL_EXT_vertex_weighting := 1

glVertexWeightfEXT(weight)
{
  global
  DllCall(PFNGLVERTEXWEIGHTFEXTPROC, GLfloat, weight)
}

glVertexWeightfvEXT(weight)
{
  global
  DllCall(PFNGLVERTEXWEIGHTFVEXTPROC, GLptr, weight)
}

glVertexWeightPointerEXT(size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXWEIGHTPOINTEREXTPROC, GLsizei, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}


GL_NV_light_max_exponent := 1
GL_NV_vertex_array_range := 1

glFlushVertexArrayRangeNV()
{
  global
  DllCall(PFNGLFLUSHVERTEXARRAYRANGENVPROC)
}

glVertexArrayRangeNV(length, pointer)
{
  global
  DllCall(PFNGLVERTEXARRAYRANGENVPROC, GLsizei, length, GLptr, pointer)
}


GL_NV_register_combiners := 1

glCombinerParameterfvNV(pname, params)
{
  global
  DllCall(PFNGLCOMBINERPARAMETERFVNVPROC, GLenum, pname, GLptr, params)
}

glCombinerParameterfNV(pname, param)
{
  global
  DllCall(PFNGLCOMBINERPARAMETERFNVPROC, GLenum, pname, GLfloat, param)
}

glCombinerParameterivNV(pname, params)
{
  global
  DllCall(PFNGLCOMBINERPARAMETERIVNVPROC, GLenum, pname, GLptr, params)
}

glCombinerParameteriNV(pname, param)
{
  global
  DllCall(PFNGLCOMBINERPARAMETERINVPROC, GLenum, pname, GLint, param)
}

glCombinerInputNV(stage, portion, variable, input, mapping, componentUsage)
{
  global
  DllCall(PFNGLCOMBINERINPUTNVPROC, GLenum, stage, GLenum, portion, GLenum, variable, GLenum, input, GLenum, mapping, GLenum, componentUsage)
}

glCombinerOutputNV(stage, portion, abOutput, cdOutput, sumOutput, scale, bias, abDotProduct, cdDotProduct, muxSum)
{
  global
  DllCall(PFNGLCOMBINEROUTPUTNVPROC, GLenum, stage, GLenum, portion, GLenum, abOutput, GLenum, cdOutput, GLenum, sumOutput, GLenum, scale, GLenum, bias, GLboolean, abDotProduct, GLboolean, cdDotProduct, GLboolean, muxSum)
}

glFinalCombinerInputNV(variable, input, mapping, componentUsage)
{
  global
  DllCall(PFNGLFINALCOMBINERINPUTNVPROC, GLenum, variable, GLenum, input, GLenum, mapping, GLenum, componentUsage)
}

glGetCombinerInputParameterfvNV(stage, portion, variable, pname, params)
{
  global
  DllCall(PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC, GLenum, stage, GLenum, portion, GLenum, variable, GLenum, pname, GLptr, params)
}

glGetCombinerInputParameterivNV(stage, portion, variable, pname, params)
{
  global
  DllCall(PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC, GLenum, stage, GLenum, portion, GLenum, variable, GLenum, pname, GLptr, params)
}

glGetCombinerOutputParameterfvNV(stage, portion, pname, params)
{
  global
  DllCall(PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC, GLenum, stage, GLenum, portion, GLenum, pname, GLptr, params)
}

glGetCombinerOutputParameterivNV(stage, portion, pname, params)
{
  global
  DllCall(PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC, GLenum, stage, GLenum, portion, GLenum, pname, GLptr, params)
}

glGetFinalCombinerInputParameterfvNV(variable, pname, params)
{
  global
  DllCall(PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC, GLenum, variable, GLenum, pname, GLptr, params)
}

glGetFinalCombinerInputParameterivNV(variable, pname, params)
{
  global
  DllCall(PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC, GLenum, variable, GLenum, pname, GLptr, params)
}


GL_NV_fog_distance := 1
GL_NV_texgen_emboss := 1
GL_NV_blend_square := 1
GL_NV_texture_env_combine4 := 1
GL_MESA_resize_buffers := 1

glResizeBuffersMESA()
{
  global
  DllCall(PFNGLRESIZEBUFFERSMESAPROC)
}


GL_MESA_window_pos := 1

glWindowPos2dMESA(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2DMESAPROC, GLdouble, x, GLdouble, y)
}

glWindowPos2dvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS2DVMESAPROC, GLptr, v)
}

glWindowPos2fMESA(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2FMESAPROC, GLfloat, x, GLfloat, y)
}

glWindowPos2fvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS2FVMESAPROC, GLptr, v)
}

glWindowPos2iMESA(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2IMESAPROC, GLint, x, GLint, y)
}

glWindowPos2ivMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS2IVMESAPROC, GLptr, v)
}

glWindowPos2sMESA(x, y)
{
  global
  DllCall(PFNGLWINDOWPOS2SMESAPROC, GLshort, x, GLshort, y)
}

glWindowPos2svMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS2SVMESAPROC, GLptr, v)
}

glWindowPos3dMESA(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3DMESAPROC, GLdouble, x, GLdouble, y, GLdouble, z)
}

glWindowPos3dvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS3DVMESAPROC, GLptr, v)
}

glWindowPos3fMESA(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3FMESAPROC, GLfloat, x, GLfloat, y, GLfloat, z)
}

glWindowPos3fvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS3FVMESAPROC, GLptr, v)
}

glWindowPos3iMESA(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3IMESAPROC, GLint, x, GLint, y, GLint, z)
}

glWindowPos3ivMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS3IVMESAPROC, GLptr, v)
}

glWindowPos3sMESA(x, y, z)
{
  global
  DllCall(PFNGLWINDOWPOS3SMESAPROC, GLshort, x, GLshort, y, GLshort, z)
}

glWindowPos3svMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS3SVMESAPROC, GLptr, v)
}

glWindowPos4dMESA(x, y, z, w)
{
  global
  DllCall(PFNGLWINDOWPOS4DMESAPROC, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glWindowPos4dvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS4DVMESAPROC, GLptr, v)
}

glWindowPos4fMESA(x, y, z, w)
{
  global
  DllCall(PFNGLWINDOWPOS4FMESAPROC, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glWindowPos4fvMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS4FVMESAPROC, GLptr, v)
}

glWindowPos4iMESA(x, y, z, w)
{
  global
  DllCall(PFNGLWINDOWPOS4IMESAPROC, GLint, x, GLint, y, GLint, z, GLint, w)
}

glWindowPos4ivMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS4IVMESAPROC, GLptr, v)
}

glWindowPos4sMESA(x, y, z, w)
{
  global
  DllCall(PFNGLWINDOWPOS4SMESAPROC, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glWindowPos4svMESA(v)
{
  global
  DllCall(PFNGLWINDOWPOS4SVMESAPROC, GLptr, v)
}


GL_IBM_cull_vertex := 1
GL_IBM_multimode_draw_arrays := 1

glMultiModeDrawArraysIBM(mode, first, count, primcount, modestride)
{
  global
  DllCall(PFNGLMULTIMODEDRAWARRAYSIBMPROC, GLptr, mode, GLptr, first, GLptr, count, GLsizei, primcount, GLint, modestride)
}

glMultiModeDrawElementsIBM(mode, count, type, indices, primcount, modestride)
{
  global
  DllCall(PFNGLMULTIMODEDRAWELEMENTSIBMPROC, GLptr, mode, GLptr, count, GLenum, type, GLptr, indices, GLsizei, primcount, GLint, modestride)
}


GL_IBM_vertex_array_lists := 1

glColorPointerListIBM(size, type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLCOLORPOINTERLISTIBMPROC, GLint, size, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glSecondaryColorPointerListIBM(size, type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLSECONDARYCOLORPOINTERLISTIBMPROC, GLint, size, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glEdgeFlagPointerListIBM(stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLEDGEFLAGPOINTERLISTIBMPROC, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glFogCoordPointerListIBM(type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLFOGCOORDPOINTERLISTIBMPROC, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glIndexPointerListIBM(type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLINDEXPOINTERLISTIBMPROC, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glNormalPointerListIBM(type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLNORMALPOINTERLISTIBMPROC, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glTexCoordPointerListIBM(size, type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLTEXCOORDPOINTERLISTIBMPROC, GLint, size, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}

glVertexPointerListIBM(size, type, stride, pointer, ptrstride)
{
  global
  DllCall(PFNGLVERTEXPOINTERLISTIBMPROC, GLint, size, GLenum, type, GLint, stride, GLptr, pointer, GLint, ptrstride)
}


GL_SGIX_subsample := 1
GL_SGIX_ycrcba := 1
GL_SGIX_ycrcb_subsample := 1
GL_SGIX_depth_pass_instrument := 1
GL_3DFX_texture_compression_FXT1 := 1
GL_3DFX_multisample := 1
GL_3DFX_tbuffer := 1

glTbufferMask3DFX(mask)
{
  global
  DllCall(PFNGLTBUFFERMASK3DFXPROC, GLuint, mask)
}


GL_EXT_multisample := 1

glSampleMaskEXT(value, invert)
{
  global
  DllCall(PFNGLSAMPLEMASKEXTPROC, GLclampf, value, GLboolean, invert)
}

glSamplePatternEXT(pattern)
{
  global
  DllCall(PFNGLSAMPLEPATTERNEXTPROC, GLenum, pattern)
}


GL_SGIX_vertex_preclip := 1
GL_SGIX_convolution_accuracy := 1
GL_SGIX_resample := 1
GL_SGIS_point_line_texgen := 1
GL_SGIS_texture_color_mask := 1

glTextureColorMaskSGIS(red, green, blue, alpha)
{
  global
  DllCall(PFNGLTEXTURECOLORMASKSGISPROC, GLboolean, red, GLboolean, green, GLboolean, blue, GLboolean, alpha)
}


GL_SGIX_igloo_interface := 1

glIglooInterfaceSGIX(pname, params)
{
  global
  DllCall(PFNGLIGLOOINTERFACESGIXPROC, GLenum, pname, GLptr, params)
}


GL_EXT_texture_env_dot3 := 1
GL_ATI_texture_mirror_once := 1
GL_NV_fence := 1

glDeleteFencesNV(n, fences)
{
  global
  DllCall(PFNGLDELETEFENCESNVPROC, GLsizei, n, GLptr, fences)
}

glGenFencesNV(n, fences)
{
  global
  DllCall(PFNGLGENFENCESNVPROC, GLsizei, n, GLptr, fences)
}

glIsFenceNV(fence)
{
  global
  return DllCall(PFNGLISFENCENVPROC, GLuint, fence, GLboolean)
}

glTestFenceNV(fence)
{
  global
  return DllCall(PFNGLTESTFENCENVPROC, GLuint, fence, GLboolean)
}

glGetFenceivNV(fence, pname, params)
{
  global
  DllCall(PFNGLGETFENCEIVNVPROC, GLuint, fence, GLenum, pname, GLptr, params)
}

glFinishFenceNV(fence)
{
  global
  DllCall(PFNGLFINISHFENCENVPROC, GLuint, fence)
}

glSetFenceNV(fence, condition)
{
  global
  DllCall(PFNGLSETFENCENVPROC, GLuint, fence, GLenum, condition)
}


GL_NV_evaluators := 1

glMapControlPointsNV(target, index, type, ustride, vstride, uorder, vorder, packed, points)
{
  global
  DllCall(PFNGLMAPCONTROLPOINTSNVPROC, GLenum, target, GLuint, index, GLenum, type, GLsizei, ustride, GLsizei, vstride, GLint, uorder, GLint, vorder, GLboolean, packed, GLptr, points)
}

glMapParameterivNV(target, pname, params)
{
  global
  DllCall(PFNGLMAPPARAMETERIVNVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glMapParameterfvNV(target, pname, params)
{
  global
  DllCall(PFNGLMAPPARAMETERFVNVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMapControlPointsNV(target, index, type, ustride, vstride, packed, points)
{
  global
  DllCall(PFNGLGETMAPCONTROLPOINTSNVPROC, GLenum, target, GLuint, index, GLenum, type, GLsizei, ustride, GLsizei, vstride, GLboolean, packed, GLptr, points)
}

glGetMapParameterivNV(target, pname, params)
{
  global
  DllCall(PFNGLGETMAPPARAMETERIVNVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMapParameterfvNV(target, pname, params)
{
  global
  DllCall(PFNGLGETMAPPARAMETERFVNVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMapAttribParameterivNV(target, index, pname, params)
{
  global
  DllCall(PFNGLGETMAPATTRIBPARAMETERIVNVPROC, GLenum, target, GLuint, index, GLenum, pname, GLptr, params)
}

glGetMapAttribParameterfvNV(target, index, pname, params)
{
  global
  DllCall(PFNGLGETMAPATTRIBPARAMETERFVNVPROC, GLenum, target, GLuint, index, GLenum, pname, GLptr, params)
}

glEvalMapsNV(target, mode)
{
  global
  DllCall(PFNGLEVALMAPSNVPROC, GLenum, target, GLenum, mode)
}


GL_NV_packed_depth_stencil := 1
GL_NV_register_combiners2 := 1

glCombinerStageParameterfvNV(stage, pname, params)
{
  global
  DllCall(PFNGLCOMBINERSTAGEPARAMETERFVNVPROC, GLenum, stage, GLenum, pname, GLptr, params)
}

glGetCombinerStageParameterfvNV(stage, pname, params)
{
  global
  DllCall(PFNGLGETCOMBINERSTAGEPARAMETERFVNVPROC, GLenum, stage, GLenum, pname, GLptr, params)
}


GL_NV_texture_compression_vtc := 1
GL_NV_texture_rectangle := 1
GL_NV_texture_shader := 1
GL_NV_texture_shader2 := 1
GL_NV_vertex_array_range2 := 1
GL_NV_vertex_program := 1

glAreProgramsResidentNV(n, programs, residences)
{
  global
  return DllCall(PFNGLAREPROGRAMESRESIDENTNVPROC, GLsizei, n, GLptr, programs, GLptr, residences, GLboolean)
}

glBindProgramNV(target, id)
{
  global
  DllCall(PFNGLBINDPROGRAMNVPROC, GLenum, target, GLuint, id)
}

glDeleteProgramsNV(n, programs)
{
  global
  DllCall(PFNGLDELETEPROGRAMSNVPROC, GLsizei, n, GLptr, programs)
}

glExecuteProgramNV(target, id, params)
{
  global
  DllCall(PFNGLEXECUTEPROGRAMNVPROC, GLenum, target, GLuint, id, GLptr, params)
}

glGenProgramsNV(n, programs)
{
  global
  DllCall(PFNGLGENPROGRAMSNVPROC, GLsizei, n, GLptr, programs)
}

glGetProgramParameterdvNV(target, index, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMPARAMETERDVNVPROC, GLenum, target, GLuint, index, GLenum, pname, GLptr, params)
}

glGetProgramParameterfvNV(target, index, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMPARAMETERFVNVPROC, GLenum, target, GLuint, index, GLenum, pname, GLptr, params)
}

glGetProgramivNV(id, pname, params)
{
  global
  DllCall(PFNGLGETPROGRAMIVNVPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetProgramStringNV(id, pname, program)
{
  global
  DllCall(PFNGLGETPROGRAMSTRINGNVPROC, GLuint, id, GLenum, pname, GLptr, program)
}

glGetTrackMatrixivNV(target, address, pname, params)
{
  global
  DllCall(PFNGLGETTRACKMATRIXIVNVPROC, GLenum, target, GLuint, address, GLenum, pname, GLptr, params)
}

glGetVertexAttribdvNV(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBDVNVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribfvNV(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBFVNVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribivNV(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIVNVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribPointervNV(index, pname, pointer)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBPOINTERVNVPROC, GLuint, index, GLenum, pname, GLptr, pointer)
}

glIsProgramNV(id)
{
  global
  return DllCall(PFNGLISPROGRAMNVPROC, GLuint, id, GLboolean)
}

glLoadProgramNV(target, id, len, program)
{
  global
  DllCall(PFNGLLOADPROGRAMNVPROC, GLenum, target, GLuint, id, GLsizei, len, GLptr, program)
}

glProgramParameter4dNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMPARAMETER4DNVPROC, GLenum, target, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glProgramParameter4dvNV(target, index, v)
{
  global
  DllCall(PFNGLPROGRAMPARAMETER4DVNVPROC, GLenum, target, GLuint, index, GLptr, v)
}

glProgramParameter4fNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMPARAMETER4FNVPROC, GLenum, target, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glProgramParameter4fvNV(target, index, v)
{
  global
  DllCall(PFNGLPROGRAMPARAMETER4FVNVPROC, GLenum, target, GLuint, index, GLptr, v)
}

glProgramParameters4dvNV(target, index, count, v)
{
  global
  DllCall(PFNGLPROGRAMPARAMETERS4DVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, v)
}

glProgramParameters4fvNV(target, index, count, v)
{
  global
  DllCall(PFNGLPROGRAMPARAMETERS4FVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, v)
}

glRequestResidentProgramsNV(n, programs)
{
  global
  DllCall(PFNGLREQUESTRESIDENTPROGRAMSNVPROC, GLsizei, n, GLptr, programs)
}

glTrackMatrixNV(target, address, matrix, transform)
{
  global
  DllCall(PFNGLTRACKMATRIXNVPROC, GLenum, target, GLuint, address, GLenum, matrix, GLenum, transform)
}

glVertexAttribPointerNV(index, fsize, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBPOINTERNVPROC, GLuint, index, GLint, fsize, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glVertexAttrib1dNV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DNVPROC, GLuint, index, GLdouble, x)
}

glVertexAttrib1dvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1DVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1fNV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FNVPROC, GLuint, index, GLfloat, x)
}

glVertexAttrib1fvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1FVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib1sNV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SNVPROC, GLuint, index, GLshort, x)
}

glVertexAttrib1svNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1SVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2dNV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DNVPROC, GLuint, index, GLdouble, x, GLdouble, y)
}

glVertexAttrib2dvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2DVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2fNV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FNVPROC, GLuint, index, GLfloat, x, GLfloat, y)
}

glVertexAttrib2fvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2FVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2sNV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SNVPROC, GLuint, index, GLshort, x, GLshort, y)
}

glVertexAttrib2svNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2SVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3dNV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DNVPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexAttrib3dvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3DVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3fNV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FNVPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertexAttrib3fvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3FVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3sNV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SNVPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z)
}

glVertexAttrib3svNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3SVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4dNV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DNVPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexAttrib4dvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4DVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4fNV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FNVPROC, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glVertexAttrib4fvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4FVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4sNV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SNVPROC, GLuint, index, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glVertexAttrib4svNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4SVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4ubNV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UBNVPROC, GLuint, index, GLubyte, x, GLubyte, y, GLubyte, z, GLubyte, w)
}

glVertexAttrib4ubvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4UBVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribs1dvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS1DVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs1fvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS1FVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs1svNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS1SVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs2dvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS2DVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs2fvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS2FVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs2svNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS2SVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs3dvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS3DVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs3fvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS3FVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs3svNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS3SVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs4dvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS4DVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs4fvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS4FVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs4svNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS4SVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}

glVertexAttribs4ubvNV(index, count, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS4UBVNVPROC, GLuint, index, GLsizei, count, GLptr, v)
}


GL_SGIX_texture_coordinate_clamp := 1
GL_SGIX_scalebias_hint := 1
GL_OML_interlace := 1
GL_OML_subsample := 1
GL_OML_resample := 1
GL_NV_copy_depth_to_color := 1
GL_ATI_envmap_bumpmap := 1

glTexBumpParameterivATI(pname, param)
{
  global
  DllCall(PFNGLTEXBUMPPARAMETERIVATIPROC, GLenum, pname, GLptr, param)
}

glTexBumpParameterfvATI(pname, param)
{
  global
  DllCall(PFNGLTEXBUMPPARAMETERFVATIPROC, GLenum, pname, GLptr, param)
}

glGetTexBumpParameterivATI(pname, param)
{
  global
  DllCall(PFNGLGETTEXBUMPPARAMETERIVATIPROC, GLenum, pname, GLptr, param)
}

glGetTexBumpParameterfvATI(pname, param)
{
  global
  DllCall(PFNGLGETTEXBUMPPARAMETERFVATIPROC, GLenum, pname, GLptr, param)
}


GL_ATI_fragment_shader := 1

glGenFragmentShadersATI(range)
{
  global
  return DllCall(PFNGLGENFRAGMENTSHADERSATIPROC, GLuint, range, GLuint)
}

glBindFragmentShaderATI(id)
{
  global
  DllCall(PFNGLBINDFRAGMENTSHADERATIPROC, GLuint, id)
}

glDeleteFragmentShaderATI(id)
{
  global
  DllCall(PFNGLDELETEFRAGMENTSHADERATIPROC, GLuint, id)
}

glBeginFragmentShaderATI()
{
  global
  DllCall(PFNGLBEGINFRAGMENTSHADERATIPROC)
}

glEndFragmentShaderATI()
{
  global
  DllCall(PFNGLENDFRAGMENTSHADERATIPROC)
}

glPassTexCoordATI(dst, coord, swizzle)
{
  global
  DllCall(PFNGLPASSTEXCOORDATIPROC, GLuint, dst, GLuint, coord, GLenum, swizzle)
}

glSampleMapATI(dst, interp, swizzle)
{
  global
  DllCall(PFNGLSAMPLEMAPATIPROC, GLuint, dst, GLuint, interp, GLenum, swizzle)
}

glColorFragmentOp1ATI(op, dst, dstMask, dstMod, arg1, arg1Rep, arg1Mod)
{
  global
  DllCall(PFNGLCOLORFRAGMENTOP1ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMask, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod)
}

glColorFragmentOp2ATI(op, dst, dstMask, dstMod, arg1, arg1Rep, arg1Mod, arg2, arg2Rep, arg2Mod)
{
  global
  DllCall(PFNGLCOLORFRAGMENTOP2ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMask, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod, GLuint, arg2, GLuint, arg2Rep, GLuint, arg2Mod)
}

glColorFragmentOp3ATI(op, dst, dstMask, dstMod, arg1, arg1Rep, arg1Mod, arg2, arg2Rep, arg2Mod, arg3, arg3Rep, arg3Mod)
{
  global
  DllCall(PFNGLCOLORFRAGMENTOP3ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMask, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod, GLuint, arg2, GLuint, arg2Rep, GLuint, arg2Mod, GLuint, arg3, GLuint, arg3Rep, GLuint, arg3Mod)
}

glAlphaFragmentOp1ATI(op, dst, dstMod, arg1, arg1Rep, arg1Mod)
{
  global
  DllCall(PFNGLALPHAFRAGMENTOP1ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod)
}

glAlphaFragmentOp2ATI(op, dst, dstMod, arg1, arg1Rep, arg1Mod, arg2, arg2Rep, arg2Mod)
{
  global
  DllCall(PFNGLALPHAFRAGMENTOP2ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod, GLuint, arg2, GLuint, arg2Rep, GLuint, arg2Mod)
}

glAlphaFragmentOp3ATI(op, dst, dstMod, arg1, arg1Rep, arg1Mod, arg2, arg2Rep, arg2Mod, arg3, arg3Rep, arg3Mod)
{
  global
  DllCall(PFNGLALPHAFRAGMENTOP3ATIPROC, GLenum, op, GLuint, dst, GLuint, dstMod, GLuint, arg1, GLuint, arg1Rep, GLuint, arg1Mod, GLuint, arg2, GLuint, arg2Rep, GLuint, arg2Mod, GLuint, arg3, GLuint, arg3Rep, GLuint, arg3Mod)
}

glSetFragmentShaderConstantATI(dst, value)
{
  global
  DllCall(PFNGLSETFRAGMENTSHADERCONSTANTATIPROC, GLuint, dst, GLptr, value)
}


GL_ATI_pn_triangles := 1

glPNTrianglesiATI(pname, param)
{
  global
  DllCall(PFNGLPNTRIANGLESIATIPROC, GLenum, pname, GLint, param)
}

glPNTrianglesfATI(pname, param)
{
  global
  DllCall(PFNGLPNTRIANGLESFATIPROC, GLenum, pname, GLfloat, param)
}


GL_ATI_vertex_array_object := 1

glNewObjectBufferATI(size, pointer, usage)
{
  global
  return DllCall(PFNGLNEWOBJECTBUFFERATIPROC, GLsizei, size, GLptr, pointer, GLenum, usage, GLuint)
}

glIsObjectBufferATI(buffer)
{
  global
  return DllCall(PFNGLISOBJECTBUFFERATIPROC, GLuint, buffer, GLboolean)
}

glUpdateObjectBufferATI(buffer, offset, size, pointer, preserve)
{
  global
  DllCall(PFNGLUPDATEOBJECTBUFFERATIPROC, GLuint, buffer, GLuint, offset, GLsizei, size, GLptr, pointer, GLenum, preserve)
}

glGetObjectBufferfvATI(buffer, pname, params)
{
  global
  DllCall(PFNGLGETOBJECTBUFFERFVATIPROC, GLuint, buffer, GLenum, pname, GLptr, params)
}

glGetObjectBufferivATI(buffer, pname, params)
{
  global
  DllCall(PFNGLGETOBJECTBUFFERIVATIPROC, GLuint, buffer, GLenum, pname, GLptr, params)
}

glFreeObjectBufferATI(buffer)
{
  global
  DllCall(PFNGLFREEOBJECTBUFFERATIPROC, GLuint, buffer)
}

glArrayObjectATI(array, size, type, stride, buffer, offset)
{
  global
  DllCall(PFNGLARRAYOBJECTATIPROC, GLenum, array, GLint, size, GLenum, type, GLsizei, stride, GLuint, buffer, GLuint, offset)
}

glGetArrayObjectfvATI(array, pname, params)
{
  global
  DllCall(PFNGLGETARRAYOBJECTFVATIPROC, GLenum, array, GLenum, pname, GLptr, params)
}

glGetArrayObjectivATI(array, pname, params)
{
  global
  DllCall(PFNGLGETARRAYOBJECTIVATIPROC, GLenum, array, GLenum, pname, GLptr, params)
}

glVariantArrayObjectATI(id, type, stride, buffer, offset)
{
  global
  DllCall(PFNGLVARIANTARRAYOBJECTATIPROC, GLuint, id, GLenum, type, GLsizei, stride, GLuint, buffer, GLuint, offset)
}

glGetVariantArrayObjectfvATI(id, pname, params)
{
  global
  DllCall(PFNGLGETVARIANTARRAYOBJECTFVATIPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetVariantArrayObjectivATI(id, pname, params)
{
  global
  DllCall(PFNGLGETVARIANTARRAYOBJECTIVATIPROC, GLuint, id, GLenum, pname, GLptr, params)
}


GL_EXT_vertex_shader := 1

glBeginVertexShaderEXT()
{
  global
  DllCall(PFNGLBEGINVERTEXSHADEREXTPROC)
}

glEndVertexShaderEXT()
{
  global
  DllCall(PFNGLENDVERTEXSHADEREXTPROC)
}

glBindVertexShaderEXT(id)
{
  global
  DllCall(PFNGLBINDVERTEXSHADEREXTPROC, GLuint, id)
}

glGenVertexShadersEXT(range)
{
  global
  return DllCall(PFNGLGENVERTEXSHADERSEXTPROC, GLuint, range, GLuint)
}

glDeleteVertexShaderEXT(id)
{
  global
  DllCall(PFNGLDELETEVERTEXSHADEREXTPROC, GLuint, id)
}

glShaderOp1EXT(op, res, arg1)
{
  global
  DllCall(PFNGLSHADEROP1EXTPROC, GLenum, op, GLuint, res, GLuint, arg1)
}

glShaderOp2EXT(op, res, arg1, arg2)
{
  global
  DllCall(PFNGLSHADEROP2EXTPROC, GLenum, op, GLuint, res, GLuint, arg1, GLuint, arg2)
}

glShaderOp3EXT(op, res, arg1, arg2, arg3)
{
  global
  DllCall(PFNGLSHADEROP3EXTPROC, GLenum, op, GLuint, res, GLuint, arg1, GLuint, arg2, GLuint, arg3)
}

glSwizzleEXT(res, in, outX, outY, outZ, outW)
{
  global
  DllCall(PFNGLSWIZZLEEXTPROC, GLuint, res, GLuint, in, GLenum, outX, GLenum, outY, GLenum, outZ, GLenum, outW)
}

glWriteMaskEXT(res, in, outX, outY, outZ, outW)
{
  global
  DllCall(PFNGLWRITEMASKEXTPROC, GLuint, res, GLuint, in, GLenum, outX, GLenum, outY, GLenum, outZ, GLenum, outW)
}

glInsertComponentEXT(res, src, num)
{
  global
  DllCall(PFNGLINSERTCOMPONENTEXTPROC, GLuint, res, GLuint, src, GLuint, num)
}

glExtractComponentEXT(res, src, num)
{
  global
  DllCall(PFNGLEXTRACTCOMPONENTEXTPROC, GLuint, res, GLuint, src, GLuint, num)
}

glGenSymbolsEXT(datatype, storagetype, range, components)
{
  global
  return DllCall(PFNGLGENSYMBOLSEXTPROC, GLenum, datatype, GLenum, storagetype, GLenum, range, GLuint, components, GLuint)
}

glSetInvariantEXT(id, type, addr)
{
  global
  DllCall(PFNGLSETINVARIANTEXTPROC, GLuint, id, GLenum, type, GLptr, addr)
}

glSetLocalConstantEXT(id, type, addr)
{
  global
  DllCall(PFNGLSETLOCALCONSTANTEXTPROC, GLuint, id, GLenum, type, GLptr, addr)
}

glVariantbvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTBVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantsvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTSVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantivEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTIVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantfvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTFVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantdvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTDVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantubvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTUBVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantusvEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTUSVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantuivEXT(id, addr)
{
  global
  DllCall(PFNGLVARIANTUIVEXTPROC, GLuint, id, GLptr, addr)
}

glVariantPointerEXT(id, type, stride, addr)
{
  global
  DllCall(PFNGLVARIANTPOINTEREXTPROC, GLuint, id, GLenum, type, GLuint, stride, GLptr, addr)
}

glEnableVariantClientStateEXT(id)
{
  global
  DllCall(PFNGLENABLEVARIANTCLIENTSTATEEXTPROC, GLuint, id)
}

glDisableVariantClientStateEXT(id)
{
  global
  DllCall(PFNGLDISABLEVARIANTCLIENTSTATEEXTPROC, GLuint, id)
}

glBindLightParameterEXT(light, value)
{
  global
  return DllCall(PFNGLBINDLIGHTPARAMETEREXTPROC, GLenum, light, GLenum, value, GLuint)
}

glBindMaterialParameterEXT(face, value)
{
  global
  return DllCall(PFNGLBINDMATERIALPARAMETEREXTPROC, GLenum, face, GLenum, value, GLuint)
}

glBindTexGenParameterEXT(unit, coord, value)
{
  global
  return DllCall(PFNGLBINDTEXGENPARAMETEREXTPROC, GLenum, unit, GLenum, coord, GLenum, value, GLuint)
}

glBindTextureUnitParameterEXT(unit, value)
{
  global
  return DllCall(PFNGLBINDTEXTUREUNITPARAMETEREXTPROC, GLenum, unit, GLenum, value, GLuint)
}

glBindParameterEXT(value)
{
  global
  return DllCall(PFNGLBINDPARAMETEREXTPROC, GLenum, value, GLuint)
}

glIsVariantEnabledEXT(id, cap)
{
  global
  return DllCall(PFNGLISVARIANTENABLEDEXTPROC, GLuint, id, GLenum, cap, GLboolean)
}

glGetVariantBooleanvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETVARIANTBOOLEANVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetVariantIntegervEXT(id, value, data)
{
  global
  DllCall(PFNGLGETVARIANTINTEGERVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetVariantFloatvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETVARIANTFLOATVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetVariantPointervEXT(id, value, data)
{
  global
  DllCall(PFNGLGETVARIANTPOINTERVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetInvariantBooleanvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETINVARIANTBOOLEANVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetInvariantIntegervEXT(id, value, data)
{
  global
  DllCall(PFNGLGETINVARIANTINTEGERVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetInvariantFloatvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETINVARIANTFLOATVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetLocalConstantBooleanvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETLOCALCONSTANTBOOLEANVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetLocalConstantIntegervEXT(id, value, data)
{
  global
  DllCall(PFNGLGETLOCALCONSTANTINTEGERVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}

glGetLocalConstantFloatvEXT(id, value, data)
{
  global
  DllCall(PFNGLGETLOCALCONSTANTFLOATVEXTPROC, GLuint, id, GLenum, value, GLptr, data)
}


GL_ATI_vertex_streams := 1

glVertexStream1sATI(stream, x)
{
  global
  DllCall(PFNGLVERTEXSTREAM1SATIPROC, GLenum, stream, GLshort, x)
}

glVertexStream1svATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM1SVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream1iATI(stream, x)
{
  global
  DllCall(PFNGLVERTEXSTREAM1IATIPROC, GLenum, stream, GLint, x)
}

glVertexStream1ivATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM1IVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream1fATI(stream, x)
{
  global
  DllCall(PFNGLVERTEXSTREAM1FATIPROC, GLenum, stream, GLfloat, x)
}

glVertexStream1fvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM1FVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream1dATI(stream, x)
{
  global
  DllCall(PFNGLVERTEXSTREAM1DATIPROC, GLenum, stream, GLdouble, x)
}

glVertexStream1dvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM1DVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream2sATI(stream, x, y)
{
  global
  DllCall(PFNGLVERTEXSTREAM2SATIPROC, GLenum, stream, GLshort, x, GLshort, y)
}

glVertexStream2svATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM2SVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream2iATI(stream, x, y)
{
  global
  DllCall(PFNGLVERTEXSTREAM2IATIPROC, GLenum, stream, GLint, x, GLint, y)
}

glVertexStream2ivATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM2IVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream2fATI(stream, x, y)
{
  global
  DllCall(PFNGLVERTEXSTREAM2FATIPROC, GLenum, stream, GLfloat, x, GLfloat, y)
}

glVertexStream2fvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM2FVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream2dATI(stream, x, y)
{
  global
  DllCall(PFNGLVERTEXSTREAM2DATIPROC, GLenum, stream, GLdouble, x, GLdouble, y)
}

glVertexStream2dvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM2DVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream3sATI(stream, x, y, z)
{
  global
  DllCall(PFNGLVERTEXSTREAM3SATIPROC, GLenum, stream, GLshort, x, GLshort, y, GLshort, z)
}

glVertexStream3svATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM3SVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream3iATI(stream, x, y, z)
{
  global
  DllCall(PFNGLVERTEXSTREAM3IATIPROC, GLenum, stream, GLint, x, GLint, y, GLint, z)
}

glVertexStream3ivATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM3IVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream3fATI(stream, x, y, z)
{
  global
  DllCall(PFNGLVERTEXSTREAM3FATIPROC, GLenum, stream, GLfloat, x, GLfloat, y, GLfloat, z)
}

glVertexStream3fvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM3FVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream3dATI(stream, x, y, z)
{
  global
  DllCall(PFNGLVERTEXSTREAM3DATIPROC, GLenum, stream, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexStream3dvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM3DVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream4sATI(stream, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXSTREAM4SATIPROC, GLenum, stream, GLshort, x, GLshort, y, GLshort, z, GLshort, w)
}

glVertexStream4svATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM4SVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream4iATI(stream, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXSTREAM4IATIPROC, GLenum, stream, GLint, x, GLint, y, GLint, z, GLint, w)
}

glVertexStream4ivATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM4IVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream4fATI(stream, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXSTREAM4FATIPROC, GLenum, stream, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glVertexStream4fvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM4FVATIPROC, GLenum, stream, GLptr, coords)
}

glVertexStream4dATI(stream, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXSTREAM4DATIPROC, GLenum, stream, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexStream4dvATI(stream, coords)
{
  global
  DllCall(PFNGLVERTEXSTREAM4DVATIPROC, GLenum, stream, GLptr, coords)
}

glNormalStream3bATI(stream, nx, ny, nz)
{
  global
  DllCall(PFNGLNORMALSTREAM3BATIPROC, GLenum, stream, GLbyte, nx, GLbyte, ny, GLbyte, nz)
}

glNormalStream3bvATI(stream, coords)
{
  global
  DllCall(PFNGLNORMALSTREAM3BVATIPROC, GLenum, stream, GLptr, coords)
}

glNormalStream3sATI(stream, nx, ny, nz)
{
  global
  DllCall(PFNGLNORMALSTREAM3SATIPROC, GLenum, stream, GLshort, nx, GLshort, ny, GLshort, nz)
}

glNormalStream3svATI(stream, coords)
{
  global
  DllCall(PFNGLNORMALSTREAM3SVATIPROC, GLenum, stream, GLptr, coords)
}

glNormalStream3iATI(stream, nx, ny, nz)
{
  global
  DllCall(PFNGLNORMALSTREAM3IATIPROC, GLenum, stream, GLint, nx, GLint, ny, GLint, nz)
}

glNormalStream3ivATI(stream, coords)
{
  global
  DllCall(PFNGLNORMALSTREAM3IVATIPROC, GLenum, stream, GLptr, coords)
}

glNormalStream3fATI(stream, nx, ny, nz)
{
  global
  DllCall(PFNGLNORMALSTREAM3FATIPROC, GLenum, stream, GLfloat, nx, GLfloat, ny, GLfloat, nz)
}

glNormalStream3fvATI(stream, coords)
{
  global
  DllCall(PFNGLNORMALSTREAM3FVATIPROC, GLenum, stream, GLptr, coords)
}

glNormalStream3dATI(stream, nx, ny, nz)
{
  global
  DllCall(PFNGLNORMALSTREAM3DATIPROC, GLenum, stream, GLdouble, nx, GLdouble, ny, GLdouble, nz)
}

glNormalStream3dvATI(stream, coords)
{
  global
  DllCall(PFNGLNORMALSTREAM3DVATIPROC, GLenum, stream, GLptr, coords)
}

glClientActiveVertexStreamATI(stream)
{
  global
  DllCall(PFNGLCLIENTACTIVEVERTEXSTREAMATIPROC, GLenum, stream)
}

glVertexBlendEnviATI(pname, param)
{
  global
  DllCall(PFNGLVERTEXBLENDENVIATIPROC, GLenum, pname, GLint, param)
}

glVertexBlendEnvfATI(pname, param)
{
  global
  DllCall(PFNGLVERTEXBLENDENVFATIPROC, GLenum, pname, GLfloat, param)
}


GL_ATI_element_array := 1

glElementPointerATI(type, pointer)
{
  global
  DllCall(PFNGLELEMENTPOINTERATIPROC, GLenum, type, GLptr, pointer)
}

glDrawElementArrayATI(mode, count)
{
  global
  DllCall(PFNGLDRAWELEMENTARRAYATIPROC, GLenum, mode, GLsizei, count)
}

glDrawRangeElementArrayATI(mode, start, end, count)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTARRAYATIPROC, GLenum, mode, GLuint, start, GLuint, end, GLsizei, count)
}


GL_SUN_mesh_array := 1

glDrawMeshArraysSUN(mode, first, count, width)
{
  global
  DllCall(PFNGLDRAWMESHARRAYSSUNPROC, GLenum, mode, GLint, first, GLsizei, count, GLsizei, width)
}


GL_SUN_slice_accum := 1
GL_NV_multisample_filter_hint := 1
GL_NV_depth_clamp := 1
GL_NV_occlusion_query := 1

glGenOcclusionQueriesNV(n, ids)
{
  global
  DllCall(PFNGLGENOCCLUSIONQUERIESNVPROC, GLsizei, n, GLptr, ids)
}

glDeleteOcclusionQueriesNV(n, ids)
{
  global
  DllCall(PFNGLDELETEOCCLUSIONQUERIESNVPROC, GLsizei, n, GLptr, ids)
}

glIsOcclusionQueryNV(id)
{
  global
  return DllCall(PFNGLISOCCULUSIONQUERYNVPROC, GLuint, id, GLuint)
}

glBeginOcclusionQueryNV(id)
{
  global
  DllCall(PFNGLBEGINOCCLUSIONQUERYNVPROC, GLuint, id)
}

glEndOcclusionQueryNV()
{
  global
  DllCall(PFNGLENDOCCLUSIONQUERYNVPROC)
}

glGetOcclusionQueryivNV(id, pname, params)
{
  global
  DllCall(PFNGLGETOCCLUSIONQUERYIVNVPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetOcclusionQueryuivNV(id, pname, params)
{
  global
  DllCall(PFNGLGETOCCLUSIONQUERYUIVNVPROC, GLuint, id, GLenum, pname, GLptr, params)
}


GL_NV_point_sprite := 1

glPointParameteriNV(pname, param)
{
  global
  DllCall(PFNGLPOINTPARAMETERINVPROC, GLenum, pname, GLint, param)
}

glPointParameterivNV(pname, params)
{
  global
  DllCall(PFNGLPOINTPARAMETERIVNVPROC, GLenum, pname, GLptr, params)
}


GL_NV_texture_shader3 := 1
GL_NV_vertex_program1_1 := 1
GL_EXT_shadow_funcs := 1
GL_EXT_stencil_two_side := 1

glActiveStencilFaceEXT(face)
{
  global
  DllCall(PFNGLACTIVESTENCILFACEEXTPROC, GLenum, face)
}


GL_ATI_text_fragment_shader := 1
GL_APPLE_client_storage := 1
GL_APPLE_element_array := 1

glElementPointerAPPLE(type, pointer)
{
  global
  DllCall(PFNGLELEMENTPOINTERAPPLEPROC, GLenum, type, GLptr, pointer)
}

glDrawElementArrayAPPLE(mode, first, count)
{
  global
  DllCall(PFNGLDRAWELEMENTARRAYAPPLEPROC, GLenum, mode, GLint, first, GLsizei, count)
}

glDrawRangeElementArrayAPPLE(mode, start, end, first, count)
{
  global
  DllCall(PFNGLDRAWRANGEELEMENTARRAYAPPLEPROC, GLenum, mode, GLuint, start, GLuint, end, GLint, first, GLsizei, count)
}

glMultiDrawElementArrayAPPLE(mode, first, count, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWELEMENTARRAYAPPLEPROC, GLenum, mode, GLptr, first, GLptr, count, GLsizei, primcount)
}

glMultiDrawRangeElementArrayAPPLE(mode, start, end, first, count, primcount)
{
  global
  DllCall(PFNGLMULTIDRAWRANGEELEMENTARRAYAPPLEPROC, GLenum, mode, GLuint, start, GLuint, end, GLptr, first, GLptr, count, GLsizei, primcount)
}


GL_APPLE_fence := 1

glGenFencesAPPLE(n, fences)
{
  global
  DllCall(PFNGLGENFENCESAPPLEPROC, GLsizei, n, GLptr, fences)
}

glDeleteFencesAPPLE(n, fences)
{
  global
  DllCall(PFNGLDELETEFENCESAPPLEPROC, GLsizei, n, GLptr, fences)
}

glSetFenceAPPLE(fence)
{
  global
  DllCall(PFNGLSETFENCEAPPLEPROC, GLuint, fence)
}

glIsFenceAPPLE(fence)
{
  global
  return DllCall(PFNGLISFENCEAPPLEPROC, GLuint, fence, GLboolean)
}

glTestFenceAPPLE(fence)
{
  global
  return DllCall(PFNGLTESTFENCEAPPLEPROC, GLuint, fence, GLboolean)
}

glFinishFenceAPPLE(fence)
{
  global
  DllCall(PFNGLFINISHFENCEAPPLEPROC, GLuint, fence)
}

glTestObjectAPPLE(object, name)
{
  global
  return DllCall(PFNGLTESTOBJECTAPPLEPROC, GLenum, object, GLuint, name, GLboolean)
}

glFinishObjectAPPLE(object, name)
{
  global
  DllCall(PFNGLFINISHOBJECTAPPLEPROC, GLenum, object, GLint, name)
}


GL_APPLE_vertex_array_object := 1

glBindVertexArrayAPPLE(array)
{
  global
  DllCall(PFNGLBINDVERTEXARRAYAPPLEPROC, GLuint, array)
}

glDeleteVertexArraysAPPLE(n, arrays)
{
  global
  DllCall(PFNGLDELETEVERTEXARRAYSAPPLEPROC, GLsizei, n, GLptr, arrays)
}

glGenVertexArraysAPPLE(n, arrays)
{
  global
  DllCall(PFNGLGENVERTEXARRAYSAPPLEPROC, GLsizei, n, GLptr, arrays)
}

glIsVertexArrayAPPLE(array)
{
  global
  return DllCall(PFNGLISVERTEXARRAYAPPLEPROC, GLuint, array, GLboolean)
}

GL_APPLE_vertex_array_range := 1

glVertexArrayRangeAPPLE(length, pointer)
{
  global
  DllCall(PFNGLVERTEXARRAYRANGEAPPLEPROC, GLsizei, length, GLptr, pointer)
}

glFlushVertexArrayRangeAPPLE(length, pointer)
{
  global
  DllCall(PFNGLFLUSHVERTEXARRAYRANGEAPPLEPROC, GLsizei, length, GLptr, pointer)
}

glVertexArrayParameteriAPPLE(pname, param)
{
  global
  DllCall(PFNGLVERTEXARRAYPARAMETERIAPPLEPROC, GLenum, pname, GLint, param)
}


GL_APPLE_ycbcr_422 := 1
GL_S3_s3tc := 1
GL_ATI_draw_buffers := 1

glDrawBuffersATI(n, bufs)
{
  global
  DllCall(PFNGLDRAWBUFFERSATIPROC, GLsizei, n, GLptr, bufs)
}


GL_ATI_pixel_format_float := 1
;This is really a WGL extension, but defines some associated GL enums.
;ATI does not export "GL_ATI_pixel_format_float" in the GL_EXTENSIONS string.
 
GL_ATI_texture_env_combine3 := 1
GL_ATI_texture_float := 1
GL_NV_float_buffer := 1
GL_NV_fragment_program := 1
;Some NV_fragment_program entry points are shared with ARB_vertex_program.

glProgramNamedParameter4fNV(id, len, name, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMNAMEDPARAMETER4FNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glProgramNamedParameter4dNV(id, len, name, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMNAMEDPARAMETER4DNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glProgramNamedParameter4fvNV(id, len, name, v)
{
  global
  DllCall(PFNGLPROGRAMNAMEDPARAMETER4FVNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLptr, v)
}

glProgramNamedParameter4dvNV(id, len, name, v)
{
  global
  DllCall(PFNGLPROGRAMNAMEDPARAMETER4DVNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLptr, v)
}

glGetProgramNamedParameterfvNV(id, len, name, params)
{
  global
  DllCall(PFNGLGETPROGRAMNAMEDPARAMETERFVNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLptr, params)
}

glGetProgramNamedParameterdvNV(id, len, name, params)
{
  global
  DllCall(PFNGLGETPROGRAMNAMEDPARAMETERDVNVPROC, GLuint, id, GLsizei, len, GLptr, name, GLptr, params)
}


GL_NV_half_float := 1

glVertex2hNV(x, y)
{
  global
  DllCall(PFNGLVERTEX2HNVPROC, GLhalfNV, x, GLhalfNV, y)
}

glVertex2hvNV(v)
{
  global
  DllCall(PFNGLVERTEX2HVNVPROC, GLptr, v)
}

glVertex3hNV(x, y, z)
{
  global
  DllCall(PFNGLVERTEX3HNVPROC, GLhalfNV, x, GLhalfNV, y, GLhalfNV, z)
}

glVertex3hvNV(v)
{
  global
  DllCall(PFNGLVERTEX3HVNVPROC, GLptr, v)
}

glVertex4hNV(x, y, z, w)
{
  global
  DllCall(PFNGLVERTEX4HNVPROC, GLhalfNV, x, GLhalfNV, y, GLhalfNV, z, GLhalfNV, w)
}

glVertex4hvNV(v)
{
  global
  DllCall(PFNGLVERTEX4HVNVPROC, GLptr, v)
}

glNormal3hNV(nx, ny, nz)
{
  global
  DllCall(PFNGLNORMAL3HNVPROC, GLhalfNV, nx, GLhalfNV, ny, GLhalfNV, nz)
}

glNormal3hvNV(v)
{
  global
  DllCall(PFNGLNORMAL3HVNVPROC, GLptr, v)
}

glColor3hNV(red, green, blue)
{
  global
  DllCall(PFNGLCOLOR3HNVPROC, GLhalfNV, red, GLhalfNV, green, GLhalfNV, blue)
}

glColor3hvNV(v)
{
  global
  DllCall(PFNGLCOLOR3HVNVPROC, GLptr, v)
}

glColor4hNV(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCOLOR4HNVPROC, GLhalfNV, red, GLhalfNV, green, GLhalfNV, blue, GLhalfNV, alpha)
}

glColor4hvNV(v)
{
  global
  DllCall(PFNGLCOLOR4HVNVPROC, GLptr, v)
}

glTexCoord1hNV(s)
{
  global
  DllCall(PFNGLTEXCOORD1HNVPROC, GLhalfNV, s)
}

glTexCoord1hvNV(v)
{
  global
  DllCall(PFNGLTEXCOORD1HVNVPROC, GLptr, v)
}

glTexCoord2hNV(s, t)
{
  global
  DllCall(PFNGLTEXCOORD2HNVPROC, GLhalfNV, s, GLhalfNV, t)
}

glTexCoord2hvNV(v)
{
  global
  DllCall(PFNGLTEXCOORD2HVNVPROC, GLptr, v)
}

glTexCoord3hNV(s, t, r)
{
  global
  DllCall(PFNGLTEXCOORD3HNVPROC, GLhalfNV, s, GLhalfNV, t, GLhalfNV, r)
}

glTexCoord3hvNV(v)
{
  global
  DllCall(PFNGLTEXCOORD3HVNVPROC, GLptr, v)
}

glTexCoord4hNV(s, t, r, q)
{
  global
  DllCall(PFNGLTEXCOORD4HNVPROC, GLhalfNV, s, GLhalfNV, t, GLhalfNV, r, GLhalfNV, q)
}

glTexCoord4hvNV(v)
{
  global
  DllCall(PFNGLTEXCOORD4HVNVPROC, GLptr, v)
}

glMultiTexCoord1hNV(target, s)
{
  global
  DllCall(PFNGLMULTITEXCOORD1HNVPROC, GLenum, target, GLhalfNV, s)
}

glMultiTexCoord1hvNV(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD1HVNVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord2hNV(target, s, t)
{
  global
  DllCall(PFNGLMULTITEXCOORD2HNVPROC, GLenum, target, GLhalfNV, s, GLhalfNV, t)
}

glMultiTexCoord2hvNV(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD2HVNVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord3hNV(target, s, t, r)
{
  global
  DllCall(PFNGLMULTITEXCOORD3HNVPROC, GLenum, target, GLhalfNV, s, GLhalfNV, t, GLhalfNV, r)
}

glMultiTexCoord3hvNV(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD3HVNVPROC, GLenum, target, GLptr, v)
}

glMultiTexCoord4hNV(target, s, t, r, q)
{
  global
  DllCall(PFNGLMULTITEXCOORD4HNVPROC, GLenum, target, GLhalfNV, s, GLhalfNV, t, GLhalfNV, r, GLhalfNV, q)
}

glMultiTexCoord4hvNV(target, v)
{
  global
  DllCall(PFNGLMULTITEXCOORD4HVNVPROC, GLenum, target, GLptr, v)
}

glFogCoordhNV(fog)
{
  global
  DllCall(PFNGLFOGCOORDHNVPROC, GLhalfNV, fog)
}

glFogCoordhvNV(fog)
{
  global
  DllCall(PFNGLFOGCOORDHVNVPROC, GLptr, fog)
}

glSecondaryColor3hNV(red, green, blue)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3HNVPROC, GLhalfNV, red, GLhalfNV, green, GLhalfNV, blue)
}

glSecondaryColor3hvNV(v)
{
  global
  DllCall(PFNGLSECONDARYCOLOR3HVNVPROC, GLptr, v)
}

glVertexWeighthNV(weight)
{
  global
  DllCall(PFNGLVERTEXWEIGHTHNVPROC, GLhalfNV, weight)
}

glVertexWeighthvNV(weight)
{
  global
  DllCall(PFNGLVERTEXWEIGHTHVNVPROC, GLptr, weight)
}

glVertexAttrib1hNV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIB1HNVPROC, GLuint, index, GLhalfNV, x)
}

glVertexAttrib1hvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB1HVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib2hNV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIB2HNVPROC, GLuint, index, GLhalfNV, x, GLhalfNV, y)
}

glVertexAttrib2hvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB2HVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib3hNV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIB3HNVPROC, GLuint, index, GLhalfNV, x, GLhalfNV, y, GLhalfNV, z)
}

glVertexAttrib3hvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB3HVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttrib4hNV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIB4HNVPROC, GLuint, index, GLhalfNV, x, GLhalfNV, y, GLhalfNV, z, GLhalfNV, w)
}

glVertexAttrib4hvNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIB4HVNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribs1hvNV(index, n, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS1HVNVPROC, GLuint, index, GLsizei, n, GLptr, v)
}

glVertexAttribs2hvNV(index, n, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS2HVNVPROC, GLuint, index, GLsizei, n, GLptr, v)
}

glVertexAttribs3hvNV(index, n, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS3HVNVPROC, GLuint, index, GLsizei, n, GLptr, v)
}

glVertexAttribs4hvNV(index, n, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBS4HVNVPROC, GLuint, index, GLsizei, n, GLptr, v)
}


GL_NV_pixel_data_range := 1

glPixelDataRangeNV(target, length, pointer)
{
  global
  DllCall(PFNGLPIXELDATARANGENVPROC, GLenum, target, GLsizei, length, GLptr, pointer)
}

glFlushPixelDataRangeNV(target)
{
  global
  DllCall(PFNGLFLUSHPIXELDATARANGENVPROC, GLenum, target)
}


GL_NV_primitive_restart := 1

glPrimitiveRestartNV()
{
  global
  DllCall(PFNGLPRIMITIVERESTARTNVPROC)
}

glPrimitiveRestartIndexNV(index)
{
  global
  DllCall(PFNGLPRIMITIVERESTARTINDEXNVPROC, GLuint, index)
}


GL_NV_texture_expand_normal := 1
GL_NV_vertex_program2 := 1
GL_ATI_map_object_buffer := 1

glMapObjectBufferATI(buffer)
{
  global
  return DllCall(PFNGLMAPOBJECTBUFFERATIPROC, GLuint, buffer, GLptr)
}

glUnmapObjectBufferATI(buffer)
{
  global
  DllCall(PFNGLUNMAPOBJECTBUFFERATIPROC, GLuint, buffer)
}


GL_ATI_separate_stencil := 1

glStencilOpSeparateATI(face, sfail, dpfail, dppass)
{
  global
  DllCall(PFNGLSTENCILOPSEPARATEATIPROC, GLenum, face, GLenum, sfail, GLenum, dpfail, GLenum, dppass)
}

glStencilFuncSeparateATI(frontfunc, backfunc, ref, mask)
{
  global
  DllCall(PFNGLSTENCILFUNCSEPARATEATIPROC, GLenum, frontfunc, GLenum, backfunc, GLint, ref, GLuint, mask)
}


GL_ATI_vertex_attrib_array_object := 1

glVertexAttribArrayObjectATI(index, size, type, normalized, stride, buffer, offset)
{
  global
  DllCall(PFNGLVERTEXATTRIBARRAYOBJECTATIPROC, GLuint, index, GLint, size, GLenum, type, GLboolean, normalized, GLsizei, stride, GLuint, buffer, GLuint, offset)
}

glGetVertexAttribArrayObjectfvATI(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBARRAYOBJECTFVATIPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribArrayObjectivATI(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBARRAYOBJECTIVATIPROC, GLuint, index, GLenum, pname, GLptr, params)
}


GL_OES_read_format := 1
GL_EXT_depth_bounds_test := 1

glDepthBoundsEXT(zmin, zmax)
{
  global
  DllCall(PFNGLDEPTHBOUNDSEXTPROC, GLclampd, zmin, GLclampd, zmax)
}


GL_EXT_texture_mirror_clamp := 1
GL_EXT_blend_equation_separate := 1

glBlendEquationSeparateEXT(modeRGB, modeAlpha)
{
  global
  DllCall(PFNGLBLENDEQUATIONSEPARATEEXTPROC, GLenum, modeRGB, GLenum, modeAlpha)
}


GL_MESA_pack_invert := 1
GL_MESA_ycbcr_texture := 1
GL_EXT_pixel_buffer_object := 1
GL_NV_fragment_program_option := 1
GL_NV_fragment_program2 := 1
GL_NV_vertex_program2_option := 1
GL_NV_vertex_program3 := 1
GL_EXT_framebuffer_object := 1

glIsRenderbufferEXT(renderbuffer)
{
  global
  return DllCall(PFNGLISRENDERBUFFEREXTPROC, GLuint, renderbuffer, GLboolean)
}

glBindRenderbufferEXT(target, renderbuffer)
{
  global
  DllCall(PFNGLBINDRENDERBUFFEREXTPROC, GLenum, target, GLuint, renderbuffer)
}

glDeleteRenderbuffersEXT(n, renderbuffers)
{
  global
  DllCall(PFNGLDELETERENDERBUFFERSEXTPROC, GLsizei, n, GLptr, renderbuffers)
}

glGenRenderbuffersEXT(n, renderbuffers)
{
  global
  DllCall(PFNGLGENRENDERBUFFERSEXTPROC, GLsizei, n, GLptr, renderbuffers)
}

glRenderbufferStorageEXT(target, internalformat, width, height)
{
  global
  DllCall(PFNGLRENDERBUFFERSTORAGEEXTPROC, GLenum, target, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glGetRenderbufferParameterivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETRENDERBUFFERPARAMETERIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glIsFramebufferEXT(framebuffer)
{
  global
  return DllCall(PFNGLISFAMEBUFFEREXTPROC, GLuint, framebuffer, GLboolean)
}

glBindFramebufferEXT(target, framebuffer)
{
  global
  DllCall(PFNGLBINDFRAMEBUFFEREXTPROC, GLenum, target, GLuint, framebuffer)
}

glDeleteFramebuffersEXT(n, framebuffers)
{
  global
  DllCall(PFNGLDELETEFRAMEBUFFERSEXTPROC, GLsizei, n, GLptr, framebuffers)
}

glGenFramebuffersEXT(n, framebuffers)
{
  global
  DllCall(PFNGLGENFRAMEBUFFERSEXTPROC, GLsizei, n, GLptr, framebuffers)
}

glCheckFramebufferStatusEXT(target)
{
  global
  return DllCall(PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC, GLenum, target, GLenum)
}

glFramebufferTexture1DEXT(target, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE1DEXTPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glFramebufferTexture2DEXT(target, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE2DEXTPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glFramebufferTexture3DEXT(target, attachment, textarget, texture, level, zoffset)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURE3DEXTPROC, GLenum, target, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level, GLint, zoffset)
}

glFramebufferRenderbufferEXT(target, attachment, renderbuffertarget, renderbuffer)
{
  global
  DllCall(PFNGLFRAMEBUFFERRENDERBUFFEREXTPROC, GLenum, target, GLenum, attachment, GLenum, renderbuffertarget, GLuint, renderbuffer)
}

glGetFramebufferAttachmentParameterivEXT(target, attachment, pname, params)
{
  global
  DllCall(PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC, GLenum, target, GLenum, attachment, GLenum, pname, GLptr, params)
}

glGenerateMipmapEXT(target)
{
  global
  DllCall(PFNGLGENERATEMIPMAPEXTPROC, GLenum, target)
}


GL_GREMEDY_string_marker := 1

glStringMarkerGREMEDY(len, string)
{
  global
  DllCall(PFNGLSTRINGMARKERGREMEDYPROC, GLsizei, len, GLptr, string)
}


GL_EXT_packed_depth_stencil := 1
GL_EXT_stencil_clear_tag := 1

glStencilClearTagEXT(stencilTagBits, stencilClearTag)
{
  global
  DllCall(PFNGLSTENCILCLEARTAGEXTPROC, GLsizei, stencilTagBits, GLuint, stencilClearTag)
}


GL_EXT_texture_sRGB := 1
GL_EXT_framebuffer_blit := 1

glBlitFramebufferEXT(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter)
{
  global
  DllCall(PFNGLBLITFRAMEBUFFEREXTPROC, GLint, srcX0, GLint, srcY0, GLint, srcX1, GLint, srcY1, GLint, dstX0, GLint, dstY0, GLint, dstX1, GLint, dstY1, GLbitfield, mask, GLenum, filter)
}


GL_EXT_framebuffer_multisample := 1

glRenderbufferStorageMultisampleEXT(target, samples, internalformat, width, height)
{
  global
  DllCall(PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC, GLenum, target, GLsizei, samples, GLenum, internalformat, GLsizei, width, GLsizei, height)
}


GL_MESAX_texture_stack := 1

GL_EXT_timer_query := 1

glGetQueryObjecti64vEXT(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTI64VEXTPROC, GLuint, id, GLenum, pname, GLptr, params)
}

glGetQueryObjectui64vEXT(id, pname, params)
{
  global
  DllCall(PFNGLGETQUERYOBJECTUI64VEXTPROC, GLuint, id, GLenum, pname, GLptr, params)
}


GL_EXT_gpu_program_parameters := 1

glProgramEnvParameters4fvEXT(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERS4FVEXTPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramLocalParameters4fvEXT(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERS4FVEXTPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}


GL_APPLE_flush_buffer_range := 1

glBufferParameteriAPPLE(target, pname, param)
{
  global
  DllCall(PFNGLBUFFERPARAMETERIAPPLEPROC, GLenum, target, GLenum, pname, GLint, param)
}

glFlushMappedBufferRangeAPPLE(target, offset, size)
{
  global
  DllCall(PFNGLFLUSHMAPPEDBUFFERRANGEAPPLEPROC, GLenum, target, GLintptr, offset, GLsizeiptr, size)
}


GL_NV_gpu_program4 := 1

glProgramLocalParameterI4iNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERI4INVPROC, GLenum, target, GLuint, index, GLint, x, GLint, y, GLint, z, GLint, w)
}

glProgramLocalParameterI4ivNV(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERI4IVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramLocalParametersI4ivNV(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERSI4IVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramLocalParameterI4uiNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERI4UINVPROC, GLenum, target, GLuint, index, GLuint, x, GLuint, y, GLuint, z, GLuint, w)
}

glProgramLocalParameterI4uivNV(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERI4UIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramLocalParametersI4uivNV(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMLOCALPARAMETERSI4UIVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramEnvParameterI4iNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERI4INVPROC, GLenum, target, GLuint, index, GLint, x, GLint, y, GLint, z, GLint, w)
}

glProgramEnvParameterI4ivNV(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERI4IVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramEnvParametersI4ivNV(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERSI4IVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramEnvParameterI4uiNV(target, index, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERI4UINVPROC, GLenum, target, GLuint, index, GLuint, x, GLuint, y, GLuint, z, GLuint, w)
}

glProgramEnvParameterI4uivNV(target, index, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERI4UIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glProgramEnvParametersI4uivNV(target, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMENVPARAMETERSI4UIVNVPROC, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glGetProgramLocalParameterIivNV(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMLOCALPARAMETERIIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramLocalParameterIuivNV(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMLOCALPARAMETERIUIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramEnvParameterIivNV(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMENVPARAMETERIIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}

glGetProgramEnvParameterIuivNV(target, index, params)
{
  global
  DllCall(PFNGLGETPROGRAMENVPARAMETERIUIVNVPROC, GLenum, target, GLuint, index, GLptr, params)
}


GL_NV_geometry_program4 := 1

glProgramVertexLimitNV(target, limit)
{
  global
  DllCall(PFNGLPROGRAMVERTEXLIMITNVPROC, GLenum, target, GLint, limit)
}

glFramebufferTextureEXT(target, attachment, texture, level)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTUREEXTPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level)
}

glFramebufferTextureLayerEXT(target, attachment, texture, level, layer)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTURELAYEREXTPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level, GLint, layer)
}

glFramebufferTextureFaceEXT(target, attachment, texture, level, face)
{
  global
  DllCall(PFNGLFRAMEBUFFERTEXTUREFACEEXTPROC, GLenum, target, GLenum, attachment, GLuint, texture, GLint, level, GLenum, face)
}


GL_EXT_geometry_shader4 := 1

glProgramParameteriEXT(program, pname, value)
{
  global
  DllCall(PFNGLPROGRAMPARAMETERIEXTPROC, GLuint, program, GLenum, pname, GLint, value)
}


GL_NV_vertex_program4 := 1

glVertexAttribI1iEXT(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1IEXTPROC, GLuint, index, GLint, x)
}

glVertexAttribI2iEXT(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2IEXTPROC, GLuint, index, GLint, x, GLint, y)
}

glVertexAttribI3iEXT(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3IEXTPROC, GLuint, index, GLint, x, GLint, y, GLint, z)
}

glVertexAttribI4iEXT(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4IEXTPROC, GLuint, index, GLint, x, GLint, y, GLint, z, GLint, w)
}

glVertexAttribI1uiEXT(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1UIEXTPROC, GLuint, index, GLuint, x)
}

glVertexAttribI2uiEXT(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2UIEXTPROC, GLuint, index, GLuint, x, GLuint, y)
}

glVertexAttribI3uiEXT(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3UIEXTPROC, GLuint, index, GLuint, x, GLuint, y, GLuint, z)
}

glVertexAttribI4uiEXT(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UIEXTPROC, GLuint, index, GLuint, x, GLuint, y, GLuint, z, GLuint, w)
}

glVertexAttribI1ivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1IVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI2ivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2IVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI3ivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3IVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4ivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4IVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI1uivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI1UIVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI2uivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI2UIVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI3uivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI3UIVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4uivEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UIVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4bvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4BVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4svEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4SVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4ubvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4UBVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribI4usvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBI4USVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribIPointerEXT(index, size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBIPOINTEREXTPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glGetVertexAttribIivEXT(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIIVEXTPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribIuivEXT(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBIUIVEXTPROC, GLuint, index, GLenum, pname, GLptr, params)
}


GL_EXT_gpu_shader4 := 1

glGetUniformuivEXT(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMUIVEXTPROC, GLuint, program, GLint, location, GLptr, params)
}

glBindFragDataLocationEXT(program, color, name)
{
  global
  DllCall(PFNGLBINDFRAGDATALOCATIONEXTPROC, GLuint, program, GLuint, color, GLptr, name)
}

glGetFragDataLocationEXT(program, name)
{
  global
  return DllCall(PFNGLGETFRAGDATALOCATIONEXTPROC, GLuint, program, GLptr, name, GLint)
}

glUniform1uiEXT(location, v0)
{
  global
  DllCall(PFNGLUNIFORM1UIEXTPROC, GLint, location, GLuint, v0)
}

glUniform2uiEXT(location, v0, v1)
{
  global
  DllCall(PFNGLUNIFORM2UIEXTPROC, GLint, location, GLuint, v0, GLuint, v1)
}

glUniform3uiEXT(location, v0, v1, v2)
{
  global
  DllCall(PFNGLUNIFORM3UIEXTPROC, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2)
}

glUniform4uiEXT(location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLUNIFORM4UIEXTPROC, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2, GLuint, v3)
}

glUniform1uivEXT(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1UIVEXTPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2uivEXT(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2UIVEXTPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3uivEXT(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3UIVEXTPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4uivEXT(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4UIVEXTPROC, GLint, location, GLsizei, count, GLptr, value)
}


GL_EXT_draw_instanced := 1

glDrawArraysInstancedEXT(mode, start, count, primcount)
{
  global
  DllCall(PFNGLDRAWARRAYSINSTANCEDEXTPROC, GLenum, mode, GLint, start, GLsizei, count, GLsizei, primcount)
}

glDrawElementsInstancedEXT(mode, count, type, indices, primcount)
{
  global
  DllCall(PFNGLDRAWELEMENTSINSTANCEDEXTPROC, GLenum, mode, GLsizei, count, GLenum, type, GLptr, indices, GLsizei, primcount)
}


GL_EXT_packed_float := 1
GL_EXT_texture_array := 1
GL_EXT_texture_buffer_object := 1

glTexBufferEXT(target, internalformat, buffer)
{
  global
  DllCall(PFNGLTEXBUFFEREXTPROC, GLenum, target, GLenum, internalformat, GLuint, buffer)
}


GL_EXT_texture_compression_latc := 1
GL_EXT_texture_compression_rgtc := 1
GL_EXT_texture_shared_exponent := 1
GL_NV_depth_buffer_float := 1

glDepthRangedNV(zNear, zFar)
{
  global
  DllCall(PFNGLDEPTHRANGEDNVPROC, GLdouble, zNear, GLdouble, zFar)
}

glClearDepthdNV(depth)
{
  global
  DllCall(PFNGLCLEARDEPTHDNVPROC, GLdouble, depth)
}

glDepthBoundsdNV(zmin, zmax)
{
  global
  DllCall(PFNGLDEPTHBOUNDSDNVPROC, GLdouble, zmin, GLdouble, zmax)
}


GL_NV_fragment_program4 := 1
GL_NV_framebuffer_multisample_coverage := 1

glRenderbufferStorageMultisampleCoverageNV(target, coverageSamples, colorSamples, internalformat, width, height)
{
  global
  DllCall(PFNGLRENDERBUFFERSTORAGEMULTISAMPLECOVERAGENVPROC, GLenum, target, GLsizei, coverageSamples, GLsizei, colorSamples, GLenum, internalformat, GLsizei, width, GLsizei, height)
}


GL_EXT_framebuffer_sRGB := 1
GL_NV_geometry_shader4 := 1
GL_NV_parameter_buffer_object := 1

glProgramBufferParametersfvNV(target, buffer, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMBUFFERPARAMETERSFVNVPROC, GLenum, target, GLuint, buffer, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramBufferParametersIivNV(target, buffer, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMBUFFERPARAMETERSIIVNVPROC, GLenum, target, GLuint, buffer, GLuint, index, GLsizei, count, GLptr, params)
}

glProgramBufferParametersIuivNV(target, buffer, index, count, params)
{
  global
  DllCall(PFNGLPROGRAMBUFFERPARAMETERSIUIVNVPROC, GLenum, target, GLuint, buffer, GLuint, index, GLsizei, count, GLptr, params)
}


GL_EXT_draw_buffers2 := 1

glColorMaskIndexedEXT(index, r, g, b, a)
{
  global
  DllCall(PFNGLCOLORMASKINDEXEDEXTPROC, GLuint, index, GLboolean, r, GLboolean, g, GLboolean, b, GLboolean, a)
}

glGetBooleanIndexedvEXT(target, index, data)
{
  global
  DllCall(PFNGLGETBOOLEANINDEXEDVEXTPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetIntegerIndexedvEXT(target, index, data)
{
  global
  DllCall(PFNGLGETINTEGERINDEXEDVEXTPROC, GLenum, target, GLuint, index, GLptr, data)
}

glEnableIndexedEXT(target, index)
{
  global
  DllCall(PFNGLENABLEINDEXEDEXTPROC, GLenum, target, GLuint, index)
}

glDisableIndexedEXT(target, index)
{
  global
  DllCall(PFNGLDISABLEINDEXEDEXTPROC, GLenum, target, GLuint, index)
}

glIsEnabledIndexEXT(target, index)
{
  global
  return DllCall(PFNGLISENABLEDINDEXEXTPROC, GLenum, target, GLuint, index, GLboolean)
}

GL_NV_transform_feedback := 1

glBeginTransformFeedbackNV(primitiveMode)
{
  global
  DllCall(PFNGLBEGINTRANSFORMFEEDBACKNVPROC, GLenum, primitiveMode)
}

glEndTransformFeedbackNV()
{
  global
  DllCall(PFNGLENDTRANSFORMFEEDBACKNVPROC)
}

glTransformFeedbackAttribsNV(count, attribs, bufferMode)
{
  global
  DllCall(PFNGLTRANSFORMFEEDBACKATTRIBSNVPROC, GLuint, count, GLptr, attribs, GLenum, bufferMode)
}

glBindBufferRangeNV(target, index, buffer, offset, size)
{
  global
  DllCall(PFNGLBINDBUFFERRANGENVPROC, GLenum, target, GLuint, index, GLuint, buffer, GLintptr, offset, GLsizeiptr, size)
}

glBindBufferOffsetNV(target, index, buffer, offset)
{
  global
  DllCall(PFNGLBINDBUFFEROFFSETNVPROC, GLenum, target, GLuint, index, GLuint, buffer, GLintptr, offset)
}

glBindBufferBaseNV(target, index, buffer)
{
  global
  DllCall(PFNGLBINDBUFFERBASENVPROC, GLenum, target, GLuint, index, GLuint, buffer)
}

glTransformFeedbackVaryingsNV(program, count, locations, bufferMode)
{
  global
  DllCall(PFNGLTRANSFORMFEEDBACKVARYINGSNVPROC, GLuint, program, GLsizei, count, GLptr, locations, GLenum, bufferMode)
}

glActiveVaryingNV(program, name)
{
  global
  DllCall(PFNGLACTIVEVARYINGNVPROC, GLuint, program, GLptr, name)
}

glGetVaryingLocationNV(program, name)
{
  global
  return DllCall(PFNGLGETVARYINGLOCATIONNVPROC, GLuint, program, GLptr, name, GLint)
}

glGetActiveVaryingNV(program, index, bufSize, length, size, type, name)
{
  global
  DllCall(PFNGLGETACTIVEVARYINGNVPROC, GLuint, program, GLuint, index, GLsizei, bufSize, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}

glGetTransformFeedbackVaryingNV(program, index, location)
{
  global
  DllCall(PFNGLGETTRANSFORMFEEDBACKVARYINGNVPROC, GLuint, program, GLuint, index, GLptr, location)
}

glTransformFeedbackStreamAttribsNV(count, attribs, nbuffers, bufstreams, bufferMode)
{
  global
  DllCall(PFNGLTRANSFORMFEEDBACKSTREAMATTRIBSNVPROC, GLsizei, count, GLptr, attribs, GLsizei, nbuffers, GLptr, bufstreams, GLenum, bufferMode)
}


GL_EXT_bindable_uniform := 1

glUniformBufferEXT(program, location, buffer)
{
  global
  DllCall(PFNGLUNIFORMBUFFEREXTPROC, GLuint, program, GLint, location, GLuint, buffer)
}

glGetUniformBufferSizeEXT(program, location)
{
  global
  return DllCall(PFNGLGETUNIFORMBUFFERSIZEEXTPROC, GLuint, program, GLint, location, GLint)
}

glGetUniformOffsetEXT(program, location)
{
  global
  return DllCall(PFNGLGETUNIFORMOFFSETEXTPROC, GLuint, program, GLint, location, GLintptr)
}

GL_EXT_texture_integer := 1

glTexParameterIivEXT(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERIIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glTexParameterIuivEXT(target, pname, params)
{
  global
  DllCall(PFNGLTEXPARAMETERIUIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexParameterIivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERIIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTexParameterIuivEXT(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERIUIVEXTPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glClearColorIiEXT(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCLEARCOLORIIEXTPROC, GLint, red, GLint, green, GLint, blue, GLint, alpha)
}

glClearColorIuiEXT(red, green, blue, alpha)
{
  global
  DllCall(PFNGLCLEARCOLORIUIEXTPROC, GLuint, red, GLuint, green, GLuint, blue, GLuint, alpha)
}


GL_GREMEDY_frame_terminator := 1

glFrameTerminatorGREMEDY()
{
  global
  DllCall(PFNGLFRAMETERMINATORGREMEDYPROC)
}


GL_NV_conditional_render := 1

glBeginConditionalRenderNV(id, mode)
{
  global
  DllCall(PFNGLBEGINCONDITIONALRENDERNVPROC, GLuint, id, GLenum, mode)
}

glEndConditionalRenderNV()
{
  global
  DllCall(PFNGLENDCONDITIONALRENDERNVPROC)
}


GL_NV_present_video := 1

glPresentFrameKeyedNV(video_slot, minPresentTime, beginPresentTimeId, presentDurationId, type, target0, fill0, key0, target1, fill1, key1)
{
  global
  DllCall(PFNGLPRESENTFRAMEKEYEDNVPROC, GLuint, video_slot, GLuint64EXT, minPresentTime, GLuint, beginPresentTimeId, GLuint, presentDurationId, GLenum, type, GLenum, target0, GLuint, fill0, GLuint, key0, GLenum, target1, GLuint, fill1, GLuint, key1)
}

glPresentFrameDualFillNV(video_slot, minPresentTime, beginPresentTimeId, presentDurationId, type, target0, fill0, target1, fill1, target2, fill2, target3, fill3)
{
  global
  DllCall(PFNGLPRESENTFRAMEDUALFILLNVPROC, GLuint, video_slot, GLuint64EXT, minPresentTime, GLuint, beginPresentTimeId, GLuint, presentDurationId, GLenum, type, GLenum, target0, GLuint, fill0, GLenum, target1, GLuint, fill1, GLenum, target2, GLuint, fill2, GLenum, target3, GLuint, fill3)
}

glGetVideoivNV(video_slot, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOIVNVPROC, GLuint, video_slot, GLenum, pname, GLptr, params)
}

glGetVideouivNV(video_slot, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOUIVNVPROC, GLuint, video_slot, GLenum, pname, GLptr, params)
}

glGetVideoi64vNV(video_slot, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOI64VNVPROC, GLuint, video_slot, GLenum, pname, GLptr, params)
}

glGetVideoui64vNV(video_slot, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOUI64VNVPROC, GLuint, video_slot, GLenum, pname, GLptr, params)
}


GL_EXT_transform_feedback := 1

glBeginTransformFeedbackEXT(primitiveMode)
{
  global
  DllCall(PFNGLBEGINTRANSFORMFEEDBACKEXTPROC, GLenum, primitiveMode)
}

glEndTransformFeedbackEXT()
{
  global
  DllCall(PFNGLENDTRANSFORMFEEDBACKEXTPROC)
}

glBindBufferRangeEXT(target, index, buffer, offset, size)
{
  global
  DllCall(PFNGLBINDBUFFERRANGEEXTPROC, GLenum, target, GLuint, index, GLuint, buffer, GLintptr, offset, GLsizeiptr, size)
}

glBindBufferOffsetEXT(target, index, buffer, offset)
{
  global
  DllCall(PFNGLBINDBUFFEROFFSETEXTPROC, GLenum, target, GLuint, index, GLuint, buffer, GLintptr, offset)
}

glBindBufferBaseEXT(target, index, buffer)
{
  global
  DllCall(PFNGLBINDBUFFERBASEEXTPROC, GLenum, target, GLuint, index, GLuint, buffer)
}

glTransformFeedbackVaryingsEXT(program, count, varyings, bufferMode)
{
  global
  DllCall(PFNGLTRANSFORMFEEDBACKVARYINGSEXTPROC, GLuint, program, GLsizei, count, GLastr, varyings, GLenum, bufferMode)
}

glGetTransformFeedbackVaryingEXT(program, index, bufSize, length, size, type, name)
{
  global
  DllCall(PFNGLGETTRANSFORMFEEDBACKVARYINGEXTPROC, GLuint, program, GLuint, index, GLsizei, bufSize, GLptr, length, GLptr, size, GLptr, type, GLptr, name)
}


GL_EXT_direct_state_access := 1

glClientAttribDefaultEXT(mask)
{
  global
  DllCall(PFNGLCLIENTATTRIBDEFAULTEXTPROC, GLbitfield, mask)
}

glPushClientAttribDefaultEXT(mask)
{
  global
  DllCall(PFNGLPUSHCLIENTATTRIBDEFAULTEXTPROC, GLbitfield, mask)
}

glMatrixLoadfEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXLOADFEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixLoaddEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXLOADDEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixMultfEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXMULTFEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixMultdEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXMULTDEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixLoadIdentityEXT(mode)
{
  global
  DllCall(PFNGLMATRIXLOADIDENTITYEXTPROC, GLenum, mode)
}

glMatrixRotatefEXT(mode, angle, x, y, z)
{
  global
  DllCall(PFNGLMATRIXROTATEFEXTPROC, GLenum, mode, GLfloat, angle, GLfloat, x, GLfloat, y, GLfloat, z)
}

glMatrixRotatedEXT(mode, angle, x, y, z)
{
  global
  DllCall(PFNGLMATRIXROTATEDEXTPROC, GLenum, mode, GLdouble, angle, GLdouble, x, GLdouble, y, GLdouble, z)
}

glMatrixScalefEXT(mode, x, y, z)
{
  global
  DllCall(PFNGLMATRIXSCALEFEXTPROC, GLenum, mode, GLfloat, x, GLfloat, y, GLfloat, z)
}

glMatrixScaledEXT(mode, x, y, z)
{
  global
  DllCall(PFNGLMATRIXSCALEDEXTPROC, GLenum, mode, GLdouble, x, GLdouble, y, GLdouble, z)
}

glMatrixTranslatefEXT(mode, x, y, z)
{
  global
  DllCall(PFNGLMATRIXTRANSLATEFEXTPROC, GLenum, mode, GLfloat, x, GLfloat, y, GLfloat, z)
}

glMatrixTranslatedEXT(mode, x, y, z)
{
  global
  DllCall(PFNGLMATRIXTRANSLATEDEXTPROC, GLenum, mode, GLdouble, x, GLdouble, y, GLdouble, z)
}

glMatrixFrustumEXT(mode, left, right, bottom, top, zNear, zFar)
{
  global
  DllCall(PFNGLMATRIXFRUSTUMEXTPROC, GLenum, mode, GLdouble, left, GLdouble, right, GLdouble, bottom, GLdouble, top, GLdouble, zNear, GLdouble, zFar)
}

glMatrixOrthoEXT(mode, left, right, bottom, top, zNear, zFar)
{
  global
  DllCall(PFNGLMATRIXORTHOEXTPROC, GLenum, mode, GLdouble, left, GLdouble, right, GLdouble, bottom, GLdouble, top, GLdouble, zNear, GLdouble, zFar)
}

glMatrixPopEXT(mode)
{
  global
  DllCall(PFNGLMATRIXPOPEXTPROC, GLenum, mode)
}

glMatrixPushEXT(mode)
{
  global
  DllCall(PFNGLMATRIXPUSHEXTPROC, GLenum, mode)
}

glMatrixLoadTransposefEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXLOADTRANSPOSEFEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixLoadTransposedEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXLOADTRANSPOSEDEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixMultTransposefEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXMULTTRANSPOSEFEXTPROC, GLenum, mode, GLptr, m)
}

glMatrixMultTransposedEXT(mode, m)
{
  global
  DllCall(PFNGLMATRIXMULTTRANSPOSEDEXTPROC, GLenum, mode, GLptr, m)
}

glTextureParameterfEXT(texture, target, pname, param)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERFEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLfloat, param)
}

glTextureParameterfvEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERFVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glTextureParameteriEXT(texture, target, pname, param)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERIEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLint, param)
}

glTextureParameterivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glTextureImage1DEXT(texture, target, level, internalformat, width, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTUREIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTextureImage2DEXT(texture, target, level, internalformat, width, height, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTUREIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTextureSubImage1DEXT(texture, target, level, xoffset, width, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTURESUBIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLenum, type, GLptr, pixels)
}

glTextureSubImage2DEXT(texture, target, level, xoffset, yoffset, width, height, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTURESUBIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}

glCopyTextureImage1DEXT(texture, target, level, internalformat, x, y, width, border)
{
  global
  DllCall(PFNGLCOPYTEXTUREIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLint, border)
}

glCopyTextureImage2DEXT(texture, target, level, internalformat, x, y, width, height, border)
{
  global
  DllCall(PFNGLCOPYTEXTUREIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLint, border)
}

glCopyTextureSubImage1DEXT(texture, target, level, xoffset, x, y, width)
{
  global
  DllCall(PFNGLCOPYTEXTURESUBIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, x, GLint, y, GLsizei, width)
}

glCopyTextureSubImage2DEXT(texture, target, level, xoffset, yoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXTURESUBIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glGetTextureImageEXT(texture, target, level, format, type, pixels)
{
  global
  DllCall(PFNGLGETTEXTUREIMAGEEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, format, GLenum, type, GLptr, pixels)
}

glGetTextureParameterfvEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLGETTEXTUREPARAMETERFVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTextureParameterivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLGETTEXTUREPARAMETERIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTextureLevelParameterfvEXT(texture, target, level, pname, params)
{
  global
  DllCall(PFNGLGETTEXTURELEVELPARAMETERFVEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glGetTextureLevelParameterivEXT(texture, target, level, pname, params)
{
  global
  DllCall(PFNGLGETTEXTURELEVELPARAMETERIVEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glTextureImage3DEXT(texture, target, level, internalformat, width, height, depth, border, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTUREIMAGE3DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glTextureSubImage3DEXT(texture, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels)
{
  global
  DllCall(PFNGLTEXTURESUBIMAGE3DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLenum, type, GLptr, pixels)
}

glCopyTextureSubImage3DEXT(texture, target, level, xoffset, yoffset, zoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYTEXTURESUBIMAGE3DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glMultiTexParameterfEXT(texunit, target, pname, param)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERFEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLfloat, param)
}

glMultiTexParameterfvEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERFVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexParameteriEXT(texunit, target, pname, param)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERIEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLint, param)
}

glMultiTexParameterivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexImage1DEXT(texunit, target, level, internalformat, width, border, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glMultiTexImage2DEXT(texunit, target, level, internalformat, width, height, border, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glMultiTexSubImage1DEXT(texunit, target, level, xoffset, width, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXSUBIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLenum, type, GLptr, pixels)
}

glMultiTexSubImage2DEXT(texunit, target, level, xoffset, yoffset, width, height, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXSUBIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLenum, type, GLptr, pixels)
}

glCopyMultiTexImage1DEXT(texunit, target, level, internalformat, x, y, width, border)
{
  global
  DllCall(PFNGLCOPYMULTITEXIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLint, border)
}

glCopyMultiTexImage2DEXT(texunit, target, level, internalformat, x, y, width, height, border)
{
  global
  DllCall(PFNGLCOPYMULTITEXIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLint, x, GLint, y, GLsizei, width, GLsizei, height, GLint, border)
}

glCopyMultiTexSubImage1DEXT(texunit, target, level, xoffset, x, y, width)
{
  global
  DllCall(PFNGLCOPYMULTITEXSUBIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, x, GLint, y, GLsizei, width)
}

glCopyMultiTexSubImage2DEXT(texunit, target, level, xoffset, yoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYMULTITEXSUBIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glGetMultiTexImageEXT(texunit, target, level, format, type, pixels)
{
  global
  DllCall(PFNGLGETMULTITEXIMAGEEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, format, GLenum, type, GLptr, pixels)
}

glGetMultiTexParameterfvEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXPARAMETERFVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexParameterivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXPARAMETERIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexLevelParameterfvEXT(texunit, target, level, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXLEVELPARAMETERFVEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glGetMultiTexLevelParameterivEXT(texunit, target, level, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXLEVELPARAMETERIVEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, pname, GLptr, params)
}

glMultiTexImage3DEXT(texunit, target, level, internalformat, width, height, depth, border, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXIMAGE3DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLenum, format, GLenum, type, GLptr, pixels)
}

glMultiTexSubImage3DEXT(texunit, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels)
{
  global
  DllCall(PFNGLMULTITEXSUBIMAGE3DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLenum, type, GLptr, pixels)
}

glCopyMultiTexSubImage3DEXT(texunit, target, level, xoffset, yoffset, zoffset, x, y, width, height)
{
  global
  DllCall(PFNGLCOPYMULTITEXSUBIMAGE3DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLint, x, GLint, y, GLsizei, width, GLsizei, height)
}

glBindMultiTextureEXT(texunit, target, texture)
{
  global
  DllCall(PFNGLBINDMULTITEXTUREEXTPROC, GLenum, texunit, GLenum, target, GLuint, texture)
}

glEnableClientStateIndexedEXT(array, index)
{
  global
  DllCall(PFNGLENABLECLIENTSTATEINDEXEDEXTPROC, GLenum, array, GLuint, index)
}

glDisableClientStateIndexedEXT(array, index)
{
  global
  DllCall(PFNGLDISABLECLIENTSTATEINDEXEDEXTPROC, GLenum, array, GLuint, index)
}

glMultiTexCoordPointerEXT(texunit, size, type, stride, pointer)
{
  global
  DllCall(PFNGLMULTITEXCOORDPOINTEREXTPROC, GLenum, texunit, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glMultiTexEnvfEXT(texunit, target, pname, param)
{
  global
  DllCall(PFNGLMULTITEXENVFEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLfloat, param)
}

glMultiTexEnvfvEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXENVFVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexEnviEXT(texunit, target, pname, param)
{
  global
  DllCall(PFNGLMULTITEXENVIEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLint, param)
}

glMultiTexEnvivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXENVIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexGendEXT(texunit, coord, pname, param)
{
  global
  DllCall(PFNGLMULTITEXGENDEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLdouble, param)
}

glMultiTexGendvEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLMULTITEXGENDVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glMultiTexGenfEXT(texunit, coord, pname, param)
{
  global
  DllCall(PFNGLMULTITEXGENFEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLfloat, param)
}

glMultiTexGenfvEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLMULTITEXGENFVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glMultiTexGeniEXT(texunit, coord, pname, param)
{
  global
  DllCall(PFNGLMULTITEXGENIEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLint, param)
}

glMultiTexGenivEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLMULTITEXGENIVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetMultiTexEnvfvEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXENVFVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexEnvivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXENVIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexGendvEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXGENDVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetMultiTexGenfvEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXGENFVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetMultiTexGenivEXT(texunit, coord, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXGENIVEXTPROC, GLenum, texunit, GLenum, coord, GLenum, pname, GLptr, params)
}

glGetFloatIndexedvEXT(target, index, data)
{
  global
  DllCall(PFNGLGETFLOATINDEXEDVEXTPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetDoubleIndexedvEXT(target, index, data)
{
  global
  DllCall(PFNGLGETDOUBLEINDEXEDVEXTPROC, GLenum, target, GLuint, index, GLptr, data)
}

glGetPointerIndexedvEXT(target, index, data)
{
  global
  DllCall(PFNGLGETPOINTERINDEXEDVEXTPROC, GLenum, target, GLuint, index, GLptr, data)
}

glCompressedTextureImage3DEXT(texture, target, level, internalformat, width, height, depth, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTUREIMAGE3DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedTextureImage2DEXT(texture, target, level, internalformat, width, height, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTUREIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedTextureImage1DEXT(texture, target, level, internalformat, width, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTUREIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedTextureSubImage3DEXT(texture, target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTURESUBIMAGE3DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glCompressedTextureSubImage2DEXT(texture, target, level, xoffset, yoffset, width, height, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTURESUBIMAGE2DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glCompressedTextureSubImage1DEXT(texture, target, level, xoffset, width, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDTEXTURESUBIMAGE1DEXTPROC, GLuint, texture, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glGetCompressedTextureImageEXT(texture, target, lod, img)
{
  global
  DllCall(PFNGLGETCOMPRESSEDTEXTUREIMAGEEXTPROC, GLuint, texture, GLenum, target, GLint, lod, GLptr, img)
}

glCompressedMultiTexImage3DEXT(texunit, target, level, internalformat, width, height, depth, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXIMAGE3DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLsizei, depth, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedMultiTexImage2DEXT(texunit, target, level, internalformat, width, height, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLsizei, height, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedMultiTexImage1DEXT(texunit, target, level, internalformat, width, border, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLenum, internalformat, GLsizei, width, GLint, border, GLsizei, imageSize, GLptr, bits)
}

glCompressedMultiTexSubImage3DEXT(texunit, target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXSUBIMAGE3DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLint, zoffset, GLsizei, width, GLsizei, height, GLsizei, depth, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glCompressedMultiTexSubImage2DEXT(texunit, target, level, xoffset, yoffset, width, height, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXSUBIMAGE2DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLint, yoffset, GLsizei, width, GLsizei, height, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glCompressedMultiTexSubImage1DEXT(texunit, target, level, xoffset, width, format, imageSize, bits)
{
  global
  DllCall(PFNGLCOMPRESSEDMULTITEXSUBIMAGE1DEXTPROC, GLenum, texunit, GLenum, target, GLint, level, GLint, xoffset, GLsizei, width, GLenum, format, GLsizei, imageSize, GLptr, bits)
}

glGetCompressedMultiTexImageEXT(texunit, target, lod, img)
{
  global
  DllCall(PFNGLGETCOMPRESSEDMULTITEXIMAGEEXTPROC, GLenum, texunit, GLenum, target, GLint, lod, GLptr, img)
}

glNamedProgramStringEXT(program, target, format, len, string)
{
  global
  DllCall(PFNGLNAMEDPROGRAMSTRINGEXTPROC, GLuint, program, GLenum, target, GLenum, format, GLsizei, len, GLptr, string)
}

glNamedProgramLocalParameter4dEXT(program, target, index, x, y, z, w)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETER4DEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glNamedProgramLocalParameter4dvEXT(program, target, index, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETER4DVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glNamedProgramLocalParameter4fEXT(program, target, index, x, y, z, w)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETER4FEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLfloat, x, GLfloat, y, GLfloat, z, GLfloat, w)
}

glNamedProgramLocalParameter4fvEXT(program, target, index, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETER4FVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glGetNamedProgramLocalParameterdvEXT(program, target, index, params)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMLOCALPARAMETERDVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glGetNamedProgramLocalParameterfvEXT(program, target, index, params)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMLOCALPARAMETERFVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glGetNamedProgramivEXT(program, target, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMIVEXTPROC, GLuint, program, GLenum, target, GLenum, pname, GLptr, params)
}

glGetNamedProgramStringEXT(program, target, pname, string)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMSTRINGEXTPROC, GLuint, program, GLenum, target, GLenum, pname, GLptr, string)
}

glNamedProgramLocalParameters4fvEXT(program, target, index, count, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERS4FVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glNamedProgramLocalParameterI4iEXT(program, target, index, x, y, z, w)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERI4IEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLint, x, GLint, y, GLint, z, GLint, w)
}

glNamedProgramLocalParameterI4ivEXT(program, target, index, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERI4IVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glNamedProgramLocalParametersI4ivEXT(program, target, index, count, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERSI4IVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glNamedProgramLocalParameterI4uiEXT(program, target, index, x, y, z, w)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLuint, x, GLuint, y, GLuint, z, GLuint, w)
}

glNamedProgramLocalParameterI4uivEXT(program, target, index, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glNamedProgramLocalParametersI4uivEXT(program, target, index, count, params)
{
  global
  DllCall(PFNGLNAMEDPROGRAMLOCALPARAMETERSI4UIVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLsizei, count, GLptr, params)
}

glGetNamedProgramLocalParameterIivEXT(program, target, index, params)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMLOCALPARAMETERIIVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glGetNamedProgramLocalParameterIuivEXT(program, target, index, params)
{
  global
  DllCall(PFNGLGETNAMEDPROGRAMLOCALPARAMETERIUIVEXTPROC, GLuint, program, GLenum, target, GLuint, index, GLptr, params)
}

glTextureParameterIivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERIIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glTextureParameterIuivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLTEXTUREPARAMETERIUIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTextureParameterIivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLGETTEXTUREPARAMETERIIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glGetTextureParameterIuivEXT(texture, target, pname, params)
{
  global
  DllCall(PFNGLGETTEXTUREPARAMETERIUIVEXTPROC, GLuint, texture, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexParameterIivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERIIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glMultiTexParameterIuivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLMULTITEXPARAMETERIUIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexParameterIivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXPARAMETERIIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glGetMultiTexParameterIuivEXT(texunit, target, pname, params)
{
  global
  DllCall(PFNGLGETMULTITEXPARAMETERIUIVEXTPROC, GLenum, texunit, GLenum, target, GLenum, pname, GLptr, params)
}

glProgramUniform1fEXT(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1FEXTPROC, GLuint, program, GLint, location, GLfloat, v0)
}

glProgramUniform2fEXT(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2FEXTPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1)
}

glProgramUniform3fEXT(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3FEXTPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2)
}

glProgramUniform4fEXT(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4FEXTPROC, GLuint, program, GLint, location, GLfloat, v0, GLfloat, v1, GLfloat, v2, GLfloat, v3)
}

glProgramUniform1iEXT(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1IEXTPROC, GLuint, program, GLint, location, GLint, v0)
}

glProgramUniform2iEXT(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2IEXTPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1)
}

glProgramUniform3iEXT(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3IEXTPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1, GLint, v2)
}

glProgramUniform4iEXT(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4IEXTPROC, GLuint, program, GLint, location, GLint, v0, GLint, v1, GLint, v2, GLint, v3)
}

glProgramUniform1fvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2fvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3fvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4fvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform1ivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1IVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2ivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2IVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3ivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3IVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4ivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4IVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniformMatrix2fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x3fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X3FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x2fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X2FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x4fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X4FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x2fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X2FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x4fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X4FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x3fvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X3FVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniform1uiEXT(program, location, v0)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UIEXTPROC, GLuint, program, GLint, location, GLuint, v0)
}

glProgramUniform2uiEXT(program, location, v0, v1)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UIEXTPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1)
}

glProgramUniform3uiEXT(program, location, v0, v1, v2)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UIEXTPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2)
}

glProgramUniform4uiEXT(program, location, v0, v1, v2, v3)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UIEXTPROC, GLuint, program, GLint, location, GLuint, v0, GLuint, v1, GLuint, v2, GLuint, v3)
}

glProgramUniform1uivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UIVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2uivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UIVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3uivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UIVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4uivEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UIVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glNamedBufferDataEXT(buffer, size, data, usage)
{
  global
  DllCall(PFNGLNAMEDBUFFERDATAEXTPROC, GLuint, buffer, GLsizeiptr, size, GLptr, data, GLenum, usage)
}

glNamedBufferSubDataEXT(buffer, offset, size, data)
{
  global
  DllCall(PFNGLNAMEDBUFFERSUBDATAEXTPROC, GLuint, buffer, GLintptr, offset, GLsizeiptr, size, GLptr, data)
}

glMapNamedBufferEXT(buffer, access)
{
  global
  return DllCall(PFNGLMAPNAMEDBUFFEREXTPROC, GLuint, buffer, GLenum, access, GLptr)
}

glUnmapNamedBufferEXT(buffer)
{
  global
  return DllCall(PFNGLUNMAPNAMEDBUFFEREXTPROC, GLuint, buffer, GLboolean)
}

glMapNamedBufferRangeEXT(buffer, offset, length, access)
{
  global
  return DllCall(PFNGLMAPNAMEDBUFFERRANGEEXTPROC, GLuint, buffer, GLintptr, offset, GLsizeiptr, length, GLbitfield, access, GLptr)
}

glFlushMappedNamedBufferRangeEXT(buffer, offset, length)
{
  global
  DllCall(PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEEXTPROC, GLuint, buffer, GLintptr, offset, GLsizeiptr, length)
}

glNamedCopyBufferSubDataEXT(readBuffer, writeBuffer, readOffset, writeOffset, size)
{
  global
  DllCall(PFNGLNAMEDCOPYBUFFERSUBDATAEXTPROC, GLuint, readBuffer, GLuint, writeBuffer, GLintptr, readOffset, GLintptr, writeOffset, GLsizeiptr, size)
}

glGetNamedBufferParameterivEXT(buffer, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDBUFFERPARAMETERIVEXTPROC, GLuint, buffer, GLenum, pname, GLptr, params)
}

glGetNamedBufferPointervEXT(buffer, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDBUFFERPOINTERVEXTPROC, GLuint, buffer, GLenum, pname, GLptr, params)
}

glGetNamedBufferSubDataEXT(buffer, offset, size, data)
{
  global
  DllCall(PFNGLGETNAMEDBUFFERSUBDATAEXTPROC, GLuint, buffer, GLintptr, offset, GLsizeiptr, size, GLptr, data)
}

glTextureBufferEXT(texture, target, internalformat, buffer)
{
  global
  DllCall(PFNGLTEXTUREBUFFEREXTPROC, GLuint, texture, GLenum, target, GLenum, internalformat, GLuint, buffer)
}

glMultiTexBufferEXT(texunit, target, internalformat, buffer)
{
  global
  DllCall(PFNGLMULTITEXBUFFEREXTPROC, GLenum, texunit, GLenum, target, GLenum, internalformat, GLuint, buffer)
}

glNamedRenderbufferStorageEXT(renderbuffer, internalformat, width, height)
{
  global
  DllCall(PFNGLNAMEDRENDERBUFFERSTORAGEEXTPROC, GLuint, renderbuffer, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glGetNamedRenderbufferParameterivEXT(renderbuffer, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDRENDERBUFFERPARAMETERIVEXTPROC, GLuint, renderbuffer, GLenum, pname, GLptr, params)
}

glCheckNamedFramebufferStatusEXT(framebuffer, target)
{
  global
  return DllCall(PFNGLCHECKNAMEDFRAMEBUFFERSTATUSEXTPROC, GLuint, framebuffer, GLenum, target, GLenum)
}

glNamedFramebufferTexture1DEXT(framebuffer, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTURE1DEXTPROC, GLuint, framebuffer, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glNamedFramebufferTexture2DEXT(framebuffer, attachment, textarget, texture, level)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTURE2DEXTPROC, GLuint, framebuffer, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level)
}

glNamedFramebufferTexture3DEXT(framebuffer, attachment, textarget, texture, level, zoffset)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTURE3DEXTPROC, GLuint, framebuffer, GLenum, attachment, GLenum, textarget, GLuint, texture, GLint, level, GLint, zoffset)
}

glNamedFramebufferRenderbufferEXT(framebuffer, attachment, renderbuffertarget, renderbuffer)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERRENDERBUFFEREXTPROC, GLuint, framebuffer, GLenum, attachment, GLenum, renderbuffertarget, GLuint, renderbuffer)
}

glGetNamedFramebufferAttachmentParameterivEXT(framebuffer, attachment, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC, GLuint, framebuffer, GLenum, attachment, GLenum, pname, GLptr, params)
}

glGenerateTextureMipmapEXT(texture, target)
{
  global
  DllCall(PFNGLGENERATETEXTUREMIPMAPEXTPROC, GLuint, texture, GLenum, target)
}

glGenerateMultiTexMipmapEXT(texunit, target)
{
  global
  DllCall(PFNGLGENERATEMULTITEXMIPMAPEXTPROC, GLenum, texunit, GLenum, target)
}

glFramebufferDrawBufferEXT(framebuffer, mode)
{
  global
  DllCall(PFNGLFRAMEBUFFERDRAWBUFFEREXTPROC, GLuint, framebuffer, GLenum, mode)
}

glFramebufferDrawBuffersEXT(framebuffer, n, bufs)
{
  global
  DllCall(PFNGLFRAMEBUFFERDRAWBUFFERSEXTPROC, GLuint, framebuffer, GLsizei, n, GLptr, bufs)
}

glFramebufferReadBufferEXT(framebuffer, mode)
{
  global
  DllCall(PFNGLFRAMEBUFFERREADBUFFEREXTPROC, GLuint, framebuffer, GLenum, mode)
}

glGetFramebufferParameterivEXT(framebuffer, pname, params)
{
  global
  DllCall(PFNGLGETFRAMEBUFFERPARAMETERIVEXTPROC, GLuint, framebuffer, GLenum, pname, GLptr, params)
}

glNamedRenderbufferStorageMultisampleEXT(renderbuffer, samples, internalformat, width, height)
{
  global
  DllCall(PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC, GLuint, renderbuffer, GLsizei, samples, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glNamedRenderbufferStorageMultisampleCoverageEXT(renderbuffer, coverageSamples, colorSamples, internalformat, width, height)
{
  global
  DllCall(PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLECOVERAGEEXTPROC, GLuint, renderbuffer, GLsizei, coverageSamples, GLsizei, colorSamples, GLenum, internalformat, GLsizei, width, GLsizei, height)
}

glNamedFramebufferTextureEXT(framebuffer, attachment, texture, level)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTUREEXTPROC, GLuint, framebuffer, GLenum, attachment, GLuint, texture, GLint, level)
}

glNamedFramebufferTextureLayerEXT(framebuffer, attachment, texture, level, layer)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTURELAYEREXTPROC, GLuint, framebuffer, GLenum, attachment, GLuint, texture, GLint, level, GLint, layer)
}

glNamedFramebufferTextureFaceEXT(framebuffer, attachment, texture, level, face)
{
  global
  DllCall(PFNGLNAMEDFRAMEBUFFERTEXTUREFACEEXTPROC, GLuint, framebuffer, GLenum, attachment, GLuint, texture, GLint, level, GLenum, face)
}

glTextureRenderbufferEXT(texture, target, renderbuffer)
{
  global
  DllCall(PFNGLTEXTURERENDERBUFFEREXTPROC, GLuint, texture, GLenum, target, GLuint, renderbuffer)
}

glMultiTexRenderbufferEXT(texunit, target, renderbuffer)
{
  global
  DllCall(PFNGLMULTITEXRENDERBUFFEREXTPROC, GLenum, texunit, GLenum, target, GLuint, renderbuffer)
}

glProgramUniform1dEXT(program, location, x)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1DEXTPROC, GLuint, program, GLint, location, GLdouble, x)
}

glProgramUniform2dEXT(program, location, x, y)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2DEXTPROC, GLuint, program, GLint, location, GLdouble, x, GLdouble, y)
}

glProgramUniform3dEXT(program, location, x, y, z)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3DEXTPROC, GLuint, program, GLint, location, GLdouble, x, GLdouble, y, GLdouble, z)
}

glProgramUniform4dEXT(program, location, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4DEXTPROC, GLuint, program, GLint, location, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glProgramUniform1dvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2dvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3dvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4dvEXT(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniformMatrix2dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x3dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X3DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix2x4dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX2X4DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x2dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X2DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix3x4dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX3X4DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x2dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X2DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}

glProgramUniformMatrix4x3dvEXT(program, location, count, transpose, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMMATRIX4X3DVEXTPROC, GLuint, program, GLint, location, GLsizei, count, GLboolean, transpose, GLptr, value)
}


GL_EXT_vertex_array_bgra := 1
GL_EXT_texture_swizzle := 1
GL_NV_explicit_multisample := 1

glGetMultisamplefvNV(pname, index, val)
{
  global
  DllCall(PFNGLGETMULTISAMPLEFVNVPROC, GLenum, pname, GLuint, index, GLptr, val)
}

glSampleMaskIndexedNV(index, mask)
{
  global
  DllCall(PFNGLSAMPLEMASKINDEXEDNVPROC, GLuint, index, GLbitfield, mask)
}

glTexRenderbufferNV(target, renderbuffer)
{
  global
  DllCall(PFNGLTEXRENDERBUFFERNVPROC, GLenum, target, GLuint, renderbuffer)
}


GL_NV_transform_feedback2 := 1

glBindTransformFeedbackNV(target, id)
{
  global
  DllCall(PFNGLBINDTRANSFORMFEEDBACKNVPROC, GLenum, target, GLuint, id)
}

glDeleteTransformFeedbacksNV(n, ids)
{
  global
  DllCall(PFNGLDELETETRANSFORMFEEDBACKSNVPROC, GLsizei, n, GLptr, ids)
}

glGenTransformFeedbacksNV(n, ids)
{
  global
  DllCall(PFNGLGENTRANSFORMFEEDBACKSNVPROC, GLsizei, n, GLptr, ids)
}

glIsTransformFeedbackNV(id)
{
  global
  return DllCall(PFNGLISTRANSFORMFEEDBACKNVPROC, GLuint, id, GLboolean)
}

glPauseTransformFeedbackNV()
{
  global
  DllCall(PFNGLPAUSETRANSFORMFEEDBACKNVPROC)
}

glResumeTransformFeedbackNV()
{
  global
  DllCall(PFNGLRESUMETRANSFORMFEEDBACKNVPROC)
}

glDrawTransformFeedbackNV(mode, id)
{
  global
  DllCall(PFNGLDRAWTRANSFORMFEEDBACKNVPROC, GLenum, mode, GLuint, id)
}


GL_ATI_meminfo := 1
GL_AMD_performance_monitor := 1

glGetPerfMonitorGroupsAMD(numGroups, groupsSize, groups)
{
  global
  DllCall(PFNGLGETPERFMONITORGROUPSAMDPROC, GLptr, numGroups, GLsizei, groupsSize, GLptr, groups)
}

glGetPerfMonitorCountersAMD(group, numCounters, maxActiveCounters, counterSize, counters)
{
  global
  DllCall(PFNGLGETPERFMONITORCOUNTERSAMDPROC, GLuint, group, GLptr, numCounters, GLptr, maxActiveCounters, GLsizei, counterSize, GLptr, counters)
}

glGetPerfMonitorGroupStringAMD(group, bufSize, length, groupString)
{
  global
  DllCall(PFNGLGETPERFMONITORGROUPSTRINGAMDPROC, GLuint, group, GLsizei, bufSize, GLptr, length, GLptr, groupString)
}

glGetPerfMonitorCounterStringAMD(group, counter, bufSize, length, counterString)
{
  global
  DllCall(PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC, GLuint, group, GLuint, counter, GLsizei, bufSize, GLptr, length, GLptr, counterString)
}

glGetPerfMonitorCounterInfoAMD(group, counter, pname, data)
{
  global
  DllCall(PFNGLGETPERFMONITORCOUNTERINFOAMDPROC, GLuint, group, GLuint, counter, GLenum, pname, GLptr, data)
}

glGenPerfMonitorsAMD(n, monitors)
{
  global
  DllCall(PFNGLGENPERFMONITORSAMDPROC, GLsizei, n, GLptr, monitors)
}

glDeletePerfMonitorsAMD(n, monitors)
{
  global
  DllCall(PFNGLDELETEPERFMONITORSAMDPROC, GLsizei, n, GLptr, monitors)
}

glSelectPerfMonitorCountersAMD(monitor, enable, group, numCounters, counterList)
{
  global
  DllCall(PFNGLSELECTPERFMONITORCOUNTERSAMDPROC, GLuint, monitor, GLboolean, enable, GLuint, group, GLint, numCounters, GLptr, counterList)
}

glBeginPerfMonitorAMD(monitor)
{
  global
  DllCall(PFNGLBEGINPERFMONITORAMDPROC, GLuint, monitor)
}

glEndPerfMonitorAMD(monitor)
{
  global
  DllCall(PFNGLENDPERFMONITORAMDPROC, GLuint, monitor)
}

glGetPerfMonitorCounterDataAMD(monitor, pname, dataSize, data, bytesWritten)
{
  global
  DllCall(PFNGLGETPERFMONITORCOUNTERDATAAMDPROC, GLuint, monitor, GLenum, pname, GLsizei, dataSize, GLptr, data, GLptr, bytesWritten)
}


GL_AMD_texture_texture4 := 1
GL_AMD_vertex_shader_tesselator := 1

glTessellationFactorAMD(factor)
{
  global
  DllCall(PFNGLTESSELLATIONFACTORAMDPROC, GLfloat, factor)
}

glTessellationModeAMD(mode)
{
  global
  DllCall(PFNGLTESSELLATIONMODEAMDPROC, GLenum, mode)
}


GL_EXT_provoking_vertex := 1

glProvokingVertexEXT(mode)
{
  global
  DllCall(PFNGLPROVOKINGVERTEXEXTPROC, GLenum, mode)
}


GL_EXT_texture_snorm := 1
GL_AMD_draw_buffers_blend := 1

glBlendFuncIndexedAMD(buf, src, dst)
{
  global
  DllCall(PFNGLBLENDFUNCINDEXEDAMDPROC, GLuint, buf, GLenum, src, GLenum, dst)
}

glBlendFuncSeparateIndexedAMD(buf, srcRGB, dstRGB, srcAlpha, dstAlpha)
{
  global
  DllCall(PFNGLBLENDFUNCSEPARATEINDEXEDAMDPROC, GLuint, buf, GLenum, srcRGB, GLenum, dstRGB, GLenum, srcAlpha, GLenum, dstAlpha)
}

glBlendEquationIndexedAMD(buf, mode)
{
  global
  DllCall(PFNGLBLENDEQUATIONINDEXEDAMDPROC, GLuint, buf, GLenum, mode)
}

glBlendEquationSeparateIndexedAMD(buf, modeRGB, modeAlpha)
{
  global
  DllCall(PFNGLBLENDEQUATIONSEPARATEINDEXEDAMDPROC, GLuint, buf, GLenum, modeRGB, GLenum, modeAlpha)
}


GL_APPLE_texture_range := 1

glTextureRangeAPPLE(target, length, pointer)
{
  global
  DllCall(PFNGLTEXTURERANGEAPPLEPROC, GLenum, target, GLsizei, length, GLptr, pointer)
}

glGetTexParameterPointervAPPLE(target, pname, params)
{
  global
  DllCall(PFNGLGETTEXPARAMETERPOINTERVAPPLEPROC, GLenum, target, GLenum, pname, GLptr, params)
}


GL_APPLE_float_pixels := 1
GL_APPLE_vertex_program_evaluators := 1

glEnableVertexAttribAPPLE(index, pname)
{
  global
  DllCall(PFNGLENABLEVERTEXATTRIBAPPLEPROC, GLuint, index, GLenum, pname)
}

glDisableVertexAttribAPPLE(index, pname)
{
  global
  DllCall(PFNGLDISABLEVERTEXATTRIBAPPLEPROC, GLuint, index, GLenum, pname)
}

glIsVertexAttribEnabledAPPLE(index, pname)
{
  global
  return DllCall(PFNGLISVERTEATTRIBENABLEDAPPLEPROC, GLuint, index, GLenum, pname, GLboolean)
}

glMapVertexAttrib1dAPPLE(index, size, u1, u2, stride, order, points)
{
  global
  DllCall(PFNGLMAPVERTEXATTRIB1DAPPLEPROC, GLuint, index, GLuint, size, GLdouble, u1, GLdouble, u2, GLint, stride, GLint, order, GLptr, points)
}

glMapVertexAttrib1fAPPLE(index, size, u1, u2, stride, order, points)
{
  global
  DllCall(PFNGLMAPVERTEXATTRIB1FAPPLEPROC, GLuint, index, GLuint, size, GLfloat, u1, GLfloat, u2, GLint, stride, GLint, order, GLptr, points)
}

glMapVertexAttrib2dAPPLE(index, size, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
{
  global
  DllCall(PFNGLMAPVERTEXATTRIB2DAPPLEPROC, GLuint, index, GLuint, size, GLdouble, u1, GLdouble, u2, GLint, ustride, GLint, uorder, GLdouble, v1, GLdouble, v2, GLint, vstride, GLint, vorder, GLptr, points)
}

glMapVertexAttrib2fAPPLE(index, size, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points)
{
  global
  DllCall(PFNGLMAPVERTEXATTRIB2FAPPLEPROC, GLuint, index, GLuint, size, GLfloat, u1, GLfloat, u2, GLint, ustride, GLint, uorder, GLfloat, v1, GLfloat, v2, GLint, vstride, GLint, vorder, GLptr, points)
}


GL_APPLE_aux_depth_stencil := 1
GL_APPLE_object_purgeable := 1

glObjectPurgeableAPPLE(objectType, name, option)
{
  global
  return DllCall(PFNGLOBJECTPURGEABLEAPPLEPROC, GLenum, objectType, GLuint, name, GLenum, option, GLenum)
}

glObjectUnpurgeableAPPLE(objectType, name, option)
{
  global
  return DllCall(PFNGLOBJECTUNPURGEABLEAPPLEPROC, GLenum, objectType, GLuint, name, GLenum, option, GLenum)
}

glGetObjectParameterivAPPLE(objectType, name, pname, params)
{
  global
  DllCall(PFNGLGETOBJECTPARAMETERIVAPPLEPROC, GLenum, objectType, GLuint, name, GLenum, pname, GLptr, params)
}


GL_APPLE_row_bytes := 1
GL_APPLE_rgb_422 := 1
GL_NV_video_capture := 1

glBeginVideoCaptureNV(video_capture_slot)
{
  global
  DllCall(PFNGLBEGINVIDEOCAPTURENVPROC, GLuint, video_capture_slot)
}

glBindVideoCaptureStreamBufferNV(video_capture_slot, stream, frame_region, offset)
{
  global
  DllCall(PFNGLBINDVIDEOCAPTURESTREAMBUFFERNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, frame_region, GLintptrARB, offset)
}

glBindVideoCaptureStreamTextureNV(video_capture_slot, stream, frame_region, target, texture)
{
  global
  DllCall(PFNGLBINDVIDEOCAPTURESTREAMTEXTURENVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, frame_region, GLenum, target, GLuint, texture)
}

glEndVideoCaptureNV(video_capture_slot)
{
  global
  DllCall(PFNGLENDVIDEOCAPTURENVPROC, GLuint, video_capture_slot)
}

glGetVideoCaptureivNV(video_capture_slot, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOCAPTUREIVNVPROC, GLuint, video_capture_slot, GLenum, pname, GLptr, params)
}

glGetVideoCaptureStreamivNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOCAPTURESTREAMIVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}

glGetVideoCaptureStreamfvNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOCAPTURESTREAMFVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}

glGetVideoCaptureStreamdvNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLGETVIDEOCAPTURESTREAMDVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}

glVideCaptureNV(video_capture_slot, sequence_num, capture_time)
{
  global
  return DllCall(PFNGL  PROC, GLuint, video_capture_slot, GLptr, sequence_num, GLptr, capture_time, GLenum)
}

glVideoCaptureStreamParameterivNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLVIDEOCAPTURESTREAMPARAMETERIVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}

glVideoCaptureStreamParameterfvNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLVIDEOCAPTURESTREAMPARAMETERFVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}

glVideoCaptureStreamParameterdvNV(video_capture_slot, stream, pname, params)
{
  global
  DllCall(PFNGLVIDEOCAPTURESTREAMPARAMETERDVNVPROC, GLuint, video_capture_slot, GLuint, stream, GLenum, pname, GLptr, params)
}


GL_NV_copy_image := 1

glCopyImageSubDataNV(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, width, height, depth)
{
  global
  DllCall(PFNGLCOPYIMAGESUBDATANVPROC, GLuint, srcName, GLenum, srcTarget, GLint, srcLevel, GLint, srcX, GLint, srcY, GLint, srcZ, GLuint, dstName, GLenum, dstTarget, GLint, dstLevel, GLint, dstX, GLint, dstY, GLint, dstZ, GLsizei, width, GLsizei, height, GLsizei, depth)
}


GL_EXT_separate_shader_objects := 1

glUseShaderProgramEXT(type, program)
{
  global
  DllCall(PFNGLUSESHADERPROGRAMEXTPROC, GLenum, type, GLuint, program)
}

glActiveProgramEXT(program)
{
  global
  DllCall(PFNGLACTIVEPROGRAMEXTPROC, GLuint, program)
}

glCreateShaderProgramEXT(type, string)
{
  global
  return DllCall(PFNGLCREATESHADERPROGRAMEXTPROC, GLenum, type, GLastr, string, GLuint)
}

GL_NV_parameter_buffer_object2 := 1
GL_NV_shader_buffer_load := 1

glMakeBufferResidentNV(target, access)
{
  global
  DllCall(PFNGLMAKEBUFFERRESIDENTNVPROC, GLenum, target, GLenum, access)
}

glMakeBufferNonResidentNV(target)
{
  global
  DllCall(PFNGLMAKEBUFFERNONRESIDENTNVPROC, GLenum, target)
}

glIsBufferResidentNV(target)
{
  global
  return DllCall(PFNGLISBUFFERRESIDENTNVPROC, GLenum, target, GLboolean)
}

glMakeNamedBufferResidentNV(buffer, access)
{
  global
  DllCall(PFNGLMAKENAMEDBUFFERRESIDENTNVPROC, GLuint, buffer, GLenum, access)
}

glMakeNamedBufferNonResidentNV(buffer)
{
  global
  DllCall(PFNGLMAKENAMEDBUFFERNONRESIDENTNVPROC, GLuint, buffer)
}

glIsNamedBufferResidentNV(buffer)
{
  global
  return DllCall(PFNGLISNAMEDBUFFERRESIDENTNVPROC, GLuint, buffer, GLboolean)
}

glGetBufferParameterui64vNV(target, pname, params)
{
  global
  DllCall(PFNGLGETBUFFERPARAMETERUI64VNVPROC, GLenum, target, GLenum, pname, GLptr, params)
}

glGetNamedBufferParameterui64vNV(buffer, pname, params)
{
  global
  DllCall(PFNGLGETNAMEDBUFFERPARAMETERUI64VNVPROC, GLuint, buffer, GLenum, pname, GLptr, params)
}

glGetIntegerui64vNV(value, result)
{
  global
  DllCall(PFNGLGETINTEGERUI64VNVPROC, GLenum, value, GLptr, result)
}

glUniformui64NV(location, value)
{
  global
  DllCall(PFNGLUNIFORMUI64NVPROC, GLint, location, GLuint64EXT, value)
}

glUniformui64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORMUI64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glGetUniformui64vNV(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMUI64VNVPROC, GLuint, program, GLint, location, GLptr, params)
}

glProgramUniformui64NV(program, location, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMUI64NVPROC, GLuint, program, GLint, location, GLuint64EXT, value)
}

glProgramUniformui64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORMUI64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}


GL_NV_vertex_buffer_unified_memory := 1

glBufferAddressRangeNV(pname, index, address, length)
{
  global
  DllCall(PFNGLBUFFERADDRESSRANGENVPROC, GLenum, pname, GLuint, index, GLuint64EXT, address, GLsizeiptr, length)
}

glVertexFormatNV(size, type, stride)
{
  global
  DllCall(PFNGLVERTEXFORMATNVPROC, GLint, size, GLenum, type, GLsizei, stride)
}

glNormalFormatNV(type, stride)
{
  global
  DllCall(PFNGLNORMALFORMATNVPROC, GLenum, type, GLsizei, stride)
}

glColorFormatNV(size, type, stride)
{
  global
  DllCall(PFNGLCOLORFORMATNVPROC, GLint, size, GLenum, type, GLsizei, stride)
}

glIndexFormatNV(type, stride)
{
  global
  DllCall(PFNGLINDEXFORMATNVPROC, GLenum, type, GLsizei, stride)
}

glTexCoordFormatNV(size, type, stride)
{
  global
  DllCall(PFNGLTEXCOORDFORMATNVPROC, GLint, size, GLenum, type, GLsizei, stride)
}

glEdgeFlagFormatNV(stride)
{
  global
  DllCall(PFNGLEDGEFLAGFORMATNVPROC, GLsizei, stride)
}

glSecondaryColorFormatNV(size, type, stride)
{
  global
  DllCall(PFNGLSECONDARYCOLORFORMATNVPROC, GLint, size, GLenum, type, GLsizei, stride)
}

glFogCoordFormatNV(type, stride)
{
  global
  DllCall(PFNGLFOGCOORDFORMATNVPROC, GLenum, type, GLsizei, stride)
}

glVertexAttribFormatNV(index, size, type, normalized, stride)
{
  global
  DllCall(PFNGLVERTEXATTRIBFORMATNVPROC, GLuint, index, GLint, size, GLenum, type, GLboolean, normalized, GLsizei, stride)
}

glVertexAttribIFormatNV(index, size, type, stride)
{
  global
  DllCall(PFNGLVERTEXATTRIBIFORMATNVPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride)
}

glGetIntegerui64i_vNV(value, index, result)
{
  global
  DllCall(PFNGLGETINTEGERUI64I_VNVPROC, GLenum, value, GLuint, index, GLptr, result)
}


GL_NV_texture_barrier := 1

glTextureBarrierNV()
{
  global
  DllCall(PFNGLTEXTUREBARRIERNVPROC)
}


GL_AMD_shader_stencil_export := 1
GL_AMD_seamless_cubemap_per_texture := 1
GL_AMD_conservative_depth := 1
GL_EXT_shader_image_load_store := 1

glBindImageTextureEXT(index, texture, level, layered, layer, access, format)
{
  global
  DllCall(PFNGLBINDIMAGETEXTUREEXTPROC, GLuint, index, GLuint, texture, GLint, level, GLboolean, layered, GLint, layer, GLenum, access, GLint, format)
}

glMemoryBarrierEXT(barriers)
{
  global
  DllCall(PFNGLMEMORYBARRIEREXTPROC, GLbitfield, barriers)
}


GL_EXT_vertex_attrib_64bit := 1

glVertexAttribL1dEXT(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1DEXTPROC, GLuint, index, GLdouble, x)
}

glVertexAttribL2dEXT(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2DEXTPROC, GLuint, index, GLdouble, x, GLdouble, y)
}

glVertexAttribL3dEXT(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3DEXTPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z)
}

glVertexAttribL4dEXT(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4DEXTPROC, GLuint, index, GLdouble, x, GLdouble, y, GLdouble, z, GLdouble, w)
}

glVertexAttribL1dvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1DVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribL2dvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2DVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribL3dvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3DVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribL4dvEXT(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4DVEXTPROC, GLuint, index, GLptr, v)
}

glVertexAttribLPointerEXT(index, size, type, stride, pointer)
{
  global
  DllCall(PFNGLVERTEXATTRIBLPOINTEREXTPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride, GLptr, pointer)
}

glGetVertexAttribLdvEXT(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBLDVEXTPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glVertexArrayVertexAttribLOffsetEXT(vaobj, buffer, index, size, type, stride, offset)
{
  global
  DllCall(PFNGLVERTEXARRAYVERTEXATTRIBLOFFSETEXTPROC, GLuint, vaobj, GLuint, buffer, GLuint, index, GLint, size, GLenum, type, GLsizei, stride, GLintptr, offset)
}


GL_NV_gpu_program5 := 1

glProgramSubroutineParametersuivNV(target, count, params)
{
  global
  DllCall(PFNGLPROGRAMSUBROUTINEPARAMETERSUIVNVPROC, GLenum, target, GLsizei, count, GLptr, params)
}

glGetProgramSubroutineParameteruivNV(target, index, param)
{
  global
  DllCall(PFNGLGETPROGRAMSUBROUTINEPARAMETERUIVNVPROC, GLenum, target, GLuint, index, GLptr, param)
}


GL_NV_gpu_shader5 := 1

glUniform1i64NV(location, x)
{
  global
  DllCall(PFNGLUNIFORM1I64NVPROC, GLint, location, GLint64EXT, x)
}

glUniform2i64NV(location, x, y)
{
  global
  DllCall(PFNGLUNIFORM2I64NVPROC, GLint, location, GLint64EXT, x, GLint64EXT, y)
}

glUniform3i64NV(location, x, y, z)
{
  global
  DllCall(PFNGLUNIFORM3I64NVPROC, GLint, location, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z)
}

glUniform4i64NV(location, x, y, z, w)
{
  global
  DllCall(PFNGLUNIFORM4I64NVPROC, GLint, location, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z, GLint64EXT, w)
}

glUniform1i64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1I64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2i64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2I64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3i64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3I64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4i64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4I64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform1ui64NV(location, x)
{
  global
  DllCall(PFNGLUNIFORM1UI64NVPROC, GLint, location, GLuint64EXT, x)
}

glUniform2ui64NV(location, x, y)
{
  global
  DllCall(PFNGLUNIFORM2UI64NVPROC, GLint, location, GLuint64EXT, x, GLuint64EXT, y)
}

glUniform3ui64NV(location, x, y, z)
{
  global
  DllCall(PFNGLUNIFORM3UI64NVPROC, GLint, location, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z)
}

glUniform4ui64NV(location, x, y, z, w)
{
  global
  DllCall(PFNGLUNIFORM4UI64NVPROC, GLint, location, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z, GLuint64EXT, w)
}

glUniform1ui64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM1UI64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform2ui64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM2UI64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform3ui64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM3UI64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glUniform4ui64vNV(location, count, value)
{
  global
  DllCall(PFNGLUNIFORM4UI64VNVPROC, GLint, location, GLsizei, count, GLptr, value)
}

glGetUniformi64vNV(program, location, params)
{
  global
  DllCall(PFNGLGETUNIFORMI64VNVPROC, GLuint, program, GLint, location, GLptr, params)
}

glProgramUniform1i64NV(program, location, x)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1I64NVPROC, GLuint, program, GLint, location, GLint64EXT, x)
}

glProgramUniform2i64NV(program, location, x, y)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2I64NVPROC, GLuint, program, GLint, location, GLint64EXT, x, GLint64EXT, y)
}

glProgramUniform3i64NV(program, location, x, y, z)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3I64NVPROC, GLuint, program, GLint, location, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z)
}

glProgramUniform4i64NV(program, location, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4I64NVPROC, GLuint, program, GLint, location, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z, GLint64EXT, w)
}

glProgramUniform1i64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1I64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2i64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2I64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3i64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3I64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4i64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4I64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform1ui64NV(program, location, x)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UI64NVPROC, GLuint, program, GLint, location, GLuint64EXT, x)
}

glProgramUniform2ui64NV(program, location, x, y)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UI64NVPROC, GLuint, program, GLint, location, GLuint64EXT, x, GLuint64EXT, y)
}

glProgramUniform3ui64NV(program, location, x, y, z)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UI64NVPROC, GLuint, program, GLint, location, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z)
}

glProgramUniform4ui64NV(program, location, x, y, z, w)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UI64NVPROC, GLuint, program, GLint, location, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z, GLuint64EXT, w)
}

glProgramUniform1ui64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM1UI64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform2ui64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM2UI64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform3ui64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM3UI64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}

glProgramUniform4ui64vNV(program, location, count, value)
{
  global
  DllCall(PFNGLPROGRAMUNIFORM4UI64VNVPROC, GLuint, program, GLint, location, GLsizei, count, GLptr, value)
}


GL_NV_vertex_attrib_integer_64bit := 1

glVertexAttribL1i64NV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1I64NVPROC, GLuint, index, GLint64EXT, x)
}

glVertexAttribL2i64NV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2I64NVPROC, GLuint, index, GLint64EXT, x, GLint64EXT, y)
}

glVertexAttribL3i64NV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3I64NVPROC, GLuint, index, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z)
}

glVertexAttribL4i64NV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4I64NVPROC, GLuint, index, GLint64EXT, x, GLint64EXT, y, GLint64EXT, z, GLint64EXT, w)
}

glVertexAttribL1i64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1I64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL2i64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2I64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL3i64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3I64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL4i64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4I64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL1ui64NV(index, x)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1UI64NVPROC, GLuint, index, GLuint64EXT, x)
}

glVertexAttribL2ui64NV(index, x, y)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2UI64NVPROC, GLuint, index, GLuint64EXT, x, GLuint64EXT, y)
}

glVertexAttribL3ui64NV(index, x, y, z)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3UI64NVPROC, GLuint, index, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z)
}

glVertexAttribL4ui64NV(index, x, y, z, w)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4UI64NVPROC, GLuint, index, GLuint64EXT, x, GLuint64EXT, y, GLuint64EXT, z, GLuint64EXT, w)
}

glVertexAttribL1ui64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL1UI64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL2ui64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL2UI64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL3ui64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL3UI64VNVPROC, GLuint, index, GLptr, v)
}

glVertexAttribL4ui64vNV(index, v)
{
  global
  DllCall(PFNGLVERTEXATTRIBL4UI64VNVPROC, GLuint, index, GLptr, v)
}

glGetVertexAttribLi64vNV(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBLI64VNVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glGetVertexAttribLui64vNV(index, pname, params)
{
  global
  DllCall(PFNGLGETVERTEXATTRIBLUI64VNVPROC, GLuint, index, GLenum, pname, GLptr, params)
}

glVertexAttribLFormatNV(index, size, type, stride)
{
  global
  DllCall(PFNGLVERTEXATTRIBLFORMATNVPROC, GLuint, index, GLint, size, GLenum, type, GLsizei, stride)
}


GL_NV_multisample_coverage := 1
GL_AMD_name_gen_delete := 1

glGenNamesAMD(identifier, num, names)
{
  global
  DllCall(PFNGLGENNAMESAMDPROC, GLenum, identifier, GLuint, num, GLptr, names)
}

glDeleteNamesAMD(identifier, num, names)
{
  global
  DllCall(PFNGLDELETENAMESAMDPROC, GLenum, identifier, GLuint, num, GLptr, names)
}

glIsNameAMD(identifier, name)
{
  global
  return DllCall(PFNGLGLISNAMEAMDPROC, GLenum, identifier, GLuint, name, GLboolean)
}

GL_AMD_debug_output := 1

glDebugMessageEnableAMD(category, severity, count, ids, enabled)
{
  global
  DllCall(PFNGLDEBUGMESSAGEENABLEAMDPROC, GLenum, category, GLenum, severity, GLsizei, count, GLptr, ids, GLboolean, enabled)
}

glDebugMessageInsertAMD(category, severity, id, length, buf)
{
  global
  DllCall(PFNGLDEBUGMESSAGEINSERTAMDPROC, GLenum, category, GLenum, severity, GLuint, id, GLsizei, length, GLptr, buf)
}

glDebugMessageCallbackAMD(callback, userParam)
{
  global
  DllCall(PFNGLDEBUGMESSAGECALLBACKAMDPROC, GLptr, callback, GLptr, userParam)
}

glGetDebugMessageLogAMD(count, bufsize, categories, severities, ids, lengths, message)
{
  global
  return DllCall(PFNGLGETDEBUGMESSAGELOGAMDPROC, GLuint, count, GLsizei, bufsize, GLptr, categories, GLptr, severities, GLptr, ids, GLptr, lengths, GLptr, message, GLuint)
}

GL_NV_vdpau_interop := 1

glVDPAUInitNV(vdpDevice, getProcAddress)
{
  global
  DllCall(PFNGLVDPAUINITNVPROC, GLptr, vdpDevice, GLptr, getProcAddress)
}

glVDPAUFiniNV()
{
  global
  DllCall(PFNGLVDPAUFININVPROC)
}

glVDPAURegisterVideoSurfaceNV(vdpSurface, target, numTextureNames, textureNames)
{
  global
  return DllCall(PFNGLVDPAUREGISTERVIDEOSURFACENV, GLptr, vdpSurface, GLenum, target, GLsizei, numTextureNames, GLptr, textureNames, GLvdpauSurfaceNV)
}

glVDPAURegisterOutputSurfaceNV(vdpSurface, target, numTextureNames, textureNames)
{
  global
  return DllCall(PFNGLVDPAUREGISTEROUTPUTSURFACENV, GLptr, vdpSurface, GLenum, target, GLsizei, numTextureNames, GLptr, textureNames, GLvdpauSurfaceNV)
}

glVDPAUIsSurfaceNV(surface)
{
  global
  DllCall(PFNGLVDPAUISSURFACENVPROC, GLvdpauSurfaceNV, surface)
}

glVDPAUUnregisterSurfaceNV(surface)
{
  global
  DllCall(PFNGLVDPAUUNREGISTERSURFACENVPROC, GLvdpauSurfaceNV, surface)
}

glVDPAUGetSurfaceivNV(surface, pname, bufSize, length, values)
{
  global
  DllCall(PFNGLVDPAUGETSURFACEIVNVPROC, GLvdpauSurfaceNV, surface, GLenum, pname, GLsizei, bufSize, GLptr, length, GLptr, values)
}

glVDPAUSurfaceAccessNV(surface, access)
{
  global
  DllCall(PFNGLVDPAUSURFACEACCESSNVPROC, GLvdpauSurfaceNV, surface, GLenum, access)
}

glVDPAUMapSurfacesNV(numSurfaces, surfaces)
{
  global
  DllCall(PFNGLVDPAUMAPSURFACESNVPROC, GLsizei, numSurfaces, GLptr, surfaces)
}

glVDPAUUnmapSurfacesNV(numSurface, surfaces)
{
  global
  DllCall(PFNGLVDPAUUNMAPSURFACESNVPROC, GLsizei, numSurface, GLptr, surfaces)
}


GL_AMD_transform_feedback3_lines_triangles := 1
GL_AMD_depth_clamp_separate := 1
GL_EXT_texture_sRGB_decode := 1

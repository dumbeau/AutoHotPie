#Persistent
#SingleInstance ignore
#Include %A_ScriptDir%\Resources\GDIp_All.ahk
#Include %A_ScriptDir%\Resources\GDIpHelper.ahk
#InstallMouseHook
CoordMode, Mouse, Screen


Min(x,x1="",x2="",x3="",x4="",x5="",x6="",x7="",x8="",x9="") {
   Loop
      IfEqual x%A_Index%,, Return x
      Else x := x < x%A_Index% ? x : x%A_Index%
}

Max(x,x1="",x2="",x3="",x4="",x5="",x6="",x7="",x8="",x9="") {
   Loop
      IfEqual x%A_Index%,, Return x
      Else x := x > x%A_Index% ? x : x%A_Index%
}


Sysget, Mon1, Monitor, 1
Sysget, Mon2, Monitor, 2
Sysget, Mon3, Monitor, 3
Sysget, Mon4, Monitor, 4
Sysget, Mon5, Monitor, 5
Sysget, Mon6, Monitor, 6
	
; BitmapScreenLeft := Min(Mon1Left, Mon2Left, Mon3Left, Mon4Left, Mon5Left, Mon6Left)
; BitmapScreenTop := Min(Mon1Top, Mon2Top, Mon3Top, Mon4Top, Mon5Top, Mon6Top)
BitmapScreenRight := Max(Mon1Right, Mon2Right, Mon3Right, Mon4Right, Mon5Right, Mon6Right)
BitmapScreenBottom := Max(Mon1Bottom, Mon2Bottom, Mon3Bottom, Mon4Bottom, Mon5Bottom, Mon6Bottom)

; msgbox, %BitmapScreenLeft% %BitmapScreenTop% %BitmapScreenRight% %BitmapScreenBottom%




; MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.	
	
;---------------------------
;PIE MENU Settings
;---------------------------


FileReadLine, anull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,19
FileReadLine, anull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,20
FileReadLine, anull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,21
FileReadLine, a1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,22
FileReadLine, a1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,23
FileReadLine, a1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,24
FileReadLine, a2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,25
FileReadLine, a2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,26
FileReadLine, a2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,27
FileReadLine, a3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,28
FileReadLine, a3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,29
FileReadLine, a3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,30
FileReadLine, a4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,31
FileReadLine, a4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,32
FileReadLine, a4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,33
FileReadLine, a5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,34
FileReadLine, a5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,35
FileReadLine, a5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,36
FileReadLine, a6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,37
FileReadLine, a6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,38
FileReadLine, a6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,39
FileReadLine, aPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,40
FileReadLine, bnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,41
FileReadLine, bnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,42
FileReadLine, bnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,43
FileReadLine, b1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,44
FileReadLine, b1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,45
FileReadLine, b1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,46
FileReadLine, b2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,47
FileReadLine, b2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,48
FileReadLine, b2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,49
FileReadLine, b3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,50
FileReadLine, b3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,51
FileReadLine, b3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,52
FileReadLine, b4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,53
FileReadLine, b4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,54
FileReadLine, b4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,55
FileReadLine, b5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,56
FileReadLine, b5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,57
FileReadLine, b5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,58
FileReadLine, b6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,59
FileReadLine, b6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,60
FileReadLine, b6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,61
FileReadLine, bPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,62
FileReadLine, cnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,63
FileReadLine, cnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,64
FileReadLine, cnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,65
FileReadLine, c1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,66
FileReadLine, c1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,67
FileReadLine, c1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,68
FileReadLine, c2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,69
FileReadLine, c2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,70
FileReadLine, c2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,71
FileReadLine, c3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,72
FileReadLine, c3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,73
FileReadLine, c3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,74
FileReadLine, c4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,75
FileReadLine, c4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,76
FileReadLine, c4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,77
FileReadLine, c5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,78
FileReadLine, c5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,79
FileReadLine, c5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,80
FileReadLine, c6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,81
FileReadLine, c6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,82
FileReadLine, c6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,83
FileReadLine, cPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,84 
FileReadLine, dnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,85
FileReadLine, dnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,86
FileReadLine, dnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,87
FileReadLine, d1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,88
FileReadLine, d1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,89
FileReadLine, d1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,90
FileReadLine, d2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,91
FileReadLine, d2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,92
FileReadLine, d2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,93
FileReadLine, d3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,94
FileReadLine, d3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,95
FileReadLine, d3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,96
FileReadLine, d4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,97
FileReadLine, d4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,98
FileReadLine, d4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,99
FileReadLine, d5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,100
FileReadLine, d5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,101
FileReadLine, d5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,102
FileReadLine, d6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,103
FileReadLine, d6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,104
FileReadLine, d6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,105
FileReadLine, dPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,106 
FileReadLine, enull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,107
FileReadLine, enull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,108
FileReadLine, enull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,109
FileReadLine, e1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,110
FileReadLine, e1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,111
FileReadLine, e1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,112
FileReadLine, e2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,113
FileReadLine, e2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,114
FileReadLine, e2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,115
FileReadLine, e3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,116
FileReadLine, e3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,117
FileReadLine, e3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,118
FileReadLine, e4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,119
FileReadLine, e4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,120
FileReadLine, e4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,121
FileReadLine, e5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,122
FileReadLine, e5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,123
FileReadLine, e5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,124
FileReadLine, e6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,125
FileReadLine, e6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,126
FileReadLine, e6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,127
FileReadLine, ePieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,128 
FileReadLine, fnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,129
FileReadLine, fnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,130
FileReadLine, fnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,131
FileReadLine, f1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,132
FileReadLine, f1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,133
FileReadLine, f1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,134
FileReadLine, f2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,135
FileReadLine, f2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,136
FileReadLine, f2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,137
FileReadLine, f3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,138
FileReadLine, f3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,139
FileReadLine, f3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,140
FileReadLine, f4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,141
FileReadLine, f4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,142
FileReadLine, f4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,143
FileReadLine, f5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,144
FileReadLine, f5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,145
FileReadLine, f5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,146
FileReadLine, f6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,147
FileReadLine, f6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,148
FileReadLine, f6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,149
FileReadLine, fPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,150 
FileReadLine, gnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,151
FileReadLine, gnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,152
FileReadLine, gnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,153
FileReadLine, g1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,154
FileReadLine, g1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,155
FileReadLine, g1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,156
FileReadLine, g2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,157
FileReadLine, g2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,158
FileReadLine, g2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,159
FileReadLine, g3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,160
FileReadLine, g3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,161
FileReadLine, g3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,162
FileReadLine, g4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,163
FileReadLine, g4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,164
FileReadLine, g4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,165
FileReadLine, g5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,166
FileReadLine, g5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,167
FileReadLine, g5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,168
FileReadLine, g6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,169
FileReadLine, g6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,170
FileReadLine, g6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,171
FileReadLine, gPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,172 
FileReadLine, hnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,173
FileReadLine, hnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,174
FileReadLine, hnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,175
FileReadLine, h1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,176
FileReadLine, h1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,177
FileReadLine, h1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,178
FileReadLine, h2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,179
FileReadLine, h2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,180
FileReadLine, h2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,181
FileReadLine, h3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,182
FileReadLine, h3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,183
FileReadLine, h3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,184
FileReadLine, h4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,185
FileReadLine, h4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,186
FileReadLine, h4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,187
FileReadLine, h5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,188
FileReadLine, h5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,189
FileReadLine, h5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,190
FileReadLine, h6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,191
FileReadLine, h6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,192
FileReadLine, h6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,193
FileReadLine, hPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,194 
FileReadLine, inull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,195
FileReadLine, inull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,196
FileReadLine, inull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,197
FileReadLine, i1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,198
FileReadLine, i1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,199
FileReadLine, i1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,200
FileReadLine, i2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,201
FileReadLine, i2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,202
FileReadLine, i2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,203
FileReadLine, i3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,204
FileReadLine, i3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,205
FileReadLine, i3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,206
FileReadLine, i4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,207
FileReadLine, i4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,208
FileReadLine, i4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,209
FileReadLine, i5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,210
FileReadLine, i5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,211
FileReadLine, i5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,212
FileReadLine, i6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,213
FileReadLine, i6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,214
FileReadLine, i6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,215
FileReadLine, iPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,216 
FileReadLine, jnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,217
FileReadLine, jnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,218
FileReadLine, jnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,219
FileReadLine, j1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,220
FileReadLine, j1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,221
FileReadLine, j1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,222
FileReadLine, j2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,223
FileReadLine, j2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,224
FileReadLine, j2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,225
FileReadLine, j3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,226
FileReadLine, j3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,227
FileReadLine, j3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,228
FileReadLine, j4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,229
FileReadLine, j4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,230
FileReadLine, j4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,231
FileReadLine, j5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,232
FileReadLine, j5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,233
FileReadLine, j5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,234
FileReadLine, j6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,235
FileReadLine, j6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,236
FileReadLine, j6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,237
FileReadLine, jPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,238 
FileReadLine, knull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,239
FileReadLine, knull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,240
FileReadLine, knull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,241
FileReadLine, k1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,242
FileReadLine, k1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,243
FileReadLine, k1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,244
FileReadLine, k2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,245
FileReadLine, k2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,246
FileReadLine, k2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,247
FileReadLine, k3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,248
FileReadLine, k3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,249
FileReadLine, k3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,250
FileReadLine, k4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,251
FileReadLine, k4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,252
FileReadLine, k4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,253
FileReadLine, k5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,254
FileReadLine, k5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,255
FileReadLine, k5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,256
FileReadLine, k6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,257
FileReadLine, k6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,258
FileReadLine, k6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,259
FileReadLine, kPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,260 
FileReadLine, lnull_Label          ,%A_ScriptDir%\Resources\settingsfile.txt,261
FileReadLine, lnull_OverrideLabel  ,%A_ScriptDir%\Resources\settingsfile.txt,262
FileReadLine, lnull_SendKeystroke  ,%A_ScriptDir%\Resources\settingsfile.txt,263
FileReadLine, l1_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,264
FileReadLine, l1_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,265
FileReadLine, l1_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,266
FileReadLine, l2_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,267
FileReadLine, l2_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,268
FileReadLine, l2_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,269
FileReadLine, l3_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,270
FileReadLine, l3_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,271
FileReadLine, l3_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,272
FileReadLine, l4_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,273
FileReadLine, l4_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,274
FileReadLine, l4_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,275
FileReadLine, l5_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,276
FileReadLine, l5_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,277
FileReadLine, l5_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,278
FileReadLine, l6_Label             ,%A_ScriptDir%\Resources\settingsfile.txt,279
FileReadLine, l6_OverrideLabel     ,%A_ScriptDir%\Resources\settingsfile.txt,280
FileReadLine, l6_SendKeystroke     ,%A_ScriptDir%\Resources\settingsfile.txt,281
FileReadLine, lPieHotkey_Input     ,%A_ScriptDir%\Resources\settingsfile.txt,282 


FileReadLine, anull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,283
FileReadLine,    a1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,284
FileReadLine,    a2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,285
FileReadLine,    a3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,286
FileReadLine,    a4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,287
FileReadLine,    a5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,288
FileReadLine,    a6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,289
FileReadLine, bnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,290
FileReadLine,    b1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,291
FileReadLine,    b2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,292
FileReadLine,    b3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,293
FileReadLine,    b4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,294
FileReadLine,    b5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,295
FileReadLine,    b6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,296
FileReadLine, cnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,297
FileReadLine,    c1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,298
FileReadLine,    c2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,299
FileReadLine,    c3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,300
FileReadLine,    c4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,301
FileReadLine,    c5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,302
FileReadLine,    c6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,303
FileReadLine, dnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,304
FileReadLine,    d1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,305
FileReadLine,    d2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,306
FileReadLine,    d3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,307
FileReadLine,    d4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,308
FileReadLine,    d5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,309
FileReadLine,    d6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,310
FileReadLine, enull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,311
FileReadLine,    e1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,312
FileReadLine,    e2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,313
FileReadLine,    e3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,314
FileReadLine,    e4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,315
FileReadLine,    e5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,316
FileReadLine,    e6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,317
FileReadLine, fnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,318
FileReadLine,    f1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,319
FileReadLine,    f2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,320
FileReadLine,    f3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,321
FileReadLine,    f4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,322
FileReadLine,    f5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,323
FileReadLine,    f6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,324
FileReadLine, gnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,325
FileReadLine,    g1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,326
FileReadLine,    g2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,327
FileReadLine,    g3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,328
FileReadLine,    g4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,329
FileReadLine,    g5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,330
FileReadLine,    g6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,331
FileReadLine, hnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,332
FileReadLine,    h1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,333
FileReadLine,    h2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,334
FileReadLine,    h3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,335
FileReadLine,    h4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,336
FileReadLine,    h5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,337
FileReadLine,    h6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,338
FileReadLine, inull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,339
FileReadLine,    i1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,340
FileReadLine,    i2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,341
FileReadLine,    i3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,342
FileReadLine,    i4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,343
FileReadLine,    i5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,344
FileReadLine,    i6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,345
FileReadLine, jnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,346
FileReadLine,    j1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,347
FileReadLine,    j2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,348
FileReadLine,    j3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,349
FileReadLine,    j4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,350
FileReadLine,    j5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,351
FileReadLine,    j6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,352
FileReadLine, knull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,353
FileReadLine,    k1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,354
FileReadLine,    k2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,355
FileReadLine,    k3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,356
FileReadLine,    k4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,357
FileReadLine,    k5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,358
FileReadLine,    k6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,359
FileReadLine, lnull_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,360
FileReadLine,    l1_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,361
FileReadLine,    l2_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,362
FileReadLine,    l3_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,363
FileReadLine,    l4_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,364
FileReadLine,    l5_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,365
FileReadLine,    l6_ExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,366

FileReadLine, anull_Label          ,%A_ScriptDir%\Resources\Functions.txt, anull_Label
anull_Label := StrSplit(anull_Label, ":")
anull_Label := SubStr(anull_Label[1], 3)
FileReadLine, a1_Label          ,%A_ScriptDir%\Resources\Functions.txt, a1_Label
a1_Label := StrSplit(a1_Label, ":")
a1_Label := SubStr(a1_Label[1], 3)
FileReadLine, a2_Label          ,%A_ScriptDir%\Resources\Functions.txt, a2_Label
a2_Label := StrSplit(a2_Label, ":")
a2_Label := SubStr(a2_Label[1], 3)
FileReadLine, a3_Label          ,%A_ScriptDir%\Resources\Functions.txt, a3_Label
a3_Label := StrSplit(a3_Label, ":")
a3_Label := SubStr(a3_Label[1], 3)
FileReadLine, a4_Label          ,%A_ScriptDir%\Resources\Functions.txt, a4_Label
a4_Label := StrSplit(a4_Label, ":")
a4_Label := SubStr(a4_Label[1], 3)
FileReadLine, a5_Label          ,%A_ScriptDir%\Resources\Functions.txt, a5_Label
a5_Label := StrSplit(a5_Label, ":")
a5_Label := SubStr(a5_Label[1], 3)
FileReadLine, a6_Label          ,%A_ScriptDir%\Resources\Functions.txt, a6_Label
a6_Label := StrSplit(a6_Label, ":")
a6_Label := SubStr(a6_Label[1], 3)

FileReadLine, bnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, bnull_Label
bnull_Label := StrSplit(bnull_Label, ":")
bnull_Label := SubStr(bnull_Label[1], 3)
FileReadLine, b1_Label          ,%A_ScriptDir%\Resources\Functions.txt, b1_Label
b1_Label := StrSplit(b1_Label, ":")
b1_Label := SubStr(b1_Label[1], 3)
FileReadLine, b2_Label          ,%A_ScriptDir%\Resources\Functions.txt, b2_Label
b2_Label := StrSplit(b2_Label, ":")
b2_Label := SubStr(b2_Label[1], 3)
FileReadLine, b3_Label          ,%A_ScriptDir%\Resources\Functions.txt, b3_Label
b3_Label := StrSplit(b3_Label, ":")
b3_Label := SubStr(b3_Label[1], 3)
FileReadLine, b4_Label          ,%A_ScriptDir%\Resources\Functions.txt, b4_Label
b4_Label := StrSplit(b4_Label, ":")
b4_Label := SubStr(b4_Label[1], 3)
FileReadLine, b5_Label          ,%A_ScriptDir%\Resources\Functions.txt, b5_Label
b5_Label := StrSplit(b5_Label, ":")
b5_Label := SubStr(b5_Label[1], 3)
FileReadLine, b6_Label          ,%A_ScriptDir%\Resources\Functions.txt, b6_Label
b6_Label := StrSplit(b6_Label, ":")
b6_Label := SubStr(b6_Label[1], 3)

FileReadLine, cnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, cnull_Label
cnull_Label := StrSplit(cnull_Label, ":")
cnull_Label := SubStr(cnull_Label[1], 3)
FileReadLine, c1_Label          ,%A_ScriptDir%\Resources\Functions.txt, c1_Label
c1_Label := StrSplit(c1_Label, ":")
c1_Label := SubStr(c1_Label[1], 3)
FileReadLine, c2_Label          ,%A_ScriptDir%\Resources\Functions.txt, c2_Label
c2_Label := StrSplit(c2_Label, ":")
c2_Label := SubStr(c2_Label[1], 3)
FileReadLine, c3_Label          ,%A_ScriptDir%\Resources\Functions.txt, c3_Label
c3_Label := StrSplit(c3_Label, ":")
c3_Label := SubStr(c3_Label[1], 3)
FileReadLine, c4_Label          ,%A_ScriptDir%\Resources\Functions.txt, c4_Label
c4_Label := StrSplit(c4_Label, ":")
c4_Label := SubStr(c4_Label[1], 3)
FileReadLine, c5_Label          ,%A_ScriptDir%\Resources\Functions.txt, c5_Label
c5_Label := StrSplit(c5_Label, ":")
c5_Label := SubStr(c5_Label[1], 3)
FileReadLine, c6_Label          ,%A_ScriptDir%\Resources\Functions.txt, c6_Label
c6_Label := StrSplit(c6_Label, ":")
c6_Label := SubStr(c6_Label[1], 3)

FileReadLine, dnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, dnull_Label
dnull_Label := StrSplit(dnull_Label, ":")
dnull_Label := SubStr(dnull_Label[1], 3)
FileReadLine, d1_Label          ,%A_ScriptDir%\Resources\Functions.txt, d1_Label
d1_Label := StrSplit(d1_Label, ":")
d1_Label := SubStr(d1_Label[1], 3)
FileReadLine, d2_Label          ,%A_ScriptDir%\Resources\Functions.txt, d2_Label
d2_Label := StrSplit(d2_Label, ":")
d2_Label := SubStr(d2_Label[1], 3)
FileReadLine, d3_Label          ,%A_ScriptDir%\Resources\Functions.txt, d3_Label
d3_Label := StrSplit(d3_Label, ":")
d3_Label := SubStr(d3_Label[1], 3)
FileReadLine, d4_Label          ,%A_ScriptDir%\Resources\Functions.txt, d4_Label
d4_Label := StrSplit(d4_Label, ":")
d4_Label := SubStr(d4_Label[1], 3)
FileReadLine, d5_Label          ,%A_ScriptDir%\Resources\Functions.txt, d5_Label
d5_Label := StrSplit(d5_Label, ":")
d5_Label := SubStr(d5_Label[1], 3)
FileReadLine, d6_Label          ,%A_ScriptDir%\Resources\Functions.txt, d6_Label
d6_Label := StrSplit(d6_Label, ":")
d6_Label := SubStr(d6_Label[1], 3)

FileReadLine, enull_Label          ,%A_ScriptDir%\Resources\Functions.txt, enull_Label
enull_Label := StrSplit(enull_Label, ":")
enull_Label := SubStr(enull_Label[1], 3)
FileReadLine, e1_Label          ,%A_ScriptDir%\Resources\Functions.txt, e1_Label
e1_Label := StrSplit(e1_Label, ":")
e1_Label := SubStr(e1_Label[1], 3)
FileReadLine, e2_Label          ,%A_ScriptDir%\Resources\Functions.txt, e2_Label
e2_Label := StrSplit(e2_Label, ":")
e2_Label := SubStr(e2_Label[1], 3)
FileReadLine, e3_Label          ,%A_ScriptDir%\Resources\Functions.txt, e3_Label
e3_Label := StrSplit(e3_Label, ":")
e3_Label := SubStr(e3_Label[1], 3)
FileReadLine, e4_Label          ,%A_ScriptDir%\Resources\Functions.txt, e4_Label
e4_Label := StrSplit(e4_Label, ":")
e4_Label := SubStr(e4_Label[1], 3)
FileReadLine, e5_Label          ,%A_ScriptDir%\Resources\Functions.txt, e5_Label
e5_Label := StrSplit(e5_Label, ":")
e5_Label := SubStr(e5_Label[1], 3)
FileReadLine, e6_Label          ,%A_ScriptDir%\Resources\Functions.txt, e6_Label
e6_Label := StrSplit(e6_Label, ":")
e6_Label := SubStr(e6_Label[1], 3)

FileReadLine, fnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, fnull_Label
fnull_Label := StrSplit(fnull_Label, ":")
fnull_Label := SubStr(fnull_Label[1], 3)
FileReadLine, f1_Label          ,%A_ScriptDir%\Resources\Functions.txt, f1_Label
f1_Label := StrSplit(f1_Label, ":")
f1_Label := SubStr(f1_Label[1], 3)
FileReadLine, f2_Label          ,%A_ScriptDir%\Resources\Functions.txt, f2_Label
f2_Label := StrSplit(f2_Label, ":")
f2_Label := SubStr(f2_Label[1], 3)
FileReadLine, f3_Label          ,%A_ScriptDir%\Resources\Functions.txt, f3_Label
f3_Label := StrSplit(f3_Label, ":")
f3_Label := SubStr(f3_Label[1], 3)
FileReadLine, f4_Label          ,%A_ScriptDir%\Resources\Functions.txt, f4_Label
f4_Label := StrSplit(f4_Label, ":")
f4_Label := SubStr(f4_Label[1], 3)
FileReadLine, f5_Label          ,%A_ScriptDir%\Resources\Functions.txt, f5_Label
f5_Label := StrSplit(f5_Label, ":")
f5_Label := SubStr(f5_Label[1], 3)
FileReadLine, f6_Label          ,%A_ScriptDir%\Resources\Functions.txt, f6_Label
f6_Label := StrSplit(f6_Label, ":")
f6_Label := SubStr(f6_Label[1], 3)

FileReadLine, gnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, gnull_Label
gnull_Label := StrSplit(gnull_Label, ":")
gnull_Label := SubStr(gnull_Label[1], 3)
FileReadLine, g1_Label          ,%A_ScriptDir%\Resources\Functions.txt, g1_Label
g1_Label := StrSplit(g1_Label, ":")
g1_Label := SubStr(g1_Label[1], 3)
FileReadLine, g2_Label          ,%A_ScriptDir%\Resources\Functions.txt, g2_Label
g2_Label := StrSplit(g2_Label, ":")
g2_Label := SubStr(g2_Label[1], 3)
FileReadLine, g3_Label          ,%A_ScriptDir%\Resources\Functions.txt, g3_Label
g3_Label := StrSplit(g3_Label, ":")
g3_Label := SubStr(g3_Label[1], 3)
FileReadLine, g4_Label          ,%A_ScriptDir%\Resources\Functions.txt, g4_Label
g4_Label := StrSplit(g4_Label, ":")
g4_Label := SubStr(g4_Label[1], 3)
FileReadLine, g5_Label          ,%A_ScriptDir%\Resources\Functions.txt, g5_Label
g5_Label := StrSplit(g5_Label, ":")
g5_Label := SubStr(g5_Label[1], 3)
FileReadLine, g6_Label          ,%A_ScriptDir%\Resources\Functions.txt, g6_Label
g6_Label := StrSplit(g6_Label, ":")
g6_Label := SubStr(g6_Label[1], 3)

FileReadLine, hnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, hnull_Label
hnull_Label := StrSplit(hnull_Label, ":")
hnull_Label := SubStr(hnull_Label[1], 3)
FileReadLine, h1_Label          ,%A_ScriptDir%\Resources\Functions.txt, h1_Label
h1_Label := StrSplit(h1_Label, ":")
h1_Label := SubStr(h1_Label[1], 3)
FileReadLine, h2_Label          ,%A_ScriptDir%\Resources\Functions.txt, h2_Label
h2_Label := StrSplit(h2_Label, ":")
h2_Label := SubStr(h2_Label[1], 3)
FileReadLine, h3_Label          ,%A_ScriptDir%\Resources\Functions.txt, h3_Label
h3_Label := StrSplit(h3_Label, ":")
h3_Label := SubStr(h3_Label[1], 3)
FileReadLine, h4_Label          ,%A_ScriptDir%\Resources\Functions.txt, h4_Label
h4_Label := StrSplit(h4_Label, ":")
h4_Label := SubStr(h4_Label[1], 3)
FileReadLine, h5_Label          ,%A_ScriptDir%\Resources\Functions.txt, h5_Label
h5_Label := StrSplit(h5_Label, ":")
h5_Label := SubStr(h5_Label[1], 3)
FileReadLine, h6_Label          ,%A_ScriptDir%\Resources\Functions.txt, h6_Label
h6_Label := StrSplit(h6_Label, ":")
h6_Label := SubStr(h6_Label[1], 3)

FileReadLine, inull_Label          ,%A_ScriptDir%\Resources\Functions.txt, inull_Label
inull_Label := StrSplit(inull_Label, ":")
inull_Label := SubStr(inull_Label[1], 3)
FileReadLine, i1_Label          ,%A_ScriptDir%\Resources\Functions.txt, i1_Label
i1_Label := StrSplit(i1_Label, ":")
i1_Label := SubStr(i1_Label[1], 3)
FileReadLine, i2_Label          ,%A_ScriptDir%\Resources\Functions.txt, i2_Label
i2_Label := StrSplit(i2_Label, ":")
i2_Label := SubStr(i2_Label[1], 3)
FileReadLine, i3_Label          ,%A_ScriptDir%\Resources\Functions.txt, i3_Label
i3_Label := StrSplit(i3_Label, ":")
i3_Label := SubStr(i3_Label[1], 3)
FileReadLine, i4_Label          ,%A_ScriptDir%\Resources\Functions.txt, i4_Label
i4_Label := StrSplit(i4_Label, ":")
i4_Label := SubStr(i4_Label[1], 3)
FileReadLine, i5_Label          ,%A_ScriptDir%\Resources\Functions.txt, i5_Label
i5_Label := StrSplit(i5_Label, ":")
i5_Label := SubStr(i5_Label[1], 3)
FileReadLine, i6_Label          ,%A_ScriptDir%\Resources\Functions.txt, i6_Label
i6_Label := StrSplit(i6_Label, ":")
i6_Label := SubStr(i6_Label[1], 3)

FileReadLine, jnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, jnull_Label
jnull_Label := StrSplit(jnull_Label, ":")
jnull_Label := SubStr(jnull_Label[1], 3)
FileReadLine, j1_Label          ,%A_ScriptDir%\Resources\Functions.txt, j1_Label
j1_Label := StrSplit(j1_Label, ":")
j1_Label := SubStr(j1_Label[1], 3)
FileReadLine, j2_Label          ,%A_ScriptDir%\Resources\Functions.txt, j2_Label
j2_Label := StrSplit(j2_Label, ":")
j2_Label := SubStr(j2_Label[1], 3)
FileReadLine, j3_Label          ,%A_ScriptDir%\Resources\Functions.txt, j3_Label
j3_Label := StrSplit(j3_Label, ":")
j3_Label := SubStr(j3_Label[1], 3)
FileReadLine, j4_Label          ,%A_ScriptDir%\Resources\Functions.txt, j4_Label
j4_Label := StrSplit(j4_Label, ":")
j4_Label := SubStr(j4_Label[1], 3)
FileReadLine, j5_Label          ,%A_ScriptDir%\Resources\Functions.txt, j5_Label
j5_Label := StrSplit(j5_Label, ":")
j5_Label := SubStr(j5_Label[1], 3)
FileReadLine, j6_Label          ,%A_ScriptDir%\Resources\Functions.txt, j6_Label
j6_Label := StrSplit(j6_Label, ":")
j6_Label := SubStr(j6_Label[1], 3)

FileReadLine, knull_Label          ,%A_ScriptDir%\Resources\Functions.txt, knull_Label
knull_Label := StrSplit(knull_Label, ":")
knull_Label := SubStr(knull_Label[1], 3)
FileReadLine, k1_Label          ,%A_ScriptDir%\Resources\Functions.txt, k1_Label
k1_Label := StrSplit(k1_Label, ":")
k1_Label := SubStr(k1_Label[1], 3)
FileReadLine, k2_Label          ,%A_ScriptDir%\Resources\Functions.txt, k2_Label
k2_Label := StrSplit(k2_Label, ":")
k2_Label := SubStr(k2_Label[1], 3)
FileReadLine, k3_Label          ,%A_ScriptDir%\Resources\Functions.txt, k3_Label
k3_Label := StrSplit(k3_Label, ":")
k3_Label := SubStr(k3_Label[1], 3)
FileReadLine, k4_Label          ,%A_ScriptDir%\Resources\Functions.txt, k4_Label
k4_Label := StrSplit(k4_Label, ":")
k4_Label := SubStr(k4_Label[1], 3)
FileReadLine, k5_Label          ,%A_ScriptDir%\Resources\Functions.txt, k5_Label
k5_Label := StrSplit(k5_Label, ":")
k5_Label := SubStr(k5_Label[1], 3)
FileReadLine, k6_Label          ,%A_ScriptDir%\Resources\Functions.txt, k6_Label
k6_Label := StrSplit(k6_Label, ":")
k6_Label := SubStr(k6_Label[1], 3)

FileReadLine, lnull_Label          ,%A_ScriptDir%\Resources\Functions.txt, lnull_Label
lnull_Label := StrSplit(lnull_Label, ":")
lnull_Label := SubStr(lnull_Label[1], 3)
FileReadLine, l1_Label          ,%A_ScriptDir%\Resources\Functions.txt, l1_Label
l1_Label := StrSplit(l1_Label, ":")
l1_Label := SubStr(l1_Label[1], 3)
FileReadLine, l2_Label          ,%A_ScriptDir%\Resources\Functions.txt, l2_Label
l2_Label := StrSplit(l2_Label, ":")
l2_Label := SubStr(l2_Label[1], 3)
FileReadLine, l3_Label          ,%A_ScriptDir%\Resources\Functions.txt, l3_Label
l3_Label := StrSplit(l3_Label, ":")
l3_Label := SubStr(l3_Label[1], 3)
FileReadLine, l4_Label          ,%A_ScriptDir%\Resources\Functions.txt, l4_Label
l4_Label := StrSplit(l4_Label, ":")
l4_Label := SubStr(l4_Label[1], 3)
FileReadLine, l5_Label          ,%A_ScriptDir%\Resources\Functions.txt, l5_Label
l5_Label := StrSplit(l5_Label, ":")
l5_Label := SubStr(l5_Label[1], 3)
FileReadLine, l6_Label          ,%A_ScriptDir%\Resources\Functions.txt, l6_Label
l6_Label := StrSplit(l6_Label, ":")
l6_Label := SubStr(l6_Label[1], 3)


;These Settings are all denoted by settingsfile.txt in Resources folder.
;Change these with the PieMenuSettings.ahk Script

;Key that activates the Pie Menu, preferably set to a key on your tablet penTool
FileReadline, piekeysetting, %A_ScriptDir%\Resources\settingsfile.txt, 1
PieActivateKey = %piekeysetting% 

;How long until Pie Menu labels appear
;I recommend not changing this, it is a purposefully uncomfortable time to encourage you to learn the positions
FileReadline, pielabeldelaysetting, %A_ScriptDir%\Resources\settingsfile.txt, 2
ShowLabelDelay := pielabeldelaysetting

;How Many Pies to Use?  Setting is 1-3
FileReadline, aPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 3
FileReadline, bPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 4
FileReadline, cPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 5
FileReadline, dPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 6
FileReadline, ePieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 7
FileReadline, fPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 8
FileReadline, gPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 9
FileReadline, hPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 10
FileReadline, iPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 11
FileReadline, jPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 12
FileReadline, kPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 13
FileReadline, lPieNumberSetting, %A_ScriptDir%\Resources\settingsfile.txt, 14

if (aPieNumberSetting = 0) && (bPieNumberSetting = 0) && (cPieNumberSetting = 0)
	PieNumberSetting := 0
if (aPieNumberSetting = 1) && (bPieNumberSetting = 1) && (cPieNumberSetting = 0)
	PieNumberSetting := 2
if (aPieNumberSetting = 1) && (bPieNumberSetting = 1) && (cPieNumberSetting = 1)
	PieNumberSetting := 3




;Method for Switching between pies.  Range 1-4
FileReadline, RPieSelectNum, %A_ScriptDir%\Resources\settingsfile.txt, 15
MethodtoShift := RPieSelectNum
	If MethodtoShift = 1
		MethodtoShiftText := "Leave Center and Return to Switch Pie Function"
	If MethodtoShift = 2
		MethodtoShiftText := "Leave Center and Return for Purple, Circle and Return for Red"
	If MethodtoShift = 3
		MethodtoShiftText := "Hover over Top and Bottom (circle around), then Return to Center"
	If MethodtoShift = 4
		MethodtoShiftText := "Shift->Purple   Ctrl->Red  Alt->Blue"
	If MethodtoShift = 5
		MethodtoShiftText := ""
	If PieNumberSetting = 1
		MethodtoShiftText :=  "You're only using ONE MENU!?? laaaaaaame... Go to PieMenuSettings.ahk to change this." 

;Pie Menu Size Setting
FileReadLine, PieMenuSizeTemp,%A_ScriptDir%\Resources\settingsfile.txt,367
If PieMenuSizeTemp = 1
	{
	PieMenuScale := 45
	PieMenuOffset := 23
	PieMenuSize := 22
	anull_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuNull.png
	   a1_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill1.png
	   a2_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill2.png
	   a3_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill3.png
	   a4_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill4.png
	   a5_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill5.png
	   a6_Image = %A_ScriptDir%\Resources\1PieMenu\aPieMenuFill6.png
	bnull_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuNull.png
	   b1_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill1.png
	   b2_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill2.png
	   b3_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill3.png
	   b4_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill4.png
	   b5_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill5.png
	   b6_Image = %A_ScriptDir%\Resources\1PieMenu\bPieMenuFill6.png
	cnull_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuNull.png
	   c1_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill1.png
	   c2_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill2.png
	   c3_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill3.png
	   c4_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill4.png
	   c5_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill5.png
	   c6_Image = %A_ScriptDir%\Resources\1PieMenu\cPieMenuFill6.png
	dnull_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuNull.png
	   d1_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill1.png
	   d2_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill2.png
	   d3_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill3.png
	   d4_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill4.png
	   d5_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill5.png
	   d6_Image = %A_ScriptDir%\Resources\1PieMenu\dPieMenuFill6.png
	enull_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuNull.png
	   e1_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill1.png
	   e2_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill2.png
	   e3_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill3.png
	   e4_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill4.png
	   e5_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill5.png
	   e6_Image = %A_ScriptDir%\Resources\1PieMenu\ePieMenuFill6.png
	fnull_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuNull.png
	   f1_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill1.png
	   f2_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill2.png
	   f3_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill3.png
	   f4_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill4.png
	   f5_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill5.png
	   f6_Image = %A_ScriptDir%\Resources\1PieMenu\fPieMenuFill6.png
	gnull_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuNull.png
	   g1_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill1.png
	   g2_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill2.png
	   g3_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill3.png
	   g4_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill4.png
	   g5_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill5.png
	   g6_Image = %A_ScriptDir%\Resources\1PieMenu\gPieMenuFill6.png
	hnull_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuNull.png
	   h1_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill1.png
	   h2_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill2.png
	   h3_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill3.png
	   h4_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill4.png
	   h5_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill5.png
	   h6_Image = %A_ScriptDir%\Resources\1PieMenu\hPieMenuFill6.png
	inull_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuNull.png
	   i1_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill1.png
	   i2_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill2.png
	   i3_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill3.png
	   i4_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill4.png
	   i5_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill5.png
	   i6_Image = %A_ScriptDir%\Resources\1PieMenu\iPieMenuFill6.png
	jnull_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuNull.png
	   j1_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill1.png
	   j2_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill2.png
	   j3_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill3.png
	   j4_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill4.png
	   j5_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill5.png
	   j6_Image = %A_ScriptDir%\Resources\1PieMenu\jPieMenuFill6.png
	knull_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuNull.png
	   k1_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill1.png
	   k2_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill2.png
	   k3_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill3.png
	   k4_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill4.png
	   k5_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill5.png
	   k6_Image = %A_ScriptDir%\Resources\1PieMenu\kPieMenuFill6.png
	lnull_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuNull.png
	   l1_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill1.png
	   l2_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill2.png
	   l3_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill3.png
	   l4_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill4.png
	   l5_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill5.png
	   l6_Image = %A_ScriptDir%\Resources\1PieMenu\lPieMenuFill6.png   
	}
If PieMenuSizeTemp = 2
	{
	PieMenuScale := 71
	PieMenuOffset := 36
	PieMenuSize := 29
	anull_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuNull.png
	   a1_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill1.png
	   a2_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill2.png
	   a3_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill3.png
	   a4_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill4.png
	   a5_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill5.png
	   a6_Image = %A_ScriptDir%\Resources\2PieMenu\aPieMenuFill6.png
	bnull_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuNull.png
	   b1_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill1.png
	   b2_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill2.png
	   b3_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill3.png
	   b4_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill4.png
	   b5_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill5.png
	   b6_Image = %A_ScriptDir%\Resources\2PieMenu\bPieMenuFill6.png
	cnull_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuNull.png
	   c1_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill1.png
	   c2_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill2.png
	   c3_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill3.png
	   c4_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill4.png
	   c5_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill5.png
	   c6_Image = %A_ScriptDir%\Resources\2PieMenu\cPieMenuFill6.png
	dnull_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuNull.png
	   d1_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill1.png
	   d2_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill2.png
	   d3_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill3.png
	   d4_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill4.png
	   d5_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill5.png
	   d6_Image = %A_ScriptDir%\Resources\2PieMenu\dPieMenuFill6.png
	enull_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuNull.png
	   e1_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill1.png
	   e2_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill2.png
	   e3_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill3.png
	   e4_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill4.png
	   e5_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill5.png
	   e6_Image = %A_ScriptDir%\Resources\2PieMenu\ePieMenuFill6.png
	fnull_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuNull.png
	   f1_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill1.png
	   f2_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill2.png
	   f3_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill3.png
	   f4_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill4.png
	   f5_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill5.png
	   f6_Image = %A_ScriptDir%\Resources\2PieMenu\fPieMenuFill6.png
	gnull_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuNull.png
	   g1_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill1.png
	   g2_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill2.png
	   g3_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill3.png
	   g4_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill4.png
	   g5_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill5.png
	   g6_Image = %A_ScriptDir%\Resources\2PieMenu\gPieMenuFill6.png
	hnull_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuNull.png
	   h1_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill1.png
	   h2_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill2.png
	   h3_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill3.png
	   h4_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill4.png
	   h5_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill5.png
	   h6_Image = %A_ScriptDir%\Resources\2PieMenu\hPieMenuFill6.png
	inull_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuNull.png
	   i1_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill1.png
	   i2_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill2.png
	   i3_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill3.png
	   i4_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill4.png
	   i5_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill5.png
	   i6_Image = %A_ScriptDir%\Resources\2PieMenu\iPieMenuFill6.png
	jnull_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuNull.png
	   j1_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill1.png
	   j2_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill2.png
	   j3_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill3.png
	   j4_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill4.png
	   j5_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill5.png
	   j6_Image = %A_ScriptDir%\Resources\2PieMenu\jPieMenuFill6.png
	knull_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuNull.png
	   k1_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill1.png
	   k2_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill2.png
	   k3_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill3.png
	   k4_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill4.png
	   k5_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill5.png
	   k6_Image = %A_ScriptDir%\Resources\2PieMenu\kPieMenuFill6.png
	lnull_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuNull.png
	   l1_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill1.png
	   l2_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill2.png
	   l3_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill3.png
	   l4_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill4.png
	   l5_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill5.png
	   l6_Image = %A_ScriptDir%\Resources\2PieMenu\lPieMenuFill6.png
	}
If PieMenuSizeTemp = 3
	{
	PieMenuScale := 100
	PieMenuOffset := 50
	PieMenuSize := 48
	anull_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuNull.png
	   a1_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill1.png
	   a2_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill2.png
	   a3_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill3.png
	   a4_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill4.png
	   a5_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill5.png
	   a6_Image = %A_ScriptDir%\Resources\3PieMenu\aPieMenuFill6.png
	bnull_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuNull.png
	   b1_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill1.png
	   b2_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill2.png
	   b3_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill3.png
	   b4_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill4.png
	   b5_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill5.png
	   b6_Image = %A_ScriptDir%\Resources\3PieMenu\bPieMenuFill6.png
	cnull_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuNull.png
	   c1_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill1.png
	   c2_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill2.png
	   c3_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill3.png
	   c4_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill4.png
	   c5_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill5.png
	   c6_Image = %A_ScriptDir%\Resources\3PieMenu\cPieMenuFill6.png
	dnull_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuNull.png
	   d1_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill1.png
	   d2_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill2.png
	   d3_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill3.png
	   d4_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill4.png
	   d5_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill5.png
	   d6_Image = %A_ScriptDir%\Resources\3PieMenu\dPieMenuFill6.png
	enull_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuNull.png
	   e1_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill1.png
	   e2_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill2.png
	   e3_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill3.png
	   e4_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill4.png
	   e5_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill5.png
	   e6_Image = %A_ScriptDir%\Resources\3PieMenu\ePieMenuFill6.png
	fnull_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuNull.png
	   f1_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill1.png
	   f2_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill2.png
	   f3_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill3.png
	   f4_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill4.png
	   f5_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill5.png
	   f6_Image = %A_ScriptDir%\Resources\3PieMenu\fPieMenuFill6.png
	gnull_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuNull.png
	   g1_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill1.png
	   g2_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill2.png
	   g3_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill3.png
	   g4_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill4.png
	   g5_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill5.png
	   g6_Image = %A_ScriptDir%\Resources\3PieMenu\gPieMenuFill6.png
	hnull_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuNull.png
	   h1_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill1.png
	   h2_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill2.png
	   h3_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill3.png
	   h4_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill4.png
	   h5_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill5.png
	   h6_Image = %A_ScriptDir%\Resources\3PieMenu\hPieMenuFill6.png
	inull_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuNull.png
	   i1_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill1.png
	   i2_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill2.png
	   i3_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill3.png
	   i4_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill4.png
	   i5_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill5.png
	   i6_Image = %A_ScriptDir%\Resources\3PieMenu\iPieMenuFill6.png
	jnull_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuNull.png
	   j1_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill1.png
	   j2_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill2.png
	   j3_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill3.png
	   j4_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill4.png
	   j5_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill5.png
	   j6_Image = %A_ScriptDir%\Resources\3PieMenu\jPieMenuFill6.png
	knull_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuNull.png
	   k1_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill1.png
	   k2_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill2.png
	   k3_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill3.png
	   k4_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill4.png
	   k5_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill5.png
	   k6_Image = %A_ScriptDir%\Resources\3PieMenu\kPieMenuFill6.png
	lnull_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuNull.png
	   l1_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill1.png
	   l2_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill2.png
	   l3_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill3.png
	   l4_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill4.png
	   l5_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill5.png
	   l6_Image = %A_ScriptDir%\Resources\3PieMenu\lPieMenuFill6.png
	}
If PieMenuSizeTemp = 4
	{
	PieMenuScale := 200
	PieMenuOffset := 100
	PieMenuSize := 96
	anull_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuNull.png
	   a1_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill1.png
	   a2_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill2.png
	   a3_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill3.png
	   a4_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill4.png
	   a5_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill5.png
	   a6_Image = %A_ScriptDir%\Resources\4PieMenu\aPieMenuFill6.png
	bnull_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuNull.png
	   b1_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill1.png
	   b2_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill2.png
	   b3_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill3.png
	   b4_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill4.png
	   b5_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill5.png
	   b6_Image = %A_ScriptDir%\Resources\4PieMenu\bPieMenuFill6.png
	cnull_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuNull.png
	   c1_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill1.png
	   c2_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill2.png
	   c3_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill3.png
	   c4_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill4.png
	   c5_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill5.png
	   c6_Image = %A_ScriptDir%\Resources\4PieMenu\cPieMenuFill6.png
	dnull_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuNull.png
	   d1_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill1.png
	   d2_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill2.png
	   d3_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill3.png
	   d4_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill4.png
	   d5_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill5.png
	   d6_Image = %A_ScriptDir%\Resources\4PieMenu\dPieMenuFill6.png
	enull_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuNull.png
	   e1_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill1.png
	   e2_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill2.png
	   e3_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill3.png
	   e4_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill4.png
	   e5_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill5.png
	   e6_Image = %A_ScriptDir%\Resources\4PieMenu\ePieMenuFill6.png
	fnull_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuNull.png
	   f1_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill1.png
	   f2_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill2.png
	   f3_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill3.png
	   f4_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill4.png
	   f5_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill5.png
	   f6_Image = %A_ScriptDir%\Resources\4PieMenu\fPieMenuFill6.png
	gnull_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuNull.png
	   g1_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill1.png
	   g2_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill2.png
	   g3_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill3.png
	   g4_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill4.png
	   g5_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill5.png
	   g6_Image = %A_ScriptDir%\Resources\4PieMenu\gPieMenuFill6.png
	hnull_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuNull.png
	   h1_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill1.png
	   h2_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill2.png
	   h3_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill3.png
	   h4_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill4.png
	   h5_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill5.png
	   h6_Image = %A_ScriptDir%\Resources\4PieMenu\hPieMenuFill6.png
	inull_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuNull.png
	   i1_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill1.png
	   i2_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill2.png
	   i3_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill3.png
	   i4_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill4.png
	   i5_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill5.png
	   i6_Image = %A_ScriptDir%\Resources\4PieMenu\iPieMenuFill6.png
	jnull_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuNull.png
	   j1_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill1.png
	   j2_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill2.png
	   j3_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill3.png
	   j4_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill4.png
	   j5_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill5.png
	   j6_Image = %A_ScriptDir%\Resources\4PieMenu\jPieMenuFill6.png
	knull_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuNull.png
	   k1_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill1.png
	   k2_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill2.png
	   k3_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill3.png
	   k4_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill4.png
	   k5_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill5.png
	   k6_Image = %A_ScriptDir%\Resources\4PieMenu\kPieMenuFill6.png
	lnull_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuNull.png
	   l1_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill1.png
	   l2_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill2.png
	   l3_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill3.png
	   l4_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill4.png
	   l5_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill5.png
	   l6_Image = %A_ScriptDir%\Resources\4PieMenu\lPieMenuFill6.png
	}

;Helpful hints about the Pie menu will show up at the bottom if On
FileReadline, DisplayTooltipssetting, %A_ScriptDir%\Resources\settingsfile.txt, 16
ShowToolTips := DisplayTooltipssetting



	





;Initialize variables
BlockLButton := 0
SetUpGDIP(BitmapScreenRight,BitmapScreenBottom)
Gdip_FontFamilyCreate(Arial)

;Replaces spaces in labels with Underscores to link to function labels

anull_FuncLabel := RegExReplace(anull_Label, " ", "_")
fanull_Label = %anull_Label%
	If RegExMatch(anull_FuncLabel, "Send")
		{
		anull_SendLabel := % anull_SendKeystroke
		anull_FuncLabel := SubStr(anull_FuncLabel, 1, 8)
		If (anull_OverrideLabel != "")
			fanull_Label = %anull_OverrideLabel%
		anull_CaseTest := RegExMatch(anull_SendLabel, "[A-Z]", anull_UpChar)
		If anull_CaseTest > 0
			{
			anull_ReplaceBrack = `{%anull_UpChar%
			anothers := RegExReplace(anull_SendLabel, anull_UpChar, anull_ReplaceBrack)
				anull_SendLabel = %anothers%}
				
			}
		}
	If anull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (anull_OverrideLabel != "")
			fanull_Label = %anull_OverrideLabel%
		}
	If anull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, anull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,368
		
		
a1_FuncLabel := RegExReplace(a1_Label, " ", "_")
fa1_Label = %a1_Label%
	If RegExMatch(a1_FuncLabel, "Send")
		{
		a1_SendLabel := % a1_SendKeystroke
		a1_FuncLabel := SubStr(a1_FuncLabel, 1, 8)
		If (a1_OverrideLabel != "")
			fa1_Label = %a1_OverrideLabel%
		a1_CaseTest := RegExMatch(a1_SendLabel, "[A-Z]", a1_UpChar)
		If a1_CaseTest > 0
			{
			a1_ReplaceBrack = `{%a1_UpChar%
			anothers := RegExReplace(a1_SendLabel, a1_UpChar, a1_ReplaceBrack)
				a1_SendLabel = %anothers%}
				
			}
		}
	If a1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a1_OverrideLabel != "")
			fa1_Label = %a1_OverrideLabel%
		}
	If a1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,369
		
a2_FuncLabel := RegExReplace(a2_Label, " ", "_")
fa2_Label = %a2_Label%
	If RegExMatch(a2_FuncLabel, "Send")
		{
		a2_SendLabel := % a2_SendKeystroke
		a2_FuncLabel := SubStr(a2_FuncLabel, 1, 8)
		If (a2_OverrideLabel != "")
			fa2_Label = %a2_OverrideLabel%
		a2_CaseTest := RegExMatch(a2_SendLabel, "[A-Z]", a2_UpChar)
		If a2_CaseTest > 0
			{
			a2_ReplaceBrack = `{%a2_UpChar%
			anothers := RegExReplace(a2_SendLabel, a2_UpChar, a2_ReplaceBrack)
				a2_SendLabel = %anothers%}
				
			}
		}
	If a2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a2_OverrideLabel != "")
			fa2_Label = %a2_OverrideLabel%
		}
	If a2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,370
		
a3_FuncLabel := RegExReplace(a3_Label, " ", "_")
fa3_Label = %a3_Label%
	If RegExMatch(a3_FuncLabel, "Send")
		{
		a3_SendLabel := % a3_SendKeystroke
		a3_FuncLabel := SubStr(a3_FuncLabel, 1, 8)
		If (a3_OverrideLabel != "")
			fa3_Label = %a3_OverrideLabel%
		a3_CaseTest := RegExMatch(a3_SendLabel, "[A-Z]", a3_UpChar)
		If a3_CaseTest > 0
			{
			a3_ReplaceBrack = `{%a3_UpChar%
			anothers := RegExReplace(a3_SendLabel, a3_UpChar, a3_ReplaceBrack)
				a3_SendLabel = %anothers%}
				
			}
		}
	If a3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a3_OverrideLabel != "")
			fa3_Label = %a3_OverrideLabel%
		}
	If a3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,371
		
a4_FuncLabel := RegExReplace(a4_Label, " ", "_")
fa4_Label = %a4_Label%
	If RegExMatch(a4_FuncLabel, "Send")
		{
		a4_SendLabel := % a4_SendKeystroke
		a4_FuncLabel := SubStr(a4_FuncLabel, 1, 8)
		If (a4_OverrideLabel != "")
			fa4_Label = %a4_OverrideLabel%
		a4_CaseTest := RegExMatch(a4_SendLabel, "[A-Z]", a4_UpChar)
		If a4_CaseTest > 0
			{
			a4_ReplaceBrack = `{%a4_UpChar%
			anothers := RegExReplace(a4_SendLabel, a4_UpChar, a4_ReplaceBrack)
				a4_SendLabel = %anothers%}
			}
		}
	If a4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a4_OverrideLabel != "")
			fa4_Label = %a4_OverrideLabel%
		}
	If a4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,372
		
a5_FuncLabel := RegExReplace(a5_Label, " ", "_")
fa5_Label = %a5_Label%
	If RegExMatch(a5_FuncLabel, "Send")
		{
		a5_SendLabel := % a5_SendKeystroke
		a5_FuncLabel := SubStr(a5_FuncLabel, 1, 8)
		If (a5_OverrideLabel != "")
			fa5_Label = %a5_OverrideLabel%
		a5_CaseTest := RegExMatch(a5_SendLabel, "[A-Z]", a5_UpChar)
		If a5_CaseTest > 0
			{
			a5_ReplaceBrack = `{%a5_UpChar%
			anothers := RegExReplace(a5_SendLabel, a5_UpChar, a5_ReplaceBrack)
				a5_SendLabel = %anothers%}
			}
		}
	If a5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a5_OverrideLabel != "")
			fa5_Label = %a5_OverrideLabel%
		}
	If a5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,373
		
a6_FuncLabel := RegExReplace(a6_Label, " ", "_")
fa6_Label = %a6_Label%
	If RegExMatch(a6_FuncLabel, "Send")
		{
		a6_SendLabel := % a6_SendKeystroke
		a6_FuncLabel := SubStr(a6_FuncLabel, 1, 8)
		If (a6_OverrideLabel != "")
			fa6_Label = %a6_OverrideLabel%
		a6_CaseTest := RegExMatch(a6_SendLabel, "[A-Z]", a6_UpChar)
		If a6_CaseTest > 0
			{
			a6_ReplaceBrack = `{%a6_UpChar%
			anothers := RegExReplace(a6_SendLabel, a6_UpChar, a6_ReplaceBrack)
				a6_SendLabel = %anothers%}
			}
		}
	If a6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (a6_OverrideLabel != "")
			fa6_Label = %a6_OverrideLabel%
		}
	If a6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, a6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,374

bnull_FuncLabel := RegExReplace(bnull_Label, " ", "_")
fbnull_Label = %bnull_Label%
	If RegExMatch(bnull_FuncLabel, "Send")
		{
		bnull_SendLabel := % bnull_SendKeystroke
		bnull_FuncLabel := SubStr(bnull_FuncLabel, 1, 8)
		If (bnull_OverrideLabel != "")
			fbnull_Label = %bnull_OverrideLabel%
		bnull_CaseTest := RegExMatch(bnull_SendLabel, "[A-Z]", bnull_UpChar)
		If bnull_CaseTest > 0
			{
			bnull_ReplaceBrack = `{%bnull_UpChar%
			anothers := RegExReplace(bnull_SendLabel, bnull_UpChar, bnull_ReplaceBrack)
				bnull_SendLabel = %anothers%}
				
			}
		}
	If bnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (bnull_OverrideLabel != "")
			fbnull_Label = %bnull_OverrideLabel%
		}
	If bnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, bnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,375
		
		
b1_FuncLabel := RegExReplace(b1_Label, " ", "_")
fb1_Label = %b1_Label%
	If RegExMatch(b1_FuncLabel, "Send")
		{
		b1_SendLabel := % b1_SendKeystroke
		b1_FuncLabel := SubStr(b1_FuncLabel, 1, 8)
		If (b1_OverrideLabel != "")
			fb1_Label = %b1_OverrideLabel%
		b1_CaseTest := RegExMatch(b1_SendLabel, "[A-Z]", b1_UpChar)
		If b1_CaseTest > 0
			{
			b1_ReplaceBrack = `{%b1_UpChar%
			anothers := RegExReplace(b1_SendLabel, b1_UpChar, b1_ReplaceBrack)
				b1_SendLabel = %anothers%}
				
			}
		}
	If b1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b1_OverrideLabel != "")
			fb1_Label = %b1_OverrideLabel%
		}
	If b1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,376
		
b2_FuncLabel := RegExReplace(b2_Label, " ", "_")
fb2_Label = %b2_Label%
	If RegExMatch(b2_FuncLabel, "Send")
		{
		b2_SendLabel := % b2_SendKeystroke
		b2_FuncLabel := SubStr(b2_FuncLabel, 1, 8)
		If (b2_OverrideLabel != "")
			fb2_Label = %b2_OverrideLabel%
		b2_CaseTest := RegExMatch(b2_SendLabel, "[A-Z]", b2_UpChar)
		If b2_CaseTest > 0
			{
			b2_ReplaceBrack = `{%b2_UpChar%
			anothers := RegExReplace(b2_SendLabel, b2_UpChar, b2_ReplaceBrack)
				b2_SendLabel = %anothers%}
				
			}
		}
	If b2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b2_OverrideLabel != "")
			fb2_Label = %b2_OverrideLabel%
		}
	If b2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,377
		
b3_FuncLabel := RegExReplace(b3_Label, " ", "_")
fb3_Label = %b3_Label%
	If RegExMatch(b3_FuncLabel, "Send")
		{
		b3_SendLabel := % b3_SendKeystroke
		b3_FuncLabel := SubStr(b3_FuncLabel, 1, 8)
		If (b3_OverrideLabel != "")
			fb3_Label = %b3_OverrideLabel%
		b3_CaseTest := RegExMatch(b3_SendLabel, "[A-Z]", b3_UpChar)
		If b3_CaseTest > 0
			{
			b3_ReplaceBrack = `{%b3_UpChar%
			anothers := RegExReplace(b3_SendLabel, b3_UpChar, b3_ReplaceBrack)
				b3_SendLabel = %anothers%}
				
			}
		}
	If b3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b3_OverrideLabel != "")
			fb3_Label = %b3_OverrideLabel%
		}
	If b3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,378
		
b4_FuncLabel := RegExReplace(b4_Label, " ", "_")
fb4_Label = %b4_Label%
	If RegExMatch(b4_FuncLabel, "Send")
		{
		b4_SendLabel := % b4_SendKeystroke
		b4_FuncLabel := SubStr(b4_FuncLabel, 1, 8)
		If (b4_OverrideLabel != "")
			fb4_Label = %b4_OverrideLabel%
		b4_CaseTest := RegExMatch(b4_SendLabel, "[A-Z]", b4_UpChar)
		If b4_CaseTest > 0
			{
			b4_ReplaceBrack = `{%b4_UpChar%
			anothers := RegExReplace(b4_SendLabel, b4_UpChar, b4_ReplaceBrack)
				b4_SendLabel = %anothers%}
			}
		}
	If b4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b4_OverrideLabel != "")
			fb4_Label = %b4_OverrideLabel%
		}
	If b4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,379
		
b5_FuncLabel := RegExReplace(b5_Label, " ", "_")
fb5_Label = %b5_Label%
	If RegExMatch(b5_FuncLabel, "Send")
		{
		b5_SendLabel := % b5_SendKeystroke
		b5_FuncLabel := SubStr(b5_FuncLabel, 1, 8)
		If (b5_OverrideLabel != "")
			fb5_Label = %b5_OverrideLabel%
		b5_CaseTest := RegExMatch(b5_SendLabel, "[A-Z]", b5_UpChar)
		If b5_CaseTest > 0
			{
			b5_ReplaceBrack = `{%b5_UpChar%
			anothers := RegExReplace(b5_SendLabel, b5_UpChar, b5_ReplaceBrack)
				b5_SendLabel = %anothers%}
			}
		}
	If b5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b5_OverrideLabel != "")
			fb5_Label = %b5_OverrideLabel%
		}
	If b5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,380
		
b6_FuncLabel := RegExReplace(b6_Label, " ", "_")
fb6_Label = %b6_Label%
	If RegExMatch(b6_FuncLabel, "Send")
		{
		b6_SendLabel := % b6_SendKeystroke
		b6_FuncLabel := SubStr(b6_FuncLabel, 1, 8)
		If (b6_OverrideLabel != "")
			fb6_Label = %b6_OverrideLabel%
		b6_CaseTest := RegExMatch(b6_SendLabel, "[A-Z]", b6_UpChar)
		If b6_CaseTest > 0
			{
			b6_ReplaceBrack = `{%b6_UpChar%
			anothers := RegExReplace(b6_SendLabel, b6_UpChar, b6_ReplaceBrack)
				b6_SendLabel = %anothers%}
			}
		}
	If b6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (b6_OverrideLabel != "")
			fb6_Label = %b6_OverrideLabel%
		}
	If b6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, b6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,381

cnull_FuncLabel := RegExReplace(cnull_Label, " ", "_")
fcnull_Label = %cnull_Label%
	If RegExMatch(cnull_FuncLabel, "Send")
		{
		cnull_SendLabel := % cnull_SendKeystroke
		cnull_FuncLabel := SubStr(cnull_FuncLabel, 1, 8)
		If (cnull_OverrideLabel != "")
			fcnull_Label = %cnull_OverrideLabel%
		cnull_CaseTest := RegExMatch(cnull_SendLabel, "[A-Z]", cnull_UpChar)
		If cnull_CaseTest > 0
			{
			cnull_ReplaceBrack = `{%cnull_UpChar%
			anothers := RegExReplace(cnull_SendLabel, cnull_UpChar, cnull_ReplaceBrack)
				cnull_SendLabel = %anothers%}
				
			}
		}
	If cnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (cnull_OverrideLabel != "")
			fcnull_Label = %cnull_OverrideLabel%
		}
	If cnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, cnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,382
		
		
c1_FuncLabel := RegExReplace(c1_Label, " ", "_")
fc1_Label = %c1_Label%
	If RegExMatch(c1_FuncLabel, "Send")
		{
		c1_SendLabel := % c1_SendKeystroke
		c1_FuncLabel := SubStr(c1_FuncLabel, 1, 8)
		If (c1_OverrideLabel != "")
			fc1_Label = %c1_OverrideLabel%
		c1_CaseTest := RegExMatch(c1_SendLabel, "[A-Z]", c1_UpChar)
		If c1_CaseTest > 0
			{
			c1_ReplaceBrack = `{%c1_UpChar%
			anothers := RegExReplace(c1_SendLabel, c1_UpChar, c1_ReplaceBrack)
				c1_SendLabel = %anothers%}
				
			}
		}
	If c1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c1_OverrideLabel != "")
			fc1_Label = %c1_OverrideLabel%
		}
	If c1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,383
		
c2_FuncLabel := RegExReplace(c2_Label, " ", "_")
fc2_Label = %c2_Label%
	If RegExMatch(c2_FuncLabel, "Send")
		{
		c2_SendLabel := % c2_SendKeystroke
		c2_FuncLabel := SubStr(c2_FuncLabel, 1, 8)
		If (c2_OverrideLabel != "")
			fc2_Label = %c2_OverrideLabel%
		c2_CaseTest := RegExMatch(c2_SendLabel, "[A-Z]", c2_UpChar)
		If c2_CaseTest > 0
			{
			c2_ReplaceBrack = `{%c2_UpChar%
			anothers := RegExReplace(c2_SendLabel, c2_UpChar, c2_ReplaceBrack)
				c2_SendLabel = %anothers%}
				
			}
		}
	If c2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c2_OverrideLabel != "")
			fc2_Label = %c2_OverrideLabel%
		}
	If c2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,384
		
c3_FuncLabel := RegExReplace(c3_Label, " ", "_")
fc3_Label = %c3_Label%
	If RegExMatch(c3_FuncLabel, "Send")
		{
		c3_SendLabel := % c3_SendKeystroke
		c3_FuncLabel := SubStr(c3_FuncLabel, 1, 8)
		If (c3_OverrideLabel != "")
			fc3_Label = %c3_OverrideLabel%
		c3_CaseTest := RegExMatch(c3_SendLabel, "[A-Z]", c3_UpChar)
		If c3_CaseTest > 0
			{
			c3_ReplaceBrack = `{%c3_UpChar%
			anothers := RegExReplace(c3_SendLabel, c3_UpChar, c3_ReplaceBrack)
				c3_SendLabel = %anothers%}
				
			}
		}
	If c3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c3_OverrideLabel != "")
			fc3_Label = %c3_OverrideLabel%
		}
	If c3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,385
		
c4_FuncLabel := RegExReplace(c4_Label, " ", "_")
fc4_Label = %c4_Label%
	If RegExMatch(c4_FuncLabel, "Send")
		{
		c4_SendLabel := % c4_SendKeystroke
		c4_FuncLabel := SubStr(c4_FuncLabel, 1, 8)
		If (c4_OverrideLabel != "")
			fc4_Label = %c4_OverrideLabel%
		c4_CaseTest := RegExMatch(c4_SendLabel, "[A-Z]", c4_UpChar)
		If c4_CaseTest > 0
			{
			c4_ReplaceBrack = `{%c4_UpChar%
			anothers := RegExReplace(c4_SendLabel, c4_UpChar, c4_ReplaceBrack)
				c4_SendLabel = %anothers%}
			}
		}
	If c4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c4_OverrideLabel != "")
			fc4_Label = %c4_OverrideLabel%
		}
	If c4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,386
		
c5_FuncLabel := RegExReplace(c5_Label, " ", "_")
fc5_Label = %c5_Label%
	If RegExMatch(c5_FuncLabel, "Send")
		{
		c5_SendLabel := % c5_SendKeystroke
		c5_FuncLabel := SubStr(c5_FuncLabel, 1, 8)
		If (c5_OverrideLabel != "")
			fc5_Label = %c5_OverrideLabel%
		c5_CaseTest := RegExMatch(c5_SendLabel, "[A-Z]", c5_UpChar)
		If c5_CaseTest > 0
			{
			c5_ReplaceBrack = `{%c5_UpChar%
			anothers := RegExReplace(c5_SendLabel, c5_UpChar, c5_ReplaceBrack)
				c5_SendLabel = %anothers%}
			}
		}
	If c5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c5_OverrideLabel != "")
			fc5_Label = %c5_OverrideLabel%
		}
	If c5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,387
		
c6_FuncLabel := RegExReplace(c6_Label, " ", "_")
fc6_Label = %c6_Label%
	If RegExMatch(c6_FuncLabel, "Send")
		{
		c6_SendLabel := % c6_SendKeystroke
		c6_FuncLabel := SubStr(c6_FuncLabel, 1, 8)
		If (c6_OverrideLabel != "")
			fc6_Label = %c6_OverrideLabel%
		c6_CaseTest := RegExMatch(c6_SendLabel, "[A-Z]", c6_UpChar)
		If c6_CaseTest > 0
			{
			c6_ReplaceBrack = `{%c6_UpChar%
			anothers := RegExReplace(c6_SendLabel, c6_UpChar, c6_ReplaceBrack)
				c6_SendLabel = %anothers%}
			}
		}
	If c6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (c6_OverrideLabel != "")
			fc6_Label = %c6_OverrideLabel%
		}
	If c6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, c6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,388

dnull_FuncLabel := RegExReplace(dnull_Label, " ", "_")
fdnull_Label = %dnull_Label%
	If RegExMatch(dnull_FuncLabel, "Send")
		{
		dnull_SendLabel := % dnull_SendKeystroke
		dnull_FuncLabel := SubStr(dnull_FuncLabel, 1, 8)
		If (dnull_OverrideLabel != "")
			fdnull_Label = %dnull_OverrideLabel%
		dnull_CaseTest := RegExMatch(dnull_SendLabel, "[A-Z]", dnull_UpChar)
		If dnull_CaseTest > 0
			{
			dnull_ReplaceBrack = `{%dnull_UpChar%
			anothers := RegExReplace(dnull_SendLabel, dnull_UpChar, dnull_ReplaceBrack)
				dnull_SendLabel = %anothers%}
				
			}
		}
	If dnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (dnull_OverrideLabel != "")
			fdnull_Label = %dnull_OverrideLabel%
		}
	If dnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, dnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,389
		
		
d1_FuncLabel := RegExReplace(d1_Label, " ", "_")
fd1_Label = %d1_Label%
	If RegExMatch(d1_FuncLabel, "Send")
		{
		d1_SendLabel := % d1_SendKeystroke
		d1_FuncLabel := SubStr(d1_FuncLabel, 1, 8)
		If (d1_OverrideLabel != "")
			fd1_Label = %d1_OverrideLabel%
		d1_CaseTest := RegExMatch(d1_SendLabel, "[A-Z]", d1_UpChar)
		If d1_CaseTest > 0
			{
			d1_ReplaceBrack = `{%d1_UpChar%
			anothers := RegExReplace(d1_SendLabel, d1_UpChar, d1_ReplaceBrack)
				d1_SendLabel = %anothers%}
				
			}
		}
	If d1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d1_OverrideLabel != "")
			fd1_Label = %d1_OverrideLabel%
		}
	If d1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,390
		
d2_FuncLabel := RegExReplace(d2_Label, " ", "_")
fd2_Label = %d2_Label%
	If RegExMatch(d2_FuncLabel, "Send")
		{
		d2_SendLabel := % d2_SendKeystroke
		d2_FuncLabel := SubStr(d2_FuncLabel, 1, 8)
		If (d2_OverrideLabel != "")
			fd2_Label = %d2_OverrideLabel%
		d2_CaseTest := RegExMatch(d2_SendLabel, "[A-Z]", d2_UpChar)
		If d2_CaseTest > 0
			{
			d2_ReplaceBrack = `{%d2_UpChar%
			anothers := RegExReplace(d2_SendLabel, d2_UpChar, d2_ReplaceBrack)
				d2_SendLabel = %anothers%}
				
			}
		}
	If d2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d2_OverrideLabel != "")
			fd2_Label = %d2_OverrideLabel%
		}
	If d2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,391
		
d3_FuncLabel := RegExReplace(d3_Label, " ", "_")
fd3_Label = %d3_Label%
	If RegExMatch(d3_FuncLabel, "Send")
		{
		d3_SendLabel := % d3_SendKeystroke
		d3_FuncLabel := SubStr(d3_FuncLabel, 1, 8)
		If (d3_OverrideLabel != "")
			fd3_Label = %d3_OverrideLabel%
		d3_CaseTest := RegExMatch(d3_SendLabel, "[A-Z]", d3_UpChar)
		If d3_CaseTest > 0
			{
			d3_ReplaceBrack = `{%d3_UpChar%
			anothers := RegExReplace(d3_SendLabel, d3_UpChar, d3_ReplaceBrack)
				d3_SendLabel = %anothers%}
				
			}
		}
	If d3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d3_OverrideLabel != "")
			fd3_Label = %d3_OverrideLabel%
		}
	If d3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,392
		
d4_FuncLabel := RegExReplace(d4_Label, " ", "_")
fd4_Label = %d4_Label%
	If RegExMatch(d4_FuncLabel, "Send")
		{
		d4_SendLabel := % d4_SendKeystroke
		d4_FuncLabel := SubStr(d4_FuncLabel, 1, 8)
		If (d4_OverrideLabel != "")
			fd4_Label = %d4_OverrideLabel%
		d4_CaseTest := RegExMatch(d4_SendLabel, "[A-Z]", d4_UpChar)
		If d4_CaseTest > 0
			{
			d4_ReplaceBrack = `{%d4_UpChar%
			anothers := RegExReplace(d4_SendLabel, d4_UpChar, d4_ReplaceBrack)
				d4_SendLabel = %anothers%}
			}
		}
	If d4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d4_OverrideLabel != "")
			fd4_Label = %d4_OverrideLabel%
		}
	If d4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,393
		
d5_FuncLabel := RegExReplace(d5_Label, " ", "_")
fd5_Label = %d5_Label%
	If RegExMatch(d5_FuncLabel, "Send")
		{
		d5_SendLabel := % d5_SendKeystroke
		d5_FuncLabel := SubStr(d5_FuncLabel, 1, 8)
		If (d5_OverrideLabel != "")
			fd5_Label = %d5_OverrideLabel%
		d5_CaseTest := RegExMatch(d5_SendLabel, "[A-Z]", d5_UpChar)
		If d5_CaseTest > 0
			{
			d5_ReplaceBrack = `{%d5_UpChar%
			anothers := RegExReplace(d5_SendLabel, d5_UpChar, d5_ReplaceBrack)
				d5_SendLabel = %anothers%}
			}
		}
	If d5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d5_OverrideLabel != "")
			fd5_Label = %d5_OverrideLabel%
		}
	If d5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,394
		
d6_FuncLabel := RegExReplace(d6_Label, " ", "_")
fd6_Label = %d6_Label%
	If RegExMatch(d6_FuncLabel, "Send")
		{
		d6_SendLabel := % d6_SendKeystroke
		d6_FuncLabel := SubStr(d6_FuncLabel, 1, 8)
		If (d6_OverrideLabel != "")
			fd6_Label = %d6_OverrideLabel%
		d6_CaseTest := RegExMatch(d6_SendLabel, "[A-Z]", d6_UpChar)
		If d6_CaseTest > 0
			{
			d6_ReplaceBrack = `{%d6_UpChar%
			anothers := RegExReplace(d6_SendLabel, d6_UpChar, d6_ReplaceBrack)
				d6_SendLabel = %anothers%}
			}
		}
	If d6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (d6_OverrideLabel != "")
			fd6_Label = %d6_OverrideLabel%
		}
	If d6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, d6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,395

enull_FuncLabel := RegExReplace(enull_Label, " ", "_")
fenull_Label = %enull_Label%
	If RegExMatch(enull_FuncLabel, "Send")
		{
		enull_SendLabel := % enull_SendKeystroke
		enull_FuncLabel := SubStr(enull_FuncLabel, 1, 8)
		If (enull_OverrideLabel != "")
			fenull_Label = %enull_OverrideLabel%
		enull_CaseTest := RegExMatch(enull_SendLabel, "[A-Z]", enull_UpChar)
		If enull_CaseTest > 0
			{
			enull_ReplaceBrack = `{%enull_UpChar%
			anothers := RegExReplace(enull_SendLabel, enull_UpChar, enull_ReplaceBrack)
				enull_SendLabel = %anothers%}
				
			}
		}
	If enull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (enull_OverrideLabel != "")
			fenull_Label = %enull_OverrideLabel%
		}
	If enull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, enull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,396
		
		
e1_FuncLabel := RegExReplace(e1_Label, " ", "_")
fe1_Label = %e1_Label%
	If RegExMatch(e1_FuncLabel, "Send")
		{
		e1_SendLabel := % e1_SendKeystroke
		e1_FuncLabel := SubStr(e1_FuncLabel, 1, 8)
		If (e1_OverrideLabel != "")
			fe1_Label = %e1_OverrideLabel%
		e1_CaseTest := RegExMatch(e1_SendLabel, "[A-Z]", e1_UpChar)
		If e1_CaseTest > 0
			{
			e1_ReplaceBrack = `{%e1_UpChar%
			anothers := RegExReplace(e1_SendLabel, e1_UpChar, e1_ReplaceBrack)
				e1_SendLabel = %anothers%}
				
			}
		}
	If e1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e1_OverrideLabel != "")
			fe1_Label = %e1_OverrideLabel%
		}
	If e1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,397
		
e2_FuncLabel := RegExReplace(e2_Label, " ", "_")
fe2_Label = %e2_Label%
	If RegExMatch(e2_FuncLabel, "Send")
		{
		e2_SendLabel := % e2_SendKeystroke
		e2_FuncLabel := SubStr(e2_FuncLabel, 1, 8)
		If (e2_OverrideLabel != "")
			fe2_Label = %e2_OverrideLabel%
		e2_CaseTest := RegExMatch(e2_SendLabel, "[A-Z]", e2_UpChar)
		If e2_CaseTest > 0
			{
			e2_ReplaceBrack = `{%e2_UpChar%
			anothers := RegExReplace(e2_SendLabel, e2_UpChar, e2_ReplaceBrack)
				e2_SendLabel = %anothers%}
				
			}
		}
	If e2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e2_OverrideLabel != "")
			fe2_Label = %e2_OverrideLabel%
		}
	If e2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,398
		
e3_FuncLabel := RegExReplace(e3_Label, " ", "_")
fe3_Label = %e3_Label%
	If RegExMatch(e3_FuncLabel, "Send")
		{
		e3_SendLabel := % e3_SendKeystroke
		e3_FuncLabel := SubStr(e3_FuncLabel, 1, 8)
		If (e3_OverrideLabel != "")
			fe3_Label = %e3_OverrideLabel%
		e3_CaseTest := RegExMatch(e3_SendLabel, "[A-Z]", e3_UpChar)
		If e3_CaseTest > 0
			{
			e3_ReplaceBrack = `{%e3_UpChar%
			anothers := RegExReplace(e3_SendLabel, e3_UpChar, e3_ReplaceBrack)
				e3_SendLabel = %anothers%}
				
			}
		}
	If e3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e3_OverrideLabel != "")
			fe3_Label = %e3_OverrideLabel%
		}
	If e3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,399
		
e4_FuncLabel := RegExReplace(e4_Label, " ", "_")
fe4_Label = %e4_Label%
	If RegExMatch(e4_FuncLabel, "Send")
		{
		e4_SendLabel := % e4_SendKeystroke
		e4_FuncLabel := SubStr(e4_FuncLabel, 1, 8)
		If (e4_OverrideLabel != "")
			fe4_Label = %e4_OverrideLabel%
		e4_CaseTest := RegExMatch(e4_SendLabel, "[A-Z]", e4_UpChar)
		If e4_CaseTest > 0
			{
			e4_ReplaceBrack = `{%e4_UpChar%
			anothers := RegExReplace(e4_SendLabel, e4_UpChar, e4_ReplaceBrack)
				e4_SendLabel = %anothers%}
			}
		}
	If e4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e4_OverrideLabel != "")
			fe4_Label = %e4_OverrideLabel%
		}
	If e4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,400
		
e5_FuncLabel := RegExReplace(e5_Label, " ", "_")
fe5_Label = %e5_Label%
	If RegExMatch(e5_FuncLabel, "Send")
		{
		e5_SendLabel := % e5_SendKeystroke
		e5_FuncLabel := SubStr(e5_FuncLabel, 1, 8)
		If (e5_OverrideLabel != "")
			fe5_Label = %e5_OverrideLabel%
		e5_CaseTest := RegExMatch(e5_SendLabel, "[A-Z]", e5_UpChar)
		If e5_CaseTest > 0
			{
			e5_ReplaceBrack = `{%e5_UpChar%
			anothers := RegExReplace(e5_SendLabel, e5_UpChar, e5_ReplaceBrack)
				e5_SendLabel = %anothers%}
			}
		}
	If e5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e5_OverrideLabel != "")
			fe5_Label = %e5_OverrideLabel%
		}
	If e5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,401
		
e6_FuncLabel := RegExReplace(e6_Label, " ", "_")
fe6_Label = %e6_Label%
	If RegExMatch(e6_FuncLabel, "Send")
		{
		e6_SendLabel := % e6_SendKeystroke
		e6_FuncLabel := SubStr(e6_FuncLabel, 1, 8)
		If (e6_OverrideLabel != "")
			fe6_Label = %e6_OverrideLabel%
		e6_CaseTest := RegExMatch(e6_SendLabel, "[A-Z]", e6_UpChar)
		If e6_CaseTest > 0
			{
			e6_ReplaceBrack = `{%e6_UpChar%
			anothers := RegExReplace(e6_SendLabel, e6_UpChar, e6_ReplaceBrack)
				e6_SendLabel = %anothers%}
			}
		}
	If e6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (e6_OverrideLabel != "")
			fe6_Label = %e6_OverrideLabel%
		}
	If e6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, e6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,402

fnull_FuncLabel := RegExReplace(fnull_Label, " ", "_")
ffnull_Label = %fnull_Label%
	If RegExMatch(fnull_FuncLabel, "Send")
		{
		fnull_SendLabel := % fnull_SendKeystroke
		fnull_FuncLabel := SubStr(fnull_FuncLabel, 1, 8)
		If (fnull_OverrideLabel != "")
			ffnull_Label = %fnull_OverrideLabel%
		fnull_CaseTest := RegExMatch(fnull_SendLabel, "[A-Z]", fnull_UpChar)
		If fnull_CaseTest > 0
			{
			fnull_ReplaceBrack = `{%fnull_UpChar%
			anothers := RegExReplace(fnull_SendLabel, fnull_UpChar, fnull_ReplaceBrack)
				fnull_SendLabel = %anothers%}
				
			}
		}
	If fnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (fnull_OverrideLabel != "")
			ffnull_Label = %fnull_OverrideLabel%
		}
	If fnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, fnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,403
		
		
f1_FuncLabel := RegExReplace(f1_Label, " ", "_")
ff1_Label = %f1_Label%
	If RegExMatch(f1_FuncLabel, "Send")
		{
		f1_SendLabel := % f1_SendKeystroke
		f1_FuncLabel := SubStr(f1_FuncLabel, 1, 8)
		If (f1_OverrideLabel != "")
			ff1_Label = %f1_OverrideLabel%
		f1_CaseTest := RegExMatch(f1_SendLabel, "[A-Z]", f1_UpChar)
		If f1_CaseTest > 0
			{
			f1_ReplaceBrack = `{%f1_UpChar%
			anothers := RegExReplace(f1_SendLabel, f1_UpChar, f1_ReplaceBrack)
				f1_SendLabel = %anothers%}
				
			}
		}
	If f1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f1_OverrideLabel != "")
			ff1_Label = %f1_OverrideLabel%
		}
	If f1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,404
		
f2_FuncLabel := RegExReplace(f2_Label, " ", "_")
ff2_Label = %f2_Label%
	If RegExMatch(f2_FuncLabel, "Send")
		{
		f2_SendLabel := % f2_SendKeystroke
		f2_FuncLabel := SubStr(f2_FuncLabel, 1, 8)
		If (f2_OverrideLabel != "")
			ff2_Label = %f2_OverrideLabel%
		f2_CaseTest := RegExMatch(f2_SendLabel, "[A-Z]", f2_UpChar)
		If f2_CaseTest > 0
			{
			f2_ReplaceBrack = `{%f2_UpChar%
			anothers := RegExReplace(f2_SendLabel, f2_UpChar, f2_ReplaceBrack)
				f2_SendLabel = %anothers%}
				
			}
		}
	If f2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f2_OverrideLabel != "")
			ff2_Label = %f2_OverrideLabel%
		}
	If f2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,405
		
f3_FuncLabel := RegExReplace(f3_Label, " ", "_")
ff3_Label = %f3_Label%
	If RegExMatch(f3_FuncLabel, "Send")
		{
		f3_SendLabel := % f3_SendKeystroke
		f3_FuncLabel := SubStr(f3_FuncLabel, 1, 8)
		If (f3_OverrideLabel != "")
			ff3_Label = %f3_OverrideLabel%
		f3_CaseTest := RegExMatch(f3_SendLabel, "[A-Z]", f3_UpChar)
		If f3_CaseTest > 0
			{
			f3_ReplaceBrack = `{%f3_UpChar%
			anothers := RegExReplace(f3_SendLabel, f3_UpChar, f3_ReplaceBrack)
				f3_SendLabel = %anothers%}
				
			}
		}
	If f3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f3_OverrideLabel != "")
			ff3_Label = %f3_OverrideLabel%
		}
	If f3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,406
		
f4_FuncLabel := RegExReplace(f4_Label, " ", "_")
ff4_Label = %f4_Label%
	If RegExMatch(f4_FuncLabel, "Send")
		{
		f4_SendLabel := % f4_SendKeystroke
		f4_FuncLabel := SubStr(f4_FuncLabel, 1, 8)
		If (f4_OverrideLabel != "")
			ff4_Label = %f4_OverrideLabel%
		f4_CaseTest := RegExMatch(f4_SendLabel, "[A-Z]", f4_UpChar)
		If f4_CaseTest > 0
			{
			f4_ReplaceBrack = `{%f4_UpChar%
			anothers := RegExReplace(f4_SendLabel, f4_UpChar, f4_ReplaceBrack)
				f4_SendLabel = %anothers%}
			}
		}
	If f4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f4_OverrideLabel != "")
			ff4_Label = %f4_OverrideLabel%
		}
	If f4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,407
		
f5_FuncLabel := RegExReplace(f5_Label, " ", "_")
ff5_Label = %f5_Label%
	If RegExMatch(f5_FuncLabel, "Send")
		{
		f5_SendLabel := % f5_SendKeystroke
		f5_FuncLabel := SubStr(f5_FuncLabel, 1, 8)
		If (f5_OverrideLabel != "")
			ff5_Label = %f5_OverrideLabel%
		f5_CaseTest := RegExMatch(f5_SendLabel, "[A-Z]", f5_UpChar)
		If f5_CaseTest > 0
			{
			f5_ReplaceBrack = `{%f5_UpChar%
			anothers := RegExReplace(f5_SendLabel, f5_UpChar, f5_ReplaceBrack)
				f5_SendLabel = %anothers%}
			}
		}
	If f5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f5_OverrideLabel != "")
			ff5_Label = %f5_OverrideLabel%
		}
	If f5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,408
		
f6_FuncLabel := RegExReplace(f6_Label, " ", "_")
ff6_Label = %f6_Label%
	If RegExMatch(f6_FuncLabel, "Send")
		{
		f6_SendLabel := % f6_SendKeystroke
		f6_FuncLabel := SubStr(f6_FuncLabel, 1, 8)
		If (f6_OverrideLabel != "")
			ff6_Label = %f6_OverrideLabel%
		f6_CaseTest := RegExMatch(f6_SendLabel, "[A-Z]", f6_UpChar)
		If f6_CaseTest > 0
			{
			f6_ReplaceBrack = `{%f6_UpChar%
			anothers := RegExReplace(f6_SendLabel, f6_UpChar, f6_ReplaceBrack)
				f6_SendLabel = %anothers%}
			}
		}
	If f6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (f6_OverrideLabel != "")
			ff6_Label = %f6_OverrideLabel%
		}
	If f6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, f6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,409


gnull_FuncLabel := RegExReplace(gnull_Label, " ", "_")
fgnull_Label = %gnull_Label%
	If RegExMatch(gnull_FuncLabel, "Send")
		{
		gnull_SendLabel := % gnull_SendKeystroke
		gnull_FuncLabel := SubStr(gnull_FuncLabel, 1, 8)
		If (gnull_OverrideLabel != "")
			fgnull_Label = %gnull_OverrideLabel%
		gnull_CaseTest := RegExMatch(gnull_SendLabel, "[A-Z]", gnull_UpChar)
		If gnull_CaseTest > 0
			{
			gnull_ReplaceBrack = `{%gnull_UpChar%
			anothers := RegExReplace(gnull_SendLabel, gnull_UpChar, gnull_ReplaceBrack)
				gnull_SendLabel = %anothers%}
				
			}
		}
	If gnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (gnull_OverrideLabel != "")
			fgnull_Label = %gnull_OverrideLabel%
		}
	If gnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, gnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,410
		
		
g1_FuncLabel := RegExReplace(g1_Label, " ", "_")
fg1_Label = %g1_Label%
	If RegExMatch(g1_FuncLabel, "Send")
		{
		g1_SendLabel := % g1_SendKeystroke
		g1_FuncLabel := SubStr(g1_FuncLabel, 1, 8)
		If (g1_OverrideLabel != "")
			fg1_Label = %g1_OverrideLabel%
		g1_CaseTest := RegExMatch(g1_SendLabel, "[A-Z]", g1_UpChar)
		If g1_CaseTest > 0
			{
			g1_ReplaceBrack = `{%g1_UpChar%
			anothers := RegExReplace(g1_SendLabel, g1_UpChar, g1_ReplaceBrack)
				g1_SendLabel = %anothers%}
				
			}
		}
	If g1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g1_OverrideLabel != "")
			fg1_Label = %g1_OverrideLabel%
		}
	If g1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,411
		
g2_FuncLabel := RegExReplace(g2_Label, " ", "_")
fg2_Label = %g2_Label%
	If RegExMatch(g2_FuncLabel, "Send")
		{
		g2_SendLabel := % g2_SendKeystroke
		g2_FuncLabel := SubStr(g2_FuncLabel, 1, 8)
		If (g2_OverrideLabel != "")
			fg2_Label = %g2_OverrideLabel%
		g2_CaseTest := RegExMatch(g2_SendLabel, "[A-Z]", g2_UpChar)
		If g2_CaseTest > 0
			{
			g2_ReplaceBrack = `{%g2_UpChar%
			anothers := RegExReplace(g2_SendLabel, g2_UpChar, g2_ReplaceBrack)
				g2_SendLabel = %anothers%}
				
			}
		}
	If g2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g2_OverrideLabel != "")
			fg2_Label = %g2_OverrideLabel%
		}
	If g2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,412
		
g3_FuncLabel := RegExReplace(g3_Label, " ", "_")
fg3_Label = %g3_Label%
	If RegExMatch(g3_FuncLabel, "Send")
		{
		g3_SendLabel := % g3_SendKeystroke
		g3_FuncLabel := SubStr(g3_FuncLabel, 1, 8)
		If (g3_OverrideLabel != "")
			fg3_Label = %g3_OverrideLabel%
		g3_CaseTest := RegExMatch(g3_SendLabel, "[A-Z]", g3_UpChar)
		If g3_CaseTest > 0
			{
			g3_ReplaceBrack = `{%g3_UpChar%
			anothers := RegExReplace(g3_SendLabel, g3_UpChar, g3_ReplaceBrack)
				g3_SendLabel = %anothers%}
				
			}
		}
	If g3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g3_OverrideLabel != "")
			fg3_Label = %g3_OverrideLabel%
		}
	If g3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,413
		
g4_FuncLabel := RegExReplace(g4_Label, " ", "_")
fg4_Label = %g4_Label%
	If RegExMatch(g4_FuncLabel, "Send")
		{
		g4_SendLabel := % g4_SendKeystroke
		g4_FuncLabel := SubStr(g4_FuncLabel, 1, 8)
		If (g4_OverrideLabel != "")
			fg4_Label = %g4_OverrideLabel%
		g4_CaseTest := RegExMatch(g4_SendLabel, "[A-Z]", g4_UpChar)
		If g4_CaseTest > 0
			{
			g4_ReplaceBrack = `{%g4_UpChar%
			anothers := RegExReplace(g4_SendLabel, g4_UpChar, g4_ReplaceBrack)
				g4_SendLabel = %anothers%}
			}
		}
	If g4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g4_OverrideLabel != "")
			fg4_Label = %g4_OverrideLabel%
		}
	If g4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,414
		
g5_FuncLabel := RegExReplace(g5_Label, " ", "_")
fg5_Label = %g5_Label%
	If RegExMatch(g5_FuncLabel, "Send")
		{
		g5_SendLabel := % g5_SendKeystroke
		g5_FuncLabel := SubStr(g5_FuncLabel, 1, 8)
		If (g5_OverrideLabel != "")
			fg5_Label = %g5_OverrideLabel%
		g5_CaseTest := RegExMatch(g5_SendLabel, "[A-Z]", g5_UpChar)
		If g5_CaseTest > 0
			{
			g5_ReplaceBrack = `{%g5_UpChar%
			anothers := RegExReplace(g5_SendLabel, g5_UpChar, g5_ReplaceBrack)
				g5_SendLabel = %anothers%}
			}
		}
	If g5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g5_OverrideLabel != "")
			fg5_Label = %g5_OverrideLabel%
		}
	If g5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,415
		
g6_FuncLabel := RegExReplace(g6_Label, " ", "_")
fg6_Label = %g6_Label%
	If RegExMatch(g6_FuncLabel, "Send")
		{
		g6_SendLabel := % g6_SendKeystroke
		g6_FuncLabel := SubStr(g6_FuncLabel, 1, 8)
		If (g6_OverrideLabel != "")
			fg6_Label = %g6_OverrideLabel%
		g6_CaseTest := RegExMatch(g6_SendLabel, "[A-Z]", g6_UpChar)
		If g6_CaseTest > 0
			{
			g6_ReplaceBrack = `{%g6_UpChar%
			anothers := RegExReplace(g6_SendLabel, g6_UpChar, g6_ReplaceBrack)
				g6_SendLabel = %anothers%}
			}
		}
	If g6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (g6_OverrideLabel != "")
			fg6_Label = %g6_OverrideLabel%
		}
	If g6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, g6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,416

hnull_FuncLabel := RegExReplace(hnull_Label, " ", "_")
fhnull_Label = %hnull_Label%
	If RegExMatch(hnull_FuncLabel, "Send")
		{
		hnull_SendLabel := % hnull_SendKeystroke
		hnull_FuncLabel := SubStr(hnull_FuncLabel, 1, 8)
		If (hnull_OverrideLabel != "")
			fhnull_Label = %hnull_OverrideLabel%
		hnull_CaseTest := RegExMatch(hnull_SendLabel, "[A-Z]", hnull_UpChar)
		If hnull_CaseTest > 0
			{
			hnull_ReplaceBrack = `{%hnull_UpChar%
			anothers := RegExReplace(hnull_SendLabel, hnull_UpChar, hnull_ReplaceBrack)
				hnull_SendLabel = %anothers%}
				
			}
		}
	If hnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (hnull_OverrideLabel != "")
			fhnull_Label = %hnull_OverrideLabel%
		}
	If hnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, hnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,417
		
		
h1_FuncLabel := RegExReplace(h1_Label, " ", "_")
fh1_Label = %h1_Label%
	If RegExMatch(h1_FuncLabel, "Send")
		{
		h1_SendLabel := % h1_SendKeystroke
		h1_FuncLabel := SubStr(h1_FuncLabel, 1, 8)
		If (h1_OverrideLabel != "")
			fh1_Label = %h1_OverrideLabel%
		h1_CaseTest := RegExMatch(h1_SendLabel, "[A-Z]", h1_UpChar)
		If h1_CaseTest > 0
			{
			h1_ReplaceBrack = `{%h1_UpChar%
			anothers := RegExReplace(h1_SendLabel, h1_UpChar, h1_ReplaceBrack)
				h1_SendLabel = %anothers%}
				
			}
		}
	If h1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h1_OverrideLabel != "")
			fh1_Label = %h1_OverrideLabel%
		}
	If h1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,418
		
h2_FuncLabel := RegExReplace(h2_Label, " ", "_")
fh2_Label = %h2_Label%
	If RegExMatch(h2_FuncLabel, "Send")
		{
		h2_SendLabel := % h2_SendKeystroke
		h2_FuncLabel := SubStr(h2_FuncLabel, 1, 8)
		If (h2_OverrideLabel != "")
			fh2_Label = %h2_OverrideLabel%
		h2_CaseTest := RegExMatch(h2_SendLabel, "[A-Z]", h2_UpChar)
		If h2_CaseTest > 0
			{
			h2_ReplaceBrack = `{%h2_UpChar%
			anothers := RegExReplace(h2_SendLabel, h2_UpChar, h2_ReplaceBrack)
				h2_SendLabel = %anothers%}
				
			}
		}
	If h2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h2_OverrideLabel != "")
			fh2_Label = %h2_OverrideLabel%
		}
	If h2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,419
		
h3_FuncLabel := RegExReplace(h3_Label, " ", "_")
fh3_Label = %h3_Label%
	If RegExMatch(h3_FuncLabel, "Send")
		{
		h3_SendLabel := % h3_SendKeystroke
		h3_FuncLabel := SubStr(h3_FuncLabel, 1, 8)
		If (h3_OverrideLabel != "")
			fh3_Label = %h3_OverrideLabel%
		h3_CaseTest := RegExMatch(h3_SendLabel, "[A-Z]", h3_UpChar)
		If h3_CaseTest > 0
			{
			h3_ReplaceBrack = `{%h3_UpChar%
			anothers := RegExReplace(h3_SendLabel, h3_UpChar, h3_ReplaceBrack)
				h3_SendLabel = %anothers%}
				
			}
		}
	If h3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h3_OverrideLabel != "")
			fh3_Label = %h3_OverrideLabel%
		}
	If h3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,420
		
h4_FuncLabel := RegExReplace(h4_Label, " ", "_")
fh4_Label = %h4_Label%
	If RegExMatch(h4_FuncLabel, "Send")
		{
		h4_SendLabel := % h4_SendKeystroke
		h4_FuncLabel := SubStr(h4_FuncLabel, 1, 8)
		If (h4_OverrideLabel != "")
			fh4_Label = %h4_OverrideLabel%
		h4_CaseTest := RegExMatch(h4_SendLabel, "[A-Z]", h4_UpChar)
		If h4_CaseTest > 0
			{
			h4_ReplaceBrack = `{%h4_UpChar%
			anothers := RegExReplace(h4_SendLabel, h4_UpChar, h4_ReplaceBrack)
				h4_SendLabel = %anothers%}
			}
		}
	If h4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h4_OverrideLabel != "")
			fh4_Label = %h4_OverrideLabel%
		}
	If h4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,421
		
h5_FuncLabel := RegExReplace(h5_Label, " ", "_")
fh5_Label = %h5_Label%
	If RegExMatch(h5_FuncLabel, "Send")
		{
		h5_SendLabel := % h5_SendKeystroke
		h5_FuncLabel := SubStr(h5_FuncLabel, 1, 8)
		If (h5_OverrideLabel != "")
			fh5_Label = %h5_OverrideLabel%
		h5_CaseTest := RegExMatch(h5_SendLabel, "[A-Z]", h5_UpChar)
		If h5_CaseTest > 0
			{
			h5_ReplaceBrack = `{%h5_UpChar%
			anothers := RegExReplace(h5_SendLabel, h5_UpChar, h5_ReplaceBrack)
				h5_SendLabel = %anothers%}
			}
		}
	If h5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h5_OverrideLabel != "")
			fh5_Label = %h5_OverrideLabel%
		}
	If h5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,422
		
h6_FuncLabel := RegExReplace(h6_Label, " ", "_")
fh6_Label = %h6_Label%
	If RegExMatch(h6_FuncLabel, "Send")
		{
		h6_SendLabel := % h6_SendKeystroke
		h6_FuncLabel := SubStr(h6_FuncLabel, 1, 8)
		If (h6_OverrideLabel != "")
			fh6_Label = %h6_OverrideLabel%
		h6_CaseTest := RegExMatch(h6_SendLabel, "[A-Z]", h6_UpChar)
		If h6_CaseTest > 0
			{
			h6_ReplaceBrack = `{%h6_UpChar%
			anothers := RegExReplace(h6_SendLabel, h6_UpChar, h6_ReplaceBrack)
				h6_SendLabel = %anothers%}
			}
		}
	If h6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (h6_OverrideLabel != "")
			fh6_Label = %h6_OverrideLabel%
		}
	If h6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, h6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,423

inull_FuncLabel := RegExReplace(inull_Label, " ", "_")
finull_Label = %inull_Label%
	If RegExMatch(inull_FuncLabel, "Send")
		{
		inull_SendLabel := % inull_SendKeystroke
		inull_FuncLabel := SubStr(inull_FuncLabel, 1, 8)
		If (inull_OverrideLabel != "")
			finull_Label = %inull_OverrideLabel%
		inull_CaseTest := RegExMatch(inull_SendLabel, "[A-Z]", inull_UpChar)
		If inull_CaseTest > 0
			{
			inull_ReplaceBrack = `{%inull_UpChar%
			anothers := RegExReplace(inull_SendLabel, inull_UpChar, inull_ReplaceBrack)
				inull_SendLabel = %anothers%}
				
			}
		}
	If inull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (inull_OverrideLabel != "")
			finull_Label = %inull_OverrideLabel%
		}
	If inull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, inull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,424
		
		
i1_FuncLabel := RegExReplace(i1_Label, " ", "_")
fi1_Label = %i1_Label%
	If RegExMatch(i1_FuncLabel, "Send")
		{
		i1_SendLabel := % i1_SendKeystroke
		i1_FuncLabel := SubStr(i1_FuncLabel, 1, 8)
		If (i1_OverrideLabel != "")
			fi1_Label = %i1_OverrideLabel%
		i1_CaseTest := RegExMatch(i1_SendLabel, "[A-Z]", i1_UpChar)
		If i1_CaseTest > 0
			{
			i1_ReplaceBrack = `{%i1_UpChar%
			anothers := RegExReplace(i1_SendLabel, i1_UpChar, i1_ReplaceBrack)
				i1_SendLabel = %anothers%}
				
			}
		}
	If i1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i1_OverrideLabel != "")
			fi1_Label = %i1_OverrideLabel%
		}
	If i1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,425
		
i2_FuncLabel := RegExReplace(i2_Label, " ", "_")
fi2_Label = %i2_Label%
	If RegExMatch(i2_FuncLabel, "Send")
		{
		i2_SendLabel := % i2_SendKeystroke
		i2_FuncLabel := SubStr(i2_FuncLabel, 1, 8)
		If (i2_OverrideLabel != "")
			fi2_Label = %i2_OverrideLabel%
		i2_CaseTest := RegExMatch(i2_SendLabel, "[A-Z]", i2_UpChar)
		If i2_CaseTest > 0
			{
			i2_ReplaceBrack = `{%i2_UpChar%
			anothers := RegExReplace(i2_SendLabel, i2_UpChar, i2_ReplaceBrack)
				i2_SendLabel = %anothers%}
				
			}
		}
	If i2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i2_OverrideLabel != "")
			fi2_Label = %i2_OverrideLabel%
		}
	If i2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,426
		
i3_FuncLabel := RegExReplace(i3_Label, " ", "_")
fi3_Label = %i3_Label%
	If RegExMatch(i3_FuncLabel, "Send")
		{
		i3_SendLabel := % i3_SendKeystroke
		i3_FuncLabel := SubStr(i3_FuncLabel, 1, 8)
		If (i3_OverrideLabel != "")
			fi3_Label = %i3_OverrideLabel%
		i3_CaseTest := RegExMatch(i3_SendLabel, "[A-Z]", i3_UpChar)
		If i3_CaseTest > 0
			{
			i3_ReplaceBrack = `{%i3_UpChar%
			anothers := RegExReplace(i3_SendLabel, i3_UpChar, i3_ReplaceBrack)
				i3_SendLabel = %anothers%}
				
			}
		}
	If i3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i3_OverrideLabel != "")
			fi3_Label = %i3_OverrideLabel%
		}
	If i3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,427
		
i4_FuncLabel := RegExReplace(i4_Label, " ", "_")
fi4_Label = %i4_Label%
	If RegExMatch(i4_FuncLabel, "Send")
		{
		i4_SendLabel := % i4_SendKeystroke
		i4_FuncLabel := SubStr(i4_FuncLabel, 1, 8)
		If (i4_OverrideLabel != "")
			fi4_Label = %i4_OverrideLabel%
		i4_CaseTest := RegExMatch(i4_SendLabel, "[A-Z]", i4_UpChar)
		If i4_CaseTest > 0
			{
			i4_ReplaceBrack = `{%i4_UpChar%
			anothers := RegExReplace(i4_SendLabel, i4_UpChar, i4_ReplaceBrack)
				i4_SendLabel = %anothers%}
			}
		}
	If i4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i4_OverrideLabel != "")
			fi4_Label = %i4_OverrideLabel%
		}
	If i4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,428
		
i5_FuncLabel := RegExReplace(i5_Label, " ", "_")
fi5_Label = %i5_Label%
	If RegExMatch(i5_FuncLabel, "Send")
		{
		i5_SendLabel := % i5_SendKeystroke
		i5_FuncLabel := SubStr(i5_FuncLabel, 1, 8)
		If (i5_OverrideLabel != "")
			fi5_Label = %i5_OverrideLabel%
		i5_CaseTest := RegExMatch(i5_SendLabel, "[A-Z]", i5_UpChar)
		If i5_CaseTest > 0
			{
			i5_ReplaceBrack = `{%i5_UpChar%
			anothers := RegExReplace(i5_SendLabel, i5_UpChar, i5_ReplaceBrack)
				i5_SendLabel = %anothers%}
			}
		}
	If i5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i5_OverrideLabel != "")
			fi5_Label = %i5_OverrideLabel%
		}
	If i5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,429
		
i6_FuncLabel := RegExReplace(i6_Label, " ", "_")
fi6_Label = %i6_Label%
	If RegExMatch(i6_FuncLabel, "Send")
		{
		i6_SendLabel := % i6_SendKeystroke
		i6_FuncLabel := SubStr(i6_FuncLabel, 1, 8)
		If (i6_OverrideLabel != "")
			fi6_Label = %i6_OverrideLabel%
		i6_CaseTest := RegExMatch(i6_SendLabel, "[A-Z]", i6_UpChar)
		If i6_CaseTest > 0
			{
			i6_ReplaceBrack = `{%i6_UpChar%
			anothers := RegExReplace(i6_SendLabel, i6_UpChar, i6_ReplaceBrack)
				i6_SendLabel = %anothers%}
			}
		}
	If i6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (i6_OverrideLabel != "")
			fi6_Label = %i6_OverrideLabel%
		}
	If i6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, i6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,430

jnull_FuncLabel := RegExReplace(jnull_Label, " ", "_")
fjnull_Label = %jnull_Label%
	If RegExMatch(jnull_FuncLabel, "Send")
		{
		jnull_SendLabel := % jnull_SendKeystroke
		jnull_FuncLabel := SubStr(jnull_FuncLabel, 1, 8)
		If (jnull_OverrideLabel != "")
			fjnull_Label = %jnull_OverrideLabel%
		jnull_CaseTest := RegExMatch(jnull_SendLabel, "[A-Z]", jnull_UpChar)
		If jnull_CaseTest > 0
			{
			jnull_ReplaceBrack = `{%jnull_UpChar%
			anothers := RegExReplace(jnull_SendLabel, jnull_UpChar, jnull_ReplaceBrack)
				jnull_SendLabel = %anothers%}
				
			}
		}
	If jnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (jnull_OverrideLabel != "")
			fjnull_Label = %jnull_OverrideLabel%
		}
	If jnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, jnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,431
		
		
j1_FuncLabel := RegExReplace(j1_Label, " ", "_")
fj1_Label = %j1_Label%
	If RegExMatch(j1_FuncLabel, "Send")
		{
		j1_SendLabel := % j1_SendKeystroke
		j1_FuncLabel := SubStr(j1_FuncLabel, 1, 8)
		If (j1_OverrideLabel != "")
			fj1_Label = %j1_OverrideLabel%
		j1_CaseTest := RegExMatch(j1_SendLabel, "[A-Z]", j1_UpChar)
		If j1_CaseTest > 0
			{
			j1_ReplaceBrack = `{%j1_UpChar%
			anothers := RegExReplace(j1_SendLabel, j1_UpChar, j1_ReplaceBrack)
				j1_SendLabel = %anothers%}
				
			}
		}
	If j1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j1_OverrideLabel != "")
			fj1_Label = %j1_OverrideLabel%
		}
	If j1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,432
		
j2_FuncLabel := RegExReplace(j2_Label, " ", "_")
fj2_Label = %j2_Label%
	If RegExMatch(j2_FuncLabel, "Send")
		{
		j2_SendLabel := % j2_SendKeystroke
		j2_FuncLabel := SubStr(j2_FuncLabel, 1, 8)
		If (j2_OverrideLabel != "")
			fj2_Label = %j2_OverrideLabel%
		j2_CaseTest := RegExMatch(j2_SendLabel, "[A-Z]", j2_UpChar)
		If j2_CaseTest > 0
			{
			j2_ReplaceBrack = `{%j2_UpChar%
			anothers := RegExReplace(j2_SendLabel, j2_UpChar, j2_ReplaceBrack)
				j2_SendLabel = %anothers%}
				
			}
		}
	If j2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j2_OverrideLabel != "")
			fj2_Label = %j2_OverrideLabel%
		}
	If j2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,433
		
j3_FuncLabel := RegExReplace(j3_Label, " ", "_")
fj3_Label = %j3_Label%
	If RegExMatch(j3_FuncLabel, "Send")
		{
		j3_SendLabel := % j3_SendKeystroke
		j3_FuncLabel := SubStr(j3_FuncLabel, 1, 8)
		If (j3_OverrideLabel != "")
			fj3_Label = %j3_OverrideLabel%
		j3_CaseTest := RegExMatch(j3_SendLabel, "[A-Z]", j3_UpChar)
		If j3_CaseTest > 0
			{
			j3_ReplaceBrack = `{%j3_UpChar%
			anothers := RegExReplace(j3_SendLabel, j3_UpChar, j3_ReplaceBrack)
				j3_SendLabel = %anothers%}
				
			}
		}
	If j3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j3_OverrideLabel != "")
			fj3_Label = %j3_OverrideLabel%
		}
	If j3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,434
		
j4_FuncLabel := RegExReplace(j4_Label, " ", "_")
fj4_Label = %j4_Label%
	If RegExMatch(j4_FuncLabel, "Send")
		{
		j4_SendLabel := % j4_SendKeystroke
		j4_FuncLabel := SubStr(j4_FuncLabel, 1, 8)
		If (j4_OverrideLabel != "")
			fj4_Label = %j4_OverrideLabel%
		j4_CaseTest := RegExMatch(j4_SendLabel, "[A-Z]", j4_UpChar)
		If j4_CaseTest > 0
			{
			j4_ReplaceBrack = `{%j4_UpChar%
			anothers := RegExReplace(j4_SendLabel, j4_UpChar, j4_ReplaceBrack)
				j4_SendLabel = %anothers%}
			}
		}
	If j4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j4_OverrideLabel != "")
			fj4_Label = %j4_OverrideLabel%
		}
	If j4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,435
		
j5_FuncLabel := RegExReplace(j5_Label, " ", "_")
fj5_Label = %j5_Label%
	If RegExMatch(j5_FuncLabel, "Send")
		{
		j5_SendLabel := % j5_SendKeystroke
		j5_FuncLabel := SubStr(j5_FuncLabel, 1, 8)
		If (j5_OverrideLabel != "")
			fj5_Label = %j5_OverrideLabel%
		j5_CaseTest := RegExMatch(j5_SendLabel, "[A-Z]", j5_UpChar)
		If j5_CaseTest > 0
			{
			j5_ReplaceBrack = `{%j5_UpChar%
			anothers := RegExReplace(j5_SendLabel, j5_UpChar, j5_ReplaceBrack)
				j5_SendLabel = %anothers%}
			}
		}
	If j5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j5_OverrideLabel != "")
			fj5_Label = %j5_OverrideLabel%
		}
	If j5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,436
		
j6_FuncLabel := RegExReplace(j6_Label, " ", "_")
fj6_Label = %j6_Label%
	If RegExMatch(j6_FuncLabel, "Send")
		{
		j6_SendLabel := % j6_SendKeystroke
		j6_FuncLabel := SubStr(j6_FuncLabel, 1, 8)
		If (j6_OverrideLabel != "")
			fj6_Label = %j6_OverrideLabel%
		j6_CaseTest := RegExMatch(j6_SendLabel, "[A-Z]", j6_UpChar)
		If j6_CaseTest > 0
			{
			j6_ReplaceBrack = `{%j6_UpChar%
			anothers := RegExReplace(j6_SendLabel, j6_UpChar, j6_ReplaceBrack)
				j6_SendLabel = %anothers%}
			}
		}
	If j6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (j6_OverrideLabel != "")
			fj6_Label = %j6_OverrideLabel%
		}
	If j6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, j6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,437

knull_FuncLabel := RegExReplace(knull_Label, " ", "_")
fknull_Label = %knull_Label%
	If RegExMatch(knull_FuncLabel, "Send")
		{
		knull_SendLabel := % knull_SendKeystroke
		knull_FuncLabel := SubStr(knull_FuncLabel, 1, 8)
		If (knull_OverrideLabel != "")
			fknull_Label = %knull_OverrideLabel%
		knull_CaseTest := RegExMatch(knull_SendLabel, "[A-Z]", knull_UpChar)
		If knull_CaseTest > 0
			{
			knull_ReplaceBrack = `{%knull_UpChar%
			anothers := RegExReplace(knull_SendLabel, knull_UpChar, knull_ReplaceBrack)
				knull_SendLabel = %anothers%}
				
			}
		}
	If knull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (knull_OverrideLabel != "")
			fknull_Label = %knull_OverrideLabel%
		}
	If knull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, knull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,438
		
		
k1_FuncLabel := RegExReplace(k1_Label, " ", "_")
fk1_Label = %k1_Label%
	If RegExMatch(k1_FuncLabel, "Send")
		{
		k1_SendLabel := % k1_SendKeystroke
		k1_FuncLabel := SubStr(k1_FuncLabel, 1, 8)
		If (k1_OverrideLabel != "")
			fk1_Label = %k1_OverrideLabel%
		k1_CaseTest := RegExMatch(k1_SendLabel, "[A-Z]", k1_UpChar)
		If k1_CaseTest > 0
			{
			k1_ReplaceBrack = `{%k1_UpChar%
			anothers := RegExReplace(k1_SendLabel, k1_UpChar, k1_ReplaceBrack)
				k1_SendLabel = %anothers%}
				
			}
		}
	If k1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k1_OverrideLabel != "")
			fk1_Label = %k1_OverrideLabel%
		}
	If k1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,439
		
k2_FuncLabel := RegExReplace(k2_Label, " ", "_")
fk2_Label = %k2_Label%
	If RegExMatch(k2_FuncLabel, "Send")
		{
		k2_SendLabel := % k2_SendKeystroke
		k2_FuncLabel := SubStr(k2_FuncLabel, 1, 8)
		If (k2_OverrideLabel != "")
			fk2_Label = %k2_OverrideLabel%
		k2_CaseTest := RegExMatch(k2_SendLabel, "[A-Z]", k2_UpChar)
		If k2_CaseTest > 0
			{
			k2_ReplaceBrack = `{%k2_UpChar%
			anothers := RegExReplace(k2_SendLabel, k2_UpChar, k2_ReplaceBrack)
				k2_SendLabel = %anothers%}
				
			}
		}
	If k2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k2_OverrideLabel != "")
			fk2_Label = %k2_OverrideLabel%
		}
	If k2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,440
		
k3_FuncLabel := RegExReplace(k3_Label, " ", "_")
fk3_Label = %k3_Label%
	If RegExMatch(k3_FuncLabel, "Send")
		{
		k3_SendLabel := % k3_SendKeystroke
		k3_FuncLabel := SubStr(k3_FuncLabel, 1, 8)
		If (k3_OverrideLabel != "")
			fk3_Label = %k3_OverrideLabel%
		k3_CaseTest := RegExMatch(k3_SendLabel, "[A-Z]", k3_UpChar)
		If k3_CaseTest > 0
			{
			k3_ReplaceBrack = `{%k3_UpChar%
			anothers := RegExReplace(k3_SendLabel, k3_UpChar, k3_ReplaceBrack)
				k3_SendLabel = %anothers%}
				
			}
		}
	If k3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k3_OverrideLabel != "")
			fk3_Label = %k3_OverrideLabel%
		}
	If k3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,441
		
k4_FuncLabel := RegExReplace(k4_Label, " ", "_")
fk4_Label = %k4_Label%
	If RegExMatch(k4_FuncLabel, "Send")
		{
		k4_SendLabel := % k4_SendKeystroke
		k4_FuncLabel := SubStr(k4_FuncLabel, 1, 8)
		If (k4_OverrideLabel != "")
			fk4_Label = %k4_OverrideLabel%
		k4_CaseTest := RegExMatch(k4_SendLabel, "[A-Z]", k4_UpChar)
		If k4_CaseTest > 0
			{
			k4_ReplaceBrack = `{%k4_UpChar%
			anothers := RegExReplace(k4_SendLabel, k4_UpChar, k4_ReplaceBrack)
				k4_SendLabel = %anothers%}
			}
		}
	If k4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k4_OverrideLabel != "")
			fk4_Label = %k4_OverrideLabel%
		}
	If k4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,442
		
k5_FuncLabel := RegExReplace(k5_Label, " ", "_")
fk5_Label = %k5_Label%
	If RegExMatch(k5_FuncLabel, "Send")
		{
		k5_SendLabel := % k5_SendKeystroke
		k5_FuncLabel := SubStr(k5_FuncLabel, 1, 8)
		If (k5_OverrideLabel != "")
			fk5_Label = %k5_OverrideLabel%
		k5_CaseTest := RegExMatch(k5_SendLabel, "[A-Z]", k5_UpChar)
		If k5_CaseTest > 0
			{
			k5_ReplaceBrack = `{%k5_UpChar%
			anothers := RegExReplace(k5_SendLabel, k5_UpChar, k5_ReplaceBrack)
				k5_SendLabel = %anothers%}
			}
		}
	If k5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k5_OverrideLabel != "")
			fk5_Label = %k5_OverrideLabel%
		}
	If k5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,443
		
k6_FuncLabel := RegExReplace(k6_Label, " ", "_")
fk6_Label = %k6_Label%
	If RegExMatch(k6_FuncLabel, "Send")
		{
		k6_SendLabel := % k6_SendKeystroke
		k6_FuncLabel := SubStr(k6_FuncLabel, 1, 8)
		If (k6_OverrideLabel != "")
			fk6_Label = %k6_OverrideLabel%
		k6_CaseTest := RegExMatch(k6_SendLabel, "[A-Z]", k6_UpChar)
		If k6_CaseTest > 0
			{
			k6_ReplaceBrack = `{%k6_UpChar%
			anothers := RegExReplace(k6_SendLabel, k6_UpChar, k6_ReplaceBrack)
				k6_SendLabel = %anothers%}
			}
		}
	If k6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (k6_OverrideLabel != "")
			fk6_Label = %k6_OverrideLabel%
		}
	If k6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, k6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,444

lnull_FuncLabel := RegExReplace(lnull_Label, " ", "_")
flnull_Label = %lnull_Label%
	If RegExMatch(lnull_FuncLabel, "Send")
		{
		lnull_SendLabel := % lnull_SendKeystroke
		lnull_FuncLabel := SubStr(lnull_FuncLabel, 1, 8)
		If (lnull_OverrideLabel != "")
			flnull_Label = %lnull_OverrideLabel%
		lnull_CaseTest := RegExMatch(lnull_SendLabel, "[A-Z]", lnull_UpChar)
		If lnull_CaseTest > 0
			{
			lnull_ReplaceBrack = `{%lnull_UpChar%
			anothers := RegExReplace(lnull_SendLabel, lnull_UpChar, lnull_ReplaceBrack)
				lnull_SendLabel = %anothers%}
				
			}
		}
	If lnull_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (lnull_OverrideLabel != "")
			flnull_Label = %lnull_OverrideLabel%
		}
	If lnull_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, lnull_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,445
		
		
l1_FuncLabel := RegExReplace(l1_Label, " ", "_")
fl1_Label = %l1_Label%
	If RegExMatch(l1_FuncLabel, "Send")
		{
		l1_SendLabel := % l1_SendKeystroke
		l1_FuncLabel := SubStr(l1_FuncLabel, 1, 8)
		If (l1_OverrideLabel != "")
			fl1_Label = %l1_OverrideLabel%
		l1_CaseTest := RegExMatch(l1_SendLabel, "[A-Z]", l1_UpChar)
		If l1_CaseTest > 0
			{
			l1_ReplaceBrack = `{%l1_UpChar%
			anothers := RegExReplace(l1_SendLabel, l1_UpChar, l1_ReplaceBrack)
				l1_SendLabel = %anothers%}
				
			}
		}
	If l1_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l1_OverrideLabel != "")
			fl1_Label = %l1_OverrideLabel%
		}
	If l1_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l1_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,446
		
l2_FuncLabel := RegExReplace(l2_Label, " ", "_")
fl2_Label = %l2_Label%
	If RegExMatch(l2_FuncLabel, "Send")
		{
		l2_SendLabel := % l2_SendKeystroke
		l2_FuncLabel := SubStr(l2_FuncLabel, 1, 8)
		If (l2_OverrideLabel != "")
			fl2_Label = %l2_OverrideLabel%
		l2_CaseTest := RegExMatch(l2_SendLabel, "[A-Z]", l2_UpChar)
		If l2_CaseTest > 0
			{
			l2_ReplaceBrack = `{%l2_UpChar%
			anothers := RegExReplace(l2_SendLabel, l2_UpChar, l2_ReplaceBrack)
				l2_SendLabel = %anothers%}
				
			}
		}
	If l2_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l2_OverrideLabel != "")
			fl2_Label = %l2_OverrideLabel%
		}
	If l2_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l2_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,447
		
l3_FuncLabel := RegExReplace(l3_Label, " ", "_")
fl3_Label = %l3_Label%
	If RegExMatch(l3_FuncLabel, "Send")
		{
		l3_SendLabel := % l3_SendKeystroke
		l3_FuncLabel := SubStr(l3_FuncLabel, 1, 8)
		If (l3_OverrideLabel != "")
			fl3_Label = %l3_OverrideLabel%
		l3_CaseTest := RegExMatch(l3_SendLabel, "[A-Z]", l3_UpChar)
		If l3_CaseTest > 0
			{
			l3_ReplaceBrack = `{%l3_UpChar%
			anothers := RegExReplace(l3_SendLabel, l3_UpChar, l3_ReplaceBrack)
				l3_SendLabel = %anothers%}
				
			}
		}
	If l3_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l3_OverrideLabel != "")
			fl3_Label = %l3_OverrideLabel%
		}
	If l3_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l3_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,448
		
l4_FuncLabel := RegExReplace(l4_Label, " ", "_")
fl4_Label = %l4_Label%
	If RegExMatch(l4_FuncLabel, "Send")
		{
		l4_SendLabel := % l4_SendKeystroke
		l4_FuncLabel := SubStr(l4_FuncLabel, 1, 8)
		If (l4_OverrideLabel != "")
			fl4_Label = %l4_OverrideLabel%
		l4_CaseTest := RegExMatch(l4_SendLabel, "[A-Z]", l4_UpChar)
		If l4_CaseTest > 0
			{
			l4_ReplaceBrack = `{%l4_UpChar%
			anothers := RegExReplace(l4_SendLabel, l4_UpChar, l4_ReplaceBrack)
				l4_SendLabel = %anothers%}
			}
		}
	If l4_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l4_OverrideLabel != "")
			fl4_Label = %l4_OverrideLabel%
		}
	If l4_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l4_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,449
		
l5_FuncLabel := RegExReplace(l5_Label, " ", "_")
fl5_Label = %l5_Label%
	If RegExMatch(l5_FuncLabel, "Send")
		{
		l5_SendLabel := % l5_SendKeystroke
		l5_FuncLabel := SubStr(l5_FuncLabel, 1, 8)
		If (l5_OverrideLabel != "")
			fl5_Label = %l5_OverrideLabel%
		l5_CaseTest := RegExMatch(l5_SendLabel, "[A-Z]", l5_UpChar)
		If l5_CaseTest > 0
			{
			l5_ReplaceBrack = `{%l5_UpChar%
			anothers := RegExReplace(l5_SendLabel, l5_UpChar, l5_ReplaceBrack)
				l5_SendLabel = %anothers%}
			}
		}
	If l5_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l5_OverrideLabel != "")
			fl5_Label = %l5_OverrideLabel%
		}
	If l5_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l5_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,450
		
l6_FuncLabel := RegExReplace(l6_Label, " ", "_")
fl6_Label = %l6_Label%
	If RegExMatch(l6_FuncLabel, "Send")
		{
		l6_SendLabel := % l6_SendKeystroke
		l6_FuncLabel := SubStr(l6_FuncLabel, 1, 8)
		If (l6_OverrideLabel != "")
			fl6_Label = %l6_OverrideLabel%
		l6_CaseTest := RegExMatch(l6_SendLabel, "[A-Z]", l6_UpChar)
		If l6_CaseTest > 0
			{
			l6_ReplaceBrack = `{%l6_UpChar%
			anothers := RegExReplace(l6_SendLabel, l6_UpChar, l6_ReplaceBrack)
				l6_SendLabel = %anothers%}
			}
		}
	If l6_FuncLabel in Run_Program,Left_Click,Right_Click,Middle_Click
		{
		If (l6_OverrideLabel != "")
			fl6_Label = %l6_OverrideLabel%
		}
	If l6_FuncLabel in Left_Click,Right_Click,Middle_Click
		FileReadLine, l6_ClickMods, %A_ScriptDir%\Resources\settingsfile.txt,451


FileReadLine, aPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 464
FileReadLine, bPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 465
FileReadLine, cPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 466
FileReadLine, dPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 467
FileReadLine, ePieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 468
FileReadLine, fPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 469
FileReadLine, gPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 470
FileReadLine, hPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 471
FileReadLine, iPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 472
FileReadLine, jPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 473
FileReadLine, lPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 474
FileReadLine, kPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 475


; Input Hotkey Modifier options, 000, 100, 010, 001, 110, 011, 101, 111
; option 1:		000 = no mods
; option 2: 	100 = ctrl 
; option 3: 	010 = shift
; option 4: 	001 = alt 
; option 5: 	110 = ctrl and shift 
; option 6: 	011 = shift and alt
; option 7: 	101 = ctrl and alt
; option 8: 	111 = ctrl shift and alt


; FileReadLine, ActiveWindowClass, %A_ScriptDir%\Resources\WindowClassName.txt,451 

aPieHotkeyMod_Ctrl = ""
bPieHotkeyMod_Ctrl = ""
cPieHotkeyMod_Ctrl = ""
dPieHotkeyMod_Ctrl = ""
ePieHotkeyMod_Ctrl = ""
fPieHotkeyMod_Ctrl = ""
gPieHotkeyMod_Ctrl = ""
hPieHotkeyMod_Ctrl = ""
iPieHotkeyMod_Ctrl = ""
jPieHotkeyMod_Ctrl = ""
kPieHotkeyMod_Ctrl = ""
lPieHotkeyMod_Ctrl = ""

aPieHotkeyMod_Shift = ""
bPieHotkeyMod_Shift = ""
cPieHotkeyMod_Shift = ""
dPieHotkeyMod_Shift = ""
ePieHotkeyMod_Shift = ""
fPieHotkeyMod_Shift = ""
gPieHotkeyMod_Shift = ""
hPieHotkeyMod_Shift = ""
iPieHotkeyMod_Shift = ""
jPieHotkeyMod_Shift = ""
kPieHotkeyMod_Shift = ""
lPieHotkeyMod_Shift = ""

aPieHotkeyMod_Alt = ""
bPieHotkeyMod_Alt = ""
cPieHotkeyMod_Alt = ""
dPieHotkeyMod_Alt = ""
ePieHotkeyMod_Alt = ""
fPieHotkeyMod_Alt = ""
gPieHotkeyMod_Alt = ""
hPieHotkeyMod_Alt = ""
iPieHotkeyMod_Alt = ""
jPieHotkeyMod_Alt = ""
kPieHotkeyMod_Alt = ""
lPieHotkeyMod_Alt = ""

#If (MethodtoShift<4) && (PieNumberSetting > 0) ;For PieModes 1 through 4
UsePieActivateKey = $*%PieActivateKey% 
UsePieDeactivateKey = $*%PieActivateKey% up

#If (MethodtoShift=5) && (aPieNumberSetting = 1)
if (aPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (aPieHotkey_Modifiers = 000)
		{
		aPieActivateKey =  ~$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 100)
		{
		aPieHotkeyMod_Ctrl := "Control" 
		aPieActivateKey =  ~^$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 010)
		{
		aPieHotkeyMod_Shift := "Shift" 
		aPieActivateKey =  ~+$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 001)
		{
		aPieHotkeyMod_Alt := "Alt"
		aPieActivateKey =  ~!$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 110)
		{
		aPieHotkeyMod_Ctrl := "Control"
		aPieHotkeyMod_Shift := "Shift" 
		aPieActivateKey =  ~^+$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 011)
		{
		aPieHotkeyMod_Shift := "Shift"
		aPieHotkeyMod_Alt := "Alt"
		aPieActivateKey =  ~+!$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 101)
		{
		aPieHotkeyMod_Ctrl := "Control" 
		aPieHotkeyMod_Alt := "Alt"
		aPieActivateKey =  ~^!$%aPieHotkey_Input%
		}
	if (aPieHotkey_Modifiers = 111)
		{
		aPieHotkeyMod_Ctrl := "Control" 
		aPieHotkeyMod_Shift := "Shift"
		aPieHotkeyMod_Alt := "Alt"
		aPieActivateKey =  ~^+!$%aPieHotkey_Input%
		}
	}
Else
	{
	aPieActivateKey =  ~%aPieHotkey_Input%
	}
UseaPieDeactivateKey = $%aPieActivateKey% up

#If (MethodtoShift=5) && (bPieNumberSetting = 1) 
if (bPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (bPieHotkey_Modifiers = 000)
		{
		bPieActivateKey =  ~$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 100)
		{
		bPieHotkeyMod_Ctrl := "Control"
		bPieActivateKey =  ~^$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 010)
		{
		bPieHotkeyMod_Shift := "Shift"
		bPieActivateKey =  ~+$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 001)
		{
		bPieHotkeyMod_Alt := "Alt"
		bPieActivateKey =  ~!$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 110)
		{
		bPieHotkeyMod_Ctrl := "Control"
		bPieHotkeyMod_Shift := "Shift"
		bPieActivateKey =  ~^+$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 011)
		{
		bPieHotkeyMod_Shift := "Shift"
		bPieHotkeyMod_Alt := "Alt"
		bPieActivateKey =  ~+!$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 101)
		{
		bPieHotkeyMod_Ctrl := "Control"
		bPieHotkeyMod_Alt := "Alt"
		bPieActivateKey =  ~^!$%bPieHotkey_Input%
		}
	if (bPieHotkey_Modifiers = 111)
		{
		bPieHotkeyMod_Ctrl := "Control"
		bPieHotkeyMod_Shift := "Shift"
		bPieHotkeyMod_Alt := "Alt"
		bPieActivateKey =  ~^+!$%bPieHotkey_Input%
		}
	}
Else
	{
	bPieActivateKey = %bPieHotkey_Input%
	}
UsebPieDeactivateKey = $%bPieActivateKey% up 

#If (MethodtoShift=5) && (cPieNumberSetting = 1)
if (cPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (cPieHotkey_Modifiers = 000)
		{
		cPieActivateKey =  ~$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 100)
		{
		cPieHotkeyMod_Ctrl := "Control"
		cPieActivateKey =  ~^$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 010)
		{
		cPieHotkeyMod_Shift := "Shift"
		cPieActivateKey =  ~+$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 001)
		{
		cPieHotkeyMod_Alt := "Alt"
		cPieActivateKey =  ~!$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 110)
		{
		cPieHotkeyMod_Ctrl := "Control"
		cPieHotkeyMod_Shift := "Shift"
		cPieActivateKey =  ~^+$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 011)
		{
		cPieHotkeyMod_Shift := "Shift"
		cPieHotkeyMod_Alt := "Alt"
		cPieActivateKey =  ~+!$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 101)
		{
		cPieHotkeyMod_Ctrl := "Control"
		cPieHotkeyMod_Alt := "Alt"
		cPieActivateKey =  ~^!$%cPieHotkey_Input%
		}
	if (cPieHotkey_Modifiers = 111)
		{
		cPieHotkeyMod_Ctrl := "Control"
		cPieHotkeyMod_Shift := "Shift"
		cPieHotkeyMod_Alt := "Alt"
		cPieActivateKey =  ~^+!$%cPieHotkey_Input%
		}
	}
Else
	{
	cPieActivateKey =  ~%cPieHotkey_Input%
	}
UsecPieDeactivateKey = $*%cPieActivateKey% up 

#If (MethodtoShift=5) && (dPieNumberSetting = 1) 
if (dPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (dPieHotkey_Modifiers = 000)
		{
		dPieActivateKey =  ~$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 100)
		{
		dPieHotkeyMod_Ctrl := "Control"
		dPieActivateKey =  ~^$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 010)
		{
		dPieHotkeyMod_Shift := "Shift"
		dPieActivateKey =  ~+$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 001)
		{
		dPieHotkeyMod_Alt := "Alt"
		dPieActivateKey =  ~!$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 110)
		{
		dPieHotkeyMod_Ctrl := "Control"
		dPieHotkeyMod_Shift := "Shift"
		dPieActivateKey =  ~^+$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 011)
		{
		dPieHotkeyMod_Shift := "Shift"
		dPieHotkeyMod_Alt := "Alt"
		dPieActivateKey =  ~+!$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 101)
		{
		dPieHotkeyMod_Ctrl := "Control"
		dPieHotkeyMod_Alt := "Alt"
		dPieActivateKey =  ~^!$%dPieHotkey_Input%
		}
	if (dPieHotkey_Modifiers = 111)
		{
		dPieHotkeyMod_Ctrl := "Control"
		dPieHotkeyMod_Shift := "Shift"
		dPieHotkeyMod_Alt := "Alt"
		dPieActivateKey =  ~^+!$%dPieHotkey_Input%
		}
	}
Else
	{
	dPieActivateKey =  ~%dPieHotkey_Input%
	}
UsedPieDeactivateKey = $*%dPieActivateKey% up 

#If (MethodtoShift=5) && (ePieNumberSetting = 1) 
if (ePieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (ePieHotkey_Modifiers = 000)
		{
		ePieActivateKey =  ~$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 100)
		{
		ePieHotkeyMod_Ctrl := "Control"
		ePieActivateKey =  ~^$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 010)
		{
		ePieHotkeyMod_Shift := "Shift"
		ePieActivateKey =  ~+$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 001)
		{
		ePieHotkeyMod_Alt := "Alt"
		ePieActivateKey =  ~!$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 110)
		{
		ePieHotkeyMod_Ctrl := "Control"
		ePieHotkeyMod_Shift := "Shift"
		ePieActivateKey =  ~^+$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 011)
		{
		ePieHotkeyMod_Shift := "Shift"
		ePieHotkeyMod_Alt := "Alt"
		ePieActivateKey =  ~+!$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 101)
		{
		ePieHotkeyMod_Ctrl := "Control"
		ePieHotkeyMod_Alt := "Alt"
		ePieActivateKey =  ~^!$%ePieHotkey_Input%
		}
	if (ePieHotkey_Modifiers = 111)
		{
		ePieHotkeyMod_Ctrl := "Control"
		ePieHotkeyMod_Shift := "Shift"
		ePieHotkeyMod_Alt := "Alt"
		ePieActivateKey =  ~^+!$%ePieHotkey_Input%
		}
	}
Else
	{
	ePieActivateKey =  ~%ePieHotkey_Input%
	}
UseePieDeactivateKey = $*%ePieActivateKey% up 

#If (MethodtoShift=5) && (fPieNumberSetting = 1) 
if (fPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (fPieHotkey_Modifiers = 000)
		{
		fPieActivateKey =  ~$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 100)
		{
		fPieHotkeyMod_Ctrl := "Control"
		fPieActivateKey =  ~^$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 010)
		{
		fPieHotkeyMod_Shift := "Shift"
		fPieActivateKey =  ~+$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 001)
		{
		fPieHotkeyMod_Alt := "Alt"
		fPieActivateKey =  ~!$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 110)
		{
		fPieHotkeyMod_Ctrl := "Control"
		fPieHotkeyMod_Shift := "Shift"
		fPieActivateKey =  ~^+$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 011)
		{
		fPieHotkeyMod_Shift := "Shift"
		fPieHotkeyMod_Alt := "Alt"
		fPieActivateKey =  ~+!$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 101)
		{
		fPieHotkeyMod_Ctrl := "Control"
		fPieHotkeyMod_Alt := "Alt"
		fPieActivateKey =  ~^!$%fPieHotkey_Input%
		}
	if (fPieHotkey_Modifiers = 111)
		{
		fPieHotkeyMod_Ctrl := "Control"
		fPieHotkeyMod_Shift := "Shift"
		fPieHotkeyMod_Alt := "Alt"
		fPieActivateKey =  ~^+!$%fPieHotkey_Input%
		}
	}
Else
	{
	fPieActivateKey =  ~%fPieHotkey_Input%
	}
UsefPieDeactivateKey = $*%fPieActivateKey% up 

#If (MethodtoShift=5) && (gPieNumberSetting = 1) 
if (gPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (gPieHotkey_Modifiers = 000)
		{
		gPieActivateKey =  ~$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 100)
		{
		gPieHotkeyMod_Ctrl := "Control"
		gPieActivateKey =  ~^$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 010)
		{
		gPieHotkeyMod_Shift := "Shift"
		gPieActivateKey =  ~+$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 001)
		{
		gPieHotkeyMod_Alt := "Alt"
		gPieActivateKey =  ~!$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 110)
		{
		gPieHotkeyMod_Ctrl := "Control"
		gPieHotkeyMod_Shift := "Shift"
		gPieActivateKey =  ~^+$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 011)
		{
		gPieHotkeyMod_Shift := "Shift"
		gPieHotkeyMod_Alt := "Alt"
		gPieActivateKey =  ~+!$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 101)
		{
		gPieHotkeyMod_Ctrl := "Control"
		gPieHotkeyMod_Alt := "Alt"
		gPieActivateKey =  ~^!$%gPieHotkey_Input%
		}
	if (gPieHotkey_Modifiers = 111)
		{
		gPieHotkeyMod_Ctrl := "Control"
		gPieHotkeyMod_Shift := "Shift"
		gPieHotkeyMod_Alt := "Alt"
		gPieActivateKey =  ~^+!$%gPieHotkey_Input%
		}
	}
Else
	{
	gPieActivateKey =  ~%gPieHotkey_Input%
	}
UsegPieDeactivateKey = $*%gPieActivateKey% up 

#If (MethodtoShift=5) && (hPieNumberSetting = 1) 
if (hPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (hPieHotkey_Modifiers = 000)
		{
		hPieActivateKey =  ~$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 100)
		{
		hPieHotkeyMod_Ctrl := "Control"
		hPieActivateKey =  ~^$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 010)
		{
		hPieHotkeyMod_Shift := "Shift"
		hPieActivateKey =  ~+$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 001)
		{
		hPieHotkeyMod_Alt := "Alt"
		hPieActivateKey =  ~!$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 110)
		{
		hPieHotkeyMod_Ctrl := "Control"
		hPieHotkeyMod_Shift := "Shift"
		hPieActivateKey =  ~^+$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 011)
		{
		hPieHotkeyMod_Shift := "Shift"
		hPieHotkeyMod_Alt := "Alt"
		hPieActivateKey =  ~+!$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 101)
		{
		hPieHotkeyMod_Ctrl := "Control"
		hPieHotkeyMod_Alt := "Alt"
		hPieActivateKey =  ~^!$%hPieHotkey_Input%
		}
	if (hPieHotkey_Modifiers = 111)
		{
		hPieHotkeyMod_Ctrl := "Control"
		hPieHotkeyMod_Shift := "Shift"
		hPieHotkeyMod_Alt := "Alt"
		hPieActivateKey =  ~^+!$%hPieHotkey_Input%
		}
	}
Else
	{
	hPieActivateKey =  ~%hPieHotkey_Input%
	}
UsehPieDeactivateKey = $*%hPieActivateKey% up 

#If (MethodtoShift=5) && (iPieNumberSetting = 1) 
if (iPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (iPieHotkey_Modifiers = 000)
		{
		iPieActivateKey =  ~$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 100)
		{
		iPieHotkeyMod_Ctrl := "Control"
		iPieActivateKey =  ~^$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 010)
		{
		iPieHotkeyMod_Shift := "Shift"
		iPieActivateKey =  ~+$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 001)
		{
		iPieHotkeyMod_Alt := "Alt"
		iPieActivateKey =  ~!$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 110)
		{
		iPieHotkeyMod_Ctrl := "Control"
		iPieHotkeyMod_Shift := "Shift"
		iPieActivateKey =  ~^+$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 011)
		{
		iPieHotkeyMod_Shift := "Shift"
		iPieHotkeyMod_Alt := "Alt"
		iPieActivateKey =  ~+!$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 101)
		{
		iPieHotkeyMod_Ctrl := "Control"
		iPieHotkeyMod_Alt := "Alt"
		iPieActivateKey =  ~^!$%iPieHotkey_Input%
		}
	if (iPieHotkey_Modifiers = 111)
		{
		iPieHotkeyMod_Ctrl := "Control"
		iPieHotkeyMod_Shift := "Shift"
		iPieHotkeyMod_Alt := "Alt"
		iPieActivateKey =  ~^+!$%iPieHotkey_Input%
		}
	}
Else
	{
	iPieActivateKey =  ~%iPieHotkey_Input%
	}
UseiPieDeactivateKey = $*%iPieActivateKey% up 

#If (MethodtoShift=5) && (jPieNumberSetting = 1) 
if (jPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (jPieHotkey_Modifiers = 000)
		{
		jPieActivateKey =  ~$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 100)
		{
		jPieHotkeyMod_Ctrl := "Control"
		jPieActivateKey =  ~^$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 010)
		{
		jPieHotkeyMod_Shift := "Shift"
		jPieActivateKey =  ~+$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 001)
		{
		jPieHotkeyMod_Alt := "Alt"
		jPieActivateKey =  ~!$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 110)
		{
		jPieHotkeyMod_Ctrl := "Control"
		jPieHotkeyMod_Shift := "Shift"
		jPieActivateKey =  ~^+$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 011)
		{
		jPieHotkeyMod_Shift := "Shift"
		jPieHotkeyMod_Alt := "Alt"
		jPieActivateKey =  ~+!$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 101)
		{
		jPieHotkeyMod_Ctrl := "Control"
		jPieHotkeyMod_Alt := "Alt"
		jPieActivateKey =  ~^!$%jPieHotkey_Input%
		}
	if (jPieHotkey_Modifiers = 111)
		{
		jPieHotkeyMod_Ctrl := "Control"
		jPieHotkeyMod_Shift := "Shift"
		jPieHotkeyMod_Alt := "Alt"
		jPieActivateKey =  ~^+!$%jPieHotkey_Input%
		}
	}
Else
	{
	jPieActivateKey =  ~%jPieHotkey_Input%
	}
UsejPieDeactivateKey = $*%jPieActivateKey% up 

#If (MethodtoShift=5) && (kPieNumberSetting = 1) 
if (kPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (kPieHotkey_Modifiers = 000)
		{
		kPieActivateKey =  ~$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 100)
		{
		kPieHotkeyMod_Ctrl := "Control"
		kPieActivateKey =  ~^$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 010)
		{
		kPieHotkeyMod_Shift := "Shift"
		kPieActivateKey =  ~+$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 001)
		{
		kPieHotkeyMod_Alt := "Alt"
		kPieActivateKey =  ~!$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 110)
		{
		kPieHotkeyMod_Ctrl := "Control"
		kPieHotkeyMod_Shift := "Shift"
		kPieActivateKey =  ~^+$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 011)
		{
		kPieHotkeyMod_Shift := "Shift"
		kPieHotkeyMod_Alt := "Alt"
		kPieActivateKey =  ~+!$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 101)
		{
		kPieHotkeyMod_Ctrl := "Control"
		kPieHotkeyMod_Alt := "Alt"
		kPieActivateKey =  ~^!$%kPieHotkey_Input%
		}
	if (kPieHotkey_Modifiers = 111)
		{
		kPieHotkeyMod_Ctrl := "Control"
		kPieHotkeyMod_Shift := "Shift"
		kPieHotkeyMod_Alt := "Alt"
		kPieActivateKey =  ~^+!$%kPieHotkey_Input%
		}
	}
Else
	{
	kPieActivateKey =  ~%kPieHotkey_Input%
	}
UsekPieDeactivateKey = $*%kPieActivateKey% up 

#If (MethodtoShift=5) && (lPieNumberSetting = 1) 
if (lPieNumberSetting > 0) && (MethodtoShift = 5)  
	{
	if (lPieHotkey_Modifiers = 000)
		{
		lPieActivateKey =  ~$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 100)
		{
		lPieHotkeyMod_Ctrl := "Control"
		lPieActivateKey =  ~^$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 010)
		{
		lPieHotkeyMod_Shift := "Shift"
		lPieActivateKey =  ~+$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 001)
		{
		lPieHotkeyMod_Alt := "Alt"
		lPieActivateKey =  ~!$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 110)
		{
		lPieHotkeyMod_Ctrl := "Control"
		lPieHotkeyMod_Shift := "Shift"
		lPieActivateKey =  ~^+$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 011)
		{
		lPieHotkeyMod_Shift := "Shift"
		lPieHotkeyMod_Alt := "Alt"
		lPieActivateKey =  ~+!$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 101)
		{
		lPieHotkeyMod_Ctrl := "Control"
		lPieHotkeyMod_Alt := "Alt"
		lPieActivateKey =  ~^!$%lPieHotkey_Input%
		}
	if (lPieHotkey_Modifiers = 111)
		{
		lPieHotkeyMod_Ctrl := "Control"
		lPieHotkeyMod_Shift := "Shift"
		lPieHotkeyMod_Alt := "Alt"
		lPieActivateKey =  ~^+!$%lPieHotkey_Input%
		}
	}
Else
	{
	lPieActivateKey =  ~%lPieHotkey_Input%
	}
UselPieDeactivateKey = $*%lPieActivateKey% up 

;Hotkey, IfWinActive, 

Hotkey, If, (MethodtoShift<4) && (PieNumberSetting > 0) 
Hotkey,%UsePieActivateKey%,PieActivate
Hotkey,%UsePieDeactivateKey%,ReleasePieKey 

Hotkey, If, (MethodtoShift=5) && (aPieNumberSetting = 1) 
Hotkey,%aPieActivateKey%,PieActivate
Hotkey,%UseaPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (bPieNumberSetting = 1) 
Hotkey,%bPieActivateKey%,PieActivate 
Hotkey,%UsebPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (cPieNumberSetting = 1) 
Hotkey,%cPieActivateKey%,PieActivate 
Hotkey,%UsecPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (dPieNumberSetting = 1) 
Hotkey,%dPieActivateKey%,PieActivate 
Hotkey,%UsedPieDeactivateKey%,ReleasePieKey 

Hotkey, If, (MethodtoShift=5) && (ePieNumberSetting = 1) 
Hotkey,%ePieActivateKey%,PieActivate 
Hotkey,%UseePieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (fPieNumberSetting = 1) 
Hotkey,%fPieActivateKey%,PieActivate 
Hotkey,%UsefPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (gPieNumberSetting = 1) 
Hotkey,%gPieActivateKey%,PieActivate 
Hotkey,%UsegPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (hPieNumberSetting = 1) 
Hotkey,%hPieActivateKey%,PieActivate 
Hotkey,%UsehPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (iPieNumberSetting = 1) 
Hotkey,%iPieActivateKey%,PieActivate 
Hotkey,%UseiPieDeactivateKey%,ReleasePieKey 

Hotkey, If, (MethodtoShift=5) && (jPieNumberSetting = 1) 
Hotkey,%jPieActivateKey%,PieActivate 
Hotkey,%UsejPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (kPieNumberSetting = 1) 
Hotkey,%kPieActivateKey%,PieActivate 
Hotkey,%UsekPieDeactivateKey%,ReleasePieKey

Hotkey, If, (MethodtoShift=5) && (lPieNumberSetting = 1) 
Hotkey,%lPieActivateKey%,PieActivate 
Hotkey,%UselPieDeactivateKey%,ReleasePieKey 


;---------------------------------------
;    Tabletpressure Reading Script
;---------------------------------------
FileReadLine, PenTabletActive, %A_ScriptDir%\Resources\settingsfile.txt, 7

Gui, +AlwaysOnTop -SysMenu +Owner +LastFound  ; +Owner avoids a taskbar button.
MyGui := WinExist()

If PenTabletActive = 1
	{
tabletPressure:=0 
TabletInit(MyGui)
DllCall("FreeLibrary", UInt, hwintab32)
return
	}

TABLETPACKET(wParam, lParam)
{
	global
	VarSetCapacity(packet, 4, 0) ; pressure only = size 4
	; we get a packet that exactly fits in size to the data we requested with lcPktData, in this case only pressure
	hWTPacket := DllCall( "wintab32\WTPacket", "int", lParam, "int", wParam, "int", &packet)  ;; MUST change why not wintab-64?
	tabletPressure := NumGet(packet, 0, "int") ; pressure -> 0 offset
	VarSetCapacity(packet, 0) ; free packet memory

}

TabletInit(receivingHwnd)
{

	; global
	
	; offsets into structure passed to WTOpenA 
	lcOptions := 40
	lcMsgBase := 52 ; windows message ID
	lcPktData := 64 ; requested items delivered in package
	lcPktMode := 68
	
	; options for WTOpenA call
	CXO_MESSAGES := 0x0004 ; request windows messages
	CXO_SYSTEM := 0x0001 ; pass packet on to system
	
	; items that can be requested to be received in the packets, we use only PK_NORMAL_PRESSURE
	PK_CURSOR := 0x0020	; reporting cursor 
	PK_BUTTONS := 0x0040 ; button information 
	PK_X := 0x0080 ; x axis 
	PK_Y := 0x0100 ; y axis
	PK_Z := 0x0200 ; z axis
	PK_NORMAL_PRESSURE := 0x0400 ; normal or tip pressure 
	PK_TANGENT_PRESSURE := 0x0800 ; tangential or barrel pressure 
	PK_ORIENTATION := 0x1000 ; orientation info: tilts 
	PK_ROTATION := 0x2000 ; rotation info; 1.1 
	
	; hwintab32 :=	DllCall( "LoadLibrary", "str", "wintab32" )
	VarSetCapacity(logcontext, 172, 0)
	hWTInfoA := DllCall( "wintab32\WTInfoA", "int", 3, "int", 0, "int", &logcontext )
	MsgBase := NumGet(logcontext, lcMsgBase, "UInt")
	Options := NumGet(logcontext, lcOptions, "UInt")
	NumPut(Options|CXO_MESSAGES|CXO_SYSTEM, logcontext, lcOptions, "UInt") ; request to get windows messages
	NumPut(PK_NORMAL_PRESSURE, logcontext, lcPktData, "UInt") ; request only pressure, no XY/buttons
	NumPut(0, logcontext, lcPktMode, "UInt")
	hWTOpenA := DllCall( "wintab32\WTOpenA", "int", receivingHwnd, "int", &logcontext, "int", -0x01 )
	OnMessage(MsgBase, "TABLETPACKET")
}


;-------------------------------------------------------
; Thanks to tic (Tariq Porter) for his GDI+ Library
; http://www.autohotkey.com/forum/viewtopic.php?t=32238
;-------------------------------------------------------

;Resources for Pie Menu are loaded at this point.

PieKillSwitch:
	{
	pie_pressed := "U"
	StartDrawGDIP()
	ClearDrawGDIP()
	EndDrawGDIP()
	return
	}

PieActivate:
	{
	BlockLButton := 1
	
	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Ctrl, "P") && GetKeyState(aPieHotkeyMod_Shift, "P") && GetKeyState(aPieHotkeyMod_Alt, "P") && (aPieHotkey_Modifiers = 111) ;a111 
		{
		PieMode := 0
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Ctrl, "P") && GetKeyState(bPieHotkeyMod_Shift, "P") && GetKeyState(bPieHotkeyMod_Alt, "P") && (bPieHotkey_Modifiers = 111) ;b111
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Ctrl, "P") && GetKeyState(cPieHotkeyMod_Shift, "P") && GetKeyState(cPieHotkeyMod_Alt, "P") && (cPieHotkey_Modifiers = 111) ;c111
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Ctrl, "P") && GetKeyState(dPieHotkeyMod_Shift, "P") && GetKeyState(dPieHotkeyMod_Alt, "P") && (dPieHotkey_Modifiers = 111) ;d111
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Ctrl, "P") && GetKeyState(ePieHotkeyMod_Shift, "P") && GetKeyState(ePieHotkeyMod_Alt, "P") && (ePieHotkey_Modifiers = 111) ;e111
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Ctrl, "P") && GetKeyState(fPieHotkeyMod_Shift, "P") && GetKeyState(fPieHotkeyMod_Alt, "P") && (fPieHotkey_Modifiers = 111) ;f111
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Ctrl, "P") && GetKeyState(gPieHotkeyMod_Shift, "P") && GetKeyState(gPieHotkeyMod_Alt, "P") && (gPieHotkey_Modifiers = 111) ;g111
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Ctrl, "P") && GetKeyState(hPieHotkeyMod_Shift, "P") && GetKeyState(hPieHotkeyMod_Alt, "P") && (hPieHotkey_Modifiers = 111) ;h111
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Ctrl, "P") && GetKeyState(iPieHotkeyMod_Shift, "P") && GetKeyState(iPieHotkeyMod_Alt, "P") && (iPieHotkey_Modifiers = 111) ;i111
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Ctrl, "P") && GetKeyState(jPieHotkeyMod_Shift, "P") && GetKeyState(jPieHotkeyMod_Alt, "P") && (jPieHotkey_Modifiers = 111) ;j111
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Ctrl, "P") && GetKeyState(kPieHotkeyMod_Shift, "P") && GetKeyState(kPieHotkeyMod_Alt, "P") && (kPieHotkey_Modifiers = 111) ;k111
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Ctrl, "P") && GetKeyState(lPieHotkeyMod_Shift, "P") && GetKeyState(lPieHotkeyMod_Alt, "P") && (lPieHotkey_Modifiers = 111) ;l111
		{
		PieMode := 11
		goto PieInput
		}




	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Ctrl, "P") && GetKeyState(aPieHotkeyMod_Shift, "P") && (aPieHotkey_Modifiers = 110) ;a110 
		{
		PieMode := 0
		goto PieInput
		}
	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Shift, "P") && GetKeyState(aPieHotkeyMod_Alt, "P") && (aPieHotkey_Modifiers = 011) ;a011 
		{
		PieMode := 0
		goto PieInput
		}
	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Ctrl, "P") && GetKeyState(aPieHotkeyMod_Alt, "P") && (aPieHotkey_Modifiers = 101) ;a101 
		{
		PieMode := 0
		goto PieInput
		}
	
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Ctrl, "P") && GetKeyState(bPieHotkeyMod_Shift, "P") && (bPieHotkey_Modifiers = 110) ;b110
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Shift, "P") && GetKeyState(bPieHotkeyMod_Alt, "P") && (bPieHotkey_Modifiers = 011) ;b011
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Ctrl, "P") && GetKeyState(bPieHotkeyMod_Alt, "P") && (bPieHotkey_Modifiers = 101) ;b101
		{
		PieMode := 1
		goto PieInput
		}

	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Ctrl, "P") && GetKeyState(cPieHotkeyMod_Shift, "P") && (cPieHotkey_Modifiers = 110) ;c110
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Shift, "P") && GetKeyState(cPieHotkeyMod_Alt, "P") && (cPieHotkey_Modifiers = 011) ;c011
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Ctrl, "P") && GetKeyState(cPieHotkeyMod_Alt, "P") && (cPieHotkey_Modifiers = 101) ;c101
		{
		PieMode := 2
		goto PieInput
		}

	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Ctrl, "P") && GetKeyState(dPieHotkeyMod_Shift, "P") && (dPieHotkey_Modifiers = 110) ;d110
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Shift, "P") && GetKeyState(dPieHotkeyMod_Alt, "P") && (dPieHotkey_Modifiers = 011) ;d011
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Ctrl, "P") && GetKeyState(dPieHotkeyMod_Alt, "P") && (dPieHotkey_Modifiers = 101) ;d101
		{
		PieMode := 3
		goto PieInput
		}

	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Ctrl, "P") && GetKeyState(ePieHotkeyMod_Shift, "P") && (ePieHotkey_Modifiers = 110) ;e110
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Shift, "P") && GetKeyState(ePieHotkeyMod_Alt, "P") && (ePieHotkey_Modifiers = 011) ;e011
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Ctrl, "P") && GetKeyState(ePieHotkeyMod_Alt, "P") && (ePieHotkey_Modifiers = 101) ;e101
		{
		PieMode := 4
		goto PieInput
		}

	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Ctrl, "P") && GetKeyState(fPieHotkeyMod_Shift, "P") && (fPieHotkey_Modifiers = 110) ;f110
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Shift, "P") && GetKeyState(fPieHotkeyMod_Alt, "P") && (fPieHotkey_Modifiers = 011) ;f011
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Ctrl, "P") && GetKeyState(fPieHotkeyMod_Alt, "P") && (fPieHotkey_Modifiers = 101) ;f101
		{
		PieMode := 5
		goto PieInput
		}
	
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Ctrl, "P") && GetKeyState(gPieHotkeyMod_Shift, "P") && (gPieHotkey_Modifiers = 110) ;g110
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Shift, "P") && GetKeyState(gPieHotkeyMod_Alt, "P") && (gPieHotkey_Modifiers = 011) ;g011
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Ctrl, "P") && GetKeyState(gPieHotkeyMod_Alt, "P") && (gPieHotkey_Modifiers = 101) ;g101
		{
		PieMode := 6
		goto PieInput
		}

	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Ctrl, "P") && GetKeyState(hPieHotkeyMod_Shift, "P") && (hPieHotkey_Modifiers = 110) ;h110
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Shift, "P") && GetKeyState(hPieHotkeyMod_Alt, "P") && (hPieHotkey_Modifiers = 011) ;h011
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Ctrl, "P") && GetKeyState(hPieHotkeyMod_Alt, "P") && (hPieHotkey_Modifiers = 101) ;h101
		{
		PieMode := 7
		goto PieInput
		}

	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Ctrl, "P") && GetKeyState(iPieHotkeyMod_Shift, "P") && (iPieHotkey_Modifiers = 110) ;i110
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Shift, "P") && GetKeyState(iPieHotkeyMod_Alt, "P") && (iPieHotkey_Modifiers = 011) ;i011
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Ctrl, "P") && GetKeyState(iPieHotkeyMod_Alt, "P") && (iPieHotkey_Modifiers = 101) ;i101
		{
		PieMode := 8
		goto PieInput
		}

	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Ctrl, "P") && GetKeyState(jPieHotkeyMod_Shift, "P") && (jPieHotkey_Modifiers = 110) ;j110
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Shift, "P") && GetKeyState(jPieHotkeyMod_Alt, "P") && (jPieHotkey_Modifiers = 011) ;j011
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Ctrl, "P") && GetKeyState(jPieHotkeyMod_Alt, "P") && (jPieHotkey_Modifiers = 101) ;j101
		{
		PieMode := 9
		goto PieInput
		}

	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Ctrl, "P") && GetKeyState(kPieHotkeyMod_Shift, "P") && (kPieHotkey_Modifiers = 110) ;k110
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Shift, "P") && GetKeyState(kPieHotkeyMod_Alt, "P") && (kPieHotkey_Modifiers = 011) ;k011
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Ctrl, "P") && GetKeyState(kPieHotkeyMod_Alt, "P") && (kPieHotkey_Modifiers = 101) ;k101
		{
		PieMode := 10
		goto PieInput
		}

	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Ctrl, "P") && GetKeyState(lPieHotkeyMod_Shift, "P") && (lPieHotkey_Modifiers = 110) ;l110
		{
		PieMode := 11
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Shift, "P") && GetKeyState(lPieHotkeyMod_Alt, "P") && (lPieHotkey_Modifiers = 011) ;l011
		{
		PieMode := 11
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Ctrl, "P") && GetKeyState(lPieHotkeyMod_Alt, "P") && (lPieHotkey_Modifiers = 101) ;l101
		{
		PieMode := 11
		goto PieInput
		}




	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Ctrl, "P") && (aPieHotkey_Modifiers = 100) ;a100 
		{
		PieMode := 0
		goto PieInput
		}
	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Shift, "P") && (aPieHotkey_Modifiers = 010) ;a010
		{
		PieMode := 0
		goto PieInput	
		}
	if GetKeyState(aPieHotkey_Input, "P") && GetKeyState(aPieHotkeyMod_Alt, "P") && (aPieHotkey_Modifiers = 001) ;a001
		{
		PieMode := 0
		goto PieInput	
		}

	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Ctrl, "P") && (bPieHotkey_Modifiers = 100) ;b100   
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Shift, "P") && (bPieHotkey_Modifiers = 010) ;b010
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && GetKeyState(bPieHotkeyMod_Alt, "P") && (bPieHotkey_Modifiers = 001) ;b001
		{
		PieMode := 1
		goto PieInput
		}

	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Ctrl, "P") && (cPieHotkey_Modifiers = 100) ;c100   
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Shift, "P") && (cPieHotkey_Modifiers = 010) ;c010
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && GetKeyState(cPieHotkeyMod_Alt, "P") && (cPieHotkey_Modifiers = 001) ;c001
		{
		PieMode := 2
		goto PieInput
		}

	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Ctrl, "P") && (dPieHotkey_Modifiers = 100) ;d100   
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Shift, "P") && (dPieHotkey_Modifiers = 010) ;d010
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && GetKeyState(dPieHotkeyMod_Alt, "P") && (dPieHotkey_Modifiers = 001) ;d001
		{
		PieMode := 3
		goto PieInput
		}

	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Ctrl, "P") && (ePieHotkey_Modifiers = 100) ;e100   
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Shift, "P") && (ePieHotkey_Modifiers = 010) ;e010
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && GetKeyState(ePieHotkeyMod_Alt, "P") && (ePieHotkey_Modifiers = 001) ;e001
		{
		PieMode := 4
		goto PieInput
		}
	
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Ctrl, "P") && (fPieHotkey_Modifiers = 100) ;f100   
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Shift, "P") && (fPieHotkey_Modifiers = 010) ;f010
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && GetKeyState(fPieHotkeyMod_Alt, "P") && (fPieHotkey_Modifiers = 001) ;f001
		{
		PieMode := 5
		goto PieInput
		}

	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Ctrl, "P") && (gPieHotkey_Modifiers = 100) ;g100   
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Shift, "P") && (gPieHotkey_Modifiers = 010) ;g010
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && GetKeyState(gPieHotkeyMod_Alt, "P") && (gPieHotkey_Modifiers = 001) ;g001
		{
		PieMode := 6
		goto PieInput
		}

	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Ctrl, "P") && (hPieHotkey_Modifiers = 100) ;h100   
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Shift, "P") && (hPieHotkey_Modifiers = 010) ;h010
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && GetKeyState(hPieHotkeyMod_Alt, "P") && (hPieHotkey_Modifiers = 001) ;h001
		{
		PieMode := 7
		goto PieInput
		}

	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Ctrl, "P") && (iPieHotkey_Modifiers = 100) ;i100   
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Shift, "P") && (iPieHotkey_Modifiers = 010) ;i010
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && GetKeyState(iPieHotkeyMod_Alt, "P") && (iPieHotkey_Modifiers = 001) ;i001
		{
		PieMode := 8
		goto PieInput
		}
	
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Ctrl, "P") && (jPieHotkey_Modifiers = 100) ;j100   
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Shift, "P") && (jPieHotkey_Modifiers = 010) ;j010
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && GetKeyState(jPieHotkeyMod_Alt, "P") && (jPieHotkey_Modifiers = 001) ;j001
		{
		PieMode := 9
		goto PieInput
		}

	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Ctrl, "P") && (kPieHotkey_Modifiers = 100) ;k100   
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Shift, "P") && (kPieHotkey_Modifiers = 010) ;k010
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && GetKeyState(kPieHotkeyMod_Alt, "P") && (kPieHotkey_Modifiers = 001) ;k001
		{
		PieMode := 10
		goto PieInput
		}

	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Ctrl, "P") && (lPieHotkey_Modifiers = 100) ;l100   
		{
		PieMode := 11
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Shift, "P") && (lPieHotkey_Modifiers = 010) ;l010
		{
		PieMode := 11
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && GetKeyState(lPieHotkeyMod_Alt, "P") && (lPieHotkey_Modifiers = 001) ;l001
		{
		PieMode := 11
		goto PieInput
		}





	if GetKeyState(aPieHotkey_Input, "P") && (aPieHotkey_Modifiers = 000) ;a000        
		{
		PieMode := 0
		goto PieInput
		}
	if GetKeyState(bPieHotkey_Input, "P") && (bPieHotkey_Modifiers = 000) ;b000
		{
		PieMode := 1
		goto PieInput
		}
	if GetKeyState(cPieHotkey_Input, "P") && (cPieHotkey_Modifiers = 000) ;c000
		{
		PieMode := 2
		goto PieInput
		}
	if GetKeyState(dPieHotkey_Input, "P") && (dPieHotkey_Modifiers = 000) ;d000
		{
		PieMode := 3
		goto PieInput
		}
	if GetKeyState(ePieHotkey_Input, "P") && (ePieHotkey_Modifiers = 000) ;e000
		{
		PieMode := 4
		goto PieInput
		}
	if GetKeyState(fPieHotkey_Input, "P") && (fPieHotkey_Modifiers = 000) ;f000
		{
		PieMode := 5
		goto PieInput
		}
	if GetKeyState(gPieHotkey_Input, "P") && (gPieHotkey_Modifiers = 000) ;g000
		{
		PieMode := 6
		goto PieInput
		}
	if GetKeyState(hPieHotkey_Input, "P") && (hPieHotkey_Modifiers = 000) ;h000
		{
		PieMode := 7
		goto PieInput
		}
	if GetKeyState(iPieHotkey_Input, "P") && (iPieHotkey_Modifiers = 000) ;i000
		{
		PieMode := 8
		goto PieInput
		}
	if GetKeyState(jPieHotkey_Input, "P") && (jPieHotkey_Modifiers = 000) ;j000
		{
		PieMode := 9
		goto PieInput
		}
	if GetKeyState(kPieHotkey_Input, "P") && (kPieHotkey_Modifiers = 000) ;k000
		{
		PieMode := 10
		goto PieInput
		}
	if GetKeyState(lPieHotkey_Input, "P") && (lPieHotkey_Modifiers = 000) ;l000
		{
		PieMode := 11
		goto PieInput
		}

	

	
	if GetKeyState(PieActivateKey, "P") 
		{
		PieMode := 0
		If GetKeyState("Alt", "P") && GetKeyState("Shift", "P") && GetKeyState("Control", "P") && (MethodtoShift < 4)
			{
			Run "%A_ScriptDir%\CloseAllAhkScripts.ahk"
			exitapp
			}
		If GetKeyState("Alt", "P") && GetKeyState("Control", "P") && (MethodtoShift < 4)
			{
			Run "%A_ScriptDir%\PieMenuSettings.ahk" Restart
			Exitapp
			}
		}

	PieInput:
	pie_pressed := "D"
	
	
	StartDrawGDIP()
	ClearDrawGDIP()	
	Gdip_SetSmoothingMode(G, 4)
	
	MouseGetPos, MXi, MYi
	TY := MYi+40
		
	Loop
		{
		MouseGetPos, MXf, MYf
		
		
		;Add Intermediate Points
		If  A_Index > 1
			distm := Sqrt(((( MXf + MXt ) / 2) - MXi)**2 + ((( MYf + MYt ) / 2) - MYi)**2)
		
		;Previous Frame Set
		MXt := MXf
		MYt := MYf
		
		;Calculate Distance
		dist := Sqrt((MXf - MXi)**2 + (MYf - MYi)**2)
		;Calculate Angle  0 is right of circle.
		YN := 0
		If (MYf - MYi) > 0
			YN := 180
		If (MYf - MYi) != 0
			{
			angle := (ATan( (-1 / ((MYf - MYi) / (MXf - MXi)))) * -57.29578) + YN + 90
			}
		Else 
			{			
			If (MXf > MXi)
				angle := 0
			Else
				angle := 180			
			}


		If GetKeyState("Alt", "P") && (MethodtoShift < 5) && (PieNumberSetting > 0)
			PieMode := 0
		If GetKeyState("Shift", "P") && (MethodtoShift < 5) &&  (PieNumberSetting > 1)
			PieMode := 1
		If GetKeyState("Control", "P") && (MethodtoShift < 5) && (PieNumberSetting > 2)
			PieMode := 2


		If PieMode = 0
			{
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\aMenuRight.png
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\aMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\aMenuTop.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\aMenuLeft.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\aMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\aMenuBottom.png
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(anull_Image)
				If (MethodtoShift between 2 and 3) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					MiddleLeft := 0
					If (MethodtoShift = 2) && (PieNumberSetting > 2)
						{
						PieMode := 2
						Goto, cPie
						}
					If (MethodtoShift = 3) && (PieNumberSetting > 2)
						{
						PieMode := 1
						Goto bPie
						}
					}
				If (MethodtoShift < 3) && (MiddleLeft = 1) && (PieNumberSetting > 1)
					{
					MiddleLeft := 0
					TopHovered := 0
					BottomHovered := 0
					PieMode := 1
					Goto bPie
					}
				TopHovered := 0
				BottomHovered := 0
				Goto DrawPie
				}
			If (distm < PieMenuSize)
				{
				If (MethodtoShift between 2 and 3) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					MiddleLeft := 0
					If (MethodtoShift = 2) && (PieNumberSetting > 2)
						{
						PieMode := 2
						Goto, cPie
						}
					If (MethodtoShift = 3) && (PieNumberSetting > 2)
						{
						PieMode := 1
						Goto bPie
						}
					}
				If (MethodtoShift < 3) && (MiddleLeft = 1) && (PieNumberSetting > 1)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 1
					Goto bPie
					}
				}
			If (dist !< PieMenuSize) && (MethodtoShift < 3)
				{
				MiddleLeft := 1
				}
			If angle between 0 and 60 ;Bottom Right
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\aMenuLeftH.png
				
				pBitmap := Gdip_CreateBitmapFromFile(a1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120 ;Bottom
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\aMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(a2_Image)
				TopHovered := 1
				Goto DrawPie
				}
			If angle between 120 and 180 ;Bottom Left
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\aMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(a3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240 ;Top Left
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\aMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(a4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300 ;Top
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\aMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(a5_Image)
				BottomHovered := 1
				Goto DrawPie
				}
			If angle between 300 and 360 ;Top Right
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\aMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(a6_Image)
				Goto DrawPie
				}
			}
		bPie:
		If PieMode = 1
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\bMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\bMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\bMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\bMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\bMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\bMenuBottom.png
			If (dist < PieMenuSize)
				{
				If (MethodtoShift < 4) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 2)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 2
					Goto, cPie
					}
				TopHovered := 0
				BottomHovered := 0
				pBitmap := Gdip_CreateBitmapFromFile(bnull_Image)
				Goto DrawPie
				}
			If (distm < PieMenuSize)
				{
				If (MethodtoShift < 4) && ((TopHovered + BottomHovered) = 2) && (PieNumberSetting > 2)
					{
					TopHovered := 0
					BottomHovered := 0
					PieMode := 2
					Goto, cPie
					}
				TopHovered := 0
				BottomHovered := 0
				}
			If (dist !< PieMenuSize) && (MethodtoShift = 1)
				{
				TopHovered := 1
				BottomHovered := 1
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\bMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(b1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\bMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(b2_Image)
				TopHovered := 1
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\bMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(b3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\bMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(b4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\bMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(b5_Image)
				BottomHovered := 1
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\bMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(b6_Image)
				Goto DrawPie
				}
			}
		cPie:
		If PieMode = 2
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\cMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\cMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\cMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\cMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\cMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\cMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(cnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\cMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(c1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\cMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(c2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\cMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(c3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\cMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(c4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\cMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(c5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\cMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(c6_Image)
				Goto DrawPie
				}
			}
		dPie:
		If PieMode = 3
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\dMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\dMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\dMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\dMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\dMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\dMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(dnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\dMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(d1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\dMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(d2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\dMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(d3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\dMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(d4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\dMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(d5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\dMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(d6_Image)
				Goto DrawPie
				}
			}
		ePie:
		If PieMode = 4
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\eMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\eMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\eMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\eMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\eMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\eMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(enull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\eMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(e1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\eMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(e2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\eMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(e3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\eMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(e4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\eMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(e5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\eMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(e6_Image)
				Goto DrawPie
				}
			}
		fPie:
		If PieMode = 5
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\fMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\fMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\fMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\fMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\fMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\fMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(fnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\fMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(f1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\fMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(f2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\fMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(f3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\fMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(f4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\fMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(f5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\fMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(f6_Image)
				Goto DrawPie
				}
			}
		gPie:
		If PieMode = 6
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\gMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\gMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\gMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\gMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\gMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\gMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(gnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\gMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(g1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\gMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(g2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\gMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(g3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\gMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(g4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\gMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(g5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\gMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(g6_Image)
				Goto DrawPie
				}
			}
		hPie:
		If PieMode = 7
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\hMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\hMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\hMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\hMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\hMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\hMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(hnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\hMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(h1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\hMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(h2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\hMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(h3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\hMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(h4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\hMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(h5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\hMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(h6_Image)
				Goto DrawPie
				}
			}
		iPie:
		If PieMode = 8
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\iMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\iMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\iMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\iMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\iMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\iMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(inull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\iMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(i1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\iMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(i2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\iMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(i3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\iMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(i4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\iMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(i5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\iMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(i6_Image)
				Goto DrawPie
				}
			}
		jPie:
		If PieMode = 9
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\jMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\jMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\jMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\jMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\jMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\jMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(jnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\jMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(j1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\jMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(j2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\jMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(j3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\jMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(j4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\jMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(j5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\jMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(j6_Image)
				Goto DrawPie
				}
			}
		kPie:
		If PieMode = 10
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\kMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\kMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\kMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\kMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\kMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\kMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(knull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\kMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(k1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\kMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(k2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\kMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(k3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\kMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(k4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\kMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(k5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\kMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(k6_Image)
				Goto DrawPie
				}
			}
		lPie:
		If PieMode = 11
			{
			pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\lMenuRight.png
			pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\lMenuRight.png
			pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\lMenuTop.png
			pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\lMenuLeft.png
			pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\lMenuLeft.png
			pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\lMenuBottom.png
			
			If (dist < PieMenuSize)
				{
				pBitmap := Gdip_CreateBitmapFromFile(lnull_Image)
				Goto DrawPie
				}
			If angle between 0 and 60
				{
				pBackgroundLeftU = %A_ScriptDir%\Resources\LabelBG\lMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(l1_Image)
				Goto DrawPie
				}
			If angle between 60 and 120
				{
				pBackgroundBottom = %A_ScriptDir%\Resources\LabelBG\lMenuBottomH.png
				pBitmap := Gdip_CreateBitmapFromFile(l2_Image)
				Goto DrawPie
				}
			If angle between 120 and 180
				{
				pBackgroundRightU = %A_ScriptDir%\Resources\LabelBG\lMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(l3_Image)
				Goto DrawPie
				}
			If angle between 180 and 240
				{
				pBackgroundRightD = %A_ScriptDir%\Resources\LabelBG\lMenuRightH.png
				pBitmap := Gdip_CreateBitmapFromFile(l4_Image)
				Goto DrawPie
				}
			If angle between 240 and 300
				{
				pBackgroundTop = %A_ScriptDir%\Resources\LabelBG\lMenuTopH.png
				pBitmap := Gdip_CreateBitmapFromFile(l5_Image)
				Goto DrawPie
				}
			If angle between 300 and 360
				{
				pBackgroundLeftD = %A_ScriptDir%\Resources\LabelBG\lMenuLeftH.png
				pBitmap := Gdip_CreateBitmapFromFile(l6_Image)
				Goto DrawPie
				}
			}

		DrawPie:
		Gdip_DrawImage(G, pBitmap, MXi-PieMenuOffset, MYi-PieMenuOffset, PieMenuScale, PieMenuScale)
		; Gdip_DrawImage(G, pBitmap, MXm, MYm, 10, 10)   For Testing Midpoint mouse
		Gdip_DisposeImage(pBitmap)
		
						
		If A_Index > %ShowLabelDelay%
			{
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundTop)
			Gdip_DrawImage(G, pBitmap, MXi-65, MYi+47, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundBottom)
			Gdip_DrawImage(G, pBitmap, MXi-65, MYi-68, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundRightD)
			Gdip_DrawImage(G, pBitmap, MXi-170, MYi+16, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundRightU)
			Gdip_DrawImage(G, pBitmap, MXi-170, MYi-32, 130, 20)	
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundLeftD)
			Gdip_DrawImage(G, pBitmap, MXi+40, MYi+16, 130, 20)
			pBitmap := Gdip_CreateBitmapFromFile(pBackgroundLeftU)
			Gdip_DrawImage(G, pBitmap, MXi+40, MYi-32, 130, 20)
			Gdip_DisposeImage(pBitmap)

;Boop-boop-boopa-doop

			If PieMode = 0
				{
				If ShowToolTips = 1 
					{
									
					TXo := A_ScreenWidth / 2
					TYo := A_ScreenHeight - 100
					textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
					Gdip_TextToGraphics(G, MethodtoShiftText, textoptions)
					}
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fa6_Label, textoptions)
				}
			If PieMode = 1
				{
				If ShowToolTips = 1 
					{
									
					TXo := A_ScreenWidth / 2
					TYo := A_ScreenHeight - 100
					textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
					Gdip_TextToGraphics(G, MethodtoShiftText, textoptions)
					}
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fb6_Label, textoptions)
				}
			If PieMode = 2
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fc6_Label, textoptions)
				}
			If PieMode = 3
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fd6_Label, textoptions)
				}
			If PieMode = 4
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fe6_Label, textoptions)
				}
			If PieMode = 5
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, ff6_Label, textoptions)
				}
			If PieMode = 6
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fg6_Label, textoptions)
				}
			If PieMode = 7
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fh6_Label, textoptions)
				}
			If PieMode = 8
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fi6_Label, textoptions)
				}
			If PieMode = 9
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fj6_Label, textoptions)
				}
			If PieMode = 10
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fk6_Label, textoptions)
				}
			If PieMode = 11
				{
				;TopRight
				TXo := (MXi + 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl1_Label, textoptions)
				;Top
				TXo := (MXi)
				TYo := (MYi - 65)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl2_Label, textoptions)
				;TopLeft
				TXo := (MXi - 108)
				TYo := (MYi - 29)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl3_Label, textoptions)
				;BottomLeft
				TXo := (MXi - 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl4_Label, textoptions)
				;Bottom
				TXo := (MXi)
				TYo := (MYi + 50)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl5_Label, textoptions)
				;BottomRight
				TXo := (MXi + 108)
				TYo := (MYi + 19)
				textoptions = x%TXo% y%TYo% Center Vcenter cffFFFFFF r4 s12
				Gdip_TextToGraphics(G, fl6_Label, textoptions)
				}
			}
			
			
		EndDrawGDIP()
		StartDrawGDIP()
		
		
		
		If pie_pressed != D
			{
			MouseGetPos, MXf, MYf
			dist := Sqrt((MXf - MXi)**2 + (MYf - MYi)**2)
		
			YN := 0
			If (MYf - MYi) > 0
				YN := 180
			If (MYf - MYi) != 0
				{
				angle := (ATan( (-1 / ((MYf - MYi) / (MXf - MXi)))) * -57.29578) + YN + 90
				}
			Else
				{
				If (MXf - MXi) > 0
					angle := 0
				Else
					angle := 180			
				}
			Break
			}
			Sleep, 6
		}
	TopHovered := 0
	BottomHovered := 0
	MiddleLeft := 0
	ClearDrawGDIP()
	EndDrawGDIP()
	BlockLButton := 0
		If PieMode = 0
			{
			If (dist < 22)
				{
				PieFunc = %anull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %anull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %anull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %anull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %a1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %a2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %a3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %a4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %a5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %a6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %a6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %a6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %a6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 1
			{
			If (dist < 22)
				{
				PieFunc = %bnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %bnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %bnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %bnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %b1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %b2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %b3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %b4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %b5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %b6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %b6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %b6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %b6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 2
			{
			If (dist < 22)
				{
				PieFunc = %cnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %cnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %cnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %cnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %c1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %c2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %c3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %c4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %c5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %c6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %c6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %c6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %c6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 3
			{
			If (dist < 22)
				{
				PieFunc = %dnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %dnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %dnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %dnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %d1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %d2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %d3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %d4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %d5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %d6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %d6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %d6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %d6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 4
			{
			If (dist < 22)
				{
				PieFunc = %enull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %enull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %enull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %enull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %e1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %e2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %e3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %e4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %e5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %e6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %e6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %e6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %e6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 5
			{
			If (dist < 22)
				{
				PieFunc = %fnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %fnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %fnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %fnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %f1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %f2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %f3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %f4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %f5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %f6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %f6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %f6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %f6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 6
			{
			If (dist < 22)
				{
				PieFunc = %gnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %gnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %gnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %gnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %g1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %g2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %g3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %g4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %g5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %g6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %g6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %g6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %g6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 7
			{
			If (dist < 22)
				{
				PieFunc = %hnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %hnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %hnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %hnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %h1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %h2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %h3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %h4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %h5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %h6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %h6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %h6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %h6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 8
			{
			If (dist < 22)
				{
				PieFunc = %inull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %inull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %inull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %inull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %i1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %i2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %i3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %i4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %i5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %i6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %i6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %i6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %i6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 9
			{
			If (dist < 22)
				{
				PieFunc = %jnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %jnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %jnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %jnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %j1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %j2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %j3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %j4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %j5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %j6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %j6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %j6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %j6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 10
			{
			If (dist < 22)
				{
				PieFunc = %knull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %knull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %knull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %knull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %k1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %k2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %k3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %k4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %k5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %k6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %k6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %k6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %k6_ClickMods%					
				Goto %PieFunc%
				}
			}
		If PieMode = 11
			{
			If (dist < 22)
				{
				PieFunc = %lnull_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %lnull_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %lnull_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %lnull_ClickMods%
				Goto %PieFunc%
				}
			If angle between 0 and 60
				{
				PieFunc = %l1_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l1_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l1_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l1_ClickMods%				
				Goto %PieFunc%
				}
			If angle between 60 and 120 ;Top
				{
				PieFunc = %l2_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l2_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l2_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l2_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 120 and 180
				{
				PieFunc = %l3_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l3_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l3_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l3_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 180 and 240
				{
				PieFunc = %l4_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l4_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l4_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l4_ClickMods%						
				Goto %PieFunc%
				}
			If angle between 240 and 300 ;bottom
				{
				PieFunc = %l5_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l5_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l5_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l5_ClickMods%					
				Goto %PieFunc%
				}
			If angle between 300 and 360
				{
				PieFunc = %l6_FuncLabel%
				If PieFunc = SendKey
					SendKeys = %l6_SendLabel%
				If PieFunc = Run_Program
					ProgramtoRun = %l6_ExeFilePath%
				If PieFunc in Left_Click,Right_Click,Middle_Click
					ClickMods = %l6_ClickMods%					
				Goto %PieFunc%
				}
			}
	
	

	;------------------------------------------------------------------------------------------------------
	;Photoshop Pie Functions!!!
	;
	; To reference Photoshop tool names, go to https://autohotkey.com/boards/viewtopic.php?t=15078
	; To Make your own Functions, Make a reasonable label (like <13 characters) and replace spaces with "_"
	; You can block LMB by using BlockLButton := 1 and unblock it at the end with BlockLButton := 0.
	; Look at the loop in 'Shift+Drag' to see how the pie key is sensed, it had to be this way because of the weird way some
	; tablets send keypresses.
	;------------------------------------------------------------------------------------------------------
	
	
	;Template to create new functions below!  Get out of here if you're using notepad, at least use Notepad++ (and the ahk language https://autohotkey.com/boards/viewtopic.php?t=50  )  Also check out some of the other functions for reference or the YouTube video where I explain them.
	
	
	; My_Cool_AHK_Function:  ;This label corresponds to the name you put in the Functions.txt file.
		; {
		; BlockRButton := 1     ; This blocks RMB from interacting with the program (not this script though)
		;	;Check out the forum post reply by Suresh on how to use the COM commands to geet the active tools in photoshop.  https://autohotkey.com/boards/viewtopic.php?t=15078
		; appRef := ComObjActive( "Photoshop.Application" )
		; PrevTool = % appRef.CurrentTool  ;Current tool is stored to be switched to at the end of the function.
		;   ;This IF statement and it's TRUW function display the tooltips at the bottom of the screen
		 ; If ShowToolTips = 1 
			; {
			; StartDrawGDIP()
			; ClearDrawGDIP()	
			; Gdip_SetSmoothingMode(G, 4)
			; TXo := A_ScreenWidth / 2
			; TYo := A_ScreenHeight - 100
			; textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
			; Gdip_TextToGraphics(G, "Press and Release Pie Key to Unblock mouse buttons", textoptions)
			; EndDrawGDIP()
			; }

			;Put in functions which happen after selection
			
		;	;These lines of code act as a 'KeyWait' for the Pie Key, (or LMB, which you can take out).
		; pie_pressed := "D"
		; loop
			; {
			; sleep, 6
			; If pie_pressed = U
				; Break
			; If GetKeyState("LButton", "P")
				; Break
			; }
		
		;Put in function that happen after the Pie Key is pressed and released.
		
		;	;These lines of code erase the tooltip and unblock the Left and Right mouse buttons.
		; StartDrawGDIP()
		; ClearDrawGDIP()
		; EndDrawGDIP()
		; BlockRButton := 0 
		; BlockLButton := 0 
		; appRef.CurrentTool := PrevTool    ;Switch back to the Previous Tool
		; Return  
		; }
	No_Action:
		{
		Return
		}
	SendKey:
		{
		;Handles any User Hotkeys denoted in the PieMenuSettings.
		SendEvent, %SendKeys%  ;CHANGED SendInput to SendEvent,
		Return
		}
	Run_Program:
		{
		Run, % ProgramtoRun
		Return
		}
	Left_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			Send, %ModsDown%
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}			
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					loop
						{
						sleep, 6
						if tabletPressure = 0
							Break 2
						}
					}
				if GetKeyState("LButton", "P")
					{
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							Break 2
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			pie_pressed := "U"
			ModsDown := ""
			ModsUp := ""
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Left, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		}
	Right_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			BlockLButton := 1			
			Send, %ModsDown%
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}			
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					MouseClick, Right, , , ,0, D
					loop
						{
						sleep, 6
						if tabletPressure = 0
							{
							MouseClick, Right, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("LButton", "P")
					{
					MouseClick, Right, , , ,0, D
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							{
							MouseClick, Right, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Right, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		}
	Middle_Click:
		{
		If SubStr(ClickMods, 1, 1) = 1
			{
			ToolTipMods = Ctrl,%A_Space%
			ModsDown = {Ctrl Down}
			ModsUp = {Ctrl Up}
			}
		If SubStr(ClickMods, 2, 1) = 1
			{
			ToolTipMods = %ToolTipMods%Shift,%A_Space%
			ModsDown = %ModsDown%{Shift Down}
			ModsUp = %ModsUp%{Shift Up}
			}
		If SubStr(ClickMods, 3, 1) = 1
			{
			ToolTipMods = %ToolTipMods%Alt,%A_Space%
			ModsDown = %ModsDown%{Alt Down}
			ModsUp = %ModsUp%{Alt Up}
			}
		If SubStr(ClickMods, 4, 1) = 1
			{
			BlockLButton := 1
			If ShowToolTips = 1
				{
				StartDrawGDIP()
				ClearDrawGDIP()	
				
				Gdip_SetSmoothingMode(G, 4)
				
				TXo := A_ScreenWidth / 2
				TYo := A_ScreenHeight - 100
				textoptions = x%TXo% y%TYo% Center Vcenter cffF6F653 r4 s16
				ToolTipText = %ToolTipMods% are held Down, Disengaged after next click release/draw or if 'Pie Key' is pressed
				Gdip_TextToGraphics(G, ToolTipText, textoptions)
				EndDrawGDIP()
				}
			Send, %ModsDown%
			pie_pressed := "D"
			loop
				{
				Sleep, 6
				if tabletPressure > 0
					{
					MouseClick, Middle, , , ,0, D
					loop
						{
						sleep, 6
						if tabletPressure = 0
							{
							MouseClick, Middle, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("LButton", "P")
					{
					MouseClick, Middle, , , ,0, D
					loop
						{
						sleep, 6
						If !GetKeyState("LButton", "P")
							{
							MouseClick, Middle, , , ,0, U
							Break 2
							}
						}
					}
				if GetKeyState("RButton", "P")
					Goto, PieKillSwitch	
				if pie_pressed = U
					Goto, PieKillSwitch
				}
			Send, %ModsUp%
			pie_pressed := "U"
			ModsDown := ""
			ModsUp := ""
			StartDrawGDIP()
			ClearDrawGDIP()
			EndDrawGDIP()
			Return
			}
		Else
			{
			BlockInput, MouseMove
			Send, %ModsDown%
			MouseClick, Middle, MXi, MYi, ,0
			Send, %ModsUp%
			BlockInput, MouseMoveOff
			ModsDown := ""
			ModsUp := ""
			pie_pressed := "U"
			Return
			}
		}
	Pie_Menu_Settings:
		{
		Run, "%A_ScriptDir%\PieMenuSettings.ahk" Restart
		exitapp
		}
	Enter_Key:
		{
		send, {Enter}
		Return
		}
	Delete_Key:
		{
		send {del}
		Return
		}
	Close_Window:
		{
		WinClose A
		Return
		}
	Close_All_Scripts:
		{
		Run "%A_ScriptDir%\CloseAllAhkScripts.ahk"
		Return
		}
	Minimize_Window:
		{
		WinMinimize A
		Return
		}
	Switch_Application:
		{
		Send, {LWin Down}{Tab}{LWin Up}
		Return
		}
	Snip_Tool:
		{
		Send, {LWin Down}+s{LWin Up}
		Return
		}
	Resize_Window:
		{
		WinGetTitle, WinTitle, A
		WinGetPos, winX, winY, , , A
		WinMove, %WinTitle%,,,, MXi - winX, MYi - winY
		WinTitle := ""
		winX := ""
		winY := ""
		Return
		}
	}

ReleasePieKey:
	pie_pressed := "U"
Return

#If BlockRButton
RButton::
Return

#If BlockLButton
LButton::
Return

RMBMenuDeactivate:
{
	pie_pressed := "U"
Return
}
#SingleInstance ignore

LocalScriptFolder := "Local Pie Scripts"

FuncLoopCount := 1
loop
	{
	FileReadLine, DropList_FuncSub, %A_ScriptDir%\Resources\Functions.txt, FuncLoopCount
	If ErrorLevel = 1
		break
	If DropList_FuncSub = EndofList
		Break
	DropList_FuncSub := StrSplit(DropList_FuncSub, ":")
	; msgbox, % DropList_FuncSub[1]
	BuildFuncList := SubStr(DropList_FuncSub[1], 3)"|"
	FuncList = %FuncList%%BuildFuncList%
	FuncLoopCount := FuncLoopCount + 1
	; msgbox, %BuildFuncList%
	}
StringTrimRight, FuncList, FuncList, 2
; msgbox, %FuncList%

FileReadLine, PrevPieActivateKeySetting, %A_ScriptDir%\Resources\settingsfile.txt, 1
FuncLoopCount := 1
loop
	{
	FileReadLine, PieKeySub, %A_ScriptDir%\Resources\ValidPieKeys.txt, FuncLoopCount
	If ErrorLevel = 1
		break
	If PrevPieActivateKeySetting = %PieKeySub%
		PrevPieActivateKeyNumber := FuncLoopCount
	BuildPieKeyList := PieKeySub
	PieKeyList = %PieKeyList%|%BuildPieKeyList%
	FuncLoopCount := FuncLoopCount + 1
	}
StringTrimLeft, PieKeyList, PieKeyList, 1
AcceptablePieKeys = %PieKeyList%

FileReadLine, PrevPieLabelDelaySetting , %A_ScriptDir%\Resources\settingsfile.txt, 2
FileReadLine, PrevaPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 3
FileReadLine, PrevbPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 4
FileReadLine, PrevcPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 5
FileReadLine, PrevdPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 6
FileReadLine, PrevePieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 7
FileReadLine, PrevfPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 8
FileReadLine, PrevgPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 9
FileReadLine, PrevhPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 10
FileReadLine, PreviPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 11
FileReadLine, PrevjPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 12
FileReadLine, PrevkPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 13
FileReadLine, PrevlPieNumberSetting , %A_ScriptDir%\Resources\settingsfile.txt, 14

	
FileReadLine, PrevShiftPieMethod, %A_ScriptDir%\Resources\settingsfile.txt, 15
1PrevShiftPieMethod := 0
2PrevShiftPieMethod := 0
3PrevShiftPieMethod := 0
4PrevShiftPieMethod := 0
5PrevShiftPieMethod := 0
If PrevShiftPieMethod = 1
	1PrevShiftPieMethod := 1
If PrevShiftPieMethod = 2
	2PrevShiftPieMethod := 1
If PrevShiftPieMethod = 3
	3PrevShiftPieMethod := 1
If PrevShiftPieMethod = 4
	4PrevShiftPieMethod := 1
If PrevShiftPieMethod = 5
	5PrevShiftPieMethod := 1


FileReadLine, PrevDisplayTooltipsSetting,%A_ScriptDir%\Resources\settingsfile.txt, 16

FileReadLine, PrevPenTabletActive,       %A_ScriptDir%\Resources\settingsfile.txt, 18
FileReadLine, Prevanull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 19
FileReadLine, Prevanull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 20
FileReadLine, Prevanull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 21

FileReadLine, Preva1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 22
FileReadLine, Preva1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 23
FileReadLine, Preva1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 24
FileReadLine, Preva2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 25
FileReadLine, Preva2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 26
FileReadLine, Preva2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 27
FileReadLine, Preva3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 28
FileReadLine, Preva3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 29
FileReadLine, Preva3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 30
FileReadLine, Preva4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 31
FileReadLine, Preva4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 32
FileReadLine, Preva4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 33
FileReadLine, Preva5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 34
FileReadLine, Preva5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 35
FileReadLine, Preva5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 36
FileReadLine, Preva6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 37
FileReadLine, Preva6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 38
FileReadLine, Preva6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 39
FileReadLine, Preva_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 40 

FileReadLine, Prevbnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 41
FileReadLine, Prevbnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 42
FileReadLine, Prevbnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 43
FileReadLine, Prevb1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 44
FileReadLine, Prevb1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 45
FileReadLine, Prevb1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 46
FileReadLine, Prevb2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 47
FileReadLine, Prevb2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 48
FileReadLine, Prevb2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 49
FileReadLine, Prevb3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 50
FileReadLine, Prevb3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 51
FileReadLine, Prevb3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 52
FileReadLine, Prevb4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 53
FileReadLine, Prevb4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 54
FileReadLine, Prevb4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 55
FileReadLine, Prevb5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 56
FileReadLine, Prevb5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 57
FileReadLine, Prevb5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 58
FileReadLine, Prevb6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 59
FileReadLine, Prevb6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 60
FileReadLine, Prevb6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 61
FileReadLine, Prevb_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 62 

FileReadLine, prevcnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 63
FileReadLine, prevcnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 64
FileReadLine, prevcnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 65
FileReadLine, prevc1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 66
FileReadLine, prevc1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 67
FileReadLine, prevc1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 68
FileReadLine, prevc2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 69
FileReadLine, prevc2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 70
FileReadLine, prevc2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 71
FileReadLine, prevc3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 72
FileReadLine, prevc3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 73
FileReadLine, prevc3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 74
FileReadLine, prevc4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 75
FileReadLine, prevc4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 76
FileReadLine, prevc4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 77
FileReadLine, prevc5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 78
FileReadLine, prevc5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 79
FileReadLine, prevc5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 80
FileReadLine, prevc6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 81
FileReadLine, prevc6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 82
FileReadLine, prevc6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 83
FileReadLine, Prevc_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 84 

FileReadLine, Prevdnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 85
FileReadLine, Prevdnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 86
FileReadLine, Prevdnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 87
FileReadLine, Prevd1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 88
FileReadLine, Prevd1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 89
FileReadLine, Prevd1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 90
FileReadLine, Prevd2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 91
FileReadLine, Prevd2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 92
FileReadLine, Prevd2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 93
FileReadLine, Prevd3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 94
FileReadLine, Prevd3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 95
FileReadLine, Prevd3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 96
FileReadLine, Prevd4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 97
FileReadLine, Prevd4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 98
FileReadLine, Prevd4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 99
FileReadLine, Prevd5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 100
FileReadLine, Prevd5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 101
FileReadLine, Prevd5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 102
FileReadLine, Prevd6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 103
FileReadLine, Prevd6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 104
FileReadLine, Prevd6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 105
FileReadLine, Prevd_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 106 

FileReadLine, Prevenull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 107
FileReadLine, Prevenull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 108
FileReadLine, Prevenull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 109
FileReadLine, Preve1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 110
FileReadLine, Preve1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 111
FileReadLine, Preve1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 112
FileReadLine, Preve2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 113
FileReadLine, Preve2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 114
FileReadLine, Preve2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 115
FileReadLine, Preve3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 116
FileReadLine, Preve3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 117
FileReadLine, Preve3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 118
FileReadLine, Preve4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 119
FileReadLine, Preve4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 120
FileReadLine, Preve4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 121
FileReadLine, Preve5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 122
FileReadLine, Preve5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 123
FileReadLine, Preve5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 124
FileReadLine, Preve6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 125
FileReadLine, Preve6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 126
FileReadLine, Preve6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 127
FileReadLine, Preve_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 128 

FileReadLine, Prevfnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 129
FileReadLine, Prevfnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 130
FileReadLine, Prevfnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 131
FileReadLine, Prevf1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 132
FileReadLine, Prevf1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 133
FileReadLine, Prevf1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 134
FileReadLine, Prevf2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 135
FileReadLine, Prevf2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 136
FileReadLine, Prevf2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 137
FileReadLine, Prevf3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 138
FileReadLine, Prevf3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 139
FileReadLine, Prevf3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 140
FileReadLine, Prevf4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 141
FileReadLine, Prevf4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 142
FileReadLine, Prevf4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 143
FileReadLine, Prevf5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 144
FileReadLine, Prevf5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 145
FileReadLine, Prevf5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 146
FileReadLine, Prevf6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 147
FileReadLine, Prevf6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 148
FileReadLine, Prevf6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 149
FileReadLine, Prevf_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 150 

FileReadLine, Prevgnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 151
FileReadLine, Prevgnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 152
FileReadLine, Prevgnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 153
FileReadLine, Prevg1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 154
FileReadLine, Prevg1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 155
FileReadLine, Prevg1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 156
FileReadLine, Prevg2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 157
FileReadLine, Prevg2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 158
FileReadLine, Prevg2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 159
FileReadLine, Prevg3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 160
FileReadLine, Prevg3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 161
FileReadLine, Prevg3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 162
FileReadLine, Prevg4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 163
FileReadLine, Prevg4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 164
FileReadLine, Prevg4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 165
FileReadLine, Prevg5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 166
FileReadLine, Prevg5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 167
FileReadLine, Prevg5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 168
FileReadLine, Prevg6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 169
FileReadLine, Prevg6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 170
FileReadLine, Prevg6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 171
FileReadLine, Prevg_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 172 

FileReadLine, Prevhnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 173
FileReadLine, Prevhnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 174
FileReadLine, Prevhnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 175
FileReadLine, Prevh1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 176
FileReadLine, Prevh1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 177
FileReadLine, Prevh1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 178
FileReadLine, Prevh2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 179
FileReadLine, Prevh2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 180
FileReadLine, Prevh2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 181
FileReadLine, Prevh3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 182
FileReadLine, Prevh3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 183
FileReadLine, Prevh3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 184
FileReadLine, Prevh4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 185
FileReadLine, Prevh4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 186
FileReadLine, Prevh4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 187
FileReadLine, Prevh5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 188
FileReadLine, Prevh5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 189
FileReadLine, Prevh5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 190
FileReadLine, Prevh6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 191
FileReadLine, Prevh6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 192
FileReadLine, Prevh6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 193
FileReadLine, Prevh_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 194

FileReadLine, Previnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 195
FileReadLine, Previnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 196
FileReadLine, Previnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 197
FileReadLine, Previ1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 198
FileReadLine, Previ1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 199
FileReadLine, Previ1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 200
FileReadLine, Previ2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 201
FileReadLine, Previ2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 202
FileReadLine, Previ2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 203
FileReadLine, Previ3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 204
FileReadLine, Previ3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 205
FileReadLine, Previ3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 206
FileReadLine, Previ4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 207
FileReadLine, Previ4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 208
FileReadLine, Previ4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 209
FileReadLine, Previ5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 210
FileReadLine, Previ5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 211
FileReadLine, Previ5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 212
FileReadLine, Previ6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 213
FileReadLine, Previ6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 214
FileReadLine, Previ6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 215
FileReadLine, Previ_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 216 

FileReadLine, Prevjnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 217
FileReadLine, Prevjnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 218
FileReadLine, Prevjnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 219
FileReadLine, Prevj1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 220
FileReadLine, Prevj1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 221
FileReadLine, Prevj1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 222
FileReadLine, Prevj2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 223
FileReadLine, Prevj2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 224
FileReadLine, Prevj2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 225
FileReadLine, Prevj3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 226
FileReadLine, Prevj3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 227
FileReadLine, Prevj3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 228
FileReadLine, Prevj4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 229
FileReadLine, Prevj4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 230
FileReadLine, Prevj4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 231
FileReadLine, Prevj5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 232
FileReadLine, Prevj5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 233
FileReadLine, Prevj5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 234
FileReadLine, Prevj6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 235
FileReadLine, Prevj6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 236
FileReadLine, Prevj6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 237
FileReadLine, Prevj_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 238 

FileReadLine, Prevknull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 239
FileReadLine, Prevknull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 240
FileReadLine, Prevknull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 241
FileReadLine, Prevk1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 242
FileReadLine, Prevk1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 243
FileReadLine, Prevk1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 244
FileReadLine, Prevk2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 245
FileReadLine, Prevk2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 246
FileReadLine, Prevk2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 247
FileReadLine, Prevk3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 248
FileReadLine, Prevk3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 249
FileReadLine, Prevk3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 250
FileReadLine, Prevk4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 251
FileReadLine, Prevk4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 252
FileReadLine, Prevk4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 253
FileReadLine, Prevk5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 254
FileReadLine, Prevk5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 255
FileReadLine, Prevk5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 256
FileReadLine, Prevk6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 257
FileReadLine, Prevk6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 258
FileReadLine, Prevk6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 259
FileReadLine, Prevk_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 260 

FileReadLine, Prevlnull_Label, %A_ScriptDir%\Resources\settingsfile.txt, 261
FileReadLine, Prevlnull_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 262
FileReadLine, Prevlnull_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 263
FileReadLine, Prevl1_Label, %A_ScriptDir%\Resources\settingsfile.txt, 264
FileReadLine, Prevl1_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 265
FileReadLine, Prevl1_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 266
FileReadLine, Prevl2_Label, %A_ScriptDir%\Resources\settingsfile.txt, 267
FileReadLine, Prevl2_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 268
FileReadLine, Prevl2_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 269
FileReadLine, Prevl3_Label, %A_ScriptDir%\Resources\settingsfile.txt, 270
FileReadLine, Prevl3_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 271
FileReadLine, Prevl3_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 272
FileReadLine, Prevl4_Label, %A_ScriptDir%\Resources\settingsfile.txt, 273
FileReadLine, Prevl4_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 274
FileReadLine, Prevl4_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 275
FileReadLine, Prevl5_Label, %A_ScriptDir%\Resources\settingsfile.txt, 276
FileReadLine, Prevl5_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 277
FileReadLine, Prevl5_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 278
FileReadLine, Prevl6_Label, %A_ScriptDir%\Resources\settingsfile.txt, 279
FileReadLine, Prevl6_OverrideLabel, %A_ScriptDir%\Resources\settingsfile.txt, 280
FileReadLine, Prevl6_SendKeystroke, %A_ScriptDir%\Resources\settingsfile.txt, 281
FileReadLine, Prevl_Hotkey_Input, %A_ScriptDir%\Resources\settingsfile.txt, 282 

FileReadLine, anull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,283
FileReadLine,    a1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,284
FileReadLine,    a2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,285
FileReadLine,    a3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,286
FileReadLine,    a4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,287
FileReadLine,    a5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,288
FileReadLine,    a6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,289
FileReadLine, bnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,290
FileReadLine,    b1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,291
FileReadLine,    b2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,292
FileReadLine,    b3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,293
FileReadLine,    b4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,294
FileReadLine,    b5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,295
FileReadLine,    b6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,296

FileReadLine, cnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,297
FileReadLine,    c1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,298
FileReadLine,    c2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,299
FileReadLine,    c3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,300
FileReadLine,    c4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,301
FileReadLine,    c5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,302
FileReadLine,    c6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,303

FileReadLine, dnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,304
FileReadLine,    d1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,305
FileReadLine,    d2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,306
FileReadLine,    d3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,307
FileReadLine,    d4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,308
FileReadLine,    d5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,309
FileReadLine,    d6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,310

FileReadLine, enull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,311
FileReadLine,    e1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,312
FileReadLine,    e2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,313
FileReadLine,    e3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,314
FileReadLine,    e4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,315
FileReadLine,    e5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,316
FileReadLine,    e6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,317

FileReadLine, fnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,318
FileReadLine,    f1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,319
FileReadLine,    f2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,320
FileReadLine,    f3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,321
FileReadLine,    f4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,322
FileReadLine,    f5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,323
FileReadLine,    f6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,324

FileReadLine, gnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,325
FileReadLine,    g1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,326
FileReadLine,    g2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,327
FileReadLine,    g3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,328
FileReadLine,    g4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,329
FileReadLine,    g5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,330
FileReadLine,    g6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,331

FileReadLine, hnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,332
FileReadLine,    h1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,333
FileReadLine,    h2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,334
FileReadLine,    h3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,335
FileReadLine,    h4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,336
FileReadLine,    h5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,337
FileReadLine,    h6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,338

FileReadLine, inull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,339
FileReadLine,    i1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,340
FileReadLine,    i2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,341
FileReadLine,    i3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,342
FileReadLine,    i4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,343
FileReadLine,    i5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,344
FileReadLine,    i6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,345

FileReadLine, jnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,346
FileReadLine,    j1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,347
FileReadLine,    j2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,348
FileReadLine,    j3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,349
FileReadLine,    j4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,350
FileReadLine,    j5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,351
FileReadLine,    j6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,352

FileReadLine, knull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,353
FileReadLine,    k1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,354
FileReadLine,    k2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,355
FileReadLine,    k3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,356
FileReadLine,    k4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,357
FileReadLine,    k5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,358
FileReadLine,    k6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,359

FileReadLine, lnull_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,360
FileReadLine,    l1_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,361
FileReadLine,    l2_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,362
FileReadLine,    l3_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,363
FileReadLine,    l4_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,364
FileReadLine,    l5_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,365
FileReadLine,    l6_PrevExeFilePath    ,%A_ScriptDir%\Resources\settingsfile.txt,366

FileReadLine,    PrevPieMenuSize       ,%A_ScriptDir%\Resources\settingsfile.txt,367

FileReadLine,  Prevanull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,368
FileReadLine,     Preva1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,369
FileReadLine,     Preva2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,370
FileReadLine,     Preva3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,371
FileReadLine,     Preva4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,372
FileReadLine,     Preva5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,373
FileReadLine,     Preva6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,374
FileReadLine,  Prevbnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,375
FileReadLine,     Prevb1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,376
FileReadLine,     Prevb2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,377
FileReadLine,     Prevb3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,378
FileReadLine,     Prevb4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,379
FileReadLine,     Prevb5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,380
FileReadLine,     Prevb6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,381

FileReadLine,  Prevcnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,382
FileReadLine,     prevc1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,383
FileReadLine,     prevc2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,384
FileReadLine,     prevc3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,385
FileReadLine,     prevc4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,386
FileReadLine,     prevc5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,387
FileReadLine,     prevc6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,388

FileReadLine,  Prevdnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,389
FileReadLine,     Prevd1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,390
FileReadLine,     Prevd2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,391
FileReadLine,     Prevd3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,392
FileReadLine,     Prevd4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,393
FileReadLine,     Prevd5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,394
FileReadLine,     Prevd6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,395

FileReadLine,  Prevenull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,396
FileReadLine,     Preve1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,397
FileReadLine,     Preve2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,398
FileReadLine,     Preve3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,399
FileReadLine,     Preve4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,400
FileReadLine,     Preve5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,401
FileReadLine,     Preve6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,402

FileReadLine,  Prevfnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,403
FileReadLine,     Prevf1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,404
FileReadLine,     Prevf2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,405
FileReadLine,     Prevf3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,406
FileReadLine,     Prevf4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,407
FileReadLine,     Prevf5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,408
FileReadLine,     Prevf6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,409

FileReadLine,  Prevgnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,410
FileReadLine,     Prevg1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,411
FileReadLine,     Prevg2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,412
FileReadLine,     Prevg3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,413
FileReadLine,     Prevg4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,414
FileReadLine,     Prevg5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,415
FileReadLine,     Prevg6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,416

FileReadLine,  Prevhnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,417
FileReadLine,     Prevh1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,418
FileReadLine,     Prevh2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,419
FileReadLine,     Prevh3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,420
FileReadLine,     Prevh4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,421
FileReadLine,     Prevh5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,422
FileReadLine,     Prevh6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,423

FileReadLine,  Previnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,424
FileReadLine,     Previ1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,425
FileReadLine,     Previ2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,426
FileReadLine,     Previ3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,427
FileReadLine,     Previ4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,428
FileReadLine,     Previ5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,429
FileReadLine,     Previ6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,430

FileReadLine,  Prevjnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,431
FileReadLine,     Prevj1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,432
FileReadLine,     Prevj2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,433
FileReadLine,     Prevj3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,434
FileReadLine,     Prevj4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,435
FileReadLine,     Prevj5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,436
FileReadLine,     Prevj6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,437

FileReadLine,  Prevknull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,438
FileReadLine,     Prevk1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,439
FileReadLine,     Prevk2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,440
FileReadLine,     Prevk3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,441
FileReadLine,     Prevk4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,442
FileReadLine,     Prevk5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,443
FileReadLine,     Prevk6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,444

FileReadLine,  Prevlnull_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,445
FileReadLine,     Prevl1_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,446
FileReadLine,     Prevl2_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,447
FileReadLine,     Prevl3_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,448
FileReadLine,     Prevl4_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,449
FileReadLine,     Prevl5_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,450
FileReadLine,     Prevl6_ClickModifiers,%A_ScriptDir%\Resources\settingsfile.txt,451

FileReadLine, PrevaPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 452
FileReadLine, PrevbPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 453
FileReadLine, PrevcPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 454
FileReadLine, PrevdPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 455
FileReadLine, PrevePieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 456
FileReadLine, PrevfPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 457
FileReadLine, PrevgPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 458
FileReadLine, PrevhPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 459
FileReadLine, PreviPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 460
FileReadLine, PrevjPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 461
FileReadLine, PrevkPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 462
FileReadLine, PrevlPieTabLabel, %A_ScriptDir%\Resources\settingsfile.txt, 463

FileReadLine, PrevaPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 464
FileReadLine, PrevbPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 465
FileReadLine, PrevcPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 466
FileReadLine, PrevdPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 467
FileReadLine, PrevePieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 468
FileReadLine, PrevfPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 469
FileReadLine, PrevgPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 470
FileReadLine, PrevhPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 471
FileReadLine, PreviPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 472
FileReadLine, PrevjPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 473
FileReadLine, PrevkPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 474
FileReadLine, PrevlPieHotkey_Modifiers, %A_ScriptDir%\Resources\settingsfile.txt, 475

FuncLoopCount := 1
loop
	{
	FileReadLine, PieHotkeySub, %A_ScriptDir%\Resources\ValidPieHotKeys.txt, FuncLoopCount
	If ErrorLevel = 1
		break
	If Preva_Hotkey_Input = %PieHotkeySub%
		PrevaPieHotkeyKeyNumber := FuncLoopCount
	If Prevb_Hotkey_Input = %PieHotkeySub%
		PrevbPieHotkeyKeyNumber := FuncLoopCount
	If Prevc_Hotkey_Input = %PieHotkeySub%
		PrevcPieHotkeyKeyNumber := FuncLoopCount
	If Prevd_Hotkey_Input = %PieHotkeySub%
		PrevdPieHotkeyKeyNumber := FuncLoopCount
	If Preve_Hotkey_Input = %PieHotkeySub%
		PrevePieHotkeyKeyNumber := FuncLoopCount
	If Prevf_Hotkey_Input = %PieHotkeySub%
		PrevfPieHotkeyKeyNumber := FuncLoopCount
	If Prevg_Hotkey_Input = %PieHotkeySub%
		PrevgPieHotkeyKeyNumber := FuncLoopCount
	If Prevh_Hotkey_Input = %PieHotkeySub%
		PrevhPieHotkeyKeyNumber := FuncLoopCount
	If Previ_Hotkey_Input = %PieHotkeySub%
		PreviPieHotkeyKeyNumber := FuncLoopCount
	If Prevj_Hotkey_Input = %PieHotkeySub%
		PrevjPieHotkeyKeyNumber := FuncLoopCount
	If Prevk_Hotkey_Input = %PieHotkeySub%
		PrevkPieHotkeyKeyNumber := FuncLoopCount
	If Prevl_Hotkey_Input = %PieHotkeySub%
		PrevlPieHotkeyKeyNumber := FuncLoopCount
	BuildPieHotkeyList := PieHotkeySub
	PieHotkeyList = %PieHotkeyList%|%BuildPieHotkeyList%
	FuncLoopCount := FuncLoopCount + 1
	}
StringTrimLeft, PieHotkeyList, PieHotkeyList, 1
AcceptablePieHotkeys = %PieHotkeyList%

If !PrevaPieHotkey_Modifiers
	PrevaPieHotkey_Modifiers = "000" 
If !PrevbPieHotkey_Modifiers
	PrevbPieHotkey_Modifiers = "000" 
If !PrevcPieHotkey_Modifiers
	PrevcPieHotkey_Modifiers = "000" 
If !PrevdPieHotkey_Modifiers
	PrevdPieHotkey_Modifiers = "000" 
If !PrevePieHotkey_Modifiers
	PrevePieHotkey_Modifiers = "000" 
If !PrevfPieHotkey_Modifiers
	PrevfPieHotkey_Modifiers = "000" 
If !PrevgPieHotkey_Modifiers
	PrevgPieHotkey_Modifiers = "000" 
If !PrevhPieHotkey_Modifiers
	PrevhPieHotkey_Modifiers = "000" 
If !PreviPieHotkey_Modifiers
	PreviPieHotkey_Modifiers = "000" 
If !PrevjPieHotkey_Modifiers
	PrevjPieHotkey_Modifiers = "000" 
If !PrevkPieHotkey_Modifiers
	PrevkPieHotkey_Modifiers = "000" 
If !PrevlPieHotkey_Modifiers
	PrevlPieHotkey_Modifiers = "000" 
	


If !Prevanull_ClickModifiers
    Prevanull_ClickModifiers = "0000"
If !Preva1_ClickModifiers
    Preva1_ClickModifiers = "0000"
If !Preva2_ClickModifiers
    Preva2_ClickModifiers = "0000"
If !Preva3_ClickModifiers
    Preva3_ClickModifiers = "0000"
If !Preva4_ClickModifiers
    Preva4_ClickModifiers = "0000"
If !Preva5_ClickModifiers
    Preva5_ClickModifiers = "0000"
If !Preva6_ClickModifiers
    Preva6_ClickModifiers = "0000"

If !Prevbnull_ClickModifiers
    Prevbnull_ClickModifiers = "0000"
If !Prevb1_ClickModifiers
    Prevb1_ClickModifiers = "0000"
If !Prevb2_ClickModifiers
    Prevb2_ClickModifiers = "0000"
If !Prevb3_ClickModifiers
    Prevb3_ClickModifiers = "0000"
If !Prevb4_ClickModifiers
    Prevb4_ClickModifiers = "0000"
If !Prevb5_ClickModifiers
    Prevb5_ClickModifiers = "0000"
If !Prevb6_ClickModifiers
    Prevb6_ClickModifiers = "0000"


If !Prevcnull_ClickModifiers
    Prevcnull_ClickModifiers = "0000"
If !Prevc1_ClickModifiers
    Prevc1_ClickModifiers = "0000"
If !Prevc2_ClickModifiers
    Prevc2_ClickModifiers = "0000"
If !Prevc3_ClickModifiers
    Prevc3_ClickModifiers = "0000"
If !Prevc4_ClickModifiers
    Prevc4_ClickModifiers = "0000"
If !Prevc5_ClickModifiers
    Prevc5_ClickModifiers = "0000"
If !Prevc6_ClickModifiers
    Prevc6_ClickModifiers = "0000"

If !Prevdnull_ClickModifiers
    Prevdnull_ClickModifiers = "0000"
If !Prevd1_ClickModifiers
    Prevd1_ClickModifiers = "0000"
If !Prevd2_ClickModifiers
    Prevd2_ClickModifiers = "0000"
If !Prevd3_ClickModifiers
    Prevd3_ClickModifiers = "0000"
If !Prevd4_ClickModifiers
    Prevd4_ClickModifiers = "0000"
If !Prevd5_ClickModifiers
    Prevd5_ClickModifiers = "0000"
If !Prevd6_ClickModifiers
    Prevd6_ClickModifiers = "0000"

If !Prevenull_ClickModifiers
    Prevenull_ClickModifiers = "0000"
If !Preve1_ClickModifiers
    Preve1_ClickModifiers = "0000"
If !Preve2_ClickModifiers
    Preve2_ClickModifiers = "0000"
If !Preve3_ClickModifiers
    Preve3_ClickModifiers = "0000"
If !Preve4_ClickModifiers
    Preve4_ClickModifiers = "0000"
If !Preve5_ClickModifiers
    Preve5_ClickModifiers = "0000"
If !Preve6_ClickModifiers
    Preve6_ClickModifiers = "0000"

If !Prevfnull_ClickModifiers
    Prevfnull_ClickModifiers = "0000"
If !Prevf1_ClickModifiers
    Prevf1_ClickModifiers = "0000"
If !Prevf2_ClickModifiers
    Prevf2_ClickModifiers = "0000"
If !Prevf3_ClickModifiers
    Prevf3_ClickModifiers = "0000"
If !Prevf4_ClickModifiers
    Prevf4_ClickModifiers = "0000"
If !Prevf5_ClickModifiers
    Prevf5_ClickModifiers = "0000"
If !Prevf6_ClickModifiers
    Prevf6_ClickModifiers = "0000"

If !Prevgnull_ClickModifiers
    Prevgnull_ClickModifiers = "0000"
If !Prevg1_ClickModifiers
    Prevg1_ClickModifiers = "0000"
If !Prevg2_ClickModifiers
    Prevg2_ClickModifiers = "0000"
If !Prevg3_ClickModifiers
    Prevg3_ClickModifiers = "0000"
If !Prevg4_ClickModifiers
    Prevg4_ClickModifiers = "0000"
If !Prevg5_ClickModifiers
    Prevg5_ClickModifiers = "0000"
If !Prevg6_ClickModifiers
    Prevg6_ClickModifiers = "0000"

If !Prevhnull_ClickModifiers
    Prevhnull_ClickModifiers = "0000"
If !Prevh1_ClickModifiers
    Prevh1_ClickModifiers = "0000"
If !Prevh2_ClickModifiers
    Prevh2_ClickModifiers = "0000"
If !Prevh3_ClickModifiers
    Prevh3_ClickModifiers = "0000"
If !Prevh4_ClickModifiers
    Prevh4_ClickModifiers = "0000"
If !Prevh5_ClickModifiers
    Prevh5_ClickModifiers = "0000"
If !Prevh6_ClickModifiers
    Prevh6_ClickModifiers = "0000"

If !Previnull_ClickModifiers
    Previnull_ClickModifiers = "0000"
If !Previ1_ClickModifiers
    Previ1_ClickModifiers = "0000"
If !Previ2_ClickModifiers
    Previ2_ClickModifiers = "0000"
If !Previ3_ClickModifiers
    Previ3_ClickModifiers = "0000"
If !Previ4_ClickModifiers
    Previ4_ClickModifiers = "0000"
If !Previ5_ClickModifiers
    Previ5_ClickModifiers = "0000"
If !Previ6_ClickModifiers
    Previ6_ClickModifiers = "0000"

If !Prevjnull_ClickModifiers
    Prevjnull_ClickModifiers = "0000"
If !Prevj1_ClickModifiers
    Prevj1_ClickModifiers = "0000"
If !Prevj2_ClickModifiers
    Prevj2_ClickModifiers = "0000"
If !Prevj3_ClickModifiers
    Prevj3_ClickModifiers = "0000"
If !Prevj4_ClickModifiers
    Prevj4_ClickModifiers = "0000"
If !Prevj5_ClickModifiers
    Prevj5_ClickModifiers = "0000"
If !Prevj6_ClickModifiers
    Prevj6_ClickModifiers = "0000"

If !Prevknull_ClickModifiers
    Prevknull_ClickModifiers = "0000"
If !Prevk1_ClickModifiers
    Prevk1_ClickModifiers = "0000"
If !Prevk2_ClickModifiers
    Prevk2_ClickModifiers = "0000"
If !Prevk3_ClickModifiers
    Prevk3_ClickModifiers = "0000"
If !Prevk4_ClickModifiers
    Prevk4_ClickModifiers = "0000"
If !Prevk5_ClickModifiers
    Prevk5_ClickModifiers = "0000"
If !Prevk6_ClickModifiers
    Prevk6_ClickModifiers = "0000"

If !Prevlnull_ClickModifiers
    Prevlnull_ClickModifiers = "0000"
If !Prevl1_ClickModifiers
    Prevl1_ClickModifiers = "0000"
If !Prevl2_ClickModifiers
    Prevl2_ClickModifiers = "0000"
If !Prevl3_ClickModifiers
    Prevl3_ClickModifiers = "0000"
If !Prevl4_ClickModifiers
    Prevl4_ClickModifiers = "0000"
If !Prevl5_ClickModifiers
    Prevl5_ClickModifiers = "0000"
If !Prevl6_ClickModifiers
    Prevl6_ClickModifiers = "0000"


anull_MBCtrl  := substr(Prevanull_ClickModifiers, 1, 1)
anull_MBShift := substr(Prevanull_ClickModifiers, 2, 1)
anull_MBAlt   := substr(Prevanull_ClickModifiers, 3, 1)
anull_MBDrag  := substr(Prevanull_ClickModifiers, 4, 1)
a1_MBCtrl  := substr(Preva1_ClickModifiers, 1, 1)
a1_MBShift := substr(Preva1_ClickModifiers, 2, 1)
a1_MBAlt   := substr(Preva1_ClickModifiers, 3, 1)
a1_MBDrag  := substr(Preva1_ClickModifiers, 4, 1)
a2_MBCtrl  := substr(Preva2_ClickModifiers, 1, 1)
a2_MBShift := substr(Preva2_ClickModifiers, 2, 1)
a2_MBAlt   := substr(Preva2_ClickModifiers, 3, 1)
a2_MBDrag  := substr(Preva2_ClickModifiers, 4, 1)
a3_MBCtrl  := substr(Preva3_ClickModifiers, 1, 1)
a3_MBShift := substr(Preva3_ClickModifiers, 2, 1)
a3_MBAlt   := substr(Preva3_ClickModifiers, 3, 1)
a3_MBDrag  := substr(Preva3_ClickModifiers, 4, 1)
a4_MBCtrl  := substr(Preva4_ClickModifiers, 1, 1)
a4_MBShift := substr(Preva4_ClickModifiers, 2, 1)
a4_MBAlt   := substr(Preva4_ClickModifiers, 3, 1)
a4_MBDrag  := substr(Preva4_ClickModifiers, 4, 1)
a5_MBCtrl  := substr(Preva5_ClickModifiers, 1, 1)
a5_MBShift := substr(Preva5_ClickModifiers, 2, 1)
a5_MBAlt   := substr(Preva5_ClickModifiers, 3, 1)
a5_MBDrag  := substr(Preva5_ClickModifiers, 4, 1)
a6_MBCtrl  := substr(Preva6_ClickModifiers, 1, 1)
a6_MBShift := substr(Preva6_ClickModifiers, 2, 1)
a6_MBAlt   := substr(Preva6_ClickModifiers, 3, 1)
a6_MBDrag  := substr(Preva6_ClickModifiers, 4, 1)


bnull_MBCtrl  := substr(Prevbnull_ClickModifiers, 1, 1)
bnull_MBShift := substr(Prevbnull_ClickModifiers, 2, 1)
bnull_MBAlt   := substr(Prevbnull_ClickModifiers, 3, 1)
bnull_MBDrag  := substr(Prevbnull_ClickModifiers, 4, 1)
b1_MBCtrl  := substr(Prevb1_ClickModifiers, 1, 1)
b1_MBShift := substr(Prevb1_ClickModifiers, 2, 1)
b1_MBAlt   := substr(Prevb1_ClickModifiers, 3, 1)
b1_MBDrag  := substr(Prevb1_ClickModifiers, 4, 1)
b2_MBCtrl  := substr(Prevb2_ClickModifiers, 1, 1)
b2_MBShift := substr(Prevb2_ClickModifiers, 2, 1)
b2_MBAlt   := substr(Prevb2_ClickModifiers, 3, 1)
b2_MBDrag  := substr(Prevb2_ClickModifiers, 4, 1)
b3_MBCtrl  := substr(Prevb3_ClickModifiers, 1, 1)
b3_MBShift := substr(Prevb3_ClickModifiers, 2, 1)
b3_MBAlt   := substr(Prevb3_ClickModifiers, 3, 1)
b3_MBDrag  := substr(Prevb3_ClickModifiers, 4, 1)
b4_MBCtrl  := substr(Prevb4_ClickModifiers, 1, 1)
b4_MBShift := substr(Prevb4_ClickModifiers, 2, 1)
b4_MBAlt   := substr(Prevb4_ClickModifiers, 3, 1)
b4_MBDrag  := substr(Prevb4_ClickModifiers, 4, 1)
b5_MBCtrl  := substr(Prevb5_ClickModifiers, 1, 1)
b5_MBShift := substr(Prevb5_ClickModifiers, 2, 1)
b5_MBAlt   := substr(Prevb5_ClickModifiers, 3, 1)
b5_MBDrag  := substr(Prevb5_ClickModifiers, 4, 1)
b6_MBCtrl  := substr(Prevb6_ClickModifiers, 1, 1)
b6_MBShift := substr(Prevb6_ClickModifiers, 2, 1)
b6_MBAlt   := substr(Prevb6_ClickModifiers, 3, 1)
b6_MBDrag  := substr(Prevb6_ClickModifiers, 4, 1)


cnull_MBCtrl  := substr(Prevcnull_ClickModifiers, 1, 1)
cnull_MBShift := substr(Prevcnull_ClickModifiers, 2, 1)
cnull_MBAlt   := substr(Prevcnull_ClickModifiers, 3, 1)
cnull_MBDrag  := substr(Prevcnull_ClickModifiers, 4, 1)
c1_MBCtrl  := substr(Prevc1_ClickModifiers, 1, 1)
c1_MBShift := substr(Prevc1_ClickModifiers, 2, 1)
c1_MBAlt   := substr(Prevc1_ClickModifiers, 3, 1)
c1_MBDrag  := substr(Prevc1_ClickModifiers, 4, 1)
c2_MBCtrl  := substr(Prevc2_ClickModifiers, 1, 1)
c2_MBShift := substr(Prevc2_ClickModifiers, 2, 1)
c2_MBAlt   := substr(Prevc2_ClickModifiers, 3, 1)
c2_MBDrag  := substr(Prevc2_ClickModifiers, 4, 1)
c3_MBCtrl  := substr(Prevc3_ClickModifiers, 1, 1)
c3_MBShift := substr(Prevc3_ClickModifiers, 2, 1)
c3_MBAlt   := substr(Prevc3_ClickModifiers, 3, 1)
c3_MBDrag  := substr(Prevc3_ClickModifiers, 4, 1)
c4_MBCtrl  := substr(Prevc4_ClickModifiers, 1, 1)
c4_MBShift := substr(Prevc4_ClickModifiers, 2, 1)
c4_MBAlt   := substr(Prevc4_ClickModifiers, 3, 1)
c4_MBDrag  := substr(Prevc4_ClickModifiers, 4, 1)
c5_MBCtrl  := substr(Prevc5_ClickModifiers, 1, 1)
c5_MBShift := substr(Prevc5_ClickModifiers, 2, 1)
c5_MBAlt   := substr(Prevc5_ClickModifiers, 3, 1)
c5_MBDrag  := substr(Prevc5_ClickModifiers, 4, 1)
c6_MBCtrl  := substr(Prevc6_ClickModifiers, 1, 1)
c6_MBShift := substr(Prevc6_ClickModifiers, 2, 1)
c6_MBAlt   := substr(Prevc6_ClickModifiers, 3, 1)
c6_MBDrag  := substr(Prevc6_ClickModifiers, 4, 1)



dnull_MBCtrl  := substr(Prevdnull_ClickModifiers, 1, 1)
dnull_MBShift := substr(Prevdnull_ClickModifiers, 2, 1)
dnull_MBAlt   := substr(Prevdnull_ClickModifiers, 3, 1)
dnull_MBDrag  := substr(Prevdnull_ClickModifiers, 4, 1)
d1_MBCtrl  := substr(Prevd1_ClickModifiers, 1, 1)
d1_MBShift := substr(Prevd1_ClickModifiers, 2, 1)
d1_MBAlt   := substr(Prevd1_ClickModifiers, 3, 1)
d1_MBDrag  := substr(Prevd1_ClickModifiers, 4, 1)
d2_MBCtrl  := substr(Prevd2_ClickModifiers, 1, 1)
d2_MBShift := substr(Prevd2_ClickModifiers, 2, 1)
d2_MBAlt   := substr(Prevd2_ClickModifiers, 3, 1)
d2_MBDrag  := substr(Prevd2_ClickModifiers, 4, 1)
d3_MBCtrl  := substr(Prevd3_ClickModifiers, 1, 1)
d3_MBShift := substr(Prevd3_ClickModifiers, 2, 1)
d3_MBAlt   := substr(Prevd3_ClickModifiers, 3, 1)
d3_MBDrag  := substr(Prevd3_ClickModifiers, 4, 1)
d4_MBCtrl  := substr(Prevd4_ClickModifiers, 1, 1)
d4_MBShift := substr(Prevd4_ClickModifiers, 2, 1)
d4_MBAlt   := substr(Prevd4_ClickModifiers, 3, 1)
d4_MBDrag  := substr(Prevd4_ClickModifiers, 4, 1)
d5_MBCtrl  := substr(Prevd5_ClickModifiers, 1, 1)
d5_MBShift := substr(Prevd5_ClickModifiers, 2, 1)
d5_MBAlt   := substr(Prevd5_ClickModifiers, 3, 1)
d5_MBDrag  := substr(Prevd5_ClickModifiers, 4, 1)
d6_MBCtrl  := substr(Prevd6_ClickModifiers, 1, 1)
d6_MBShift := substr(Prevd6_ClickModifiers, 2, 1)
d6_MBAlt   := substr(Prevd6_ClickModifiers, 3, 1)
d6_MBDrag  := substr(Prevd6_ClickModifiers, 4, 1)



enull_MBCtrl  := substr(Prevenull_ClickModifiers, 1, 1)
enull_MBShift := substr(Prevenull_ClickModifiers, 2, 1)
enull_MBAlt   := substr(Prevenull_ClickModifiers, 3, 1)
enull_MBDrag  := substr(Prevenull_ClickModifiers, 4, 1)
e1_MBCtrl  := substr(Preve1_ClickModifiers, 1, 1)
e1_MBShift := substr(Preve1_ClickModifiers, 2, 1)
e1_MBAlt   := substr(Preve1_ClickModifiers, 3, 1)
e1_MBDrag  := substr(Preve1_ClickModifiers, 4, 1)
e2_MBCtrl  := substr(Preve2_ClickModifiers, 1, 1)
e2_MBShift := substr(Preve2_ClickModifiers, 2, 1)
e2_MBAlt   := substr(Preve2_ClickModifiers, 3, 1)
e2_MBDrag  := substr(Preve2_ClickModifiers, 4, 1)
e3_MBCtrl  := substr(Preve3_ClickModifiers, 1, 1)
e3_MBShift := substr(Preve3_ClickModifiers, 2, 1)
e3_MBAlt   := substr(Preve3_ClickModifiers, 3, 1)
e3_MBDrag  := substr(Preve3_ClickModifiers, 4, 1)
e4_MBCtrl  := substr(Preve4_ClickModifiers, 1, 1)
e4_MBShift := substr(Preve4_ClickModifiers, 2, 1)
e4_MBAlt   := substr(Preve4_ClickModifiers, 3, 1)
e4_MBDrag  := substr(Preve4_ClickModifiers, 4, 1)
e5_MBCtrl  := substr(Preve5_ClickModifiers, 1, 1)
e5_MBShift := substr(Preve5_ClickModifiers, 2, 1)
e5_MBAlt   := substr(Preve5_ClickModifiers, 3, 1)
e5_MBDrag  := substr(Preve5_ClickModifiers, 4, 1)
e6_MBCtrl  := substr(Preve6_ClickModifiers, 1, 1)
e6_MBShift := substr(Preve6_ClickModifiers, 2, 1)
e6_MBAlt   := substr(Preve6_ClickModifiers, 3, 1)
e6_MBDrag  := substr(Preve6_ClickModifiers, 4, 1)



fnull_MBCtrl  := substr(Prevfnull_ClickModifiers, 1, 1)
fnull_MBShift := substr(Prevfnull_ClickModifiers, 2, 1)
fnull_MBAlt   := substr(Prevfnull_ClickModifiers, 3, 1)
fnull_MBDrag  := substr(Prevfnull_ClickModifiers, 4, 1)
f1_MBCtrl  := substr(Prevf1_ClickModifiers, 1, 1)
f1_MBShift := substr(Prevf1_ClickModifiers, 2, 1)
f1_MBAlt   := substr(Prevf1_ClickModifiers, 3, 1)
f1_MBDrag  := substr(Prevf1_ClickModifiers, 4, 1)
f2_MBCtrl  := substr(Prevf2_ClickModifiers, 1, 1)
f2_MBShift := substr(Prevf2_ClickModifiers, 2, 1)
f2_MBAlt   := substr(Prevf2_ClickModifiers, 3, 1)
f2_MBDrag  := substr(Prevf2_ClickModifiers, 4, 1)
f3_MBCtrl  := substr(Prevf3_ClickModifiers, 1, 1)
f3_MBShift := substr(Prevf3_ClickModifiers, 2, 1)
f3_MBAlt   := substr(Prevf3_ClickModifiers, 3, 1)
f3_MBDrag  := substr(Prevf3_ClickModifiers, 4, 1)
f4_MBCtrl  := substr(Prevf4_ClickModifiers, 1, 1)
f4_MBShift := substr(Prevf4_ClickModifiers, 2, 1)
f4_MBAlt   := substr(Prevf4_ClickModifiers, 3, 1)
f4_MBDrag  := substr(Prevf4_ClickModifiers, 4, 1)
f5_MBCtrl  := substr(Prevf5_ClickModifiers, 1, 1)
f5_MBShift := substr(Prevf5_ClickModifiers, 2, 1)
f5_MBAlt   := substr(Prevf5_ClickModifiers, 3, 1)
f5_MBDrag  := substr(Prevf5_ClickModifiers, 4, 1)
f6_MBCtrl  := substr(Prevf6_ClickModifiers, 1, 1)
f6_MBShift := substr(Prevf6_ClickModifiers, 2, 1)
f6_MBAlt   := substr(Prevf6_ClickModifiers, 3, 1)
f6_MBDrag  := substr(Prevf6_ClickModifiers, 4, 1)



gnull_MBCtrl  := substr(Prevgnull_ClickModifiers, 1, 1)
gnull_MBShift := substr(Prevgnull_ClickModifiers, 2, 1)
gnull_MBAlt   := substr(Prevgnull_ClickModifiers, 3, 1)
gnull_MBDrag  := substr(Prevgnull_ClickModifiers, 4, 1)
g1_MBCtrl  := substr(Prevg1_ClickModifiers, 1, 1)
g1_MBShift := substr(Prevg1_ClickModifiers, 2, 1)
g1_MBAlt   := substr(Prevg1_ClickModifiers, 3, 1)
g1_MBDrag  := substr(Prevg1_ClickModifiers, 4, 1)
g2_MBCtrl  := substr(Prevg2_ClickModifiers, 1, 1)
g2_MBShift := substr(Prevg2_ClickModifiers, 2, 1)
g2_MBAlt   := substr(Prevg2_ClickModifiers, 3, 1)
g2_MBDrag  := substr(Prevg2_ClickModifiers, 4, 1)
g3_MBCtrl  := substr(Prevg3_ClickModifiers, 1, 1)
g3_MBShift := substr(Prevg3_ClickModifiers, 2, 1)
g3_MBAlt   := substr(Prevg3_ClickModifiers, 3, 1)
g3_MBDrag  := substr(Prevg3_ClickModifiers, 4, 1)
g4_MBCtrl  := substr(Prevg4_ClickModifiers, 1, 1)
g4_MBShift := substr(Prevg4_ClickModifiers, 2, 1)
g4_MBAlt   := substr(Prevg4_ClickModifiers, 3, 1)
g4_MBDrag  := substr(Prevg4_ClickModifiers, 4, 1)
g5_MBCtrl  := substr(Prevg5_ClickModifiers, 1, 1)
g5_MBShift := substr(Prevg5_ClickModifiers, 2, 1)
g5_MBAlt   := substr(Prevg5_ClickModifiers, 3, 1)
g5_MBDrag  := substr(Prevg5_ClickModifiers, 4, 1)
g6_MBCtrl  := substr(Prevg6_ClickModifiers, 1, 1)
g6_MBShift := substr(Prevg6_ClickModifiers, 2, 1)
g6_MBAlt   := substr(Prevg6_ClickModifiers, 3, 1)
g6_MBDrag  := substr(Prevg6_ClickModifiers, 4, 1)



hnull_MBCtrl  := substr(Prevhnull_ClickModifiers, 1, 1)
hnull_MBShift := substr(Prevhnull_ClickModifiers, 2, 1)
hnull_MBAlt   := substr(Prevhnull_ClickModifiers, 3, 1)
hnull_MBDrag  := substr(Prevhnull_ClickModifiers, 4, 1)
h1_MBCtrl  := substr(Prevh1_ClickModifiers, 1, 1)
h1_MBShift := substr(Prevh1_ClickModifiers, 2, 1)
h1_MBAlt   := substr(Prevh1_ClickModifiers, 3, 1)
h1_MBDrag  := substr(Prevh1_ClickModifiers, 4, 1)
h2_MBCtrl  := substr(Prevh2_ClickModifiers, 1, 1)
h2_MBShift := substr(Prevh2_ClickModifiers, 2, 1)
h2_MBAlt   := substr(Prevh2_ClickModifiers, 3, 1)
h2_MBDrag  := substr(Prevh2_ClickModifiers, 4, 1)
h3_MBCtrl  := substr(Prevh3_ClickModifiers, 1, 1)
h3_MBShift := substr(Prevh3_ClickModifiers, 2, 1)
h3_MBAlt   := substr(Prevh3_ClickModifiers, 3, 1)
h3_MBDrag  := substr(Prevh3_ClickModifiers, 4, 1)
h4_MBCtrl  := substr(Prevh4_ClickModifiers, 1, 1)
h4_MBShift := substr(Prevh4_ClickModifiers, 2, 1)
h4_MBAlt   := substr(Prevh4_ClickModifiers, 3, 1)
h4_MBDrag  := substr(Prevh4_ClickModifiers, 4, 1)
h5_MBCtrl  := substr(Prevh5_ClickModifiers, 1, 1)
h5_MBShift := substr(Prevh5_ClickModifiers, 2, 1)
h5_MBAlt   := substr(Prevh5_ClickModifiers, 3, 1)
h5_MBDrag  := substr(Prevh5_ClickModifiers, 4, 1)
h6_MBCtrl  := substr(Prevh6_ClickModifiers, 1, 1)
h6_MBShift := substr(Prevh6_ClickModifiers, 2, 1)
h6_MBAlt   := substr(Prevh6_ClickModifiers, 3, 1)
h6_MBDrag  := substr(Prevh6_ClickModifiers, 4, 1)



inull_MBCtrl  := substr(Previnull_ClickModifiers, 1, 1)
inull_MBShift := substr(Previnull_ClickModifiers, 2, 1)
inull_MBAlt   := substr(Previnull_ClickModifiers, 3, 1)
inull_MBDrag  := substr(Previnull_ClickModifiers, 4, 1)
i1_MBCtrl  := substr(Previ1_ClickModifiers, 1, 1)
i1_MBShift := substr(Previ1_ClickModifiers, 2, 1)
i1_MBAlt   := substr(Previ1_ClickModifiers, 3, 1)
i1_MBDrag  := substr(Previ1_ClickModifiers, 4, 1)
i2_MBCtrl  := substr(Previ2_ClickModifiers, 1, 1)
i2_MBShift := substr(Previ2_ClickModifiers, 2, 1)
i2_MBAlt   := substr(Previ2_ClickModifiers, 3, 1)
i2_MBDrag  := substr(Previ2_ClickModifiers, 4, 1)
i3_MBCtrl  := substr(Previ3_ClickModifiers, 1, 1)
i3_MBShift := substr(Previ3_ClickModifiers, 2, 1)
i3_MBAlt   := substr(Previ3_ClickModifiers, 3, 1)
i3_MBDrag  := substr(Previ3_ClickModifiers, 4, 1)
i4_MBCtrl  := substr(Previ4_ClickModifiers, 1, 1)
i4_MBShift := substr(Previ4_ClickModifiers, 2, 1)
i4_MBAlt   := substr(Previ4_ClickModifiers, 3, 1)
i4_MBDrag  := substr(Previ4_ClickModifiers, 4, 1)
i5_MBCtrl  := substr(Previ5_ClickModifiers, 1, 1)
i5_MBShift := substr(Previ5_ClickModifiers, 2, 1)
i5_MBAlt   := substr(Previ5_ClickModifiers, 3, 1)
i5_MBDrag  := substr(Previ5_ClickModifiers, 4, 1)
i6_MBCtrl  := substr(Previ6_ClickModifiers, 1, 1)
i6_MBShift := substr(Previ6_ClickModifiers, 2, 1)
i6_MBAlt   := substr(Previ6_ClickModifiers, 3, 1)
i6_MBDrag  := substr(Previ6_ClickModifiers, 4, 1)


jnull_MBCtrl  := substr(Prevjnull_ClickModifiers, 1, 1)
jnull_MBShift := substr(Prevjnull_ClickModifiers, 2, 1)
jnull_MBAlt   := substr(Prevjnull_ClickModifiers, 3, 1)
jnull_MBDrag  := substr(Prevjnull_ClickModifiers, 4, 1)
j1_MBCtrl  := substr(Prevj1_ClickModifiers, 1, 1)
j1_MBShift := substr(Prevj1_ClickModifiers, 2, 1)
j1_MBAlt   := substr(Prevj1_ClickModifiers, 3, 1)
j1_MBDrag  := substr(Prevj1_ClickModifiers, 4, 1)
j2_MBCtrl  := substr(Prevj2_ClickModifiers, 1, 1)
j2_MBShift := substr(Prevj2_ClickModifiers, 2, 1)
j2_MBAlt   := substr(Prevj2_ClickModifiers, 3, 1)
j2_MBDrag  := substr(Prevj2_ClickModifiers, 4, 1)
j3_MBCtrl  := substr(Prevj3_ClickModifiers, 1, 1)
j3_MBShift := substr(Prevj3_ClickModifiers, 2, 1)
j3_MBAlt   := substr(Prevj3_ClickModifiers, 3, 1)
j3_MBDrag  := substr(Prevj3_ClickModifiers, 4, 1)
j4_MBCtrl  := substr(Prevj4_ClickModifiers, 1, 1)
j4_MBShift := substr(Prevj4_ClickModifiers, 2, 1)
j4_MBAlt   := substr(Prevj4_ClickModifiers, 3, 1)
j4_MBDrag  := substr(Prevj4_ClickModifiers, 4, 1)
j5_MBCtrl  := substr(Prevj5_ClickModifiers, 1, 1)
j5_MBShift := substr(Prevj5_ClickModifiers, 2, 1)
j5_MBAlt   := substr(Prevj5_ClickModifiers, 3, 1)
j5_MBDrag  := substr(Prevj5_ClickModifiers, 4, 1)
j6_MBCtrl  := substr(Prevj6_ClickModifiers, 1, 1)
j6_MBShift := substr(Prevj6_ClickModifiers, 2, 1)
j6_MBAlt   := substr(Prevj6_ClickModifiers, 3, 1)
j6_MBDrag  := substr(Prevj6_ClickModifiers, 4, 1)



knull_MBCtrl  := substr(Prevknull_ClickModifiers, 1, 1)
knull_MBShift := substr(Prevknull_ClickModifiers, 2, 1)
knull_MBAlt   := substr(Prevknull_ClickModifiers, 3, 1)
knull_MBDrag  := substr(Prevknull_ClickModifiers, 4, 1)
k1_MBCtrl  := substr(Prevk1_ClickModifiers, 1, 1)
k1_MBShift := substr(Prevk1_ClickModifiers, 2, 1)
k1_MBAlt   := substr(Prevk1_ClickModifiers, 3, 1)
k1_MBDrag  := substr(Prevk1_ClickModifiers, 4, 1)
k2_MBCtrl  := substr(Prevk2_ClickModifiers, 1, 1)
k2_MBShift := substr(Prevk2_ClickModifiers, 2, 1)
k2_MBAlt   := substr(Prevk2_ClickModifiers, 3, 1)
k2_MBDrag  := substr(Prevk2_ClickModifiers, 4, 1)
k3_MBCtrl  := substr(Prevk3_ClickModifiers, 1, 1)
k3_MBShift := substr(Prevk3_ClickModifiers, 2, 1)
k3_MBAlt   := substr(Prevk3_ClickModifiers, 3, 1)
k3_MBDrag  := substr(Prevk3_ClickModifiers, 4, 1)
k4_MBCtrl  := substr(Prevk4_ClickModifiers, 1, 1)
k4_MBShift := substr(Prevk4_ClickModifiers, 2, 1)
k4_MBAlt   := substr(Prevk4_ClickModifiers, 3, 1)
k4_MBDrag  := substr(Prevk4_ClickModifiers, 4, 1)
k5_MBCtrl  := substr(Prevk5_ClickModifiers, 1, 1)
k5_MBShift := substr(Prevk5_ClickModifiers, 2, 1)
k5_MBAlt   := substr(Prevk5_ClickModifiers, 3, 1)
k5_MBDrag  := substr(Prevk5_ClickModifiers, 4, 1)
k6_MBCtrl  := substr(Prevk6_ClickModifiers, 1, 1)
k6_MBShift := substr(Prevk6_ClickModifiers, 2, 1)
k6_MBAlt   := substr(Prevk6_ClickModifiers, 3, 1)
k6_MBDrag  := substr(Prevk6_ClickModifiers, 4, 1)



lnull_MBCtrl  := substr(Prevlnull_ClickModifiers, 1, 1)
lnull_MBShift := substr(Prevlnull_ClickModifiers, 2, 1)
lnull_MBAlt   := substr(Prevlnull_ClickModifiers, 3, 1)
lnull_MBDrag  := substr(Prevlnull_ClickModifiers, 4, 1)
l1_MBCtrl  := substr(Prevl1_ClickModifiers, 1, 1)
l1_MBShift := substr(Prevl1_ClickModifiers, 2, 1)
l1_MBAlt   := substr(Prevl1_ClickModifiers, 3, 1)
l1_MBDrag  := substr(Prevl1_ClickModifiers, 4, 1)
l2_MBCtrl  := substr(Prevl2_ClickModifiers, 1, 1)
l2_MBShift := substr(Prevl2_ClickModifiers, 2, 1)
l2_MBAlt   := substr(Prevl2_ClickModifiers, 3, 1)
l2_MBDrag  := substr(Prevl2_ClickModifiers, 4, 1)
l3_MBCtrl  := substr(Prevl3_ClickModifiers, 1, 1)
l3_MBShift := substr(Prevl3_ClickModifiers, 2, 1)
l3_MBAlt   := substr(Prevl3_ClickModifiers, 3, 1)
l3_MBDrag  := substr(Prevl3_ClickModifiers, 4, 1)
l4_MBCtrl  := substr(Prevl4_ClickModifiers, 1, 1)
l4_MBShift := substr(Prevl4_ClickModifiers, 2, 1)
l4_MBAlt   := substr(Prevl4_ClickModifiers, 3, 1)
l4_MBDrag  := substr(Prevl4_ClickModifiers, 4, 1)
l5_MBCtrl  := substr(Prevl5_ClickModifiers, 1, 1)
l5_MBShift := substr(Prevl5_ClickModifiers, 2, 1)
l5_MBAlt   := substr(Prevl5_ClickModifiers, 3, 1)
l5_MBDrag  := substr(Prevl5_ClickModifiers, 4, 1)
l6_MBCtrl  := substr(Prevl6_ClickModifiers, 1, 1)
l6_MBShift := substr(Prevl6_ClickModifiers, 2, 1)
l6_MBAlt   := substr(Prevl6_ClickModifiers, 3, 1)
l6_MBDrag  := substr(Prevl6_ClickModifiers, 4, 1)


PrevaPieHotkey_Ctrl := substr(PrevaPieHotkey_Modifiers, 1, 1)
PrevaPieHotkey_Shift := substr(PrevaPieHotkey_Modifiers, 2, 1)
PrevaPieHotkey_Alt := substr(PrevaPieHotkey_Modifiers, 3, 1) 

PrevbPieHotkey_Ctrl := substr(PrevbPieHotkey_Modifiers, 1, 1)
PrevbPieHotkey_Shift := substr(PrevbPieHotkey_Modifiers, 2, 1)
PrevbPieHotkey_Alt := substr(PrevbPieHotkey_Modifiers, 3, 1) 

PrevcPieHotkey_Ctrl := substr(PrevcPieHotkey_Modifiers, 1, 1)
PrevcPieHotkey_Shift := substr(PrevcPieHotkey_Modifiers, 2, 1)
PrevcPieHotkey_Alt := substr(PrevcPieHotkey_Modifiers, 3, 1) 

PrevdPieHotkey_Ctrl := substr(PrevdPieHotkey_Modifiers, 1, 1)
PrevdPieHotkey_Shift := substr(PrevdPieHotkey_Modifiers, 2, 1)
PrevdPieHotkey_Alt := substr(PrevdPieHotkey_Modifiers, 3, 1) 

PrevePieHotkey_Ctrl := substr(PrevePieHotkey_Modifiers, 1, 1)
PrevePieHotkey_Shift := substr(PrevePieHotkey_Modifiers, 2, 1)
PrevePieHotkey_Alt := substr(PrevePieHotkey_Modifiers, 3, 1) 

PrevfPieHotkey_Ctrl := substr(PrevfPieHotkey_Modifiers, 1, 1)
PrevfPieHotkey_Shift := substr(PrevfPieHotkey_Modifiers, 2, 1)
PrevfPieHotkey_Alt := substr(PrevfPieHotkey_Modifiers, 3, 1) 

PrevgPieHotkey_Ctrl := substr(PrevgPieHotkey_Modifiers, 1, 1)
PrevgPieHotkey_Shift := substr(PrevgPieHotkey_Modifiers, 2, 1)
PrevgPieHotkey_Alt := substr(PrevgPieHotkey_Modifiers, 3, 1) 

PrevhPieHotkey_Ctrl := substr(PrevhPieHotkey_Modifiers, 1, 1)
PrevhPieHotkey_Shift := substr(PrevhPieHotkey_Modifiers, 2, 1)
PrevhPieHotkey_Alt := substr(PrevhPieHotkey_Modifiers, 3, 1) 

PreviPieHotkey_Ctrl := substr(PreviPieHotkey_Modifiers, 1, 1)
PreviPieHotkey_Shift := substr(PreviPieHotkey_Modifiers, 2, 1)
PreviPieHotkey_Alt := substr(PreviPieHotkey_Modifiers, 3, 1) 

PrevjPieHotkey_Ctrl := substr(PrevjPieHotkey_Modifiers, 1, 1)
PrevjPieHotkey_Shift := substr(PrevjPieHotkey_Modifiers, 2, 1)
PrevjPieHotkey_Alt := substr(PrevjPieHotkey_Modifiers, 3, 1) 

PrevkPieHotkey_Ctrl := substr(PrevkPieHotkey_Modifiers, 1, 1)
PrevkPieHotkey_Shift := substr(PrevkPieHotkey_Modifiers, 2, 1)
PrevkPieHotkey_Alt := substr(PrevkPieHotkey_Modifiers, 3, 1) 

PrevlPieHotkey_Ctrl := substr(PrevlPieHotkey_Modifiers, 1, 1)
PrevlPieHotkey_Shift := substr(PrevlPieHotkey_Modifiers, 2, 1)
PrevlPieHotkey_Alt := substr(PrevlPieHotkey_Modifiers, 3, 1) 


FileReadLine, isotextNewanull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevanull_Label
isotextNewanull_Label := StrSplit(isotextNewanull_Label, ":")
txtPrevanull_Label := % isotextNewanull_Label[2]
FileReadLine, isotextNewa1_Label,%A_ScriptDir%\Resources\Functions.txt, Preva1_Label
isotextNewa1_Label := StrSplit(isotextNewa1_Label, ":")
txtPreva1_Label := % isotextNewa1_Label[2]
FileReadLine, isotextNewa2_Label,%A_ScriptDir%\Resources\Functions.txt, Preva2_Label
isotextNewa2_Label := StrSplit(isotextNewa2_Label, ":")
txtPreva2_Label := % isotextNewa2_Label[2]
FileReadLine, isotextNewa3_Label,%A_ScriptDir%\Resources\Functions.txt, Preva3_Label
isotextNewa3_Label := StrSplit(isotextNewa3_Label, ":")
txtPreva3_Label := % isotextNewa3_Label[2]
FileReadLine, isotextNewa4_Label,%A_ScriptDir%\Resources\Functions.txt, Preva4_Label
isotextNewa4_Label := StrSplit(isotextNewa4_Label, ":")
txtPreva4_Label := % isotextNewa4_Label[2]
FileReadLine, isotextNewa5_Label,%A_ScriptDir%\Resources\Functions.txt, Preva5_Label
isotextNewa5_Label := StrSplit(isotextNewa5_Label, ":")
txtPreva5_Label := % isotextNewa5_Label[2]
FileReadLine, isotextNewa6_Label,%A_ScriptDir%\Resources\Functions.txt, Preva6_Label
isotextNewa6_Label := StrSplit(isotextNewa6_Label, ":")
txtPreva6_Label := % isotextNewa6_Label[2]
FileReadLine, isotextNewbnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevbnull_Label
isotextNewbnull_Label := StrSplit(isotextNewbnull_Label, ":")
txtPrevbnull_Label := % isotextNewbnull_Label[2]
FileReadLine, isotextNewb1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb1_Label
isotextNewb1_Label := StrSplit(isotextNewb1_Label, ":")
txtPrevb1_Label := % isotextNewb1_Label[2]
FileReadLine, isotextNewb2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb2_Label
isotextNewb2_Label := StrSplit(isotextNewb2_Label, ":")
txtPrevb2_Label := % isotextNewb2_Label[2]
FileReadLine, isotextNewb3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb3_Label
isotextNewb3_Label := StrSplit(isotextNewb3_Label, ":")
txtPrevb3_Label := % isotextNewb3_Label[2]
FileReadLine, isotextNewb4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb4_Label
isotextNewb4_Label := StrSplit(isotextNewb4_Label, ":")
txtPrevb4_Label := % isotextNewb4_Label[2]
FileReadLine, isotextNewb5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb5_Label
isotextNewb5_Label := StrSplit(isotextNewb5_Label, ":")
txtPrevb5_Label := % isotextNewb5_Label[2]
FileReadLine, isotextNewb6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevb6_Label
isotextNewb6_Label := StrSplit(isotextNewb6_Label, ":")
txtPrevb6_Label := % isotextNewb6_Label[2]
FileReadLine, isotextnewcnull_Label,%A_ScriptDir%\Resources\Functions.txt, prevcnull_Label
isotextnewcnull_Label := StrSplit(isotextnewcnull_Label, ":")
txtprevcnull_Label := % isotextnewcnull_Label[2]
FileReadLine, isotextnewc1_Label,%A_ScriptDir%\Resources\Functions.txt, prevc1_Label
isotextnewc1_Label := StrSplit(isotextnewc1_Label, ":")
txtprevc1_Label := % isotextnewc1_Label[2]
FileReadLine, isotextnewc2_Label,%A_ScriptDir%\Resources\Functions.txt, prevc2_Label
isotextnewc2_Label := StrSplit(isotextnewc2_Label, ":")
txtprevc2_Label := % isotextnewc2_Label[2]
FileReadLine, isotextnewc3_Label,%A_ScriptDir%\Resources\Functions.txt, prevc3_Label
isotextnewc3_Label := StrSplit(isotextnewc3_Label, ":")
txtprevc3_Label := % isotextnewc3_Label[2]
FileReadLine, isotextnewc4_Label,%A_ScriptDir%\Resources\Functions.txt, prevc4_Label
isotextnewc4_Label := StrSplit(isotextnewc4_Label, ":")
txtprevc4_Label := % isotextnewc4_Label[2]
FileReadLine, isotextnewc5_Label,%A_ScriptDir%\Resources\Functions.txt, prevc5_Label
isotextnewc5_Label := StrSplit(isotextnewc5_Label, ":")
txtprevc5_Label := % isotextnewc5_Label[2]
FileReadLine, isotextnewc6_Label,%A_ScriptDir%\Resources\Functions.txt, prevc6_Label
isotextnewc6_Label := StrSplit(isotextnewc6_Label, ":")
txtprevc6_Label := % isotextnewc6_Label[2]
FileReadLine, isotextNewdnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevdnull_Label
isotextNewdnull_Label := StrSplit(isotextNewdnull_Label, ":")
txtPrevdnull_Label := % isotextNewdnull_Label[2]
FileReadLine, isotextNewd1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd1_Label
isotextNewd1_Label := StrSplit(isotextNewd1_Label, ":")
txtPrevd1_Label := % isotextNewd1_Label[2]
FileReadLine, isotextNewd2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd2_Label
isotextNewd2_Label := StrSplit(isotextNewd2_Label, ":")
txtPrevd2_Label := % isotextNewd2_Label[2]
FileReadLine, isotextNewd3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd3_Label
isotextNewd3_Label := StrSplit(isotextNewd3_Label, ":")
txtPrevd3_Label := % isotextNewd3_Label[2]
FileReadLine, isotextNewd4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd4_Label
isotextNewd4_Label := StrSplit(isotextNewd4_Label, ":")
txtPrevd4_Label := % isotextNewd4_Label[2]
FileReadLine, isotextNewd5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd5_Label
isotextNewd5_Label := StrSplit(isotextNewd5_Label, ":")
txtPrevd5_Label := % isotextNewd5_Label[2]
FileReadLine, isotextNewd6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevd6_Label
isotextNewd6_Label := StrSplit(isotextNewd6_Label, ":")
txtPrevd6_Label := % isotextNewd6_Label[2]
FileReadLine, isotextNewenull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevenull_Label
isotextNewenull_Label := StrSplit(isotextNewenull_Label, ":")
txtPrevenull_Label := % isotextNewenull_Label[2]
FileReadLine, isotextNewe1_Label,%A_ScriptDir%\Resources\Functions.txt, Preve1_Label
isotextNewe1_Label := StrSplit(isotextNewe1_Label, ":")
txtPreve1_Label := % isotextNewe1_Label[2]
FileReadLine, isotextNewe2_Label,%A_ScriptDir%\Resources\Functions.txt, Preve2_Label
isotextNewe2_Label := StrSplit(isotextNewe2_Label, ":")
txtPreve2_Label := % isotextNewe2_Label[2]
FileReadLine, isotextNewe3_Label,%A_ScriptDir%\Resources\Functions.txt, Preve3_Label
isotextNewe3_Label := StrSplit(isotextNewe3_Label, ":")
txtPreve3_Label := % isotextNewe3_Label[2]
FileReadLine, isotextNewe4_Label,%A_ScriptDir%\Resources\Functions.txt, Preve4_Label
isotextNewe4_Label := StrSplit(isotextNewe4_Label, ":")
txtPreve4_Label := % isotextNewe4_Label[2]
FileReadLine, isotextNewe5_Label,%A_ScriptDir%\Resources\Functions.txt, Preve5_Label
isotextNewe5_Label := StrSplit(isotextNewe5_Label, ":")
txtPreve5_Label := % isotextNewe5_Label[2]
FileReadLine, isotextNewe6_Label,%A_ScriptDir%\Resources\Functions.txt, Preve6_Label
isotextNewe6_Label := StrSplit(isotextNewe6_Label, ":")
txtPreve6_Label := % isotextNewe6_Label[2]
FileReadLine, isotextNewfnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevfnull_Label
isotextNewfnull_Label := StrSplit(isotextNewfnull_Label, ":")
txtPrevfnull_Label := % isotextNewfnull_Label[2]
FileReadLine, isotextNewf1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf1_Label
isotextNewf1_Label := StrSplit(isotextNewf1_Label, ":")
txtPrevf1_Label := % isotextNewf1_Label[2]
FileReadLine, isotextNewf2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf2_Label
isotextNewf2_Label := StrSplit(isotextNewf2_Label, ":")
txtPrevf2_Label := % isotextNewf2_Label[2]
FileReadLine, isotextNewf3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf3_Label
isotextNewf3_Label := StrSplit(isotextNewf3_Label, ":")
txtPrevf3_Label := % isotextNewf3_Label[2]
FileReadLine, isotextNewf4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf4_Label
isotextNewf4_Label := StrSplit(isotextNewf4_Label, ":")
txtPrevf4_Label := % isotextNewf4_Label[2]
FileReadLine, isotextNewf5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf5_Label
isotextNewf5_Label := StrSplit(isotextNewf5_Label, ":")
txtPrevf5_Label := % isotextNewf5_Label[2]
FileReadLine, isotextNewf6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevf6_Label
isotextNewf6_Label := StrSplit(isotextNewf6_Label, ":")
txtPrevf6_Label := % isotextNewf6_Label[2]
FileReadLine, isotextNewgnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevgnull_Label
isotextNewgnull_Label := StrSplit(isotextNewgnull_Label, ":")
txtPrevgnull_Label := % isotextNewgnull_Label[2]
FileReadLine, isotextNewg1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg1_Label
isotextNewg1_Label := StrSplit(isotextNewg1_Label, ":")
txtPrevg1_Label := % isotextNewg1_Label[2]
FileReadLine, isotextNewg2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg2_Label
isotextNewg2_Label := StrSplit(isotextNewg2_Label, ":")
txtPrevg2_Label := % isotextNewg2_Label[2]
FileReadLine, isotextNewg3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg3_Label
isotextNewg3_Label := StrSplit(isotextNewg3_Label, ":")
txtPrevg3_Label := % isotextNewg3_Label[2]
FileReadLine, isotextNewg4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg4_Label
isotextNewg4_Label := StrSplit(isotextNewg4_Label, ":")
txtPrevg4_Label := % isotextNewg4_Label[2]
FileReadLine, isotextNewg5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg5_Label
isotextNewg5_Label := StrSplit(isotextNewg5_Label, ":")
txtPrevg5_Label := % isotextNewg5_Label[2]
FileReadLine, isotextNewg6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevg6_Label
isotextNewg6_Label := StrSplit(isotextNewg6_Label, ":")
txtPrevg6_Label := % isotextNewg6_Label[2]
FileReadLine, isotextNewhnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevhnull_Label
isotextNewhnull_Label := StrSplit(isotextNewhnull_Label, ":")
txtPrevhnull_Label := % isotextNewhnull_Label[2]
FileReadLine, isotextNewh1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh1_Label
isotextNewh1_Label := StrSplit(isotextNewh1_Label, ":")
txtPrevh1_Label := % isotextNewh1_Label[2]
FileReadLine, isotextNewh2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh2_Label
isotextNewh2_Label := StrSplit(isotextNewh2_Label, ":")
txtPrevh2_Label := % isotextNewh2_Label[2]
FileReadLine, isotextNewh3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh3_Label
isotextNewh3_Label := StrSplit(isotextNewh3_Label, ":")
txtPrevh3_Label := % isotextNewh3_Label[2]
FileReadLine, isotextNewh4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh4_Label
isotextNewh4_Label := StrSplit(isotextNewh4_Label, ":")
txtPrevh4_Label := % isotextNewh4_Label[2]
FileReadLine, isotextNewh5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh5_Label
isotextNewh5_Label := StrSplit(isotextNewh5_Label, ":")
txtPrevh5_Label := % isotextNewh5_Label[2]
FileReadLine, isotextNewh6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevh6_Label
isotextNewh6_Label := StrSplit(isotextNewh6_Label, ":")
txtPrevh6_Label := % isotextNewh6_Label[2]
FileReadLine, isotextNewinull_Label,%A_ScriptDir%\Resources\Functions.txt, Previnull_Label
isotextNewinull_Label := StrSplit(isotextNewinull_Label, ":")
txtPrevinull_Label := % isotextNewinull_Label[2]
FileReadLine, isotextNewi1_Label,%A_ScriptDir%\Resources\Functions.txt, Previ1_Label
isotextNewi1_Label := StrSplit(isotextNewi1_Label, ":")
txtPrevi1_Label := % isotextNewi1_Label[2]
FileReadLine, isotextNewi2_Label,%A_ScriptDir%\Resources\Functions.txt, Previ2_Label
isotextNewi2_Label := StrSplit(isotextNewi2_Label, ":")
txtPrevi2_Label := % isotextNewi2_Label[2]
FileReadLine, isotextNewi3_Label,%A_ScriptDir%\Resources\Functions.txt, Previ3_Label
isotextNewi3_Label := StrSplit(isotextNewi3_Label, ":")
txtPrevi3_Label := % isotextNewi3_Label[2]
FileReadLine, isotextNewi4_Label,%A_ScriptDir%\Resources\Functions.txt, Previ4_Label
isotextNewi4_Label := StrSplit(isotextNewi4_Label, ":")
txtPrevi4_Label := % isotextNewi4_Label[2]
FileReadLine, isotextNewi5_Label,%A_ScriptDir%\Resources\Functions.txt, Previ5_Label
isotextNewi5_Label := StrSplit(isotextNewi5_Label, ":")
txtPrevi5_Label := % isotextNewi5_Label[2]
FileReadLine, isotextNewi6_Label,%A_ScriptDir%\Resources\Functions.txt, Previ6_Label
isotextNewi6_Label := StrSplit(isotextNewi6_Label, ":")
txtPrevi6_Label := % isotextNewi6_Label[2]
FileReadLine, isotextNewjnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevjnull_Label
isotextNewjnull_Label := StrSplit(isotextNewjnull_Label, ":")
txtPrevjnull_Label := % isotextNewjnull_Label[2]
FileReadLine, isotextNewj1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj1_Label
isotextNewj1_Label := StrSplit(isotextNewj1_Label, ":")
txtPrevj1_Label := % isotextNewj1_Label[2]
FileReadLine, isotextNewj2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj2_Label
isotextNewj2_Label := StrSplit(isotextNewj2_Label, ":")
txtPrevj2_Label := % isotextNewj2_Label[2]
FileReadLine, isotextNewj3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj3_Label
isotextNewj3_Label := StrSplit(isotextNewj3_Label, ":")
txtPrevj3_Label := % isotextNewj3_Label[2]
FileReadLine, isotextNewj4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj4_Label
isotextNewj4_Label := StrSplit(isotextNewj4_Label, ":")
txtPrevj4_Label := % isotextNewj4_Label[2]
FileReadLine, isotextNewj5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj5_Label
isotextNewj5_Label := StrSplit(isotextNewj5_Label, ":")
txtPrevj5_Label := % isotextNewj5_Label[2]
FileReadLine, isotextNewj6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevj6_Label
isotextNewj6_Label := StrSplit(isotextNewj6_Label, ":")
txtPrevj6_Label := % isotextNewj6_Label[2]
FileReadLine, isotextNewknull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevknull_Label
isotextNewknull_Label := StrSplit(isotextNewknull_Label, ":")
txtPrevknull_Label := % isotextNewknull_Label[2]
FileReadLine, isotextNewk1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk1_Label
isotextNewk1_Label := StrSplit(isotextNewk1_Label, ":")
txtPrevk1_Label := % isotextNewk1_Label[2]
FileReadLine, isotextNewk2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk2_Label
isotextNewk2_Label := StrSplit(isotextNewk2_Label, ":")
txtPrevk2_Label := % isotextNewk2_Label[2]
FileReadLine, isotextNewk3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk3_Label
isotextNewk3_Label := StrSplit(isotextNewk3_Label, ":")
txtPrevk3_Label := % isotextNewk3_Label[2]
FileReadLine, isotextNewk4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk4_Label
isotextNewk4_Label := StrSplit(isotextNewk4_Label, ":")
txtPrevk4_Label := % isotextNewk4_Label[2]
FileReadLine, isotextNewk5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk5_Label
isotextNewk5_Label := StrSplit(isotextNewk5_Label, ":")
txtPrevk5_Label := % isotextNewk5_Label[2]
FileReadLine, isotextNewk6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevk6_Label
isotextNewk6_Label := StrSplit(isotextNewk6_Label, ":")
txtPrevk6_Label := % isotextNewk6_Label[2]
FileReadLine, isotextNewlnull_Label,%A_ScriptDir%\Resources\Functions.txt, Prevlnull_Label
isotextNewlnull_Label := StrSplit(isotextNewlnull_Label, ":")
txtPrevlnull_Label := % isotextNewlnull_Label[2]
FileReadLine, isotextNewl1_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl1_Label
isotextNewl1_Label := StrSplit(isotextNewl1_Label, ":")
txtPrevl1_Label := % isotextNewl1_Label[2]
FileReadLine, isotextNewl2_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl2_Label
isotextNewl2_Label := StrSplit(isotextNewl2_Label, ":")
txtPrevl2_Label := % isotextNewl2_Label[2]
FileReadLine, isotextNewl3_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl3_Label
isotextNewl3_Label := StrSplit(isotextNewl3_Label, ":")
txtPrevl3_Label := % isotextNewl3_Label[2]
FileReadLine, isotextNewl4_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl4_Label
isotextNewl4_Label := StrSplit(isotextNewl4_Label, ":")
txtPrevl4_Label := % isotextNewl4_Label[2]
FileReadLine, isotextNewl5_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl5_Label
isotextNewl5_Label := StrSplit(isotextNewl5_Label, ":")
txtPrevl5_Label := % isotextNewl5_Label[2]
FileReadLine, isotextNewl6_Label,%A_ScriptDir%\Resources\Functions.txt, Prevl6_Label
isotextNewl6_Label := StrSplit(isotextNewl6_Label, ":")
txtPrevl6_Label := % isotextNewl6_Label[2]



If Prevanull_Label = 2
	{
	Showanull_OverrideLabel := 0
	SendKeyShowanull_Label := 0
	anull_ShowExeFilePathButton := 1
	anull_ShowMBCtrl := 1
	anull_ShowMBShift := 1
	anull_ShowMBAlt := 1
	anull_ShowMBDrag := 1
	}
If Prevanull_Label = 3 
	{
	Showanull_OverrideLabel := 0
	anull_ShowExeFilePathButton := 0
	SendKeyShowanull_Label := 1
	anull_ShowMBCtrl := 1
	anull_ShowMBShift := 1
	anull_ShowMBAlt := 1
	anull_ShowMBDrag := 1
	}
If Prevanull_Label between 4 and 6
	{
	Showanull_OverrideLabel := 0
	anull_ShowExeFilePathButton := 1
	SendKeyShowanull_Label := 1
	anull_ShowMBCtrl := 0
	anull_ShowMBShift := 0
	anull_ShowMBAlt := 0
	anull_ShowMBDrag := 0
	}
If Preva1_Label = 2
	{
	Showa1_OverrideLabel := 0
	SendKeyShowa1_Label := 0
	a1_ShowExeFilePathButton := 1
	a1_ShowMBCtrl := 1
	a1_ShowMBShift := 1
	a1_ShowMBAlt := 1
	a1_ShowMBDrag := 1
	}
If Preva1_Label = 3 
	{
	Showa1_OverrideLabel := 0
	a1_ShowExeFilePathButton := 0
	SendKeyShowa1_Label := 1
	a1_ShowMBCtrl := 1
	a1_ShowMBShift := 1
	a1_ShowMBAlt := 1
	a1_ShowMBDrag := 1
	}
If Preva1_Label between 4 and 6
	{
	Showa1_OverrideLabel := 0
	a1_ShowExeFilePathButton := 1
	SendKeyShowa1_Label := 1
	a1_ShowMBCtrl := 0
	a1_ShowMBShift := 0
	a1_ShowMBAlt := 0
	a1_ShowMBDrag := 0
	}
If Preva2_Label = 2
	{
	Showa2_OverrideLabel := 0
	SendKeyShowa2_Label := 0
	a2_ShowExeFilePathButton := 1
	a2_ShowMBCtrl := 1
	a2_ShowMBShift := 1
	a2_ShowMBAlt := 1
	a2_ShowMBDrag := 1
	}
If Preva2_Label = 3 
	{
	Showa2_OverrideLabel := 0
	a2_ShowExeFilePathButton := 0
	SendKeyShowa2_Label := 1
	a2_ShowMBCtrl := 1
	a2_ShowMBShift := 1
	a2_ShowMBAlt := 1
	a2_ShowMBDrag := 1
	}
If Preva2_Label between 4 and 6
	{
	Showa2_OverrideLabel := 0
	a2_ShowExeFilePathButton := 1
	SendKeyShowa2_Label := 1
	a2_ShowMBCtrl := 0
	a2_ShowMBShift := 0
	a2_ShowMBAlt := 0
	a2_ShowMBDrag := 0
	}
If Preva3_Label = 2
	{
	Showa3_OverrideLabel := 0
	SendKeyShowa3_Label := 0
	a3_ShowExeFilePathButton := 1
	a3_ShowMBCtrl := 1
	a3_ShowMBShift := 1
	a3_ShowMBAlt := 1
	a3_ShowMBDrag := 1
	}
If Preva3_Label = 3 
	{
	Showa3_OverrideLabel := 0
	a3_ShowExeFilePathButton := 0
	SendKeyShowa3_Label := 1
	a3_ShowMBCtrl := 1
	a3_ShowMBShift := 1
	a3_ShowMBAlt := 1
	a3_ShowMBDrag := 1
	}
If Preva3_Label between 4 and 6
	{
	Showa3_OverrideLabel := 0
	a3_ShowExeFilePathButton := 1
	SendKeyShowa3_Label := 1
	a3_ShowMBCtrl := 0
	a3_ShowMBShift := 0
	a3_ShowMBAlt := 0
	a3_ShowMBDrag := 0
	}
If Preva4_Label = 2
	{
	Showa4_OverrideLabel := 0
	SendKeyShowa4_Label := 0
	a4_ShowExeFilePathButton := 1
	a4_ShowMBCtrl := 1
	a4_ShowMBShift := 1
	a4_ShowMBAlt := 1
	a4_ShowMBDrag := 1
	}
If Preva4_Label = 3 
	{
	Showa4_OverrideLabel := 0
	a4_ShowExeFilePathButton := 0
	SendKeyShowa4_Label := 1
	a4_ShowMBCtrl := 1
	a4_ShowMBShift := 1
	a4_ShowMBAlt := 1
	a4_ShowMBDrag := 1
	}
If Preva4_Label between 4 and 6
	{
	Showa4_OverrideLabel := 0
	a4_ShowExeFilePathButton := 1
	SendKeyShowa4_Label := 1
	a4_ShowMBCtrl := 0
	a4_ShowMBShift := 0
	a4_ShowMBAlt := 0
	a4_ShowMBDrag := 0
	}
If Preva5_Label = 2
	{
	Showa5_OverrideLabel := 0
	SendKeyShowa5_Label := 0
	a5_ShowExeFilePathButton := 1
	a5_ShowMBCtrl := 1
	a5_ShowMBShift := 1
	a5_ShowMBAlt := 1
	a5_ShowMBDrag := 1
	}
If Preva5_Label = 3 
	{
	Showa5_OverrideLabel := 0
	a5_ShowExeFilePathButton := 0
	SendKeyShowa5_Label := 1
	a5_ShowMBCtrl := 1
	a5_ShowMBShift := 1
	a5_ShowMBAlt := 1
	a5_ShowMBDrag := 1
	}
If Preva5_Label between 4 and 6
	{
	Showa5_OverrideLabel := 0
	a5_ShowExeFilePathButton := 1
	SendKeyShowa5_Label := 1
	a5_ShowMBCtrl := 0
	a5_ShowMBShift := 0
	a5_ShowMBAlt := 0
	a5_ShowMBDrag := 0
	}
If Preva6_Label = 2
	{
	Showa6_OverrideLabel := 0
	SendKeyShowa6_Label := 0
	a6_ShowExeFilePathButton := 1
	a6_ShowMBCtrl := 1
	a6_ShowMBShift := 1
	a6_ShowMBAlt := 1
	a6_ShowMBDrag := 1
	}
If Preva6_Label = 3 
	{
	Showa6_OverrideLabel := 0
	a6_ShowExeFilePathButton := 0
	SendKeyShowa6_Label := 1
	a6_ShowMBCtrl := 1
	a6_ShowMBShift := 1
	a6_ShowMBAlt := 1
	a6_ShowMBDrag := 1
	}
If Preva6_Label between 4 and 6
	{
	Showa6_OverrideLabel := 0
	a6_ShowExeFilePathButton := 1
	SendKeyShowa6_Label := 1
	a6_ShowMBCtrl := 0
	a6_ShowMBShift := 0
	a6_ShowMBAlt := 0
	a6_ShowMBDrag := 0
	}	


If Prevbnull_Label = 2
	{
	Showbnull_OverrideLabel := 0
	SendKeyShowbnull_Label := 0
	bnull_ShowExeFilePathButton := 1
	bnull_ShowMBCtrl := 1
	bnull_ShowMBShift := 1
	bnull_ShowMBAlt := 1
	bnull_ShowMBDrag := 1
	}
If Prevbnull_Label = 3 
	{
	Showbnull_OverrideLabel := 0
	bnull_ShowExeFilePathButton := 0
	SendKeyShowbnull_Label := 1
	bnull_ShowMBCtrl := 1
	bnull_ShowMBShift := 1
	bnull_ShowMBAlt := 1
	bnull_ShowMBDrag := 1
	}
If Prevbnull_Label between 4 and 6
	{
	Showbnull_OverrideLabel := 0
	bnull_ShowExeFilePathButton := 1
	SendKeyShowbnull_Label := 1
	bnull_ShowMBCtrl := 0
	bnull_ShowMBShift := 0
	bnull_ShowMBAlt := 0
	bnull_ShowMBDrag := 0
	}
If Prevb1_Label = 2
	{
	Showb1_OverrideLabel := 0
	SendKeyShowb1_Label := 0
	b1_ShowExeFilePathButton := 1
	b1_ShowMBCtrl := 1
	b1_ShowMBShift := 1
	b1_ShowMBAlt := 1
	b1_ShowMBDrag := 1
	}
If Prevb1_Label = 3 
	{
	Showb1_OverrideLabel := 0
	b1_ShowExeFilePathButton := 0
	SendKeyShowb1_Label := 1
	b1_ShowMBCtrl := 1
	b1_ShowMBShift := 1
	b1_ShowMBAlt := 1
	b1_ShowMBDrag := 1
	}
If Prevb1_Label between 4 and 6
	{
	Showb1_OverrideLabel := 0
	b1_ShowExeFilePathButton := 1
	SendKeyShowb1_Label := 1
	b1_ShowMBCtrl := 0
	b1_ShowMBShift := 0
	b1_ShowMBAlt := 0
	b1_ShowMBDrag := 0
	}
If Prevb2_Label = 2
	{
	Showb2_OverrideLabel := 0
	SendKeyShowb2_Label := 0
	b2_ShowExeFilePathButton := 1
	b2_ShowMBCtrl := 1
	b2_ShowMBShift := 1
	b2_ShowMBAlt := 1
	b2_ShowMBDrag := 1
	}
If Prevb2_Label = 3 
	{
	Showb2_OverrideLabel := 0
	b2_ShowExeFilePathButton := 0
	SendKeyShowb2_Label := 1
	b2_ShowMBCtrl := 1
	b2_ShowMBShift := 1
	b2_ShowMBAlt := 1
	b2_ShowMBDrag := 1
	}
If Prevb2_Label between 4 and 6
	{
	Showb2_OverrideLabel := 0
	b2_ShowExeFilePathButton := 1
	SendKeyShowb2_Label := 1
	b2_ShowMBCtrl := 0
	b2_ShowMBShift := 0
	b2_ShowMBAlt := 0
	b2_ShowMBDrag := 0
	}
If Prevb3_Label = 2
	{
	Showb3_OverrideLabel := 0
	SendKeyShowb3_Label := 0
	b3_ShowExeFilePathButton := 1
	b3_ShowMBCtrl := 1
	b3_ShowMBShift := 1
	b3_ShowMBAlt := 1
	b3_ShowMBDrag := 1
	}
If Prevb3_Label = 3 
	{
	Showb3_OverrideLabel := 0
	b3_ShowExeFilePathButton := 0
	SendKeyShowb3_Label := 1
	b3_ShowMBCtrl := 1
	b3_ShowMBShift := 1
	b3_ShowMBAlt := 1
	b3_ShowMBDrag := 1
	}
If Prevb3_Label between 4 and 6
	{
	Showb3_OverrideLabel := 0
	b3_ShowExeFilePathButton := 1
	SendKeyShowb3_Label := 1
	b3_ShowMBCtrl := 0
	b3_ShowMBShift := 0
	b3_ShowMBAlt := 0
	b3_ShowMBDrag := 0
	}
If Prevb4_Label = 2
	{
	Showb4_OverrideLabel := 0
	SendKeyShowb4_Label := 0
	b4_ShowExeFilePathButton := 1
	b4_ShowMBCtrl := 1
	b4_ShowMBShift := 1
	b4_ShowMBAlt := 1
	b4_ShowMBDrag := 1
	}
If Prevb4_Label = 3 
	{
	Showb4_OverrideLabel := 0
	b4_ShowExeFilePathButton := 0
	SendKeyShowb4_Label := 1
	b4_ShowMBCtrl := 1
	b4_ShowMBShift := 1
	b4_ShowMBAlt := 1
	b4_ShowMBDrag := 1
	}
If Prevb4_Label between 4 and 6
	{
	Showb4_OverrideLabel := 0
	b4_ShowExeFilePathButton := 1
	SendKeyShowb4_Label := 1
	b4_ShowMBCtrl := 0
	b4_ShowMBShift := 0
	b4_ShowMBAlt := 0
	b4_ShowMBDrag := 0
	}
If Prevb5_Label = 2
	{
	Showb5_OverrideLabel := 0
	SendKeyShowb5_Label := 0
	b5_ShowExeFilePathButton := 1
	b5_ShowMBCtrl := 1
	b5_ShowMBShift := 1
	b5_ShowMBAlt := 1
	b5_ShowMBDrag := 1
	}
If Prevb5_Label = 3 
	{
	Showb5_OverrideLabel := 0
	b5_ShowExeFilePathButton := 0
	SendKeyShowb5_Label := 1
	b5_ShowMBCtrl := 1
	b5_ShowMBShift := 1
	b5_ShowMBAlt := 1
	b5_ShowMBDrag := 1
	}
If Prevb5_Label between 4 and 6
	{
	Showb5_OverrideLabel := 0
	b5_ShowExeFilePathButton := 1
	SendKeyShowb5_Label := 1
	b5_ShowMBCtrl := 0
	b5_ShowMBShift := 0
	b5_ShowMBAlt := 0
	b5_ShowMBDrag := 0
	}
If Prevb6_Label = 2
	{
	Showb6_OverrideLabel := 0
	SendKeyShowb6_Label := 0
	b6_ShowExeFilePathButton := 1
	b6_ShowMBCtrl := 1
	b6_ShowMBShift := 1
	b6_ShowMBAlt := 1
	b6_ShowMBDrag := 1
	}
If Prevb6_Label = 3 
	{
	Showb6_OverrideLabel := 0
	b6_ShowExeFilePathButton := 0
	SendKeyShowb6_Label := 1
	b6_ShowMBCtrl := 1
	b6_ShowMBShift := 1
	b6_ShowMBAlt := 1
	b6_ShowMBDrag := 1
	}
If Prevb6_Label between 4 and 6
	{
	Showb6_OverrideLabel := 0
	b6_ShowExeFilePathButton := 1
	SendKeyShowb6_Label := 1
	b6_ShowMBCtrl := 0
	b6_ShowMBShift := 0
	b6_ShowMBAlt := 0
	b6_ShowMBDrag := 0
	}	


If Prevcnull_Label = 2
	{
	Showcnull_OverrideLabel := 0
	SendKeyShowcnull_Label := 0
	cnull_ShowExeFilePathButton := 1
	cnull_ShowMBCtrl := 1
	cnull_ShowMBShift := 1
	cnull_ShowMBAlt := 1
	cnull_ShowMBDrag := 1
	}
If Prevcnull_Label = 3 
	{
	Showcnull_OverrideLabel := 0
	cnull_ShowExeFilePathButton := 0
	SendKeyShowcnull_Label := 1
	cnull_ShowMBCtrl := 1
	cnull_ShowMBShift := 1
	cnull_ShowMBAlt := 1
	cnull_ShowMBDrag := 1
	}
If Prevcnull_Label between 4 and 6
	{
	Showcnull_OverrideLabel := 0
	cnull_ShowExeFilePathButton := 1
	SendKeyShowcnull_Label := 1
	cnull_ShowMBCtrl := 0
	cnull_ShowMBShift := 0
	cnull_ShowMBAlt := 0
	cnull_ShowMBDrag := 0
	}
If Prevc1_Label = 2
	{
	Showc1_OverrideLabel := 0
	SendKeyShowc1_Label := 0
	c1_ShowExeFilePathButton := 1
	c1_ShowMBCtrl := 1
	c1_ShowMBShift := 1
	c1_ShowMBAlt := 1
	c1_ShowMBDrag := 1
	}
If Prevc1_Label = 3 
	{
	Showc1_OverrideLabel := 0
	c1_ShowExeFilePathButton := 0
	SendKeyShowc1_Label := 1
	c1_ShowMBCtrl := 1
	c1_ShowMBShift := 1
	c1_ShowMBAlt := 1
	c1_ShowMBDrag := 1
	}
If Prevc1_Label between 4 and 6
	{
	Showc1_OverrideLabel := 0
	c1_ShowExeFilePathButton := 1
	SendKeyShowc1_Label := 1
	c1_ShowMBCtrl := 0
	c1_ShowMBShift := 0
	c1_ShowMBAlt := 0
	c1_ShowMBDrag := 0
	}
If Prevc2_Label = 2
	{
	Showc2_OverrideLabel := 0
	SendKeyShowc2_Label := 0
	c2_ShowExeFilePathButton := 1
	c2_ShowMBCtrl := 1
	c2_ShowMBShift := 1
	c2_ShowMBAlt := 1
	c2_ShowMBDrag := 1
	}
If Prevc2_Label = 3 
	{
	Showc2_OverrideLabel := 0
	c2_ShowExeFilePathButton := 0
	SendKeyShowc2_Label := 1
	c2_ShowMBCtrl := 1
	c2_ShowMBShift := 1
	c2_ShowMBAlt := 1
	c2_ShowMBDrag := 1
	}
If Prevc2_Label between 4 and 6
	{
	Showc2_OverrideLabel := 0
	c2_ShowExeFilePathButton := 1
	SendKeyShowc2_Label := 1
	c2_ShowMBCtrl := 0
	c2_ShowMBShift := 0
	c2_ShowMBAlt := 0
	c2_ShowMBDrag := 0
	}
If Prevc3_Label = 2
	{
	Showc3_OverrideLabel := 0
	SendKeyShowc3_Label := 0
	c3_ShowExeFilePathButton := 1
	c3_ShowMBCtrl := 1
	c3_ShowMBShift := 1
	c3_ShowMBAlt := 1
	c3_ShowMBDrag := 1
	}
If Prevc3_Label = 3 
	{
	Showc3_OverrideLabel := 0
	c3_ShowExeFilePathButton := 0
	SendKeyShowc3_Label := 1
	c3_ShowMBCtrl := 1
	c3_ShowMBShift := 1
	c3_ShowMBAlt := 1
	c3_ShowMBDrag := 1
	}
If Prevc3_Label between 4 and 6
	{
	Showc3_OverrideLabel := 0
	c3_ShowExeFilePathButton := 1
	SendKeyShowc3_Label := 1
	c3_ShowMBCtrl := 0
	c3_ShowMBShift := 0
	c3_ShowMBAlt := 0
	c3_ShowMBDrag := 0
	}
If Prevc4_Label = 2
	{
	Showc4_OverrideLabel := 0
	SendKeyShowc4_Label := 0
	c4_ShowExeFilePathButton := 1
	c4_ShowMBCtrl := 1
	c4_ShowMBShift := 1
	c4_ShowMBAlt := 1
	c4_ShowMBDrag := 1
	}
If Prevc4_Label = 3 
	{
	Showc4_OverrideLabel := 0
	c4_ShowExeFilePathButton := 0
	SendKeyShowc4_Label := 1
	c4_ShowMBCtrl := 1
	c4_ShowMBShift := 1
	c4_ShowMBAlt := 1
	c4_ShowMBDrag := 1
	}
If Prevc4_Label between 4 and 6
	{
	Showc4_OverrideLabel := 0
	c4_ShowExeFilePathButton := 1
	SendKeyShowc4_Label := 1
	c4_ShowMBCtrl := 0
	c4_ShowMBShift := 0
	c4_ShowMBAlt := 0
	c4_ShowMBDrag := 0
	}
If Prevc5_Label = 2
	{
	Showc5_OverrideLabel := 0
	SendKeyShowc5_Label := 0
	c5_ShowExeFilePathButton := 1
	c5_ShowMBCtrl := 1
	c5_ShowMBShift := 1
	c5_ShowMBAlt := 1
	c5_ShowMBDrag := 1
	}
If Prevc5_Label = 3 
	{
	Showc5_OverrideLabel := 0
	c5_ShowExeFilePathButton := 0
	SendKeyShowc5_Label := 1
	c5_ShowMBCtrl := 1
	c5_ShowMBShift := 1
	c5_ShowMBAlt := 1
	c5_ShowMBDrag := 1
	}
If Prevc5_Label between 4 and 6
	{
	Showc5_OverrideLabel := 0
	c5_ShowExeFilePathButton := 1
	SendKeyShowc5_Label := 1
	c5_ShowMBCtrl := 0
	c5_ShowMBShift := 0
	c5_ShowMBAlt := 0
	c5_ShowMBDrag := 0
	}
If Prevc6_Label = 2
	{
	Showc6_OverrideLabel := 0
	SendKeyShowc6_Label := 0
	c6_ShowExeFilePathButton := 1
	c6_ShowMBCtrl := 1
	c6_ShowMBShift := 1
	c6_ShowMBAlt := 1
	c6_ShowMBDrag := 1
	}
If Prevc6_Label = 3 
	{
	Showc6_OverrideLabel := 0
	c6_ShowExeFilePathButton := 0
	SendKeyShowc6_Label := 1
	c6_ShowMBCtrl := 1
	c6_ShowMBShift := 1
	c6_ShowMBAlt := 1
	c6_ShowMBDrag := 1
	}
If Prevc6_Label between 4 and 6
	{
	Showc6_OverrideLabel := 0
	c6_ShowExeFilePathButton := 1
	SendKeyShowc6_Label := 1
	c6_ShowMBCtrl := 0
	c6_ShowMBShift := 0
	c6_ShowMBAlt := 0
	c6_ShowMBDrag := 0
	}


If Prevdnull_Label = 2
	{
	Showdnull_OverrideLabel := 0
	SendKeyShowdnull_Label := 0
	dnull_ShowExeFilePathButton := 1
	dnull_ShowMBCtrl := 1
	dnull_ShowMBShift := 1
	dnull_ShowMBAlt := 1
	dnull_ShowMBDrag := 1
	}
If Prevdnull_Label = 3 
	{
	Showdnull_OverrideLabel := 0
	dnull_ShowExeFilePathButton := 0
	SendKeyShowdnull_Label := 1
	dnull_ShowMBCtrl := 1
	dnull_ShowMBShift := 1
	dnull_ShowMBAlt := 1
	dnull_ShowMBDrag := 1
	}
If Prevdnull_Label between 4 and 6
	{
	Showdnull_OverrideLabel := 0
	dnull_ShowExeFilePathButton := 1
	SendKeyShowdnull_Label := 1
	dnull_ShowMBCtrl := 0
	dnull_ShowMBShift := 0
	dnull_ShowMBAlt := 0
	dnull_ShowMBDrag := 0
	}
If Prevd1_Label = 2
	{
	Showd1_OverrideLabel := 0
	SendKeyShowd1_Label := 0
	d1_ShowExeFilePathButton := 1
	d1_ShowMBCtrl := 1
	d1_ShowMBShift := 1
	d1_ShowMBAlt := 1
	d1_ShowMBDrag := 1
	}
If Prevd1_Label = 3 
	{
	Showd1_OverrideLabel := 0
	d1_ShowExeFilePathButton := 0
	SendKeyShowd1_Label := 1
	d1_ShowMBCtrl := 1
	d1_ShowMBShift := 1
	d1_ShowMBAlt := 1
	d1_ShowMBDrag := 1
	}
If Prevd1_Label between 4 and 6
	{
	Showd1_OverrideLabel := 0
	d1_ShowExeFilePathButton := 1
	SendKeyShowd1_Label := 1
	d1_ShowMBCtrl := 0
	d1_ShowMBShift := 0
	d1_ShowMBAlt := 0
	d1_ShowMBDrag := 0
	}
If Prevd2_Label = 2
	{
	Showd2_OverrideLabel := 0
	SendKeyShowd2_Label := 0
	d2_ShowExeFilePathButton := 1
	d2_ShowMBCtrl := 1
	d2_ShowMBShift := 1
	d2_ShowMBAlt := 1
	d2_ShowMBDrag := 1
	}
If Prevd2_Label = 3 
	{
	Showd2_OverrideLabel := 0
	d2_ShowExeFilePathButton := 0
	SendKeyShowd2_Label := 1
	d2_ShowMBCtrl := 1
	d2_ShowMBShift := 1
	d2_ShowMBAlt := 1
	d2_ShowMBDrag := 1
	}
If Prevd2_Label between 4 and 6
	{
	Showd2_OverrideLabel := 0
	d2_ShowExeFilePathButton := 1
	SendKeyShowd2_Label := 1
	d2_ShowMBCtrl := 0
	d2_ShowMBShift := 0
	d2_ShowMBAlt := 0
	d2_ShowMBDrag := 0
	}
If Prevd3_Label = 2
	{
	Showd3_OverrideLabel := 0
	SendKeyShowd3_Label := 0
	d3_ShowExeFilePathButton := 1
	d3_ShowMBCtrl := 1
	d3_ShowMBShift := 1
	d3_ShowMBAlt := 1
	d3_ShowMBDrag := 1
	}
If Prevd3_Label = 3 
	{
	Showd3_OverrideLabel := 0
	d3_ShowExeFilePathButton := 0
	SendKeyShowd3_Label := 1
	d3_ShowMBCtrl := 1
	d3_ShowMBShift := 1
	d3_ShowMBAlt := 1
	d3_ShowMBDrag := 1
	}
If Prevd3_Label between 4 and 6
	{
	Showd3_OverrideLabel := 0
	d3_ShowExeFilePathButton := 1
	SendKeyShowd3_Label := 1
	d3_ShowMBCtrl := 0
	d3_ShowMBShift := 0
	d3_ShowMBAlt := 0
	d3_ShowMBDrag := 0
	}
If Prevd4_Label = 2
	{
	Showd4_OverrideLabel := 0
	SendKeyShowd4_Label := 0
	d4_ShowExeFilePathButton := 1
	d4_ShowMBCtrl := 1
	d4_ShowMBShift := 1
	d4_ShowMBAlt := 1
	d4_ShowMBDrag := 1
	}
If Prevd4_Label = 3 
	{
	Showd4_OverrideLabel := 0
	d4_ShowExeFilePathButton := 0
	SendKeyShowd4_Label := 1
	d4_ShowMBCtrl := 1
	d4_ShowMBShift := 1
	d4_ShowMBAlt := 1
	d4_ShowMBDrag := 1
	}
If Prevd4_Label between 4 and 6
	{
	Showd4_OverrideLabel := 0
	d4_ShowExeFilePathButton := 1
	SendKeyShowd4_Label := 1
	d4_ShowMBCtrl := 0
	d4_ShowMBShift := 0
	d4_ShowMBAlt := 0
	d4_ShowMBDrag := 0
	}
If Prevd5_Label = 2
	{
	Showd5_OverrideLabel := 0
	SendKeyShowd5_Label := 0
	d5_ShowExeFilePathButton := 1
	d5_ShowMBCtrl := 1
	d5_ShowMBShift := 1
	d5_ShowMBAlt := 1
	d5_ShowMBDrag := 1
	}
If Prevd5_Label = 3 
	{
	Showd5_OverrideLabel := 0
	d5_ShowExeFilePathButton := 0
	SendKeyShowd5_Label := 1
	d5_ShowMBCtrl := 1
	d5_ShowMBShift := 1
	d5_ShowMBAlt := 1
	d5_ShowMBDrag := 1
	}
If Prevd5_Label between 4 and 6
	{
	Showd5_OverrideLabel := 0
	d5_ShowExeFilePathButton := 1
	SendKeyShowd5_Label := 1
	d5_ShowMBCtrl := 0
	d5_ShowMBShift := 0
	d5_ShowMBAlt := 0
	d5_ShowMBDrag := 0
	}
If Prevd6_Label = 2
	{
	Showd6_OverrideLabel := 0
	SendKeyShowd6_Label := 0
	d6_ShowExeFilePathButton := 1
	d6_ShowMBCtrl := 1
	d6_ShowMBShift := 1
	d6_ShowMBAlt := 1
	d6_ShowMBDrag := 1
	}
If Prevd6_Label = 3 
	{
	Showd6_OverrideLabel := 0
	d6_ShowExeFilePathButton := 0
	SendKeyShowd6_Label := 1
	d6_ShowMBCtrl := 1
	d6_ShowMBShift := 1
	d6_ShowMBAlt := 1
	d6_ShowMBDrag := 1
	}
If Prevd6_Label between 4 and 6
	{
	Showd6_OverrideLabel := 0
	d6_ShowExeFilePathButton := 1
	SendKeyShowd6_Label := 1
	d6_ShowMBCtrl := 0
	d6_ShowMBShift := 0
	d6_ShowMBAlt := 0
	d6_ShowMBDrag := 0
	}	


If Prevenull_Label = 2
	{
	Showenull_OverrideLabel := 0
	SendKeyShowenull_Label := 0
	enull_ShowExeFilePathButton := 1
	enull_ShowMBCtrl := 1
	enull_ShowMBShift := 1
	enull_ShowMBAlt := 1
	enull_ShowMBDrag := 1
	}
If Prevenull_Label = 3 
	{
	Showenull_OverrideLabel := 0
	enull_ShowExeFilePathButton := 0
	SendKeyShowenull_Label := 1
	enull_ShowMBCtrl := 1
	enull_ShowMBShift := 1
	enull_ShowMBAlt := 1
	enull_ShowMBDrag := 1
	}
If Prevenull_Label between 4 and 6
	{
	Showenull_OverrideLabel := 0
	enull_ShowExeFilePathButton := 1
	SendKeyShowenull_Label := 1
	enull_ShowMBCtrl := 0
	enull_ShowMBShift := 0
	enull_ShowMBAlt := 0
	enull_ShowMBDrag := 0
	}
If Preve1_Label = 2
	{
	Showe1_OverrideLabel := 0
	SendKeyShowe1_Label := 0
	e1_ShowExeFilePathButton := 1
	e1_ShowMBCtrl := 1
	e1_ShowMBShift := 1
	e1_ShowMBAlt := 1
	e1_ShowMBDrag := 1
	}
If Preve1_Label = 3 
	{
	Showe1_OverrideLabel := 0
	e1_ShowExeFilePathButton := 0
	SendKeyShowe1_Label := 1
	e1_ShowMBCtrl := 1
	e1_ShowMBShift := 1
	e1_ShowMBAlt := 1
	e1_ShowMBDrag := 1
	}
If Preve1_Label between 4 and 6
	{
	Showe1_OverrideLabel := 0
	e1_ShowExeFilePathButton := 1
	SendKeyShowe1_Label := 1
	e1_ShowMBCtrl := 0
	e1_ShowMBShift := 0
	e1_ShowMBAlt := 0
	e1_ShowMBDrag := 0
	}
If Preve2_Label = 2
	{
	Showe2_OverrideLabel := 0
	SendKeyShowe2_Label := 0
	e2_ShowExeFilePathButton := 1
	e2_ShowMBCtrl := 1
	e2_ShowMBShift := 1
	e2_ShowMBAlt := 1
	e2_ShowMBDrag := 1
	}
If Preve2_Label = 3 
	{
	Showe2_OverrideLabel := 0
	e2_ShowExeFilePathButton := 0
	SendKeyShowe2_Label := 1
	e2_ShowMBCtrl := 1
	e2_ShowMBShift := 1
	e2_ShowMBAlt := 1
	e2_ShowMBDrag := 1
	}
If Preve2_Label between 4 and 6
	{
	Showe2_OverrideLabel := 0
	e2_ShowExeFilePathButton := 1
	SendKeyShowe2_Label := 1
	e2_ShowMBCtrl := 0
	e2_ShowMBShift := 0
	e2_ShowMBAlt := 0
	e2_ShowMBDrag := 0
	}
If Preve3_Label = 2
	{
	Showe3_OverrideLabel := 0
	SendKeyShowe3_Label := 0
	e3_ShowExeFilePathButton := 1
	e3_ShowMBCtrl := 1
	e3_ShowMBShift := 1
	e3_ShowMBAlt := 1
	e3_ShowMBDrag := 1
	}
If Preve3_Label = 3 
	{
	Showe3_OverrideLabel := 0
	e3_ShowExeFilePathButton := 0
	SendKeyShowe3_Label := 1
	e3_ShowMBCtrl := 1
	e3_ShowMBShift := 1
	e3_ShowMBAlt := 1
	e3_ShowMBDrag := 1
	}
If Preve3_Label between 4 and 6
	{
	Showe3_OverrideLabel := 0
	e3_ShowExeFilePathButton := 1
	SendKeyShowe3_Label := 1
	e3_ShowMBCtrl := 0
	e3_ShowMBShift := 0
	e3_ShowMBAlt := 0
	e3_ShowMBDrag := 0
	}
If Preve4_Label = 2
	{
	Showe4_OverrideLabel := 0
	SendKeyShowe4_Label := 0
	e4_ShowExeFilePathButton := 1
	e4_ShowMBCtrl := 1
	e4_ShowMBShift := 1
	e4_ShowMBAlt := 1
	e4_ShowMBDrag := 1
	}
If Preve4_Label = 3 
	{
	Showe4_OverrideLabel := 0
	e4_ShowExeFilePathButton := 0
	SendKeyShowe4_Label := 1
	e4_ShowMBCtrl := 1
	e4_ShowMBShift := 1
	e4_ShowMBAlt := 1
	e4_ShowMBDrag := 1
	}
If Preve4_Label between 4 and 6
	{
	Showe4_OverrideLabel := 0
	e4_ShowExeFilePathButton := 1
	SendKeyShowe4_Label := 1
	e4_ShowMBCtrl := 0
	e4_ShowMBShift := 0
	e4_ShowMBAlt := 0
	e4_ShowMBDrag := 0
	}
If Preve5_Label = 2
	{
	Showe5_OverrideLabel := 0
	SendKeyShowe5_Label := 0
	e5_ShowExeFilePathButton := 1
	e5_ShowMBCtrl := 1
	e5_ShowMBShift := 1
	e5_ShowMBAlt := 1
	e5_ShowMBDrag := 1
	}
If Preve5_Label = 3 
	{
	Showe5_OverrideLabel := 0
	e5_ShowExeFilePathButton := 0
	SendKeyShowe5_Label := 1
	e5_ShowMBCtrl := 1
	e5_ShowMBShift := 1
	e5_ShowMBAlt := 1
	e5_ShowMBDrag := 1
	}
If Preve5_Label between 4 and 6
	{
	Showe5_OverrideLabel := 0
	e5_ShowExeFilePathButton := 1
	SendKeyShowe5_Label := 1
	e5_ShowMBCtrl := 0
	e5_ShowMBShift := 0
	e5_ShowMBAlt := 0
	e5_ShowMBDrag := 0
	}
If Preve6_Label = 2
	{
	Showe6_OverrideLabel := 0
	SendKeyShowe6_Label := 0
	e6_ShowExeFilePathButton := 1
	e6_ShowMBCtrl := 1
	e6_ShowMBShift := 1
	e6_ShowMBAlt := 1
	e6_ShowMBDrag := 1
	}
If Preve6_Label = 3 
	{
	Showe6_OverrideLabel := 0
	e6_ShowExeFilePathButton := 0
	SendKeyShowe6_Label := 1
	e6_ShowMBCtrl := 1
	e6_ShowMBShift := 1
	e6_ShowMBAlt := 1
	e6_ShowMBDrag := 1
	}
If Preve6_Label between 4 and 6
	{
	Showe6_OverrideLabel := 0
	e6_ShowExeFilePathButton := 1
	SendKeyShowe6_Label := 1
	e6_ShowMBCtrl := 0
	e6_ShowMBShift := 0
	e6_ShowMBAlt := 0
	e6_ShowMBDrag := 0
	}	



If Prevfnull_Label = 2
	{
	Showfnull_OverrideLabel := 0
	SendKeyShowfnull_Label := 0
	fnull_ShowExeFilePathButton := 1
	fnull_ShowMBCtrl := 1
	fnull_ShowMBShift := 1
	fnull_ShowMBAlt := 1
	fnull_ShowMBDrag := 1
	}
If Prevfnull_Label = 3 
	{
	Showfnull_OverrideLabel := 0
	fnull_ShowExeFilePathButton := 0
	SendKeyShowfnull_Label := 1
	fnull_ShowMBCtrl := 1
	fnull_ShowMBShift := 1
	fnull_ShowMBAlt := 1
	fnull_ShowMBDrag := 1
	}
If Prevfnull_Label between 4 and 6
	{
	Showfnull_OverrideLabel := 0
	fnull_ShowExeFilePathButton := 1
	SendKeyShowfnull_Label := 1
	fnull_ShowMBCtrl := 0
	fnull_ShowMBShift := 0
	fnull_ShowMBAlt := 0
	fnull_ShowMBDrag := 0
	}
If Prevf1_Label = 2
	{
	Showf1_OverrideLabel := 0
	SendKeyShowf1_Label := 0
	f1_ShowExeFilePathButton := 1
	f1_ShowMBCtrl := 1
	f1_ShowMBShift := 1
	f1_ShowMBAlt := 1
	f1_ShowMBDrag := 1
	}
If Prevf1_Label = 3 
	{
	Showf1_OverrideLabel := 0
	f1_ShowExeFilePathButton := 0
	SendKeyShowf1_Label := 1
	f1_ShowMBCtrl := 1
	f1_ShowMBShift := 1
	f1_ShowMBAlt := 1
	f1_ShowMBDrag := 1
	}
If Prevf1_Label between 4 and 6
	{
	Showf1_OverrideLabel := 0
	f1_ShowExeFilePathButton := 1
	SendKeyShowf1_Label := 1
	f1_ShowMBCtrl := 0
	f1_ShowMBShift := 0
	f1_ShowMBAlt := 0
	f1_ShowMBDrag := 0
	}
If Prevf2_Label = 2
	{
	Showf2_OverrideLabel := 0
	SendKeyShowf2_Label := 0
	f2_ShowExeFilePathButton := 1
	f2_ShowMBCtrl := 1
	f2_ShowMBShift := 1
	f2_ShowMBAlt := 1
	f2_ShowMBDrag := 1
	}
If Prevf2_Label = 3 
	{
	Showf2_OverrideLabel := 0
	f2_ShowExeFilePathButton := 0
	SendKeyShowf2_Label := 1
	f2_ShowMBCtrl := 1
	f2_ShowMBShift := 1
	f2_ShowMBAlt := 1
	f2_ShowMBDrag := 1
	}
If Prevf2_Label between 4 and 6
	{
	Showf2_OverrideLabel := 0
	f2_ShowExeFilePathButton := 1
	SendKeyShowf2_Label := 1
	f2_ShowMBCtrl := 0
	f2_ShowMBShift := 0
	f2_ShowMBAlt := 0
	f2_ShowMBDrag := 0
	}
If Prevf3_Label = 2
	{
	Showf3_OverrideLabel := 0
	SendKeyShowf3_Label := 0
	f3_ShowExeFilePathButton := 1
	f3_ShowMBCtrl := 1
	f3_ShowMBShift := 1
	f3_ShowMBAlt := 1
	f3_ShowMBDrag := 1
	}
If Prevf3_Label = 3 
	{
	Showf3_OverrideLabel := 0
	f3_ShowExeFilePathButton := 0
	SendKeyShowf3_Label := 1
	f3_ShowMBCtrl := 1
	f3_ShowMBShift := 1
	f3_ShowMBAlt := 1
	f3_ShowMBDrag := 1
	}
If Prevf3_Label between 4 and 6
	{
	Showf3_OverrideLabel := 0
	f3_ShowExeFilePathButton := 1
	SendKeyShowf3_Label := 1
	f3_ShowMBCtrl := 0
	f3_ShowMBShift := 0
	f3_ShowMBAlt := 0
	f3_ShowMBDrag := 0
	}
If Prevf4_Label = 2
	{
	Showf4_OverrideLabel := 0
	SendKeyShowf4_Label := 0
	f4_ShowExeFilePathButton := 1
	f4_ShowMBCtrl := 1
	f4_ShowMBShift := 1
	f4_ShowMBAlt := 1
	f4_ShowMBDrag := 1
	}
If Prevf4_Label = 3 
	{
	Showf4_OverrideLabel := 0
	f4_ShowExeFilePathButton := 0
	SendKeyShowf4_Label := 1
	f4_ShowMBCtrl := 1
	f4_ShowMBShift := 1
	f4_ShowMBAlt := 1
	f4_ShowMBDrag := 1
	}
If Prevf4_Label between 4 and 6
	{
	Showf4_OverrideLabel := 0
	f4_ShowExeFilePathButton := 1
	SendKeyShowf4_Label := 1
	f4_ShowMBCtrl := 0
	f4_ShowMBShift := 0
	f4_ShowMBAlt := 0
	f4_ShowMBDrag := 0
	}
If Prevf5_Label = 2
	{
	Showf5_OverrideLabel := 0
	SendKeyShowf5_Label := 0
	f5_ShowExeFilePathButton := 1
	f5_ShowMBCtrl := 1
	f5_ShowMBShift := 1
	f5_ShowMBAlt := 1
	f5_ShowMBDrag := 1
	}
If Prevf5_Label = 3 
	{
	Showf5_OverrideLabel := 0
	f5_ShowExeFilePathButton := 0
	SendKeyShowf5_Label := 1
	f5_ShowMBCtrl := 1
	f5_ShowMBShift := 1
	f5_ShowMBAlt := 1
	f5_ShowMBDrag := 1
	}
If Prevf5_Label between 4 and 6
	{
	Showf5_OverrideLabel := 0
	f5_ShowExeFilePathButton := 1
	SendKeyShowf5_Label := 1
	f5_ShowMBCtrl := 0
	f5_ShowMBShift := 0
	f5_ShowMBAlt := 0
	f5_ShowMBDrag := 0
	}
If Prevf6_Label = 2
	{
	Showf6_OverrideLabel := 0
	SendKeyShowf6_Label := 0
	f6_ShowExeFilePathButton := 1
	f6_ShowMBCtrl := 1
	f6_ShowMBShift := 1
	f6_ShowMBAlt := 1
	f6_ShowMBDrag := 1
	}
If Prevf6_Label = 3 
	{
	Showf6_OverrideLabel := 0
	f6_ShowExeFilePathButton := 0
	SendKeyShowf6_Label := 1
	f6_ShowMBCtrl := 1
	f6_ShowMBShift := 1
	f6_ShowMBAlt := 1
	f6_ShowMBDrag := 1
	}
If Prevf6_Label between 4 and 6
	{
	Showf6_OverrideLabel := 0
	f6_ShowExeFilePathButton := 1
	SendKeyShowf6_Label := 1
	f6_ShowMBCtrl := 0
	f6_ShowMBShift := 0
	f6_ShowMBAlt := 0
	f6_ShowMBDrag := 0
	}	



If Prevgnull_Label = 2
	{
	Showgnull_OverrideLabel := 0
	SendKeyShowgnull_Label := 0
	gnull_ShowExeFilePathButton := 1
	gnull_ShowMBCtrl := 1
	gnull_ShowMBShift := 1
	gnull_ShowMBAlt := 1
	gnull_ShowMBDrag := 1
	}
If Prevgnull_Label = 3 
	{
	Showgnull_OverrideLabel := 0
	gnull_ShowExeFilePathButton := 0
	SendKeyShowgnull_Label := 1
	gnull_ShowMBCtrl := 1
	gnull_ShowMBShift := 1
	gnull_ShowMBAlt := 1
	gnull_ShowMBDrag := 1
	}
If Prevgnull_Label between 4 and 6
	{
	Showgnull_OverrideLabel := 0
	gnull_ShowExeFilePathButton := 1
	SendKeyShowgnull_Label := 1
	gnull_ShowMBCtrl := 0
	gnull_ShowMBShift := 0
	gnull_ShowMBAlt := 0
	gnull_ShowMBDrag := 0
	}
If Prevg1_Label = 2
	{
	Showg1_OverrideLabel := 0
	SendKeyShowg1_Label := 0
	g1_ShowExeFilePathButton := 1
	g1_ShowMBCtrl := 1
	g1_ShowMBShift := 1
	g1_ShowMBAlt := 1
	g1_ShowMBDrag := 1
	}
If Prevg1_Label = 3 
	{
	Showg1_OverrideLabel := 0
	g1_ShowExeFilePathButton := 0
	SendKeyShowg1_Label := 1
	g1_ShowMBCtrl := 1
	g1_ShowMBShift := 1
	g1_ShowMBAlt := 1
	g1_ShowMBDrag := 1
	}
If Prevg1_Label between 4 and 6
	{
	Showg1_OverrideLabel := 0
	g1_ShowExeFilePathButton := 1
	SendKeyShowg1_Label := 1
	g1_ShowMBCtrl := 0
	g1_ShowMBShift := 0
	g1_ShowMBAlt := 0
	g1_ShowMBDrag := 0
	}
If Prevg2_Label = 2
	{
	Showg2_OverrideLabel := 0
	SendKeyShowg2_Label := 0
	g2_ShowExeFilePathButton := 1
	g2_ShowMBCtrl := 1
	g2_ShowMBShift := 1
	g2_ShowMBAlt := 1
	g2_ShowMBDrag := 1
	}
If Prevg2_Label = 3 
	{
	Showg2_OverrideLabel := 0
	g2_ShowExeFilePathButton := 0
	SendKeyShowg2_Label := 1
	g2_ShowMBCtrl := 1
	g2_ShowMBShift := 1
	g2_ShowMBAlt := 1
	g2_ShowMBDrag := 1
	}
If Prevg2_Label between 4 and 6
	{
	Showg2_OverrideLabel := 0
	g2_ShowExeFilePathButton := 1
	SendKeyShowg2_Label := 1
	g2_ShowMBCtrl := 0
	g2_ShowMBShift := 0
	g2_ShowMBAlt := 0
	g2_ShowMBDrag := 0
	}
If Prevg3_Label = 2
	{
	Showg3_OverrideLabel := 0
	SendKeyShowg3_Label := 0
	g3_ShowExeFilePathButton := 1
	g3_ShowMBCtrl := 1
	g3_ShowMBShift := 1
	g3_ShowMBAlt := 1
	g3_ShowMBDrag := 1
	}
If Prevg3_Label = 3 
	{
	Showg3_OverrideLabel := 0
	g3_ShowExeFilePathButton := 0
	SendKeyShowg3_Label := 1
	g3_ShowMBCtrl := 1
	g3_ShowMBShift := 1
	g3_ShowMBAlt := 1
	g3_ShowMBDrag := 1
	}
If Prevg3_Label between 4 and 6
	{
	Showg3_OverrideLabel := 0
	g3_ShowExeFilePathButton := 1
	SendKeyShowg3_Label := 1
	g3_ShowMBCtrl := 0
	g3_ShowMBShift := 0
	g3_ShowMBAlt := 0
	g3_ShowMBDrag := 0
	}
If Prevg4_Label = 2
	{
	Showg4_OverrideLabel := 0
	SendKeyShowg4_Label := 0
	g4_ShowExeFilePathButton := 1
	g4_ShowMBCtrl := 1
	g4_ShowMBShift := 1
	g4_ShowMBAlt := 1
	g4_ShowMBDrag := 1
	}
If Prevg4_Label = 3 
	{
	Showg4_OverrideLabel := 0
	g4_ShowExeFilePathButton := 0
	SendKeyShowg4_Label := 1
	g4_ShowMBCtrl := 1
	g4_ShowMBShift := 1
	g4_ShowMBAlt := 1
	g4_ShowMBDrag := 1
	}
If Prevg4_Label between 4 and 6
	{
	Showg4_OverrideLabel := 0
	g4_ShowExeFilePathButton := 1
	SendKeyShowg4_Label := 1
	g4_ShowMBCtrl := 0
	g4_ShowMBShift := 0
	g4_ShowMBAlt := 0
	g4_ShowMBDrag := 0
	}
If Prevg5_Label = 2
	{
	Showg5_OverrideLabel := 0
	SendKeyShowg5_Label := 0
	g5_ShowExeFilePathButton := 1
	g5_ShowMBCtrl := 1
	g5_ShowMBShift := 1
	g5_ShowMBAlt := 1
	g5_ShowMBDrag := 1
	}
If Prevg5_Label = 3 
	{
	Showg5_OverrideLabel := 0
	g5_ShowExeFilePathButton := 0
	SendKeyShowg5_Label := 1
	g5_ShowMBCtrl := 1
	g5_ShowMBShift := 1
	g5_ShowMBAlt := 1
	g5_ShowMBDrag := 1
	}
If Prevg5_Label between 4 and 6
	{
	Showg5_OverrideLabel := 0
	g5_ShowExeFilePathButton := 1
	SendKeyShowg5_Label := 1
	g5_ShowMBCtrl := 0
	g5_ShowMBShift := 0
	g5_ShowMBAlt := 0
	g5_ShowMBDrag := 0
	}
If Prevg6_Label = 2
	{
	Showg6_OverrideLabel := 0
	SendKeyShowg6_Label := 0
	g6_ShowExeFilePathButton := 1
	g6_ShowMBCtrl := 1
	g6_ShowMBShift := 1
	g6_ShowMBAlt := 1
	g6_ShowMBDrag := 1
	}
If Prevg6_Label = 3 
	{
	Showg6_OverrideLabel := 0
	g6_ShowExeFilePathButton := 0
	SendKeyShowg6_Label := 1
	g6_ShowMBCtrl := 1
	g6_ShowMBShift := 1
	g6_ShowMBAlt := 1
	g6_ShowMBDrag := 1
	}
If Prevg6_Label between 4 and 6
	{
	Showg6_OverrideLabel := 0
	g6_ShowExeFilePathButton := 1
	SendKeyShowg6_Label := 1
	g6_ShowMBCtrl := 0
	g6_ShowMBShift := 0
	g6_ShowMBAlt := 0
	g6_ShowMBDrag := 0
	}	



If Prevhnull_Label = 2
	{
	Showhnull_OverrideLabel := 0
	SendKeyShowhnull_Label := 0
	hnull_ShowExeFilePathButton := 1
	hnull_ShowMBCtrl := 1
	hnull_ShowMBShift := 1
	hnull_ShowMBAlt := 1
	hnull_ShowMBDrag := 1
	}
If Prevhnull_Label = 3 
	{
	Showhnull_OverrideLabel := 0
	hnull_ShowExeFilePathButton := 0
	SendKeyShowhnull_Label := 1
	hnull_ShowMBCtrl := 1
	hnull_ShowMBShift := 1
	hnull_ShowMBAlt := 1
	hnull_ShowMBDrag := 1
	}
If Prevhnull_Label between 4 and 6
	{
	Showhnull_OverrideLabel := 0
	hnull_ShowExeFilePathButton := 1
	SendKeyShowhnull_Label := 1
	hnull_ShowMBCtrl := 0
	hnull_ShowMBShift := 0
	hnull_ShowMBAlt := 0
	hnull_ShowMBDrag := 0
	}
If Prevh1_Label = 2
	{
	Showh1_OverrideLabel := 0
	SendKeyShowh1_Label := 0
	h1_ShowExeFilePathButton := 1
	h1_ShowMBCtrl := 1
	h1_ShowMBShift := 1
	h1_ShowMBAlt := 1
	h1_ShowMBDrag := 1
	}
If Prevh1_Label = 3 
	{
	Showh1_OverrideLabel := 0
	h1_ShowExeFilePathButton := 0
	SendKeyShowh1_Label := 1
	h1_ShowMBCtrl := 1
	h1_ShowMBShift := 1
	h1_ShowMBAlt := 1
	h1_ShowMBDrag := 1
	}
If Prevh1_Label between 4 and 6
	{
	Showh1_OverrideLabel := 0
	h1_ShowExeFilePathButton := 1
	SendKeyShowh1_Label := 1
	h1_ShowMBCtrl := 0
	h1_ShowMBShift := 0
	h1_ShowMBAlt := 0
	h1_ShowMBDrag := 0
	}
If Prevh2_Label = 2
	{
	Showh2_OverrideLabel := 0
	SendKeyShowh2_Label := 0
	h2_ShowExeFilePathButton := 1
	h2_ShowMBCtrl := 1
	h2_ShowMBShift := 1
	h2_ShowMBAlt := 1
	h2_ShowMBDrag := 1
	}
If Prevh2_Label = 3 
	{
	Showh2_OverrideLabel := 0
	h2_ShowExeFilePathButton := 0
	SendKeyShowh2_Label := 1
	h2_ShowMBCtrl := 1
	h2_ShowMBShift := 1
	h2_ShowMBAlt := 1
	h2_ShowMBDrag := 1
	}
If Prevh2_Label between 4 and 6
	{
	Showh2_OverrideLabel := 0
	h2_ShowExeFilePathButton := 1
	SendKeyShowh2_Label := 1
	h2_ShowMBCtrl := 0
	h2_ShowMBShift := 0
	h2_ShowMBAlt := 0
	h2_ShowMBDrag := 0
	}
If Prevh3_Label = 2
	{
	Showh3_OverrideLabel := 0
	SendKeyShowh3_Label := 0
	h3_ShowExeFilePathButton := 1
	h3_ShowMBCtrl := 1
	h3_ShowMBShift := 1
	h3_ShowMBAlt := 1
	h3_ShowMBDrag := 1
	}
If Prevh3_Label = 3 
	{
	Showh3_OverrideLabel := 0
	h3_ShowExeFilePathButton := 0
	SendKeyShowh3_Label := 1
	h3_ShowMBCtrl := 1
	h3_ShowMBShift := 1
	h3_ShowMBAlt := 1
	h3_ShowMBDrag := 1
	}
If Prevh3_Label between 4 and 6
	{
	Showh3_OverrideLabel := 0
	h3_ShowExeFilePathButton := 1
	SendKeyShowh3_Label := 1
	h3_ShowMBCtrl := 0
	h3_ShowMBShift := 0
	h3_ShowMBAlt := 0
	h3_ShowMBDrag := 0
	}
If Prevh4_Label = 2
	{
	Showh4_OverrideLabel := 0
	SendKeyShowh4_Label := 0
	h4_ShowExeFilePathButton := 1
	h4_ShowMBCtrl := 1
	h4_ShowMBShift := 1
	h4_ShowMBAlt := 1
	h4_ShowMBDrag := 1
	}
If Prevh4_Label = 3 
	{
	Showh4_OverrideLabel := 0
	h4_ShowExeFilePathButton := 0
	SendKeyShowh4_Label := 1
	h4_ShowMBCtrl := 1
	h4_ShowMBShift := 1
	h4_ShowMBAlt := 1
	h4_ShowMBDrag := 1
	}
If Prevh4_Label between 4 and 6
	{
	Showh4_OverrideLabel := 0
	h4_ShowExeFilePathButton := 1
	SendKeyShowh4_Label := 1
	h4_ShowMBCtrl := 0
	h4_ShowMBShift := 0
	h4_ShowMBAlt := 0
	h4_ShowMBDrag := 0
	}
If Prevh5_Label = 2
	{
	Showh5_OverrideLabel := 0
	SendKeyShowh5_Label := 0
	h5_ShowExeFilePathButton := 1
	h5_ShowMBCtrl := 1
	h5_ShowMBShift := 1
	h5_ShowMBAlt := 1
	h5_ShowMBDrag := 1
	}
If Prevh5_Label = 3 
	{
	Showh5_OverrideLabel := 0
	h5_ShowExeFilePathButton := 0
	SendKeyShowh5_Label := 1
	h5_ShowMBCtrl := 1
	h5_ShowMBShift := 1
	h5_ShowMBAlt := 1
	h5_ShowMBDrag := 1
	}
If Prevh5_Label between 4 and 6
	{
	Showh5_OverrideLabel := 0
	h5_ShowExeFilePathButton := 1
	SendKeyShowh5_Label := 1
	h5_ShowMBCtrl := 0
	h5_ShowMBShift := 0
	h5_ShowMBAlt := 0
	h5_ShowMBDrag := 0
	}
If Prevh6_Label = 2
	{
	Showh6_OverrideLabel := 0
	SendKeyShowh6_Label := 0
	h6_ShowExeFilePathButton := 1
	h6_ShowMBCtrl := 1
	h6_ShowMBShift := 1
	h6_ShowMBAlt := 1
	h6_ShowMBDrag := 1
	}
If Prevh6_Label = 3 
	{
	Showh6_OverrideLabel := 0
	h6_ShowExeFilePathButton := 0
	SendKeyShowh6_Label := 1
	h6_ShowMBCtrl := 1
	h6_ShowMBShift := 1
	h6_ShowMBAlt := 1
	h6_ShowMBDrag := 1
	}
If Prevh6_Label between 4 and 6
	{
	Showh6_OverrideLabel := 0
	h6_ShowExeFilePathButton := 1
	SendKeyShowh6_Label := 1
	h6_ShowMBCtrl := 0
	h6_ShowMBShift := 0
	h6_ShowMBAlt := 0
	h6_ShowMBDrag := 0
	}	



If Previnull_Label = 2
	{
	Showinull_OverrideLabel := 0
	SendKeyShowinull_Label := 0
	inull_ShowExeFilePathButton := 1
	inull_ShowMBCtrl := 1
	inull_ShowMBShift := 1
	inull_ShowMBAlt := 1
	inull_ShowMBDrag := 1
	}
If Previnull_Label = 3 
	{
	Showinull_OverrideLabel := 0
	inull_ShowExeFilePathButton := 0
	SendKeyShowinull_Label := 1
	inull_ShowMBCtrl := 1
	inull_ShowMBShift := 1
	inull_ShowMBAlt := 1
	inull_ShowMBDrag := 1
	}
If Previnull_Label between 4 and 6
	{
	Showinull_OverrideLabel := 0
	inull_ShowExeFilePathButton := 1
	SendKeyShowinull_Label := 1
	inull_ShowMBCtrl := 0
	inull_ShowMBShift := 0
	inull_ShowMBAlt := 0
	inull_ShowMBDrag := 0
	}
If Previ1_Label = 2
	{
	Showi1_OverrideLabel := 0
	SendKeyShowi1_Label := 0
	i1_ShowExeFilePathButton := 1
	i1_ShowMBCtrl := 1
	i1_ShowMBShift := 1
	i1_ShowMBAlt := 1
	i1_ShowMBDrag := 1
	}
If Previ1_Label = 3 
	{
	Showi1_OverrideLabel := 0
	i1_ShowExeFilePathButton := 0
	SendKeyShowi1_Label := 1
	i1_ShowMBCtrl := 1
	i1_ShowMBShift := 1
	i1_ShowMBAlt := 1
	i1_ShowMBDrag := 1
	}
If Previ1_Label between 4 and 6
	{
	Showi1_OverrideLabel := 0
	i1_ShowExeFilePathButton := 1
	SendKeyShowi1_Label := 1
	i1_ShowMBCtrl := 0
	i1_ShowMBShift := 0
	i1_ShowMBAlt := 0
	i1_ShowMBDrag := 0
	}
If Previ2_Label = 2
	{
	Showi2_OverrideLabel := 0
	SendKeyShowi2_Label := 0
	i2_ShowExeFilePathButton := 1
	i2_ShowMBCtrl := 1
	i2_ShowMBShift := 1
	i2_ShowMBAlt := 1
	i2_ShowMBDrag := 1
	}
If Previ2_Label = 3 
	{
	Showi2_OverrideLabel := 0
	i2_ShowExeFilePathButton := 0
	SendKeyShowi2_Label := 1
	i2_ShowMBCtrl := 1
	i2_ShowMBShift := 1
	i2_ShowMBAlt := 1
	i2_ShowMBDrag := 1
	}
If Previ2_Label between 4 and 6
	{
	Showi2_OverrideLabel := 0
	i2_ShowExeFilePathButton := 1
	SendKeyShowi2_Label := 1
	i2_ShowMBCtrl := 0
	i2_ShowMBShift := 0
	i2_ShowMBAlt := 0
	i2_ShowMBDrag := 0
	}
If Previ3_Label = 2
	{
	Showi3_OverrideLabel := 0
	SendKeyShowi3_Label := 0
	i3_ShowExeFilePathButton := 1
	i3_ShowMBCtrl := 1
	i3_ShowMBShift := 1
	i3_ShowMBAlt := 1
	i3_ShowMBDrag := 1
	}
If Previ3_Label = 3 
	{
	Showi3_OverrideLabel := 0
	i3_ShowExeFilePathButton := 0
	SendKeyShowi3_Label := 1
	i3_ShowMBCtrl := 1
	i3_ShowMBShift := 1
	i3_ShowMBAlt := 1
	i3_ShowMBDrag := 1
	}
If Previ3_Label between 4 and 6
	{
	Showi3_OverrideLabel := 0
	i3_ShowExeFilePathButton := 1
	SendKeyShowi3_Label := 1
	i3_ShowMBCtrl := 0
	i3_ShowMBShift := 0
	i3_ShowMBAlt := 0
	i3_ShowMBDrag := 0
	}
If Previ4_Label = 2
	{
	Showi4_OverrideLabel := 0
	SendKeyShowi4_Label := 0
	i4_ShowExeFilePathButton := 1
	i4_ShowMBCtrl := 1
	i4_ShowMBShift := 1
	i4_ShowMBAlt := 1
	i4_ShowMBDrag := 1
	}
If Previ4_Label = 3 
	{
	Showi4_OverrideLabel := 0
	i4_ShowExeFilePathButton := 0
	SendKeyShowi4_Label := 1
	i4_ShowMBCtrl := 1
	i4_ShowMBShift := 1
	i4_ShowMBAlt := 1
	i4_ShowMBDrag := 1
	}
If Previ4_Label between 4 and 6
	{
	Showi4_OverrideLabel := 0
	i4_ShowExeFilePathButton := 1
	SendKeyShowi4_Label := 1
	i4_ShowMBCtrl := 0
	i4_ShowMBShift := 0
	i4_ShowMBAlt := 0
	i4_ShowMBDrag := 0
	}
If Previ5_Label = 2
	{
	Showi5_OverrideLabel := 0
	SendKeyShowi5_Label := 0
	i5_ShowExeFilePathButton := 1
	i5_ShowMBCtrl := 1
	i5_ShowMBShift := 1
	i5_ShowMBAlt := 1
	i5_ShowMBDrag := 1
	}
If Previ5_Label = 3 
	{
	Showi5_OverrideLabel := 0
	i5_ShowExeFilePathButton := 0
	SendKeyShowi5_Label := 1
	i5_ShowMBCtrl := 1
	i5_ShowMBShift := 1
	i5_ShowMBAlt := 1
	i5_ShowMBDrag := 1
	}
If Previ5_Label between 4 and 6
	{
	Showi5_OverrideLabel := 0
	i5_ShowExeFilePathButton := 1
	SendKeyShowi5_Label := 1
	i5_ShowMBCtrl := 0
	i5_ShowMBShift := 0
	i5_ShowMBAlt := 0
	i5_ShowMBDrag := 0
	}
If Previ6_Label = 2
	{
	Showi6_OverrideLabel := 0
	SendKeyShowi6_Label := 0
	i6_ShowExeFilePathButton := 1
	i6_ShowMBCtrl := 1
	i6_ShowMBShift := 1
	i6_ShowMBAlt := 1
	i6_ShowMBDrag := 1
	}
If Previ6_Label = 3 
	{
	Showi6_OverrideLabel := 0
	i6_ShowExeFilePathButton := 0
	SendKeyShowi6_Label := 1
	i6_ShowMBCtrl := 1
	i6_ShowMBShift := 1
	i6_ShowMBAlt := 1
	i6_ShowMBDrag := 1
	}
If Previ6_Label between 4 and 6
	{
	Showi6_OverrideLabel := 0
	i6_ShowExeFilePathButton := 1
	SendKeyShowi6_Label := 1
	i6_ShowMBCtrl := 0
	i6_ShowMBShift := 0
	i6_ShowMBAlt := 0
	i6_ShowMBDrag := 0
	}	



If Prevjnull_Label = 2
	{
	Showjnull_OverrideLabel := 0
	SendKeyShowjnull_Label := 0
	jnull_ShowExeFilePathButton := 1
	jnull_ShowMBCtrl := 1
	jnull_ShowMBShift := 1
	jnull_ShowMBAlt := 1
	jnull_ShowMBDrag := 1
	}
If Prevjnull_Label = 3 
	{
	Showjnull_OverrideLabel := 0
	jnull_ShowExeFilePathButton := 0
	SendKeyShowjnull_Label := 1
	jnull_ShowMBCtrl := 1
	jnull_ShowMBShift := 1
	jnull_ShowMBAlt := 1
	jnull_ShowMBDrag := 1
	}
If Prevjnull_Label between 4 and 6
	{
	Showjnull_OverrideLabel := 0
	jnull_ShowExeFilePathButton := 1
	SendKeyShowjnull_Label := 1
	jnull_ShowMBCtrl := 0
	jnull_ShowMBShift := 0
	jnull_ShowMBAlt := 0
	jnull_ShowMBDrag := 0
	}
If Prevj1_Label = 2
	{
	Showj1_OverrideLabel := 0
	SendKeyShowj1_Label := 0
	j1_ShowExeFilePathButton := 1
	j1_ShowMBCtrl := 1
	j1_ShowMBShift := 1
	j1_ShowMBAlt := 1
	j1_ShowMBDrag := 1
	}
If Prevj1_Label = 3 
	{
	Showj1_OverrideLabel := 0
	j1_ShowExeFilePathButton := 0
	SendKeyShowj1_Label := 1
	j1_ShowMBCtrl := 1
	j1_ShowMBShift := 1
	j1_ShowMBAlt := 1
	j1_ShowMBDrag := 1
	}
If Prevj1_Label between 4 and 6
	{
	Showj1_OverrideLabel := 0
	j1_ShowExeFilePathButton := 1
	SendKeyShowj1_Label := 1
	j1_ShowMBCtrl := 0
	j1_ShowMBShift := 0
	j1_ShowMBAlt := 0
	j1_ShowMBDrag := 0
	}
If Prevj2_Label = 2
	{
	Showj2_OverrideLabel := 0
	SendKeyShowj2_Label := 0
	j2_ShowExeFilePathButton := 1
	j2_ShowMBCtrl := 1
	j2_ShowMBShift := 1
	j2_ShowMBAlt := 1
	j2_ShowMBDrag := 1
	}
If Prevj2_Label = 3 
	{
	Showj2_OverrideLabel := 0
	j2_ShowExeFilePathButton := 0
	SendKeyShowj2_Label := 1
	j2_ShowMBCtrl := 1
	j2_ShowMBShift := 1
	j2_ShowMBAlt := 1
	j2_ShowMBDrag := 1
	}
If Prevj2_Label between 4 and 6
	{
	Showj2_OverrideLabel := 0
	j2_ShowExeFilePathButton := 1
	SendKeyShowj2_Label := 1
	j2_ShowMBCtrl := 0
	j2_ShowMBShift := 0
	j2_ShowMBAlt := 0
	j2_ShowMBDrag := 0
	}
If Prevj3_Label = 2
	{
	Showj3_OverrideLabel := 0
	SendKeyShowj3_Label := 0
	j3_ShowExeFilePathButton := 1
	j3_ShowMBCtrl := 1
	j3_ShowMBShift := 1
	j3_ShowMBAlt := 1
	j3_ShowMBDrag := 1
	}
If Prevj3_Label = 3 
	{
	Showj3_OverrideLabel := 0
	j3_ShowExeFilePathButton := 0
	SendKeyShowj3_Label := 1
	j3_ShowMBCtrl := 1
	j3_ShowMBShift := 1
	j3_ShowMBAlt := 1
	j3_ShowMBDrag := 1
	}
If Prevj3_Label between 4 and 6
	{
	Showj3_OverrideLabel := 0
	j3_ShowExeFilePathButton := 1
	SendKeyShowj3_Label := 1
	j3_ShowMBCtrl := 0
	j3_ShowMBShift := 0
	j3_ShowMBAlt := 0
	j3_ShowMBDrag := 0
	}
If Prevj4_Label = 2
	{
	Showj4_OverrideLabel := 0
	SendKeyShowj4_Label := 0
	j4_ShowExeFilePathButton := 1
	j4_ShowMBCtrl := 1
	j4_ShowMBShift := 1
	j4_ShowMBAlt := 1
	j4_ShowMBDrag := 1
	}
If Prevj4_Label = 3 
	{
	Showj4_OverrideLabel := 0
	j4_ShowExeFilePathButton := 0
	SendKeyShowj4_Label := 1
	j4_ShowMBCtrl := 1
	j4_ShowMBShift := 1
	j4_ShowMBAlt := 1
	j4_ShowMBDrag := 1
	}
If Prevj4_Label between 4 and 6
	{
	Showj4_OverrideLabel := 0
	j4_ShowExeFilePathButton := 1
	SendKeyShowj4_Label := 1
	j4_ShowMBCtrl := 0
	j4_ShowMBShift := 0
	j4_ShowMBAlt := 0
	j4_ShowMBDrag := 0
	}
If Prevj5_Label = 2
	{
	Showj5_OverrideLabel := 0
	SendKeyShowj5_Label := 0
	j5_ShowExeFilePathButton := 1
	j5_ShowMBCtrl := 1
	j5_ShowMBShift := 1
	j5_ShowMBAlt := 1
	j5_ShowMBDrag := 1
	}
If Prevj5_Label = 3 
	{
	Showj5_OverrideLabel := 0
	j5_ShowExeFilePathButton := 0
	SendKeyShowj5_Label := 1
	j5_ShowMBCtrl := 1
	j5_ShowMBShift := 1
	j5_ShowMBAlt := 1
	j5_ShowMBDrag := 1
	}
If Prevj5_Label between 4 and 6
	{
	Showj5_OverrideLabel := 0
	j5_ShowExeFilePathButton := 1
	SendKeyShowj5_Label := 1
	j5_ShowMBCtrl := 0
	j5_ShowMBShift := 0
	j5_ShowMBAlt := 0
	j5_ShowMBDrag := 0
	}
If Prevj6_Label = 2
	{
	Showj6_OverrideLabel := 0
	SendKeyShowj6_Label := 0
	j6_ShowExeFilePathButton := 1
	j6_ShowMBCtrl := 1
	j6_ShowMBShift := 1
	j6_ShowMBAlt := 1
	j6_ShowMBDrag := 1
	}
If Prevj6_Label = 3 
	{
	Showj6_OverrideLabel := 0
	j6_ShowExeFilePathButton := 0
	SendKeyShowj6_Label := 1
	j6_ShowMBCtrl := 1
	j6_ShowMBShift := 1
	j6_ShowMBAlt := 1
	j6_ShowMBDrag := 1
	}
If Prevj6_Label between 4 and 6
	{
	Showj6_OverrideLabel := 0
	j6_ShowExeFilePathButton := 1
	SendKeyShowj6_Label := 1
	j6_ShowMBCtrl := 0
	j6_ShowMBShift := 0
	j6_ShowMBAlt := 0
	j6_ShowMBDrag := 0
	}	



If Prevknull_Label = 2
	{
	Showknull_OverrideLabel := 0
	SendKeyShowknull_Label := 0
	knull_ShowExeFilePathButton := 1
	knull_ShowMBCtrl := 1
	knull_ShowMBShift := 1
	knull_ShowMBAlt := 1
	knull_ShowMBDrag := 1
	}
If Prevknull_Label = 3 
	{
	Showknull_OverrideLabel := 0
	knull_ShowExeFilePathButton := 0
	SendKeyShowknull_Label := 1
	knull_ShowMBCtrl := 1
	knull_ShowMBShift := 1
	knull_ShowMBAlt := 1
	knull_ShowMBDrag := 1
	}
If Prevknull_Label between 4 and 6
	{
	Showknull_OverrideLabel := 0
	knull_ShowExeFilePathButton := 1
	SendKeyShowknull_Label := 1
	knull_ShowMBCtrl := 0
	knull_ShowMBShift := 0
	knull_ShowMBAlt := 0
	knull_ShowMBDrag := 0
	}
If Prevk1_Label = 2
	{
	Showk1_OverrideLabel := 0
	SendKeyShowk1_Label := 0
	k1_ShowExeFilePathButton := 1
	k1_ShowMBCtrl := 1
	k1_ShowMBShift := 1
	k1_ShowMBAlt := 1
	k1_ShowMBDrag := 1
	}
If Prevk1_Label = 3 
	{
	Showk1_OverrideLabel := 0
	k1_ShowExeFilePathButton := 0
	SendKeyShowk1_Label := 1
	k1_ShowMBCtrl := 1
	k1_ShowMBShift := 1
	k1_ShowMBAlt := 1
	k1_ShowMBDrag := 1
	}
If Prevk1_Label between 4 and 6
	{
	Showk1_OverrideLabel := 0
	k1_ShowExeFilePathButton := 1
	SendKeyShowk1_Label := 1
	k1_ShowMBCtrl := 0
	k1_ShowMBShift := 0
	k1_ShowMBAlt := 0
	k1_ShowMBDrag := 0
	}
If Prevk2_Label = 2
	{
	Showk2_OverrideLabel := 0
	SendKeyShowk2_Label := 0
	k2_ShowExeFilePathButton := 1
	k2_ShowMBCtrl := 1
	k2_ShowMBShift := 1
	k2_ShowMBAlt := 1
	k2_ShowMBDrag := 1
	}
If Prevk2_Label = 3 
	{
	Showk2_OverrideLabel := 0
	k2_ShowExeFilePathButton := 0
	SendKeyShowk2_Label := 1
	k2_ShowMBCtrl := 1
	k2_ShowMBShift := 1
	k2_ShowMBAlt := 1
	k2_ShowMBDrag := 1
	}
If Prevk2_Label between 4 and 6
	{
	Showk2_OverrideLabel := 0
	k2_ShowExeFilePathButton := 1
	SendKeyShowk2_Label := 1
	k2_ShowMBCtrl := 0
	k2_ShowMBShift := 0
	k2_ShowMBAlt := 0
	k2_ShowMBDrag := 0
	}
If Prevk3_Label = 2
	{
	Showk3_OverrideLabel := 0
	SendKeyShowk3_Label := 0
	k3_ShowExeFilePathButton := 1
	k3_ShowMBCtrl := 1
	k3_ShowMBShift := 1
	k3_ShowMBAlt := 1
	k3_ShowMBDrag := 1
	}
If Prevk3_Label = 3 
	{
	Showk3_OverrideLabel := 0
	k3_ShowExeFilePathButton := 0
	SendKeyShowk3_Label := 1
	k3_ShowMBCtrl := 1
	k3_ShowMBShift := 1
	k3_ShowMBAlt := 1
	k3_ShowMBDrag := 1
	}
If Prevk3_Label between 4 and 6
	{
	Showk3_OverrideLabel := 0
	k3_ShowExeFilePathButton := 1
	SendKeyShowk3_Label := 1
	k3_ShowMBCtrl := 0
	k3_ShowMBShift := 0
	k3_ShowMBAlt := 0
	k3_ShowMBDrag := 0
	}
If Prevk4_Label = 2
	{
	Showk4_OverrideLabel := 0
	SendKeyShowk4_Label := 0
	k4_ShowExeFilePathButton := 1
	k4_ShowMBCtrl := 1
	k4_ShowMBShift := 1
	k4_ShowMBAlt := 1
	k4_ShowMBDrag := 1
	}
If Prevk4_Label = 3 
	{
	Showk4_OverrideLabel := 0
	k4_ShowExeFilePathButton := 0
	SendKeyShowk4_Label := 1
	k4_ShowMBCtrl := 1
	k4_ShowMBShift := 1
	k4_ShowMBAlt := 1
	k4_ShowMBDrag := 1
	}
If Prevk4_Label between 4 and 6
	{
	Showk4_OverrideLabel := 0
	k4_ShowExeFilePathButton := 1
	SendKeyShowk4_Label := 1
	k4_ShowMBCtrl := 0
	k4_ShowMBShift := 0
	k4_ShowMBAlt := 0
	k4_ShowMBDrag := 0
	}
If Prevk5_Label = 2
	{
	Showk5_OverrideLabel := 0
	SendKeyShowk5_Label := 0
	k5_ShowExeFilePathButton := 1
	k5_ShowMBCtrl := 1
	k5_ShowMBShift := 1
	k5_ShowMBAlt := 1
	k5_ShowMBDrag := 1
	}
If Prevk5_Label = 3 
	{
	Showk5_OverrideLabel := 0
	k5_ShowExeFilePathButton := 0
	SendKeyShowk5_Label := 1
	k5_ShowMBCtrl := 1
	k5_ShowMBShift := 1
	k5_ShowMBAlt := 1
	k5_ShowMBDrag := 1
	}
If Prevk5_Label between 4 and 6
	{
	Showk5_OverrideLabel := 0
	k5_ShowExeFilePathButton := 1
	SendKeyShowk5_Label := 1
	k5_ShowMBCtrl := 0
	k5_ShowMBShift := 0
	k5_ShowMBAlt := 0
	k5_ShowMBDrag := 0
	}
If Prevk6_Label = 2
	{
	Showk6_OverrideLabel := 0
	SendKeyShowk6_Label := 0
	k6_ShowExeFilePathButton := 1
	k6_ShowMBCtrl := 1
	k6_ShowMBShift := 1
	k6_ShowMBAlt := 1
	k6_ShowMBDrag := 1
	}
If Prevk6_Label = 3 
	{
	Showk6_OverrideLabel := 0
	k6_ShowExeFilePathButton := 0
	SendKeyShowk6_Label := 1
	k6_ShowMBCtrl := 1
	k6_ShowMBShift := 1
	k6_ShowMBAlt := 1
	k6_ShowMBDrag := 1
	}
If Prevk6_Label between 4 and 6
	{
	Showk6_OverrideLabel := 0
	k6_ShowExeFilePathButton := 1
	SendKeyShowk6_Label := 1
	k6_ShowMBCtrl := 0
	k6_ShowMBShift := 0
	k6_ShowMBAlt := 0
	k6_ShowMBDrag := 0
	}	



If Prevlnull_Label = 2
	{
	Showlnull_OverrideLabel := 0
	SendKeyShowlnull_Label := 0
	lnull_ShowExeFilePathButton := 1
	lnull_ShowMBCtrl := 1
	lnull_ShowMBShift := 1
	lnull_ShowMBAlt := 1
	lnull_ShowMBDrag := 1
	}
If Prevlnull_Label = 3 
	{
	Showlnull_OverrideLabel := 0
	lnull_ShowExeFilePathButton := 0
	SendKeyShowlnull_Label := 1
	lnull_ShowMBCtrl := 1
	lnull_ShowMBShift := 1
	lnull_ShowMBAlt := 1
	lnull_ShowMBDrag := 1
	}
If Prevlnull_Label between 4 and 6
	{
	Showlnull_OverrideLabel := 0
	lnull_ShowExeFilePathButton := 1
	SendKeyShowlnull_Label := 1
	lnull_ShowMBCtrl := 0
	lnull_ShowMBShift := 0
	lnull_ShowMBAlt := 0
	lnull_ShowMBDrag := 0
	}
If Prevl1_Label = 2
	{
	Showl1_OverrideLabel := 0
	SendKeyShowl1_Label := 0
	l1_ShowExeFilePathButton := 1
	l1_ShowMBCtrl := 1
	l1_ShowMBShift := 1
	l1_ShowMBAlt := 1
	l1_ShowMBDrag := 1
	}
If Prevl1_Label = 3 
	{
	Showl1_OverrideLabel := 0
	l1_ShowExeFilePathButton := 0
	SendKeyShowl1_Label := 1
	l1_ShowMBCtrl := 1
	l1_ShowMBShift := 1
	l1_ShowMBAlt := 1
	l1_ShowMBDrag := 1
	}
If Prevl1_Label between 4 and 6
	{
	Showl1_OverrideLabel := 0
	l1_ShowExeFilePathButton := 1
	SendKeyShowl1_Label := 1
	l1_ShowMBCtrl := 0
	l1_ShowMBShift := 0
	l1_ShowMBAlt := 0
	l1_ShowMBDrag := 0
	}
If Prevl2_Label = 2
	{
	Showl2_OverrideLabel := 0
	SendKeyShowl2_Label := 0
	l2_ShowExeFilePathButton := 1
	l2_ShowMBCtrl := 1
	l2_ShowMBShift := 1
	l2_ShowMBAlt := 1
	l2_ShowMBDrag := 1
	}
If Prevl2_Label = 3 
	{
	Showl2_OverrideLabel := 0
	l2_ShowExeFilePathButton := 0
	SendKeyShowl2_Label := 1
	l2_ShowMBCtrl := 1
	l2_ShowMBShift := 1
	l2_ShowMBAlt := 1
	l2_ShowMBDrag := 1
	}
If Prevl2_Label between 4 and 6
	{
	Showl2_OverrideLabel := 0
	l2_ShowExeFilePathButton := 1
	SendKeyShowl2_Label := 1
	l2_ShowMBCtrl := 0
	l2_ShowMBShift := 0
	l2_ShowMBAlt := 0
	l2_ShowMBDrag := 0
	}
If Prevl3_Label = 2
	{
	Showl3_OverrideLabel := 0
	SendKeyShowl3_Label := 0
	l3_ShowExeFilePathButton := 1
	l3_ShowMBCtrl := 1
	l3_ShowMBShift := 1
	l3_ShowMBAlt := 1
	l3_ShowMBDrag := 1
	}
If Prevl3_Label = 3 
	{
	Showl3_OverrideLabel := 0
	l3_ShowExeFilePathButton := 0
	SendKeyShowl3_Label := 1
	l3_ShowMBCtrl := 1
	l3_ShowMBShift := 1
	l3_ShowMBAlt := 1
	l3_ShowMBDrag := 1
	}
If Prevl3_Label between 4 and 6
	{
	Showl3_OverrideLabel := 0
	l3_ShowExeFilePathButton := 1
	SendKeyShowl3_Label := 1
	l3_ShowMBCtrl := 0
	l3_ShowMBShift := 0
	l3_ShowMBAlt := 0
	l3_ShowMBDrag := 0
	}
If Prevl4_Label = 2
	{
	Showl4_OverrideLabel := 0
	SendKeyShowl4_Label := 0
	l4_ShowExeFilePathButton := 1
	l4_ShowMBCtrl := 1
	l4_ShowMBShift := 1
	l4_ShowMBAlt := 1
	l4_ShowMBDrag := 1
	}
If Prevl4_Label = 3 
	{
	Showl4_OverrideLabel := 0
	l4_ShowExeFilePathButton := 0
	SendKeyShowl4_Label := 1
	l4_ShowMBCtrl := 1
	l4_ShowMBShift := 1
	l4_ShowMBAlt := 1
	l4_ShowMBDrag := 1
	}
If Prevl4_Label between 4 and 6
	{
	Showl4_OverrideLabel := 0
	l4_ShowExeFilePathButton := 1
	SendKeyShowl4_Label := 1
	l4_ShowMBCtrl := 0
	l4_ShowMBShift := 0
	l4_ShowMBAlt := 0
	l4_ShowMBDrag := 0
	}
If Prevl5_Label = 2
	{
	Showl5_OverrideLabel := 0
	SendKeyShowl5_Label := 0
	l5_ShowExeFilePathButton := 1
	l5_ShowMBCtrl := 1
	l5_ShowMBShift := 1
	l5_ShowMBAlt := 1
	l5_ShowMBDrag := 1
	}
If Prevl5_Label = 3 
	{
	Showl5_OverrideLabel := 0
	l5_ShowExeFilePathButton := 0
	SendKeyShowl5_Label := 1
	l5_ShowMBCtrl := 1
	l5_ShowMBShift := 1
	l5_ShowMBAlt := 1
	l5_ShowMBDrag := 1
	}
If Prevl5_Label between 4 and 6
	{
	Showl5_OverrideLabel := 0
	l5_ShowExeFilePathButton := 1
	SendKeyShowl5_Label := 1
	l5_ShowMBCtrl := 0
	l5_ShowMBShift := 0
	l5_ShowMBAlt := 0
	l5_ShowMBDrag := 0
	}
If Prevl6_Label = 2
	{
	Showl6_OverrideLabel := 0
	SendKeyShowl6_Label := 0
	l6_ShowExeFilePathButton := 1
	l6_ShowMBCtrl := 1
	l6_ShowMBShift := 1
	l6_ShowMBAlt := 1
	l6_ShowMBDrag := 1
	}
If Prevl6_Label = 3 
	{
	Showl6_OverrideLabel := 0
	l6_ShowExeFilePathButton := 0
	SendKeyShowl6_Label := 1
	l6_ShowMBCtrl := 1
	l6_ShowMBShift := 1
	l6_ShowMBAlt := 1
	l6_ShowMBDrag := 1
	}
If Prevl6_Label between 4 and 6
	{
	Showl6_OverrideLabel := 0
	l6_ShowExeFilePathButton := 1
	SendKeyShowl6_Label := 1
	l6_ShowMBCtrl := 0
	l6_ShowMBShift := 0
	l6_ShowMBAlt := 0
	l6_ShowMBDrag := 0
	}	


AppTitleTemp := StrSplit(A_ScriptDir, "\")
AppNum := AppTitleTemp.MaxIndex()
AppTitle := AppTitleTemp[AppNum]	


Gui, PieMenu:Add, Button, x365 y925 w120 h25 gOK, OK 
Gui, PieMenu:Add, Button, x235 y925 w120 h25 gCancel, Cancel
Gui, PieMenu:Add, Tab, x0 y0 w505 h920, General|%PrevaPieTabLabel%|%PrevbPieTabLabel%|%PrevcPieTabLabel%|%PrevdPieTabLabel%|%PrevePieTabLabel%|%PrevfPieTabLabel%|%PrevgPieTabLabel%|%PrevhPieTabLabel%|%PreviPieTabLabel%|%PrevjPieTabLabel%|%PrevkPieTabLabel%|%PrevlPieTabLabel%
Gui, PieMenu:Tab, 1, 1
Gui, PieMenu:Add, GroupBox, x15 y40 w470 h100, Select Pie Menu Activation Key ( for Modes 1 through 4 ) 
Gui, PieMenu:Add, ComboBox, x25 y60 w175 h250 Choose%PrevPieActivateKeyNumber% vNewPieActivateKeySetting, %AcceptablePieKeys%
;Gui, PieMenu:Add, Button, x210 y60 w105 h20, KeyList
Gui, PieMenu:Add, Text, x25 y90 w450 h30, Pause (The 'Pause/Break' key), XButton1 (Mouse Back Button) XButton2 (Mouse Forward Button) or NumpadMult are good choices.
Gui, PieMenu:Add, Text, x25 y120 w315 h15, The application will be blocked from recieving the selected key.
Gui, PieMenu:Add, GroupBox, x15 y145 w470 h75, Time for Pie Menu Labels to Appear
Gui, PieMenu:Add, Slider, x20 y165 w460 h25 Choose50 range0-69 vNewPieLabelDelaySetting, %PrevPieLabelDelaySetting% 
Gui, PieMenu:Add, Text, x25 y195 w35 h15, 0 secs
Gui, PieMenu:Add, Text, x165 y195 w35 h15, 1 sec
Gui, PieMenu:Add, Text, x305 y195 w35 h15, 2 secs
Gui, PieMenu:Add, Text, x445 y195 w35 h15, 3 secs
Gui, PieMenu:Add, GroupBox, x15 y315 w470 h130, MODES: Choose Method for Shifting Pie Menus 
Gui, PieMenu:Add, Radio, x25 y335 w450 h15 Checked%1PrevShiftPieMethod% v1NewShiftPieMethod gPieMethod, Mode 1 : Move away from center and return (fastest)  
Gui, PieMenu:Add, Radio, x25 y355 w450 h15 Checked%2PrevShiftPieMethod% v2NewShiftPieMethod gPieMethod, Mode 2 : Leave center and return for Pie 2, circle around and return to center for Pie 3  
Gui, PieMenu:Add, Radio, x25 y375 w450 h15 Checked%3PrevShiftPieMethod% v3NewShiftPieMethod gPieMethod, Mode 3 : Circle around pie and return to center (Most Controlled) 
Gui, PieMenu:Add, Radio, x25 y395 w450 h15 Checked%4PrevShiftPieMethod% v4NewShiftPieMethod gPieMethod, Mode 4 : Press Shift (Pie 2), Ctrl (Pie 3), Alt (Pie 1) only (Fast and Controlled, but boring) 
Gui, PieMenu:Add, Radio, x25 y415 w450 h15 Checked%5PrevShiftPieMethod% v5NewShiftPieMethod gPieMethod, Mode 5 : Use custom hotkeys for each individual pie ( enables use of up to 12 pies ) 
Gui, PieMenu:Add, GroupBox, x15 y225 w117 h85, *For Modes 1-5:
Gui, PieMenu:Add, Checkbox, x25 y245 w25 h15 Checked%PrevaPieNumberSetting% vNewaPieNumberSetting,
Gui, PieMenu:Add, Edit, x50 y242 w67 h20 Limit10 vNewaPieTabLabel, %PrevaPieTabLabel%
Gui, PieMenu:Add, Checkbox, x25 y265 w25 h15 Checked%PrevbPieNumberSetting% vNewbPieNumberSetting,
Gui, PieMenu:Add, Edit, x50 y262 w67 h20 Limit10 vNewbPieTabLabel, %PrevbPieTabLabel%
Gui, PieMenu:Add, Checkbox, x25 y285 w25 h15 Checked%PrevcPieNumberSetting% vNewcPieNumberSetting,
Gui, PieMenu:Add, Edit, x50 y282 w67 h20 Limit10 vNewcPieTabLabel, %PrevcPieTabLabel%
Gui, PieMenu:Add, GroupBox, x132 y225 w117 h85, *For Mode 5:
Gui, PieMenu:Add, Checkbox, x142 y245 w25 h15 Checked%PrevdPieNumberSetting% vNewdPieNumberSetting,
Gui, PieMenu:Add, Edit, x167 y242 w67 h20 Limit10 vNewdPieTabLabel, %PrevdPieTabLabel%
Gui, PieMenu:Add, Checkbox, x142 y265 w25 h15 Checked%PrevePieNumberSetting% vNewePieNumberSetting,
Gui, PieMenu:Add, Edit, x167 y262 w67 h20 Limit10 vNewePieTabLabel, %PrevePieTabLabel%
Gui, PieMenu:Add, Checkbox, x142 y285 w25 h15 Checked%PrevfPieNumberSetting% vNewfPieNumberSetting,
Gui, PieMenu:Add, Edit, x167 y282 w67 h20 Limit10 vNewfPieTabLabel, %PrevfPieTabLabel%
Gui, PieMenu:Add, GroupBox, x249 y225 w117 h85, *For Mode 5:
Gui, PieMenu:Add, Checkbox, x259 y245 w25 h15 Checked%PrevgPieNumberSetting% vNewgPieNumberSetting,
Gui, PieMenu:Add, Edit, x284 y242 w67 h20 Limit10 vNewgPieTabLabel, %PrevgPieTabLabel%
Gui, PieMenu:Add, Checkbox, x259 y265 w25 h15 Checked%PrevhPieNumberSetting% vNewhPieNumberSetting,
Gui, PieMenu:Add, Edit, x284 y262 w67 h20 Limit10 vNewhPieTabLabel, %PrevhPieTabLabel%
Gui, PieMenu:Add, Checkbox, x259 y285 w25 h15 Checked%PreviPieNumberSetting% vNewiPieNumberSetting,
Gui, PieMenu:Add, Edit, x284 y282 w67 h20 Limit10 vNewiPieTabLabel, %PreviPieTabLabel%
Gui, PieMenu:Add, GroupBox, x366 y225 w117 h85, *For Mode5:
Gui, PieMenu:Add, Checkbox, x376 y245 w25 h15 Checked%PrevjPieNumberSetting% vNewjPieNumberSetting,
Gui, PieMenu:Add, Edit, x401 y242 w67 h20 Limit10 vNewjPieTabLabel, %PrevjPieTabLabel%
Gui, PieMenu:Add, Checkbox, x376 y265 w25 h15 Checked%PrevkPieNumberSetting% vNewkPieNumberSetting,
Gui, PieMenu:Add, Edit, x401 y262 w67 h20 Limit10 vNewkPieTabLabel, %PrevkPieTabLabel%
Gui, PieMenu:Add, Checkbox, x376 y285 w25 h15 Checked%PrevlPieNumberSetting% vNewlPieNumberSetting,
Gui, PieMenu:Add, Edit, x401 y282 w67 h20 Limit10 vNewlPieTabLabel, %PrevlPieTabLabel%

Gui, PieMenu:Add, GroupBox, x15 y445 w470 h47, Pie Menu Size
Gui, PieMenu:Add, DropDownList, x25 y460 w80 +AltSubmit Choose%PrevPieMenuSize% vNewPieMenuSize,Small|Medium|Large|BigBoi

Gui, PieMenu:Add, GroupBox, x15 y495 w470 h70, Miscellaneous
Gui, PieMenu:Add, Checkbox, x25 y515 w130 h15 Checked%PrevDisplayTooltipsSetting% vNewDisplayTooltipsSetting, Display Tooltips
Gui, PieMenu:Add, Checkbox, x25 y540 w130 h15 Checked%PrevPenTabletActive% vNewPenTabletActive, Enable Pen Tablet

Gui, PieMenu:Add, Button, x235 y570 w120 h25 gCancel, Cancel
Gui, PieMenu:Add, Button, x365 y570 w120 h25 gOK, OK

Gui, PieMenu:Add, GroupBox, x15 y650 w470 h250, Neat Notes
Gui, PieMenu:Add, Text, x25 y670 w450 h220, Modes 1 through 4: `n`n - Limited to first three pies`n - Ctrl + Shift + Alt + 'Pie Key' Closes all AHK scripts (the scripts that run this program).`n - Ctrl + Alt + 'Pie Key' opens this settings window for the running Pie Menu profile.`n - Pressing Alt, Shift, or Control will switch between 1st, 2nd and 3rd pies in Modes 1 through 4.`n`n`n`n*Those checkboxes turn on/off individual pies`n*The Pie Tab Labels will get renamed after you edit their names next to their checkboxes and press OK`n*For Modes 1 through 4 make sure to have pies 1 through 3 turned on in sequence (either just pie 1, pie 1 and 2, or pie 1, 2, and 3)`n`n`nYou're a real neat person.  also thx for not using a <720p monitor

Gui, PieMenu:Tab, 2, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\aPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevanull_Label% gRefNewanull_Label vNewanull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewanull_Label, %txtPrevanull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showanull_OverrideLabel% vNewanull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showanull_OverrideLabel% vNewanull_OverrideLabel, %Prevanull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowanull_Label% vNewanull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowanull_Label% vNewanull_SendKeystroke, %Prevanull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%anull_ShowExeFilePathButton% ganull_SelectFile vNewanull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%anull_ShowExeFilePathButton% vNewanull_ExeFilePath, %anull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%anull_ShowMBCtrl% Checked%anull_MBCtrl% gRefNewanull_Label vNewanull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%anull_ShowMBShift% Checked%anull_MBShift% gRefNewanull_Label vNewanull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%anull_ShowMBAlt% Checked%anull_MBAlt% gRefNewanull_Label vNewanull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%anull_ShowMBDrag% Checked%anull_MBDrag% gRefNewanull_Label vNewanull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Preva1_Label% gRefNewa1_Label vNewa1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewa1_Label, %txtPreva1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showa1_OverrideLabel% vNewa1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showa1_OverrideLabel% vNewa1_OverrideLabel, %Preva1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowa1_Label% vNewa1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowa1_Label%  vNewa1_SendKeystroke, %Preva1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%a1_ShowExeFilePathButton% ga1_SelectFile vNewa1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%a1_ShowExeFilePathButton% vNewa1_ExeFilePath, %a1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%a1_ShowMBCtrl% Checked%a1_MBCtrl% gRefNewa1_Label vNewa1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%a1_ShowMBShift% Checked%a1_MBShift% gRefNewa1_Label vNewa1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%a1_ShowMBAlt% Checked%a1_MBAlt% gRefNewa1_Label vNewa1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%a1_ShowMBDrag% Checked%a1_MBDrag% gRefNewa1_Label vNewa1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Preva2_Label% gRefNewa2_Label vNewa2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewa2_Label, %txtPreva2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showa2_OverrideLabel% vNewa2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showa2_OverrideLabel% vNewa2_OverrideLabel, %Preva2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowa2_Label% vNewa2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowa2_Label%  vNewa2_SendKeystroke, %Preva2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%a2_ShowExeFilePathButton% ga2_SelectFile vNewa2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%a2_ShowExeFilePathButton% vNewa2_ExeFilePath, %a2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%a2_ShowMBCtrl% Checked%a2_MBCtrl% gRefNewa2_Label vNewa2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%a2_ShowMBShift% Checked%a2_MBShift% gRefNewa2_Label vNewa2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%a2_ShowMBAlt% Checked%a2_MBAlt% gRefNewa2_Label vNewa2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%a2_ShowMBDrag% Checked%a2_MBDrag% gRefNewa2_Label vNewa2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Preva3_Label% gRefNewa3_Label vNewa3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewa3_Label, %txtPreva3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showa3_OverrideLabel% vNewa3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showa3_OverrideLabel% vNewa3_OverrideLabel, %Preva3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowa3_Label% vNewa3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowa3_Label%  vNewa3_SendKeystroke, %Preva3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%a3_ShowExeFilePathButton% ga3_SelectFile vNewa3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%a3_ShowExeFilePathButton% vNewa3_ExeFilePath, %a3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%a3_ShowMBCtrl% Checked%a3_MBCtrl% gRefNewa3_Label vNewa3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%a3_ShowMBShift% Checked%a3_MBShift% gRefNewa3_Label vNewa3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%a3_ShowMBAlt% Checked%a3_MBAlt% gRefNewa3_Label vNewa3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%a3_ShowMBDrag% Checked%a3_MBDrag% gRefNewa3_Label vNewa3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Preva4_Label% gRefNewa4_Label vNewa4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewa4_Label, %txtPreva4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showa4_OverrideLabel% vNewa4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showa4_OverrideLabel% vNewa4_OverrideLabel, %Preva4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowa4_Label% vNewa4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowa4_Label%  vNewa4_SendKeystroke, %Preva4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%a4_ShowExeFilePathButton% ga4_SelectFile vNewa4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%a4_ShowExeFilePathButton% vNewa4_ExeFilePath, %a4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%a4_ShowMBCtrl% Checked%a4_MBCtrl% gRefNewa4_Label vNewa4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%a4_ShowMBShift% Checked%a4_MBShift% gRefNewa4_Label vNewa4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%a4_ShowMBAlt% Checked%a4_MBAlt% gRefNewa4_Label vNewa4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%a4_ShowMBDrag% Checked%a4_MBDrag% gRefNewa4_Label vNewa4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Preva5_Label% gRefNewa5_Label vNewa5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewa5_Label, %txtPreva5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showa5_OverrideLabel% vNewa5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showa5_OverrideLabel% vNewa5_OverrideLabel, %Preva5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowa5_Label% vNewa5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowa5_Label%  vNewa5_SendKeystroke, %Preva5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%a5_ShowExeFilePathButton% ga5_SelectFile vNewa5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%a5_ShowExeFilePathButton% vNewa5_ExeFilePath, %a5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%a5_ShowMBCtrl% Checked%a5_MBCtrl% gRefNewa5_Label vNewa5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%a5_ShowMBShift% Checked%a5_MBShift% gRefNewa5_Label vNewa5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%a5_ShowMBAlt% Checked%a5_MBAlt% gRefNewa5_Label vNewa5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%a5_ShowMBDrag% Checked%a5_MBDrag% gRefNewa5_Label vNewa5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Preva6_Label% gRefNewa6_Label vNewa6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewa6_Label, %txtPreva6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showa6_OverrideLabel% vNewa6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showa6_OverrideLabel% vNewa6_OverrideLabel, %Preva6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowa6_Label% vNewa6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowa6_Label%  vNewa6_SendKeystroke, %Preva6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%a6_ShowExeFilePathButton% ga6_SelectFile vNewa6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%a6_ShowExeFilePathButton% vNewa6_ExeFilePath, %a6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%a6_ShowMBCtrl% Checked%a6_MBCtrl% gRefNewa6_Label vNewa6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%a6_ShowMBShift% Checked%a6_MBShift% gRefNewa6_Label vNewa6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%a6_ShowMBAlt% Checked%a6_MBAlt% gRefNewa6_Label vNewa6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%a6_ShowMBDrag% Checked%a6_MBDrag% gRefNewa6_Label vNewa6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevaPieHotkey_Ctrl% vNewaPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevaPieHotkey_Shift% vNewaPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevaPieHotkey_Alt% vNewaPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevaPieHotkeyKeyNumber% vNewaPieHotkey_Input, %AcceptablePieHotkeys%

Gui, PieMenu:Tab, 3, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\bPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevbnull_Label% gRefNewbnull_Label vNewbnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewbnull_Label, %txtPrevbnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showbnull_OverrideLabel% vNewbnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showbnull_OverrideLabel% vNewbnull_OverrideLabel, %Prevbnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowbnull_Label% vNewbnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowbnull_Label% vNewbnull_SendKeystroke, %Prevbnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%bnull_ShowExeFilePathButton% gbnull_SelectFile vNewbnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%bnull_ShowExeFilePathButton% vNewbnull_ExeFilePath, %bnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%bnull_ShowMBCtrl% Checked%bnull_MBCtrl% gRefNewbnull_Label vNewbnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%bnull_ShowMBShift% Checked%bnull_MBShift% gRefNewbnull_Label vNewbnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%bnull_ShowMBAlt% Checked%bnull_MBAlt% gRefNewbnull_Label vNewbnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%bnull_ShowMBDrag% Checked%bnull_MBDrag% gRefNewbnull_Label vNewbnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevb1_Label% gRefNewb1_Label vNewb1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewb1_Label, %txtPrevb1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showb1_OverrideLabel% vNewb1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showb1_OverrideLabel% vNewb1_OverrideLabel, %Prevb1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowb1_Label% vNewb1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowb1_Label%  vNewb1_SendKeystroke, %Prevb1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%b1_ShowExeFilePathButton% gb1_SelectFile vNewb1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%b1_ShowExeFilePathButton% vNewb1_ExeFilePath, %b1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%b1_ShowMBCtrl% Checked%b1_MBCtrl% gRefNewb1_Label vNewb1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%b1_ShowMBShift% Checked%b1_MBShift% gRefNewb1_Label vNewb1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%b1_ShowMBAlt% Checked%b1_MBAlt% gRefNewb1_Label vNewb1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%b1_ShowMBDrag% Checked%b1_MBDrag% gRefNewb1_Label vNewb1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevb2_Label% gRefNewb2_Label vNewb2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewb2_Label, %txtPrevb2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showb2_OverrideLabel% vNewb2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showb2_OverrideLabel% vNewb2_OverrideLabel, %Prevb2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowb2_Label% vNewb2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowb2_Label%  vNewb2_SendKeystroke, %Prevb2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%b2_ShowExeFilePathButton% gb2_SelectFile vNewb2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%b2_ShowExeFilePathButton% vNewb2_ExeFilePath, %b2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%b2_ShowMBCtrl% Checked%b2_MBCtrl% gRefNewb2_Label vNewb2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%b2_ShowMBShift% Checked%b2_MBShift% gRefNewb2_Label vNewb2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%b2_ShowMBAlt% Checked%b2_MBAlt% gRefNewb2_Label vNewb2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%b2_ShowMBDrag% Checked%b2_MBDrag% gRefNewb2_Label vNewb2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevb3_Label% gRefNewb3_Label vNewb3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewb3_Label, %txtPrevb3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showb3_OverrideLabel% vNewb3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showb3_OverrideLabel% vNewb3_OverrideLabel, %Prevb3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowb3_Label% vNewb3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowb3_Label%  vNewb3_SendKeystroke, %Prevb3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%b3_ShowExeFilePathButton% gb3_SelectFile vNewb3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%b3_ShowExeFilePathButton% vNewb3_ExeFilePath, %b3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%b3_ShowMBCtrl% Checked%b3_MBCtrl% gRefNewb3_Label vNewb3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%b3_ShowMBShift% Checked%b3_MBShift% gRefNewb3_Label vNewb3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%b3_ShowMBAlt% Checked%b3_MBAlt% gRefNewb3_Label vNewb3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%b3_ShowMBDrag% Checked%b3_MBDrag% gRefNewb3_Label vNewb3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevb4_Label% gRefNewb4_Label vNewb4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewb4_Label, %txtPrevb4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showb4_OverrideLabel% vNewb4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showb4_OverrideLabel% vNewb4_OverrideLabel, %Prevb4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowb4_Label% vNewb4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowb4_Label%  vNewb4_SendKeystroke, %Prevb4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%b4_ShowExeFilePathButton% gb4_SelectFile vNewb4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%b4_ShowExeFilePathButton% vNewb4_ExeFilePath, %b4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%b4_ShowMBCtrl% Checked%b4_MBCtrl% gRefNewb4_Label vNewb4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%b4_ShowMBShift% Checked%b4_MBShift% gRefNewb4_Label vNewb4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%b4_ShowMBAlt% Checked%b4_MBAlt% gRefNewb4_Label vNewb4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%b4_ShowMBDrag% Checked%b4_MBDrag% gRefNewb4_Label vNewb4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevb5_Label% gRefNewb5_Label vNewb5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewb5_Label, %txtPrevb5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showb5_OverrideLabel% vNewb5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showb5_OverrideLabel% vNewb5_OverrideLabel, %Prevb5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowb5_Label% vNewb5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowb5_Label%  vNewb5_SendKeystroke, %Prevb5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%b5_ShowExeFilePathButton% gb5_SelectFile vNewb5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%b5_ShowExeFilePathButton% vNewb5_ExeFilePath, %b5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%b5_ShowMBCtrl% Checked%b5_MBCtrl% gRefNewb5_Label vNewb5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%b5_ShowMBShift% Checked%b5_MBShift% gRefNewb5_Label vNewb5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%b5_ShowMBAlt% Checked%b5_MBAlt% gRefNewb5_Label vNewb5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%b5_ShowMBDrag% Checked%b5_MBDrag% gRefNewb5_Label vNewb5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevb6_Label% gRefNewb6_Label vNewb6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewb6_Label, %txtPrevb6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showb6_OverrideLabel% vNewb6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showb6_OverrideLabel% vNewb6_OverrideLabel, %Prevb6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowb6_Label% vNewb6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowb6_Label%  vNewb6_SendKeystroke, %Prevb6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%b6_ShowExeFilePathButton% gb6_SelectFile vNewb6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%b6_ShowExeFilePathButton% vNewb6_ExeFilePath, %b6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%b6_ShowMBCtrl% Checked%b6_MBCtrl% gRefNewb6_Label vNewb6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%b6_ShowMBShift% Checked%b6_MBShift% gRefNewb6_Label vNewb6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%b6_ShowMBAlt% Checked%b6_MBAlt% gRefNewb6_Label vNewb6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%b6_ShowMBDrag% Checked%b6_MBDrag% gRefNewb6_Label vNewb6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevbPieHotkey_Ctrl% vNewbPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevbPieHotkey_Shift% vNewbPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevbPieHotkey_Alt% vNewbPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevbPieHotkeyKeyNumber% vNewbPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 4, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\cPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevcnull_Label% gRefNewcnull_Label vNewcnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewcnull_Label, %txtPrevcnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showcnull_OverrideLabel% vNewcnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showcnull_OverrideLabel% vNewcnull_OverrideLabel, %Prevcnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowcnull_Label% vNewcnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowcnull_Label% vNewcnull_SendKeystroke, %Prevcnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%cnull_ShowExeFilePathButton% gcnull_SelectFile vNewcnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%cnull_ShowExeFilePathButton% vNewcnull_ExeFilePath, %cnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%cnull_ShowMBCtrl% Checked%cnull_MBCtrl% gRefNewcnull_Label vNewcnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%cnull_ShowMBShift% Checked%cnull_MBShift% gRefNewcnull_Label vNewcnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%cnull_ShowMBAlt% Checked%cnull_MBAlt% gRefNewcnull_Label vNewcnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%cnull_ShowMBDrag% Checked%cnull_MBDrag% gRefNewcnull_Label vNewcnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevc1_Label% gRefNewc1_Label vNewc1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewc1_Label, %txtPrevc1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showc1_OverrideLabel% vNewc1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showc1_OverrideLabel% vNewc1_OverrideLabel, %Prevc1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowc1_Label% vNewc1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowc1_Label%  vNewc1_SendKeystroke, %Prevc1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%c1_ShowExeFilePathButton% gc1_SelectFile vNewc1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%c1_ShowExeFilePathButton% vNewc1_ExeFilePath, %c1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%c1_ShowMBCtrl% Checked%c1_MBCtrl% gRefNewc1_Label vNewc1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%c1_ShowMBShift% Checked%c1_MBShift% gRefNewc1_Label vNewc1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%c1_ShowMBAlt% Checked%c1_MBAlt% gRefNewc1_Label vNewc1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%c1_ShowMBDrag% Checked%c1_MBDrag% gRefNewc1_Label vNewc1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevc2_Label% gRefNewc2_Label vNewc2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewc2_Label, %txtPrevc2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showc2_OverrideLabel% vNewc2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showc2_OverrideLabel% vNewc2_OverrideLabel, %Prevc2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowc2_Label% vNewc2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowc2_Label%  vNewc2_SendKeystroke, %Prevc2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%c2_ShowExeFilePathButton% gc2_SelectFile vNewc2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%c2_ShowExeFilePathButton% vNewc2_ExeFilePath, %c2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%c2_ShowMBCtrl% Checked%c2_MBCtrl% gRefNewc2_Label vNewc2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%c2_ShowMBShift% Checked%c2_MBShift% gRefNewc2_Label vNewc2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%c2_ShowMBAlt% Checked%c2_MBAlt% gRefNewc2_Label vNewc2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%c2_ShowMBDrag% Checked%c2_MBDrag% gRefNewc2_Label vNewc2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevc3_Label% gRefNewc3_Label vNewc3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewc3_Label, %txtPrevc3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showc3_OverrideLabel% vNewc3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showc3_OverrideLabel% vNewc3_OverrideLabel, %Prevc3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowc3_Label% vNewc3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowc3_Label%  vNewc3_SendKeystroke, %Prevc3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%c3_ShowExeFilePathButton% gc3_SelectFile vNewc3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%c3_ShowExeFilePathButton% vNewc3_ExeFilePath, %c3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%c3_ShowMBCtrl% Checked%c3_MBCtrl% gRefNewc3_Label vNewc3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%c3_ShowMBShift% Checked%c3_MBShift% gRefNewc3_Label vNewc3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%c3_ShowMBAlt% Checked%c3_MBAlt% gRefNewc3_Label vNewc3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%c3_ShowMBDrag% Checked%c3_MBDrag% gRefNewc3_Label vNewc3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevc4_Label% gRefNewc4_Label vNewc4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewc4_Label, %txtPrevc4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showc4_OverrideLabel% vNewc4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showc4_OverrideLabel% vNewc4_OverrideLabel, %Prevc4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowc4_Label% vNewc4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowc4_Label%  vNewc4_SendKeystroke, %Prevc4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%c4_ShowExeFilePathButton% gc4_SelectFile vNewc4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%c4_ShowExeFilePathButton% vNewc4_ExeFilePath, %c4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%c4_ShowMBCtrl% Checked%c4_MBCtrl% gRefNewc4_Label vNewc4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%c4_ShowMBShift% Checked%c4_MBShift% gRefNewc4_Label vNewc4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%c4_ShowMBAlt% Checked%c4_MBAlt% gRefNewc4_Label vNewc4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%c4_ShowMBDrag% Checked%c4_MBDrag% gRefNewc4_Label vNewc4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevc5_Label% gRefNewc5_Label vNewc5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewc5_Label, %txtPrevc5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showc5_OverrideLabel% vNewc5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showc5_OverrideLabel% vNewc5_OverrideLabel, %Prevc5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowc5_Label% vNewc5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowc5_Label%  vNewc5_SendKeystroke, %Prevc5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%c5_ShowExeFilePathButton% gc5_SelectFile vNewc5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%c5_ShowExeFilePathButton% vNewc5_ExeFilePath, %c5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%c5_ShowMBCtrl% Checked%c5_MBCtrl% gRefNewc5_Label vNewc5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%c5_ShowMBShift% Checked%c5_MBShift% gRefNewc5_Label vNewc5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%c5_ShowMBAlt% Checked%c5_MBAlt% gRefNewc5_Label vNewc5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%c5_ShowMBDrag% Checked%c5_MBDrag% gRefNewc5_Label vNewc5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevc6_Label% gRefNewc6_Label vNewc6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewc6_Label, %txtPrevc6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showc6_OverrideLabel% vNewc6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showc6_OverrideLabel% vNewc6_OverrideLabel, %Prevc6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowc6_Label% vNewc6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowc6_Label%  vNewc6_SendKeystroke, %Prevc6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%c6_ShowExeFilePathButton% gc6_SelectFile vNewc6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%c6_ShowExeFilePathButton% vNewc6_ExeFilePath, %c6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%c6_ShowMBCtrl% Checked%c6_MBCtrl% gRefNewc6_Label vNewc6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%c6_ShowMBShift% Checked%c6_MBShift% gRefNewc6_Label vNewc6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%c6_ShowMBAlt% Checked%c6_MBAlt% gRefNewc6_Label vNewc6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%c6_ShowMBDrag% Checked%c6_MBDrag% gRefNewc6_Label vNewc6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )  
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevcPieHotkey_Ctrl% vNewcPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevcPieHotkey_Shift% vNewcPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevcPieHotkey_Alt% vNewcPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevcPieHotkeyKeyNumber% vNewcPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 5, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\dPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevdnull_Label% gRefNewdnull_Label vNewdnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewdnull_Label, %txtPrevdnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showdnull_OverrideLabel% vNewdnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showdnull_OverrideLabel% vNewdnull_OverrideLabel, %Prevdnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowdnull_Label% vNewdnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowdnull_Label% vNewdnull_SendKeystroke, %Prevdnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%dnull_ShowExeFilePathButton% gdnull_SelectFile vNewdnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%dnull_ShowExeFilePathButton% vNewdnull_ExeFilePath, %dnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%dnull_ShowMBCtrl% Checked%dnull_MBCtrl% gRefNewdnull_Label vNewdnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%dnull_ShowMBShift% Checked%dnull_MBShift% gRefNewdnull_Label vNewdnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%dnull_ShowMBAlt% Checked%dnull_MBAlt% gRefNewdnull_Label vNewdnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%dnull_ShowMBDrag% Checked%dnull_MBDrag% gRefNewdnull_Label vNewdnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevd1_Label% gRefNewd1_Label vNewd1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewd1_Label, %txtPrevd1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showd1_OverrideLabel% vNewd1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showd1_OverrideLabel% vNewd1_OverrideLabel, %Prevd1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowd1_Label% vNewd1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowd1_Label%  vNewd1_SendKeystroke, %Prevd1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%d1_ShowExeFilePathButton% gd1_SelectFile vNewd1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%d1_ShowExeFilePathButton% vNewd1_ExeFilePath, %d1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%d1_ShowMBCtrl% Checked%d1_MBCtrl% gRefNewd1_Label vNewd1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%d1_ShowMBShift% Checked%d1_MBShift% gRefNewd1_Label vNewd1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%d1_ShowMBAlt% Checked%d1_MBAlt% gRefNewd1_Label vNewd1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%d1_ShowMBDrag% Checked%d1_MBDrag% gRefNewd1_Label vNewd1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevd2_Label% gRefNewd2_Label vNewd2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewd2_Label, %txtPrevd2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showd2_OverrideLabel% vNewd2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showd2_OverrideLabel% vNewd2_OverrideLabel, %Prevd2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowd2_Label% vNewd2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowd2_Label%  vNewd2_SendKeystroke, %Prevd2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%d2_ShowExeFilePathButton% gd2_SelectFile vNewd2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%d2_ShowExeFilePathButton% vNewd2_ExeFilePath, %d2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%d2_ShowMBCtrl% Checked%d2_MBCtrl% gRefNewd2_Label vNewd2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%d2_ShowMBShift% Checked%d2_MBShift% gRefNewd2_Label vNewd2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%d2_ShowMBAlt% Checked%d2_MBAlt% gRefNewd2_Label vNewd2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%d2_ShowMBDrag% Checked%d2_MBDrag% gRefNewd2_Label vNewd2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevd3_Label% gRefNewd3_Label vNewd3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewd3_Label, %txtPrevd3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showd3_OverrideLabel% vNewd3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showd3_OverrideLabel% vNewd3_OverrideLabel, %Prevd3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowd3_Label% vNewd3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowd3_Label%  vNewd3_SendKeystroke, %Prevd3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%d3_ShowExeFilePathButton% gd3_SelectFile vNewd3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%d3_ShowExeFilePathButton% vNewd3_ExeFilePath, %d3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%d3_ShowMBCtrl% Checked%d3_MBCtrl% gRefNewd3_Label vNewd3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%d3_ShowMBShift% Checked%d3_MBShift% gRefNewd3_Label vNewd3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%d3_ShowMBAlt% Checked%d3_MBAlt% gRefNewd3_Label vNewd3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%d3_ShowMBDrag% Checked%d3_MBDrag% gRefNewd3_Label vNewd3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevd4_Label% gRefNewd4_Label vNewd4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewd4_Label, %txtPrevd4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showd4_OverrideLabel% vNewd4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showd4_OverrideLabel% vNewd4_OverrideLabel, %Prevd4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowd4_Label% vNewd4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowd4_Label%  vNewd4_SendKeystroke, %Prevd4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%d4_ShowExeFilePathButton% gd4_SelectFile vNewd4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%d4_ShowExeFilePathButton% vNewd4_ExeFilePath, %d4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%d4_ShowMBCtrl% Checked%d4_MBCtrl% gRefNewd4_Label vNewd4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%d4_ShowMBShift% Checked%d4_MBShift% gRefNewd4_Label vNewd4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%d4_ShowMBAlt% Checked%d4_MBAlt% gRefNewd4_Label vNewd4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%d4_ShowMBDrag% Checked%d4_MBDrag% gRefNewd4_Label vNewd4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevd5_Label% gRefNewd5_Label vNewd5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewd5_Label, %txtPrevd5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showd5_OverrideLabel% vNewd5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showd5_OverrideLabel% vNewd5_OverrideLabel, %Prevd5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowd5_Label% vNewd5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowd5_Label%  vNewd5_SendKeystroke, %Prevd5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%d5_ShowExeFilePathButton% gd5_SelectFile vNewd5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%d5_ShowExeFilePathButton% vNewd5_ExeFilePath, %d5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%d5_ShowMBCtrl% Checked%d5_MBCtrl% gRefNewd5_Label vNewd5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%d5_ShowMBShift% Checked%d5_MBShift% gRefNewd5_Label vNewd5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%d5_ShowMBAlt% Checked%d5_MBAlt% gRefNewd5_Label vNewd5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%d5_ShowMBDrag% Checked%d5_MBDrag% gRefNewd5_Label vNewd5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevd6_Label% gRefNewd6_Label vNewd6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewd6_Label, %txtPrevd6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showd6_OverrideLabel% vNewd6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showd6_OverrideLabel% vNewd6_OverrideLabel, %Prevd6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowd6_Label% vNewd6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowd6_Label%  vNewd6_SendKeystroke, %Prevd6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%d6_ShowExeFilePathButton% gd6_SelectFile vNewd6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%d6_ShowExeFilePathButton% vNewd6_ExeFilePath, %d6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%d6_ShowMBCtrl% Checked%d6_MBCtrl% gRefNewd6_Label vNewd6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%d6_ShowMBShift% Checked%d6_MBShift% gRefNewd6_Label vNewd6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%d6_ShowMBAlt% Checked%d6_MBAlt% gRefNewd6_Label vNewd6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%d6_ShowMBDrag% Checked%d6_MBDrag% gRefNewd6_Label vNewd6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )  
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevdPieHotkey_Ctrl% vNewdPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevdPieHotkey_Shift% vNewdPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevdPieHotkey_Alt% vNewdPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevdPieHotkeyKeyNumber% vNewdPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 6, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\ePieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevenull_Label% gRefNewenull_Label vNewenull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewenull_Label, %txtPrevenull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showenull_OverrideLabel% vNewenull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showenull_OverrideLabel% vNewenull_OverrideLabel, %Prevenull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowenull_Label% vNewenull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowenull_Label% vNewenull_SendKeystroke, %Prevenull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%enull_ShowExeFilePathButton% genull_SelectFile vNewenull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%enull_ShowExeFilePathButton% vNewenull_ExeFilePath, %enull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%enull_ShowMBCtrl% Checked%enull_MBCtrl% gRefNewenull_Label vNewenull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%enull_ShowMBShift% Checked%enull_MBShift% gRefNewenull_Label vNewenull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%enull_ShowMBAlt% Checked%enull_MBAlt% gRefNewenull_Label vNewenull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%enull_ShowMBDrag% Checked%enull_MBDrag% gRefNewenull_Label vNewenull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Preve1_Label% gRefNewe1_Label vNewe1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewe1_Label, %txtPreve1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showe1_OverrideLabel% vNewe1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showe1_OverrideLabel% vNewe1_OverrideLabel, %Preve1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowe1_Label% vNewe1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowe1_Label%  vNewe1_SendKeystroke, %Preve1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%e1_ShowExeFilePathButton% ge1_SelectFile vNewe1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%e1_ShowExeFilePathButton% vNewe1_ExeFilePath, %e1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%e1_ShowMBCtrl% Checked%e1_MBCtrl% gRefNewe1_Label vNewe1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%e1_ShowMBShift% Checked%e1_MBShift% gRefNewe1_Label vNewe1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%e1_ShowMBAlt% Checked%e1_MBAlt% gRefNewe1_Label vNewe1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%e1_ShowMBDrag% Checked%e1_MBDrag% gRefNewe1_Label vNewe1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Preve2_Label% gRefNewe2_Label vNewe2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewe2_Label, %txtPreve2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showe2_OverrideLabel% vNewe2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showe2_OverrideLabel% vNewe2_OverrideLabel, %Preve2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowe2_Label% vNewe2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowe2_Label%  vNewe2_SendKeystroke, %Preve2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%e2_ShowExeFilePathButton% ge2_SelectFile vNewe2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%e2_ShowExeFilePathButton% vNewe2_ExeFilePath, %e2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%e2_ShowMBCtrl% Checked%e2_MBCtrl% gRefNewe2_Label vNewe2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%e2_ShowMBShift% Checked%e2_MBShift% gRefNewe2_Label vNewe2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%e2_ShowMBAlt% Checked%e2_MBAlt% gRefNewe2_Label vNewe2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%e2_ShowMBDrag% Checked%e2_MBDrag% gRefNewe2_Label vNewe2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Preve3_Label% gRefNewe3_Label vNewe3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewe3_Label, %txtPreve3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showe3_OverrideLabel% vNewe3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showe3_OverrideLabel% vNewe3_OverrideLabel, %Preve3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowe3_Label% vNewe3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowe3_Label%  vNewe3_SendKeystroke, %Preve3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%e3_ShowExeFilePathButton% ge3_SelectFile vNewe3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%e3_ShowExeFilePathButton% vNewe3_ExeFilePath, %e3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%e3_ShowMBCtrl% Checked%e3_MBCtrl% gRefNewe3_Label vNewe3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%e3_ShowMBShift% Checked%e3_MBShift% gRefNewe3_Label vNewe3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%e3_ShowMBAlt% Checked%e3_MBAlt% gRefNewe3_Label vNewe3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%e3_ShowMBDrag% Checked%e3_MBDrag% gRefNewe3_Label vNewe3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Preve4_Label% gRefNewe4_Label vNewe4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewe4_Label, %txtPreve4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showe4_OverrideLabel% vNewe4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showe4_OverrideLabel% vNewe4_OverrideLabel, %Preve4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowe4_Label% vNewe4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowe4_Label%  vNewe4_SendKeystroke, %Preve4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%e4_ShowExeFilePathButton% ge4_SelectFile vNewe4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%e4_ShowExeFilePathButton% vNewe4_ExeFilePath, %e4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%e4_ShowMBCtrl% Checked%e4_MBCtrl% gRefNewe4_Label vNewe4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%e4_ShowMBShift% Checked%e4_MBShift% gRefNewe4_Label vNewe4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%e4_ShowMBAlt% Checked%e4_MBAlt% gRefNewe4_Label vNewe4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%e4_ShowMBDrag% Checked%e4_MBDrag% gRefNewe4_Label vNewe4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Preve5_Label% gRefNewe5_Label vNewe5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewe5_Label, %txtPreve5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showe5_OverrideLabel% vNewe5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showe5_OverrideLabel% vNewe5_OverrideLabel, %Preve5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowe5_Label% vNewe5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowe5_Label%  vNewe5_SendKeystroke, %Preve5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%e5_ShowExeFilePathButton% ge5_SelectFile vNewe5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%e5_ShowExeFilePathButton% vNewe5_ExeFilePath, %e5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%e5_ShowMBCtrl% Checked%e5_MBCtrl% gRefNewe5_Label vNewe5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%e5_ShowMBShift% Checked%e5_MBShift% gRefNewe5_Label vNewe5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%e5_ShowMBAlt% Checked%e5_MBAlt% gRefNewe5_Label vNewe5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%e5_ShowMBDrag% Checked%e5_MBDrag% gRefNewe5_Label vNewe5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Preve6_Label% gRefNewe6_Label vNewe6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewe6_Label, %txtPreve6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showe6_OverrideLabel% vNewe6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showe6_OverrideLabel% vNewe6_OverrideLabel, %Preve6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowe6_Label% vNewe6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowe6_Label%  vNewe6_SendKeystroke, %Preve6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%e6_ShowExeFilePathButton% ge6_SelectFile vNewe6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%e6_ShowExeFilePathButton% vNewe6_ExeFilePath, %e6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%e6_ShowMBCtrl% Checked%e6_MBCtrl% gRefNewe6_Label vNewe6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%e6_ShowMBShift% Checked%e6_MBShift% gRefNewe6_Label vNewe6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%e6_ShowMBAlt% Checked%e6_MBAlt% gRefNewe6_Label vNewe6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%e6_ShowMBDrag% Checked%e6_MBDrag% gRefNewe6_Label vNewe6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )  
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevePieHotkey_Ctrl% vNewePieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevePieHotkey_Shift% vNewePieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevePieHotkey_Alt% vNewePieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevePieHotkeyKeyNumber% vNewePieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 7, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\fPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevfnull_Label% gRefNewfnull_Label vNewfnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewfnull_Label, %txtPrevfnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showfnull_OverrideLabel% vNewfnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showfnull_OverrideLabel% vNewfnull_OverrideLabel, %Prevfnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowfnull_Label% vNewfnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowfnull_Label% vNewfnull_SendKeystroke, %Prevfnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%fnull_ShowExeFilePathButton% gfnull_SelectFile vNewfnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%fnull_ShowExeFilePathButton% vNewfnull_ExeFilePath, %fnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%fnull_ShowMBCtrl% Checked%fnull_MBCtrl% gRefNewfnull_Label vNewfnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%fnull_ShowMBShift% Checked%fnull_MBShift% gRefNewfnull_Label vNewfnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%fnull_ShowMBAlt% Checked%fnull_MBAlt% gRefNewfnull_Label vNewfnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%fnull_ShowMBDrag% Checked%fnull_MBDrag% gRefNewfnull_Label vNewfnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevf1_Label% gRefNewf1_Label vNewf1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewf1_Label, %txtPrevf1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showf1_OverrideLabel% vNewf1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showf1_OverrideLabel% vNewf1_OverrideLabel, %Prevf1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowf1_Label% vNewf1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowf1_Label%  vNewf1_SendKeystroke, %Prevf1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%f1_ShowExeFilePathButton% gf1_SelectFile vNewf1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%f1_ShowExeFilePathButton% vNewf1_ExeFilePath, %f1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%f1_ShowMBCtrl% Checked%f1_MBCtrl% gRefNewf1_Label vNewf1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%f1_ShowMBShift% Checked%f1_MBShift% gRefNewf1_Label vNewf1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%f1_ShowMBAlt% Checked%f1_MBAlt% gRefNewf1_Label vNewf1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%f1_ShowMBDrag% Checked%f1_MBDrag% gRefNewf1_Label vNewf1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevf2_Label% gRefNewf2_Label vNewf2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewf2_Label, %txtPrevf2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showf2_OverrideLabel% vNewf2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showf2_OverrideLabel% vNewf2_OverrideLabel, %Prevf2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowf2_Label% vNewf2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowf2_Label%  vNewf2_SendKeystroke, %Prevf2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%f2_ShowExeFilePathButton% gf2_SelectFile vNewf2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%f2_ShowExeFilePathButton% vNewf2_ExeFilePath, %f2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%f2_ShowMBCtrl% Checked%f2_MBCtrl% gRefNewf2_Label vNewf2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%f2_ShowMBShift% Checked%f2_MBShift% gRefNewf2_Label vNewf2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%f2_ShowMBAlt% Checked%f2_MBAlt% gRefNewf2_Label vNewf2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%f2_ShowMBDrag% Checked%f2_MBDrag% gRefNewf2_Label vNewf2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevf3_Label% gRefNewf3_Label vNewf3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewf3_Label, %txtPrevf3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showf3_OverrideLabel% vNewf3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showf3_OverrideLabel% vNewf3_OverrideLabel, %Prevf3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowf3_Label% vNewf3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowf3_Label%  vNewf3_SendKeystroke, %Prevf3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%f3_ShowExeFilePathButton% gf3_SelectFile vNewf3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%f3_ShowExeFilePathButton% vNewf3_ExeFilePath, %f3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%f3_ShowMBCtrl% Checked%f3_MBCtrl% gRefNewf3_Label vNewf3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%f3_ShowMBShift% Checked%f3_MBShift% gRefNewf3_Label vNewf3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%f3_ShowMBAlt% Checked%f3_MBAlt% gRefNewf3_Label vNewf3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%f3_ShowMBDrag% Checked%f3_MBDrag% gRefNewf3_Label vNewf3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevf4_Label% gRefNewf4_Label vNewf4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewf4_Label, %txtPrevf4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showf4_OverrideLabel% vNewf4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showf4_OverrideLabel% vNewf4_OverrideLabel, %Prevf4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowf4_Label% vNewf4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowf4_Label%  vNewf4_SendKeystroke, %Prevf4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%f4_ShowExeFilePathButton% gf4_SelectFile vNewf4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%f4_ShowExeFilePathButton% vNewf4_ExeFilePath, %f4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%f4_ShowMBCtrl% Checked%f4_MBCtrl% gRefNewf4_Label vNewf4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%f4_ShowMBShift% Checked%f4_MBShift% gRefNewf4_Label vNewf4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%f4_ShowMBAlt% Checked%f4_MBAlt% gRefNewf4_Label vNewf4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%f4_ShowMBDrag% Checked%f4_MBDrag% gRefNewf4_Label vNewf4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevf5_Label% gRefNewf5_Label vNewf5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewf5_Label, %txtPrevf5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showf5_OverrideLabel% vNewf5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showf5_OverrideLabel% vNewf5_OverrideLabel, %Prevf5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowf5_Label% vNewf5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowf5_Label%  vNewf5_SendKeystroke, %Prevf5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%f5_ShowExeFilePathButton% gf5_SelectFile vNewf5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%f5_ShowExeFilePathButton% vNewf5_ExeFilePath, %f5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%f5_ShowMBCtrl% Checked%f5_MBCtrl% gRefNewf5_Label vNewf5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%f5_ShowMBShift% Checked%f5_MBShift% gRefNewf5_Label vNewf5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%f5_ShowMBAlt% Checked%f5_MBAlt% gRefNewf5_Label vNewf5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%f5_ShowMBDrag% Checked%f5_MBDrag% gRefNewf5_Label vNewf5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevf6_Label% gRefNewf6_Label vNewf6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewf6_Label, %txtPrevf6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showf6_OverrideLabel% vNewf6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showf6_OverrideLabel% vNewf6_OverrideLabel, %Prevf6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowf6_Label% vNewf6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowf6_Label%  vNewf6_SendKeystroke, %Prevf6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%f6_ShowExeFilePathButton% gf6_SelectFile vNewf6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%f6_ShowExeFilePathButton% vNewf6_ExeFilePath, %f6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%f6_ShowMBCtrl% Checked%f6_MBCtrl% gRefNewf6_Label vNewf6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%f6_ShowMBShift% Checked%f6_MBShift% gRefNewf6_Label vNewf6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%f6_ShowMBAlt% Checked%f6_MBAlt% gRefNewf6_Label vNewf6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%f6_ShowMBDrag% Checked%f6_MBDrag% gRefNewf6_Label vNewf6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )  
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevfPieHotkey_Ctrl% vNewfPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevfPieHotkey_Shift% vNewfPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevfPieHotkey_Alt% vNewfPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevfPieHotkeyKeyNumber% vNewfPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 8, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\gPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevgnull_Label% gRefNewgnull_Label vNewgnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewgnull_Label, %txtPrevgnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showgnull_OverrideLabel% vNewgnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showgnull_OverrideLabel% vNewgnull_OverrideLabel, %Prevgnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowgnull_Label% vNewgnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowgnull_Label% vNewgnull_SendKeystroke, %Prevgnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%gnull_ShowExeFilePathButton% ggnull_SelectFile vNewgnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%gnull_ShowExeFilePathButton% vNewgnull_ExeFilePath, %gnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%gnull_ShowMBCtrl% Checked%gnull_MBCtrl% gRefNewgnull_Label vNewgnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%gnull_ShowMBShift% Checked%gnull_MBShift% gRefNewgnull_Label vNewgnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%gnull_ShowMBAlt% Checked%gnull_MBAlt% gRefNewgnull_Label vNewgnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%gnull_ShowMBDrag% Checked%gnull_MBDrag% gRefNewgnull_Label vNewgnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevg1_Label% gRefNewg1_Label vNewg1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewg1_Label, %txtPrevg1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showg1_OverrideLabel% vNewg1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showg1_OverrideLabel% vNewg1_OverrideLabel, %Prevg1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowg1_Label% vNewg1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowg1_Label%  vNewg1_SendKeystroke, %Prevg1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%g1_ShowExeFilePathButton% gg1_SelectFile vNewg1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%g1_ShowExeFilePathButton% vNewg1_ExeFilePath, %g1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%g1_ShowMBCtrl% Checked%g1_MBCtrl% gRefNewg1_Label vNewg1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%g1_ShowMBShift% Checked%g1_MBShift% gRefNewg1_Label vNewg1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%g1_ShowMBAlt% Checked%g1_MBAlt% gRefNewg1_Label vNewg1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%g1_ShowMBDrag% Checked%g1_MBDrag% gRefNewg1_Label vNewg1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevg2_Label% gRefNewg2_Label vNewg2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewg2_Label, %txtPrevg2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showg2_OverrideLabel% vNewg2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showg2_OverrideLabel% vNewg2_OverrideLabel, %Prevg2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowg2_Label% vNewg2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowg2_Label%  vNewg2_SendKeystroke, %Prevg2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%g2_ShowExeFilePathButton% gg2_SelectFile vNewg2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%g2_ShowExeFilePathButton% vNewg2_ExeFilePath, %g2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%g2_ShowMBCtrl% Checked%g2_MBCtrl% gRefNewg2_Label vNewg2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%g2_ShowMBShift% Checked%g2_MBShift% gRefNewg2_Label vNewg2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%g2_ShowMBAlt% Checked%g2_MBAlt% gRefNewg2_Label vNewg2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%g2_ShowMBDrag% Checked%g2_MBDrag% gRefNewg2_Label vNewg2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevg3_Label% gRefNewg3_Label vNewg3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewg3_Label, %txtPrevg3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showg3_OverrideLabel% vNewg3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showg3_OverrideLabel% vNewg3_OverrideLabel, %Prevg3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowg3_Label% vNewg3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowg3_Label%  vNewg3_SendKeystroke, %Prevg3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%g3_ShowExeFilePathButton% gg3_SelectFile vNewg3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%g3_ShowExeFilePathButton% vNewg3_ExeFilePath, %g3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%g3_ShowMBCtrl% Checked%g3_MBCtrl% gRefNewg3_Label vNewg3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%g3_ShowMBShift% Checked%g3_MBShift% gRefNewg3_Label vNewg3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%g3_ShowMBAlt% Checked%g3_MBAlt% gRefNewg3_Label vNewg3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%g3_ShowMBDrag% Checked%g3_MBDrag% gRefNewg3_Label vNewg3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevg4_Label% gRefNewg4_Label vNewg4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewg4_Label, %txtPrevg4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showg4_OverrideLabel% vNewg4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showg4_OverrideLabel% vNewg4_OverrideLabel, %Prevg4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowg4_Label% vNewg4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowg4_Label%  vNewg4_SendKeystroke, %Prevg4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%g4_ShowExeFilePathButton% gg4_SelectFile vNewg4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%g4_ShowExeFilePathButton% vNewg4_ExeFilePath, %g4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%g4_ShowMBCtrl% Checked%g4_MBCtrl% gRefNewg4_Label vNewg4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%g4_ShowMBShift% Checked%g4_MBShift% gRefNewg4_Label vNewg4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%g4_ShowMBAlt% Checked%g4_MBAlt% gRefNewg4_Label vNewg4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%g4_ShowMBDrag% Checked%g4_MBDrag% gRefNewg4_Label vNewg4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevg5_Label% gRefNewg5_Label vNewg5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewg5_Label, %txtPrevg5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showg5_OverrideLabel% vNewg5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showg5_OverrideLabel% vNewg5_OverrideLabel, %Prevg5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowg5_Label% vNewg5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowg5_Label%  vNewg5_SendKeystroke, %Prevg5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%g5_ShowExeFilePathButton% gg5_SelectFile vNewg5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%g5_ShowExeFilePathButton% vNewg5_ExeFilePath, %g5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%g5_ShowMBCtrl% Checked%g5_MBCtrl% gRefNewg5_Label vNewg5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%g5_ShowMBShift% Checked%g5_MBShift% gRefNewg5_Label vNewg5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%g5_ShowMBAlt% Checked%g5_MBAlt% gRefNewg5_Label vNewg5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%g5_ShowMBDrag% Checked%g5_MBDrag% gRefNewg5_Label vNewg5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevg6_Label% gRefNewg6_Label vNewg6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewg6_Label, %txtPrevg6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showg6_OverrideLabel% vNewg6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showg6_OverrideLabel% vNewg6_OverrideLabel, %Prevg6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowg6_Label% vNewg6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowg6_Label%  vNewg6_SendKeystroke, %Prevg6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%g6_ShowExeFilePathButton% gg6_SelectFile vNewg6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%g6_ShowExeFilePathButton% vNewg6_ExeFilePath, %g6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%g6_ShowMBCtrl% Checked%g6_MBCtrl% gRefNewg6_Label vNewg6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%g6_ShowMBShift% Checked%g6_MBShift% gRefNewg6_Label vNewg6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%g6_ShowMBAlt% Checked%g6_MBAlt% gRefNewg6_Label vNewg6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%g6_ShowMBDrag% Checked%g6_MBDrag% gRefNewg6_Label vNewg6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )  
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevgPieHotkey_Ctrl% vNewgPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevgPieHotkey_Shift% vNewgPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevgPieHotkey_Alt% vNewgPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevgPieHotkeyKeyNumber% vNewgPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 9, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\hPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevhnull_Label% gRefNewhnull_Label vNewhnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewhnull_Label, %txtPrevhnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showhnull_OverrideLabel% vNewhnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showhnull_OverrideLabel% vNewhnull_OverrideLabel, %Prevhnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowhnull_Label% vNewhnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowhnull_Label% vNewhnull_SendKeystroke, %Prevhnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%hnull_ShowExeFilePathButton% ghnull_SelectFile vNewhnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%hnull_ShowExeFilePathButton% vNewhnull_ExeFilePath, %hnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%hnull_ShowMBCtrl% Checked%hnull_MBCtrl% gRefNewhnull_Label vNewhnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%hnull_ShowMBShift% Checked%hnull_MBShift% gRefNewhnull_Label vNewhnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%hnull_ShowMBAlt% Checked%hnull_MBAlt% gRefNewhnull_Label vNewhnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%hnull_ShowMBDrag% Checked%hnull_MBDrag% gRefNewhnull_Label vNewhnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevh1_Label% gRefNewh1_Label vNewh1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewh1_Label, %txtPrevh1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showh1_OverrideLabel% vNewh1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showh1_OverrideLabel% vNewh1_OverrideLabel, %Prevh1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowh1_Label% vNewh1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowh1_Label%  vNewh1_SendKeystroke, %Prevh1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%h1_ShowExeFilePathButton% gh1_SelectFile vNewh1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%h1_ShowExeFilePathButton% vNewh1_ExeFilePath, %h1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%h1_ShowMBCtrl% Checked%h1_MBCtrl% gRefNewh1_Label vNewh1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%h1_ShowMBShift% Checked%h1_MBShift% gRefNewh1_Label vNewh1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%h1_ShowMBAlt% Checked%h1_MBAlt% gRefNewh1_Label vNewh1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%h1_ShowMBDrag% Checked%h1_MBDrag% gRefNewh1_Label vNewh1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevh2_Label% gRefNewh2_Label vNewh2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewh2_Label, %txtPrevh2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showh2_OverrideLabel% vNewh2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showh2_OverrideLabel% vNewh2_OverrideLabel, %Prevh2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowh2_Label% vNewh2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowh2_Label%  vNewh2_SendKeystroke, %Prevh2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%h2_ShowExeFilePathButton% gh2_SelectFile vNewh2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%h2_ShowExeFilePathButton% vNewh2_ExeFilePath, %h2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%h2_ShowMBCtrl% Checked%h2_MBCtrl% gRefNewh2_Label vNewh2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%h2_ShowMBShift% Checked%h2_MBShift% gRefNewh2_Label vNewh2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%h2_ShowMBAlt% Checked%h2_MBAlt% gRefNewh2_Label vNewh2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%h2_ShowMBDrag% Checked%h2_MBDrag% gRefNewh2_Label vNewh2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevh3_Label% gRefNewh3_Label vNewh3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewh3_Label, %txtPrevh3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showh3_OverrideLabel% vNewh3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showh3_OverrideLabel% vNewh3_OverrideLabel, %Prevh3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowh3_Label% vNewh3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowh3_Label%  vNewh3_SendKeystroke, %Prevh3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%h3_ShowExeFilePathButton% gh3_SelectFile vNewh3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%h3_ShowExeFilePathButton% vNewh3_ExeFilePath, %h3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%h3_ShowMBCtrl% Checked%h3_MBCtrl% gRefNewh3_Label vNewh3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%h3_ShowMBShift% Checked%h3_MBShift% gRefNewh3_Label vNewh3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%h3_ShowMBAlt% Checked%h3_MBAlt% gRefNewh3_Label vNewh3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%h3_ShowMBDrag% Checked%h3_MBDrag% gRefNewh3_Label vNewh3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevh4_Label% gRefNewh4_Label vNewh4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewh4_Label, %txtPrevh4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showh4_OverrideLabel% vNewh4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showh4_OverrideLabel% vNewh4_OverrideLabel, %Prevh4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowh4_Label% vNewh4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowh4_Label%  vNewh4_SendKeystroke, %Prevh4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%h4_ShowExeFilePathButton% gh4_SelectFile vNewh4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%h4_ShowExeFilePathButton% vNewh4_ExeFilePath, %h4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%h4_ShowMBCtrl% Checked%h4_MBCtrl% gRefNewh4_Label vNewh4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%h4_ShowMBShift% Checked%h4_MBShift% gRefNewh4_Label vNewh4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%h4_ShowMBAlt% Checked%h4_MBAlt% gRefNewh4_Label vNewh4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%h4_ShowMBDrag% Checked%h4_MBDrag% gRefNewh4_Label vNewh4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevh5_Label% gRefNewh5_Label vNewh5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewh5_Label, %txtPrevh5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showh5_OverrideLabel% vNewh5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showh5_OverrideLabel% vNewh5_OverrideLabel, %Prevh5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowh5_Label% vNewh5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowh5_Label%  vNewh5_SendKeystroke, %Prevh5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%h5_ShowExeFilePathButton% gh5_SelectFile vNewh5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%h5_ShowExeFilePathButton% vNewh5_ExeFilePath, %h5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%h5_ShowMBCtrl% Checked%h5_MBCtrl% gRefNewh5_Label vNewh5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%h5_ShowMBShift% Checked%h5_MBShift% gRefNewh5_Label vNewh5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%h5_ShowMBAlt% Checked%h5_MBAlt% gRefNewh5_Label vNewh5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%h5_ShowMBDrag% Checked%h5_MBDrag% gRefNewh5_Label vNewh5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevh6_Label% gRefNewh6_Label vNewh6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewh6_Label, %txtPrevh6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showh6_OverrideLabel% vNewh6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showh6_OverrideLabel% vNewh6_OverrideLabel, %Prevh6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowh6_Label% vNewh6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowh6_Label%  vNewh6_SendKeystroke, %Prevh6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%h6_ShowExeFilePathButton% gh6_SelectFile vNewh6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%h6_ShowExeFilePathButton% vNewh6_ExeFilePath, %h6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%h6_ShowMBCtrl% Checked%h6_MBCtrl% gRefNewh6_Label vNewh6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%h6_ShowMBShift% Checked%h6_MBShift% gRefNewh6_Label vNewh6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%h6_ShowMBAlt% Checked%h6_MBAlt% gRefNewh6_Label vNewh6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%h6_ShowMBDrag% Checked%h6_MBDrag% gRefNewh6_Label vNewh6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevhPieHotkey_Ctrl% vNewhPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevhPieHotkey_Shift% vNewhPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevhPieHotkey_Alt% vNewhPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevhPieHotkeyKeyNumber% vNewhPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 10, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\iPieMenuNull.png 
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Previnull_Label% gRefNewinull_Label vNewinull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewinull_Label, %txtPrevinull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showinull_OverrideLabel% vNewinull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showinull_OverrideLabel% vNewinull_OverrideLabel, %Previnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowinull_Label% vNewinull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowinull_Label% vNewinull_SendKeystroke, %Previnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%inull_ShowExeFilePathButton% ginull_SelectFile vNewinull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%inull_ShowExeFilePathButton% vNewinull_ExeFilePath, %inull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%inull_ShowMBCtrl% Checked%inull_MBCtrl% gRefNewinull_Label vNewinull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%inull_ShowMBShift% Checked%inull_MBShift% gRefNewinull_Label vNewinull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%inull_ShowMBAlt% Checked%inull_MBAlt% gRefNewinull_Label vNewinull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%inull_ShowMBDrag% Checked%inull_MBDrag% gRefNewinull_Label vNewinull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Previ1_Label% gRefNewi1_Label vNewi1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewi1_Label, %txtPrevi1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showi1_OverrideLabel% vNewi1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showi1_OverrideLabel% vNewi1_OverrideLabel, %Previ1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowi1_Label% vNewi1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowi1_Label%  vNewi1_SendKeystroke, %Previ1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%i1_ShowExeFilePathButton% gi1_SelectFile vNewi1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%i1_ShowExeFilePathButton% vNewi1_ExeFilePath, %i1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%i1_ShowMBCtrl% Checked%i1_MBCtrl% gRefNewi1_Label vNewi1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%i1_ShowMBShift% Checked%i1_MBShift% gRefNewi1_Label vNewi1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%i1_ShowMBAlt% Checked%i1_MBAlt% gRefNewi1_Label vNewi1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%i1_ShowMBDrag% Checked%i1_MBDrag% gRefNewi1_Label vNewi1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Previ2_Label% gRefNewi2_Label vNewi2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewi2_Label, %txtPrevi2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showi2_OverrideLabel% vNewi2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showi2_OverrideLabel% vNewi2_OverrideLabel, %Previ2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowi2_Label% vNewi2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowi2_Label%  vNewi2_SendKeystroke, %Previ2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%i2_ShowExeFilePathButton% gi2_SelectFile vNewi2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%i2_ShowExeFilePathButton% vNewi2_ExeFilePath, %i2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%i2_ShowMBCtrl% Checked%i2_MBCtrl% gRefNewi2_Label vNewi2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%i2_ShowMBShift% Checked%i2_MBShift% gRefNewi2_Label vNewi2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%i2_ShowMBAlt% Checked%i2_MBAlt% gRefNewi2_Label vNewi2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%i2_ShowMBDrag% Checked%i2_MBDrag% gRefNewi2_Label vNewi2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Previ3_Label% gRefNewi3_Label vNewi3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewi3_Label, %txtPrevi3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showi3_OverrideLabel% vNewi3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showi3_OverrideLabel% vNewi3_OverrideLabel, %Previ3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowi3_Label% vNewi3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowi3_Label%  vNewi3_SendKeystroke, %Previ3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%i3_ShowExeFilePathButton% gi3_SelectFile vNewi3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%i3_ShowExeFilePathButton% vNewi3_ExeFilePath, %i3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%i3_ShowMBCtrl% Checked%i3_MBCtrl% gRefNewi3_Label vNewi3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%i3_ShowMBShift% Checked%i3_MBShift% gRefNewi3_Label vNewi3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%i3_ShowMBAlt% Checked%i3_MBAlt% gRefNewi3_Label vNewi3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%i3_ShowMBDrag% Checked%i3_MBDrag% gRefNewi3_Label vNewi3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Previ4_Label% gRefNewi4_Label vNewi4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewi4_Label, %txtPrevi4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showi4_OverrideLabel% vNewi4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showi4_OverrideLabel% vNewi4_OverrideLabel, %Previ4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowi4_Label% vNewi4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowi4_Label%  vNewi4_SendKeystroke, %Previ4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%i4_ShowExeFilePathButton% gi4_SelectFile vNewi4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%i4_ShowExeFilePathButton% vNewi4_ExeFilePath, %i4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%i4_ShowMBCtrl% Checked%i4_MBCtrl% gRefNewi4_Label vNewi4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%i4_ShowMBShift% Checked%i4_MBShift% gRefNewi4_Label vNewi4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%i4_ShowMBAlt% Checked%i4_MBAlt% gRefNewi4_Label vNewi4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%i4_ShowMBDrag% Checked%i4_MBDrag% gRefNewi4_Label vNewi4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Previ5_Label% gRefNewi5_Label vNewi5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewi5_Label, %txtPrevi5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showi5_OverrideLabel% vNewi5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showi5_OverrideLabel% vNewi5_OverrideLabel, %Previ5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowi5_Label% vNewi5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowi5_Label%  vNewi5_SendKeystroke, %Previ5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%i5_ShowExeFilePathButton% gi5_SelectFile vNewi5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%i5_ShowExeFilePathButton% vNewi5_ExeFilePath, %i5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%i5_ShowMBCtrl% Checked%i5_MBCtrl% gRefNewi5_Label vNewi5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%i5_ShowMBShift% Checked%i5_MBShift% gRefNewi5_Label vNewi5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%i5_ShowMBAlt% Checked%i5_MBAlt% gRefNewi5_Label vNewi5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%i5_ShowMBDrag% Checked%i5_MBDrag% gRefNewi5_Label vNewi5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Previ6_Label% gRefNewi6_Label vNewi6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewi6_Label, %txtPrevi6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showi6_OverrideLabel% vNewi6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showi6_OverrideLabel% vNewi6_OverrideLabel, %Previ6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowi6_Label% vNewi6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowi6_Label%  vNewi6_SendKeystroke, %Previ6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%i6_ShowExeFilePathButton% gi6_SelectFile vNewi6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%i6_ShowExeFilePathButton% vNewi6_ExeFilePath, %i6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%i6_ShowMBCtrl% Checked%i6_MBCtrl% gRefNewi6_Label vNewi6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%i6_ShowMBShift% Checked%i6_MBShift% gRefNewi6_Label vNewi6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%i6_ShowMBAlt% Checked%i6_MBAlt% gRefNewi6_Label vNewi6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%i6_ShowMBDrag% Checked%i6_MBDrag% gRefNewi6_Label vNewi6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PreviPieHotkey_Ctrl% vNewiPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PreviPieHotkey_Shift% vNewiPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PreviPieHotkey_Alt% vNewiPieHotkey_Alt, Alt
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PreviPieHotkeyKeyNumber% vNewiPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 11, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\jPieMenuNull.png 
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevjnull_Label% gRefNewjnull_Label vNewjnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewjnull_Label, %txtPrevjnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showjnull_OverrideLabel% vNewjnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showjnull_OverrideLabel% vNewjnull_OverrideLabel, %Prevjnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowjnull_Label% vNewjnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowjnull_Label% vNewjnull_SendKeystroke, %Prevjnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%jnull_ShowExeFilePathButton% gjnull_SelectFile vNewjnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%jnull_ShowExeFilePathButton% vNewjnull_ExeFilePath, %jnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%jnull_ShowMBCtrl% Checked%jnull_MBCtrl% gRefNewjnull_Label vNewjnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%jnull_ShowMBShift% Checked%jnull_MBShift% gRefNewjnull_Label vNewjnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%jnull_ShowMBAlt% Checked%jnull_MBAlt% gRefNewjnull_Label vNewjnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%jnull_ShowMBDrag% Checked%jnull_MBDrag% gRefNewjnull_Label vNewjnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevj1_Label% gRefNewj1_Label vNewj1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewj1_Label, %txtPrevj1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showj1_OverrideLabel% vNewj1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showj1_OverrideLabel% vNewj1_OverrideLabel, %Prevj1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowj1_Label% vNewj1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowj1_Label%  vNewj1_SendKeystroke, %Prevj1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%j1_ShowExeFilePathButton% gj1_SelectFile vNewj1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%j1_ShowExeFilePathButton% vNewj1_ExeFilePath, %j1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%j1_ShowMBCtrl% Checked%j1_MBCtrl% gRefNewj1_Label vNewj1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%j1_ShowMBShift% Checked%j1_MBShift% gRefNewj1_Label vNewj1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%j1_ShowMBAlt% Checked%j1_MBAlt% gRefNewj1_Label vNewj1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%j1_ShowMBDrag% Checked%j1_MBDrag% gRefNewj1_Label vNewj1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevj2_Label% gRefNewj2_Label vNewj2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewj2_Label, %txtPrevj2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showj2_OverrideLabel% vNewj2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showj2_OverrideLabel% vNewj2_OverrideLabel, %Prevj2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowj2_Label% vNewj2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowj2_Label%  vNewj2_SendKeystroke, %Prevj2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%j2_ShowExeFilePathButton% gj2_SelectFile vNewj2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%j2_ShowExeFilePathButton% vNewj2_ExeFilePath, %j2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%j2_ShowMBCtrl% Checked%j2_MBCtrl% gRefNewj2_Label vNewj2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%j2_ShowMBShift% Checked%j2_MBShift% gRefNewj2_Label vNewj2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%j2_ShowMBAlt% Checked%j2_MBAlt% gRefNewj2_Label vNewj2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%j2_ShowMBDrag% Checked%j2_MBDrag% gRefNewj2_Label vNewj2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevj3_Label% gRefNewj3_Label vNewj3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewj3_Label, %txtPrevj3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showj3_OverrideLabel% vNewj3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showj3_OverrideLabel% vNewj3_OverrideLabel, %Prevj3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowj3_Label% vNewj3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowj3_Label%  vNewj3_SendKeystroke, %Prevj3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%j3_ShowExeFilePathButton% gj3_SelectFile vNewj3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%j3_ShowExeFilePathButton% vNewj3_ExeFilePath, %j3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%j3_ShowMBCtrl% Checked%j3_MBCtrl% gRefNewj3_Label vNewj3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%j3_ShowMBShift% Checked%j3_MBShift% gRefNewj3_Label vNewj3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%j3_ShowMBAlt% Checked%j3_MBAlt% gRefNewj3_Label vNewj3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%j3_ShowMBDrag% Checked%j3_MBDrag% gRefNewj3_Label vNewj3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevj4_Label% gRefNewj4_Label vNewj4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewj4_Label, %txtPrevj4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showj4_OverrideLabel% vNewj4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showj4_OverrideLabel% vNewj4_OverrideLabel, %Prevj4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowj4_Label% vNewj4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowj4_Label%  vNewj4_SendKeystroke, %Prevj4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%j4_ShowExeFilePathButton% gj4_SelectFile vNewj4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%j4_ShowExeFilePathButton% vNewj4_ExeFilePath, %j4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%j4_ShowMBCtrl% Checked%j4_MBCtrl% gRefNewj4_Label vNewj4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%j4_ShowMBShift% Checked%j4_MBShift% gRefNewj4_Label vNewj4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%j4_ShowMBAlt% Checked%j4_MBAlt% gRefNewj4_Label vNewj4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%j4_ShowMBDrag% Checked%j4_MBDrag% gRefNewj4_Label vNewj4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevj5_Label% gRefNewj5_Label vNewj5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewj5_Label, %txtPrevj5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showj5_OverrideLabel% vNewj5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showj5_OverrideLabel% vNewj5_OverrideLabel, %Prevj5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowj5_Label% vNewj5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowj5_Label%  vNewj5_SendKeystroke, %Prevj5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%j5_ShowExeFilePathButton% gj5_SelectFile vNewj5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%j5_ShowExeFilePathButton% vNewj5_ExeFilePath, %j5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%j5_ShowMBCtrl% Checked%j5_MBCtrl% gRefNewj5_Label vNewj5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%j5_ShowMBShift% Checked%j5_MBShift% gRefNewj5_Label vNewj5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%j5_ShowMBAlt% Checked%j5_MBAlt% gRefNewj5_Label vNewj5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%j5_ShowMBDrag% Checked%j5_MBDrag% gRefNewj5_Label vNewj5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevj6_Label% gRefNewj6_Label vNewj6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewj6_Label, %txtPrevj6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showj6_OverrideLabel% vNewj6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showj6_OverrideLabel% vNewj6_OverrideLabel, %Prevj6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowj6_Label% vNewj6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowj6_Label%  vNewj6_SendKeystroke, %Prevj6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%j6_ShowExeFilePathButton% gj6_SelectFile vNewj6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%j6_ShowExeFilePathButton% vNewj6_ExeFilePath, %j6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%j6_ShowMBCtrl% Checked%j6_MBCtrl% gRefNewj6_Label vNewj6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%j6_ShowMBShift% Checked%j6_MBShift% gRefNewj6_Label vNewj6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%j6_ShowMBAlt% Checked%j6_MBAlt% gRefNewj6_Label vNewj6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%j6_ShowMBDrag% Checked%j6_MBDrag% gRefNewj6_Label vNewj6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevjPieHotkey_Ctrl% vNewjPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevjPieHotkey_Shift% vNewjPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevjPieHotkey_Alt% vNewjPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevjPieHotkeyKeyNumber% vNewjPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 12, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\kPieMenuNull.png 
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevknull_Label% gRefNewknull_Label vNewknull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewknull_Label, %txtPrevknull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showknull_OverrideLabel% vNewknull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showknull_OverrideLabel% vNewknull_OverrideLabel, %Prevknull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowknull_Label% vNewknull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowknull_Label% vNewknull_SendKeystroke, %Prevknull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%knull_ShowExeFilePathButton% gknull_SelectFile vNewknull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%knull_ShowExeFilePathButton% vNewknull_ExeFilePath, %knull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%knull_ShowMBCtrl% Checked%knull_MBCtrl% gRefNewknull_Label vNewknull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%knull_ShowMBShift% Checked%knull_MBShift% gRefNewknull_Label vNewknull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%knull_ShowMBAlt% Checked%knull_MBAlt% gRefNewknull_Label vNewknull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%knull_ShowMBDrag% Checked%knull_MBDrag% gRefNewknull_Label vNewknull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevk1_Label% gRefNewk1_Label vNewk1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewk1_Label, %txtPrevk1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showk1_OverrideLabel% vNewk1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showk1_OverrideLabel% vNewk1_OverrideLabel, %Prevk1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowk1_Label% vNewk1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowk1_Label%  vNewk1_SendKeystroke, %Prevk1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%k1_ShowExeFilePathButton% gk1_SelectFile vNewk1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%k1_ShowExeFilePathButton% vNewk1_ExeFilePath, %k1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%k1_ShowMBCtrl% Checked%k1_MBCtrl% gRefNewk1_Label vNewk1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%k1_ShowMBShift% Checked%k1_MBShift% gRefNewk1_Label vNewk1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%k1_ShowMBAlt% Checked%k1_MBAlt% gRefNewk1_Label vNewk1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%k1_ShowMBDrag% Checked%k1_MBDrag% gRefNewk1_Label vNewk1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevk2_Label% gRefNewk2_Label vNewk2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewk2_Label, %txtPrevk2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showk2_OverrideLabel% vNewk2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showk2_OverrideLabel% vNewk2_OverrideLabel, %Prevk2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowk2_Label% vNewk2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowk2_Label%  vNewk2_SendKeystroke, %Prevk2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%k2_ShowExeFilePathButton% gk2_SelectFile vNewk2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%k2_ShowExeFilePathButton% vNewk2_ExeFilePath, %k2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%k2_ShowMBCtrl% Checked%k2_MBCtrl% gRefNewk2_Label vNewk2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%k2_ShowMBShift% Checked%k2_MBShift% gRefNewk2_Label vNewk2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%k2_ShowMBAlt% Checked%k2_MBAlt% gRefNewk2_Label vNewk2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%k2_ShowMBDrag% Checked%k2_MBDrag% gRefNewk2_Label vNewk2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevk3_Label% gRefNewk3_Label vNewk3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewk3_Label, %txtPrevk3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showk3_OverrideLabel% vNewk3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showk3_OverrideLabel% vNewk3_OverrideLabel, %Prevk3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowk3_Label% vNewk3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowk3_Label%  vNewk3_SendKeystroke, %Prevk3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%k3_ShowExeFilePathButton% gk3_SelectFile vNewk3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%k3_ShowExeFilePathButton% vNewk3_ExeFilePath, %k3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%k3_ShowMBCtrl% Checked%k3_MBCtrl% gRefNewk3_Label vNewk3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%k3_ShowMBShift% Checked%k3_MBShift% gRefNewk3_Label vNewk3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%k3_ShowMBAlt% Checked%k3_MBAlt% gRefNewk3_Label vNewk3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%k3_ShowMBDrag% Checked%k3_MBDrag% gRefNewk3_Label vNewk3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevk4_Label% gRefNewk4_Label vNewk4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewk4_Label, %txtPrevk4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showk4_OverrideLabel% vNewk4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showk4_OverrideLabel% vNewk4_OverrideLabel, %Prevk4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowk4_Label% vNewk4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowk4_Label%  vNewk4_SendKeystroke, %Prevk4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%k4_ShowExeFilePathButton% gk4_SelectFile vNewk4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%k4_ShowExeFilePathButton% vNewk4_ExeFilePath, %k4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%k4_ShowMBCtrl% Checked%k4_MBCtrl% gRefNewk4_Label vNewk4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%k4_ShowMBShift% Checked%k4_MBShift% gRefNewk4_Label vNewk4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%k4_ShowMBAlt% Checked%k4_MBAlt% gRefNewk4_Label vNewk4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%k4_ShowMBDrag% Checked%k4_MBDrag% gRefNewk4_Label vNewk4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevk5_Label% gRefNewk5_Label vNewk5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewk5_Label, %txtPrevk5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showk5_OverrideLabel% vNewk5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showk5_OverrideLabel% vNewk5_OverrideLabel, %Prevk5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowk5_Label% vNewk5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowk5_Label%  vNewk5_SendKeystroke, %Prevk5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%k5_ShowExeFilePathButton% gk5_SelectFile vNewk5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%k5_ShowExeFilePathButton% vNewk5_ExeFilePath, %k5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%k5_ShowMBCtrl% Checked%k5_MBCtrl% gRefNewk5_Label vNewk5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%k5_ShowMBShift% Checked%k5_MBShift% gRefNewk5_Label vNewk5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%k5_ShowMBAlt% Checked%k5_MBAlt% gRefNewk5_Label vNewk5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%k5_ShowMBDrag% Checked%k5_MBDrag% gRefNewk5_Label vNewk5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevk6_Label% gRefNewk6_Label vNewk6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewk6_Label, %txtPrevk6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showk6_OverrideLabel% vNewk6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showk6_OverrideLabel% vNewk6_OverrideLabel, %Prevk6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowk6_Label% vNewk6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowk6_Label%  vNewk6_SendKeystroke, %Prevk6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%k6_ShowExeFilePathButton% gk6_SelectFile vNewk6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%k6_ShowExeFilePathButton% vNewk6_ExeFilePath, %k6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%k6_ShowMBCtrl% Checked%k6_MBCtrl% gRefNewk6_Label vNewk6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%k6_ShowMBShift% Checked%k6_MBShift% gRefNewk6_Label vNewk6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%k6_ShowMBAlt% Checked%k6_MBAlt% gRefNewk6_Label vNewk6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%k6_ShowMBDrag% Checked%k6_MBDrag% gRefNewk6_Label vNewk6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevkPieHotkey_Ctrl% vNewkPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevkPieHotkey_Shift% vNewkPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevkPieHotkey_Alt% vNewkPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevkPieHotkeyKeyNumber% vNewkPieHotkey_Input, %AcceptablePieHotkeys% 


Gui, PieMenu:Tab, 13, 1
Gui, PieMenu:Add, Picture, x223 y58 w48 h48, %A_ScriptDir%\Resources\1PieMenu\lPieMenuNull.png
Gui, PieMenu:Add, Text, x243 y76 w10 h15, M
Gui, PieMenu:Add, Text, x275 y60 w10 h15, 1
Gui, PieMenu:Add, Text, x245 y40 w10 h15, 2
Gui, PieMenu:Add, Text, x210 y60 w10 h15, 3
Gui, PieMenu:Add, Text, x210 y95 w10 h15, 4
Gui, PieMenu:Add, Text, x245 y110 w10 h15, 5
Gui, PieMenu:Add, Text, x275 y95 w10 h15, 6

Gui, PieMenu:Add, GroupBox, x5 y125 w490 h105, Position M
Gui, PieMenu:Add, Text, x85 y138 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y155 w155 h120 +AltSubmit Choose%Prevlnull_Label% gRefNewlnull_Label vNewlnull_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y180 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y195 w475 h28 vtxtNewlnull_Label, %txtPrevlnull_Label%
Gui, PieMenu:Add, Text, x265 y145 w75 h15 +Hidden%Showlnull_OverrideLabel% vNewlnull_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y140 w145 h20 +Hidden%Showlnull_OverrideLabel% vNewlnull_OverrideLabel, %Prevlnull_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y170 w80 h15 +Hidden%SendKeyShowlnull_Label% vNewlnull_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y165 w145 h20 +Hidden%SendKeyShowlnull_Label% vNewlnull_SendKeystroke, %Prevlnull_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y163 w80 h25 +Hidden%lnull_ShowExeFilePathButton% glnull_SelectFile vNewlnull_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y165 w145 h20 +Hidden%lnull_ShowExeFilePathButton% vNewlnull_ExeFilePath, %lnull_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y168 w40 h15 +Hidden%lnull_ShowMBCtrl% Checked%lnull_MBCtrl% gRefNewlnull_Label vNewlnull_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y168 w40 h15 +Hidden%lnull_ShowMBShift% Checked%lnull_MBShift% gRefNewlnull_Label vNewlnull_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y168 w40 h15 +Hidden%lnull_ShowMBAlt% Checked%lnull_MBAlt% gRefNewlnull_Label vNewlnull_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y168 w40 h15 +Hidden%lnull_ShowMBDrag% Checked%lnull_MBDrag% gRefNewlnull_Label vNewlnull_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y230 w490 h105, Position 1
Gui, PieMenu:Add, Text, x85 y243 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y260 w155 h120 +AltSubmit Choose%Prevl1_Label% gRefNewl1_Label vNewl1_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y285 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y300 w475 h28 vtxtNewl1_Label, %txtPrevl1_Label%
Gui, PieMenu:Add, Text, x265 y250 w75 h15 +Hidden%Showl1_OverrideLabel% vNewl1_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y245 w145 h20 +Hidden%Showl1_OverrideLabel% vNewl1_OverrideLabel, %Prevl1_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y275 w80 h15 +Hidden%SendKeyShowl1_Label% vNewl1_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y270 w145 h20 +Hidden%SendKeyShowl1_Label%  vNewl1_SendKeystroke, %Prevl1_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y268 w80 h25 +Hidden%l1_ShowExeFilePathButton% gl1_SelectFile vNewl1_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y270 w145 h20 +Hidden%l1_ShowExeFilePathButton% vNewl1_ExeFilePath, %l1_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y273 w40 h15 +Hidden%l1_ShowMBCtrl% Checked%l1_MBCtrl% gRefNewl1_Label vNewl1_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y273 w40 h15 +Hidden%l1_ShowMBShift% Checked%l1_MBShift% gRefNewl1_Label vNewl1_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y273 w40 h15 +Hidden%l1_ShowMBAlt% Checked%l1_MBAlt% gRefNewl1_Label vNewl1_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y273 w40 h15 +Hidden%l1_ShowMBDrag% Checked%l1_MBDrag% gRefNewl1_Label vNewl1_MBDrag, Drag


Gui, PieMenu:Add, GroupBox, x5 y335 w490 h105, Position 2
Gui, PieMenu:Add, Text, x85 y348 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y365 w155 h120 +AltSubmit Choose%Prevl2_Label% gRefNewl2_Label vNewl2_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y390 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y405 w475 h28 vtxtNewl2_Label, %txtPrevl2_Label%
Gui, PieMenu:Add, Text, x265 y355 w75 h15 +Hidden%Showl2_OverrideLabel% vNewl2_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y350 w145 h20 +Hidden%Showl2_OverrideLabel% vNewl2_OverrideLabel, %Prevl2_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y380 w80 h15 +Hidden%SendKeyShowl2_Label% vNewl2_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y375 w145 h20 +Hidden%SendKeyShowl2_Label%  vNewl2_SendKeystroke, %Prevl2_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y373 w80 h25 +Hidden%l2_ShowExeFilePathButton% gl2_SelectFile vNewl2_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y375 w145 h20 +Hidden%l2_ShowExeFilePathButton% vNewl2_ExeFilePath, %l2_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y378 w40 h15 +Hidden%l2_ShowMBCtrl% Checked%l2_MBCtrl% gRefNewl2_Label vNewl2_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y378 w40 h15 +Hidden%l2_ShowMBShift% Checked%l2_MBShift% gRefNewl2_Label vNewl2_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y378 w40 h15 +Hidden%l2_ShowMBAlt% Checked%l2_MBAlt% gRefNewl2_Label vNewl2_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y378 w40 h15 +Hidden%l2_ShowMBDrag% Checked%l2_MBDrag% gRefNewl2_Label vNewl2_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y440 w490 h105, Position 3
Gui, PieMenu:Add, Text, x85 y453 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y470 w155 h120 +AltSubmit Choose%Prevl3_Label% gRefNewl3_Label vNewl3_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y495 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y510 w475 h28 vtxtNewl3_Label, %txtPrevl3_Label%
Gui, PieMenu:Add, Text, x265 y460 w75 h15 +Hidden%Showl3_OverrideLabel% vNewl3_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y455 w145 h20 +Hidden%Showl3_OverrideLabel% vNewl3_OverrideLabel, %Prevl3_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y485 w80 h15 +Hidden%SendKeyShowl3_Label% vNewl3_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y480 w145 h20 +Hidden%SendKeyShowl3_Label%  vNewl3_SendKeystroke, %Prevl3_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y478 w80 h25 +Hidden%l3_ShowExeFilePathButton% gl3_SelectFile vNewl3_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y480 w145 h20 +Hidden%l3_ShowExeFilePathButton% vNewl3_ExeFilePath, %l3_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y483 w40 h15 +Hidden%l3_ShowMBCtrl% Checked%l3_MBCtrl% gRefNewl3_Label vNewl3_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y483 w40 h15 +Hidden%l3_ShowMBShift% Checked%l3_MBShift% gRefNewl3_Label vNewl3_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y483 w40 h15 +Hidden%l3_ShowMBAlt% Checked%l3_MBAlt% gRefNewl3_Label vNewl3_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y483 w40 h15 +Hidden%l3_ShowMBDrag% Checked%l3_MBDrag% gRefNewl3_Label vNewl3_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y545 w490 h105, Position 4
Gui, PieMenu:Add, Text, x85 y558 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y575 w155 h120 +AltSubmit Choose%Prevl4_Label% gRefNewl4_Label vNewl4_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y600 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y615 w475 h28 vtxtNewl4_Label, %txtPrevl4_Label%
Gui, PieMenu:Add, Text, x265 y565 w75 h15 +Hidden%Showl4_OverrideLabel% vNewl4_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y560 w145 h20 +Hidden%Showl4_OverrideLabel% vNewl4_OverrideLabel, %Prevl4_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y590 w80 h15 +Hidden%SendKeyShowl4_Label% vNewl4_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y585 w145 h20 +Hidden%SendKeyShowl4_Label%  vNewl4_SendKeystroke, %Prevl4_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y583 w80 h25 +Hidden%l4_ShowExeFilePathButton% gl4_SelectFile vNewl4_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y585 w145 h20 +Hidden%l4_ShowExeFilePathButton% vNewl4_ExeFilePath, %l4_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y588 w40 h15 +Hidden%l4_ShowMBCtrl% Checked%l4_MBCtrl% gRefNewl4_Label vNewl4_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y588 w40 h15 +Hidden%l4_ShowMBShift% Checked%l4_MBShift% gRefNewl4_Label vNewl4_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y588 w40 h15 +Hidden%l4_ShowMBAlt% Checked%l4_MBAlt% gRefNewl4_Label vNewl4_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y588 w40 h15 +Hidden%l4_ShowMBDrag% Checked%l4_MBDrag% gRefNewl4_Label vNewl4_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y650 w490 h105, Position 5
Gui, PieMenu:Add, Text, x85 y663 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y680 w155 h120 +AltSubmit Choose%Prevl5_Label% gRefNewl5_Label vNewl5_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y705 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y720 w475 h28 vtxtNewl5_Label, %txtPrevl5_Label%
Gui, PieMenu:Add, Text, x265 y670 w75 h15 +Hidden%Showl5_OverrideLabel% vNewl5_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y665 w145 h20 +Hidden%Showl5_OverrideLabel% vNewl5_OverrideLabel, %Prevl5_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y695 w80 h15 +Hidden%SendKeyShowl5_Label% vNewl5_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y690 w145 h20 +Hidden%SendKeyShowl5_Label%  vNewl5_SendKeystroke, %Prevl5_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y688 w80 h25 +Hidden%l5_ShowExeFilePathButton% gl5_SelectFile vNewl5_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y690 w145 h20 +Hidden%l5_ShowExeFilePathButton% vNewl5_ExeFilePath, %l5_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y693 w40 h15 +Hidden%l5_ShowMBCtrl% Checked%l5_MBCtrl% gRefNewl5_Label vNewl5_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y693 w40 h15 +Hidden%l5_ShowMBShift% Checked%l5_MBShift% gRefNewl5_Label vNewl5_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y693 w40 h15 +Hidden%l5_ShowMBAlt% Checked%l5_MBAlt% gRefNewl5_Label vNewl5_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y693 w40 h15 +Hidden%l5_ShowMBDrag% Checked%l5_MBDrag% gRefNewl5_Label vNewl5_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y755 w490 h105, Position 6
Gui, PieMenu:Add, Text, x85 y768 w40 h15, Function
Gui, PieMenu:Add, DropDownList, x30 y785 w155 h120 +AltSubmit Choose%Prevl6_Label% gRefNewl6_Label vNewl6_Label, %FuncList%
Gui, PieMenu:Add, Text, x10 y810 w105 h15, Function Description:
Gui, PieMenu:Add, Text, x15 y825 w475 h28 vtxtNewl6_Label, %txtPrevl6_Label%
Gui, PieMenu:Add, Text, x265 y775 w75 h15 +Hidden%Showl6_OverrideLabel% vNewl6_OverrideText, Override Label:
Gui, PieMenu:Add, Edit, x345 y770 w145 h20 +Hidden%Showl6_OverrideLabel% vNewl6_OverrideLabel, %Prevl6_OverrideLabel%
Gui, PieMenu:Add, Text, x260 y800 w80 h15 +Hidden%SendKeyShowl6_Label% vNewl6_SendKeystrokeText, Send Keystroke:
Gui, PieMenu:Add, Hotkey, x345 y795 w145 h20  +Hidden%SendKeyShowl6_Label%  vNewl6_SendKeystroke, %Prevl6_SendKeystroke%
Gui, PieMenu:Add, Button, x260 y793 w80 h25 +Hidden%l6_ShowExeFilePathButton% gl6_SelectFile vNewl6_ExeFilePathButton, Select File
Gui, PieMenu:Add, Edit, x345 y795 w145 h20 +Hidden%l6_ShowExeFilePathButton% vNewl6_ExeFilePath, %l6_PrevExeFilePath%

Gui, PieMenu:Add, Checkbox, x270 y798 w40 h15 +Hidden%l6_ShowMBCtrl% Checked%l6_MBCtrl% gRefNewl6_Label vNewl6_MBCtrl, Ctrl
Gui, PieMenu:Add, Checkbox, x310 y798 w40 h15 +Hidden%l6_ShowMBShift% Checked%l6_MBShift% gRefNewl6_Label vNewl6_MBShift, Shift
Gui, PieMenu:Add, Checkbox, x350 y798 w40 h15 +Hidden%l6_ShowMBAlt% Checked%l6_MBAlt% gRefNewl6_Label vNewl6_MBAlt, Alt
Gui, PieMenu:Add, Checkbox, x410 y798 w40 h15 +Hidden%l6_ShowMBDrag% Checked%l6_MBDrag% gRefNewl6_Label vNewl6_MBDrag, Drag

Gui, PieMenu:Add, GroupBox, x5 y860 w490 h50, PIE HOTKEY ( Mode 5 ): ( SC033 = comma    SC034 = period    XButton1/2 = mouse side buttons )
Gui, PieMenu:Add, Checkbox, x15 y885 w45 h15 Checked%PrevlPieHotkey_Ctrl% vNewlPieHotkey_Ctrl, Ctrl 
Gui, PieMenu:Add, Checkbox, x70 y885 w45 h15 Checked%PrevlPieHotkey_Shift% vNewlPieHotkey_Shift, Shift 
Gui, PieMenu:Add, Checkbox, x125 y885 w45 h15 Checked%PrevlPieHotkey_Alt% vNewlPieHotkey_Alt, Alt 
Gui, PieMenu:Add, Text, x200 y885 w45 h15, + 
Gui, PieMenu:Add, ComboBox, x270 y880 w175 h250 Choose%PrevlPieHotkeyKeyNumber% vNewlPieHotkey_Input, %AcceptablePieHotkeys% 

;Dont touch this
Gui, PieMenu:Show, w507 h955, Pie Menu Settings for %AppTitle% ; new GUI changed h from h895 to h945 + 10
return

anull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newanull_ExeFilePath, %A_ScriptDir%, %Newanull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newanull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newanull_ExeFilePath := SubStr(Newanull_ExeFilePath, ExeFilePathTrim)
	Newanull_ExeFilePath := "%A_WorkingDir%\Resources\"Newanull_ExeFilePath
	}
guicontrol, , Newanull_ExeFilePath, %Newanull_ExeFilePath%
RefNewanull_Label:
Gui, Submit, NoHide
If Newanull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newanull_OverrideText
	guicontrol, Show, Newanull_OverrideLabel
	guicontrol, Show, Newanull_ExeFilePathButton
	guicontrol, Show, Newanull_ExeFilePath
	guicontrol, Hide, Newanull_SendKeystroke
	guicontrol, Hide, Newanull_SendKeystrokeText
	guicontrol, Hide, Newanull_MBCtrl
	guicontrol, Hide, Newanull_MBAlt
	guicontrol, Hide, Newanull_MBShift
	guicontrol, Hide, Newanull_MBDrag
	}
If Newanull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newanull_OverrideText
	guicontrol, Show, Newanull_OverrideLabel
	guicontrol, Show, Newanull_SendKeystroke
	guicontrol, Show, Newanull_SendKeystrokeText
	guicontrol, Hide, Newanull_ExeFilePathButton
	guicontrol, Hide, Newanull_ExeFilePath
	guicontrol, Hide, Newanull_MBCtrl
	guicontrol, Hide, Newanull_MBAlt
	guicontrol, Hide, Newanull_MBShift
	guicontrol, Hide, Newanull_MBDrag
	}
If Newanull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newanull_OverrideText
	guicontrol, Show, Newanull_OverrideLabel
	guicontrol, Hide, Newanull_SendKeystroke
	guicontrol, Hide, Newanull_SendKeystrokeText
	guicontrol, Hide, Newanull_ExeFilePathButton
	guicontrol, Hide, Newanull_ExeFilePath
	guicontrol, Show, Newanull_MBCtrl
	guicontrol, Show, Newanull_MBAlt
	guicontrol, Show, Newanull_MBShift
	guicontrol, Show, Newanull_MBDrag
	}
If Newanull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newanull_OverrideText
	guicontrol, Hide, Newanull_OverrideLabel
	guicontrol, Hide, Newanull_SendKeystroke
	guicontrol, Hide, Newanull_SendKeystrokeText
	guicontrol, Hide, Newanull_ExeFilePathButton
	guicontrol, Hide, Newanull_ExeFilePath
	guicontrol, Hide, Newanull_MBCtrl
	guicontrol, Hide, Newanull_MBAlt
	guicontrol, Hide, Newanull_MBShift
	guicontrol, Hide, Newanull_MBDrag
	}
FileReadLine, isotextNewanull_Label,%A_ScriptDir%\Resources\Functions.txt, Newanull_Label
isotextNewanull_Label := StrSplit(isotextNewanull_Label, ":")
guicontrol, , txtNewanull_Label, % isotextNewanull_Label[2]
Return



a1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa1_ExeFilePath, %A_ScriptDir%, %Newa1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa1_ExeFilePath := SubStr(Newa1_ExeFilePath, ExeFilePathTrim)
	Newa1_ExeFilePath := "%A_WorkingDir%\Resources\"Newa1_ExeFilePath
	}
guicontrol, , Newa1_ExeFilePath, %Newa1_ExeFilePath%
RefNewa1_Label:
Gui, Submit, NoHide
If Newa1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa1_OverrideText
	guicontrol, Show, Newa1_OverrideLabel
	guicontrol, Show, Newa1_ExeFilePathButton
	guicontrol, Show, Newa1_ExeFilePath
	guicontrol, Hide, Newa1_SendKeystroke
	guicontrol, Hide, Newa1_SendKeystrokeText
	guicontrol, Hide, Newa1_MBCtrl
	guicontrol, Hide, Newa1_MBAlt
	guicontrol, Hide, Newa1_MBShift
	guicontrol, Hide, Newa1_MBDrag
	}
If Newa1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa1_OverrideText
	guicontrol, Show, Newa1_OverrideLabel
	guicontrol, Show, Newa1_SendKeystroke
	guicontrol, Show, Newa1_SendKeystrokeText
	guicontrol, Hide, Newa1_ExeFilePathButton
	guicontrol, Hide, Newa1_ExeFilePath
	guicontrol, Hide, Newa1_MBCtrl
	guicontrol, Hide, Newa1_MBAlt
	guicontrol, Hide, Newa1_MBShift
	guicontrol, Hide, Newa1_MBDrag
	}
If Newa1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa1_OverrideText
	guicontrol, Show, Newa1_OverrideLabel
	guicontrol, Hide, Newa1_SendKeystroke
	guicontrol, Hide, Newa1_SendKeystrokeText
	guicontrol, Hide, Newa1_ExeFilePathButton
	guicontrol, Hide, Newa1_ExeFilePath
	guicontrol, Show, Newa1_MBCtrl
	guicontrol, Show, Newa1_MBAlt
	guicontrol, Show, Newa1_MBShift
	guicontrol, Show, Newa1_MBDrag
	}
If Newa1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa1_OverrideText
	guicontrol, Hide, Newa1_OverrideLabel
	guicontrol, Hide, Newa1_SendKeystroke
	guicontrol, Hide, Newa1_SendKeystrokeText
	guicontrol, Hide, Newa1_ExeFilePathButton
	guicontrol, Hide, Newa1_ExeFilePath
	guicontrol, Hide, Newa1_MBCtrl
	guicontrol, Hide, Newa1_MBAlt
	guicontrol, Hide, Newa1_MBShift
	guicontrol, Hide, Newa1_MBDrag
	}
FileReadLine, isotextNewa1_Label,%A_ScriptDir%\Resources\Functions.txt, Newa1_Label
isotextNewa1_Label := StrSplit(isotextNewa1_Label, ":")
guicontrol, , txtNewa1_Label, % isotextNewa1_Label[2]
Return

a2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa2_ExeFilePath, %A_ScriptDir%, %Newa2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa2_ExeFilePath := SubStr(Newa2_ExeFilePath, ExeFilePathTrim)
	Newa2_ExeFilePath := "%A_WorkingDir%\Resources\"Newa2_ExeFilePath
	}
guicontrol, , Newa2_ExeFilePath, %Newa2_ExeFilePath%
RefNewa2_Label:
Gui, Submit, NoHide
If Newa2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa2_OverrideText
	guicontrol, Show, Newa2_OverrideLabel
	guicontrol, Show, Newa2_ExeFilePathButton
	guicontrol, Show, Newa2_ExeFilePath
	guicontrol, Hide, Newa2_SendKeystroke
	guicontrol, Hide, Newa2_SendKeystrokeText
	guicontrol, Hide, Newa2_MBCtrl
	guicontrol, Hide, Newa2_MBAlt
	guicontrol, Hide, Newa2_MBShift
	guicontrol, Hide, Newa2_MBDrag
	}
If Newa2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa2_OverrideText
	guicontrol, Show, Newa2_OverrideLabel
	guicontrol, Show, Newa2_SendKeystroke
	guicontrol, Show, Newa2_SendKeystrokeText
	guicontrol, Hide, Newa2_ExeFilePathButton
	guicontrol, Hide, Newa2_ExeFilePath
	guicontrol, Hide, Newa2_MBCtrl
	guicontrol, Hide, Newa2_MBAlt
	guicontrol, Hide, Newa2_MBShift
	guicontrol, Hide, Newa2_MBDrag
	}
If Newa2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa2_OverrideText
	guicontrol, Show, Newa2_OverrideLabel
	guicontrol, Hide, Newa2_SendKeystroke
	guicontrol, Hide, Newa2_SendKeystrokeText
	guicontrol, Hide, Newa2_ExeFilePathButton
	guicontrol, Hide, Newa2_ExeFilePath
	guicontrol, Show, Newa2_MBCtrl
	guicontrol, Show, Newa2_MBAlt
	guicontrol, Show, Newa2_MBShift
	guicontrol, Show, Newa2_MBDrag
	}
If Newa2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa2_OverrideText
	guicontrol, Hide, Newa2_OverrideLabel
	guicontrol, Hide, Newa2_SendKeystroke
	guicontrol, Hide, Newa2_SendKeystrokeText
	guicontrol, Hide, Newa2_ExeFilePathButton
	guicontrol, Hide, Newa2_ExeFilePath
	guicontrol, Hide, Newa2_MBCtrl
	guicontrol, Hide, Newa2_MBAlt
	guicontrol, Hide, Newa2_MBShift
	guicontrol, Hide, Newa2_MBDrag
	}
FileReadLine, isotextNewa2_Label,%A_ScriptDir%\Resources\Functions.txt, Newa2_Label
isotextNewa2_Label := StrSplit(isotextNewa2_Label, ":")
guicontrol, , txtNewa2_Label, % isotextNewa2_Label[2]
Return

a3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa3_ExeFilePath, %A_ScriptDir%, %Newa3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa3_ExeFilePath := SubStr(Newa3_ExeFilePath, ExeFilePathTrim)
	Newa3_ExeFilePath := "%A_WorkingDir%\Resources\"Newa3_ExeFilePath
	}
guicontrol, , Newa3_ExeFilePath, %Newa3_ExeFilePath%
RefNewa3_Label:
Gui, Submit, NoHide
If Newa3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa3_OverrideText
	guicontrol, Show, Newa3_OverrideLabel
	guicontrol, Show, Newa3_ExeFilePathButton
	guicontrol, Show, Newa3_ExeFilePath
	guicontrol, Hide, Newa3_SendKeystroke
	guicontrol, Hide, Newa3_SendKeystrokeText
	guicontrol, Hide, Newa3_MBCtrl
	guicontrol, Hide, Newa3_MBAlt
	guicontrol, Hide, Newa3_MBShift
	guicontrol, Hide, Newa3_MBDrag
	}
If Newa3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa3_OverrideText
	guicontrol, Show, Newa3_OverrideLabel
	guicontrol, Show, Newa3_SendKeystroke
	guicontrol, Show, Newa3_SendKeystrokeText
	guicontrol, Hide, Newa3_ExeFilePathButton
	guicontrol, Hide, Newa3_ExeFilePath
	guicontrol, Hide, Newa3_MBCtrl
	guicontrol, Hide, Newa3_MBAlt
	guicontrol, Hide, Newa3_MBShift
	guicontrol, Hide, Newa3_MBDrag
	}
If Newa3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa3_OverrideText
	guicontrol, Show, Newa3_OverrideLabel
	guicontrol, Hide, Newa3_SendKeystroke
	guicontrol, Hide, Newa3_SendKeystrokeText
	guicontrol, Hide, Newa3_ExeFilePathButton
	guicontrol, Hide, Newa3_ExeFilePath
	guicontrol, Show, Newa3_MBCtrl
	guicontrol, Show, Newa3_MBAlt
	guicontrol, Show, Newa3_MBShift
	guicontrol, Show, Newa3_MBDrag
	}
If Newa3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa3_OverrideText
	guicontrol, Hide, Newa3_OverrideLabel
	guicontrol, Hide, Newa3_SendKeystroke
	guicontrol, Hide, Newa3_SendKeystrokeText
	guicontrol, Hide, Newa3_ExeFilePathButton
	guicontrol, Hide, Newa3_ExeFilePath
	guicontrol, Hide, Newa3_MBCtrl
	guicontrol, Hide, Newa3_MBAlt
	guicontrol, Hide, Newa3_MBShift
	guicontrol, Hide, Newa3_MBDrag
	}
FileReadLine, isotextNewa3_Label,%A_ScriptDir%\Resources\Functions.txt, Newa3_Label
isotextNewa3_Label := StrSplit(isotextNewa3_Label, ":")
guicontrol, , txtNewa3_Label, % isotextNewa3_Label[2]
Return


a4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa4_ExeFilePath, %A_ScriptDir%, %Newa4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa4_ExeFilePath := SubStr(Newa4_ExeFilePath, ExeFilePathTrim)
	Newa4_ExeFilePath := "%A_WorkingDir%\Resources\"Newa4_ExeFilePath
	}
guicontrol, , Newa4_ExeFilePath, %Newa4_ExeFilePath%
RefNewa4_Label:
Gui, Submit, NoHide
If Newa4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa4_OverrideText
	guicontrol, Show, Newa4_OverrideLabel
	guicontrol, Show, Newa4_ExeFilePathButton
	guicontrol, Show, Newa4_ExeFilePath
	guicontrol, Hide, Newa4_SendKeystroke
	guicontrol, Hide, Newa4_SendKeystrokeText
	guicontrol, Hide, Newa4_MBCtrl
	guicontrol, Hide, Newa4_MBAlt
	guicontrol, Hide, Newa4_MBShift
	guicontrol, Hide, Newa4_MBDrag
	}
If Newa4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa4_OverrideText
	guicontrol, Show, Newa4_OverrideLabel
	guicontrol, Show, Newa4_SendKeystroke
	guicontrol, Show, Newa4_SendKeystrokeText
	guicontrol, Hide, Newa4_ExeFilePathButton
	guicontrol, Hide, Newa4_ExeFilePath
	guicontrol, Hide, Newa4_MBCtrl
	guicontrol, Hide, Newa4_MBAlt
	guicontrol, Hide, Newa4_MBShift
	guicontrol, Hide, Newa4_MBDrag
	}
If Newa4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa4_OverrideText
	guicontrol, Show, Newa4_OverrideLabel
	guicontrol, Hide, Newa4_SendKeystroke
	guicontrol, Hide, Newa4_SendKeystrokeText
	guicontrol, Hide, Newa4_ExeFilePathButton
	guicontrol, Hide, Newa4_ExeFilePath
	guicontrol, Show, Newa4_MBCtrl
	guicontrol, Show, Newa4_MBAlt
	guicontrol, Show, Newa4_MBShift
	guicontrol, Show, Newa4_MBDrag
	}
If Newa4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa4_OverrideText
	guicontrol, Hide, Newa4_OverrideLabel
	guicontrol, Hide, Newa4_SendKeystroke
	guicontrol, Hide, Newa4_SendKeystrokeText
	guicontrol, Hide, Newa4_ExeFilePathButton
	guicontrol, Hide, Newa4_ExeFilePath
	guicontrol, Hide, Newa4_MBCtrl
	guicontrol, Hide, Newa4_MBAlt
	guicontrol, Hide, Newa4_MBShift
	guicontrol, Hide, Newa4_MBDrag
	}
FileReadLine, isotextNewa4_Label,%A_ScriptDir%\Resources\Functions.txt, Newa4_Label
isotextNewa4_Label := StrSplit(isotextNewa4_Label, ":")
guicontrol, , txtNewa4_Label, % isotextNewa4_Label[2]
Return

a5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa5_ExeFilePath, %A_ScriptDir%, %Newa5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa5_ExeFilePath := SubStr(Newa5_ExeFilePath, ExeFilePathTrim)
	Newa5_ExeFilePath := "%A_WorkingDir%\Resources\"Newa5_ExeFilePath
	}
guicontrol, , Newa5_ExeFilePath, %Newa5_ExeFilePath%
RefNewa5_Label:
Gui, Submit, NoHide
If Newa5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa5_OverrideText
	guicontrol, Show, Newa5_OverrideLabel
	guicontrol, Show, Newa5_ExeFilePathButton
	guicontrol, Show, Newa5_ExeFilePath
	guicontrol, Hide, Newa5_SendKeystroke
	guicontrol, Hide, Newa5_SendKeystrokeText
	guicontrol, Hide, Newa5_MBCtrl
	guicontrol, Hide, Newa5_MBAlt
	guicontrol, Hide, Newa5_MBShift
	guicontrol, Hide, Newa5_MBDrag
	}
If Newa5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa5_OverrideText
	guicontrol, Show, Newa5_OverrideLabel
	guicontrol, Show, Newa5_SendKeystroke
	guicontrol, Show, Newa5_SendKeystrokeText
	guicontrol, Hide, Newa5_ExeFilePathButton
	guicontrol, Hide, Newa5_ExeFilePath
	guicontrol, Hide, Newa5_MBCtrl
	guicontrol, Hide, Newa5_MBAlt
	guicontrol, Hide, Newa5_MBShift
	guicontrol, Hide, Newa5_MBDrag
	}
If Newa5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa5_OverrideText
	guicontrol, Show, Newa5_OverrideLabel
	guicontrol, Hide, Newa5_SendKeystroke
	guicontrol, Hide, Newa5_SendKeystrokeText
	guicontrol, Hide, Newa5_ExeFilePathButton
	guicontrol, Hide, Newa5_ExeFilePath
	guicontrol, Show, Newa5_MBCtrl
	guicontrol, Show, Newa5_MBAlt
	guicontrol, Show, Newa5_MBShift
	guicontrol, Show, Newa5_MBDrag
	}
If Newa5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa5_OverrideText
	guicontrol, Hide, Newa5_OverrideLabel
	guicontrol, Hide, Newa5_SendKeystroke
	guicontrol, Hide, Newa5_SendKeystrokeText
	guicontrol, Hide, Newa5_ExeFilePathButton
	guicontrol, Hide, Newa5_ExeFilePath
	guicontrol, Hide, Newa5_MBCtrl
	guicontrol, Hide, Newa5_MBAlt
	guicontrol, Hide, Newa5_MBShift
	guicontrol, Hide, Newa5_MBDrag
	}
FileReadLine, isotextNewa5_Label,%A_ScriptDir%\Resources\Functions.txt, Newa5_Label
isotextNewa5_Label := StrSplit(isotextNewa5_Label, ":")
guicontrol, , txtNewa5_Label, % isotextNewa5_Label[2]
Return

a6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newa6_ExeFilePath, %A_ScriptDir%, %Newa6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newa6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newa6_ExeFilePath := SubStr(Newa6_ExeFilePath, ExeFilePathTrim)
	Newa6_ExeFilePath := "%A_WorkingDir%\Resources\"Newa6_ExeFilePath
	}
guicontrol, , Newa6_ExeFilePath, %Newa6_ExeFilePath%
RefNewa6_Label:
Gui, Submit, NoHide
If Newa6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newa6_OverrideText
	guicontrol, Show, Newa6_OverrideLabel
	guicontrol, Show, Newa6_ExeFilePathButton
	guicontrol, Show, Newa6_ExeFilePath
	guicontrol, Hide, Newa6_SendKeystroke
	guicontrol, Hide, Newa6_SendKeystrokeText
	guicontrol, Hide, Newa6_MBCtrl
	guicontrol, Hide, Newa6_MBAlt
	guicontrol, Hide, Newa6_MBShift
	guicontrol, Hide, Newa6_MBDrag
	}
If Newa6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newa6_OverrideText
	guicontrol, Show, Newa6_OverrideLabel
	guicontrol, Show, Newa6_SendKeystroke
	guicontrol, Show, Newa6_SendKeystrokeText
	guicontrol, Hide, Newa6_ExeFilePathButton
	guicontrol, Hide, Newa6_ExeFilePath
	guicontrol, Hide, Newa6_MBCtrl
	guicontrol, Hide, Newa6_MBAlt
	guicontrol, Hide, Newa6_MBShift
	guicontrol, Hide, Newa6_MBDrag
	}
If Newa6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newa6_OverrideText
	guicontrol, Show, Newa6_OverrideLabel
	guicontrol, Hide, Newa6_SendKeystroke
	guicontrol, Hide, Newa6_SendKeystrokeText
	guicontrol, Hide, Newa6_ExeFilePathButton
	guicontrol, Hide, Newa6_ExeFilePath
	guicontrol, Show, Newa6_MBCtrl
	guicontrol, Show, Newa6_MBAlt
	guicontrol, Show, Newa6_MBShift
	guicontrol, Show, Newa6_MBDrag
	}
If Newa6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newa6_OverrideText
	guicontrol, Hide, Newa6_OverrideLabel
	guicontrol, Hide, Newa6_SendKeystroke
	guicontrol, Hide, Newa6_SendKeystrokeText
	guicontrol, Hide, Newa6_ExeFilePathButton
	guicontrol, Hide, Newa6_ExeFilePath
	guicontrol, Hide, Newa6_MBCtrl
	guicontrol, Hide, Newa6_MBAlt
	guicontrol, Hide, Newa6_MBShift
	guicontrol, Hide, Newa6_MBDrag
	}
FileReadLine, isotextNewa6_Label,%A_ScriptDir%\Resources\Functions.txt, Newa6_Label
isotextNewa6_Label := StrSplit(isotextNewa6_Label, ":")
guicontrol, , txtNewa6_Label, % isotextNewa6_Label[2]
Return

bnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newbnull_ExeFilePath, %A_ScriptDir%, %Newbnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newbnulll_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newbnulll_ExeFilePath := SubStr(Newbnulll_ExeFilePath, ExeFilePathTrim)
	Newbnulll_ExeFilePath := "%A_WorkingDir%\Resources\"Newbnulll_ExeFilePath
	}
guicontrol, , Newbnull_ExeFilePath, %Newbnull_ExeFilePath%
RefNewbnull_Label:
Gui, Submit, NoHide
If Newbnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newbnull_OverrideText
	guicontrol, Show, Newbnull_OverrideLabel
	guicontrol, Show, Newbnull_ExeFilePathButton
	guicontrol, Show, Newbnull_ExeFilePath
	guicontrol, Hide, Newbnull_SendKeystroke
	guicontrol, Hide, Newbnull_SendKeystrokeText
	guicontrol, Hide, Newbnull_MBCtrl
	guicontrol, Hide, Newbnull_MBAlt
	guicontrol, Hide, Newbnull_MBShift
	guicontrol, Hide, Newbnull_MBDrag
	}
If Newbnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newbnull_OverrideText
	guicontrol, Show, Newbnull_OverrideLabel
	guicontrol, Show, Newbnull_SendKeystroke
	guicontrol, Show, Newbnull_SendKeystrokeText
	guicontrol, Hide, Newbnull_ExeFilePathButton
	guicontrol, Hide, Newbnull_ExeFilePath
	guicontrol, Hide, Newbnull_MBCtrl
	guicontrol, Hide, Newbnull_MBAlt
	guicontrol, Hide, Newbnull_MBShift
	guicontrol, Hide, Newbnull_MBDrag
	}
If Newbnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newbnull_OverrideText
	guicontrol, Show, Newbnull_OverrideLabel
	guicontrol, Hide, Newbnull_SendKeystroke
	guicontrol, Hide, Newbnull_SendKeystrokeText
	guicontrol, Hide, Newbnull_ExeFilePathButton
	guicontrol, Hide, Newbnull_ExeFilePath
	guicontrol, Show, Newbnull_MBCtrl
	guicontrol, Show, Newbnull_MBAlt
	guicontrol, Show, Newbnull_MBShift
	guicontrol, Show, Newbnull_MBDrag
	}
If Newbnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newbnull_OverrideText
	guicontrol, Hide, Newbnull_OverrideLabel
	guicontrol, Hide, Newbnull_SendKeystroke
	guicontrol, Hide, Newbnull_SendKeystrokeText
	guicontrol, Hide, Newbnull_ExeFilePathButton
	guicontrol, Hide, Newbnull_ExeFilePath
	guicontrol, Hide, Newbnull_MBCtrl
	guicontrol, Hide, Newbnull_MBAlt
	guicontrol, Hide, Newbnull_MBShift
	guicontrol, Hide, Newbnull_MBDrag
	}
FileReadLine, isotextNewbnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newbnull_Label
isotextNewbnull_Label := StrSplit(isotextNewbnull_Label, ":")
guicontrol, , txtNewbnull_Label, % isotextNewbnull_Label[2]
Return



b1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb1_ExeFilePath, %A_ScriptDir%, %Newb1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb1_ExeFilePath := SubStr(Newb1_ExeFilePath, ExeFilePathTrim)
	Newb1_ExeFilePath := "%A_WorkingDir%\Resources\"Newb1_ExeFilePath
	}
guicontrol, , Newb1_ExeFilePath, %Newb1_ExeFilePath%
RefNewb1_Label:
Gui, Submit, NoHide
If Newb1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb1_OverrideText
	guicontrol, Show, Newb1_OverrideLabel
	guicontrol, Show, Newb1_ExeFilePathButton
	guicontrol, Show, Newb1_ExeFilePath
	guicontrol, Hide, Newb1_SendKeystroke
	guicontrol, Hide, Newb1_SendKeystrokeText
	guicontrol, Hide, Newb1_MBCtrl
	guicontrol, Hide, Newb1_MBAlt
	guicontrol, Hide, Newb1_MBShift
	guicontrol, Hide, Newb1_MBDrag
	}
If Newb1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb1_OverrideText
	guicontrol, Show, Newb1_OverrideLabel
	guicontrol, Show, Newb1_SendKeystroke
	guicontrol, Show, Newb1_SendKeystrokeText
	guicontrol, Hide, Newb1_ExeFilePathButton
	guicontrol, Hide, Newb1_ExeFilePath
	guicontrol, Hide, Newb1_MBCtrl
	guicontrol, Hide, Newb1_MBAlt
	guicontrol, Hide, Newb1_MBShift
	guicontrol, Hide, Newb1_MBDrag
	}
If Newb1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb1_OverrideText
	guicontrol, Show, Newb1_OverrideLabel
	guicontrol, Hide, Newb1_SendKeystroke
	guicontrol, Hide, Newb1_SendKeystrokeText
	guicontrol, Hide, Newb1_ExeFilePathButton
	guicontrol, Hide, Newb1_ExeFilePath
	guicontrol, Show, Newb1_MBCtrl
	guicontrol, Show, Newb1_MBAlt
	guicontrol, Show, Newb1_MBShift
	guicontrol, Show, Newb1_MBDrag
	}
If Newb1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb1_OverrideText
	guicontrol, Hide, Newb1_OverrideLabel
	guicontrol, Hide, Newb1_SendKeystroke
	guicontrol, Hide, Newb1_SendKeystrokeText
	guicontrol, Hide, Newb1_ExeFilePathButton
	guicontrol, Hide, Newb1_ExeFilePath
	guicontrol, Hide, Newb1_MBCtrl
	guicontrol, Hide, Newb1_MBAlt
	guicontrol, Hide, Newb1_MBShift
	guicontrol, Hide, Newb1_MBDrag
	}
FileReadLine, isotextNewb1_Label,%A_ScriptDir%\Resources\Functions.txt, Newb1_Label
isotextNewb1_Label := StrSplit(isotextNewb1_Label, ":")
guicontrol, , txtNewb1_Label, % isotextNewb1_Label[2]
Return

b2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb2_ExeFilePath, %A_ScriptDir%, %Newb2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb2_ExeFilePath := SubStr(Newb2_ExeFilePath, ExeFilePathTrim)
	Newb2_ExeFilePath := "%A_WorkingDir%\Resources\"Newb2_ExeFilePath
	}
guicontrol, , Newb2_ExeFilePath, %Newb2_ExeFilePath%
RefNewb2_Label:
Gui, Submit, NoHide
If Newb2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb2_OverrideText
	guicontrol, Show, Newb2_OverrideLabel
	guicontrol, Show, Newb2_ExeFilePathButton
	guicontrol, Show, Newb2_ExeFilePath
	guicontrol, Hide, Newb2_SendKeystroke
	guicontrol, Hide, Newb2_SendKeystrokeText
	guicontrol, Hide, Newb2_MBCtrl
	guicontrol, Hide, Newb2_MBAlt
	guicontrol, Hide, Newb2_MBShift
	guicontrol, Hide, Newb2_MBDrag
	}
If Newb2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb2_OverrideText
	guicontrol, Show, Newb2_OverrideLabel
	guicontrol, Show, Newb2_SendKeystroke
	guicontrol, Show, Newb2_SendKeystrokeText
	guicontrol, Hide, Newb2_ExeFilePathButton
	guicontrol, Hide, Newb2_ExeFilePath
	guicontrol, Hide, Newb2_MBCtrl
	guicontrol, Hide, Newb2_MBAlt
	guicontrol, Hide, Newb2_MBShift
	guicontrol, Hide, Newb2_MBDrag
	}
If Newb2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb2_OverrideText
	guicontrol, Show, Newb2_OverrideLabel
	guicontrol, Hide, Newb2_SendKeystroke
	guicontrol, Hide, Newb2_SendKeystrokeText
	guicontrol, Hide, Newb2_ExeFilePathButton
	guicontrol, Hide, Newb2_ExeFilePath
	guicontrol, Show, Newb2_MBCtrl
	guicontrol, Show, Newb2_MBAlt
	guicontrol, Show, Newb2_MBShift
	guicontrol, Show, Newb2_MBDrag
	}
If Newb2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb2_OverrideText
	guicontrol, Hide, Newb2_OverrideLabel
	guicontrol, Hide, Newb2_SendKeystroke
	guicontrol, Hide, Newb2_SendKeystrokeText
	guicontrol, Hide, Newb2_ExeFilePathButton
	guicontrol, Hide, Newb2_ExeFilePath
	guicontrol, Hide, Newb2_MBCtrl
	guicontrol, Hide, Newb2_MBAlt
	guicontrol, Hide, Newb2_MBShift
	guicontrol, Hide, Newb2_MBDrag
	}
FileReadLine, isotextNewb2_Label,%A_ScriptDir%\Resources\Functions.txt, Newb2_Label
isotextNewb2_Label := StrSplit(isotextNewb2_Label, ":")
guicontrol, , txtNewb2_Label, % isotextNewb2_Label[2]
Return

b3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb3_ExeFilePath, %A_ScriptDir%, %Newb3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb3_ExeFilePath := SubStr(Newb3_ExeFilePath, ExeFilePathTrim)
	Newb3_ExeFilePath := "%A_WorkingDir%\Resources\"Newb3_ExeFilePath
	}
guicontrol, , Newb3_ExeFilePath, %Newb3_ExeFilePath%
RefNewb3_Label:
Gui, Submit, NoHide
If Newb3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb3_OverrideText
	guicontrol, Show, Newb3_OverrideLabel
	guicontrol, Show, Newb3_ExeFilePathButton
	guicontrol, Show, Newb3_ExeFilePath
	guicontrol, Hide, Newb3_SendKeystroke
	guicontrol, Hide, Newb3_SendKeystrokeText
	guicontrol, Hide, Newb3_MBCtrl
	guicontrol, Hide, Newb3_MBAlt
	guicontrol, Hide, Newb3_MBShift
	guicontrol, Hide, Newb3_MBDrag
	}
If Newb3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb3_OverrideText
	guicontrol, Show, Newb3_OverrideLabel
	guicontrol, Show, Newb3_SendKeystroke
	guicontrol, Show, Newb3_SendKeystrokeText
	guicontrol, Hide, Newb3_ExeFilePathButton
	guicontrol, Hide, Newb3_ExeFilePath
	guicontrol, Hide, Newb3_MBCtrl
	guicontrol, Hide, Newb3_MBAlt
	guicontrol, Hide, Newb3_MBShift
	guicontrol, Hide, Newb3_MBDrag
	}
If Newb3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb3_OverrideText
	guicontrol, Show, Newb3_OverrideLabel
	guicontrol, Hide, Newb3_SendKeystroke
	guicontrol, Hide, Newb3_SendKeystrokeText
	guicontrol, Hide, Newb3_ExeFilePathButton
	guicontrol, Hide, Newb3_ExeFilePath
	guicontrol, Show, Newb3_MBCtrl
	guicontrol, Show, Newb3_MBAlt
	guicontrol, Show, Newb3_MBShift
	guicontrol, Show, Newb3_MBDrag
	}
If Newb3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb3_OverrideText
	guicontrol, Hide, Newb3_OverrideLabel
	guicontrol, Hide, Newb3_SendKeystroke
	guicontrol, Hide, Newb3_SendKeystrokeText
	guicontrol, Hide, Newb3_ExeFilePathButton
	guicontrol, Hide, Newb3_ExeFilePath
	guicontrol, Hide, Newb3_MBCtrl
	guicontrol, Hide, Newb3_MBAlt
	guicontrol, Hide, Newb3_MBShift
	guicontrol, Hide, Newb3_MBDrag
	}
FileReadLine, isotextNewb3_Label,%A_ScriptDir%\Resources\Functions.txt, Newb3_Label
isotextNewb3_Label := StrSplit(isotextNewb3_Label, ":")
guicontrol, , txtNewb3_Label, % isotextNewb3_Label[2]
Return


b4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb4_ExeFilePath, %A_ScriptDir%, %Newb4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb4_ExeFilePath := SubStr(Newb4_ExeFilePath, ExeFilePathTrim)
	Newb4_ExeFilePath := "%A_WorkingDir%\Resources\"Newb4_ExeFilePath
	}
guicontrol, , Newb4_ExeFilePath, %Newb4_ExeFilePath%
RefNewb4_Label:
Gui, Submit, NoHide
If Newb4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb4_OverrideText
	guicontrol, Show, Newb4_OverrideLabel
	guicontrol, Show, Newb4_ExeFilePathButton
	guicontrol, Show, Newb4_ExeFilePath
	guicontrol, Hide, Newb4_SendKeystroke
	guicontrol, Hide, Newb4_SendKeystrokeText
	guicontrol, Hide, Newb4_MBCtrl
	guicontrol, Hide, Newb4_MBAlt
	guicontrol, Hide, Newb4_MBShift
	guicontrol, Hide, Newb4_MBDrag
	}
If Newb4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb4_OverrideText
	guicontrol, Show, Newb4_OverrideLabel
	guicontrol, Show, Newb4_SendKeystroke
	guicontrol, Show, Newb4_SendKeystrokeText
	guicontrol, Hide, Newb4_ExeFilePathButton
	guicontrol, Hide, Newb4_ExeFilePath
	guicontrol, Hide, Newb4_MBCtrl
	guicontrol, Hide, Newb4_MBAlt
	guicontrol, Hide, Newb4_MBShift
	guicontrol, Hide, Newb4_MBDrag
	}
If Newb4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb4_OverrideText
	guicontrol, Show, Newb4_OverrideLabel
	guicontrol, Hide, Newb4_SendKeystroke
	guicontrol, Hide, Newb4_SendKeystrokeText
	guicontrol, Hide, Newb4_ExeFilePathButton
	guicontrol, Hide, Newb4_ExeFilePath
	guicontrol, Show, Newb4_MBCtrl
	guicontrol, Show, Newb4_MBAlt
	guicontrol, Show, Newb4_MBShift
	guicontrol, Show, Newb4_MBDrag
	}
If Newb4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb4_OverrideText
	guicontrol, Hide, Newb4_OverrideLabel
	guicontrol, Hide, Newb4_SendKeystroke
	guicontrol, Hide, Newb4_SendKeystrokeText
	guicontrol, Hide, Newb4_ExeFilePathButton
	guicontrol, Hide, Newb4_ExeFilePath
	guicontrol, Hide, Newb4_MBCtrl
	guicontrol, Hide, Newb4_MBAlt
	guicontrol, Hide, Newb4_MBShift
	guicontrol, Hide, Newb4_MBDrag
	}
FileReadLine, isotextNewb4_Label,%A_ScriptDir%\Resources\Functions.txt, Newb4_Label
isotextNewb4_Label := StrSplit(isotextNewb4_Label, ":")
guicontrol, , txtNewb4_Label, % isotextNewb4_Label[2]
Return

b5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb5_ExeFilePath, %A_ScriptDir%, %Newb5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb5_ExeFilePath := SubStr(Newb5_ExeFilePath, ExeFilePathTrim)
	Newb5_ExeFilePath := "%A_WorkingDir%\Resources\"Newb5_ExeFilePath
	}
guicontrol, , Newb5_ExeFilePath, %Newb5_ExeFilePath%
RefNewb5_Label:
Gui, Submit, NoHide
If Newb5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb5_OverrideText
	guicontrol, Show, Newb5_OverrideLabel
	guicontrol, Show, Newb5_ExeFilePathButton
	guicontrol, Show, Newb5_ExeFilePath
	guicontrol, Hide, Newb5_SendKeystroke
	guicontrol, Hide, Newb5_SendKeystrokeText
	guicontrol, Hide, Newb5_MBCtrl
	guicontrol, Hide, Newb5_MBAlt
	guicontrol, Hide, Newb5_MBShift
	guicontrol, Hide, Newb5_MBDrag
	}
If Newb5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb5_OverrideText
	guicontrol, Show, Newb5_OverrideLabel
	guicontrol, Show, Newb5_SendKeystroke
	guicontrol, Show, Newb5_SendKeystrokeText
	guicontrol, Hide, Newb5_ExeFilePathButton
	guicontrol, Hide, Newb5_ExeFilePath
	guicontrol, Hide, Newb5_MBCtrl
	guicontrol, Hide, Newb5_MBAlt
	guicontrol, Hide, Newb5_MBShift
	guicontrol, Hide, Newb5_MBDrag
	}
If Newb5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb5_OverrideText
	guicontrol, Show, Newb5_OverrideLabel
	guicontrol, Hide, Newb5_SendKeystroke
	guicontrol, Hide, Newb5_SendKeystrokeText
	guicontrol, Hide, Newb5_ExeFilePathButton
	guicontrol, Hide, Newb5_ExeFilePath
	guicontrol, Show, Newb5_MBCtrl
	guicontrol, Show, Newb5_MBAlt
	guicontrol, Show, Newb5_MBShift
	guicontrol, Show, Newb5_MBDrag
	}
If Newb5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb5_OverrideText
	guicontrol, Hide, Newb5_OverrideLabel
	guicontrol, Hide, Newb5_SendKeystroke
	guicontrol, Hide, Newb5_SendKeystrokeText
	guicontrol, Hide, Newb5_ExeFilePathButton
	guicontrol, Hide, Newb5_ExeFilePath
	guicontrol, Hide, Newb5_MBCtrl
	guicontrol, Hide, Newb5_MBAlt
	guicontrol, Hide, Newb5_MBShift
	guicontrol, Hide, Newb5_MBDrag
	}
FileReadLine, isotextNewb5_Label,%A_ScriptDir%\Resources\Functions.txt, Newb5_Label
isotextNewb5_Label := StrSplit(isotextNewb5_Label, ":")
guicontrol, , txtNewb5_Label, % isotextNewb5_Label[2]
Return

b6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newb6_ExeFilePath, %A_ScriptDir%, %Newb6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newb6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newb6_ExeFilePath := SubStr(Newb6_ExeFilePath, ExeFilePathTrim)
	Newb6_ExeFilePath := "%A_WorkingDir%\Resources\"Newb6_ExeFilePath
	}
guicontrol, , Newb6_ExeFilePath, %Newb6_ExeFilePath%
RefNewb6_Label:
Gui, Submit, NoHide
If Newb6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newb6_OverrideText
	guicontrol, Show, Newb6_OverrideLabel
	guicontrol, Show, Newb6_ExeFilePathButton
	guicontrol, Show, Newb6_ExeFilePath
	guicontrol, Hide, Newb6_SendKeystroke
	guicontrol, Hide, Newb6_SendKeystrokeText
	guicontrol, Hide, Newb6_MBCtrl
	guicontrol, Hide, Newb6_MBAlt
	guicontrol, Hide, Newb6_MBShift
	guicontrol, Hide, Newb6_MBDrag
	}
If Newb6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newb6_OverrideText
	guicontrol, Show, Newb6_OverrideLabel
	guicontrol, Show, Newb6_SendKeystroke
	guicontrol, Show, Newb6_SendKeystrokeText
	guicontrol, Hide, Newb6_ExeFilePathButton
	guicontrol, Hide, Newb6_ExeFilePath
	guicontrol, Hide, Newb6_MBCtrl
	guicontrol, Hide, Newb6_MBAlt
	guicontrol, Hide, Newb6_MBShift
	guicontrol, Hide, Newb6_MBDrag
	}
If Newb6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newb6_OverrideText
	guicontrol, Show, Newb6_OverrideLabel
	guicontrol, Hide, Newb6_SendKeystroke
	guicontrol, Hide, Newb6_SendKeystrokeText
	guicontrol, Hide, Newb6_ExeFilePathButton
	guicontrol, Hide, Newb6_ExeFilePath
	guicontrol, Show, Newb6_MBCtrl
	guicontrol, Show, Newb6_MBAlt
	guicontrol, Show, Newb6_MBShift
	guicontrol, Show, Newb6_MBDrag
	}
If Newb6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newb6_OverrideText
	guicontrol, Hide, Newb6_OverrideLabel
	guicontrol, Hide, Newb6_SendKeystroke
	guicontrol, Hide, Newb6_SendKeystrokeText
	guicontrol, Hide, Newb6_ExeFilePathButton
	guicontrol, Hide, Newb6_ExeFilePath
	guicontrol, Hide, Newb6_MBCtrl
	guicontrol, Hide, Newb6_MBAlt
	guicontrol, Hide, Newb6_MBShift
	guicontrol, Hide, Newb6_MBDrag
	}
FileReadLine, isotextNewb6_Label,%A_ScriptDir%\Resources\Functions.txt, Newb6_Label
isotextNewb6_Label := StrSplit(isotextNewb6_Label, ":")
guicontrol, , txtNewb6_Label, % isotextNewb6_Label[2]
Return

; 3384 / new addition 366 [c]+\d items
cnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newcnull_ExeFilePath, %A_ScriptDir%, %Newcnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newcnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newcnull_ExeFilePath := SubStr(Newcnull_ExeFilePath, ExeFilePathTrim)
	Newcnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newcnull_ExeFilePath
	}
guicontrol, , Newcnull_ExeFilePath, %Newcnull_ExeFilePath%
RefNewcnull_Label:
Gui, Submit, NoHide
If Newcnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newcnull_OverrideText
	guicontrol, Show, Newcnull_OverrideLabel
	guicontrol, Show, Newcnull_ExeFilePathButton
	guicontrol, Show, Newcnull_ExeFilePath
	guicontrol, Hide, Newcnull_SendKeystroke
	guicontrol, Hide, Newcnull_SendKeystrokeText
	guicontrol, Hide, Newcnull_MBCtrl
	guicontrol, Hide, Newcnull_MBAlt
	guicontrol, Hide, Newcnull_MBShift
	guicontrol, Hide, Newcnull_MBDrag
	}
If Newcnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newcnull_OverrideText
	guicontrol, Show, Newcnull_OverrideLabel
	guicontrol, Show, Newcnull_SendKeystroke
	guicontrol, Show, Newcnull_SendKeystrokeText
	guicontrol, Hide, Newcnull_ExeFilePathButton
	guicontrol, Hide, Newcnull_ExeFilePath
	guicontrol, Hide, Newcnull_MBCtrl
	guicontrol, Hide, Newcnull_MBAlt
	guicontrol, Hide, Newcnull_MBShift
	guicontrol, Hide, Newcnull_MBDrag
	}
If Newcnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newcnull_OverrideText
	guicontrol, Show, Newcnull_OverrideLabel
	guicontrol, Hide, Newcnull_SendKeystroke
	guicontrol, Hide, Newcnull_SendKeystrokeText
	guicontrol, Hide, Newcnull_ExeFilePathButton
	guicontrol, Hide, Newcnull_ExeFilePath
	guicontrol, Show, Newcnull_MBCtrl
	guicontrol, Show, Newcnull_MBAlt
	guicontrol, Show, Newcnull_MBShift
	guicontrol, Show, Newcnull_MBDrag
	}
If Newcnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newcnull_OverrideText
	guicontrol, Hide, Newcnull_OverrideLabel
	guicontrol, Hide, Newcnull_SendKeystroke
	guicontrol, Hide, Newcnull_SendKeystrokeText
	guicontrol, Hide, Newcnull_ExeFilePathButton
	guicontrol, Hide, Newcnull_ExeFilePath
	guicontrol, Hide, Newcnull_MBCtrl
	guicontrol, Hide, Newcnull_MBAlt
	guicontrol, Hide, Newcnull_MBShift
	guicontrol, Hide, Newcnull_MBDrag
	}
FileReadLine, isotextNewcnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newcnull_Label
isotextNewcnull_Label := StrSplit(isotextNewcnull_Label, ":")
guicontrol, , txtNewcnull_Label, % isotextNewcnull_Label[2]
Return



c1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc1_ExeFilePath, %A_ScriptDir%, %Newc1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc1_ExeFilePath := SubStr(Newc1_ExeFilePath, ExeFilePathTrim)
	Newc1_ExeFilePath := "%A_WorkingDir%\Resources\"Newc1_ExeFilePath
	}
guicontrol, , Newc1_ExeFilePath, %Newc1_ExeFilePath%
RefNewc1_Label:
Gui, Submit, NoHide
If Newc1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc1_OverrideText
	guicontrol, Show, Newc1_OverrideLabel
	guicontrol, Show, Newc1_ExeFilePathButton
	guicontrol, Show, Newc1_ExeFilePath
	guicontrol, Hide, Newc1_SendKeystroke
	guicontrol, Hide, Newc1_SendKeystrokeText
	guicontrol, Hide, Newc1_MBCtrl
	guicontrol, Hide, Newc1_MBAlt
	guicontrol, Hide, Newc1_MBShift
	guicontrol, Hide, Newc1_MBDrag
	}
If Newc1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc1_OverrideText
	guicontrol, Show, Newc1_OverrideLabel
	guicontrol, Show, Newc1_SendKeystroke
	guicontrol, Show, Newc1_SendKeystrokeText
	guicontrol, Hide, Newc1_ExeFilePathButton
	guicontrol, Hide, Newc1_ExeFilePath
	guicontrol, Hide, Newc1_MBCtrl
	guicontrol, Hide, Newc1_MBAlt
	guicontrol, Hide, Newc1_MBShift
	guicontrol, Hide, Newc1_MBDrag
	}
If Newc1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc1_OverrideText
	guicontrol, Show, Newc1_OverrideLabel
	guicontrol, Hide, Newc1_SendKeystroke
	guicontrol, Hide, Newc1_SendKeystrokeText
	guicontrol, Hide, Newc1_ExeFilePathButton
	guicontrol, Hide, Newc1_ExeFilePath
	guicontrol, Show, Newc1_MBCtrl
	guicontrol, Show, Newc1_MBAlt
	guicontrol, Show, Newc1_MBShift
	guicontrol, Show, Newc1_MBDrag
	}
If Newc1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc1_OverrideText
	guicontrol, Hide, Newc1_OverrideLabel
	guicontrol, Hide, Newc1_SendKeystroke
	guicontrol, Hide, Newc1_SendKeystrokeText
	guicontrol, Hide, Newc1_ExeFilePathButton
	guicontrol, Hide, Newc1_ExeFilePath
	guicontrol, Hide, Newc1_MBCtrl
	guicontrol, Hide, Newc1_MBAlt
	guicontrol, Hide, Newc1_MBShift
	guicontrol, Hide, Newc1_MBDrag
	}
FileReadLine, isotextNewc1_Label,%A_ScriptDir%\Resources\Functions.txt, Newc1_Label
isotextNewc1_Label := StrSplit(isotextNewc1_Label, ":")
guicontrol, , txtNewc1_Label, % isotextNewc1_Label[2]
Return

c2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc2_ExeFilePath, %A_ScriptDir%, %Newc2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc2_ExeFilePath := SubStr(Newc2_ExeFilePath, ExeFilePathTrim)
	Newc2_ExeFilePath := "%A_WorkingDir%\Resources\"Newc2_ExeFilePath
	}
guicontrol, , Newc2_ExeFilePath, %Newc2_ExeFilePath%
RefNewc2_Label:
Gui, Submit, NoHide
If Newc2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc2_OverrideText
	guicontrol, Show, Newc2_OverrideLabel
	guicontrol, Show, Newc2_ExeFilePathButton
	guicontrol, Show, Newc2_ExeFilePath
	guicontrol, Hide, Newc2_SendKeystroke
	guicontrol, Hide, Newc2_SendKeystrokeText
	guicontrol, Hide, Newc2_MBCtrl
	guicontrol, Hide, Newc2_MBAlt
	guicontrol, Hide, Newc2_MBShift
	guicontrol, Hide, Newc2_MBDrag
	}
If Newc2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc2_OverrideText
	guicontrol, Show, Newc2_OverrideLabel
	guicontrol, Show, Newc2_SendKeystroke
	guicontrol, Show, Newc2_SendKeystrokeText
	guicontrol, Hide, Newc2_ExeFilePathButton
	guicontrol, Hide, Newc2_ExeFilePath
	guicontrol, Hide, Newc2_MBCtrl
	guicontrol, Hide, Newc2_MBAlt
	guicontrol, Hide, Newc2_MBShift
	guicontrol, Hide, Newc2_MBDrag
	}
If Newc2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc2_OverrideText
	guicontrol, Show, Newc2_OverrideLabel
	guicontrol, Hide, Newc2_SendKeystroke
	guicontrol, Hide, Newc2_SendKeystrokeText
	guicontrol, Hide, Newc2_ExeFilePathButton
	guicontrol, Hide, Newc2_ExeFilePath
	guicontrol, Show, Newc2_MBCtrl
	guicontrol, Show, Newc2_MBAlt
	guicontrol, Show, Newc2_MBShift
	guicontrol, Show, Newc2_MBDrag
	}
If Newc2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc2_OverrideText
	guicontrol, Hide, Newc2_OverrideLabel
	guicontrol, Hide, Newc2_SendKeystroke
	guicontrol, Hide, Newc2_SendKeystrokeText
	guicontrol, Hide, Newc2_ExeFilePathButton
	guicontrol, Hide, Newc2_ExeFilePath
	guicontrol, Hide, Newc2_MBCtrl
	guicontrol, Hide, Newc2_MBAlt
	guicontrol, Hide, Newc2_MBShift
	guicontrol, Hide, Newc2_MBDrag
	}
FileReadLine, isotextNewc2_Label,%A_ScriptDir%\Resources\Functions.txt, Newc2_Label
isotextNewc2_Label := StrSplit(isotextNewc2_Label, ":")
guicontrol, , txtNewc2_Label, % isotextNewc2_Label[2]
Return

c3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc3_ExeFilePath, %A_ScriptDir%, %Newc3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc3_ExeFilePath := SubStr(Newc3_ExeFilePath, ExeFilePathTrim)
	Newc3_ExeFilePath := "%A_WorkingDir%\Resources\"Newc3_ExeFilePath
	}
guicontrol, , Newc3_ExeFilePath, %Newc3_ExeFilePath%
RefNewc3_Label:
Gui, Submit, NoHide
If Newc3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc3_OverrideText
	guicontrol, Show, Newc3_OverrideLabel
	guicontrol, Show, Newc3_ExeFilePathButton
	guicontrol, Show, Newc3_ExeFilePath
	guicontrol, Hide, Newc3_SendKeystroke
	guicontrol, Hide, Newc3_SendKeystrokeText
	guicontrol, Hide, Newc3_MBCtrl
	guicontrol, Hide, Newc3_MBAlt
	guicontrol, Hide, Newc3_MBShift
	guicontrol, Hide, Newc3_MBDrag
	}
If Newc3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc3_OverrideText
	guicontrol, Show, Newc3_OverrideLabel
	guicontrol, Show, Newc3_SendKeystroke
	guicontrol, Show, Newc3_SendKeystrokeText
	guicontrol, Hide, Newc3_ExeFilePathButton
	guicontrol, Hide, Newc3_ExeFilePath
	guicontrol, Hide, Newc3_MBCtrl
	guicontrol, Hide, Newc3_MBAlt
	guicontrol, Hide, Newc3_MBShift
	guicontrol, Hide, Newc3_MBDrag
	}
If Newc3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc3_OverrideText
	guicontrol, Show, Newc3_OverrideLabel
	guicontrol, Hide, Newc3_SendKeystroke
	guicontrol, Hide, Newc3_SendKeystrokeText
	guicontrol, Hide, Newc3_ExeFilePathButton
	guicontrol, Hide, Newc3_ExeFilePath
	guicontrol, Show, Newc3_MBCtrl
	guicontrol, Show, Newc3_MBAlt
	guicontrol, Show, Newc3_MBShift
	guicontrol, Show, Newc3_MBDrag
	}
If Newc3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc3_OverrideText
	guicontrol, Hide, Newc3_OverrideLabel
	guicontrol, Hide, Newc3_SendKeystroke
	guicontrol, Hide, Newc3_SendKeystrokeText
	guicontrol, Hide, Newc3_ExeFilePathButton
	guicontrol, Hide, Newc3_ExeFilePath
	guicontrol, Hide, Newc3_MBCtrl
	guicontrol, Hide, Newc3_MBAlt
	guicontrol, Hide, Newc3_MBShift
	guicontrol, Hide, Newc3_MBDrag
	}
FileReadLine, isotextNewc3_Label,%A_ScriptDir%\Resources\Functions.txt, Newc3_Label
isotextNewc3_Label := StrSplit(isotextNewc3_Label, ":")
guicontrol, , txtNewc3_Label, % isotextNewc3_Label[2]
Return


c4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc4_ExeFilePath, %A_ScriptDir%, %Newc4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc4_ExeFilePath := SubStr(Newc4_ExeFilePath, ExeFilePathTrim)
	Newc4_ExeFilePath := "%A_WorkingDir%\Resources\"Newc4_ExeFilePath
	}
guicontrol, , Newc4_ExeFilePath, %Newc4_ExeFilePath%
RefNewc4_Label:
Gui, Submit, NoHide
If Newc4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc4_OverrideText
	guicontrol, Show, Newc4_OverrideLabel
	guicontrol, Show, Newc4_ExeFilePathButton
	guicontrol, Show, Newc4_ExeFilePath
	guicontrol, Hide, Newc4_SendKeystroke
	guicontrol, Hide, Newc4_SendKeystrokeText
	guicontrol, Hide, Newc4_MBCtrl
	guicontrol, Hide, Newc4_MBAlt
	guicontrol, Hide, Newc4_MBShift
	guicontrol, Hide, Newc4_MBDrag
	}
If Newc4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc4_OverrideText
	guicontrol, Show, Newc4_OverrideLabel
	guicontrol, Show, Newc4_SendKeystroke
	guicontrol, Show, Newc4_SendKeystrokeText
	guicontrol, Hide, Newc4_ExeFilePathButton
	guicontrol, Hide, Newc4_ExeFilePath
	guicontrol, Hide, Newc4_MBCtrl
	guicontrol, Hide, Newc4_MBAlt
	guicontrol, Hide, Newc4_MBShift
	guicontrol, Hide, Newc4_MBDrag
	}
If Newc4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc4_OverrideText
	guicontrol, Show, Newc4_OverrideLabel
	guicontrol, Hide, Newc4_SendKeystroke
	guicontrol, Hide, Newc4_SendKeystrokeText
	guicontrol, Hide, Newc4_ExeFilePathButton
	guicontrol, Hide, Newc4_ExeFilePath
	guicontrol, Show, Newc4_MBCtrl
	guicontrol, Show, Newc4_MBAlt
	guicontrol, Show, Newc4_MBShift
	guicontrol, Show, Newc4_MBDrag
	}
If Newc4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc4_OverrideText
	guicontrol, Hide, Newc4_OverrideLabel
	guicontrol, Hide, Newc4_SendKeystroke
	guicontrol, Hide, Newc4_SendKeystrokeText
	guicontrol, Hide, Newc4_ExeFilePathButton
	guicontrol, Hide, Newc4_ExeFilePath
	guicontrol, Hide, Newc4_MBCtrl
	guicontrol, Hide, Newc4_MBAlt
	guicontrol, Hide, Newc4_MBShift
	guicontrol, Hide, Newc4_MBDrag
	}
FileReadLine, isotextNewc4_Label,%A_ScriptDir%\Resources\Functions.txt, Newc4_Label
isotextNewc4_Label := StrSplit(isotextNewc4_Label, ":")
guicontrol, , txtNewc4_Label, % isotextNewc4_Label[2]
Return

c5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc5_ExeFilePath, %A_ScriptDir%, %Newc5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc5_ExeFilePath := SubStr(Newc5_ExeFilePath, ExeFilePathTrim)
	Newc5_ExeFilePath := "%A_WorkingDir%\Resources\"Newc5_ExeFilePath
	}
guicontrol, , Newc5_ExeFilePath, %Newc5_ExeFilePath%
RefNewc5_Label:
Gui, Submit, NoHide
If Newc5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc5_OverrideText
	guicontrol, Show, Newc5_OverrideLabel
	guicontrol, Show, Newc5_ExeFilePathButton
	guicontrol, Show, Newc5_ExeFilePath
	guicontrol, Hide, Newc5_SendKeystroke
	guicontrol, Hide, Newc5_SendKeystrokeText
	guicontrol, Hide, Newc5_MBCtrl
	guicontrol, Hide, Newc5_MBAlt
	guicontrol, Hide, Newc5_MBShift
	guicontrol, Hide, Newc5_MBDrag
	}
If Newc5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc5_OverrideText
	guicontrol, Show, Newc5_OverrideLabel
	guicontrol, Show, Newc5_SendKeystroke
	guicontrol, Show, Newc5_SendKeystrokeText
	guicontrol, Hide, Newc5_ExeFilePathButton
	guicontrol, Hide, Newc5_ExeFilePath
	guicontrol, Hide, Newc5_MBCtrl
	guicontrol, Hide, Newc5_MBAlt
	guicontrol, Hide, Newc5_MBShift
	guicontrol, Hide, Newc5_MBDrag
	}
If Newc5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc5_OverrideText
	guicontrol, Show, Newc5_OverrideLabel
	guicontrol, Hide, Newc5_SendKeystroke
	guicontrol, Hide, Newc5_SendKeystrokeText
	guicontrol, Hide, Newc5_ExeFilePathButton
	guicontrol, Hide, Newc5_ExeFilePath
	guicontrol, Show, Newc5_MBCtrl
	guicontrol, Show, Newc5_MBAlt
	guicontrol, Show, Newc5_MBShift
	guicontrol, Show, Newc5_MBDrag
	}
If Newc5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc5_OverrideText
	guicontrol, Hide, Newc5_OverrideLabel
	guicontrol, Hide, Newc5_SendKeystroke
	guicontrol, Hide, Newc5_SendKeystrokeText
	guicontrol, Hide, Newc5_ExeFilePathButton
	guicontrol, Hide, Newc5_ExeFilePath
	guicontrol, Hide, Newc5_MBCtrl
	guicontrol, Hide, Newc5_MBAlt
	guicontrol, Hide, Newc5_MBShift
	guicontrol, Hide, Newc5_MBDrag
	}
FileReadLine, isotextNewc5_Label,%A_ScriptDir%\Resources\Functions.txt, Newc5_Label
isotextNewc5_Label := StrSplit(isotextNewc5_Label, ":")
guicontrol, , txtNewc5_Label, % isotextNewc5_Label[2]
Return

c6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newc6_ExeFilePath, %A_ScriptDir%, %Newc6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newc6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newc6_ExeFilePath := SubStr(Newc6_ExeFilePath, ExeFilePathTrim)
	Newc6_ExeFilePath := "%A_WorkingDir%\Resources\"Newc6_ExeFilePath
	}
guicontrol, , Newc6_ExeFilePath, %Newc6_ExeFilePath%
RefNewc6_Label:
Gui, Submit, NoHide
If Newc6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newc6_OverrideText
	guicontrol, Show, Newc6_OverrideLabel
	guicontrol, Show, Newc6_ExeFilePathButton
	guicontrol, Show, Newc6_ExeFilePath
	guicontrol, Hide, Newc6_SendKeystroke
	guicontrol, Hide, Newc6_SendKeystrokeText
	guicontrol, Hide, Newc6_MBCtrl
	guicontrol, Hide, Newc6_MBAlt
	guicontrol, Hide, Newc6_MBShift
	guicontrol, Hide, Newc6_MBDrag
	}
If Newc6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newc6_OverrideText
	guicontrol, Show, Newc6_OverrideLabel
	guicontrol, Show, Newc6_SendKeystroke
	guicontrol, Show, Newc6_SendKeystrokeText
	guicontrol, Hide, Newc6_ExeFilePathButton
	guicontrol, Hide, Newc6_ExeFilePath
	guicontrol, Hide, Newc6_MBCtrl
	guicontrol, Hide, Newc6_MBAlt
	guicontrol, Hide, Newc6_MBShift
	guicontrol, Hide, Newc6_MBDrag
	}
If Newc6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newc6_OverrideText
	guicontrol, Show, Newc6_OverrideLabel
	guicontrol, Hide, Newc6_SendKeystroke
	guicontrol, Hide, Newc6_SendKeystrokeText
	guicontrol, Hide, Newc6_ExeFilePathButton
	guicontrol, Hide, Newc6_ExeFilePath
	guicontrol, Show, Newc6_MBCtrl
	guicontrol, Show, Newc6_MBAlt
	guicontrol, Show, Newc6_MBShift
	guicontrol, Show, Newc6_MBDrag
	}
If Newc6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newc6_OverrideText
	guicontrol, Hide, Newc6_OverrideLabel
	guicontrol, Hide, Newc6_SendKeystroke
	guicontrol, Hide, Newc6_SendKeystrokeText
	guicontrol, Hide, Newc6_ExeFilePathButton
	guicontrol, Hide, Newc6_ExeFilePath
	guicontrol, Hide, Newc6_MBCtrl
	guicontrol, Hide, Newc6_MBAlt
	guicontrol, Hide, Newc6_MBShift
	guicontrol, Hide, Newc6_MBDrag
	}
FileReadLine, isotextNewc6_Label,%A_ScriptDir%\Resources\Functions.txt, Newc6_Label
isotextNewc6_Label := StrSplit(isotextNewc6_Label, ":")
guicontrol, , txtNewc6_Label, % isotextNewc6_Label[2]
Return



dnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newdnull_ExeFilePath, %A_ScriptDir%, %Newdnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newdnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newdnull_ExeFilePath := SubStr(Newdnull_ExeFilePath, ExeFilePathTrim)
	Newdnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newdnull_ExeFilePath
	}
guicontrol, , Newdnull_ExeFilePath, %Newdnull_ExeFilePath%
RefNewdnull_Label:
Gui, Submit, NoHide
If Newdnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newdnull_OverrideText
	guicontrol, Show, Newdnull_OverrideLabel
	guicontrol, Show, Newdnull_ExeFilePathButton
	guicontrol, Show, Newdnull_ExeFilePath
	guicontrol, Hide, Newdnull_SendKeystroke
	guicontrol, Hide, Newdnull_SendKeystrokeText
	guicontrol, Hide, Newdnull_MBCtrl
	guicontrol, Hide, Newdnull_MBAlt
	guicontrol, Hide, Newdnull_MBShift
	guicontrol, Hide, Newdnull_MBDrag
	}
If Newdnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newdnull_OverrideText
	guicontrol, Show, Newdnull_OverrideLabel
	guicontrol, Show, Newdnull_SendKeystroke
	guicontrol, Show, Newdnull_SendKeystrokeText
	guicontrol, Hide, Newdnull_ExeFilePathButton
	guicontrol, Hide, Newdnull_ExeFilePath
	guicontrol, Hide, Newdnull_MBCtrl
	guicontrol, Hide, Newdnull_MBAlt
	guicontrol, Hide, Newdnull_MBShift
	guicontrol, Hide, Newdnull_MBDrag
	}
If Newdnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newdnull_OverrideText
	guicontrol, Show, Newdnull_OverrideLabel
	guicontrol, Hide, Newdnull_SendKeystroke
	guicontrol, Hide, Newdnull_SendKeystrokeText
	guicontrol, Hide, Newdnull_ExeFilePathButton
	guicontrol, Hide, Newdnull_ExeFilePath
	guicontrol, Show, Newdnull_MBCtrl
	guicontrol, Show, Newdnull_MBAlt
	guicontrol, Show, Newdnull_MBShift
	guicontrol, Show, Newdnull_MBDrag
	}
If Newdnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newdnull_OverrideText
	guicontrol, Hide, Newdnull_OverrideLabel
	guicontrol, Hide, Newdnull_SendKeystroke
	guicontrol, Hide, Newdnull_SendKeystrokeText
	guicontrol, Hide, Newdnull_ExeFilePathButton
	guicontrol, Hide, Newdnull_ExeFilePath
	guicontrol, Hide, Newdnull_MBCtrl
	guicontrol, Hide, Newdnull_MBAlt
	guicontrol, Hide, Newdnull_MBShift
	guicontrol, Hide, Newdnull_MBDrag
	}
FileReadLine, isotextNewdnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newdnull_Label
isotextNewdnull_Label := StrSplit(isotextNewdnull_Label, ":")
guicontrol, , txtNewdnull_Label, % isotextNewdnull_Label[2]
Return



d1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd1_ExeFilePath, %A_ScriptDir%, %Newd1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd1_ExeFilePath := SubStr(Newd1_ExeFilePath, ExeFilePathTrim)
	Newd1_ExeFilePath := "%A_WorkingDir%\Resources\"Newd1_ExeFilePath
	}
guicontrol, , Newd1_ExeFilePath, %Newd1_ExeFilePath%
RefNewd1_Label:
Gui, Submit, NoHide
If Newd1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd1_OverrideText
	guicontrol, Show, Newd1_OverrideLabel
	guicontrol, Show, Newd1_ExeFilePathButton
	guicontrol, Show, Newd1_ExeFilePath
	guicontrol, Hide, Newd1_SendKeystroke
	guicontrol, Hide, Newd1_SendKeystrokeText
	guicontrol, Hide, Newd1_MBCtrl
	guicontrol, Hide, Newd1_MBAlt
	guicontrol, Hide, Newd1_MBShift
	guicontrol, Hide, Newd1_MBDrag
	}
If Newd1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd1_OverrideText
	guicontrol, Show, Newd1_OverrideLabel
	guicontrol, Show, Newd1_SendKeystroke
	guicontrol, Show, Newd1_SendKeystrokeText
	guicontrol, Hide, Newd1_ExeFilePathButton
	guicontrol, Hide, Newd1_ExeFilePath
	guicontrol, Hide, Newd1_MBCtrl
	guicontrol, Hide, Newd1_MBAlt
	guicontrol, Hide, Newd1_MBShift
	guicontrol, Hide, Newd1_MBDrag
	}
If Newd1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd1_OverrideText
	guicontrol, Show, Newd1_OverrideLabel
	guicontrol, Hide, Newd1_SendKeystroke
	guicontrol, Hide, Newd1_SendKeystrokeText
	guicontrol, Hide, Newd1_ExeFilePathButton
	guicontrol, Hide, Newd1_ExeFilePath
	guicontrol, Show, Newd1_MBCtrl
	guicontrol, Show, Newd1_MBAlt
	guicontrol, Show, Newd1_MBShift
	guicontrol, Show, Newd1_MBDrag
	}
If Newd1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd1_OverrideText
	guicontrol, Hide, Newd1_OverrideLabel
	guicontrol, Hide, Newd1_SendKeystroke
	guicontrol, Hide, Newd1_SendKeystrokeText
	guicontrol, Hide, Newd1_ExeFilePathButton
	guicontrol, Hide, Newd1_ExeFilePath
	guicontrol, Hide, Newd1_MBCtrl
	guicontrol, Hide, Newd1_MBAlt
	guicontrol, Hide, Newd1_MBShift
	guicontrol, Hide, Newd1_MBDrag
	}
FileReadLine, isotextNewd1_Label,%A_ScriptDir%\Resources\Functions.txt, Newd1_Label
isotextNewd1_Label := StrSplit(isotextNewd1_Label, ":")
guicontrol, , txtNewd1_Label, % isotextNewd1_Label[2]
Return

d2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd2_ExeFilePath, %A_ScriptDir%, %Newd2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd2_ExeFilePath := SubStr(Newd2_ExeFilePath, ExeFilePathTrim)
	Newd2_ExeFilePath := "%A_WorkingDir%\Resources\"Newd2_ExeFilePath
	}
guicontrol, , Newd2_ExeFilePath, %Newd2_ExeFilePath%
RefNewd2_Label:
Gui, Submit, NoHide
If Newd2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd2_OverrideText
	guicontrol, Show, Newd2_OverrideLabel
	guicontrol, Show, Newd2_ExeFilePathButton
	guicontrol, Show, Newd2_ExeFilePath
	guicontrol, Hide, Newd2_SendKeystroke
	guicontrol, Hide, Newd2_SendKeystrokeText
	guicontrol, Hide, Newd2_MBCtrl
	guicontrol, Hide, Newd2_MBAlt
	guicontrol, Hide, Newd2_MBShift
	guicontrol, Hide, Newd2_MBDrag
	}
If Newd2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd2_OverrideText
	guicontrol, Show, Newd2_OverrideLabel
	guicontrol, Show, Newd2_SendKeystroke
	guicontrol, Show, Newd2_SendKeystrokeText
	guicontrol, Hide, Newd2_ExeFilePathButton
	guicontrol, Hide, Newd2_ExeFilePath
	guicontrol, Hide, Newd2_MBCtrl
	guicontrol, Hide, Newd2_MBAlt
	guicontrol, Hide, Newd2_MBShift
	guicontrol, Hide, Newd2_MBDrag
	}
If Newd2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd2_OverrideText
	guicontrol, Show, Newd2_OverrideLabel
	guicontrol, Hide, Newd2_SendKeystroke
	guicontrol, Hide, Newd2_SendKeystrokeText
	guicontrol, Hide, Newd2_ExeFilePathButton
	guicontrol, Hide, Newd2_ExeFilePath
	guicontrol, Show, Newd2_MBCtrl
	guicontrol, Show, Newd2_MBAlt
	guicontrol, Show, Newd2_MBShift
	guicontrol, Show, Newd2_MBDrag
	}
If Newd2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd2_OverrideText
	guicontrol, Hide, Newd2_OverrideLabel
	guicontrol, Hide, Newd2_SendKeystroke
	guicontrol, Hide, Newd2_SendKeystrokeText
	guicontrol, Hide, Newd2_ExeFilePathButton
	guicontrol, Hide, Newd2_ExeFilePath
	guicontrol, Hide, Newd2_MBCtrl
	guicontrol, Hide, Newd2_MBAlt
	guicontrol, Hide, Newd2_MBShift
	guicontrol, Hide, Newd2_MBDrag
	}
FileReadLine, isotextNewd2_Label,%A_ScriptDir%\Resources\Functions.txt, Newd2_Label
isotextNewd2_Label := StrSplit(isotextNewd2_Label, ":")
guicontrol, , txtNewd2_Label, % isotextNewd2_Label[2]
Return

d3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd3_ExeFilePath, %A_ScriptDir%, %Newd3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd3_ExeFilePath := SubStr(Newd3_ExeFilePath, ExeFilePathTrim)
	Newd3_ExeFilePath := "%A_WorkingDir%\Resources\"Newd3_ExeFilePath
	}
guicontrol, , Newd3_ExeFilePath, %Newd3_ExeFilePath%
RefNewd3_Label:
Gui, Submit, NoHide
If Newd3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd3_OverrideText
	guicontrol, Show, Newd3_OverrideLabel
	guicontrol, Show, Newd3_ExeFilePathButton
	guicontrol, Show, Newd3_ExeFilePath
	guicontrol, Hide, Newd3_SendKeystroke
	guicontrol, Hide, Newd3_SendKeystrokeText
	guicontrol, Hide, Newd3_MBCtrl
	guicontrol, Hide, Newd3_MBAlt
	guicontrol, Hide, Newd3_MBShift
	guicontrol, Hide, Newd3_MBDrag
	}
If Newd3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd3_OverrideText
	guicontrol, Show, Newd3_OverrideLabel
	guicontrol, Show, Newd3_SendKeystroke
	guicontrol, Show, Newd3_SendKeystrokeText
	guicontrol, Hide, Newd3_ExeFilePathButton
	guicontrol, Hide, Newd3_ExeFilePath
	guicontrol, Hide, Newd3_MBCtrl
	guicontrol, Hide, Newd3_MBAlt
	guicontrol, Hide, Newd3_MBShift
	guicontrol, Hide, Newd3_MBDrag
	}
If Newd3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd3_OverrideText
	guicontrol, Show, Newd3_OverrideLabel
	guicontrol, Hide, Newd3_SendKeystroke
	guicontrol, Hide, Newd3_SendKeystrokeText
	guicontrol, Hide, Newd3_ExeFilePathButton
	guicontrol, Hide, Newd3_ExeFilePath
	guicontrol, Show, Newd3_MBCtrl
	guicontrol, Show, Newd3_MBAlt
	guicontrol, Show, Newd3_MBShift
	guicontrol, Show, Newd3_MBDrag
	}
If Newd3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd3_OverrideText
	guicontrol, Hide, Newd3_OverrideLabel
	guicontrol, Hide, Newd3_SendKeystroke
	guicontrol, Hide, Newd3_SendKeystrokeText
	guicontrol, Hide, Newd3_ExeFilePathButton
	guicontrol, Hide, Newd3_ExeFilePath
	guicontrol, Hide, Newd3_MBCtrl
	guicontrol, Hide, Newd3_MBAlt
	guicontrol, Hide, Newd3_MBShift
	guicontrol, Hide, Newd3_MBDrag
	}
FileReadLine, isotextNewd3_Label,%A_ScriptDir%\Resources\Functions.txt, Newd3_Label
isotextNewd3_Label := StrSplit(isotextNewd3_Label, ":")
guicontrol, , txtNewd3_Label, % isotextNewd3_Label[2]
Return


d4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd4_ExeFilePath, %A_ScriptDir%, %Newd4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd4_ExeFilePath := SubStr(Newd4_ExeFilePath, ExeFilePathTrim)
	Newd4_ExeFilePath := "%A_WorkingDir%\Resources\"Newd4_ExeFilePath
	}
guicontrol, , Newd4_ExeFilePath, %Newd4_ExeFilePath%
RefNewd4_Label:
Gui, Submit, NoHide
If Newd4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd4_OverrideText
	guicontrol, Show, Newd4_OverrideLabel
	guicontrol, Show, Newd4_ExeFilePathButton
	guicontrol, Show, Newd4_ExeFilePath
	guicontrol, Hide, Newd4_SendKeystroke
	guicontrol, Hide, Newd4_SendKeystrokeText
	guicontrol, Hide, Newd4_MBCtrl
	guicontrol, Hide, Newd4_MBAlt
	guicontrol, Hide, Newd4_MBShift
	guicontrol, Hide, Newd4_MBDrag
	}
If Newd4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd4_OverrideText
	guicontrol, Show, Newd4_OverrideLabel
	guicontrol, Show, Newd4_SendKeystroke
	guicontrol, Show, Newd4_SendKeystrokeText
	guicontrol, Hide, Newd4_ExeFilePathButton
	guicontrol, Hide, Newd4_ExeFilePath
	guicontrol, Hide, Newd4_MBCtrl
	guicontrol, Hide, Newd4_MBAlt
	guicontrol, Hide, Newd4_MBShift
	guicontrol, Hide, Newd4_MBDrag
	}
If Newd4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd4_OverrideText
	guicontrol, Show, Newd4_OverrideLabel
	guicontrol, Hide, Newd4_SendKeystroke
	guicontrol, Hide, Newd4_SendKeystrokeText
	guicontrol, Hide, Newd4_ExeFilePathButton
	guicontrol, Hide, Newd4_ExeFilePath
	guicontrol, Show, Newd4_MBCtrl
	guicontrol, Show, Newd4_MBAlt
	guicontrol, Show, Newd4_MBShift
	guicontrol, Show, Newd4_MBDrag
	}
If Newd4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd4_OverrideText
	guicontrol, Hide, Newd4_OverrideLabel
	guicontrol, Hide, Newd4_SendKeystroke
	guicontrol, Hide, Newd4_SendKeystrokeText
	guicontrol, Hide, Newd4_ExeFilePathButton
	guicontrol, Hide, Newd4_ExeFilePath
	guicontrol, Hide, Newd4_MBCtrl
	guicontrol, Hide, Newd4_MBAlt
	guicontrol, Hide, Newd4_MBShift
	guicontrol, Hide, Newd4_MBDrag
	}
FileReadLine, isotextNewd4_Label,%A_ScriptDir%\Resources\Functions.txt, Newd4_Label
isotextNewd4_Label := StrSplit(isotextNewd4_Label, ":")
guicontrol, , txtNewd4_Label, % isotextNewd4_Label[2]
Return

d5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd5_ExeFilePath, %A_ScriptDir%, %Newd5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd5_ExeFilePath := SubStr(Newd5_ExeFilePath, ExeFilePathTrim)
	Newd5_ExeFilePath := "%A_WorkingDir%\Resources\"Newd5_ExeFilePath
	}
guicontrol, , Newd5_ExeFilePath, %Newd5_ExeFilePath%
RefNewd5_Label:
Gui, Submit, NoHide
If Newd5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd5_OverrideText
	guicontrol, Show, Newd5_OverrideLabel
	guicontrol, Show, Newd5_ExeFilePathButton
	guicontrol, Show, Newd5_ExeFilePath
	guicontrol, Hide, Newd5_SendKeystroke
	guicontrol, Hide, Newd5_SendKeystrokeText
	guicontrol, Hide, Newd5_MBCtrl
	guicontrol, Hide, Newd5_MBAlt
	guicontrol, Hide, Newd5_MBShift
	guicontrol, Hide, Newd5_MBDrag
	}
If Newd5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd5_OverrideText
	guicontrol, Show, Newd5_OverrideLabel
	guicontrol, Show, Newd5_SendKeystroke
	guicontrol, Show, Newd5_SendKeystrokeText
	guicontrol, Hide, Newd5_ExeFilePathButton
	guicontrol, Hide, Newd5_ExeFilePath
	guicontrol, Hide, Newd5_MBCtrl
	guicontrol, Hide, Newd5_MBAlt
	guicontrol, Hide, Newd5_MBShift
	guicontrol, Hide, Newd5_MBDrag
	}
If Newd5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd5_OverrideText
	guicontrol, Show, Newd5_OverrideLabel
	guicontrol, Hide, Newd5_SendKeystroke
	guicontrol, Hide, Newd5_SendKeystrokeText
	guicontrol, Hide, Newd5_ExeFilePathButton
	guicontrol, Hide, Newd5_ExeFilePath
	guicontrol, Show, Newd5_MBCtrl
	guicontrol, Show, Newd5_MBAlt
	guicontrol, Show, Newd5_MBShift
	guicontrol, Show, Newd5_MBDrag
	}
If Newd5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd5_OverrideText
	guicontrol, Hide, Newd5_OverrideLabel
	guicontrol, Hide, Newd5_SendKeystroke
	guicontrol, Hide, Newd5_SendKeystrokeText
	guicontrol, Hide, Newd5_ExeFilePathButton
	guicontrol, Hide, Newd5_ExeFilePath
	guicontrol, Hide, Newd5_MBCtrl
	guicontrol, Hide, Newd5_MBAlt
	guicontrol, Hide, Newd5_MBShift
	guicontrol, Hide, Newd5_MBDrag
	}
FileReadLine, isotextNewd5_Label,%A_ScriptDir%\Resources\Functions.txt, Newd5_Label
isotextNewd5_Label := StrSplit(isotextNewd5_Label, ":")
guicontrol, , txtNewd5_Label, % isotextNewd5_Label[2]
Return

d6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newd6_ExeFilePath, %A_ScriptDir%, %Newd6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newd6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newd6_ExeFilePath := SubStr(Newd6_ExeFilePath, ExeFilePathTrim)
	Newd6_ExeFilePath := "%A_WorkingDir%\Resources\"Newd6_ExeFilePath
	}
guicontrol, , Newd6_ExeFilePath, %Newd6_ExeFilePath%
RefNewd6_Label:
Gui, Submit, NoHide
If Newd6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newd6_OverrideText
	guicontrol, Show, Newd6_OverrideLabel
	guicontrol, Show, Newd6_ExeFilePathButton
	guicontrol, Show, Newd6_ExeFilePath
	guicontrol, Hide, Newd6_SendKeystroke
	guicontrol, Hide, Newd6_SendKeystrokeText
	guicontrol, Hide, Newd6_MBCtrl
	guicontrol, Hide, Newd6_MBAlt
	guicontrol, Hide, Newd6_MBShift
	guicontrol, Hide, Newd6_MBDrag
	}
If Newd6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newd6_OverrideText
	guicontrol, Show, Newd6_OverrideLabel
	guicontrol, Show, Newd6_SendKeystroke
	guicontrol, Show, Newd6_SendKeystrokeText
	guicontrol, Hide, Newd6_ExeFilePathButton
	guicontrol, Hide, Newd6_ExeFilePath
	guicontrol, Hide, Newd6_MBCtrl
	guicontrol, Hide, Newd6_MBAlt
	guicontrol, Hide, Newd6_MBShift
	guicontrol, Hide, Newd6_MBDrag
	}
If Newd6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newd6_OverrideText
	guicontrol, Show, Newd6_OverrideLabel
	guicontrol, Hide, Newd6_SendKeystroke
	guicontrol, Hide, Newd6_SendKeystrokeText
	guicontrol, Hide, Newd6_ExeFilePathButton
	guicontrol, Hide, Newd6_ExeFilePath
	guicontrol, Show, Newd6_MBCtrl
	guicontrol, Show, Newd6_MBAlt
	guicontrol, Show, Newd6_MBShift
	guicontrol, Show, Newd6_MBDrag
	}
If Newd6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newd6_OverrideText
	guicontrol, Hide, Newd6_OverrideLabel
	guicontrol, Hide, Newd6_SendKeystroke
	guicontrol, Hide, Newd6_SendKeystrokeText
	guicontrol, Hide, Newd6_ExeFilePathButton
	guicontrol, Hide, Newd6_ExeFilePath
	guicontrol, Hide, Newd6_MBCtrl
	guicontrol, Hide, Newd6_MBAlt
	guicontrol, Hide, Newd6_MBShift
	guicontrol, Hide, Newd6_MBDrag
	}
FileReadLine, isotextNewd6_Label,%A_ScriptDir%\Resources\Functions.txt, Newd6_Label
isotextNewd6_Label := StrSplit(isotextNewd6_Label, ":")
guicontrol, , txtNewd6_Label, % isotextNewd6_Label[2]
Return



enull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newenull_ExeFilePath, %A_ScriptDir%, %Newenull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newenull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newenull_ExeFilePath := SubStr(Newenull_ExeFilePath, ExeFilePathTrim)
	Newenull_ExeFilePath := "%A_WorkingDir%\Resources\"Newenull_ExeFilePath
	}
guicontrol, , Newenull_ExeFilePath, %Newenull_ExeFilePath%
RefNewenull_Label:
Gui, Submit, NoHide
If Newenull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newenull_OverrideText
	guicontrol, Show, Newenull_OverrideLabel
	guicontrol, Show, Newenull_ExeFilePathButton
	guicontrol, Show, Newenull_ExeFilePath
	guicontrol, Hide, Newenull_SendKeystroke
	guicontrol, Hide, Newenull_SendKeystrokeText
	guicontrol, Hide, Newenull_MBCtrl
	guicontrol, Hide, Newenull_MBAlt
	guicontrol, Hide, Newenull_MBShift
	guicontrol, Hide, Newenull_MBDrag
	}
If Newenull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newenull_OverrideText
	guicontrol, Show, Newenull_OverrideLabel
	guicontrol, Show, Newenull_SendKeystroke
	guicontrol, Show, Newenull_SendKeystrokeText
	guicontrol, Hide, Newenull_ExeFilePathButton
	guicontrol, Hide, Newenull_ExeFilePath
	guicontrol, Hide, Newenull_MBCtrl
	guicontrol, Hide, Newenull_MBAlt
	guicontrol, Hide, Newenull_MBShift
	guicontrol, Hide, Newenull_MBDrag
	}
If Newenull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newenull_OverrideText
	guicontrol, Show, Newenull_OverrideLabel
	guicontrol, Hide, Newenull_SendKeystroke
	guicontrol, Hide, Newenull_SendKeystrokeText
	guicontrol, Hide, Newenull_ExeFilePathButton
	guicontrol, Hide, Newenull_ExeFilePath
	guicontrol, Show, Newenull_MBCtrl
	guicontrol, Show, Newenull_MBAlt
	guicontrol, Show, Newenull_MBShift
	guicontrol, Show, Newenull_MBDrag
	}
If Newenull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newenull_OverrideText
	guicontrol, Hide, Newenull_OverrideLabel
	guicontrol, Hide, Newenull_SendKeystroke
	guicontrol, Hide, Newenull_SendKeystrokeText
	guicontrol, Hide, Newenull_ExeFilePathButton
	guicontrol, Hide, Newenull_ExeFilePath
	guicontrol, Hide, Newenull_MBCtrl
	guicontrol, Hide, Newenull_MBAlt
	guicontrol, Hide, Newenull_MBShift
	guicontrol, Hide, Newenull_MBDrag
	}
FileReadLine, isotextNewenull_Label,%A_ScriptDir%\Resources\Functions.txt, Newenull_Label
isotextNewenull_Label := StrSplit(isotextNewenull_Label, ":")
guicontrol, , txtNewenull_Label, % isotextNewenull_Label[2]
Return



e1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe1_ExeFilePath, %A_ScriptDir%, %Newe1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe1_ExeFilePath := SubStr(Newe1_ExeFilePath, ExeFilePathTrim)
	Newe1_ExeFilePath := "%A_WorkingDir%\Resources\"Newe1_ExeFilePath
	}
guicontrol, , Newe1_ExeFilePath, %Newe1_ExeFilePath%
RefNewe1_Label:
Gui, Submit, NoHide
If Newe1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe1_OverrideText
	guicontrol, Show, Newe1_OverrideLabel
	guicontrol, Show, Newe1_ExeFilePathButton
	guicontrol, Show, Newe1_ExeFilePath
	guicontrol, Hide, Newe1_SendKeystroke
	guicontrol, Hide, Newe1_SendKeystrokeText
	guicontrol, Hide, Newe1_MBCtrl
	guicontrol, Hide, Newe1_MBAlt
	guicontrol, Hide, Newe1_MBShift
	guicontrol, Hide, Newe1_MBDrag
	}
If Newe1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe1_OverrideText
	guicontrol, Show, Newe1_OverrideLabel
	guicontrol, Show, Newe1_SendKeystroke
	guicontrol, Show, Newe1_SendKeystrokeText
	guicontrol, Hide, Newe1_ExeFilePathButton
	guicontrol, Hide, Newe1_ExeFilePath
	guicontrol, Hide, Newe1_MBCtrl
	guicontrol, Hide, Newe1_MBAlt
	guicontrol, Hide, Newe1_MBShift
	guicontrol, Hide, Newe1_MBDrag
	}
If Newe1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe1_OverrideText
	guicontrol, Show, Newe1_OverrideLabel
	guicontrol, Hide, Newe1_SendKeystroke
	guicontrol, Hide, Newe1_SendKeystrokeText
	guicontrol, Hide, Newe1_ExeFilePathButton
	guicontrol, Hide, Newe1_ExeFilePath
	guicontrol, Show, Newe1_MBCtrl
	guicontrol, Show, Newe1_MBAlt
	guicontrol, Show, Newe1_MBShift
	guicontrol, Show, Newe1_MBDrag
	}
If Newe1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe1_OverrideText
	guicontrol, Hide, Newe1_OverrideLabel
	guicontrol, Hide, Newe1_SendKeystroke
	guicontrol, Hide, Newe1_SendKeystrokeText
	guicontrol, Hide, Newe1_ExeFilePathButton
	guicontrol, Hide, Newe1_ExeFilePath
	guicontrol, Hide, Newe1_MBCtrl
	guicontrol, Hide, Newe1_MBAlt
	guicontrol, Hide, Newe1_MBShift
	guicontrol, Hide, Newe1_MBDrag
	}
FileReadLine, isotextNewe1_Label,%A_ScriptDir%\Resources\Functions.txt, Newe1_Label
isotextNewe1_Label := StrSplit(isotextNewe1_Label, ":")
guicontrol, , txtNewe1_Label, % isotextNewe1_Label[2]
Return

e2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe2_ExeFilePath, %A_ScriptDir%, %Newe2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe2_ExeFilePath := SubStr(Newe2_ExeFilePath, ExeFilePathTrim)
	Newe2_ExeFilePath := "%A_WorkingDir%\Resources\"Newe2_ExeFilePath
	}
guicontrol, , Newe2_ExeFilePath, %Newe2_ExeFilePath%
RefNewe2_Label:
Gui, Submit, NoHide
If Newe2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe2_OverrideText
	guicontrol, Show, Newe2_OverrideLabel
	guicontrol, Show, Newe2_ExeFilePathButton
	guicontrol, Show, Newe2_ExeFilePath
	guicontrol, Hide, Newe2_SendKeystroke
	guicontrol, Hide, Newe2_SendKeystrokeText
	guicontrol, Hide, Newe2_MBCtrl
	guicontrol, Hide, Newe2_MBAlt
	guicontrol, Hide, Newe2_MBShift
	guicontrol, Hide, Newe2_MBDrag
	}
If Newe2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe2_OverrideText
	guicontrol, Show, Newe2_OverrideLabel
	guicontrol, Show, Newe2_SendKeystroke
	guicontrol, Show, Newe2_SendKeystrokeText
	guicontrol, Hide, Newe2_ExeFilePathButton
	guicontrol, Hide, Newe2_ExeFilePath
	guicontrol, Hide, Newe2_MBCtrl
	guicontrol, Hide, Newe2_MBAlt
	guicontrol, Hide, Newe2_MBShift
	guicontrol, Hide, Newe2_MBDrag
	}
If Newe2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe2_OverrideText
	guicontrol, Show, Newe2_OverrideLabel
	guicontrol, Hide, Newe2_SendKeystroke
	guicontrol, Hide, Newe2_SendKeystrokeText
	guicontrol, Hide, Newe2_ExeFilePathButton
	guicontrol, Hide, Newe2_ExeFilePath
	guicontrol, Show, Newe2_MBCtrl
	guicontrol, Show, Newe2_MBAlt
	guicontrol, Show, Newe2_MBShift
	guicontrol, Show, Newe2_MBDrag
	}
If Newe2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe2_OverrideText
	guicontrol, Hide, Newe2_OverrideLabel
	guicontrol, Hide, Newe2_SendKeystroke
	guicontrol, Hide, Newe2_SendKeystrokeText
	guicontrol, Hide, Newe2_ExeFilePathButton
	guicontrol, Hide, Newe2_ExeFilePath
	guicontrol, Hide, Newe2_MBCtrl
	guicontrol, Hide, Newe2_MBAlt
	guicontrol, Hide, Newe2_MBShift
	guicontrol, Hide, Newe2_MBDrag
	}
FileReadLine, isotextNewe2_Label,%A_ScriptDir%\Resources\Functions.txt, Newe2_Label
isotextNewe2_Label := StrSplit(isotextNewe2_Label, ":")
guicontrol, , txtNewe2_Label, % isotextNewe2_Label[2]
Return

e3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe3_ExeFilePath, %A_ScriptDir%, %Newe3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe3_ExeFilePath := SubStr(Newe3_ExeFilePath, ExeFilePathTrim)
	Newe3_ExeFilePath := "%A_WorkingDir%\Resources\"Newe3_ExeFilePath
	}
guicontrol, , Newe3_ExeFilePath, %Newe3_ExeFilePath%
RefNewe3_Label:
Gui, Submit, NoHide
If Newe3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe3_OverrideText
	guicontrol, Show, Newe3_OverrideLabel
	guicontrol, Show, Newe3_ExeFilePathButton
	guicontrol, Show, Newe3_ExeFilePath
	guicontrol, Hide, Newe3_SendKeystroke
	guicontrol, Hide, Newe3_SendKeystrokeText
	guicontrol, Hide, Newe3_MBCtrl
	guicontrol, Hide, Newe3_MBAlt
	guicontrol, Hide, Newe3_MBShift
	guicontrol, Hide, Newe3_MBDrag
	}
If Newe3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe3_OverrideText
	guicontrol, Show, Newe3_OverrideLabel
	guicontrol, Show, Newe3_SendKeystroke
	guicontrol, Show, Newe3_SendKeystrokeText
	guicontrol, Hide, Newe3_ExeFilePathButton
	guicontrol, Hide, Newe3_ExeFilePath
	guicontrol, Hide, Newe3_MBCtrl
	guicontrol, Hide, Newe3_MBAlt
	guicontrol, Hide, Newe3_MBShift
	guicontrol, Hide, Newe3_MBDrag
	}
If Newe3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe3_OverrideText
	guicontrol, Show, Newe3_OverrideLabel
	guicontrol, Hide, Newe3_SendKeystroke
	guicontrol, Hide, Newe3_SendKeystrokeText
	guicontrol, Hide, Newe3_ExeFilePathButton
	guicontrol, Hide, Newe3_ExeFilePath
	guicontrol, Show, Newe3_MBCtrl
	guicontrol, Show, Newe3_MBAlt
	guicontrol, Show, Newe3_MBShift
	guicontrol, Show, Newe3_MBDrag
	}
If Newe3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe3_OverrideText
	guicontrol, Hide, Newe3_OverrideLabel
	guicontrol, Hide, Newe3_SendKeystroke
	guicontrol, Hide, Newe3_SendKeystrokeText
	guicontrol, Hide, Newe3_ExeFilePathButton
	guicontrol, Hide, Newe3_ExeFilePath
	guicontrol, Hide, Newe3_MBCtrl
	guicontrol, Hide, Newe3_MBAlt
	guicontrol, Hide, Newe3_MBShift
	guicontrol, Hide, Newe3_MBDrag
	}
FileReadLine, isotextNewe3_Label,%A_ScriptDir%\Resources\Functions.txt, Newe3_Label
isotextNewe3_Label := StrSplit(isotextNewe3_Label, ":")
guicontrol, , txtNewe3_Label, % isotextNewe3_Label[2]
Return


e4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe4_ExeFilePath, %A_ScriptDir%, %Newe4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe4_ExeFilePath := SubStr(Newe4_ExeFilePath, ExeFilePathTrim)
	Newe4_ExeFilePath := "%A_WorkingDir%\Resources\"Newe4_ExeFilePath
	}
guicontrol, , Newe4_ExeFilePath, %Newe4_ExeFilePath%
RefNewe4_Label:
Gui, Submit, NoHide
If Newe4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe4_OverrideText
	guicontrol, Show, Newe4_OverrideLabel
	guicontrol, Show, Newe4_ExeFilePathButton
	guicontrol, Show, Newe4_ExeFilePath
	guicontrol, Hide, Newe4_SendKeystroke
	guicontrol, Hide, Newe4_SendKeystrokeText
	guicontrol, Hide, Newe4_MBCtrl
	guicontrol, Hide, Newe4_MBAlt
	guicontrol, Hide, Newe4_MBShift
	guicontrol, Hide, Newe4_MBDrag
	}
If Newe4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe4_OverrideText
	guicontrol, Show, Newe4_OverrideLabel
	guicontrol, Show, Newe4_SendKeystroke
	guicontrol, Show, Newe4_SendKeystrokeText
	guicontrol, Hide, Newe4_ExeFilePathButton
	guicontrol, Hide, Newe4_ExeFilePath
	guicontrol, Hide, Newe4_MBCtrl
	guicontrol, Hide, Newe4_MBAlt
	guicontrol, Hide, Newe4_MBShift
	guicontrol, Hide, Newe4_MBDrag
	}
If Newe4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe4_OverrideText
	guicontrol, Show, Newe4_OverrideLabel
	guicontrol, Hide, Newe4_SendKeystroke
	guicontrol, Hide, Newe4_SendKeystrokeText
	guicontrol, Hide, Newe4_ExeFilePathButton
	guicontrol, Hide, Newe4_ExeFilePath
	guicontrol, Show, Newe4_MBCtrl
	guicontrol, Show, Newe4_MBAlt
	guicontrol, Show, Newe4_MBShift
	guicontrol, Show, Newe4_MBDrag
	}
If Newe4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe4_OverrideText
	guicontrol, Hide, Newe4_OverrideLabel
	guicontrol, Hide, Newe4_SendKeystroke
	guicontrol, Hide, Newe4_SendKeystrokeText
	guicontrol, Hide, Newe4_ExeFilePathButton
	guicontrol, Hide, Newe4_ExeFilePath
	guicontrol, Hide, Newe4_MBCtrl
	guicontrol, Hide, Newe4_MBAlt
	guicontrol, Hide, Newe4_MBShift
	guicontrol, Hide, Newe4_MBDrag
	}
FileReadLine, isotextNewe4_Label,%A_ScriptDir%\Resources\Functions.txt, Newe4_Label
isotextNewe4_Label := StrSplit(isotextNewe4_Label, ":")
guicontrol, , txtNewe4_Label, % isotextNewe4_Label[2]
Return

e5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe5_ExeFilePath, %A_ScriptDir%, %Newe5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe5_ExeFilePath := SubStr(Newe5_ExeFilePath, ExeFilePathTrim)
	Newe5_ExeFilePath := "%A_WorkingDir%\Resources\"Newe5_ExeFilePath
	}
guicontrol, , Newe5_ExeFilePath, %Newe5_ExeFilePath%
RefNewe5_Label:
Gui, Submit, NoHide
If Newe5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe5_OverrideText
	guicontrol, Show, Newe5_OverrideLabel
	guicontrol, Show, Newe5_ExeFilePathButton
	guicontrol, Show, Newe5_ExeFilePath
	guicontrol, Hide, Newe5_SendKeystroke
	guicontrol, Hide, Newe5_SendKeystrokeText
	guicontrol, Hide, Newe5_MBCtrl
	guicontrol, Hide, Newe5_MBAlt
	guicontrol, Hide, Newe5_MBShift
	guicontrol, Hide, Newe5_MBDrag
	}
If Newe5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe5_OverrideText
	guicontrol, Show, Newe5_OverrideLabel
	guicontrol, Show, Newe5_SendKeystroke
	guicontrol, Show, Newe5_SendKeystrokeText
	guicontrol, Hide, Newe5_ExeFilePathButton
	guicontrol, Hide, Newe5_ExeFilePath
	guicontrol, Hide, Newe5_MBCtrl
	guicontrol, Hide, Newe5_MBAlt
	guicontrol, Hide, Newe5_MBShift
	guicontrol, Hide, Newe5_MBDrag
	}
If Newe5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe5_OverrideText
	guicontrol, Show, Newe5_OverrideLabel
	guicontrol, Hide, Newe5_SendKeystroke
	guicontrol, Hide, Newe5_SendKeystrokeText
	guicontrol, Hide, Newe5_ExeFilePathButton
	guicontrol, Hide, Newe5_ExeFilePath
	guicontrol, Show, Newe5_MBCtrl
	guicontrol, Show, Newe5_MBAlt
	guicontrol, Show, Newe5_MBShift
	guicontrol, Show, Newe5_MBDrag
	}
If Newe5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe5_OverrideText
	guicontrol, Hide, Newe5_OverrideLabel
	guicontrol, Hide, Newe5_SendKeystroke
	guicontrol, Hide, Newe5_SendKeystrokeText
	guicontrol, Hide, Newe5_ExeFilePathButton
	guicontrol, Hide, Newe5_ExeFilePath
	guicontrol, Hide, Newe5_MBCtrl
	guicontrol, Hide, Newe5_MBAlt
	guicontrol, Hide, Newe5_MBShift
	guicontrol, Hide, Newe5_MBDrag
	}
FileReadLine, isotextNewe5_Label,%A_ScriptDir%\Resources\Functions.txt, Newe5_Label
isotextNewe5_Label := StrSplit(isotextNewe5_Label, ":")
guicontrol, , txtNewe5_Label, % isotextNewe5_Label[2]
Return

e6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newe6_ExeFilePath, %A_ScriptDir%, %Newe6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newe6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newe6_ExeFilePath := SubStr(Newe6_ExeFilePath, ExeFilePathTrim)
	Newe6_ExeFilePath := "%A_WorkingDir%\Resources\"Newe6_ExeFilePath
	}
guicontrol, , Newe6_ExeFilePath, %Newe6_ExeFilePath%
RefNewe6_Label:
Gui, Submit, NoHide
If Newe6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newe6_OverrideText
	guicontrol, Show, Newe6_OverrideLabel
	guicontrol, Show, Newe6_ExeFilePathButton
	guicontrol, Show, Newe6_ExeFilePath
	guicontrol, Hide, Newe6_SendKeystroke
	guicontrol, Hide, Newe6_SendKeystrokeText
	guicontrol, Hide, Newe6_MBCtrl
	guicontrol, Hide, Newe6_MBAlt
	guicontrol, Hide, Newe6_MBShift
	guicontrol, Hide, Newe6_MBDrag
	}
If Newe6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newe6_OverrideText
	guicontrol, Show, Newe6_OverrideLabel
	guicontrol, Show, Newe6_SendKeystroke
	guicontrol, Show, Newe6_SendKeystrokeText
	guicontrol, Hide, Newe6_ExeFilePathButton
	guicontrol, Hide, Newe6_ExeFilePath
	guicontrol, Hide, Newe6_MBCtrl
	guicontrol, Hide, Newe6_MBAlt
	guicontrol, Hide, Newe6_MBShift
	guicontrol, Hide, Newe6_MBDrag
	}
If Newe6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newe6_OverrideText
	guicontrol, Show, Newe6_OverrideLabel
	guicontrol, Hide, Newe6_SendKeystroke
	guicontrol, Hide, Newe6_SendKeystrokeText
	guicontrol, Hide, Newe6_ExeFilePathButton
	guicontrol, Hide, Newe6_ExeFilePath
	guicontrol, Show, Newe6_MBCtrl
	guicontrol, Show, Newe6_MBAlt
	guicontrol, Show, Newe6_MBShift
	guicontrol, Show, Newe6_MBDrag
	}
If Newe6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newe6_OverrideText
	guicontrol, Hide, Newe6_OverrideLabel
	guicontrol, Hide, Newe6_SendKeystroke
	guicontrol, Hide, Newe6_SendKeystrokeText
	guicontrol, Hide, Newe6_ExeFilePathButton
	guicontrol, Hide, Newe6_ExeFilePath
	guicontrol, Hide, Newe6_MBCtrl
	guicontrol, Hide, Newe6_MBAlt
	guicontrol, Hide, Newe6_MBShift
	guicontrol, Hide, Newe6_MBDrag
	}
FileReadLine, isotextNewe6_Label,%A_ScriptDir%\Resources\Functions.txt, Newe6_Label
isotextNewe6_Label := StrSplit(isotextNewe6_Label, ":")
guicontrol, , txtNewe6_Label, % isotextNewe6_Label[2]
Return



fnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newfnull_ExeFilePath, %A_ScriptDir%, %Newfnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newfnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newfnull_ExeFilePath := SubStr(Newfnull_ExeFilePath, ExeFilePathTrim)
	Newfnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newfnull_ExeFilePath
	}
guicontrol, , Newfnull_ExeFilePath, %Newfnull_ExeFilePath%
RefNewfnull_Label:
Gui, Submit, NoHide
If Newfnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newfnull_OverrideText
	guicontrol, Show, Newfnull_OverrideLabel
	guicontrol, Show, Newfnull_ExeFilePathButton
	guicontrol, Show, Newfnull_ExeFilePath
	guicontrol, Hide, Newfnull_SendKeystroke
	guicontrol, Hide, Newfnull_SendKeystrokeText
	guicontrol, Hide, Newfnull_MBCtrl
	guicontrol, Hide, Newfnull_MBAlt
	guicontrol, Hide, Newfnull_MBShift
	guicontrol, Hide, Newfnull_MBDrag
	}
If Newfnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newfnull_OverrideText
	guicontrol, Show, Newfnull_OverrideLabel
	guicontrol, Show, Newfnull_SendKeystroke
	guicontrol, Show, Newfnull_SendKeystrokeText
	guicontrol, Hide, Newfnull_ExeFilePathButton
	guicontrol, Hide, Newfnull_ExeFilePath
	guicontrol, Hide, Newfnull_MBCtrl
	guicontrol, Hide, Newfnull_MBAlt
	guicontrol, Hide, Newfnull_MBShift
	guicontrol, Hide, Newfnull_MBDrag
	}
If Newfnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newfnull_OverrideText
	guicontrol, Show, Newfnull_OverrideLabel
	guicontrol, Hide, Newfnull_SendKeystroke
	guicontrol, Hide, Newfnull_SendKeystrokeText
	guicontrol, Hide, Newfnull_ExeFilePathButton
	guicontrol, Hide, Newfnull_ExeFilePath
	guicontrol, Show, Newfnull_MBCtrl
	guicontrol, Show, Newfnull_MBAlt
	guicontrol, Show, Newfnull_MBShift
	guicontrol, Show, Newfnull_MBDrag
	}
If Newfnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newfnull_OverrideText
	guicontrol, Hide, Newfnull_OverrideLabel
	guicontrol, Hide, Newfnull_SendKeystroke
	guicontrol, Hide, Newfnull_SendKeystrokeText
	guicontrol, Hide, Newfnull_ExeFilePathButton
	guicontrol, Hide, Newfnull_ExeFilePath
	guicontrol, Hide, Newfnull_MBCtrl
	guicontrol, Hide, Newfnull_MBAlt
	guicontrol, Hide, Newfnull_MBShift
	guicontrol, Hide, Newfnull_MBDrag
	}
FileReadLine, isotextNewfnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newfnull_Label
isotextNewfnull_Label := StrSplit(isotextNewfnull_Label, ":")
guicontrol, , txtNewfnull_Label, % isotextNewfnull_Label[2]
Return



f1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf1_ExeFilePath, %A_ScriptDir%, %Newf1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf1_ExeFilePath := SubStr(Newf1_ExeFilePath, ExeFilePathTrim)
	Newf1_ExeFilePath := "%A_WorkingDir%\Resources\"Newf1_ExeFilePath
	}
guicontrol, , Newf1_ExeFilePath, %Newf1_ExeFilePath%
RefNewf1_Label:
Gui, Submit, NoHide
If Newf1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf1_OverrideText
	guicontrol, Show, Newf1_OverrideLabel
	guicontrol, Show, Newf1_ExeFilePathButton
	guicontrol, Show, Newf1_ExeFilePath
	guicontrol, Hide, Newf1_SendKeystroke
	guicontrol, Hide, Newf1_SendKeystrokeText
	guicontrol, Hide, Newf1_MBCtrl
	guicontrol, Hide, Newf1_MBAlt
	guicontrol, Hide, Newf1_MBShift
	guicontrol, Hide, Newf1_MBDrag
	}
If Newf1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf1_OverrideText
	guicontrol, Show, Newf1_OverrideLabel
	guicontrol, Show, Newf1_SendKeystroke
	guicontrol, Show, Newf1_SendKeystrokeText
	guicontrol, Hide, Newf1_ExeFilePathButton
	guicontrol, Hide, Newf1_ExeFilePath
	guicontrol, Hide, Newf1_MBCtrl
	guicontrol, Hide, Newf1_MBAlt
	guicontrol, Hide, Newf1_MBShift
	guicontrol, Hide, Newf1_MBDrag
	}
If Newf1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf1_OverrideText
	guicontrol, Show, Newf1_OverrideLabel
	guicontrol, Hide, Newf1_SendKeystroke
	guicontrol, Hide, Newf1_SendKeystrokeText
	guicontrol, Hide, Newf1_ExeFilePathButton
	guicontrol, Hide, Newf1_ExeFilePath
	guicontrol, Show, Newf1_MBCtrl
	guicontrol, Show, Newf1_MBAlt
	guicontrol, Show, Newf1_MBShift
	guicontrol, Show, Newf1_MBDrag
	}
If Newf1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf1_OverrideText
	guicontrol, Hide, Newf1_OverrideLabel
	guicontrol, Hide, Newf1_SendKeystroke
	guicontrol, Hide, Newf1_SendKeystrokeText
	guicontrol, Hide, Newf1_ExeFilePathButton
	guicontrol, Hide, Newf1_ExeFilePath
	guicontrol, Hide, Newf1_MBCtrl
	guicontrol, Hide, Newf1_MBAlt
	guicontrol, Hide, Newf1_MBShift
	guicontrol, Hide, Newf1_MBDrag
	}
FileReadLine, isotextNewf1_Label,%A_ScriptDir%\Resources\Functions.txt, Newf1_Label
isotextNewf1_Label := StrSplit(isotextNewf1_Label, ":")
guicontrol, , txtNewf1_Label, % isotextNewf1_Label[2]
Return

f2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf2_ExeFilePath, %A_ScriptDir%, %Newf2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf2_ExeFilePath := SubStr(Newf2_ExeFilePath, ExeFilePathTrim)
	Newf2_ExeFilePath := "%A_WorkingDir%\Resources\"Newf2_ExeFilePath
	}
guicontrol, , Newf2_ExeFilePath, %Newf2_ExeFilePath%
RefNewf2_Label:
Gui, Submit, NoHide
If Newf2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf2_OverrideText
	guicontrol, Show, Newf2_OverrideLabel
	guicontrol, Show, Newf2_ExeFilePathButton
	guicontrol, Show, Newf2_ExeFilePath
	guicontrol, Hide, Newf2_SendKeystroke
	guicontrol, Hide, Newf2_SendKeystrokeText
	guicontrol, Hide, Newf2_MBCtrl
	guicontrol, Hide, Newf2_MBAlt
	guicontrol, Hide, Newf2_MBShift
	guicontrol, Hide, Newf2_MBDrag
	}
If Newf2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf2_OverrideText
	guicontrol, Show, Newf2_OverrideLabel
	guicontrol, Show, Newf2_SendKeystroke
	guicontrol, Show, Newf2_SendKeystrokeText
	guicontrol, Hide, Newf2_ExeFilePathButton
	guicontrol, Hide, Newf2_ExeFilePath
	guicontrol, Hide, Newf2_MBCtrl
	guicontrol, Hide, Newf2_MBAlt
	guicontrol, Hide, Newf2_MBShift
	guicontrol, Hide, Newf2_MBDrag
	}
If Newf2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf2_OverrideText
	guicontrol, Show, Newf2_OverrideLabel
	guicontrol, Hide, Newf2_SendKeystroke
	guicontrol, Hide, Newf2_SendKeystrokeText
	guicontrol, Hide, Newf2_ExeFilePathButton
	guicontrol, Hide, Newf2_ExeFilePath
	guicontrol, Show, Newf2_MBCtrl
	guicontrol, Show, Newf2_MBAlt
	guicontrol, Show, Newf2_MBShift
	guicontrol, Show, Newf2_MBDrag
	}
If Newf2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf2_OverrideText
	guicontrol, Hide, Newf2_OverrideLabel
	guicontrol, Hide, Newf2_SendKeystroke
	guicontrol, Hide, Newf2_SendKeystrokeText
	guicontrol, Hide, Newf2_ExeFilePathButton
	guicontrol, Hide, Newf2_ExeFilePath
	guicontrol, Hide, Newf2_MBCtrl
	guicontrol, Hide, Newf2_MBAlt
	guicontrol, Hide, Newf2_MBShift
	guicontrol, Hide, Newf2_MBDrag
	}
FileReadLine, isotextNewf2_Label,%A_ScriptDir%\Resources\Functions.txt, Newf2_Label
isotextNewf2_Label := StrSplit(isotextNewf2_Label, ":")
guicontrol, , txtNewf2_Label, % isotextNewf2_Label[2]
Return

f3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf3_ExeFilePath, %A_ScriptDir%, %Newf3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf3_ExeFilePath := SubStr(Newf3_ExeFilePath, ExeFilePathTrim)
	Newf3_ExeFilePath := "%A_WorkingDir%\Resources\"Newf3_ExeFilePath
	}
guicontrol, , Newf3_ExeFilePath, %Newf3_ExeFilePath%
RefNewf3_Label:
Gui, Submit, NoHide
If Newf3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf3_OverrideText
	guicontrol, Show, Newf3_OverrideLabel
	guicontrol, Show, Newf3_ExeFilePathButton
	guicontrol, Show, Newf3_ExeFilePath
	guicontrol, Hide, Newf3_SendKeystroke
	guicontrol, Hide, Newf3_SendKeystrokeText
	guicontrol, Hide, Newf3_MBCtrl
	guicontrol, Hide, Newf3_MBAlt
	guicontrol, Hide, Newf3_MBShift
	guicontrol, Hide, Newf3_MBDrag
	}
If Newf3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf3_OverrideText
	guicontrol, Show, Newf3_OverrideLabel
	guicontrol, Show, Newf3_SendKeystroke
	guicontrol, Show, Newf3_SendKeystrokeText
	guicontrol, Hide, Newf3_ExeFilePathButton
	guicontrol, Hide, Newf3_ExeFilePath
	guicontrol, Hide, Newf3_MBCtrl
	guicontrol, Hide, Newf3_MBAlt
	guicontrol, Hide, Newf3_MBShift
	guicontrol, Hide, Newf3_MBDrag
	}
If Newf3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf3_OverrideText
	guicontrol, Show, Newf3_OverrideLabel
	guicontrol, Hide, Newf3_SendKeystroke
	guicontrol, Hide, Newf3_SendKeystrokeText
	guicontrol, Hide, Newf3_ExeFilePathButton
	guicontrol, Hide, Newf3_ExeFilePath
	guicontrol, Show, Newf3_MBCtrl
	guicontrol, Show, Newf3_MBAlt
	guicontrol, Show, Newf3_MBShift
	guicontrol, Show, Newf3_MBDrag
	}
If Newf3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf3_OverrideText
	guicontrol, Hide, Newf3_OverrideLabel
	guicontrol, Hide, Newf3_SendKeystroke
	guicontrol, Hide, Newf3_SendKeystrokeText
	guicontrol, Hide, Newf3_ExeFilePathButton
	guicontrol, Hide, Newf3_ExeFilePath
	guicontrol, Hide, Newf3_MBCtrl
	guicontrol, Hide, Newf3_MBAlt
	guicontrol, Hide, Newf3_MBShift
	guicontrol, Hide, Newf3_MBDrag
	}
FileReadLine, isotextNewf3_Label,%A_ScriptDir%\Resources\Functions.txt, Newf3_Label
isotextNewf3_Label := StrSplit(isotextNewf3_Label, ":")
guicontrol, , txtNewf3_Label, % isotextNewf3_Label[2]
Return


f4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf4_ExeFilePath, %A_ScriptDir%, %Newf4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf4_ExeFilePath := SubStr(Newf4_ExeFilePath, ExeFilePathTrim)
	Newf4_ExeFilePath := "%A_WorkingDir%\Resources\"Newf4_ExeFilePath
	}
guicontrol, , Newf4_ExeFilePath, %Newf4_ExeFilePath%
RefNewf4_Label:
Gui, Submit, NoHide
If Newf4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf4_OverrideText
	guicontrol, Show, Newf4_OverrideLabel
	guicontrol, Show, Newf4_ExeFilePathButton
	guicontrol, Show, Newf4_ExeFilePath
	guicontrol, Hide, Newf4_SendKeystroke
	guicontrol, Hide, Newf4_SendKeystrokeText
	guicontrol, Hide, Newf4_MBCtrl
	guicontrol, Hide, Newf4_MBAlt
	guicontrol, Hide, Newf4_MBShift
	guicontrol, Hide, Newf4_MBDrag
	}
If Newf4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf4_OverrideText
	guicontrol, Show, Newf4_OverrideLabel
	guicontrol, Show, Newf4_SendKeystroke
	guicontrol, Show, Newf4_SendKeystrokeText
	guicontrol, Hide, Newf4_ExeFilePathButton
	guicontrol, Hide, Newf4_ExeFilePath
	guicontrol, Hide, Newf4_MBCtrl
	guicontrol, Hide, Newf4_MBAlt
	guicontrol, Hide, Newf4_MBShift
	guicontrol, Hide, Newf4_MBDrag
	}
If Newf4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf4_OverrideText
	guicontrol, Show, Newf4_OverrideLabel
	guicontrol, Hide, Newf4_SendKeystroke
	guicontrol, Hide, Newf4_SendKeystrokeText
	guicontrol, Hide, Newf4_ExeFilePathButton
	guicontrol, Hide, Newf4_ExeFilePath
	guicontrol, Show, Newf4_MBCtrl
	guicontrol, Show, Newf4_MBAlt
	guicontrol, Show, Newf4_MBShift
	guicontrol, Show, Newf4_MBDrag
	}
If Newf4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf4_OverrideText
	guicontrol, Hide, Newf4_OverrideLabel
	guicontrol, Hide, Newf4_SendKeystroke
	guicontrol, Hide, Newf4_SendKeystrokeText
	guicontrol, Hide, Newf4_ExeFilePathButton
	guicontrol, Hide, Newf4_ExeFilePath
	guicontrol, Hide, Newf4_MBCtrl
	guicontrol, Hide, Newf4_MBAlt
	guicontrol, Hide, Newf4_MBShift
	guicontrol, Hide, Newf4_MBDrag
	}
FileReadLine, isotextNewf4_Label,%A_ScriptDir%\Resources\Functions.txt, Newf4_Label
isotextNewf4_Label := StrSplit(isotextNewf4_Label, ":")
guicontrol, , txtNewf4_Label, % isotextNewf4_Label[2]
Return

f5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf5_ExeFilePath, %A_ScriptDir%, %Newf5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf5_ExeFilePath := SubStr(Newf5_ExeFilePath, ExeFilePathTrim)
	Newf5_ExeFilePath := "%A_WorkingDir%\Resources\"Newf5_ExeFilePath
	}
guicontrol, , Newf5_ExeFilePath, %Newf5_ExeFilePath%
RefNewf5_Label:
Gui, Submit, NoHide
If Newf5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf5_OverrideText
	guicontrol, Show, Newf5_OverrideLabel
	guicontrol, Show, Newf5_ExeFilePathButton
	guicontrol, Show, Newf5_ExeFilePath
	guicontrol, Hide, Newf5_SendKeystroke
	guicontrol, Hide, Newf5_SendKeystrokeText
	guicontrol, Hide, Newf5_MBCtrl
	guicontrol, Hide, Newf5_MBAlt
	guicontrol, Hide, Newf5_MBShift
	guicontrol, Hide, Newf5_MBDrag
	}
If Newf5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf5_OverrideText
	guicontrol, Show, Newf5_OverrideLabel
	guicontrol, Show, Newf5_SendKeystroke
	guicontrol, Show, Newf5_SendKeystrokeText
	guicontrol, Hide, Newf5_ExeFilePathButton
	guicontrol, Hide, Newf5_ExeFilePath
	guicontrol, Hide, Newf5_MBCtrl
	guicontrol, Hide, Newf5_MBAlt
	guicontrol, Hide, Newf5_MBShift
	guicontrol, Hide, Newf5_MBDrag
	}
If Newf5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf5_OverrideText
	guicontrol, Show, Newf5_OverrideLabel
	guicontrol, Hide, Newf5_SendKeystroke
	guicontrol, Hide, Newf5_SendKeystrokeText
	guicontrol, Hide, Newf5_ExeFilePathButton
	guicontrol, Hide, Newf5_ExeFilePath
	guicontrol, Show, Newf5_MBCtrl
	guicontrol, Show, Newf5_MBAlt
	guicontrol, Show, Newf5_MBShift
	guicontrol, Show, Newf5_MBDrag
	}
If Newf5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf5_OverrideText
	guicontrol, Hide, Newf5_OverrideLabel
	guicontrol, Hide, Newf5_SendKeystroke
	guicontrol, Hide, Newf5_SendKeystrokeText
	guicontrol, Hide, Newf5_ExeFilePathButton
	guicontrol, Hide, Newf5_ExeFilePath
	guicontrol, Hide, Newf5_MBCtrl
	guicontrol, Hide, Newf5_MBAlt
	guicontrol, Hide, Newf5_MBShift
	guicontrol, Hide, Newf5_MBDrag
	}
FileReadLine, isotextNewf5_Label,%A_ScriptDir%\Resources\Functions.txt, Newf5_Label
isotextNewf5_Label := StrSplit(isotextNewf5_Label, ":")
guicontrol, , txtNewf5_Label, % isotextNewf5_Label[2]
Return

f6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newf6_ExeFilePath, %A_ScriptDir%, %Newf6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newf6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newf6_ExeFilePath := SubStr(Newf6_ExeFilePath, ExeFilePathTrim)
	Newf6_ExeFilePath := "%A_WorkingDir%\Resources\"Newf6_ExeFilePath
	}
guicontrol, , Newf6_ExeFilePath, %Newf6_ExeFilePath%
RefNewf6_Label:
Gui, Submit, NoHide
If Newf6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newf6_OverrideText
	guicontrol, Show, Newf6_OverrideLabel
	guicontrol, Show, Newf6_ExeFilePathButton
	guicontrol, Show, Newf6_ExeFilePath
	guicontrol, Hide, Newf6_SendKeystroke
	guicontrol, Hide, Newf6_SendKeystrokeText
	guicontrol, Hide, Newf6_MBCtrl
	guicontrol, Hide, Newf6_MBAlt
	guicontrol, Hide, Newf6_MBShift
	guicontrol, Hide, Newf6_MBDrag
	}
If Newf6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newf6_OverrideText
	guicontrol, Show, Newf6_OverrideLabel
	guicontrol, Show, Newf6_SendKeystroke
	guicontrol, Show, Newf6_SendKeystrokeText
	guicontrol, Hide, Newf6_ExeFilePathButton
	guicontrol, Hide, Newf6_ExeFilePath
	guicontrol, Hide, Newf6_MBCtrl
	guicontrol, Hide, Newf6_MBAlt
	guicontrol, Hide, Newf6_MBShift
	guicontrol, Hide, Newf6_MBDrag
	}
If Newf6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newf6_OverrideText
	guicontrol, Show, Newf6_OverrideLabel
	guicontrol, Hide, Newf6_SendKeystroke
	guicontrol, Hide, Newf6_SendKeystrokeText
	guicontrol, Hide, Newf6_ExeFilePathButton
	guicontrol, Hide, Newf6_ExeFilePath
	guicontrol, Show, Newf6_MBCtrl
	guicontrol, Show, Newf6_MBAlt
	guicontrol, Show, Newf6_MBShift
	guicontrol, Show, Newf6_MBDrag
	}
If Newf6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newf6_OverrideText
	guicontrol, Hide, Newf6_OverrideLabel
	guicontrol, Hide, Newf6_SendKeystroke
	guicontrol, Hide, Newf6_SendKeystrokeText
	guicontrol, Hide, Newf6_ExeFilePathButton
	guicontrol, Hide, Newf6_ExeFilePath
	guicontrol, Hide, Newf6_MBCtrl
	guicontrol, Hide, Newf6_MBAlt
	guicontrol, Hide, Newf6_MBShift
	guicontrol, Hide, Newf6_MBDrag
	}
FileReadLine, isotextNewf6_Label,%A_ScriptDir%\Resources\Functions.txt, Newf6_Label
isotextNewf6_Label := StrSplit(isotextNewf6_Label, ":")
guicontrol, , txtNewf6_Label, % isotextNewf6_Label[2]
Return



gnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newgnull_ExeFilePath, %A_ScriptDir%, %Newgnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newgnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newgnull_ExeFilePath := SubStr(Newgnull_ExeFilePath, ExeFilePathTrim)
	Newgnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newgnull_ExeFilePath
	}
guicontrol, , Newgnull_ExeFilePath, %Newgnull_ExeFilePath%
RefNewgnull_Label:
Gui, Submit, NoHide
If Newgnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newgnull_OverrideText
	guicontrol, Show, Newgnull_OverrideLabel
	guicontrol, Show, Newgnull_ExeFilePathButton
	guicontrol, Show, Newgnull_ExeFilePath
	guicontrol, Hide, Newgnull_SendKeystroke
	guicontrol, Hide, Newgnull_SendKeystrokeText
	guicontrol, Hide, Newgnull_MBCtrl
	guicontrol, Hide, Newgnull_MBAlt
	guicontrol, Hide, Newgnull_MBShift
	guicontrol, Hide, Newgnull_MBDrag
	}
If Newgnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newgnull_OverrideText
	guicontrol, Show, Newgnull_OverrideLabel
	guicontrol, Show, Newgnull_SendKeystroke
	guicontrol, Show, Newgnull_SendKeystrokeText
	guicontrol, Hide, Newgnull_ExeFilePathButton
	guicontrol, Hide, Newgnull_ExeFilePath
	guicontrol, Hide, Newgnull_MBCtrl
	guicontrol, Hide, Newgnull_MBAlt
	guicontrol, Hide, Newgnull_MBShift
	guicontrol, Hide, Newgnull_MBDrag
	}
If Newgnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newgnull_OverrideText
	guicontrol, Show, Newgnull_OverrideLabel
	guicontrol, Hide, Newgnull_SendKeystroke
	guicontrol, Hide, Newgnull_SendKeystrokeText
	guicontrol, Hide, Newgnull_ExeFilePathButton
	guicontrol, Hide, Newgnull_ExeFilePath
	guicontrol, Show, Newgnull_MBCtrl
	guicontrol, Show, Newgnull_MBAlt
	guicontrol, Show, Newgnull_MBShift
	guicontrol, Show, Newgnull_MBDrag
	}
If Newgnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newgnull_OverrideText
	guicontrol, Hide, Newgnull_OverrideLabel
	guicontrol, Hide, Newgnull_SendKeystroke
	guicontrol, Hide, Newgnull_SendKeystrokeText
	guicontrol, Hide, Newgnull_ExeFilePathButton
	guicontrol, Hide, Newgnull_ExeFilePath
	guicontrol, Hide, Newgnull_MBCtrl
	guicontrol, Hide, Newgnull_MBAlt
	guicontrol, Hide, Newgnull_MBShift
	guicontrol, Hide, Newgnull_MBDrag
	}
FileReadLine, isotextNewgnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newgnull_Label
isotextNewgnull_Label := StrSplit(isotextNewgnull_Label, ":")
guicontrol, , txtNewgnull_Label, % isotextNewgnull_Label[2]
Return



g1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg1_ExeFilePath, %A_ScriptDir%, %Newg1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg1_ExeFilePath := SubStr(Newg1_ExeFilePath, ExeFilePathTrim)
	Newg1_ExeFilePath := "%A_WorkingDir%\Resources\"Newg1_ExeFilePath
	}
guicontrol, , Newg1_ExeFilePath, %Newg1_ExeFilePath%
RefNewg1_Label:
Gui, Submit, NoHide
If Newg1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg1_OverrideText
	guicontrol, Show, Newg1_OverrideLabel
	guicontrol, Show, Newg1_ExeFilePathButton
	guicontrol, Show, Newg1_ExeFilePath
	guicontrol, Hide, Newg1_SendKeystroke
	guicontrol, Hide, Newg1_SendKeystrokeText
	guicontrol, Hide, Newg1_MBCtrl
	guicontrol, Hide, Newg1_MBAlt
	guicontrol, Hide, Newg1_MBShift
	guicontrol, Hide, Newg1_MBDrag
	}
If Newg1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg1_OverrideText
	guicontrol, Show, Newg1_OverrideLabel
	guicontrol, Show, Newg1_SendKeystroke
	guicontrol, Show, Newg1_SendKeystrokeText
	guicontrol, Hide, Newg1_ExeFilePathButton
	guicontrol, Hide, Newg1_ExeFilePath
	guicontrol, Hide, Newg1_MBCtrl
	guicontrol, Hide, Newg1_MBAlt
	guicontrol, Hide, Newg1_MBShift
	guicontrol, Hide, Newg1_MBDrag
	}
If Newg1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg1_OverrideText
	guicontrol, Show, Newg1_OverrideLabel
	guicontrol, Hide, Newg1_SendKeystroke
	guicontrol, Hide, Newg1_SendKeystrokeText
	guicontrol, Hide, Newg1_ExeFilePathButton
	guicontrol, Hide, Newg1_ExeFilePath
	guicontrol, Show, Newg1_MBCtrl
	guicontrol, Show, Newg1_MBAlt
	guicontrol, Show, Newg1_MBShift
	guicontrol, Show, Newg1_MBDrag
	}
If Newg1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg1_OverrideText
	guicontrol, Hide, Newg1_OverrideLabel
	guicontrol, Hide, Newg1_SendKeystroke
	guicontrol, Hide, Newg1_SendKeystrokeText
	guicontrol, Hide, Newg1_ExeFilePathButton
	guicontrol, Hide, Newg1_ExeFilePath
	guicontrol, Hide, Newg1_MBCtrl
	guicontrol, Hide, Newg1_MBAlt
	guicontrol, Hide, Newg1_MBShift
	guicontrol, Hide, Newg1_MBDrag
	}
FileReadLine, isotextNewg1_Label,%A_ScriptDir%\Resources\Functions.txt, Newg1_Label
isotextNewg1_Label := StrSplit(isotextNewg1_Label, ":")
guicontrol, , txtNewg1_Label, % isotextNewg1_Label[2]
Return

g2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg2_ExeFilePath, %A_ScriptDir%, %Newg2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg2_ExeFilePath := SubStr(Newg2_ExeFilePath, ExeFilePathTrim)
	Newg2_ExeFilePath := "%A_WorkingDir%\Resources\"Newg2_ExeFilePath
	}
guicontrol, , Newg2_ExeFilePath, %Newg2_ExeFilePath%
RefNewg2_Label:
Gui, Submit, NoHide
If Newg2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg2_OverrideText
	guicontrol, Show, Newg2_OverrideLabel
	guicontrol, Show, Newg2_ExeFilePathButton
	guicontrol, Show, Newg2_ExeFilePath
	guicontrol, Hide, Newg2_SendKeystroke
	guicontrol, Hide, Newg2_SendKeystrokeText
	guicontrol, Hide, Newg2_MBCtrl
	guicontrol, Hide, Newg2_MBAlt
	guicontrol, Hide, Newg2_MBShift
	guicontrol, Hide, Newg2_MBDrag
	}
If Newg2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg2_OverrideText
	guicontrol, Show, Newg2_OverrideLabel
	guicontrol, Show, Newg2_SendKeystroke
	guicontrol, Show, Newg2_SendKeystrokeText
	guicontrol, Hide, Newg2_ExeFilePathButton
	guicontrol, Hide, Newg2_ExeFilePath
	guicontrol, Hide, Newg2_MBCtrl
	guicontrol, Hide, Newg2_MBAlt
	guicontrol, Hide, Newg2_MBShift
	guicontrol, Hide, Newg2_MBDrag
	}
If Newg2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg2_OverrideText
	guicontrol, Show, Newg2_OverrideLabel
	guicontrol, Hide, Newg2_SendKeystroke
	guicontrol, Hide, Newg2_SendKeystrokeText
	guicontrol, Hide, Newg2_ExeFilePathButton
	guicontrol, Hide, Newg2_ExeFilePath
	guicontrol, Show, Newg2_MBCtrl
	guicontrol, Show, Newg2_MBAlt
	guicontrol, Show, Newg2_MBShift
	guicontrol, Show, Newg2_MBDrag
	}
If Newg2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg2_OverrideText
	guicontrol, Hide, Newg2_OverrideLabel
	guicontrol, Hide, Newg2_SendKeystroke
	guicontrol, Hide, Newg2_SendKeystrokeText
	guicontrol, Hide, Newg2_ExeFilePathButton
	guicontrol, Hide, Newg2_ExeFilePath
	guicontrol, Hide, Newg2_MBCtrl
	guicontrol, Hide, Newg2_MBAlt
	guicontrol, Hide, Newg2_MBShift
	guicontrol, Hide, Newg2_MBDrag
	}
FileReadLine, isotextNewg2_Label,%A_ScriptDir%\Resources\Functions.txt, Newg2_Label
isotextNewg2_Label := StrSplit(isotextNewg2_Label, ":")
guicontrol, , txtNewg2_Label, % isotextNewg2_Label[2]
Return

g3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg3_ExeFilePath, %A_ScriptDir%, %Newg3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg3_ExeFilePath := SubStr(Newg3_ExeFilePath, ExeFilePathTrim)
	Newg3_ExeFilePath := "%A_WorkingDir%\Resources\"Newg3_ExeFilePath
	}
guicontrol, , Newg3_ExeFilePath, %Newg3_ExeFilePath%
RefNewg3_Label:
Gui, Submit, NoHide
If Newg3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg3_OverrideText
	guicontrol, Show, Newg3_OverrideLabel
	guicontrol, Show, Newg3_ExeFilePathButton
	guicontrol, Show, Newg3_ExeFilePath
	guicontrol, Hide, Newg3_SendKeystroke
	guicontrol, Hide, Newg3_SendKeystrokeText
	guicontrol, Hide, Newg3_MBCtrl
	guicontrol, Hide, Newg3_MBAlt
	guicontrol, Hide, Newg3_MBShift
	guicontrol, Hide, Newg3_MBDrag
	}
If Newg3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg3_OverrideText
	guicontrol, Show, Newg3_OverrideLabel
	guicontrol, Show, Newg3_SendKeystroke
	guicontrol, Show, Newg3_SendKeystrokeText
	guicontrol, Hide, Newg3_ExeFilePathButton
	guicontrol, Hide, Newg3_ExeFilePath
	guicontrol, Hide, Newg3_MBCtrl
	guicontrol, Hide, Newg3_MBAlt
	guicontrol, Hide, Newg3_MBShift
	guicontrol, Hide, Newg3_MBDrag
	}
If Newg3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg3_OverrideText
	guicontrol, Show, Newg3_OverrideLabel
	guicontrol, Hide, Newg3_SendKeystroke
	guicontrol, Hide, Newg3_SendKeystrokeText
	guicontrol, Hide, Newg3_ExeFilePathButton
	guicontrol, Hide, Newg3_ExeFilePath
	guicontrol, Show, Newg3_MBCtrl
	guicontrol, Show, Newg3_MBAlt
	guicontrol, Show, Newg3_MBShift
	guicontrol, Show, Newg3_MBDrag
	}
If Newg3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg3_OverrideText
	guicontrol, Hide, Newg3_OverrideLabel
	guicontrol, Hide, Newg3_SendKeystroke
	guicontrol, Hide, Newg3_SendKeystrokeText
	guicontrol, Hide, Newg3_ExeFilePathButton
	guicontrol, Hide, Newg3_ExeFilePath
	guicontrol, Hide, Newg3_MBCtrl
	guicontrol, Hide, Newg3_MBAlt
	guicontrol, Hide, Newg3_MBShift
	guicontrol, Hide, Newg3_MBDrag
	}
FileReadLine, isotextNewg3_Label,%A_ScriptDir%\Resources\Functions.txt, Newg3_Label
isotextNewg3_Label := StrSplit(isotextNewg3_Label, ":")
guicontrol, , txtNewg3_Label, % isotextNewg3_Label[2]
Return


g4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg4_ExeFilePath, %A_ScriptDir%, %Newg4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg4_ExeFilePath := SubStr(Newg4_ExeFilePath, ExeFilePathTrim)
	Newg4_ExeFilePath := "%A_WorkingDir%\Resources\"Newg4_ExeFilePath
	}
guicontrol, , Newg4_ExeFilePath, %Newg4_ExeFilePath%
RefNewg4_Label:
Gui, Submit, NoHide
If Newg4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg4_OverrideText
	guicontrol, Show, Newg4_OverrideLabel
	guicontrol, Show, Newg4_ExeFilePathButton
	guicontrol, Show, Newg4_ExeFilePath
	guicontrol, Hide, Newg4_SendKeystroke
	guicontrol, Hide, Newg4_SendKeystrokeText
	guicontrol, Hide, Newg4_MBCtrl
	guicontrol, Hide, Newg4_MBAlt
	guicontrol, Hide, Newg4_MBShift
	guicontrol, Hide, Newg4_MBDrag
	}
If Newg4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg4_OverrideText
	guicontrol, Show, Newg4_OverrideLabel
	guicontrol, Show, Newg4_SendKeystroke
	guicontrol, Show, Newg4_SendKeystrokeText
	guicontrol, Hide, Newg4_ExeFilePathButton
	guicontrol, Hide, Newg4_ExeFilePath
	guicontrol, Hide, Newg4_MBCtrl
	guicontrol, Hide, Newg4_MBAlt
	guicontrol, Hide, Newg4_MBShift
	guicontrol, Hide, Newg4_MBDrag
	}
If Newg4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg4_OverrideText
	guicontrol, Show, Newg4_OverrideLabel
	guicontrol, Hide, Newg4_SendKeystroke
	guicontrol, Hide, Newg4_SendKeystrokeText
	guicontrol, Hide, Newg4_ExeFilePathButton
	guicontrol, Hide, Newg4_ExeFilePath
	guicontrol, Show, Newg4_MBCtrl
	guicontrol, Show, Newg4_MBAlt
	guicontrol, Show, Newg4_MBShift
	guicontrol, Show, Newg4_MBDrag
	}
If Newg4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg4_OverrideText
	guicontrol, Hide, Newg4_OverrideLabel
	guicontrol, Hide, Newg4_SendKeystroke
	guicontrol, Hide, Newg4_SendKeystrokeText
	guicontrol, Hide, Newg4_ExeFilePathButton
	guicontrol, Hide, Newg4_ExeFilePath
	guicontrol, Hide, Newg4_MBCtrl
	guicontrol, Hide, Newg4_MBAlt
	guicontrol, Hide, Newg4_MBShift
	guicontrol, Hide, Newg4_MBDrag
	}
FileReadLine, isotextNewg4_Label,%A_ScriptDir%\Resources\Functions.txt, Newg4_Label
isotextNewg4_Label := StrSplit(isotextNewg4_Label, ":")
guicontrol, , txtNewg4_Label, % isotextNewg4_Label[2]
Return

g5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg5_ExeFilePath, %A_ScriptDir%, %Newg5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg5_ExeFilePath := SubStr(Newg5_ExeFilePath, ExeFilePathTrim)
	Newg5_ExeFilePath := "%A_WorkingDir%\Resources\"Newg5_ExeFilePath
	}
guicontrol, , Newg5_ExeFilePath, %Newg5_ExeFilePath%
RefNewg5_Label:
Gui, Submit, NoHide
If Newg5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg5_OverrideText
	guicontrol, Show, Newg5_OverrideLabel
	guicontrol, Show, Newg5_ExeFilePathButton
	guicontrol, Show, Newg5_ExeFilePath
	guicontrol, Hide, Newg5_SendKeystroke
	guicontrol, Hide, Newg5_SendKeystrokeText
	guicontrol, Hide, Newg5_MBCtrl
	guicontrol, Hide, Newg5_MBAlt
	guicontrol, Hide, Newg5_MBShift
	guicontrol, Hide, Newg5_MBDrag
	}
If Newg5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg5_OverrideText
	guicontrol, Show, Newg5_OverrideLabel
	guicontrol, Show, Newg5_SendKeystroke
	guicontrol, Show, Newg5_SendKeystrokeText
	guicontrol, Hide, Newg5_ExeFilePathButton
	guicontrol, Hide, Newg5_ExeFilePath
	guicontrol, Hide, Newg5_MBCtrl
	guicontrol, Hide, Newg5_MBAlt
	guicontrol, Hide, Newg5_MBShift
	guicontrol, Hide, Newg5_MBDrag
	}
If Newg5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg5_OverrideText
	guicontrol, Show, Newg5_OverrideLabel
	guicontrol, Hide, Newg5_SendKeystroke
	guicontrol, Hide, Newg5_SendKeystrokeText
	guicontrol, Hide, Newg5_ExeFilePathButton
	guicontrol, Hide, Newg5_ExeFilePath
	guicontrol, Show, Newg5_MBCtrl
	guicontrol, Show, Newg5_MBAlt
	guicontrol, Show, Newg5_MBShift
	guicontrol, Show, Newg5_MBDrag
	}
If Newg5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg5_OverrideText
	guicontrol, Hide, Newg5_OverrideLabel
	guicontrol, Hide, Newg5_SendKeystroke
	guicontrol, Hide, Newg5_SendKeystrokeText
	guicontrol, Hide, Newg5_ExeFilePathButton
	guicontrol, Hide, Newg5_ExeFilePath
	guicontrol, Hide, Newg5_MBCtrl
	guicontrol, Hide, Newg5_MBAlt
	guicontrol, Hide, Newg5_MBShift
	guicontrol, Hide, Newg5_MBDrag
	}
FileReadLine, isotextNewg5_Label,%A_ScriptDir%\Resources\Functions.txt, Newg5_Label
isotextNewg5_Label := StrSplit(isotextNewg5_Label, ":")
guicontrol, , txtNewg5_Label, % isotextNewg5_Label[2]
Return

g6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newg6_ExeFilePath, %A_ScriptDir%, %Newg6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newg6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newg6_ExeFilePath := SubStr(Newg6_ExeFilePath, ExeFilePathTrim)
	Newg6_ExeFilePath := "%A_WorkingDir%\Resources\"Newg6_ExeFilePath
	}
guicontrol, , Newg6_ExeFilePath, %Newg6_ExeFilePath%
RefNewg6_Label:
Gui, Submit, NoHide
If Newg6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newg6_OverrideText
	guicontrol, Show, Newg6_OverrideLabel
	guicontrol, Show, Newg6_ExeFilePathButton
	guicontrol, Show, Newg6_ExeFilePath
	guicontrol, Hide, Newg6_SendKeystroke
	guicontrol, Hide, Newg6_SendKeystrokeText
	guicontrol, Hide, Newg6_MBCtrl
	guicontrol, Hide, Newg6_MBAlt
	guicontrol, Hide, Newg6_MBShift
	guicontrol, Hide, Newg6_MBDrag
	}
If Newg6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newg6_OverrideText
	guicontrol, Show, Newg6_OverrideLabel
	guicontrol, Show, Newg6_SendKeystroke
	guicontrol, Show, Newg6_SendKeystrokeText
	guicontrol, Hide, Newg6_ExeFilePathButton
	guicontrol, Hide, Newg6_ExeFilePath
	guicontrol, Hide, Newg6_MBCtrl
	guicontrol, Hide, Newg6_MBAlt
	guicontrol, Hide, Newg6_MBShift
	guicontrol, Hide, Newg6_MBDrag
	}
If Newg6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newg6_OverrideText
	guicontrol, Show, Newg6_OverrideLabel
	guicontrol, Hide, Newg6_SendKeystroke
	guicontrol, Hide, Newg6_SendKeystrokeText
	guicontrol, Hide, Newg6_ExeFilePathButton
	guicontrol, Hide, Newg6_ExeFilePath
	guicontrol, Show, Newg6_MBCtrl
	guicontrol, Show, Newg6_MBAlt
	guicontrol, Show, Newg6_MBShift
	guicontrol, Show, Newg6_MBDrag
	}
If Newg6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newg6_OverrideText
	guicontrol, Hide, Newg6_OverrideLabel
	guicontrol, Hide, Newg6_SendKeystroke
	guicontrol, Hide, Newg6_SendKeystrokeText
	guicontrol, Hide, Newg6_ExeFilePathButton
	guicontrol, Hide, Newg6_ExeFilePath
	guicontrol, Hide, Newg6_MBCtrl
	guicontrol, Hide, Newg6_MBAlt
	guicontrol, Hide, Newg6_MBShift
	guicontrol, Hide, Newg6_MBDrag
	}
FileReadLine, isotextNewg6_Label,%A_ScriptDir%\Resources\Functions.txt, Newg6_Label
isotextNewg6_Label := StrSplit(isotextNewg6_Label, ":")
guicontrol, , txtNewg6_Label, % isotextNewg6_Label[2]
Return



hnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newhnull_ExeFilePath, %A_ScriptDir%, %Newhnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newhnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newhnull_ExeFilePath := SubStr(Newhnull_ExeFilePath, ExeFilePathTrim)
	Newhnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newhnull_ExeFilePath
	}
guicontrol, , Newhnull_ExeFilePath, %Newhnull_ExeFilePath%
RefNewhnull_Label:
Gui, Submit, NoHide
If Newhnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newhnull_OverrideText
	guicontrol, Show, Newhnull_OverrideLabel
	guicontrol, Show, Newhnull_ExeFilePathButton
	guicontrol, Show, Newhnull_ExeFilePath
	guicontrol, Hide, Newhnull_SendKeystroke
	guicontrol, Hide, Newhnull_SendKeystrokeText
	guicontrol, Hide, Newhnull_MBCtrl
	guicontrol, Hide, Newhnull_MBAlt
	guicontrol, Hide, Newhnull_MBShift
	guicontrol, Hide, Newhnull_MBDrag
	}
If Newhnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newhnull_OverrideText
	guicontrol, Show, Newhnull_OverrideLabel
	guicontrol, Show, Newhnull_SendKeystroke
	guicontrol, Show, Newhnull_SendKeystrokeText
	guicontrol, Hide, Newhnull_ExeFilePathButton
	guicontrol, Hide, Newhnull_ExeFilePath
	guicontrol, Hide, Newhnull_MBCtrl
	guicontrol, Hide, Newhnull_MBAlt
	guicontrol, Hide, Newhnull_MBShift
	guicontrol, Hide, Newhnull_MBDrag
	}
If Newhnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newhnull_OverrideText
	guicontrol, Show, Newhnull_OverrideLabel
	guicontrol, Hide, Newhnull_SendKeystroke
	guicontrol, Hide, Newhnull_SendKeystrokeText
	guicontrol, Hide, Newhnull_ExeFilePathButton
	guicontrol, Hide, Newhnull_ExeFilePath
	guicontrol, Show, Newhnull_MBCtrl
	guicontrol, Show, Newhnull_MBAlt
	guicontrol, Show, Newhnull_MBShift
	guicontrol, Show, Newhnull_MBDrag
	}
If Newhnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newhnull_OverrideText
	guicontrol, Hide, Newhnull_OverrideLabel
	guicontrol, Hide, Newhnull_SendKeystroke
	guicontrol, Hide, Newhnull_SendKeystrokeText
	guicontrol, Hide, Newhnull_ExeFilePathButton
	guicontrol, Hide, Newhnull_ExeFilePath
	guicontrol, Hide, Newhnull_MBCtrl
	guicontrol, Hide, Newhnull_MBAlt
	guicontrol, Hide, Newhnull_MBShift
	guicontrol, Hide, Newhnull_MBDrag
	}
FileReadLine, isotextNewhnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newhnull_Label
isotextNewhnull_Label := StrSplit(isotextNewhnull_Label, ":")
guicontrol, , txtNewhnull_Label, % isotextNewhnull_Label[2]
Return



h1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh1_ExeFilePath, %A_ScriptDir%, %Newh1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh1_ExeFilePath := SubStr(Newh1_ExeFilePath, ExeFilePathTrim)
	Newh1_ExeFilePath := "%A_WorkingDir%\Resources\"Newh1_ExeFilePath
	}
guicontrol, , Newh1_ExeFilePath, %Newh1_ExeFilePath%
RefNewh1_Label:
Gui, Submit, NoHide
If Newh1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh1_OverrideText
	guicontrol, Show, Newh1_OverrideLabel
	guicontrol, Show, Newh1_ExeFilePathButton
	guicontrol, Show, Newh1_ExeFilePath
	guicontrol, Hide, Newh1_SendKeystroke
	guicontrol, Hide, Newh1_SendKeystrokeText
	guicontrol, Hide, Newh1_MBCtrl
	guicontrol, Hide, Newh1_MBAlt
	guicontrol, Hide, Newh1_MBShift
	guicontrol, Hide, Newh1_MBDrag
	}
If Newh1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh1_OverrideText
	guicontrol, Show, Newh1_OverrideLabel
	guicontrol, Show, Newh1_SendKeystroke
	guicontrol, Show, Newh1_SendKeystrokeText
	guicontrol, Hide, Newh1_ExeFilePathButton
	guicontrol, Hide, Newh1_ExeFilePath
	guicontrol, Hide, Newh1_MBCtrl
	guicontrol, Hide, Newh1_MBAlt
	guicontrol, Hide, Newh1_MBShift
	guicontrol, Hide, Newh1_MBDrag
	}
If Newh1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh1_OverrideText
	guicontrol, Show, Newh1_OverrideLabel
	guicontrol, Hide, Newh1_SendKeystroke
	guicontrol, Hide, Newh1_SendKeystrokeText
	guicontrol, Hide, Newh1_ExeFilePathButton
	guicontrol, Hide, Newh1_ExeFilePath
	guicontrol, Show, Newh1_MBCtrl
	guicontrol, Show, Newh1_MBAlt
	guicontrol, Show, Newh1_MBShift
	guicontrol, Show, Newh1_MBDrag
	}
If Newh1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh1_OverrideText
	guicontrol, Hide, Newh1_OverrideLabel
	guicontrol, Hide, Newh1_SendKeystroke
	guicontrol, Hide, Newh1_SendKeystrokeText
	guicontrol, Hide, Newh1_ExeFilePathButton
	guicontrol, Hide, Newh1_ExeFilePath
	guicontrol, Hide, Newh1_MBCtrl
	guicontrol, Hide, Newh1_MBAlt
	guicontrol, Hide, Newh1_MBShift
	guicontrol, Hide, Newh1_MBDrag
	}
FileReadLine, isotextNewh1_Label,%A_ScriptDir%\Resources\Functions.txt, Newh1_Label
isotextNewh1_Label := StrSplit(isotextNewh1_Label, ":")
guicontrol, , txtNewh1_Label, % isotextNewh1_Label[2]
Return

h2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh2_ExeFilePath, %A_ScriptDir%, %Newh2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh2_ExeFilePath := SubStr(Newh2_ExeFilePath, ExeFilePathTrim)
	Newh2_ExeFilePath := "%A_WorkingDir%\Resources\"Newh2_ExeFilePath
	}
guicontrol, , Newh2_ExeFilePath, %Newh2_ExeFilePath%
RefNewh2_Label:
Gui, Submit, NoHide
If Newh2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh2_OverrideText
	guicontrol, Show, Newh2_OverrideLabel
	guicontrol, Show, Newh2_ExeFilePathButton
	guicontrol, Show, Newh2_ExeFilePath
	guicontrol, Hide, Newh2_SendKeystroke
	guicontrol, Hide, Newh2_SendKeystrokeText
	guicontrol, Hide, Newh2_MBCtrl
	guicontrol, Hide, Newh2_MBAlt
	guicontrol, Hide, Newh2_MBShift
	guicontrol, Hide, Newh2_MBDrag
	}
If Newh2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh2_OverrideText
	guicontrol, Show, Newh2_OverrideLabel
	guicontrol, Show, Newh2_SendKeystroke
	guicontrol, Show, Newh2_SendKeystrokeText
	guicontrol, Hide, Newh2_ExeFilePathButton
	guicontrol, Hide, Newh2_ExeFilePath
	guicontrol, Hide, Newh2_MBCtrl
	guicontrol, Hide, Newh2_MBAlt
	guicontrol, Hide, Newh2_MBShift
	guicontrol, Hide, Newh2_MBDrag
	}
If Newh2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh2_OverrideText
	guicontrol, Show, Newh2_OverrideLabel
	guicontrol, Hide, Newh2_SendKeystroke
	guicontrol, Hide, Newh2_SendKeystrokeText
	guicontrol, Hide, Newh2_ExeFilePathButton
	guicontrol, Hide, Newh2_ExeFilePath
	guicontrol, Show, Newh2_MBCtrl
	guicontrol, Show, Newh2_MBAlt
	guicontrol, Show, Newh2_MBShift
	guicontrol, Show, Newh2_MBDrag
	}
If Newh2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh2_OverrideText
	guicontrol, Hide, Newh2_OverrideLabel
	guicontrol, Hide, Newh2_SendKeystroke
	guicontrol, Hide, Newh2_SendKeystrokeText
	guicontrol, Hide, Newh2_ExeFilePathButton
	guicontrol, Hide, Newh2_ExeFilePath
	guicontrol, Hide, Newh2_MBCtrl
	guicontrol, Hide, Newh2_MBAlt
	guicontrol, Hide, Newh2_MBShift
	guicontrol, Hide, Newh2_MBDrag
	}
FileReadLine, isotextNewh2_Label,%A_ScriptDir%\Resources\Functions.txt, Newh2_Label
isotextNewh2_Label := StrSplit(isotextNewh2_Label, ":")
guicontrol, , txtNewh2_Label, % isotextNewh2_Label[2]
Return

h3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh3_ExeFilePath, %A_ScriptDir%, %Newh3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh3_ExeFilePath := SubStr(Newh3_ExeFilePath, ExeFilePathTrim)
	Newh3_ExeFilePath := "%A_WorkingDir%\Resources\"Newh3_ExeFilePath
	}
guicontrol, , Newh3_ExeFilePath, %Newh3_ExeFilePath%
RefNewh3_Label:
Gui, Submit, NoHide
If Newh3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh3_OverrideText
	guicontrol, Show, Newh3_OverrideLabel
	guicontrol, Show, Newh3_ExeFilePathButton
	guicontrol, Show, Newh3_ExeFilePath
	guicontrol, Hide, Newh3_SendKeystroke
	guicontrol, Hide, Newh3_SendKeystrokeText
	guicontrol, Hide, Newh3_MBCtrl
	guicontrol, Hide, Newh3_MBAlt
	guicontrol, Hide, Newh3_MBShift
	guicontrol, Hide, Newh3_MBDrag
	}
If Newh3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh3_OverrideText
	guicontrol, Show, Newh3_OverrideLabel
	guicontrol, Show, Newh3_SendKeystroke
	guicontrol, Show, Newh3_SendKeystrokeText
	guicontrol, Hide, Newh3_ExeFilePathButton
	guicontrol, Hide, Newh3_ExeFilePath
	guicontrol, Hide, Newh3_MBCtrl
	guicontrol, Hide, Newh3_MBAlt
	guicontrol, Hide, Newh3_MBShift
	guicontrol, Hide, Newh3_MBDrag
	}
If Newh3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh3_OverrideText
	guicontrol, Show, Newh3_OverrideLabel
	guicontrol, Hide, Newh3_SendKeystroke
	guicontrol, Hide, Newh3_SendKeystrokeText
	guicontrol, Hide, Newh3_ExeFilePathButton
	guicontrol, Hide, Newh3_ExeFilePath
	guicontrol, Show, Newh3_MBCtrl
	guicontrol, Show, Newh3_MBAlt
	guicontrol, Show, Newh3_MBShift
	guicontrol, Show, Newh3_MBDrag
	}
If Newh3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh3_OverrideText
	guicontrol, Hide, Newh3_OverrideLabel
	guicontrol, Hide, Newh3_SendKeystroke
	guicontrol, Hide, Newh3_SendKeystrokeText
	guicontrol, Hide, Newh3_ExeFilePathButton
	guicontrol, Hide, Newh3_ExeFilePath
	guicontrol, Hide, Newh3_MBCtrl
	guicontrol, Hide, Newh3_MBAlt
	guicontrol, Hide, Newh3_MBShift
	guicontrol, Hide, Newh3_MBDrag
	}
FileReadLine, isotextNewh3_Label,%A_ScriptDir%\Resources\Functions.txt, Newh3_Label
isotextNewh3_Label := StrSplit(isotextNewh3_Label, ":")
guicontrol, , txtNewh3_Label, % isotextNewh3_Label[2]
Return


h4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh4_ExeFilePath, %A_ScriptDir%, %Newh4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh4_ExeFilePath := SubStr(Newh4_ExeFilePath, ExeFilePathTrim)
	Newh4_ExeFilePath := "%A_WorkingDir%\Resources\"Newh4_ExeFilePath
	}
guicontrol, , Newh4_ExeFilePath, %Newh4_ExeFilePath%
RefNewh4_Label:
Gui, Submit, NoHide
If Newh4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh4_OverrideText
	guicontrol, Show, Newh4_OverrideLabel
	guicontrol, Show, Newh4_ExeFilePathButton
	guicontrol, Show, Newh4_ExeFilePath
	guicontrol, Hide, Newh4_SendKeystroke
	guicontrol, Hide, Newh4_SendKeystrokeText
	guicontrol, Hide, Newh4_MBCtrl
	guicontrol, Hide, Newh4_MBAlt
	guicontrol, Hide, Newh4_MBShift
	guicontrol, Hide, Newh4_MBDrag
	}
If Newh4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh4_OverrideText
	guicontrol, Show, Newh4_OverrideLabel
	guicontrol, Show, Newh4_SendKeystroke
	guicontrol, Show, Newh4_SendKeystrokeText
	guicontrol, Hide, Newh4_ExeFilePathButton
	guicontrol, Hide, Newh4_ExeFilePath
	guicontrol, Hide, Newh4_MBCtrl
	guicontrol, Hide, Newh4_MBAlt
	guicontrol, Hide, Newh4_MBShift
	guicontrol, Hide, Newh4_MBDrag
	}
If Newh4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh4_OverrideText
	guicontrol, Show, Newh4_OverrideLabel
	guicontrol, Hide, Newh4_SendKeystroke
	guicontrol, Hide, Newh4_SendKeystrokeText
	guicontrol, Hide, Newh4_ExeFilePathButton
	guicontrol, Hide, Newh4_ExeFilePath
	guicontrol, Show, Newh4_MBCtrl
	guicontrol, Show, Newh4_MBAlt
	guicontrol, Show, Newh4_MBShift
	guicontrol, Show, Newh4_MBDrag
	}
If Newh4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh4_OverrideText
	guicontrol, Hide, Newh4_OverrideLabel
	guicontrol, Hide, Newh4_SendKeystroke
	guicontrol, Hide, Newh4_SendKeystrokeText
	guicontrol, Hide, Newh4_ExeFilePathButton
	guicontrol, Hide, Newh4_ExeFilePath
	guicontrol, Hide, Newh4_MBCtrl
	guicontrol, Hide, Newh4_MBAlt
	guicontrol, Hide, Newh4_MBShift
	guicontrol, Hide, Newh4_MBDrag
	}
FileReadLine, isotextNewh4_Label,%A_ScriptDir%\Resources\Functions.txt, Newh4_Label
isotextNewh4_Label := StrSplit(isotextNewh4_Label, ":")
guicontrol, , txtNewh4_Label, % isotextNewh4_Label[2]
Return

h5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh5_ExeFilePath, %A_ScriptDir%, %Newh5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh5_ExeFilePath := SubStr(Newh5_ExeFilePath, ExeFilePathTrim)
	Newh5_ExeFilePath := "%A_WorkingDir%\Resources\"Newh5_ExeFilePath
	}
guicontrol, , Newh5_ExeFilePath, %Newh5_ExeFilePath%
RefNewh5_Label:
Gui, Submit, NoHide
If Newh5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh5_OverrideText
	guicontrol, Show, Newh5_OverrideLabel
	guicontrol, Show, Newh5_ExeFilePathButton
	guicontrol, Show, Newh5_ExeFilePath
	guicontrol, Hide, Newh5_SendKeystroke
	guicontrol, Hide, Newh5_SendKeystrokeText
	guicontrol, Hide, Newh5_MBCtrl
	guicontrol, Hide, Newh5_MBAlt
	guicontrol, Hide, Newh5_MBShift
	guicontrol, Hide, Newh5_MBDrag
	}
If Newh5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh5_OverrideText
	guicontrol, Show, Newh5_OverrideLabel
	guicontrol, Show, Newh5_SendKeystroke
	guicontrol, Show, Newh5_SendKeystrokeText
	guicontrol, Hide, Newh5_ExeFilePathButton
	guicontrol, Hide, Newh5_ExeFilePath
	guicontrol, Hide, Newh5_MBCtrl
	guicontrol, Hide, Newh5_MBAlt
	guicontrol, Hide, Newh5_MBShift
	guicontrol, Hide, Newh5_MBDrag
	}
If Newh5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh5_OverrideText
	guicontrol, Show, Newh5_OverrideLabel
	guicontrol, Hide, Newh5_SendKeystroke
	guicontrol, Hide, Newh5_SendKeystrokeText
	guicontrol, Hide, Newh5_ExeFilePathButton
	guicontrol, Hide, Newh5_ExeFilePath
	guicontrol, Show, Newh5_MBCtrl
	guicontrol, Show, Newh5_MBAlt
	guicontrol, Show, Newh5_MBShift
	guicontrol, Show, Newh5_MBDrag
	}
If Newh5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh5_OverrideText
	guicontrol, Hide, Newh5_OverrideLabel
	guicontrol, Hide, Newh5_SendKeystroke
	guicontrol, Hide, Newh5_SendKeystrokeText
	guicontrol, Hide, Newh5_ExeFilePathButton
	guicontrol, Hide, Newh5_ExeFilePath
	guicontrol, Hide, Newh5_MBCtrl
	guicontrol, Hide, Newh5_MBAlt
	guicontrol, Hide, Newh5_MBShift
	guicontrol, Hide, Newh5_MBDrag
	}
FileReadLine, isotextNewh5_Label,%A_ScriptDir%\Resources\Functions.txt, Newh5_Label
isotextNewh5_Label := StrSplit(isotextNewh5_Label, ":")
guicontrol, , txtNewh5_Label, % isotextNewh5_Label[2]
Return

h6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newh6_ExeFilePath, %A_ScriptDir%, %Newh6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newh6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newh6_ExeFilePath := SubStr(Newh6_ExeFilePath, ExeFilePathTrim)
	Newh6_ExeFilePath := "%A_WorkingDir%\Resources\"Newh6_ExeFilePath
	}
guicontrol, , Newh6_ExeFilePath, %Newh6_ExeFilePath%
RefNewh6_Label:
Gui, Submit, NoHide
If Newh6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newh6_OverrideText
	guicontrol, Show, Newh6_OverrideLabel
	guicontrol, Show, Newh6_ExeFilePathButton
	guicontrol, Show, Newh6_ExeFilePath
	guicontrol, Hide, Newh6_SendKeystroke
	guicontrol, Hide, Newh6_SendKeystrokeText
	guicontrol, Hide, Newh6_MBCtrl
	guicontrol, Hide, Newh6_MBAlt
	guicontrol, Hide, Newh6_MBShift
	guicontrol, Hide, Newh6_MBDrag
	}
If Newh6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newh6_OverrideText
	guicontrol, Show, Newh6_OverrideLabel
	guicontrol, Show, Newh6_SendKeystroke
	guicontrol, Show, Newh6_SendKeystrokeText
	guicontrol, Hide, Newh6_ExeFilePathButton
	guicontrol, Hide, Newh6_ExeFilePath
	guicontrol, Hide, Newh6_MBCtrl
	guicontrol, Hide, Newh6_MBAlt
	guicontrol, Hide, Newh6_MBShift
	guicontrol, Hide, Newh6_MBDrag
	}
If Newh6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newh6_OverrideText
	guicontrol, Show, Newh6_OverrideLabel
	guicontrol, Hide, Newh6_SendKeystroke
	guicontrol, Hide, Newh6_SendKeystrokeText
	guicontrol, Hide, Newh6_ExeFilePathButton
	guicontrol, Hide, Newh6_ExeFilePath
	guicontrol, Show, Newh6_MBCtrl
	guicontrol, Show, Newh6_MBAlt
	guicontrol, Show, Newh6_MBShift
	guicontrol, Show, Newh6_MBDrag
	}
If Newh6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newh6_OverrideText
	guicontrol, Hide, Newh6_OverrideLabel
	guicontrol, Hide, Newh6_SendKeystroke
	guicontrol, Hide, Newh6_SendKeystrokeText
	guicontrol, Hide, Newh6_ExeFilePathButton
	guicontrol, Hide, Newh6_ExeFilePath
	guicontrol, Hide, Newh6_MBCtrl
	guicontrol, Hide, Newh6_MBAlt
	guicontrol, Hide, Newh6_MBShift
	guicontrol, Hide, Newh6_MBDrag
	}
FileReadLine, isotextNewh6_Label,%A_ScriptDir%\Resources\Functions.txt, Newh6_Label
isotextNewh6_Label := StrSplit(isotextNewh6_Label, ":")
guicontrol, , txtNewh6_Label, % isotextNewh6_Label[2]
Return



inull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newinull_ExeFilePath, %A_ScriptDir%, %Newinull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newinull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newinull_ExeFilePath := SubStr(Newinull_ExeFilePath, ExeFilePathTrim)
	Newinull_ExeFilePath := "%A_WorkingDir%\Resources\"Newinull_ExeFilePath
	}
guicontrol, , Newinull_ExeFilePath, %Newinull_ExeFilePath%
RefNewinull_Label:
Gui, Submit, NoHide
If Newinull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newinull_OverrideText
	guicontrol, Show, Newinull_OverrideLabel
	guicontrol, Show, Newinull_ExeFilePathButton
	guicontrol, Show, Newinull_ExeFilePath
	guicontrol, Hide, Newinull_SendKeystroke
	guicontrol, Hide, Newinull_SendKeystrokeText
	guicontrol, Hide, Newinull_MBCtrl
	guicontrol, Hide, Newinull_MBAlt
	guicontrol, Hide, Newinull_MBShift
	guicontrol, Hide, Newinull_MBDrag
	}
If Newinull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newinull_OverrideText
	guicontrol, Show, Newinull_OverrideLabel
	guicontrol, Show, Newinull_SendKeystroke
	guicontrol, Show, Newinull_SendKeystrokeText
	guicontrol, Hide, Newinull_ExeFilePathButton
	guicontrol, Hide, Newinull_ExeFilePath
	guicontrol, Hide, Newinull_MBCtrl
	guicontrol, Hide, Newinull_MBAlt
	guicontrol, Hide, Newinull_MBShift
	guicontrol, Hide, Newinull_MBDrag
	}
If Newinull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newinull_OverrideText
	guicontrol, Show, Newinull_OverrideLabel
	guicontrol, Hide, Newinull_SendKeystroke
	guicontrol, Hide, Newinull_SendKeystrokeText
	guicontrol, Hide, Newinull_ExeFilePathButton
	guicontrol, Hide, Newinull_ExeFilePath
	guicontrol, Show, Newinull_MBCtrl
	guicontrol, Show, Newinull_MBAlt
	guicontrol, Show, Newinull_MBShift
	guicontrol, Show, Newinull_MBDrag
	}
If Newinull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newinull_OverrideText
	guicontrol, Hide, Newinull_OverrideLabel
	guicontrol, Hide, Newinull_SendKeystroke
	guicontrol, Hide, Newinull_SendKeystrokeText
	guicontrol, Hide, Newinull_ExeFilePathButton
	guicontrol, Hide, Newinull_ExeFilePath
	guicontrol, Hide, Newinull_MBCtrl
	guicontrol, Hide, Newinull_MBAlt
	guicontrol, Hide, Newinull_MBShift
	guicontrol, Hide, Newinull_MBDrag
	}
FileReadLine, isotextNewinull_Label,%A_ScriptDir%\Resources\Functions.txt, Newinull_Label
isotextNewinull_Label := StrSplit(isotextNewinull_Label, ":")
guicontrol, , txtNewinull_Label, % isotextNewinull_Label[2]
Return



i1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi1_ExeFilePath, %A_ScriptDir%, %Newi1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi1_ExeFilePath := SubStr(Newi1_ExeFilePath, ExeFilePathTrim)
	Newi1_ExeFilePath := "%A_WorkingDir%\Resources\"Newi1_ExeFilePath
	}
guicontrol, , Newi1_ExeFilePath, %Newi1_ExeFilePath%
RefNewi1_Label:
Gui, Submit, NoHide
If Newi1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi1_OverrideText
	guicontrol, Show, Newi1_OverrideLabel
	guicontrol, Show, Newi1_ExeFilePathButton
	guicontrol, Show, Newi1_ExeFilePath
	guicontrol, Hide, Newi1_SendKeystroke
	guicontrol, Hide, Newi1_SendKeystrokeText
	guicontrol, Hide, Newi1_MBCtrl
	guicontrol, Hide, Newi1_MBAlt
	guicontrol, Hide, Newi1_MBShift
	guicontrol, Hide, Newi1_MBDrag
	}
If Newi1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi1_OverrideText
	guicontrol, Show, Newi1_OverrideLabel
	guicontrol, Show, Newi1_SendKeystroke
	guicontrol, Show, Newi1_SendKeystrokeText
	guicontrol, Hide, Newi1_ExeFilePathButton
	guicontrol, Hide, Newi1_ExeFilePath
	guicontrol, Hide, Newi1_MBCtrl
	guicontrol, Hide, Newi1_MBAlt
	guicontrol, Hide, Newi1_MBShift
	guicontrol, Hide, Newi1_MBDrag
	}
If Newi1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi1_OverrideText
	guicontrol, Show, Newi1_OverrideLabel
	guicontrol, Hide, Newi1_SendKeystroke
	guicontrol, Hide, Newi1_SendKeystrokeText
	guicontrol, Hide, Newi1_ExeFilePathButton
	guicontrol, Hide, Newi1_ExeFilePath
	guicontrol, Show, Newi1_MBCtrl
	guicontrol, Show, Newi1_MBAlt
	guicontrol, Show, Newi1_MBShift
	guicontrol, Show, Newi1_MBDrag
	}
If Newi1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi1_OverrideText
	guicontrol, Hide, Newi1_OverrideLabel
	guicontrol, Hide, Newi1_SendKeystroke
	guicontrol, Hide, Newi1_SendKeystrokeText
	guicontrol, Hide, Newi1_ExeFilePathButton
	guicontrol, Hide, Newi1_ExeFilePath
	guicontrol, Hide, Newi1_MBCtrl
	guicontrol, Hide, Newi1_MBAlt
	guicontrol, Hide, Newi1_MBShift
	guicontrol, Hide, Newi1_MBDrag
	}
FileReadLine, isotextNewi1_Label,%A_ScriptDir%\Resources\Functions.txt, Newi1_Label
isotextNewi1_Label := StrSplit(isotextNewi1_Label, ":")
guicontrol, , txtNewi1_Label, % isotextNewi1_Label[2]
Return

i2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi2_ExeFilePath, %A_ScriptDir%, %Newi2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi2_ExeFilePath := SubStr(Newi2_ExeFilePath, ExeFilePathTrim)
	Newi2_ExeFilePath := "%A_WorkingDir%\Resources\"Newi2_ExeFilePath
	}
guicontrol, , Newi2_ExeFilePath, %Newi2_ExeFilePath%
RefNewi2_Label:
Gui, Submit, NoHide
If Newi2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi2_OverrideText
	guicontrol, Show, Newi2_OverrideLabel
	guicontrol, Show, Newi2_ExeFilePathButton
	guicontrol, Show, Newi2_ExeFilePath
	guicontrol, Hide, Newi2_SendKeystroke
	guicontrol, Hide, Newi2_SendKeystrokeText
	guicontrol, Hide, Newi2_MBCtrl
	guicontrol, Hide, Newi2_MBAlt
	guicontrol, Hide, Newi2_MBShift
	guicontrol, Hide, Newi2_MBDrag
	}
If Newi2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi2_OverrideText
	guicontrol, Show, Newi2_OverrideLabel
	guicontrol, Show, Newi2_SendKeystroke
	guicontrol, Show, Newi2_SendKeystrokeText
	guicontrol, Hide, Newi2_ExeFilePathButton
	guicontrol, Hide, Newi2_ExeFilePath
	guicontrol, Hide, Newi2_MBCtrl
	guicontrol, Hide, Newi2_MBAlt
	guicontrol, Hide, Newi2_MBShift
	guicontrol, Hide, Newi2_MBDrag
	}
If Newi2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi2_OverrideText
	guicontrol, Show, Newi2_OverrideLabel
	guicontrol, Hide, Newi2_SendKeystroke
	guicontrol, Hide, Newi2_SendKeystrokeText
	guicontrol, Hide, Newi2_ExeFilePathButton
	guicontrol, Hide, Newi2_ExeFilePath
	guicontrol, Show, Newi2_MBCtrl
	guicontrol, Show, Newi2_MBAlt
	guicontrol, Show, Newi2_MBShift
	guicontrol, Show, Newi2_MBDrag
	}
If Newi2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi2_OverrideText
	guicontrol, Hide, Newi2_OverrideLabel
	guicontrol, Hide, Newi2_SendKeystroke
	guicontrol, Hide, Newi2_SendKeystrokeText
	guicontrol, Hide, Newi2_ExeFilePathButton
	guicontrol, Hide, Newi2_ExeFilePath
	guicontrol, Hide, Newi2_MBCtrl
	guicontrol, Hide, Newi2_MBAlt
	guicontrol, Hide, Newi2_MBShift
	guicontrol, Hide, Newi2_MBDrag
	}
FileReadLine, isotextNewi2_Label,%A_ScriptDir%\Resources\Functions.txt, Newi2_Label
isotextNewi2_Label := StrSplit(isotextNewi2_Label, ":")
guicontrol, , txtNewi2_Label, % isotextNewi2_Label[2]
Return

i3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi3_ExeFilePath, %A_ScriptDir%, %Newi3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi3_ExeFilePath := SubStr(Newi3_ExeFilePath, ExeFilePathTrim)
	Newi3_ExeFilePath := "%A_WorkingDir%\Resources\"Newi3_ExeFilePath
	}
guicontrol, , Newi3_ExeFilePath, %Newi3_ExeFilePath%
RefNewi3_Label:
Gui, Submit, NoHide
If Newi3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi3_OverrideText
	guicontrol, Show, Newi3_OverrideLabel
	guicontrol, Show, Newi3_ExeFilePathButton
	guicontrol, Show, Newi3_ExeFilePath
	guicontrol, Hide, Newi3_SendKeystroke
	guicontrol, Hide, Newi3_SendKeystrokeText
	guicontrol, Hide, Newi3_MBCtrl
	guicontrol, Hide, Newi3_MBAlt
	guicontrol, Hide, Newi3_MBShift
	guicontrol, Hide, Newi3_MBDrag
	}
If Newi3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi3_OverrideText
	guicontrol, Show, Newi3_OverrideLabel
	guicontrol, Show, Newi3_SendKeystroke
	guicontrol, Show, Newi3_SendKeystrokeText
	guicontrol, Hide, Newi3_ExeFilePathButton
	guicontrol, Hide, Newi3_ExeFilePath
	guicontrol, Hide, Newi3_MBCtrl
	guicontrol, Hide, Newi3_MBAlt
	guicontrol, Hide, Newi3_MBShift
	guicontrol, Hide, Newi3_MBDrag
	}
If Newi3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi3_OverrideText
	guicontrol, Show, Newi3_OverrideLabel
	guicontrol, Hide, Newi3_SendKeystroke
	guicontrol, Hide, Newi3_SendKeystrokeText
	guicontrol, Hide, Newi3_ExeFilePathButton
	guicontrol, Hide, Newi3_ExeFilePath
	guicontrol, Show, Newi3_MBCtrl
	guicontrol, Show, Newi3_MBAlt
	guicontrol, Show, Newi3_MBShift
	guicontrol, Show, Newi3_MBDrag
	}
If Newi3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi3_OverrideText
	guicontrol, Hide, Newi3_OverrideLabel
	guicontrol, Hide, Newi3_SendKeystroke
	guicontrol, Hide, Newi3_SendKeystrokeText
	guicontrol, Hide, Newi3_ExeFilePathButton
	guicontrol, Hide, Newi3_ExeFilePath
	guicontrol, Hide, Newi3_MBCtrl
	guicontrol, Hide, Newi3_MBAlt
	guicontrol, Hide, Newi3_MBShift
	guicontrol, Hide, Newi3_MBDrag
	}
FileReadLine, isotextNewi3_Label,%A_ScriptDir%\Resources\Functions.txt, Newi3_Label
isotextNewi3_Label := StrSplit(isotextNewi3_Label, ":")
guicontrol, , txtNewi3_Label, % isotextNewi3_Label[2]
Return


i4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi4_ExeFilePath, %A_ScriptDir%, %Newi4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi4_ExeFilePath := SubStr(Newi4_ExeFilePath, ExeFilePathTrim)
	Newi4_ExeFilePath := "%A_WorkingDir%\Resources\"Newi4_ExeFilePath
	}
guicontrol, , Newi4_ExeFilePath, %Newi4_ExeFilePath%
RefNewi4_Label:
Gui, Submit, NoHide
If Newi4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi4_OverrideText
	guicontrol, Show, Newi4_OverrideLabel
	guicontrol, Show, Newi4_ExeFilePathButton
	guicontrol, Show, Newi4_ExeFilePath
	guicontrol, Hide, Newi4_SendKeystroke
	guicontrol, Hide, Newi4_SendKeystrokeText
	guicontrol, Hide, Newi4_MBCtrl
	guicontrol, Hide, Newi4_MBAlt
	guicontrol, Hide, Newi4_MBShift
	guicontrol, Hide, Newi4_MBDrag
	}
If Newi4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi4_OverrideText
	guicontrol, Show, Newi4_OverrideLabel
	guicontrol, Show, Newi4_SendKeystroke
	guicontrol, Show, Newi4_SendKeystrokeText
	guicontrol, Hide, Newi4_ExeFilePathButton
	guicontrol, Hide, Newi4_ExeFilePath
	guicontrol, Hide, Newi4_MBCtrl
	guicontrol, Hide, Newi4_MBAlt
	guicontrol, Hide, Newi4_MBShift
	guicontrol, Hide, Newi4_MBDrag
	}
If Newi4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi4_OverrideText
	guicontrol, Show, Newi4_OverrideLabel
	guicontrol, Hide, Newi4_SendKeystroke
	guicontrol, Hide, Newi4_SendKeystrokeText
	guicontrol, Hide, Newi4_ExeFilePathButton
	guicontrol, Hide, Newi4_ExeFilePath
	guicontrol, Show, Newi4_MBCtrl
	guicontrol, Show, Newi4_MBAlt
	guicontrol, Show, Newi4_MBShift
	guicontrol, Show, Newi4_MBDrag
	}
If Newi4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi4_OverrideText
	guicontrol, Hide, Newi4_OverrideLabel
	guicontrol, Hide, Newi4_SendKeystroke
	guicontrol, Hide, Newi4_SendKeystrokeText
	guicontrol, Hide, Newi4_ExeFilePathButton
	guicontrol, Hide, Newi4_ExeFilePath
	guicontrol, Hide, Newi4_MBCtrl
	guicontrol, Hide, Newi4_MBAlt
	guicontrol, Hide, Newi4_MBShift
	guicontrol, Hide, Newi4_MBDrag
	}
FileReadLine, isotextNewi4_Label,%A_ScriptDir%\Resources\Functions.txt, Newi4_Label
isotextNewi4_Label := StrSplit(isotextNewi4_Label, ":")
guicontrol, , txtNewi4_Label, % isotextNewi4_Label[2]
Return

i5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi5_ExeFilePath, %A_ScriptDir%, %Newi5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi5_ExeFilePath := SubStr(Newi5_ExeFilePath, ExeFilePathTrim)
	Newi5_ExeFilePath := "%A_WorkingDir%\Resources\"Newi5_ExeFilePath
	}
guicontrol, , Newi5_ExeFilePath, %Newi5_ExeFilePath%
RefNewi5_Label:
Gui, Submit, NoHide
If Newi5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi5_OverrideText
	guicontrol, Show, Newi5_OverrideLabel
	guicontrol, Show, Newi5_ExeFilePathButton
	guicontrol, Show, Newi5_ExeFilePath
	guicontrol, Hide, Newi5_SendKeystroke
	guicontrol, Hide, Newi5_SendKeystrokeText
	guicontrol, Hide, Newi5_MBCtrl
	guicontrol, Hide, Newi5_MBAlt
	guicontrol, Hide, Newi5_MBShift
	guicontrol, Hide, Newi5_MBDrag
	}
If Newi5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi5_OverrideText
	guicontrol, Show, Newi5_OverrideLabel
	guicontrol, Show, Newi5_SendKeystroke
	guicontrol, Show, Newi5_SendKeystrokeText
	guicontrol, Hide, Newi5_ExeFilePathButton
	guicontrol, Hide, Newi5_ExeFilePath
	guicontrol, Hide, Newi5_MBCtrl
	guicontrol, Hide, Newi5_MBAlt
	guicontrol, Hide, Newi5_MBShift
	guicontrol, Hide, Newi5_MBDrag
	}
If Newi5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi5_OverrideText
	guicontrol, Show, Newi5_OverrideLabel
	guicontrol, Hide, Newi5_SendKeystroke
	guicontrol, Hide, Newi5_SendKeystrokeText
	guicontrol, Hide, Newi5_ExeFilePathButton
	guicontrol, Hide, Newi5_ExeFilePath
	guicontrol, Show, Newi5_MBCtrl
	guicontrol, Show, Newi5_MBAlt
	guicontrol, Show, Newi5_MBShift
	guicontrol, Show, Newi5_MBDrag
	}
If Newi5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi5_OverrideText
	guicontrol, Hide, Newi5_OverrideLabel
	guicontrol, Hide, Newi5_SendKeystroke
	guicontrol, Hide, Newi5_SendKeystrokeText
	guicontrol, Hide, Newi5_ExeFilePathButton
	guicontrol, Hide, Newi5_ExeFilePath
	guicontrol, Hide, Newi5_MBCtrl
	guicontrol, Hide, Newi5_MBAlt
	guicontrol, Hide, Newi5_MBShift
	guicontrol, Hide, Newi5_MBDrag
	}
FileReadLine, isotextNewi5_Label,%A_ScriptDir%\Resources\Functions.txt, Newi5_Label
isotextNewi5_Label := StrSplit(isotextNewi5_Label, ":")
guicontrol, , txtNewi5_Label, % isotextNewi5_Label[2]
Return

i6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newi6_ExeFilePath, %A_ScriptDir%, %Newi6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newi6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newi6_ExeFilePath := SubStr(Newi6_ExeFilePath, ExeFilePathTrim)
	Newi6_ExeFilePath := "%A_WorkingDir%\Resources\"Newi6_ExeFilePath
	}
guicontrol, , Newi6_ExeFilePath, %Newi6_ExeFilePath%
RefNewi6_Label:
Gui, Submit, NoHide
If Newi6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newi6_OverrideText
	guicontrol, Show, Newi6_OverrideLabel
	guicontrol, Show, Newi6_ExeFilePathButton
	guicontrol, Show, Newi6_ExeFilePath
	guicontrol, Hide, Newi6_SendKeystroke
	guicontrol, Hide, Newi6_SendKeystrokeText
	guicontrol, Hide, Newi6_MBCtrl
	guicontrol, Hide, Newi6_MBAlt
	guicontrol, Hide, Newi6_MBShift
	guicontrol, Hide, Newi6_MBDrag
	}
If Newi6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newi6_OverrideText
	guicontrol, Show, Newi6_OverrideLabel
	guicontrol, Show, Newi6_SendKeystroke
	guicontrol, Show, Newi6_SendKeystrokeText
	guicontrol, Hide, Newi6_ExeFilePathButton
	guicontrol, Hide, Newi6_ExeFilePath
	guicontrol, Hide, Newi6_MBCtrl
	guicontrol, Hide, Newi6_MBAlt
	guicontrol, Hide, Newi6_MBShift
	guicontrol, Hide, Newi6_MBDrag
	}
If Newi6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newi6_OverrideText
	guicontrol, Show, Newi6_OverrideLabel
	guicontrol, Hide, Newi6_SendKeystroke
	guicontrol, Hide, Newi6_SendKeystrokeText
	guicontrol, Hide, Newi6_ExeFilePathButton
	guicontrol, Hide, Newi6_ExeFilePath
	guicontrol, Show, Newi6_MBCtrl
	guicontrol, Show, Newi6_MBAlt
	guicontrol, Show, Newi6_MBShift
	guicontrol, Show, Newi6_MBDrag
	}
If Newi6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newi6_OverrideText
	guicontrol, Hide, Newi6_OverrideLabel
	guicontrol, Hide, Newi6_SendKeystroke
	guicontrol, Hide, Newi6_SendKeystrokeText
	guicontrol, Hide, Newi6_ExeFilePathButton
	guicontrol, Hide, Newi6_ExeFilePath
	guicontrol, Hide, Newi6_MBCtrl
	guicontrol, Hide, Newi6_MBAlt
	guicontrol, Hide, Newi6_MBShift
	guicontrol, Hide, Newi6_MBDrag
	}
FileReadLine, isotextNewi6_Label,%A_ScriptDir%\Resources\Functions.txt, Newi6_Label
isotextNewi6_Label := StrSplit(isotextNewi6_Label, ":")
guicontrol, , txtNewi6_Label, % isotextNewi6_Label[2]
Return



jnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newjnull_ExeFilePath, %A_ScriptDir%, %Newjnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newjnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newjnull_ExeFilePath := SubStr(Newjnull_ExeFilePath, ExeFilePathTrim)
	Newjnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newjnull_ExeFilePath
	}
guicontrol, , Newjnull_ExeFilePath, %Newjnull_ExeFilePath%
RefNewjnull_Label:
Gui, Submit, NoHide
If Newjnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newjnull_OverrideText
	guicontrol, Show, Newjnull_OverrideLabel
	guicontrol, Show, Newjnull_ExeFilePathButton
	guicontrol, Show, Newjnull_ExeFilePath
	guicontrol, Hide, Newjnull_SendKeystroke
	guicontrol, Hide, Newjnull_SendKeystrokeText
	guicontrol, Hide, Newjnull_MBCtrl
	guicontrol, Hide, Newjnull_MBAlt
	guicontrol, Hide, Newjnull_MBShift
	guicontrol, Hide, Newjnull_MBDrag
	}
If Newjnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newjnull_OverrideText
	guicontrol, Show, Newjnull_OverrideLabel
	guicontrol, Show, Newjnull_SendKeystroke
	guicontrol, Show, Newjnull_SendKeystrokeText
	guicontrol, Hide, Newjnull_ExeFilePathButton
	guicontrol, Hide, Newjnull_ExeFilePath
	guicontrol, Hide, Newjnull_MBCtrl
	guicontrol, Hide, Newjnull_MBAlt
	guicontrol, Hide, Newjnull_MBShift
	guicontrol, Hide, Newjnull_MBDrag
	}
If Newjnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newjnull_OverrideText
	guicontrol, Show, Newjnull_OverrideLabel
	guicontrol, Hide, Newjnull_SendKeystroke
	guicontrol, Hide, Newjnull_SendKeystrokeText
	guicontrol, Hide, Newjnull_ExeFilePathButton
	guicontrol, Hide, Newjnull_ExeFilePath
	guicontrol, Show, Newjnull_MBCtrl
	guicontrol, Show, Newjnull_MBAlt
	guicontrol, Show, Newjnull_MBShift
	guicontrol, Show, Newjnull_MBDrag
	}
If Newjnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newjnull_OverrideText
	guicontrol, Hide, Newjnull_OverrideLabel
	guicontrol, Hide, Newjnull_SendKeystroke
	guicontrol, Hide, Newjnull_SendKeystrokeText
	guicontrol, Hide, Newjnull_ExeFilePathButton
	guicontrol, Hide, Newjnull_ExeFilePath
	guicontrol, Hide, Newjnull_MBCtrl
	guicontrol, Hide, Newjnull_MBAlt
	guicontrol, Hide, Newjnull_MBShift
	guicontrol, Hide, Newjnull_MBDrag
	}
FileReadLine, isotextNewjnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newjnull_Label
isotextNewjnull_Label := StrSplit(isotextNewjnull_Label, ":")
guicontrol, , txtNewjnull_Label, % isotextNewjnull_Label[2]
Return



j1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj1_ExeFilePath, %A_ScriptDir%, %Newj1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj1_ExeFilePath := SubStr(Newj1_ExeFilePath, ExeFilePathTrim)
	Newj1_ExeFilePath := "%A_WorkingDir%\Resources\"Newj1_ExeFilePath
	}
guicontrol, , Newj1_ExeFilePath, %Newj1_ExeFilePath%
RefNewj1_Label:
Gui, Submit, NoHide
If Newj1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj1_OverrideText
	guicontrol, Show, Newj1_OverrideLabel
	guicontrol, Show, Newj1_ExeFilePathButton
	guicontrol, Show, Newj1_ExeFilePath
	guicontrol, Hide, Newj1_SendKeystroke
	guicontrol, Hide, Newj1_SendKeystrokeText
	guicontrol, Hide, Newj1_MBCtrl
	guicontrol, Hide, Newj1_MBAlt
	guicontrol, Hide, Newj1_MBShift
	guicontrol, Hide, Newj1_MBDrag
	}
If Newj1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj1_OverrideText
	guicontrol, Show, Newj1_OverrideLabel
	guicontrol, Show, Newj1_SendKeystroke
	guicontrol, Show, Newj1_SendKeystrokeText
	guicontrol, Hide, Newj1_ExeFilePathButton
	guicontrol, Hide, Newj1_ExeFilePath
	guicontrol, Hide, Newj1_MBCtrl
	guicontrol, Hide, Newj1_MBAlt
	guicontrol, Hide, Newj1_MBShift
	guicontrol, Hide, Newj1_MBDrag
	}
If Newj1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj1_OverrideText
	guicontrol, Show, Newj1_OverrideLabel
	guicontrol, Hide, Newj1_SendKeystroke
	guicontrol, Hide, Newj1_SendKeystrokeText
	guicontrol, Hide, Newj1_ExeFilePathButton
	guicontrol, Hide, Newj1_ExeFilePath
	guicontrol, Show, Newj1_MBCtrl
	guicontrol, Show, Newj1_MBAlt
	guicontrol, Show, Newj1_MBShift
	guicontrol, Show, Newj1_MBDrag
	}
If Newj1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj1_OverrideText
	guicontrol, Hide, Newj1_OverrideLabel
	guicontrol, Hide, Newj1_SendKeystroke
	guicontrol, Hide, Newj1_SendKeystrokeText
	guicontrol, Hide, Newj1_ExeFilePathButton
	guicontrol, Hide, Newj1_ExeFilePath
	guicontrol, Hide, Newj1_MBCtrl
	guicontrol, Hide, Newj1_MBAlt
	guicontrol, Hide, Newj1_MBShift
	guicontrol, Hide, Newj1_MBDrag
	}
FileReadLine, isotextNewj1_Label,%A_ScriptDir%\Resources\Functions.txt, Newj1_Label
isotextNewj1_Label := StrSplit(isotextNewj1_Label, ":")
guicontrol, , txtNewj1_Label, % isotextNewj1_Label[2]
Return

j2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj2_ExeFilePath, %A_ScriptDir%, %Newj2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj2_ExeFilePath := SubStr(Newj2_ExeFilePath, ExeFilePathTrim)
	Newj2_ExeFilePath := "%A_WorkingDir%\Resources\"Newj2_ExeFilePath
	}
guicontrol, , Newj2_ExeFilePath, %Newj2_ExeFilePath%
RefNewj2_Label:
Gui, Submit, NoHide
If Newj2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj2_OverrideText
	guicontrol, Show, Newj2_OverrideLabel
	guicontrol, Show, Newj2_ExeFilePathButton
	guicontrol, Show, Newj2_ExeFilePath
	guicontrol, Hide, Newj2_SendKeystroke
	guicontrol, Hide, Newj2_SendKeystrokeText
	guicontrol, Hide, Newj2_MBCtrl
	guicontrol, Hide, Newj2_MBAlt
	guicontrol, Hide, Newj2_MBShift
	guicontrol, Hide, Newj2_MBDrag
	}
If Newj2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj2_OverrideText
	guicontrol, Show, Newj2_OverrideLabel
	guicontrol, Show, Newj2_SendKeystroke
	guicontrol, Show, Newj2_SendKeystrokeText
	guicontrol, Hide, Newj2_ExeFilePathButton
	guicontrol, Hide, Newj2_ExeFilePath
	guicontrol, Hide, Newj2_MBCtrl
	guicontrol, Hide, Newj2_MBAlt
	guicontrol, Hide, Newj2_MBShift
	guicontrol, Hide, Newj2_MBDrag
	}
If Newj2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj2_OverrideText
	guicontrol, Show, Newj2_OverrideLabel
	guicontrol, Hide, Newj2_SendKeystroke
	guicontrol, Hide, Newj2_SendKeystrokeText
	guicontrol, Hide, Newj2_ExeFilePathButton
	guicontrol, Hide, Newj2_ExeFilePath
	guicontrol, Show, Newj2_MBCtrl
	guicontrol, Show, Newj2_MBAlt
	guicontrol, Show, Newj2_MBShift
	guicontrol, Show, Newj2_MBDrag
	}
If Newj2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj2_OverrideText
	guicontrol, Hide, Newj2_OverrideLabel
	guicontrol, Hide, Newj2_SendKeystroke
	guicontrol, Hide, Newj2_SendKeystrokeText
	guicontrol, Hide, Newj2_ExeFilePathButton
	guicontrol, Hide, Newj2_ExeFilePath
	guicontrol, Hide, Newj2_MBCtrl
	guicontrol, Hide, Newj2_MBAlt
	guicontrol, Hide, Newj2_MBShift
	guicontrol, Hide, Newj2_MBDrag
	}
FileReadLine, isotextNewj2_Label,%A_ScriptDir%\Resources\Functions.txt, Newj2_Label
isotextNewj2_Label := StrSplit(isotextNewj2_Label, ":")
guicontrol, , txtNewj2_Label, % isotextNewj2_Label[2]
Return

j3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj3_ExeFilePath, %A_ScriptDir%, %Newj3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj3_ExeFilePath := SubStr(Newj3_ExeFilePath, ExeFilePathTrim)
	Newj3_ExeFilePath := "%A_WorkingDir%\Resources\"Newj3_ExeFilePath
	}
guicontrol, , Newj3_ExeFilePath, %Newj3_ExeFilePath%
RefNewj3_Label:
Gui, Submit, NoHide
If Newj3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj3_OverrideText
	guicontrol, Show, Newj3_OverrideLabel
	guicontrol, Show, Newj3_ExeFilePathButton
	guicontrol, Show, Newj3_ExeFilePath
	guicontrol, Hide, Newj3_SendKeystroke
	guicontrol, Hide, Newj3_SendKeystrokeText
	guicontrol, Hide, Newj3_MBCtrl
	guicontrol, Hide, Newj3_MBAlt
	guicontrol, Hide, Newj3_MBShift
	guicontrol, Hide, Newj3_MBDrag
	}
If Newj3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj3_OverrideText
	guicontrol, Show, Newj3_OverrideLabel
	guicontrol, Show, Newj3_SendKeystroke
	guicontrol, Show, Newj3_SendKeystrokeText
	guicontrol, Hide, Newj3_ExeFilePathButton
	guicontrol, Hide, Newj3_ExeFilePath
	guicontrol, Hide, Newj3_MBCtrl
	guicontrol, Hide, Newj3_MBAlt
	guicontrol, Hide, Newj3_MBShift
	guicontrol, Hide, Newj3_MBDrag
	}
If Newj3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj3_OverrideText
	guicontrol, Show, Newj3_OverrideLabel
	guicontrol, Hide, Newj3_SendKeystroke
	guicontrol, Hide, Newj3_SendKeystrokeText
	guicontrol, Hide, Newj3_ExeFilePathButton
	guicontrol, Hide, Newj3_ExeFilePath
	guicontrol, Show, Newj3_MBCtrl
	guicontrol, Show, Newj3_MBAlt
	guicontrol, Show, Newj3_MBShift
	guicontrol, Show, Newj3_MBDrag
	}
If Newj3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj3_OverrideText
	guicontrol, Hide, Newj3_OverrideLabel
	guicontrol, Hide, Newj3_SendKeystroke
	guicontrol, Hide, Newj3_SendKeystrokeText
	guicontrol, Hide, Newj3_ExeFilePathButton
	guicontrol, Hide, Newj3_ExeFilePath
	guicontrol, Hide, Newj3_MBCtrl
	guicontrol, Hide, Newj3_MBAlt
	guicontrol, Hide, Newj3_MBShift
	guicontrol, Hide, Newj3_MBDrag
	}
FileReadLine, isotextNewj3_Label,%A_ScriptDir%\Resources\Functions.txt, Newj3_Label
isotextNewj3_Label := StrSplit(isotextNewj3_Label, ":")
guicontrol, , txtNewj3_Label, % isotextNewj3_Label[2]
Return


j4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj4_ExeFilePath, %A_ScriptDir%, %Newj4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj4_ExeFilePath := SubStr(Newj4_ExeFilePath, ExeFilePathTrim)
	Newj4_ExeFilePath := "%A_WorkingDir%\Resources\"Newj4_ExeFilePath
	}
guicontrol, , Newj4_ExeFilePath, %Newj4_ExeFilePath%
RefNewj4_Label:
Gui, Submit, NoHide
If Newj4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj4_OverrideText
	guicontrol, Show, Newj4_OverrideLabel
	guicontrol, Show, Newj4_ExeFilePathButton
	guicontrol, Show, Newj4_ExeFilePath
	guicontrol, Hide, Newj4_SendKeystroke
	guicontrol, Hide, Newj4_SendKeystrokeText
	guicontrol, Hide, Newj4_MBCtrl
	guicontrol, Hide, Newj4_MBAlt
	guicontrol, Hide, Newj4_MBShift
	guicontrol, Hide, Newj4_MBDrag
	}
If Newj4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj4_OverrideText
	guicontrol, Show, Newj4_OverrideLabel
	guicontrol, Show, Newj4_SendKeystroke
	guicontrol, Show, Newj4_SendKeystrokeText
	guicontrol, Hide, Newj4_ExeFilePathButton
	guicontrol, Hide, Newj4_ExeFilePath
	guicontrol, Hide, Newj4_MBCtrl
	guicontrol, Hide, Newj4_MBAlt
	guicontrol, Hide, Newj4_MBShift
	guicontrol, Hide, Newj4_MBDrag
	}
If Newj4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj4_OverrideText
	guicontrol, Show, Newj4_OverrideLabel
	guicontrol, Hide, Newj4_SendKeystroke
	guicontrol, Hide, Newj4_SendKeystrokeText
	guicontrol, Hide, Newj4_ExeFilePathButton
	guicontrol, Hide, Newj4_ExeFilePath
	guicontrol, Show, Newj4_MBCtrl
	guicontrol, Show, Newj4_MBAlt
	guicontrol, Show, Newj4_MBShift
	guicontrol, Show, Newj4_MBDrag
	}
If Newj4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj4_OverrideText
	guicontrol, Hide, Newj4_OverrideLabel
	guicontrol, Hide, Newj4_SendKeystroke
	guicontrol, Hide, Newj4_SendKeystrokeText
	guicontrol, Hide, Newj4_ExeFilePathButton
	guicontrol, Hide, Newj4_ExeFilePath
	guicontrol, Hide, Newj4_MBCtrl
	guicontrol, Hide, Newj4_MBAlt
	guicontrol, Hide, Newj4_MBShift
	guicontrol, Hide, Newj4_MBDrag
	}
FileReadLine, isotextNewj4_Label,%A_ScriptDir%\Resources\Functions.txt, Newj4_Label
isotextNewj4_Label := StrSplit(isotextNewj4_Label, ":")
guicontrol, , txtNewj4_Label, % isotextNewj4_Label[2]
Return

j5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj5_ExeFilePath, %A_ScriptDir%, %Newj5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj5_ExeFilePath := SubStr(Newj5_ExeFilePath, ExeFilePathTrim)
	Newj5_ExeFilePath := "%A_WorkingDir%\Resources\"Newj5_ExeFilePath
	}
guicontrol, , Newj5_ExeFilePath, %Newj5_ExeFilePath%
RefNewj5_Label:
Gui, Submit, NoHide
If Newj5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj5_OverrideText
	guicontrol, Show, Newj5_OverrideLabel
	guicontrol, Show, Newj5_ExeFilePathButton
	guicontrol, Show, Newj5_ExeFilePath
	guicontrol, Hide, Newj5_SendKeystroke
	guicontrol, Hide, Newj5_SendKeystrokeText
	guicontrol, Hide, Newj5_MBCtrl
	guicontrol, Hide, Newj5_MBAlt
	guicontrol, Hide, Newj5_MBShift
	guicontrol, Hide, Newj5_MBDrag
	}
If Newj5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj5_OverrideText
	guicontrol, Show, Newj5_OverrideLabel
	guicontrol, Show, Newj5_SendKeystroke
	guicontrol, Show, Newj5_SendKeystrokeText
	guicontrol, Hide, Newj5_ExeFilePathButton
	guicontrol, Hide, Newj5_ExeFilePath
	guicontrol, Hide, Newj5_MBCtrl
	guicontrol, Hide, Newj5_MBAlt
	guicontrol, Hide, Newj5_MBShift
	guicontrol, Hide, Newj5_MBDrag
	}
If Newj5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj5_OverrideText
	guicontrol, Show, Newj5_OverrideLabel
	guicontrol, Hide, Newj5_SendKeystroke
	guicontrol, Hide, Newj5_SendKeystrokeText
	guicontrol, Hide, Newj5_ExeFilePathButton
	guicontrol, Hide, Newj5_ExeFilePath
	guicontrol, Show, Newj5_MBCtrl
	guicontrol, Show, Newj5_MBAlt
	guicontrol, Show, Newj5_MBShift
	guicontrol, Show, Newj5_MBDrag
	}
If Newj5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj5_OverrideText
	guicontrol, Hide, Newj5_OverrideLabel
	guicontrol, Hide, Newj5_SendKeystroke
	guicontrol, Hide, Newj5_SendKeystrokeText
	guicontrol, Hide, Newj5_ExeFilePathButton
	guicontrol, Hide, Newj5_ExeFilePath
	guicontrol, Hide, Newj5_MBCtrl
	guicontrol, Hide, Newj5_MBAlt
	guicontrol, Hide, Newj5_MBShift
	guicontrol, Hide, Newj5_MBDrag
	}
FileReadLine, isotextNewj5_Label,%A_ScriptDir%\Resources\Functions.txt, Newj5_Label
isotextNewj5_Label := StrSplit(isotextNewj5_Label, ":")
guicontrol, , txtNewj5_Label, % isotextNewj5_Label[2]
Return

j6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newj6_ExeFilePath, %A_ScriptDir%, %Newj6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newj6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newj6_ExeFilePath := SubStr(Newj6_ExeFilePath, ExeFilePathTrim)
	Newj6_ExeFilePath := "%A_WorkingDir%\Resources\"Newj6_ExeFilePath
	}
guicontrol, , Newj6_ExeFilePath, %Newj6_ExeFilePath%
RefNewj6_Label:
Gui, Submit, NoHide
If Newj6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newj6_OverrideText
	guicontrol, Show, Newj6_OverrideLabel
	guicontrol, Show, Newj6_ExeFilePathButton
	guicontrol, Show, Newj6_ExeFilePath
	guicontrol, Hide, Newj6_SendKeystroke
	guicontrol, Hide, Newj6_SendKeystrokeText
	guicontrol, Hide, Newj6_MBCtrl
	guicontrol, Hide, Newj6_MBAlt
	guicontrol, Hide, Newj6_MBShift
	guicontrol, Hide, Newj6_MBDrag
	}
If Newj6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newj6_OverrideText
	guicontrol, Show, Newj6_OverrideLabel
	guicontrol, Show, Newj6_SendKeystroke
	guicontrol, Show, Newj6_SendKeystrokeText
	guicontrol, Hide, Newj6_ExeFilePathButton
	guicontrol, Hide, Newj6_ExeFilePath
	guicontrol, Hide, Newj6_MBCtrl
	guicontrol, Hide, Newj6_MBAlt
	guicontrol, Hide, Newj6_MBShift
	guicontrol, Hide, Newj6_MBDrag
	}
If Newj6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newj6_OverrideText
	guicontrol, Show, Newj6_OverrideLabel
	guicontrol, Hide, Newj6_SendKeystroke
	guicontrol, Hide, Newj6_SendKeystrokeText
	guicontrol, Hide, Newj6_ExeFilePathButton
	guicontrol, Hide, Newj6_ExeFilePath
	guicontrol, Show, Newj6_MBCtrl
	guicontrol, Show, Newj6_MBAlt
	guicontrol, Show, Newj6_MBShift
	guicontrol, Show, Newj6_MBDrag
	}
If Newj6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newj6_OverrideText
	guicontrol, Hide, Newj6_OverrideLabel
	guicontrol, Hide, Newj6_SendKeystroke
	guicontrol, Hide, Newj6_SendKeystrokeText
	guicontrol, Hide, Newj6_ExeFilePathButton
	guicontrol, Hide, Newj6_ExeFilePath
	guicontrol, Hide, Newj6_MBCtrl
	guicontrol, Hide, Newj6_MBAlt
	guicontrol, Hide, Newj6_MBShift
	guicontrol, Hide, Newj6_MBDrag
	}
FileReadLine, isotextNewj6_Label,%A_ScriptDir%\Resources\Functions.txt, Newj6_Label
isotextNewj6_Label := StrSplit(isotextNewj6_Label, ":")
guicontrol, , txtNewj6_Label, % isotextNewj6_Label[2]
Return



knull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newknull_ExeFilePath, %A_ScriptDir%, %Newknull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newknull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newknull_ExeFilePath := SubStr(Newknull_ExeFilePath, ExeFilePathTrim)
	Newknull_ExeFilePath := "%A_WorkingDir%\Resources\"Newknull_ExeFilePath
	}
guicontrol, , Newknull_ExeFilePath, %Newknull_ExeFilePath%
RefNewknull_Label:
Gui, Submit, NoHide
If Newknull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newknull_OverrideText
	guicontrol, Show, Newknull_OverrideLabel
	guicontrol, Show, Newknull_ExeFilePathButton
	guicontrol, Show, Newknull_ExeFilePath
	guicontrol, Hide, Newknull_SendKeystroke
	guicontrol, Hide, Newknull_SendKeystrokeText
	guicontrol, Hide, Newknull_MBCtrl
	guicontrol, Hide, Newknull_MBAlt
	guicontrol, Hide, Newknull_MBShift
	guicontrol, Hide, Newknull_MBDrag
	}
If Newknull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newknull_OverrideText
	guicontrol, Show, Newknull_OverrideLabel
	guicontrol, Show, Newknull_SendKeystroke
	guicontrol, Show, Newknull_SendKeystrokeText
	guicontrol, Hide, Newknull_ExeFilePathButton
	guicontrol, Hide, Newknull_ExeFilePath
	guicontrol, Hide, Newknull_MBCtrl
	guicontrol, Hide, Newknull_MBAlt
	guicontrol, Hide, Newknull_MBShift
	guicontrol, Hide, Newknull_MBDrag
	}
If Newknull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newknull_OverrideText
	guicontrol, Show, Newknull_OverrideLabel
	guicontrol, Hide, Newknull_SendKeystroke
	guicontrol, Hide, Newknull_SendKeystrokeText
	guicontrol, Hide, Newknull_ExeFilePathButton
	guicontrol, Hide, Newknull_ExeFilePath
	guicontrol, Show, Newknull_MBCtrl
	guicontrol, Show, Newknull_MBAlt
	guicontrol, Show, Newknull_MBShift
	guicontrol, Show, Newknull_MBDrag
	}
If Newknull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newknull_OverrideText
	guicontrol, Hide, Newknull_OverrideLabel
	guicontrol, Hide, Newknull_SendKeystroke
	guicontrol, Hide, Newknull_SendKeystrokeText
	guicontrol, Hide, Newknull_ExeFilePathButton
	guicontrol, Hide, Newknull_ExeFilePath
	guicontrol, Hide, Newknull_MBCtrl
	guicontrol, Hide, Newknull_MBAlt
	guicontrol, Hide, Newknull_MBShift
	guicontrol, Hide, Newknull_MBDrag
	}
FileReadLine, isotextNewknull_Label,%A_ScriptDir%\Resources\Functions.txt, Newknull_Label
isotextNewknull_Label := StrSplit(isotextNewknull_Label, ":")
guicontrol, , txtNewknull_Label, % isotextNewknull_Label[2]
Return



k1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk1_ExeFilePath, %A_ScriptDir%, %Newk1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk1_ExeFilePath := SubStr(Newk1_ExeFilePath, ExeFilePathTrim)
	Newk1_ExeFilePath := "%A_WorkingDir%\Resources\"Newk1_ExeFilePath
	}
guicontrol, , Newk1_ExeFilePath, %Newk1_ExeFilePath%
RefNewk1_Label:
Gui, Submit, NoHide
If Newk1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk1_OverrideText
	guicontrol, Show, Newk1_OverrideLabel
	guicontrol, Show, Newk1_ExeFilePathButton
	guicontrol, Show, Newk1_ExeFilePath
	guicontrol, Hide, Newk1_SendKeystroke
	guicontrol, Hide, Newk1_SendKeystrokeText
	guicontrol, Hide, Newk1_MBCtrl
	guicontrol, Hide, Newk1_MBAlt
	guicontrol, Hide, Newk1_MBShift
	guicontrol, Hide, Newk1_MBDrag
	}
If Newk1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk1_OverrideText
	guicontrol, Show, Newk1_OverrideLabel
	guicontrol, Show, Newk1_SendKeystroke
	guicontrol, Show, Newk1_SendKeystrokeText
	guicontrol, Hide, Newk1_ExeFilePathButton
	guicontrol, Hide, Newk1_ExeFilePath
	guicontrol, Hide, Newk1_MBCtrl
	guicontrol, Hide, Newk1_MBAlt
	guicontrol, Hide, Newk1_MBShift
	guicontrol, Hide, Newk1_MBDrag
	}
If Newk1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk1_OverrideText
	guicontrol, Show, Newk1_OverrideLabel
	guicontrol, Hide, Newk1_SendKeystroke
	guicontrol, Hide, Newk1_SendKeystrokeText
	guicontrol, Hide, Newk1_ExeFilePathButton
	guicontrol, Hide, Newk1_ExeFilePath
	guicontrol, Show, Newk1_MBCtrl
	guicontrol, Show, Newk1_MBAlt
	guicontrol, Show, Newk1_MBShift
	guicontrol, Show, Newk1_MBDrag
	}
If Newk1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk1_OverrideText
	guicontrol, Hide, Newk1_OverrideLabel
	guicontrol, Hide, Newk1_SendKeystroke
	guicontrol, Hide, Newk1_SendKeystrokeText
	guicontrol, Hide, Newk1_ExeFilePathButton
	guicontrol, Hide, Newk1_ExeFilePath
	guicontrol, Hide, Newk1_MBCtrl
	guicontrol, Hide, Newk1_MBAlt
	guicontrol, Hide, Newk1_MBShift
	guicontrol, Hide, Newk1_MBDrag
	}
FileReadLine, isotextNewk1_Label,%A_ScriptDir%\Resources\Functions.txt, Newk1_Label
isotextNewk1_Label := StrSplit(isotextNewk1_Label, ":")
guicontrol, , txtNewk1_Label, % isotextNewk1_Label[2]
Return

k2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk2_ExeFilePath, %A_ScriptDir%, %Newk2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk2_ExeFilePath := SubStr(Newk2_ExeFilePath, ExeFilePathTrim)
	Newk2_ExeFilePath := "%A_WorkingDir%\Resources\"Newk2_ExeFilePath
	}
guicontrol, , Newk2_ExeFilePath, %Newk2_ExeFilePath%
RefNewk2_Label:
Gui, Submit, NoHide
If Newk2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk2_OverrideText
	guicontrol, Show, Newk2_OverrideLabel
	guicontrol, Show, Newk2_ExeFilePathButton
	guicontrol, Show, Newk2_ExeFilePath
	guicontrol, Hide, Newk2_SendKeystroke
	guicontrol, Hide, Newk2_SendKeystrokeText
	guicontrol, Hide, Newk2_MBCtrl
	guicontrol, Hide, Newk2_MBAlt
	guicontrol, Hide, Newk2_MBShift
	guicontrol, Hide, Newk2_MBDrag
	}
If Newk2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk2_OverrideText
	guicontrol, Show, Newk2_OverrideLabel
	guicontrol, Show, Newk2_SendKeystroke
	guicontrol, Show, Newk2_SendKeystrokeText
	guicontrol, Hide, Newk2_ExeFilePathButton
	guicontrol, Hide, Newk2_ExeFilePath
	guicontrol, Hide, Newk2_MBCtrl
	guicontrol, Hide, Newk2_MBAlt
	guicontrol, Hide, Newk2_MBShift
	guicontrol, Hide, Newk2_MBDrag
	}
If Newk2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk2_OverrideText
	guicontrol, Show, Newk2_OverrideLabel
	guicontrol, Hide, Newk2_SendKeystroke
	guicontrol, Hide, Newk2_SendKeystrokeText
	guicontrol, Hide, Newk2_ExeFilePathButton
	guicontrol, Hide, Newk2_ExeFilePath
	guicontrol, Show, Newk2_MBCtrl
	guicontrol, Show, Newk2_MBAlt
	guicontrol, Show, Newk2_MBShift
	guicontrol, Show, Newk2_MBDrag
	}
If Newk2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk2_OverrideText
	guicontrol, Hide, Newk2_OverrideLabel
	guicontrol, Hide, Newk2_SendKeystroke
	guicontrol, Hide, Newk2_SendKeystrokeText
	guicontrol, Hide, Newk2_ExeFilePathButton
	guicontrol, Hide, Newk2_ExeFilePath
	guicontrol, Hide, Newk2_MBCtrl
	guicontrol, Hide, Newk2_MBAlt
	guicontrol, Hide, Newk2_MBShift
	guicontrol, Hide, Newk2_MBDrag
	}
FileReadLine, isotextNewk2_Label,%A_ScriptDir%\Resources\Functions.txt, Newk2_Label
isotextNewk2_Label := StrSplit(isotextNewk2_Label, ":")
guicontrol, , txtNewk2_Label, % isotextNewk2_Label[2]
Return

k3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk3_ExeFilePath, %A_ScriptDir%, %Newk3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk3_ExeFilePath := SubStr(Newk3_ExeFilePath, ExeFilePathTrim)
	Newk3_ExeFilePath := "%A_WorkingDir%\Resources\"Newk3_ExeFilePath
	}
guicontrol, , Newk3_ExeFilePath, %Newk3_ExeFilePath%
RefNewk3_Label:
Gui, Submit, NoHide
If Newk3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk3_OverrideText
	guicontrol, Show, Newk3_OverrideLabel
	guicontrol, Show, Newk3_ExeFilePathButton
	guicontrol, Show, Newk3_ExeFilePath
	guicontrol, Hide, Newk3_SendKeystroke
	guicontrol, Hide, Newk3_SendKeystrokeText
	guicontrol, Hide, Newk3_MBCtrl
	guicontrol, Hide, Newk3_MBAlt
	guicontrol, Hide, Newk3_MBShift
	guicontrol, Hide, Newk3_MBDrag
	}
If Newk3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk3_OverrideText
	guicontrol, Show, Newk3_OverrideLabel
	guicontrol, Show, Newk3_SendKeystroke
	guicontrol, Show, Newk3_SendKeystrokeText
	guicontrol, Hide, Newk3_ExeFilePathButton
	guicontrol, Hide, Newk3_ExeFilePath
	guicontrol, Hide, Newk3_MBCtrl
	guicontrol, Hide, Newk3_MBAlt
	guicontrol, Hide, Newk3_MBShift
	guicontrol, Hide, Newk3_MBDrag
	}
If Newk3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk3_OverrideText
	guicontrol, Show, Newk3_OverrideLabel
	guicontrol, Hide, Newk3_SendKeystroke
	guicontrol, Hide, Newk3_SendKeystrokeText
	guicontrol, Hide, Newk3_ExeFilePathButton
	guicontrol, Hide, Newk3_ExeFilePath
	guicontrol, Show, Newk3_MBCtrl
	guicontrol, Show, Newk3_MBAlt
	guicontrol, Show, Newk3_MBShift
	guicontrol, Show, Newk3_MBDrag
	}
If Newk3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk3_OverrideText
	guicontrol, Hide, Newk3_OverrideLabel
	guicontrol, Hide, Newk3_SendKeystroke
	guicontrol, Hide, Newk3_SendKeystrokeText
	guicontrol, Hide, Newk3_ExeFilePathButton
	guicontrol, Hide, Newk3_ExeFilePath
	guicontrol, Hide, Newk3_MBCtrl
	guicontrol, Hide, Newk3_MBAlt
	guicontrol, Hide, Newk3_MBShift
	guicontrol, Hide, Newk3_MBDrag
	}
FileReadLine, isotextNewk3_Label,%A_ScriptDir%\Resources\Functions.txt, Newk3_Label
isotextNewk3_Label := StrSplit(isotextNewk3_Label, ":")
guicontrol, , txtNewk3_Label, % isotextNewk3_Label[2]
Return


k4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk4_ExeFilePath, %A_ScriptDir%, %Newk4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk4_ExeFilePath := SubStr(Newk4_ExeFilePath, ExeFilePathTrim)
	Newk4_ExeFilePath := "%A_WorkingDir%\Resources\"Newk4_ExeFilePath
	}
guicontrol, , Newk4_ExeFilePath, %Newk4_ExeFilePath%
RefNewk4_Label:
Gui, Submit, NoHide
If Newk4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk4_OverrideText
	guicontrol, Show, Newk4_OverrideLabel
	guicontrol, Show, Newk4_ExeFilePathButton
	guicontrol, Show, Newk4_ExeFilePath
	guicontrol, Hide, Newk4_SendKeystroke
	guicontrol, Hide, Newk4_SendKeystrokeText
	guicontrol, Hide, Newk4_MBCtrl
	guicontrol, Hide, Newk4_MBAlt
	guicontrol, Hide, Newk4_MBShift
	guicontrol, Hide, Newk4_MBDrag
	}
If Newk4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk4_OverrideText
	guicontrol, Show, Newk4_OverrideLabel
	guicontrol, Show, Newk4_SendKeystroke
	guicontrol, Show, Newk4_SendKeystrokeText
	guicontrol, Hide, Newk4_ExeFilePathButton
	guicontrol, Hide, Newk4_ExeFilePath
	guicontrol, Hide, Newk4_MBCtrl
	guicontrol, Hide, Newk4_MBAlt
	guicontrol, Hide, Newk4_MBShift
	guicontrol, Hide, Newk4_MBDrag
	}
If Newk4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk4_OverrideText
	guicontrol, Show, Newk4_OverrideLabel
	guicontrol, Hide, Newk4_SendKeystroke
	guicontrol, Hide, Newk4_SendKeystrokeText
	guicontrol, Hide, Newk4_ExeFilePathButton
	guicontrol, Hide, Newk4_ExeFilePath
	guicontrol, Show, Newk4_MBCtrl
	guicontrol, Show, Newk4_MBAlt
	guicontrol, Show, Newk4_MBShift
	guicontrol, Show, Newk4_MBDrag
	}
If Newk4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk4_OverrideText
	guicontrol, Hide, Newk4_OverrideLabel
	guicontrol, Hide, Newk4_SendKeystroke
	guicontrol, Hide, Newk4_SendKeystrokeText
	guicontrol, Hide, Newk4_ExeFilePathButton
	guicontrol, Hide, Newk4_ExeFilePath
	guicontrol, Hide, Newk4_MBCtrl
	guicontrol, Hide, Newk4_MBAlt
	guicontrol, Hide, Newk4_MBShift
	guicontrol, Hide, Newk4_MBDrag
	}
FileReadLine, isotextNewk4_Label,%A_ScriptDir%\Resources\Functions.txt, Newk4_Label
isotextNewk4_Label := StrSplit(isotextNewk4_Label, ":")
guicontrol, , txtNewk4_Label, % isotextNewk4_Label[2]
Return

k5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk5_ExeFilePath, %A_ScriptDir%, %Newk5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk5_ExeFilePath := SubStr(Newk5_ExeFilePath, ExeFilePathTrim)
	Newk5_ExeFilePath := "%A_WorkingDir%\Resources\"Newk5_ExeFilePath
	}
guicontrol, , Newk5_ExeFilePath, %Newk5_ExeFilePath%
RefNewk5_Label:
Gui, Submit, NoHide
If Newk5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk5_OverrideText
	guicontrol, Show, Newk5_OverrideLabel
	guicontrol, Show, Newk5_ExeFilePathButton
	guicontrol, Show, Newk5_ExeFilePath
	guicontrol, Hide, Newk5_SendKeystroke
	guicontrol, Hide, Newk5_SendKeystrokeText
	guicontrol, Hide, Newk5_MBCtrl
	guicontrol, Hide, Newk5_MBAlt
	guicontrol, Hide, Newk5_MBShift
	guicontrol, Hide, Newk5_MBDrag
	}
If Newk5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk5_OverrideText
	guicontrol, Show, Newk5_OverrideLabel
	guicontrol, Show, Newk5_SendKeystroke
	guicontrol, Show, Newk5_SendKeystrokeText
	guicontrol, Hide, Newk5_ExeFilePathButton
	guicontrol, Hide, Newk5_ExeFilePath
	guicontrol, Hide, Newk5_MBCtrl
	guicontrol, Hide, Newk5_MBAlt
	guicontrol, Hide, Newk5_MBShift
	guicontrol, Hide, Newk5_MBDrag
	}
If Newk5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk5_OverrideText
	guicontrol, Show, Newk5_OverrideLabel
	guicontrol, Hide, Newk5_SendKeystroke
	guicontrol, Hide, Newk5_SendKeystrokeText
	guicontrol, Hide, Newk5_ExeFilePathButton
	guicontrol, Hide, Newk5_ExeFilePath
	guicontrol, Show, Newk5_MBCtrl
	guicontrol, Show, Newk5_MBAlt
	guicontrol, Show, Newk5_MBShift
	guicontrol, Show, Newk5_MBDrag
	}
If Newk5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk5_OverrideText
	guicontrol, Hide, Newk5_OverrideLabel
	guicontrol, Hide, Newk5_SendKeystroke
	guicontrol, Hide, Newk5_SendKeystrokeText
	guicontrol, Hide, Newk5_ExeFilePathButton
	guicontrol, Hide, Newk5_ExeFilePath
	guicontrol, Hide, Newk5_MBCtrl
	guicontrol, Hide, Newk5_MBAlt
	guicontrol, Hide, Newk5_MBShift
	guicontrol, Hide, Newk5_MBDrag
	}
FileReadLine, isotextNewk5_Label,%A_ScriptDir%\Resources\Functions.txt, Newk5_Label
isotextNewk5_Label := StrSplit(isotextNewk5_Label, ":")
guicontrol, , txtNewk5_Label, % isotextNewk5_Label[2]
Return

k6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newk6_ExeFilePath, %A_ScriptDir%, %Newk6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newk6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newk6_ExeFilePath := SubStr(Newk6_ExeFilePath, ExeFilePathTrim)
	Newk6_ExeFilePath := "%A_WorkingDir%\Resources\"Newk6_ExeFilePath
	}
guicontrol, , Newk6_ExeFilePath, %Newk6_ExeFilePath%
RefNewk6_Label:
Gui, Submit, NoHide
If Newk6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newk6_OverrideText
	guicontrol, Show, Newk6_OverrideLabel
	guicontrol, Show, Newk6_ExeFilePathButton
	guicontrol, Show, Newk6_ExeFilePath
	guicontrol, Hide, Newk6_SendKeystroke
	guicontrol, Hide, Newk6_SendKeystrokeText
	guicontrol, Hide, Newk6_MBCtrl
	guicontrol, Hide, Newk6_MBAlt
	guicontrol, Hide, Newk6_MBShift
	guicontrol, Hide, Newk6_MBDrag
	}
If Newk6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newk6_OverrideText
	guicontrol, Show, Newk6_OverrideLabel
	guicontrol, Show, Newk6_SendKeystroke
	guicontrol, Show, Newk6_SendKeystrokeText
	guicontrol, Hide, Newk6_ExeFilePathButton
	guicontrol, Hide, Newk6_ExeFilePath
	guicontrol, Hide, Newk6_MBCtrl
	guicontrol, Hide, Newk6_MBAlt
	guicontrol, Hide, Newk6_MBShift
	guicontrol, Hide, Newk6_MBDrag
	}
If Newk6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newk6_OverrideText
	guicontrol, Show, Newk6_OverrideLabel
	guicontrol, Hide, Newk6_SendKeystroke
	guicontrol, Hide, Newk6_SendKeystrokeText
	guicontrol, Hide, Newk6_ExeFilePathButton
	guicontrol, Hide, Newk6_ExeFilePath
	guicontrol, Show, Newk6_MBCtrl
	guicontrol, Show, Newk6_MBAlt
	guicontrol, Show, Newk6_MBShift
	guicontrol, Show, Newk6_MBDrag
	}
If Newk6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newk6_OverrideText
	guicontrol, Hide, Newk6_OverrideLabel
	guicontrol, Hide, Newk6_SendKeystroke
	guicontrol, Hide, Newk6_SendKeystrokeText
	guicontrol, Hide, Newk6_ExeFilePathButton
	guicontrol, Hide, Newk6_ExeFilePath
	guicontrol, Hide, Newk6_MBCtrl
	guicontrol, Hide, Newk6_MBAlt
	guicontrol, Hide, Newk6_MBShift
	guicontrol, Hide, Newk6_MBDrag
	}
FileReadLine, isotextNewk6_Label,%A_ScriptDir%\Resources\Functions.txt, Newk6_Label
isotextNewk6_Label := StrSplit(isotextNewk6_Label, ":")
guicontrol, , txtNewk6_Label, % isotextNewk6_Label[2]
Return



lnull_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newlnull_ExeFilePath, %A_ScriptDir%, %Newlnull_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newlnull_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newlnull_ExeFilePath := SubStr(Newlnull_ExeFilePath, ExeFilePathTrim)
	Newlnull_ExeFilePath := "%A_WorkingDir%\Resources\"Newlnull_ExeFilePath
	}
guicontrol, , Newlnull_ExeFilePath, %Newlnull_ExeFilePath%
RefNewlnull_Label:
Gui, Submit, NoHide
If Newlnull_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newlnull_OverrideText
	guicontrol, Show, Newlnull_OverrideLabel
	guicontrol, Show, Newlnull_ExeFilePathButton
	guicontrol, Show, Newlnull_ExeFilePath
	guicontrol, Hide, Newlnull_SendKeystroke
	guicontrol, Hide, Newlnull_SendKeystrokeText
	guicontrol, Hide, Newlnull_MBCtrl
	guicontrol, Hide, Newlnull_MBAlt
	guicontrol, Hide, Newlnull_MBShift
	guicontrol, Hide, Newlnull_MBDrag
	}
If Newlnull_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newlnull_OverrideText
	guicontrol, Show, Newlnull_OverrideLabel
	guicontrol, Show, Newlnull_SendKeystroke
	guicontrol, Show, Newlnull_SendKeystrokeText
	guicontrol, Hide, Newlnull_ExeFilePathButton
	guicontrol, Hide, Newlnull_ExeFilePath
	guicontrol, Hide, Newlnull_MBCtrl
	guicontrol, Hide, Newlnull_MBAlt
	guicontrol, Hide, Newlnull_MBShift
	guicontrol, Hide, Newlnull_MBDrag
	}
If Newlnull_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newlnull_OverrideText
	guicontrol, Show, Newlnull_OverrideLabel
	guicontrol, Hide, Newlnull_SendKeystroke
	guicontrol, Hide, Newlnull_SendKeystrokeText
	guicontrol, Hide, Newlnull_ExeFilePathButton
	guicontrol, Hide, Newlnull_ExeFilePath
	guicontrol, Show, Newlnull_MBCtrl
	guicontrol, Show, Newlnull_MBAlt
	guicontrol, Show, Newlnull_MBShift
	guicontrol, Show, Newlnull_MBDrag
	}
If Newlnull_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newlnull_OverrideText
	guicontrol, Hide, Newlnull_OverrideLabel
	guicontrol, Hide, Newlnull_SendKeystroke
	guicontrol, Hide, Newlnull_SendKeystrokeText
	guicontrol, Hide, Newlnull_ExeFilePathButton
	guicontrol, Hide, Newlnull_ExeFilePath
	guicontrol, Hide, Newlnull_MBCtrl
	guicontrol, Hide, Newlnull_MBAlt
	guicontrol, Hide, Newlnull_MBShift
	guicontrol, Hide, Newlnull_MBDrag
	}
FileReadLine, isotextNewlnull_Label,%A_ScriptDir%\Resources\Functions.txt, Newlnull_Label
isotextNewlnull_Label := StrSplit(isotextNewlnull_Label, ":")
guicontrol, , txtNewlnull_Label, % isotextNewlnull_Label[2]
Return



l1_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl1_ExeFilePath, %A_ScriptDir%, %Newl1_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl1_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl1_ExeFilePath := SubStr(Newl1_ExeFilePath, ExeFilePathTrim)
	Newl1_ExeFilePath := "%A_WorkingDir%\Resources\"Newl1_ExeFilePath
	}
guicontrol, , Newl1_ExeFilePath, %Newl1_ExeFilePath%
RefNewl1_Label:
Gui, Submit, NoHide
If Newl1_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl1_OverrideText
	guicontrol, Show, Newl1_OverrideLabel
	guicontrol, Show, Newl1_ExeFilePathButton
	guicontrol, Show, Newl1_ExeFilePath
	guicontrol, Hide, Newl1_SendKeystroke
	guicontrol, Hide, Newl1_SendKeystrokeText
	guicontrol, Hide, Newl1_MBCtrl
	guicontrol, Hide, Newl1_MBAlt
	guicontrol, Hide, Newl1_MBShift
	guicontrol, Hide, Newl1_MBDrag
	}
If Newl1_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl1_OverrideText
	guicontrol, Show, Newl1_OverrideLabel
	guicontrol, Show, Newl1_SendKeystroke
	guicontrol, Show, Newl1_SendKeystrokeText
	guicontrol, Hide, Newl1_ExeFilePathButton
	guicontrol, Hide, Newl1_ExeFilePath
	guicontrol, Hide, Newl1_MBCtrl
	guicontrol, Hide, Newl1_MBAlt
	guicontrol, Hide, Newl1_MBShift
	guicontrol, Hide, Newl1_MBDrag
	}
If Newl1_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl1_OverrideText
	guicontrol, Show, Newl1_OverrideLabel
	guicontrol, Hide, Newl1_SendKeystroke
	guicontrol, Hide, Newl1_SendKeystrokeText
	guicontrol, Hide, Newl1_ExeFilePathButton
	guicontrol, Hide, Newl1_ExeFilePath
	guicontrol, Show, Newl1_MBCtrl
	guicontrol, Show, Newl1_MBAlt
	guicontrol, Show, Newl1_MBShift
	guicontrol, Show, Newl1_MBDrag
	}
If Newl1_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl1_OverrideText
	guicontrol, Hide, Newl1_OverrideLabel
	guicontrol, Hide, Newl1_SendKeystroke
	guicontrol, Hide, Newl1_SendKeystrokeText
	guicontrol, Hide, Newl1_ExeFilePathButton
	guicontrol, Hide, Newl1_ExeFilePath
	guicontrol, Hide, Newl1_MBCtrl
	guicontrol, Hide, Newl1_MBAlt
	guicontrol, Hide, Newl1_MBShift
	guicontrol, Hide, Newl1_MBDrag
	}
FileReadLine, isotextNewl1_Label,%A_ScriptDir%\Resources\Functions.txt, Newl1_Label
isotextNewl1_Label := StrSplit(isotextNewl1_Label, ":")
guicontrol, , txtNewl1_Label, % isotextNewl1_Label[2]
Return

l2_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl2_ExeFilePath, %A_ScriptDir%, %Newl2_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl2_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl2_ExeFilePath := SubStr(Newl2_ExeFilePath, ExeFilePathTrim)
	Newl2_ExeFilePath := "%A_WorkingDir%\Resources\"Newl2_ExeFilePath
	}
guicontrol, , Newl2_ExeFilePath, %Newl2_ExeFilePath%
RefNewl2_Label:
Gui, Submit, NoHide
If Newl2_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl2_OverrideText
	guicontrol, Show, Newl2_OverrideLabel
	guicontrol, Show, Newl2_ExeFilePathButton
	guicontrol, Show, Newl2_ExeFilePath
	guicontrol, Hide, Newl2_SendKeystroke
	guicontrol, Hide, Newl2_SendKeystrokeText
	guicontrol, Hide, Newl2_MBCtrl
	guicontrol, Hide, Newl2_MBAlt
	guicontrol, Hide, Newl2_MBShift
	guicontrol, Hide, Newl2_MBDrag
	}
If Newl2_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl2_OverrideText
	guicontrol, Show, Newl2_OverrideLabel
	guicontrol, Show, Newl2_SendKeystroke
	guicontrol, Show, Newl2_SendKeystrokeText
	guicontrol, Hide, Newl2_ExeFilePathButton
	guicontrol, Hide, Newl2_ExeFilePath
	guicontrol, Hide, Newl2_MBCtrl
	guicontrol, Hide, Newl2_MBAlt
	guicontrol, Hide, Newl2_MBShift
	guicontrol, Hide, Newl2_MBDrag
	}
If Newl2_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl2_OverrideText
	guicontrol, Show, Newl2_OverrideLabel
	guicontrol, Hide, Newl2_SendKeystroke
	guicontrol, Hide, Newl2_SendKeystrokeText
	guicontrol, Hide, Newl2_ExeFilePathButton
	guicontrol, Hide, Newl2_ExeFilePath
	guicontrol, Show, Newl2_MBCtrl
	guicontrol, Show, Newl2_MBAlt
	guicontrol, Show, Newl2_MBShift
	guicontrol, Show, Newl2_MBDrag
	}
If Newl2_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl2_OverrideText
	guicontrol, Hide, Newl2_OverrideLabel
	guicontrol, Hide, Newl2_SendKeystroke
	guicontrol, Hide, Newl2_SendKeystrokeText
	guicontrol, Hide, Newl2_ExeFilePathButton
	guicontrol, Hide, Newl2_ExeFilePath
	guicontrol, Hide, Newl2_MBCtrl
	guicontrol, Hide, Newl2_MBAlt
	guicontrol, Hide, Newl2_MBShift
	guicontrol, Hide, Newl2_MBDrag
	}
FileReadLine, isotextNewl2_Label,%A_ScriptDir%\Resources\Functions.txt, Newl2_Label
isotextNewl2_Label := StrSplit(isotextNewl2_Label, ":")
guicontrol, , txtNewl2_Label, % isotextNewl2_Label[2]
Return

l3_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl3_ExeFilePath, %A_ScriptDir%, %Newl3_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl3_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl3_ExeFilePath := SubStr(Newl3_ExeFilePath, ExeFilePathTrim)
	Newl3_ExeFilePath := "%A_WorkingDir%\Resources\"Newl3_ExeFilePath
	}
guicontrol, , Newl3_ExeFilePath, %Newl3_ExeFilePath%
RefNewl3_Label:
Gui, Submit, NoHide
If Newl3_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl3_OverrideText
	guicontrol, Show, Newl3_OverrideLabel
	guicontrol, Show, Newl3_ExeFilePathButton
	guicontrol, Show, Newl3_ExeFilePath
	guicontrol, Hide, Newl3_SendKeystroke
	guicontrol, Hide, Newl3_SendKeystrokeText
	guicontrol, Hide, Newl3_MBCtrl
	guicontrol, Hide, Newl3_MBAlt
	guicontrol, Hide, Newl3_MBShift
	guicontrol, Hide, Newl3_MBDrag
	}
If Newl3_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl3_OverrideText
	guicontrol, Show, Newl3_OverrideLabel
	guicontrol, Show, Newl3_SendKeystroke
	guicontrol, Show, Newl3_SendKeystrokeText
	guicontrol, Hide, Newl3_ExeFilePathButton
	guicontrol, Hide, Newl3_ExeFilePath
	guicontrol, Hide, Newl3_MBCtrl
	guicontrol, Hide, Newl3_MBAlt
	guicontrol, Hide, Newl3_MBShift
	guicontrol, Hide, Newl3_MBDrag
	}
If Newl3_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl3_OverrideText
	guicontrol, Show, Newl3_OverrideLabel
	guicontrol, Hide, Newl3_SendKeystroke
	guicontrol, Hide, Newl3_SendKeystrokeText
	guicontrol, Hide, Newl3_ExeFilePathButton
	guicontrol, Hide, Newl3_ExeFilePath
	guicontrol, Show, Newl3_MBCtrl
	guicontrol, Show, Newl3_MBAlt
	guicontrol, Show, Newl3_MBShift
	guicontrol, Show, Newl3_MBDrag
	}
If Newl3_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl3_OverrideText
	guicontrol, Hide, Newl3_OverrideLabel
	guicontrol, Hide, Newl3_SendKeystroke
	guicontrol, Hide, Newl3_SendKeystrokeText
	guicontrol, Hide, Newl3_ExeFilePathButton
	guicontrol, Hide, Newl3_ExeFilePath
	guicontrol, Hide, Newl3_MBCtrl
	guicontrol, Hide, Newl3_MBAlt
	guicontrol, Hide, Newl3_MBShift
	guicontrol, Hide, Newl3_MBDrag
	}
FileReadLine, isotextNewl3_Label,%A_ScriptDir%\Resources\Functions.txt, Newl3_Label
isotextNewl3_Label := StrSplit(isotextNewl3_Label, ":")
guicontrol, , txtNewl3_Label, % isotextNewl3_Label[2]
Return


l4_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl4_ExeFilePath, %A_ScriptDir%, %Newl4_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl4_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl4_ExeFilePath := SubStr(Newl4_ExeFilePath, ExeFilePathTrim)
	Newl4_ExeFilePath := "%A_WorkingDir%\Resources\"Newl4_ExeFilePath
	}
guicontrol, , Newl4_ExeFilePath, %Newl4_ExeFilePath%
RefNewl4_Label:
Gui, Submit, NoHide
If Newl4_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl4_OverrideText
	guicontrol, Show, Newl4_OverrideLabel
	guicontrol, Show, Newl4_ExeFilePathButton
	guicontrol, Show, Newl4_ExeFilePath
	guicontrol, Hide, Newl4_SendKeystroke
	guicontrol, Hide, Newl4_SendKeystrokeText
	guicontrol, Hide, Newl4_MBCtrl
	guicontrol, Hide, Newl4_MBAlt
	guicontrol, Hide, Newl4_MBShift
	guicontrol, Hide, Newl4_MBDrag
	}
If Newl4_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl4_OverrideText
	guicontrol, Show, Newl4_OverrideLabel
	guicontrol, Show, Newl4_SendKeystroke
	guicontrol, Show, Newl4_SendKeystrokeText
	guicontrol, Hide, Newl4_ExeFilePathButton
	guicontrol, Hide, Newl4_ExeFilePath
	guicontrol, Hide, Newl4_MBCtrl
	guicontrol, Hide, Newl4_MBAlt
	guicontrol, Hide, Newl4_MBShift
	guicontrol, Hide, Newl4_MBDrag
	}
If Newl4_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl4_OverrideText
	guicontrol, Show, Newl4_OverrideLabel
	guicontrol, Hide, Newl4_SendKeystroke
	guicontrol, Hide, Newl4_SendKeystrokeText
	guicontrol, Hide, Newl4_ExeFilePathButton
	guicontrol, Hide, Newl4_ExeFilePath
	guicontrol, Show, Newl4_MBCtrl
	guicontrol, Show, Newl4_MBAlt
	guicontrol, Show, Newl4_MBShift
	guicontrol, Show, Newl4_MBDrag
	}
If Newl4_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl4_OverrideText
	guicontrol, Hide, Newl4_OverrideLabel
	guicontrol, Hide, Newl4_SendKeystroke
	guicontrol, Hide, Newl4_SendKeystrokeText
	guicontrol, Hide, Newl4_ExeFilePathButton
	guicontrol, Hide, Newl4_ExeFilePath
	guicontrol, Hide, Newl4_MBCtrl
	guicontrol, Hide, Newl4_MBAlt
	guicontrol, Hide, Newl4_MBShift
	guicontrol, Hide, Newl4_MBDrag
	}
FileReadLine, isotextNewl4_Label,%A_ScriptDir%\Resources\Functions.txt, Newl4_Label
isotextNewl4_Label := StrSplit(isotextNewl4_Label, ":")
guicontrol, , txtNewl4_Label, % isotextNewl4_Label[2]
Return

l5_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl5_ExeFilePath, %A_ScriptDir%, %Newl5_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl5_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl5_ExeFilePath := SubStr(Newl5_ExeFilePath, ExeFilePathTrim)
	Newl5_ExeFilePath := "%A_WorkingDir%\Resources\"Newl5_ExeFilePath
	}
guicontrol, , Newl5_ExeFilePath, %Newl5_ExeFilePath%
RefNewl5_Label:
Gui, Submit, NoHide
If Newl5_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl5_OverrideText
	guicontrol, Show, Newl5_OverrideLabel
	guicontrol, Show, Newl5_ExeFilePathButton
	guicontrol, Show, Newl5_ExeFilePath
	guicontrol, Hide, Newl5_SendKeystroke
	guicontrol, Hide, Newl5_SendKeystrokeText
	guicontrol, Hide, Newl5_MBCtrl
	guicontrol, Hide, Newl5_MBAlt
	guicontrol, Hide, Newl5_MBShift
	guicontrol, Hide, Newl5_MBDrag
	}
If Newl5_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl5_OverrideText
	guicontrol, Show, Newl5_OverrideLabel
	guicontrol, Show, Newl5_SendKeystroke
	guicontrol, Show, Newl5_SendKeystrokeText
	guicontrol, Hide, Newl5_ExeFilePathButton
	guicontrol, Hide, Newl5_ExeFilePath
	guicontrol, Hide, Newl5_MBCtrl
	guicontrol, Hide, Newl5_MBAlt
	guicontrol, Hide, Newl5_MBShift
	guicontrol, Hide, Newl5_MBDrag
	}
If Newl5_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl5_OverrideText
	guicontrol, Show, Newl5_OverrideLabel
	guicontrol, Hide, Newl5_SendKeystroke
	guicontrol, Hide, Newl5_SendKeystrokeText
	guicontrol, Hide, Newl5_ExeFilePathButton
	guicontrol, Hide, Newl5_ExeFilePath
	guicontrol, Show, Newl5_MBCtrl
	guicontrol, Show, Newl5_MBAlt
	guicontrol, Show, Newl5_MBShift
	guicontrol, Show, Newl5_MBDrag
	}
If Newl5_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl5_OverrideText
	guicontrol, Hide, Newl5_OverrideLabel
	guicontrol, Hide, Newl5_SendKeystroke
	guicontrol, Hide, Newl5_SendKeystrokeText
	guicontrol, Hide, Newl5_ExeFilePathButton
	guicontrol, Hide, Newl5_ExeFilePath
	guicontrol, Hide, Newl5_MBCtrl
	guicontrol, Hide, Newl5_MBAlt
	guicontrol, Hide, Newl5_MBShift
	guicontrol, Hide, Newl5_MBDrag
	}
FileReadLine, isotextNewl5_Label,%A_ScriptDir%\Resources\Functions.txt, Newl5_Label
isotextNewl5_Label := StrSplit(isotextNewl5_Label, ":")
guicontrol, , txtNewl5_Label, % isotextNewl5_Label[2]
Return

l6_SelectFile:
Gui, Submit, NoHide
FileSelectFile, Newl6_ExeFilePath, %A_ScriptDir%, %Newl6_ExeFilePathButton%
ExeFilePathTrim := ""
ExeFilePathTrim := RegExMatch(Newl6_ExeFilePath, "Local Pie Scripts")
If (ExeFilePathTrim > 1)
	{
	Newl6_ExeFilePath := SubStr(Newl6_ExeFilePath, ExeFilePathTrim)
	Newl6_ExeFilePath := "%A_WorkingDir%\Resources\"Newl6_ExeFilePath
	}
guicontrol, , Newl6_ExeFilePath, %Newl6_ExeFilePath%
RefNewl6_Label:
Gui, Submit, NoHide
If Newl6_Label = 3  ;Run Program Function
	{
	guicontrol, Show, Newl6_OverrideText
	guicontrol, Show, Newl6_OverrideLabel
	guicontrol, Show, Newl6_ExeFilePathButton
	guicontrol, Show, Newl6_ExeFilePath
	guicontrol, Hide, Newl6_SendKeystroke
	guicontrol, Hide, Newl6_SendKeystrokeText
	guicontrol, Hide, Newl6_MBCtrl
	guicontrol, Hide, Newl6_MBAlt
	guicontrol, Hide, Newl6_MBShift
	guicontrol, Hide, Newl6_MBDrag
	}
If Newl6_Label = 2  ;SendKey Function
	{
	guicontrol, Show, Newl6_OverrideText
	guicontrol, Show, Newl6_OverrideLabel
	guicontrol, Show, Newl6_SendKeystroke
	guicontrol, Show, Newl6_SendKeystrokeText
	guicontrol, Hide, Newl6_ExeFilePathButton
	guicontrol, Hide, Newl6_ExeFilePath
	guicontrol, Hide, Newl6_MBCtrl
	guicontrol, Hide, Newl6_MBAlt
	guicontrol, Hide, Newl6_MBShift
	guicontrol, Hide, Newl6_MBDrag
	}
If Newl6_Label between 4 and 6  ;Any of the Mouse Click Functions
	{
	guicontrol, Show, Newl6_OverrideText
	guicontrol, Show, Newl6_OverrideLabel
	guicontrol, Hide, Newl6_SendKeystroke
	guicontrol, Hide, Newl6_SendKeystrokeText
	guicontrol, Hide, Newl6_ExeFilePathButton
	guicontrol, Hide, Newl6_ExeFilePath
	guicontrol, Show, Newl6_MBCtrl
	guicontrol, Show, Newl6_MBAlt
	guicontrol, Show, Newl6_MBShift
	guicontrol, Show, Newl6_MBDrag
	}
If Newl6_Label not between 2 and 6 ;Not any of my coolest function are selected.
	{
	guicontrol, Hide, Newl6_OverrideText
	guicontrol, Hide, Newl6_OverrideLabel
	guicontrol, Hide, Newl6_SendKeystroke
	guicontrol, Hide, Newl6_SendKeystrokeText
	guicontrol, Hide, Newl6_ExeFilePathButton
	guicontrol, Hide, Newl6_ExeFilePath
	guicontrol, Hide, Newl6_MBCtrl
	guicontrol, Hide, Newl6_MBAlt
	guicontrol, Hide, Newl6_MBShift
	guicontrol, Hide, Newl6_MBDrag
	}
FileReadLine, isotextNewl6_Label,%A_ScriptDir%\Resources\Functions.txt, Newl6_Label
isotextNewl6_Label := StrSplit(isotextNewl6_Label, ":")
guicontrol, , txtNewl6_Label, % isotextNewl6_Label[2]
Return





PieMethod:
Gui, Submit, NoHide
If 1NewShiftPieMethod = 1
	NewShiftPieMethod := 1
If 2NewShiftPieMethod = 1
	NewShiftPieMethod := 2
If 3NewShiftPieMethod = 1
	NewShiftPieMethod := 3
If 4NewShiftPieMethod = 1
	NewShiftPieMethod := 4
If 5NewShiftPieMethod = 1
	NewShiftPieMethod := 5
; Msgbox, %NewShiftPieMethod%
Return

OK:
Gui, Submit, Nohide
FileDelete, %A_ScriptDir%\Resources\settingsfile.txt
If 1NewShiftPieMethod = 1
	NewShiftPieMethod := 1
If 2NewShiftPieMethod = 1
	NewShiftPieMethod := 2
If 3NewShiftPieMethod = 1
	NewShiftPieMethod := 3
If 4NewShiftPieMethod = 1
	NewShiftPieMethod := 4
If 5NewShiftPieMethod = 1 
	NewShiftPieMethod := 5


Newanull_ClickModifiers = %Newanull_MBCtrl%%Newanull_MBShift%%Newanull_MBAlt%%Newanull_MBDrag%
Newa1_ClickModifiers = %Newa1_MBCtrl%%Newa1_MBShift%%Newa1_MBAlt%%Newa1_MBDrag%
Newa2_ClickModifiers = %Newa2_MBCtrl%%Newa2_MBShift%%Newa2_MBAlt%%Newa2_MBDrag%
Newa3_ClickModifiers = %Newa3_MBCtrl%%Newa3_MBShift%%Newa3_MBAlt%%Newa3_MBDrag%
Newa4_ClickModifiers = %Newa4_MBCtrl%%Newa4_MBShift%%Newa4_MBAlt%%Newa4_MBDrag%
Newa5_ClickModifiers = %Newa5_MBCtrl%%Newa5_MBShift%%Newa5_MBAlt%%Newa5_MBDrag%
Newa6_ClickModifiers = %Newa6_MBCtrl%%Newa6_MBShift%%Newa6_MBAlt%%Newa6_MBDrag%

Newbnull_ClickModifiers = %Newbnull_MBCtrl%%Newbnull_MBShift%%Newbnull_MBAlt%
Newb1_ClickModifiers = %Newb1_MBCtrl%%Newb1_MBShift%%Newb1_MBAlt%%Newb1_MBDrag%
Newb2_ClickModifiers = %Newb2_MBCtrl%%Newb2_MBShift%%Newb2_MBAlt%%Newb2_MBDrag%
Newb3_ClickModifiers = %Newb3_MBCtrl%%Newb3_MBShift%%Newb3_MBAlt%%Newb3_MBDrag%
Newb4_ClickModifiers = %Newb4_MBCtrl%%Newb4_MBShift%%Newb4_MBAlt%%Newb4_MBDrag%
Newb5_ClickModifiers = %Newb5_MBCtrl%%Newb5_MBShift%%Newb5_MBAlt%%Newb5_MBDrag%
Newb6_ClickModifiers = %Newb6_MBCtrl%%Newb6_MBShift%%Newb6_MBAlt%%Newb6_MBDrag%

Newcnull_ClickModifiers = %Newcnull_MBCtrl%%Newcnull_MBShift%%Newcnull_MBAlt%
Newc1_ClickModifiers = %Newc1_MBCtrl%%Newc1_MBShift%%Newc1_MBAlt%%Newc1_MBDrag%
Newc2_ClickModifiers = %Newc2_MBCtrl%%Newc2_MBShift%%Newc2_MBAlt%%Newc2_MBDrag%
Newc3_ClickModifiers = %Newc3_MBCtrl%%Newc3_MBShift%%Newc3_MBAlt%%Newc3_MBDrag%
Newc4_ClickModifiers = %Newc4_MBCtrl%%Newc4_MBShift%%Newc4_MBAlt%%Newc4_MBDrag%
Newc5_ClickModifiers = %Newc5_MBCtrl%%Newc5_MBShift%%Newc5_MBAlt%%Newc5_MBDrag%
Newc6_ClickModifiers = %Newc6_MBCtrl%%Newc6_MBShift%%Newc6_MBAlt%%Newc6_MBDrag%

Newdnull_ClickModifiers = %Newdnull_MBCtrl%%Newdnull_MBShift%%Newdnull_MBAlt%
Newd1_ClickModifiers = %Newd1_MBCtrl%%Newd1_MBShift%%Newd1_MBAlt%%Newd1_MBDrag%
Newd2_ClickModifiers = %Newd2_MBCtrl%%Newd2_MBShift%%Newd2_MBAlt%%Newd2_MBDrag%
Newd3_ClickModifiers = %Newd3_MBCtrl%%Newd3_MBShift%%Newd3_MBAlt%%Newd3_MBDrag%
Newd4_ClickModifiers = %Newd4_MBCtrl%%Newd4_MBShift%%Newd4_MBAlt%%Newd4_MBDrag%
Newd5_ClickModifiers = %Newd5_MBCtrl%%Newd5_MBShift%%Newd5_MBAlt%%Newd5_MBDrag%
Newd6_ClickModifiers = %Newd6_MBCtrl%%Newd6_MBShift%%Newd6_MBAlt%%Newd6_MBDrag%

Newenull_ClickModifiers = %Newenull_MBCtrl%%Newenull_MBShift%%Newenull_MBAlt%
Newe1_ClickModifiers = %Newe1_MBCtrl%%Newe1_MBShift%%Newe1_MBAlt%%Newe1_MBDrag%
Newe2_ClickModifiers = %Newe2_MBCtrl%%Newe2_MBShift%%Newe2_MBAlt%%Newe2_MBDrag%
Newe3_ClickModifiers = %Newe3_MBCtrl%%Newe3_MBShift%%Newe3_MBAlt%%Newe3_MBDrag%
Newe4_ClickModifiers = %Newe4_MBCtrl%%Newe4_MBShift%%Newe4_MBAlt%%Newe4_MBDrag%
Newe5_ClickModifiers = %Newe5_MBCtrl%%Newe5_MBShift%%Newe5_MBAlt%%Newe5_MBDrag%
Newe6_ClickModifiers = %Newe6_MBCtrl%%Newe6_MBShift%%Newe6_MBAlt%%Newe6_MBDrag%

Newfnull_ClickModifiers = %Newfnull_MBCtrl%%Newfnull_MBShift%%Newfnull_MBAlt%
Newf1_ClickModifiers = %Newf1_MBCtrl%%Newf1_MBShift%%Newf1_MBAlt%%Newf1_MBDrag%
Newf2_ClickModifiers = %Newf2_MBCtrl%%Newf2_MBShift%%Newf2_MBAlt%%Newf2_MBDrag%
Newf3_ClickModifiers = %Newf3_MBCtrl%%Newf3_MBShift%%Newf3_MBAlt%%Newf3_MBDrag%
Newf4_ClickModifiers = %Newf4_MBCtrl%%Newf4_MBShift%%Newf4_MBAlt%%Newf4_MBDrag%
Newf5_ClickModifiers = %Newf5_MBCtrl%%Newf5_MBShift%%Newf5_MBAlt%%Newf5_MBDrag%
Newf6_ClickModifiers = %Newf6_MBCtrl%%Newf6_MBShift%%Newf6_MBAlt%%Newf6_MBDrag%

Newgnull_ClickModifiers = %Newgnull_MBCtrl%%Newgnull_MBShift%%Newgnull_MBAlt%
Newg1_ClickModifiers = %Newg1_MBCtrl%%Newg1_MBShift%%Newg1_MBAlt%%Newg1_MBDrag%
Newg2_ClickModifiers = %Newg2_MBCtrl%%Newg2_MBShift%%Newg2_MBAlt%%Newg2_MBDrag%
Newg3_ClickModifiers = %Newg3_MBCtrl%%Newg3_MBShift%%Newg3_MBAlt%%Newg3_MBDrag%
Newg4_ClickModifiers = %Newg4_MBCtrl%%Newg4_MBShift%%Newg4_MBAlt%%Newg4_MBDrag%
Newg5_ClickModifiers = %Newg5_MBCtrl%%Newg5_MBShift%%Newg5_MBAlt%%Newg5_MBDrag%
Newg6_ClickModifiers = %Newg6_MBCtrl%%Newg6_MBShift%%Newg6_MBAlt%%Newg6_MBDrag%

Newhnull_ClickModifiers = %Newhnull_MBCtrl%%Newhnull_MBShift%%Newhnull_MBAlt%
Newh1_ClickModifiers = %Newh1_MBCtrl%%Newh1_MBShift%%Newh1_MBAlt%%Newh1_MBDrag%
Newh2_ClickModifiers = %Newh2_MBCtrl%%Newh2_MBShift%%Newh2_MBAlt%%Newh2_MBDrag%
Newh3_ClickModifiers = %Newh3_MBCtrl%%Newh3_MBShift%%Newh3_MBAlt%%Newh3_MBDrag%
Newh4_ClickModifiers = %Newh4_MBCtrl%%Newh4_MBShift%%Newh4_MBAlt%%Newh4_MBDrag%
Newh5_ClickModifiers = %Newh5_MBCtrl%%Newh5_MBShift%%Newh5_MBAlt%%Newh5_MBDrag%
Newh6_ClickModifiers = %Newh6_MBCtrl%%Newh6_MBShift%%Newh6_MBAlt%%Newh6_MBDrag%

Newinull_ClickModifiers = %Newinull_MBCtrl%%Newinull_MBShift%%Newinull_MBAlt%
Newi1_ClickModifiers = %Newi1_MBCtrl%%Newi1_MBShift%%Newi1_MBAlt%%Newi1_MBDrag%
Newi2_ClickModifiers = %Newi2_MBCtrl%%Newi2_MBShift%%Newi2_MBAlt%%Newi2_MBDrag%
Newi3_ClickModifiers = %Newi3_MBCtrl%%Newi3_MBShift%%Newi3_MBAlt%%Newi3_MBDrag%
Newi4_ClickModifiers = %Newi4_MBCtrl%%Newi4_MBShift%%Newi4_MBAlt%%Newi4_MBDrag%
Newi5_ClickModifiers = %Newi5_MBCtrl%%Newi5_MBShift%%Newi5_MBAlt%%Newi5_MBDrag%
Newi6_ClickModifiers = %Newi6_MBCtrl%%Newi6_MBShift%%Newi6_MBAlt%%Newi6_MBDrag%

Newjnull_ClickModifiers = %Newjnull_MBCtrl%%Newjnull_MBShift%%Newjnull_MBAlt%
Newj1_ClickModifiers = %Newj1_MBCtrl%%Newj1_MBShift%%Newj1_MBAlt%%Newj1_MBDrag%
Newj2_ClickModifiers = %Newj2_MBCtrl%%Newj2_MBShift%%Newj2_MBAlt%%Newj2_MBDrag%
Newj3_ClickModifiers = %Newj3_MBCtrl%%Newj3_MBShift%%Newj3_MBAlt%%Newj3_MBDrag%
Newj4_ClickModifiers = %Newj4_MBCtrl%%Newj4_MBShift%%Newj4_MBAlt%%Newj4_MBDrag%
Newj5_ClickModifiers = %Newj5_MBCtrl%%Newj5_MBShift%%Newj5_MBAlt%%Newj5_MBDrag%
Newj6_ClickModifiers = %Newj6_MBCtrl%%Newj6_MBShift%%Newj6_MBAlt%%Newj6_MBDrag%

Newknull_ClickModifiers = %Newknull_MBCtrl%%Newknull_MBShift%%Newknull_MBAlt%
Newk1_ClickModifiers = %Newk1_MBCtrl%%Newk1_MBShift%%Newk1_MBAlt%%Newk1_MBDrag%
Newk2_ClickModifiers = %Newk2_MBCtrl%%Newk2_MBShift%%Newk2_MBAlt%%Newk2_MBDrag%
Newk3_ClickModifiers = %Newk3_MBCtrl%%Newk3_MBShift%%Newk3_MBAlt%%Newk3_MBDrag%
Newk4_ClickModifiers = %Newk4_MBCtrl%%Newk4_MBShift%%Newk4_MBAlt%%Newk4_MBDrag%
Newk5_ClickModifiers = %Newk5_MBCtrl%%Newk5_MBShift%%Newk5_MBAlt%%Newk5_MBDrag%
Newk6_ClickModifiers = %Newk6_MBCtrl%%Newk6_MBShift%%Newk6_MBAlt%%Newk6_MBDrag%

Newlnull_ClickModifiers = %Newlnull_MBCtrl%%Newlnull_MBShift%%Newlnull_MBAlt%
Newl1_ClickModifiers = %Newl1_MBCtrl%%Newl1_MBShift%%Newl1_MBAlt%%Newl1_MBDrag%
Newl2_ClickModifiers = %Newl2_MBCtrl%%Newl2_MBShift%%Newl2_MBAlt%%Newl2_MBDrag%
Newl3_ClickModifiers = %Newl3_MBCtrl%%Newl3_MBShift%%Newl3_MBAlt%%Newl3_MBDrag%
Newl4_ClickModifiers = %Newl4_MBCtrl%%Newl4_MBShift%%Newl4_MBAlt%%Newl4_MBDrag%
Newl5_ClickModifiers = %Newl5_MBCtrl%%Newl5_MBShift%%Newl5_MBAlt%%Newl5_MBDrag%
Newl6_ClickModifiers = %Newl6_MBCtrl%%Newl6_MBShift%%Newl6_MBAlt%%Newl6_MBDrag%

NewaPieHotkey_Modifiers = %NewaPieHotkey_Ctrl%%NewaPieHotkey_Shift%%NewaPieHotkey_Alt%
NewbPieHotkey_Modifiers = %NewbPieHotkey_Ctrl%%NewbPieHotkey_Shift%%NewbPieHotkey_Alt%
NewcPieHotkey_Modifiers = %NewcPieHotkey_Ctrl%%NewcPieHotkey_Shift%%NewcPieHotkey_Alt%
NewdPieHotkey_Modifiers = %NewdPieHotkey_Ctrl%%NewdPieHotkey_Shift%%NewdPieHotkey_Alt%
NewePieHotkey_Modifiers = %NewePieHotkey_Ctrl%%NewePieHotkey_Shift%%NewePieHotkey_Alt%
NewfPieHotkey_Modifiers = %NewfPieHotkey_Ctrl%%NewfPieHotkey_Shift%%NewfPieHotkey_Alt%
NewgPieHotkey_Modifiers = %NewgPieHotkey_Ctrl%%NewgPieHotkey_Shift%%NewgPieHotkey_Alt%
NewhPieHotkey_Modifiers = %NewhPieHotkey_Ctrl%%NewhPieHotkey_Shift%%NewhPieHotkey_Alt%
NewiPieHotkey_Modifiers = %NewiPieHotkey_Ctrl%%NewiPieHotkey_Shift%%NewiPieHotkey_Alt%
NewjPieHotkey_Modifiers = %NewjPieHotkey_Ctrl%%NewjPieHotkey_Shift%%NewjPieHotkey_Alt%
NewkPieHotkey_Modifiers = %NewkPieHotkey_Ctrl%%NewkPieHotkey_Shift%%NewkPieHotkey_Alt%
NewlPieHotkey_Modifiers = %NewlPieHotkey_Ctrl%%NewlPieHotkey_Shift%%NewlPieHotkey_Alt%


HotkeyInputList = %NewaPieHotkey_Input%%NewaPieHotkey_Modifiers%,%NewbPieHotkey_Input%%NewbPieHotkey_Modifiers%,%NewcPieHotkey_Input%%NewcPieHotkey_Modifiers%,%NewdPieHotkey_Input%%NewdPieHotkey_Modifiers%,%NewePieHotkey_Input%%NewePieHotkey_Modifiers%,%NewfPieHotkey_Input%%NewfPieHotkey_Modifiers%,%NewgPieHotkey_Input%%NewgPieHotkey_Modifiers%,%NewhPieHotkey_Input%%NewhPieHotkey_Modifiers%,%NewiPieHotkey_Input%%NewiPieHotkey_Modifiers%,%NewjPieHotkey_Input%%NewjPieHotkey_Modifiers%,%NewkPieHotkey_Input%%NewkPieHotkey_Modifiers%,%NewlPieHotkey_Input%%NewlPieHotkey_Modifiers%
ClashError = 0

Loop, parse, HotkeyInputList, `, ;newest_15
{
	CurrentHotkey = %A_LoopField%
	CurrentIndex = %A_Index% 
	Clash := 0

	Loop, parse, HotkeyInputList, `,
	{
		TestedHotkey = %A_LoopField%
		TestedIndex = %A_Index%
		If(CurrentHotkey = TestedHotkey) && (CurrentIndex != TestedIndex) ;Checks which Hotkeys have the same PieHotkey_Input/PieHotkey_Modifiers
		{
			BuildClashingKeyList := TestedIndex
			SpecificClashingKeyList = %SpecificClashingKeyList%, a%BuildClashingKeyList%a
			Clash := 1
		}
	}
	If(Clash = 1) ;Checks which Hotkey Clashing Pies are on. If they are on, it triggers the error message variable, and and turns each Hotkey Clashing Pie off. 
		{
		FuncLoopCount := 1
		for each, var_name in ["NewaPieNumberSetting","NewbPieNumberSetting","NewcPieNumberSetting","NewdPieNumberSetting","NewePieNumberSetting","NewfPieNumberSetting","NewgPieNumberSetting","NewhPieNumberSetting","NewiPieNumberSetting","NewjPieNumberSetting","NewkPieNumberSetting","NewlPieNumberSetting"]
			{
     		if (%var_name% = "1") && (CurrentIndex = FuncLoopCount)
				{
         		%var_name% := "0"  ;sets the New PieNumberSetting variable to 0, turning the pie off.
				StringTrimLeft, SpecificClashingKeyList, SpecificClashingKeyList, 1 ;Trims off the extra comma
				ClashingKeyList = %ClashingKeyList%a%CurrentIndex%a clashes with :`t%SpecificClashingKeyList%`n ;Populates a list with pies that have the same hotkey setup for each pie that has clashing hotkeys
				SpecificClashingKeyList = ;clears the list, getting it ready for the next pie
				ClashError = 1
				}
			FuncLoopCount := FuncLoopCount + 1
			}
		}
}

if (ClashError = 1) ;Changes the index numbers of the Clashing Pies to their Pie Tab Labels
	{
	ClashingKeyList := StrReplace(ClashingKeyList, "a1a", NewaPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a2a", NewbPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a3a", NewcPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a4a", NewdPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a5a", NewePieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a6a", NewfPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a7a", NewgPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a8a", NewhPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a9a", NewiPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a10a", NewjPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a11a", NewkPieTabLabel)
	ClashingKeyList := StrReplace(ClashingKeyList, "a12a", NewlPieTabLabel)
	MsgBox, CLASHING HOTKEYS among the following Pies: `n`n%ClashingKeyList% `n`nThese pies have clashing Hotkeys, so they will be disabled. `n`nMake the hotkeys different from one another if you want them enabled.
	}


sleep, 10
FileAppend,
(
%NewPieActivateKeySetting%
%NewPieLabelDelaySetting%
%NewaPieNumberSetting%
%NewbPieNumberSetting%
%NewcPieNumberSetting%
%NewdPieNumberSetting%
%NewePieNumberSetting%
%NewfPieNumberSetting%
%NewgPieNumberSetting%
%NewhPieNumberSetting%
%NewiPieNumberSetting%
%NewjPieNumberSetting%
%NewkPieNumberSetting%
%NewlPieNumberSetting%
%NewShiftPieMethod% 
%NewDisplayTooltipsSetting%

%NewPenTabletActive%
%Newanull_Label%
%Newanull_OverrideLabel%
%Newanull_SendKeystroke%
%Newa1_Label%
%Newa1_OverrideLabel%
%Newa1_SendKeystroke%
%Newa2_Label%
%Newa2_OverrideLabel%
%Newa2_SendKeystroke%
%Newa3_Label%
%Newa3_OverrideLabel%
%Newa3_SendKeystroke%
%Newa4_Label%
%Newa4_OverrideLabel%
%Newa4_SendKeystroke%
%Newa5_Label%
%Newa5_OverrideLabel%
%Newa5_SendKeystroke%
%Newa6_Label%
%Newa6_OverrideLabel%
%Newa6_SendKeystroke%
%NewaPieHotkey_Input%
%Newbnull_Label%
%Newbnull_OverrideLabel%
%Newbnull_SendKeystroke%
%Newb1_Label%
%Newb1_OverrideLabel%
%Newb1_SendKeystroke%
%Newb2_Label%
%Newb2_OverrideLabel%
%Newb2_SendKeystroke%
%Newb3_Label%
%Newb3_OverrideLabel%
%Newb3_SendKeystroke%
%Newb4_Label%
%Newb4_OverrideLabel%
%Newb4_SendKeystroke%
%Newb5_Label%
%Newb5_OverrideLabel%
%Newb5_SendKeystroke%
%Newb6_Label%
%Newb6_OverrideLabel%
%Newb6_SendKeystroke%
%NewbPieHotkey_Input%
%Newcnull_Label%
%Newcnull_OverrideLabel%
%Newcnull_SendKeystroke%
%Newc1_Label%
%Newc1_OverrideLabel%
%Newc1_SendKeystroke%
%Newc2_Label%
%Newc2_OverrideLabel%
%Newc2_SendKeystroke%
%Newc3_Label%
%Newc3_OverrideLabel%
%Newc3_SendKeystroke%
%Newc4_Label%
%Newc4_OverrideLabel%
%Newc4_SendKeystroke%
%Newc5_Label%
%Newc5_OverrideLabel%
%Newc5_SendKeystroke%
%Newc6_Label%
%Newc6_OverrideLabel%
%Newc6_SendKeystroke%
%NewcPieHotkey_Input%
%Newdnull_Label%
%Newdnull_OverrideLabel%
%Newdnull_SendKeystroke%
%Newd1_Label%
%Newd1_OverrideLabel%
%Newd1_SendKeystroke%
%Newd2_Label%
%Newd2_OverrideLabel%
%Newd2_SendKeystroke%
%Newd3_Label%
%Newd3_OverrideLabel%
%Newd3_SendKeystroke%
%Newd4_Label%
%Newd4_OverrideLabel%
%Newd4_SendKeystroke%
%Newd5_Label%
%Newd5_OverrideLabel%
%Newd5_SendKeystroke%
%Newd6_Label%
%Newd6_OverrideLabel%
%Newd6_SendKeystroke%
%NewdPieHotkey_Input%
%Newenull_Label%
%Newenull_OverrideLabel%
%Newenull_SendKeystroke%
%Newe1_Label%
%Newe1_OverrideLabel%
%Newe1_SendKeystroke%
%Newe2_Label%
%Newe2_OverrideLabel%
%Newe2_SendKeystroke%
%Newe3_Label%
%Newe3_OverrideLabel%
%Newe3_SendKeystroke%
%Newe4_Label%
%Newe4_OverrideLabel%
%Newe4_SendKeystroke%
%Newe5_Label%
%Newe5_OverrideLabel%
%Newe5_SendKeystroke%
%Newe6_Label%
%Newe6_OverrideLabel%
%Newe6_SendKeystroke%
%NewePieHotkey_Input%
%Newfnull_Label%
%Newfnull_OverrideLabel%
%Newfnull_SendKeystroke%
%Newf1_Label%
%Newf1_OverrideLabel%
%Newf1_SendKeystroke%
%Newf2_Label%
%Newf2_OverrideLabel%
%Newf2_SendKeystroke%
%Newf3_Label%
%Newf3_OverrideLabel%
%Newf3_SendKeystroke%
%Newf4_Label%
%Newf4_OverrideLabel%
%Newf4_SendKeystroke%
%Newf5_Label%
%Newf5_OverrideLabel%
%Newf5_SendKeystroke%
%Newf6_Label%
%Newf6_OverrideLabel%
%Newf6_SendKeystroke%
%NewfPieHotkey_Input%
%Newgnull_Label%
%Newgnull_OverrideLabel%
%Newgnull_SendKeystroke%
%Newg1_Label%
%Newg1_OverrideLabel%
%Newg1_SendKeystroke%
%Newg2_Label%
%Newg2_OverrideLabel%
%Newg2_SendKeystroke%
%Newg3_Label%
%Newg3_OverrideLabel%
%Newg3_SendKeystroke%
%Newg4_Label%
%Newg4_OverrideLabel%
%Newg4_SendKeystroke%
%Newg5_Label%
%Newg5_OverrideLabel%
%Newg5_SendKeystroke%
%Newg6_Label%
%Newg6_OverrideLabel%
%Newg6_SendKeystroke%
%NewgPieHotkey_Input%
%Newhnull_Label%
%Newhnull_OverrideLabel%
%Newhnull_SendKeystroke%
%Newh1_Label%
%Newh1_OverrideLabel%
%Newh1_SendKeystroke%
%Newh2_Label%
%Newh2_OverrideLabel%
%Newh2_SendKeystroke%
%Newh3_Label%
%Newh3_OverrideLabel%
%Newh3_SendKeystroke%
%Newh4_Label%
%Newh4_OverrideLabel%
%Newh4_SendKeystroke%
%Newh5_Label%
%Newh5_OverrideLabel%
%Newh5_SendKeystroke%
%Newh6_Label%
%Newh6_OverrideLabel%
%Newh6_SendKeystroke%
%NewhPieHotkey_Input%
%Newinull_Label%
%Newinull_OverrideLabel%
%Newinull_SendKeystroke%
%Newi1_Label%
%Newi1_OverrideLabel%
%Newi1_SendKeystroke%
%Newi2_Label%
%Newi2_OverrideLabel%
%Newi2_SendKeystroke%
%Newi3_Label%
%Newi3_OverrideLabel%
%Newi3_SendKeystroke%
%Newi4_Label%
%Newi4_OverrideLabel%
%Newi4_SendKeystroke%
%Newi5_Label%
%Newi5_OverrideLabel%
%Newi5_SendKeystroke%
%Newi6_Label%
%Newi6_OverrideLabel%
%Newi6_SendKeystroke%
%NewiPieHotkey_Input%
%Newjnull_Label%
%Newjnull_OverrideLabel%
%Newjnull_SendKeystroke%
%Newj1_Label%
%Newj1_OverrideLabel%
%Newj1_SendKeystroke%
%Newj2_Label%
%Newj2_OverrideLabel%
%Newj2_SendKeystroke%
%Newj3_Label%
%Newj3_OverrideLabel%
%Newj3_SendKeystroke%
%Newj4_Label%
%Newj4_OverrideLabel%
%Newj4_SendKeystroke%
%Newj5_Label%
%Newj5_OverrideLabel%
%Newj5_SendKeystroke%
%Newj6_Label%
%Newj6_OverrideLabel%
%Newj6_SendKeystroke%
%NewjPieHotkey_Input%
%Newknull_Label%
%Newknull_OverrideLabel%
%Newknull_SendKeystroke%
%Newk1_Label%
%Newk1_OverrideLabel%
%Newk1_SendKeystroke%
%Newk2_Label%
%Newk2_OverrideLabel%
%Newk2_SendKeystroke%
%Newk3_Label%
%Newk3_OverrideLabel%
%Newk3_SendKeystroke%
%Newk4_Label%
%Newk4_OverrideLabel%
%Newk4_SendKeystroke%
%Newk5_Label%
%Newk5_OverrideLabel%
%Newk5_SendKeystroke%
%Newk6_Label%
%Newk6_OverrideLabel%
%Newk6_SendKeystroke%
%NewkPieHotkey_Input%
%Newlnull_Label%
%Newlnull_OverrideLabel%
%Newlnull_SendKeystroke%
%Newl1_Label%
%Newl1_OverrideLabel%
%Newl1_SendKeystroke%
%Newl2_Label%
%Newl2_OverrideLabel%
%Newl2_SendKeystroke%
%Newl3_Label%
%Newl3_OverrideLabel%
%Newl3_SendKeystroke%
%Newl4_Label%
%Newl4_OverrideLabel%
%Newl4_SendKeystroke%
%Newl5_Label%
%Newl5_OverrideLabel%
%Newl5_SendKeystroke%
%Newl6_Label%
%Newl6_OverrideLabel%
%Newl6_SendKeystroke%
%NewlPieHotkey_Input%
%Newanull_ExeFilePath%
%Newa1_ExeFilePath%
%Newa2_ExeFilePath%
%Newa3_ExeFilePath%
%Newa4_ExeFilePath%
%Newa5_ExeFilePath%
%Newa6_ExeFilePath%
%Newbnull_ExeFilePath%
%Newb1_ExeFilePath%
%Newb2_ExeFilePath%
%Newb3_ExeFilePath%
%Newb4_ExeFilePath%
%Newb5_ExeFilePath%
%Newb6_ExeFilePath%
%Newcnull_ExeFilePath%
%Newc1_ExeFilePath%
%Newc2_ExeFilePath%
%Newc3_ExeFilePath%
%Newc4_ExeFilePath%
%Newc5_ExeFilePath%
%Newc6_ExeFilePath%
%Newdnull_ExeFilePath%
%Newd1_ExeFilePath%
%Newd2_ExeFilePath%
%Newd3_ExeFilePath%
%Newd4_ExeFilePath%
%Newd5_ExeFilePath%
%Newd6_ExeFilePath%
%Newenull_ExeFilePath%
%Newe1_ExeFilePath%
%Newe2_ExeFilePath%
%Newe3_ExeFilePath%
%Newe4_ExeFilePath%
%Newe5_ExeFilePath%
%Newe6_ExeFilePath%
%Newfnull_ExeFilePath%
%Newf1_ExeFilePath%
%Newf2_ExeFilePath%
%Newf3_ExeFilePath%
%Newf4_ExeFilePath%
%Newf5_ExeFilePath%
%Newf6_ExeFilePath%
%Newgnull_ExeFilePath%
%Newg1_ExeFilePath%
%Newg2_ExeFilePath%
%Newg3_ExeFilePath%
%Newg4_ExeFilePath%
%Newg5_ExeFilePath%
%Newg6_ExeFilePath%
%Newhnull_ExeFilePath%
%Newh1_ExeFilePath%
%Newh2_ExeFilePath%
%Newh3_ExeFilePath%
%Newh4_ExeFilePath%
%Newh5_ExeFilePath%
%Newh6_ExeFilePath%
%Newinull_ExeFilePath%
%Newi1_ExeFilePath%
%Newi2_ExeFilePath%
%Newi3_ExeFilePath%
%Newi4_ExeFilePath%
%Newi5_ExeFilePath%
%Newi6_ExeFilePath%
%Newjnull_ExeFilePath%
%Newj1_ExeFilePath%
%Newj2_ExeFilePath%
%Newj3_ExeFilePath%
%Newj4_ExeFilePath%
%Newj5_ExeFilePath%
%Newj6_ExeFilePath%
%Newknull_ExeFilePath%
%Newk1_ExeFilePath%
%Newk2_ExeFilePath%
%Newk3_ExeFilePath%
%Newk4_ExeFilePath%
%Newk5_ExeFilePath%
%Newk6_ExeFilePath%
%Newlnull_ExeFilePath%
%Newl1_ExeFilePath%
%Newl2_ExeFilePath%
%Newl3_ExeFilePath%
%Newl4_ExeFilePath%
%Newl5_ExeFilePath%
%Newl6_ExeFilePath%
%NewPieMenuSize%
%Newanull_ClickModifiers%
%Newa1_ClickModifiers%
%Newa2_ClickModifiers%
%Newa3_ClickModifiers%
%Newa4_ClickModifiers%
%Newa5_ClickModifiers%
%Newa6_ClickModifiers%
%Newbnull_ClickModifiers%
%Newb1_ClickModifiers%
%Newb2_ClickModifiers%
%Newb3_ClickModifiers%
%Newb4_ClickModifiers%
%Newb5_ClickModifiers%
%Newb6_ClickModifiers%
%Newcnull_ClickModifiers%
%Newc1_ClickModifiers%
%Newc2_ClickModifiers%
%Newc3_ClickModifiers%
%Newc4_ClickModifiers%
%Newc5_ClickModifiers%
%Newc6_ClickModifiers%
%Newdnull_ClickModifiers%
%Newd1_ClickModifiers%
%Newd2_ClickModifiers%
%Newd3_ClickModifiers%
%Newd4_ClickModifiers%
%Newd5_ClickModifiers%
%Newd6_ClickModifiers%
%Newenull_ClickModifiers%
%Newe1_ClickModifiers%
%Newe2_ClickModifiers%
%Newe3_ClickModifiers%
%Newe4_ClickModifiers%
%Newe5_ClickModifiers%
%Newe6_ClickModifiers%
%Newfnull_ClickModifiers%
%Newf1_ClickModifiers%
%Newf2_ClickModifiers%
%Newf3_ClickModifiers%
%Newf4_ClickModifiers%
%Newf5_ClickModifiers%
%Newf6_ClickModifiers%
%Newgnull_ClickModifiers%
%Newg1_ClickModifiers%
%Newg2_ClickModifiers%
%Newg3_ClickModifiers%
%Newg4_ClickModifiers%
%Newg5_ClickModifiers%
%Newg6_ClickModifiers%
%Newhnull_ClickModifiers%
%Newh1_ClickModifiers%
%Newh2_ClickModifiers%
%Newh3_ClickModifiers%
%Newh4_ClickModifiers%
%Newh5_ClickModifiers%
%Newh6_ClickModifiers%
%Newinull_ClickModifiers%
%Newi1_ClickModifiers%
%Newi2_ClickModifiers%
%Newi3_ClickModifiers%
%Newi4_ClickModifiers%
%Newi5_ClickModifiers%
%Newi6_ClickModifiers%
%Newjnull_ClickModifiers%
%Newj1_ClickModifiers%
%Newj2_ClickModifiers%
%Newj3_ClickModifiers%
%Newj4_ClickModifiers%
%Newj5_ClickModifiers%
%Newj6_ClickModifiers%
%Newknull_ClickModifiers%
%Newk1_ClickModifiers%
%Newk2_ClickModifiers%
%Newk3_ClickModifiers%
%Newk4_ClickModifiers%
%Newk5_ClickModifiers%
%Newk6_ClickModifiers%
%Newlnull_ClickModifiers%
%Newl1_ClickModifiers%
%Newl2_ClickModifiers%
%Newl3_ClickModifiers%
%Newl4_ClickModifiers%
%Newl5_ClickModifiers%
%Newl6_ClickModifiers%
%NewaPieTabLabel%
%NewbPieTabLabel%
%NewcPieTabLabel%
%NewdPieTabLabel%
%NewePieTabLabel%
%NewfPieTabLabel%
%NewgPieTabLabel%
%NewhPieTabLabel%
%NewiPieTabLabel%
%NewjPieTabLabel%
%NewkPieTabLabel%
%NewlPieTabLabel%
%NewaPieHotkey_Modifiers%
%NewbPieHotkey_Modifiers%
%NewcPieHotkey_Modifiers%
%NewdPieHotkey_Modifiers%
%NewePieHotkey_Modifiers%
%NewfPieHotkey_Modifiers%
%NewgPieHotkey_Modifiers%
%NewhPieHotkey_Modifiers%
%NewiPieHotkey_Modifiers%
%NewjPieHotkey_Modifiers%
%NewkPieHotkey_Modifiers%
%NewlPieHotkey_Modifiers%
), %A_ScriptDir%\Resources\settingsfile.txt
sleep, 60
If 1 = Restart
Run "%A_ScriptDir%\PieMenu.ahk"
exitapp
Return

Cancel:
If 1 = Restart
Run "%A_ScriptDir%\PieMenu.ahk"
exitapp


PieMenuGuiClose:
If 1 = Restart
Run "%A_ScriptDir%\PieMenu.ahk"
ExitApp
; This Gui is generated by X-GUI Creator
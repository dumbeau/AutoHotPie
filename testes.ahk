#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk

hotkey, r, test
hotkey,r up, test2
return
test:
msgbox, Hi
return

test2:
msgbox, other hi
return
escape::
exitapp

;solve by disabling all hotkeys 
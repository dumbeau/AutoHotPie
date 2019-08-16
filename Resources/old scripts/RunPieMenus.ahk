#Include %A_ScriptDir%\Resources\lib\Jxon.ahk
    FileRead, settings, %A_ScriptDir%\Resources\settings.json
	settings := Jxon_Load(settings)

FileDelete, %A_ScriptDir%\Resources\lib\AppendScript.ahk
var := "boop"


for profile in settings
    profileName := settings[profile].name
    profileExe := settings[profile].ahkHandle
    
    if profileExe == "ahk_group regApps"
    {
    FileAppend,
    (
;%profileName%
#If !WinActive("%profileExe%")
{
    ), %A_ScriptDir%\Resources\lib\AppendScript.ahk
    }
    else
    {
    FileAppend,
    (
;%profileName%
#If WinActive("%profileExe%")
{

    ), %A_ScriptDir%\Resources\lib\AppendScript.ahk
    }


    for Menus in settings[profile].pieMenus
        menuHotkey := settings[profile].pieMenus[Menus].hotkey
        FileAppend,
        (
%menuHotkey%::
    runPieMenu(%profile%, %Menus%)
    return

        ), %A_ScriptDir%\Resources\lib\AppendScript.ahk

    FileAppend, 
    (
    }

    ), %A_ScriptDir%\Resources\lib\AppendScript.ahk


sleep, 100

Run, %A_ScriptDir%\Resources\PieMenu.ahk
exitapp
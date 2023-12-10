DetectHiddenWindows, On
SetTitleMatchMode, 2

GroupAdd, AhkPrograms, .ahk
GroupAdd, AhkPrograms, .exe

Loop {
  WinClose, ahk_group AhkPrograms
  IfWinNotExist, ahk_group AhkPrograms
    Break ;No [more] matching windows/processes found
}
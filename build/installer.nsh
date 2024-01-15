; !include "getProcessInfo.nsh"
; !macro customCheckAppRunning
;   !insertmacro _CHECK_APP_RUNNING  
; !macroend

Section
; MessageBox MB_OK "Hello world!"
ExecWait TaskKill /IM PieMenu.exe /F
ExecWait TaskKill /IM PieMenu.ahk /F
SectionEnd
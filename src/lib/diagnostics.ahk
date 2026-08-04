; Structured diagnostic helpers for the AHK runtime.
; Output goes to OutputDebug (DbgView) and an optional rotating log file.

global AHP_DiagEnabled := false
global AHP_DiagLogPath := ""

AHP_DiagInit(enable := false, logPath := "")
{
	global AHP_DiagEnabled, AHP_DiagLogPath
	AHP_DiagEnabled := enable
	AHP_DiagLogPath := logPath
}

AHP_Diag(message, category := "general")
{
	global AHP_DiagEnabled, AHP_DiagLogPath
	if (!AHP_DiagEnabled)
		return
	line := A_YYYY . "-" . A_MM . "-" . A_DD . " " . A_Hour . ":" . A_Min . ":" . A_Sec . " [" . category . "] " . message
	OutputDebug, % line
	if (AHP_DiagLogPath != "")
	{
		FileAppend, % line . "`n", %AHP_DiagLogPath%
	}
}

#Requires AutoHotKey v1.1.34.04+
#NoEnv
#SingleInstance force
SetBatchLines -1

#Include %A_ScriptDir%\..\..\src\lib\geometry.ahk
#Include %A_ScriptDir%\..\..\src\lib\JSON.ahk
#Include %A_ScriptDir%\..\..\src\lib\diagnostics.ahk

global Failures := 0

AssertEqual(actual, expected, name)
{
	if (actual != expected)
	{
		Failures += 1
		FileAppend, FAIL %name%: expected %expected% got %actual%`n, *
	}
	else
	{
		FileAppend, PASS %name%`n, *
	}
}

; geometry parity with tests/fixtures/js-ahk-parity.json / shared/geometry.js
AssertEqual(Round(calcAngle(0, 0, 1, 0)), 0, "calcAngle east")
AssertEqual(Round(calcAngle(0, 0, 0, -1)), 270, "calcAngle north")
AssertEqual(Round(calcAngle(0, 0, -1, 0)), 180, "calcAngle west")
AssertEqual(cycleRange(370, 360), 10, "cycleRange 370")
AssertEqual(cycleRange(-10, 360), 350, "cycleRange -10")
AssertEqual(cycleRange(360, 360), 0, "cycleRange 360")

ext := extendAlongAngle([100, 100], 0, 10)
AssertEqual(ext[1], 100, "extendAlongAngle x")
AssertEqual(ext[2], 90, "extendAlongAngle y")

; settings fixture load
fixturePath := A_ScriptDir . "\..\fixtures\settings\minimal-default.json"
FileRead, fixtureText, %fixturePath%
settings := Json.Load(fixtureText)
AssertEqual(settings.schemaVersion, 1, "fixture schemaVersion")
AssertEqual(settings.appProfiles[1].name, "Default Profile", "fixture default profile")

customPath := A_ScriptDir . "\..\fixtures\settings\custom-function.json"
FileRead, customText, %customPath%
customSettings := Json.Load(customText)
AssertEqual(customSettings.global.functionConfig.custom[1].name, "Hello Box", "custom function preserved")

AHP_DiagInit(false, "")
AHP_Diag("should not throw when disabled", "test")
AssertEqual(AHP_DiagEnabled, 0, "diagnostics disabled by default after false init")

if (Failures > 0)
{
	FileAppend, %Failures% AHK test(s) failed`n, *
	ExitApp, 1
}
FileAppend, All AHK tests passed`n, *
ExitApp, 0

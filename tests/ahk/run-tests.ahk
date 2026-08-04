#Requires AutoHotKey v1.1.34.04+
#NoEnv
#SingleInstance force
SetBatchLines -1

#Include %A_ScriptDir%\..\..\src\lib\geometry.ahk
#Include %A_ScriptDir%\..\..\src\lib\JSON.ahk

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

; geometry parity with tests/fixtures/js-ahk-parity.json
AssertEqual(Round(calcAngle(0, 0, 1, 0)), 90, "calcAngle east")
AssertEqual(Round(calcAngle(0, 0, 0, -1)), 0, "calcAngle north")
AssertEqual(Round(calcAngle(0, 0, -1, 0)), 270, "calcAngle west")
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

if (Failures > 0)
{
	FileAppend, %Failures% AHK test(s) failed`n, *
	ExitApp, 1
}
FileAppend, All AHK tests passed`n, *
ExitApp, 0

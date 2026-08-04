#Requires AutoHotkey v2.0+
#SingleInstance Force

#Include %A_ScriptDir%\..\..\..\src\v2\geometry.ahk

failures := 0

AssertEqual(actual, expected, name) {
    global failures
    if (actual != expected) {
        failures += 1
        FileAppend("FAIL " name ": expected " expected " got " actual "`n", "*")
    } else {
        FileAppend("PASS " name "`n", "*")
    }
}

AssertEqual(Round(CalcAngle(0, 0, 1, 0)), 0, "calcAngle east")
AssertEqual(Round(CalcAngle(0, 0, 0, -1)), 270, "calcAngle north")
AssertEqual(Round(CalcAngle(0, 0, -1, 0)), 180, "calcAngle west")
AssertEqual(CycleRange(370, 360), 10, "cycleRange 370")
AssertEqual(CycleRange(-10, 360), 350, "cycleRange -10")

ext := ExtendAlongAngle([100, 100], 0, 10)
AssertEqual(ext[1], 100, "extendAlongAngle x")
AssertEqual(ext[2], 90, "extendAlongAngle y")

if failures > 0 {
    FileAppend(failures " AHK v2 geometry test(s) failed`n", "*")
    ExitApp(1)
}
FileAppend("All AHK v2 geometry tests passed`n", "*")
ExitApp(0)

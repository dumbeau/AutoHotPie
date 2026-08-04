#Requires AutoHotkey v2.0+

/**
 * v2 geometry helpers — keep behavior aligned with shared/geometry.js
 * and src/lib/geometry.ahk (v1).
 */

CalcAngle(aX, aY, bX, bY) {
    initVal := DllCall("msvcrt\atan2", "Double", bY - aY, "Double", bX - aX, "CDECL Double") * (180 / 3.141592653589793)
    return initVal < 0 ? initVal + 360 : initVal
}

CycleRange(num, range := 360) {
    return num - (range * Floor(num / range))
}

ExtendAlongAngle(iPos, theta, distance) {
    fPosX := Round(iPos[1] + (distance * Cos((theta - 90) * (3.141592653589793 / 180))))
    fPosY := Round(iPos[2] + (distance * Sin((theta - 90) * (3.141592653589793 / 180))))
    return [fPosX, fPosY]
}

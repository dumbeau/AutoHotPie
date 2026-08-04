; Shared geometry helpers extracted for AHK tests and PieMenu runtime.
; Keep in sync with shared/geometry.js parity vectors.

calcAngle(aX, aY, bX, bY)
{
	initVal := atan2(bY - aY, bX - aX) * (180 / 3.141592653589793)
	if (initVal < 0)
		return initVal + 360
	return initVal
}

; atan2 polyfill for AHK v1
atan2(y, x)
{
	return DllCall("msvcrt\atan2", "Double", y, "Double", x, "CDECL Double")
}

cycleRange(var, range=360)
{
	return var - (range * Floor(var / range))
}

extendAlongAngle(iPos, theta, distance)
{
	fPosX := Round(iPos[1] + (distance * Cos((theta - 90) * (3.141592653589793 / 180))))
	fPosY := Round(iPos[2] + (distance * Sin((theta - 90) * (3.141592653589793 / 180))))
	return [fPosX, fPosY]
}

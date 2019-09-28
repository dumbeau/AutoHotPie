#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFuncs.ahk
#Include %A_ScriptDir%\Resources\lib\Jxon.ahk

;Initialize Variables and GDI+ Screen bitmap
	;Thank you Tariq Porter
	; monLeft := 0 monRight := 0 monTop := 0 monBottom :=r 0
	global monLeft := 0
	global monRight := 0
	global monTop := 0
	global monBottom := 0
	getMonitorCoords(monLeft, monTop, monRight, monBottom)
	SetUpGDIP(monLeft, monTop, monRight-monLeft, monBottom-monTop)



;Read Json Settings file to object
	FileRead, settings, %A_ScriptDir%\Resources\settings.json
	global settings := Jxon_Load(settings)

class YourClassName {
    Call(a, b) {  ; Declare parameters as needed, or an array*.
    
	}
    __Call(method, args*) {
        if (method = "")  ; For %fn%() or fn.()
            return this.Call(args*)
        if (IsObject(method))  ; If this function object is being used as a method.
            return this.Call(method, args*)
    }
    ;...
}

escape::
ExitApp
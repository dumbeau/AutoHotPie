#Include %A_ScriptDir%\Resources\lib\Gdip_All.ahk
#Include %A_ScriptDir%\Resources\lib\GdipHelper.ahk
#Include %A_ScriptDir%\Resources\lib\BGFunks.ahk
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

;Check Scripts folder


; class YourClassName {
;     Call(a, b) {  ; Declare parameters as needed, or an array*.
    
; 	}
;     __Call(method, args*) {
;         if (method = "")  ; For %fn%() or fn.()
;             return this.Call(args*)
;         if (IsObject(method))  ; If this function object is being used as a method.
;             return this.Call(method, args*)
;     }
;     ;...
; }
;  "C:\Program Files\Adobe\Adobe After Effects CC 2019\Support Files\AfterFX.exe" -r C:\Users\beaug\Documents\GitHub\Pie-Menus-V3\Resources\Local Scripts\AE\hellotest.jsx


;Photoshop run script
; commands = "C:\Program Files\Adobe\Adobe Photoshop CC 2019\Photoshop.exe" -r C:\Users\beaug\Documents\GitHub\Pie-Menus-V3\Resources\Local Scripts\photoshop\pshitest.jsx
; runwait, %ComSpec% /c %commands%,,Hide

;Illustrator
; commands = "C:\Program Files\Adobe\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe" -r C:\Users\beaug\Documents\GitHub\Pie-Menus-V3\Resources\Local Scripts\illustrator\illustratorhitest.jsx




; a::  ;After Effects Working
; commands = ""C:\Program Files (x86)\Adobe\Adobe ExtendScript Toolkit CC\ExtendScript Toolkit.exe" -run "C:\Users\beaug\Documents\Adobe Scripts\hellotest.jsx""
; runwait, %ComSpec% /c %commands%,,Hide
; return

a::
;After Effects Working
commands = ""C:\Program Files (x86)\Adobe\Adobe ExtendScript Toolkit CC\ExtendScript Toolkit.exe" -run "C:\Users\beaug\Documents\Adobe Scripts\hellotest.jsx""
runwait, %ComSpec% /c %commands%,,Hide
return


;Check if folder exists.
	;if not, abandon this process
;else copy the AdobePieScripts folder there and overwrite




escape::
ExitApp
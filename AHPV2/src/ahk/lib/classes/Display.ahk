;Set Per monitor DPI awareness: https://www.autohotkey.com/boards/viewtopic.php?p=295182#p295182
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

class Monitor {
  __New(handle, left, top, right, bottom) {
    ;When compiled with true/pm these values are based on real pixel coordinates without scaling.
	this.handle := handle
    this.left   := left
    this.top    := top
    this.right  := right
    this.bottom := bottom
    
    this.x      := left
    this.y      := top
    this.width  := right - left
    this.height := bottom - top

	dpi := this.getDpiForMonitor()
  this.displayScale := dpi.x / 96
	; this.dpiX := this.dpi.x	
  ;   this.dpiY := this.dpi.y
  ;   this.scaleX := this.dpiX / 96
  ;  	this.scaleY := this.dpiY / 96
	this.center := [this.x + (this.width/2),this.y + (this.height/2)]
	
	this.refreshRate := 144
  this.refreshTimeMilliseconds := Floor((1/(this.refreshRate))*1000)
	; this.refreshRate :=r 30
  }
  
  getDpiForMonitor() {
    ;; enum _MONITOR_DPI_TYPE
    MDT_EFFECTIVE_DPI := 0
    MDT_ANGULAR_DPI := 1
    MDT_RAW_DPI := 2
    MDT_DEFAULT := MDT_EFFECTIVE_DPI
    ptr := A_PtrSize ? "Ptr" : "UInt"
    dpiX := dpiY := 0
    DllCall("SHcore\GetDpiForMonitor", ptr, this.handle, "Int", MDT_DEFAULT, "UInt*", dpiX, "UInt*", dpiY)
    
    Return, {x: dpiX, y: dpiY}
  }
  ;; InnI: Get per-monitor DPI scaling factor (https://www.autoitscript.com/forum/topic/189341-get-per-monitor-dpi-scaling-factor/?tab=comments#comment-1359832)

}

class MonitorManager {
  __New() {
    ;; enum _PROCESS_DPI_AWARENESS    
	PROCESS_DPI_UNAWARE := 0
    PROCESS_SYSTEM_DPI_AWARE := 1
    PROCESS_PER_MONITOR_DPI_AWARE := 2
    ; DllCall("SHcore\SetProcessDpiAwareness", "UInt", PROCESS_PER_MONITOR_DPI_AWARE)
    ;; InnI: Get per-monitor DPI scaling factor (https://www.autoitscript.com/forum/topic/189341-get-per-monitor-dpi-scaling-factor/?tab=comments#comment-1359832)
    DPI_AWARENESS_CONTEXT_UNAWARE := -1
    DPI_AWARENESS_CONTEXT_SYSTEM_AWARE := -2
    DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE := -3
    DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 := -4
    DllCall("User32\SetProcessDpiAwarenessContext", "UInt" , DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE)
    ;; pneumatic: -DPIScale not working properly (https://www.autohotkey.com/boards/viewtopic.php?p=241869&sid=abb2db983d2b3966bc040c3614c0971e#p241869)
    
    ptr := A_PtrSize ? "Ptr" : "UInt"
    this.monitors := []
    DllCall("EnumDisplayMonitors", ptr, 0, ptr, 0, ptr, RegisterCallback("Global_MonitorEnumProc", "", 4, &this), "UInt", 0)
    ;; Solar: SysGet incorrectly identifies monitors (https://autohotkey.com/board/topic/66536-sysget-incorrectly-identifies-monitors/)
  }
}

Global_MonitorEnumProc(hMonitor, hdcMonitor, lprcMonitor, dwData) {
    l := NumGet(lprcMonitor + 0,  0, "Int")
    t := NumGet(lprcMonitor + 0,  4, "Int")
    r := NumGet(lprcMonitor + 0,  8, "Int")
    b := NumGet(lprcMonitor + 0, 12, "Int")
    
    this := Object(A_EventInfo)  
    ;; Helgef: Allow RegisterCallback with BoundFunc objects (https://www.autohotkey.com/boards/viewtopic.php?p=235243#p235243)
    this.monitors.push(New Monitor(hMonitor, l, t, r, b))  
    
      Return, 1
  }


class Display{
  __New(){
    p_MonitorManager := new MonitorManager
    this.monitors := p_MonitorManager.monitors      
  }

  active[]  ; Brackets are optional
    {
        get {
          MouseGetPos, mouseX, mouseY
          activeMonitor := {}
          for k, monitor in this.monitors {
            if (mouseX < monitor.left)
              continue
            if (mouseX > monitor.right)
              continue
            if (mouseY < monitor.top)
              continue
            if (mouseY > monitor.bottom)
              Continue 
            activeMonitor := monitor           
          }          
          return activeMonitor
        }
    }
  
}



class PieMenu {
    __New(functionArray){
        this.activeHotkey := A_ThisHotkey
        for k, func in functionArray {					
            this.functions.Push(func)
        }
    }
    activeHotkey := ""
    functions := []

    run(){
        msgbox, running
        for k, func in this.functions {
            func.Call()
        }
    }    
}

myFunc(string){
    msgbox, % string
    return
}

myFunc2(string){
    msgbox, % string . "2"
    return
}
funcObj1 := Func("myFunc").Bind("What 1")
funcObj2 := Func("myFunc").Bind("What 2")
funcObj3 := Func("myFunc2").Bind("What 1")
funcObj4 := Func("myFunc2").Bind("What 2")
defaultPieMenu := new PieMenu([funcObj1,funcObj2,funcObj3,funcObj4])

a::
defaultPieMenu.run()
return
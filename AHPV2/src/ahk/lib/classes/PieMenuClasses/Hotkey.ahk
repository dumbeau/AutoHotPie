class Hotkey{
    __New(hotkeyOptions, parent:=""){
        ObjMerge(this, hotkeyOptions)
    }
    ahkBareKey: string = ""
    keyCode: number | null
    displayKey: string = ""
    displayKeyNoMods: string = ""

    isWin: boolean = this.checkAhkModSymbol("#");
    isShift: boolean  = this.checkAhkModSymbol("+");
    isCtrl: boolean  = this.checkAhkModSymbol("^");
    isAlt: boolean = this.checkAhkModSymbol("!");
}
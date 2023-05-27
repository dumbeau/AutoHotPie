//#region Type Declarations
type DeepPartial<T> = T extends any[]? T : T extends Record<string, any> ? {
  [P in keyof T]?: DeepPartial<T[P]>;
} : T;
declare function getApplicationVersion():string;
//#endregion

class AutoHotPie {
    // constructor(options:any = null){
    constructor(params?: DeepPartial<AutoHotPie>){
        _.merge(this, params);         
        // this.version = "debugversion"; //Sets electron version in debug !!!     
        this.version = getApplicationVersion(); //Sets electron version in debug !!!     
        this.applicationProfiles = [];
        if(params && params.applicationProfiles && params.applicationProfiles.length > 0){
            this.applicationProfiles = params.applicationProfiles.map((applicationProfile: ApplicationProfile) => new ApplicationProfile(applicationProfile,this));
        } else {
            console.log("Reinitialize AutoHotPie");                        
        }
    }
    userDirectory: string = "";

    // #region properties    
    pieTips: boolean = true;
    escapeKeyCancelEnabled: boolean = true;
    settingsFileName: string = "AHPSettings.json";
    version: string;
    startup = new class {
        runOnStartup: boolean = false;
        runAutoHotKeyPieMenus: boolean = false;
        runOnAppQuit: boolean = true;
        alwaysRunOnAppQuit: boolean = false;
    };    
    appearance = new class {
        font = new class {
            family: string = "Arial";
            size: number = 14;
        }
        label = new class {
            minimumWidth: number = 0;
            strokeThickness: number = 1;             
            safetyStrokeColor: Color = new Color([
                123,
                123,
                123,
                255
            ]);             
        }
        icon = new class {
            sourceImageDirectory: string = "%A_ScriptDir%\\icons";
            size: number = 24;
        };
        animation = new class {
            enabled:boolean = true;
            durationSeconds: number = 0.1;
        }
    } 
    // #endregion
    
    
    applicationProfiles: ApplicationProfile[] = [];
    
    
    addApplicationProfile(applicationProfileOptions?: DeepPartial<ApplicationProfile>){ //May not be needed
        let newApplicationProfile = new ApplicationProfile(applicationProfileOptions, this)
        this.applicationProfiles.push(newApplicationProfile);
        return newApplicationProfile;        
    }
}

class ApplicationProfile {
    constructor(params: DeepPartial<ApplicationProfile> = {}, _autoHotPie?: AutoHotPie){
        _.merge(this, params);
        this.autoHotPie = _autoHotPie;
        this.pieMenus = []; 
        if(params && params.pieMenus && params.pieMenus.length > 0){
            this.pieMenus = params.pieMenus.map((pieMenu: PieMenu) => new PieMenu(pieMenu, this));            
        }
        if(params && params.executables && params.executables.length > 0){
          this.executables = params.executables.map((executable: ApplicationExecutable) => new ApplicationExecutable(executable.filePath));            
        }     
    }
    autoHotPie: AutoHotPie | undefined;
    
    //#region properties 
    name: string = "Unnamed Profile";
    icon: string = "";
    executables: ApplicationExecutable[] = [];
    enabled: boolean = true;
    profileToggle = new class {
        enabled: boolean = false;
        hotkey: Hotkey = new Hotkey("capslock");
        toggle: boolean = false;
        passthroughOnCancel: boolean = false;
    }
    pieMenus: PieMenu[] = [];
}

class ApplicationExecutable {
  constructor(exePath: string){
      this.filePath = exePath;
      this.ahkHandle = path.basename(exePath);
  }
  filePath: string;
  ahkHandle: string;
}

class PieMenu {
    constructor(params: DeepPartial<PieMenu> = {}, _applicationProfile?: ApplicationProfile){
        _.merge(this, params);
        this.applicationProfile = _applicationProfile;
        this.hotkey = new Hotkey(params?.hotkey);
        this.pieItems = [];
        if(params && params.pieItems && params.pieItems.length > 0){
            this.pieItems = params.pieItems.map((pieItem: PieItem) => new PieItem(pieItem, this));            
        }
    }
    applicationProfile: ApplicationProfile | undefined;

    name: string = "";    
    enabled: boolean = true;
    labelDelaySeconds: number = 0;
    applyToAllApplicationProfiles: boolean = false;
    activation = new class {        
        mode: number = 2;
        pieHotkeyInMenuAction: "exit-menu" | "select" | "none" = "exit-menu";
        clickableItems: boolean = true;
        escape = new class {
            enabled: boolean = false;
            radius: number = 150;
        }();
        openMenuInScreenCenter: boolean = false;
        ignoreMouse: boolean = false;        
    }();

    hotkey: Hotkey = new Hotkey(null);


    //#region properties Old PieMenu
    backgroundColor: Color = new Color([35,35,35,255]);    
    selectionColor: Color = new Color([28,212,220,255]);
    fontColor: Color = new Color([255,255,255,255]);
    radius: number = 16;
    thickness: number = 10;
    labelRadius: number = 77;
    labelRoundness: number = 100;
    pieAngle: number = 0;
    showSliceHotkeys: boolean = true;
    //#endregion
    
    pieItems: PieItem[] = [];
}

class Hotkey {
    constructor(_keyObj:any=null,allowModifiers=true){        
        // let keyTableArray = AutoHotPieSettings.global.htmlAhkKeyConversionTable;
        if (typeof _keyObj == "string"){            
            
            let ahkBareKey = _keyObj.replace('+','').replace('!','').replace('^','').replace('#','')
            this.ahkBareKey = ahkBareKey;

            let keyListObj = this.keyConversionTable.find(x => x.ahkKey === ahkBareKey)

            this.ahkKey = _keyObj;
            if(allowModifiers){
                this.isWin = this.checkAhkModSymbol("#");
                this.isShift = this.checkAhkModSymbol("+");
                this.isCtrl = this.checkAhkModSymbol("^");
                this.isAlt = this.checkAhkModSymbol("!");
            } else {
                this.isWin = false;
                this.isShift = false;
                this.isCtrl = false;
                this.isAlt = false;
            }
            
            this.keyCode = keyListObj.keyCode
            this.displayKeyNoMods = keyListObj.displayKey;
            this.displayKey = this.processDisplayKeyToFullString(keyListObj.displayKey);
            this.abbreviation = keyListObj.abbreviation;
            
        
        } else if (_keyObj && ("keyCode" in _keyObj)){ //If keyEvent
            // console.log(_keyObj)
            // let keyConversionObj = keyTableArray.find(x => x.keyCode === keyNumber); 
            
            if(allowModifiers){
                this.isWin = _keyObj.metaKey
                this.isShift = _keyObj.shiftKey
                this.isCtrl = _keyObj.ctrlKey
                this.isAlt = _keyObj.altKey
            } else {
                this.isWin = false;
                this.isShift = false;
                this.isCtrl = false;
                this.isAlt = false;
            } 
            if (_keyObj.code == "Enter"){
                this.keyCode = 1
            } else {
                this.keyCode = _keyObj.keyCode
            }
            
            // this.displayKeyNoMods = null;
            // this.displayKey = null;
            // this.ahkKey = null;
            this.#refreshHotkeyData();

        // } else if (_keyObj && _keyObj.ahkKey != null){            
        } else {
            this.isWin = false;
            this.isShift = false;
            this.isCtrl = false;
            this.isAlt = false;
            this.keyCode = null;
            this.displayKeyNoMods = "";
            this.displayKey = "";         
            this.ahkKey = "";
            this.abbreviation = "";
        }        
    }

    ahkKey: string = "";
    ahkBareKey: string = "";
    keyCode: number | null;
    displayKey: string = "";
    displayKeyNoMods: string = "";
    abbreviation: string = "";

    isWin: boolean = this.checkAhkModSymbol("#");    
    isShift: boolean  = this.checkAhkModSymbol("+");
    isCtrl: boolean  = this.checkAhkModSymbol("^");
    isAlt: boolean = this.checkAhkModSymbol("!");
    
    get keyConversionTable() : any[] { 
        let keyTable = [
            {
              keyCode: 0,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 1,
              displayKey: "Enter",
              ahkKey: "enter",
              abbreviation: "Ent"
            },
            {
              keyCode: 2,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 3,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 4,
              displayKey: "MMB",
              ahkKey: "Mbutton",
              abbreviation: "MMB"
            },
            {
              keyCode: 5,
              displayKey: "RMB",
              ahkKey: "Rbutton",
              abbreviation: "RMB"
            },
            {
              keyCode: 6,
              displayKey: "Back",
              ahkKey: "XButton1",
              abbreviation: "Back"
            },
            {
              keyCode: 7,
              displayKey: "Forward",
              ahkKey: "Xbutton2",
              abbreviation: "Frwd"
            },
            {
              keyCode: 8,
              displayKey: "Backspace",
              ahkKey: "backspace",
              abbreviation: "bspce"
            },
            {
              keyCode: 9,
              displayKey: "Tab",
              ahkKey: "tab",
              abbreviation: "Tab"
            },
            {
              keyCode: 10,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 11,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 12,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 13,
              displayKey: "Numpad Enter",
              ahkKey: "NumpadEnter",
              abbreviation: "numEnt"
            },
            {
              keyCode: 14,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 15,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 16,
              displayKey: "Shift",
              ahkKey: "shift",
              abbreviation: "Shift"
            },
            {
              keyCode: 17,
              displayKey: "Ctrl",
              ahkKey: "ctrl",
              abbreviation: "Ctrl"
            },
            {
              keyCode: 18,
              displayKey: "Alt",
              ahkKey: "alt",
              abbreviation: "Alt"
            },
            {
              keyCode: 19,
              displayKey: "Pause",
              ahkKey: "Pause",
              abbreviation: "Pause"
            },
            {
              keyCode: 20,
              displayKey: "CapsLock",
              ahkKey: "capslock",
              abbreviation: "Caps"
            },
            {
              keyCode: 21,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 22,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 23,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 24,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 25,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 26,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 27,
              displayKey: "Escape",
              ahkKey: "esc",
              abbreviation: "Esc"
            },
            {
              keyCode: 28,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 29,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 30,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 31,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 32,
              displayKey: "Space",
              ahkKey: "space",
              abbreviation: ""
            },
            {
              keyCode: 33,
              displayKey: "PageUp",
              ahkKey: "pgup",
              abbreviation: "PgUp"
            },
            {
              keyCode: 34,
              displayKey: "PageDown",
              ahkKey: "pgdn",
              abbreviation: "PgDn"
            },
            {
              keyCode: 35,
              displayKey: "End",
              ahkKey: "end",
              abbreviation: "End"
            },
            {
              keyCode: 36,
              displayKey: "Home",
              ahkKey: "home",
              abbreviation: "Home"
            },
            {
              keyCode: 37,
              displayKey: "ArrowLeft",
              ahkKey: "left",
              abbreviation: "Left"
            },
            {
              keyCode: 38,
              displayKey: "ArrowUp",
              ahkKey: "up",
              abbreviation: "Up"
            },
            {
              keyCode: 39,
              displayKey: "ArrowRight",
              ahkKey: "right",
              abbreviation: "Right"
            },
            {
              keyCode: 40,
              displayKey: "ArrowDown",
              ahkKey: "down",
              abbreviation: "Down"
            },
            {
              keyCode: 41,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 42,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 43,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 44,
              displayKey: "PrintScreen",
              ahkKey: "PrintScreen",
              abbreviation: "PrtSc"
            },
            {
              keyCode: 45,
              displayKey: "Insert",
              ahkKey: "ins",
              abbreviation: "Ins"
            },
            {
              keyCode: 46,
              displayKey: "Delete",
              ahkKey: "delete",
              abbreviation: "Del"
            },
            {
              keyCode: 47,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 48,
              displayKey: 0,
              ahkKey: 0,
              abbreviation: 0
            },
            {
              keyCode: 49,
              displayKey: 1,
              ahkKey: 1,
              abbreviation: 1
            },
            {
              keyCode: 50,
              displayKey: 2,
              ahkKey: 2,
              abbreviation: 2
            },
            {
              keyCode: 51,
              displayKey: 3,
              ahkKey: 3,
              abbreviation: 3
            },
            {
              keyCode: 52,
              displayKey: 4,
              ahkKey: 4,
              abbreviation: 4
            },
            {
              keyCode: 53,
              displayKey: 5,
              ahkKey: 5,
              abbreviation: 5
            },
            {
              keyCode: 54,
              displayKey: 6,
              ahkKey: 6,
              abbreviation: 6
            },
            {
              keyCode: 55,
              displayKey: 7,
              ahkKey: 7,
              abbreviation: 7
            },
            {
              keyCode: 56,
              displayKey: 8,
              ahkKey: 8,
              abbreviation: 8
            },
            {
              keyCode: 57,
              displayKey: 9,
              ahkKey: 9,
              abbreviation: 9
            },
            {
              keyCode: 58,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 59,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 60,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 61,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 62,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 63,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 64,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 65,
              displayKey: "A",
              ahkKey: "a",
              abbreviation: "a"
            },
            {
              keyCode: 66,
              displayKey: "B",
              ahkKey: "b",
              abbreviation: "b"
            },
            {
              keyCode: 67,
              displayKey: "C",
              ahkKey: "c",
              abbreviation: "c"
            },
            {
              keyCode: 68,
              displayKey: "D",
              ahkKey: "d",
              abbreviation: "d"
            },
            {
              keyCode: 69,
              displayKey: "E",
              ahkKey: "e",
              abbreviation: "e"
            },
            {
              keyCode: 70,
              displayKey: "F",
              ahkKey: "f",
              abbreviation: "f"
            },
            {
              keyCode: 71,
              displayKey: "G",
              ahkKey: "g",
              abbreviation: "g"
            },
            {
              keyCode: 72,
              displayKey: "H",
              ahkKey: "h",
              abbreviation: "h"
            },
            {
              keyCode: 73,
              displayKey: "I",
              ahkKey: "i",
              abbreviation: "i"
            },
            {
              keyCode: 74,
              displayKey: "J",
              ahkKey: "j",
              abbreviation: "j"
            },
            {
              keyCode: 75,
              displayKey: "K",
              ahkKey: "k",
              abbreviation: "k"
            },
            {
              keyCode: 76,
              displayKey: "L",
              ahkKey: "l",
              abbreviation: "l"
            },
            {
              keyCode: 77,
              displayKey: "M",
              ahkKey: "m",
              abbreviation: "m"
            },
            {
              keyCode: 78,
              displayKey: "N",
              ahkKey: "n",
              abbreviation: "n"
            },
            {
              keyCode: 79,
              displayKey: "O",
              ahkKey: "o",
              abbreviation: "o"
            },
            {
              keyCode: 80,
              displayKey: "P",
              ahkKey: "p",
              abbreviation: "p"
            },
            {
              keyCode: 81,
              displayKey: "Q",
              ahkKey: "q",
              abbreviation: "q"
            },
            {
              keyCode: 82,
              displayKey: "R",
              ahkKey: "r",
              abbreviation: "r"
            },
            {
              keyCode: 83,
              displayKey: "S",
              ahkKey: "s",
              abbreviation: "s"
            },
            {
              keyCode: 84,
              displayKey: "T",
              ahkKey: "t",
              abbreviation: "t"
            },
            {
              keyCode: 85,
              displayKey: "U",
              ahkKey: "u",
              abbreviation: "u"
            },
            {
              keyCode: 86,
              displayKey: "V",
              ahkKey: "v",
              abbreviation: "v"
            },
            {
              keyCode: 87,
              displayKey: "W",
              ahkKey: "w",
              abbreviation: "w"
            },
            {
              keyCode: 88,
              displayKey: "X",
              ahkKey: "x",
              abbreviation: "x"
            },
            {
              keyCode: 89,
              displayKey: "Y",
              ahkKey: "y",
              abbreviation: "y"
            },
            {
              keyCode: 90,
              displayKey: "Z",
              ahkKey: "z",
              abbreviation: "z"
            },
            {
              keyCode: 91,
              displayKey: "WindowsLeft",
              ahkKey: "Lwin",
              abbreviation: "LWin"
            },
            {
              keyCode: 92,
              displayKey: "WindowsRight",
              ahkKey: "Rwin",
              abbreviation: "RWin"
            },
            {
              keyCode: 93,
              displayKey: "ContextMenu",
              ahkKey: "AppsKey",
              abbreviation: "AppKey"
            },
            {
              keyCode: 94,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 95,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 96,
              displayKey: "Numpad 0",
              ahkKey: "Numpad0",
              abbreviation: "num0"
            },
            {
              keyCode: 97,
              displayKey: "Numpad 1",
              ahkKey: "Numpad1",
              abbreviation: "num1"
            },
            {
              keyCode: 98,
              displayKey: "Numpad 2",
              ahkKey: "Numpad2",
              abbreviation: "num2"
            },
            {
              keyCode: 99,
              displayKey: "Numpad 3",
              ahkKey: "Numpad3",
              abbreviation: "num3"
            },
            {
              keyCode: 100,
              displayKey: "Numpad 4",
              ahkKey: "Numpad4",
              abbreviation: "num4"
            },
            {
              keyCode: 101,
              displayKey: "Numpad 5",
              ahkKey: "Numpad5",
              abbreviation: "num5"
            },
            {
              keyCode: 102,
              displayKey: "Numpad 6",
              ahkKey: "Numpad6",
              abbreviation: "num6"
            },
            {
              keyCode: 103,
              displayKey: "Numpad 7",
              ahkKey: "Numpad7",
              abbreviation: "num7"
            },
            {
              keyCode: 104,
              displayKey: "Numpad 8",
              ahkKey: "Numpad8",
              abbreviation: "num8"
            },
            {
              keyCode: 105,
              displayKey: "Numpad 9",
              ahkKey: "Numpad9",
              abbreviation: "num9"
            },
            {
              keyCode: 106,
              displayKey: "Numpad *",
              ahkKey: "NumpadMult",
              abbreviation: "num*"
            },
            {
              keyCode: 107,
              displayKey: "Numpad +",
              ahkKey: "NumpadPlus",
              abbreviation: "num+"
            },
            {
              keyCode: 108,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 109,
              displayKey: "Numpad -",
              ahkKey: "NumpadSub",
              abbreviation: "num-"
            },
            {
              keyCode: 110,
              displayKey: "Numpad .",
              ahkKey: "NumpadDot",
              abbreviation: "num."
            },
            {
              keyCode: 111,
              displayKey: "Numpad /",
              ahkKey: "NumpadDiv",
              abbreviation: "num/"
            },
            {
              keyCode: 112,
              displayKey: "F1",
              ahkKey: "f1",
              abbreviation: "F1"
            },
            {
              keyCode: 113,
              displayKey: "F2",
              ahkKey: "f2",
              abbreviation: "F2"
            },
            {
              keyCode: 114,
              displayKey: "F3",
              ahkKey: "f3",
              abbreviation: "F3"
            },
            {
              keyCode: 115,
              displayKey: "F4",
              ahkKey: "f4",
              abbreviation: "F4"
            },
            {
              keyCode: 116,
              displayKey: "F5",
              ahkKey: "f5",
              abbreviation: "F5"
            },
            {
              keyCode: 117,
              displayKey: "F6",
              ahkKey: "f6",
              abbreviation: "F6"
            },
            {
              keyCode: 118,
              displayKey: "F7",
              ahkKey: "f7",
              abbreviation: "F7"
            },
            {
              keyCode: 119,
              displayKey: "F8",
              ahkKey: "f8",
              abbreviation: "F8"
            },
            {
              keyCode: 120,
              displayKey: "F9",
              ahkKey: "f9",
              abbreviation: "F9"
            },
            {
              keyCode: 121,
              displayKey: "F10",
              ahkKey: "f10",
              abbreviation: "F10"
            },
            {
              keyCode: 122,
              displayKey: "F11",
              ahkKey: "f11",
              abbreviation: "F11"
            },
            {
              keyCode: 123,
              displayKey: "F12",
              ahkKey: "f12",
              abbreviation: "F12"
            },
            {
              keyCode: 124,
              displayKey: "F13",
              ahkKey: "f13",
              abbreviation: "F13"
            },
            {
              keyCode: 125,
              displayKey: "F14",
              ahkKey: "f14",
              abbreviation: "F14"
            },
            {
              keyCode: 126,
              displayKey: "F15",
              ahkKey: "f15",
              abbreviation: "F15"
            },
            {
              keyCode: 127,
              displayKey: "F16",
              ahkKey: "f16",
              abbreviation: "F16"
            },
            {
              keyCode: 128,
              displayKey: "F17",
              ahkKey: "f17",
              abbreviation: "F17"
            },
            {
              keyCode: 129,
              displayKey: "F18",
              ahkKey: "f18",
              abbreviation: "F18"
            },
            {
              keyCode: 130,
              displayKey: "F19",
              ahkKey: "f19",
              abbreviation: "F19"
            },
            {
              keyCode: 131,
              displayKey: "F20",
              ahkKey: "f20",
              abbreviation: "F20"
            },
            {
              keyCode: 132,
              displayKey: "F21",
              ahkKey: "f21",
              abbreviation: "F21"
            },
            {
              keyCode: 133,
              displayKey: "F22",
              ahkKey: "f22",
              abbreviation: "F22"
            },
            {
              keyCode: 134,
              displayKey: "F23",
              ahkKey: "f23",
              abbreviation: "F23"
            },
            {
              keyCode: 135,
              displayKey: "F24",
              ahkKey: "f24",
              abbreviation: "F24"
            },
            {
              keyCode: 136,
              displayKey: "F25",
              ahkKey: "f25",
              abbreviation: "F25"
            },
            {
              keyCode: 137,
              displayKey: "F26",
              ahkKey: "f26",
              abbreviation: "F26"
            },
            {
              keyCode: 138,
              displayKey: "F27",
              ahkKey: "f27",
              abbreviation: "F27"
            },
            {
              keyCode: 139,
              displayKey: "F28",
              ahkKey: "f28",
              abbreviation: "F28"
            },
            {
              keyCode: 140,
              displayKey: "F29",
              ahkKey: "f29",
              abbreviation: "F29"
            },
            {
              keyCode: 141,
              displayKey: "F30",
              ahkKey: "f30",
              abbreviation: "F30"
            },
            {
              keyCode: 142,
              displayKey: "F31",
              ahkKey: "f31",
              abbreviation: "F31"
            },
            {
              keyCode: 143,
              displayKey: "F32",
              ahkKey: "f32",
              abbreviation: "F32"
            },
            {
              keyCode: 144,
              displayKey: "NumLock",
              ahkKey: "NumLock",
              abbreviation: "NmLck"
            },
            {
              keyCode: 145,
              displayKey: "ScrollLock",
              ahkKey: "ScrollLock",
              abbreviation: "ScrLk"
            },
            {
              keyCode: 146,
              displayKey: "Wheel Up",
              ahkKey: "WheelUp",
              abbreviation: "scrUp"
            },
            {
              keyCode: 147,
              displayKey: "Wheel Down",
              ahkKey: "WheelDown",
              abbreviation: "scrDn"
            },
            {
              keyCode: 148,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 149,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 150,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 151,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 152,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 153,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 154,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 155,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 156,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 157,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 158,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 159,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 160,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 161,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 162,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 163,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 164,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 165,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 166,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 167,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 168,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 169,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 170,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 171,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 172,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 173,
              displayKey: "Mute",
              ahkKey: "Volume_Mute",
              abbreviation: "mute"
            },
            {
              keyCode: 174,
              displayKey: "Volume Down",
              ahkKey: "Volume_Down",
              abbreviation: "VolDn"
            },
            {
              keyCode: 175,
              displayKey: "Volume Up",
              ahkKey: "Volume_Up",
              abbreviation: "VolUp"
            },
            {
              keyCode: 176,
              displayKey: "Media Next",
              ahkKey: "Media_Next",
              abbreviation: "Next"
            },
            {
              keyCode: 177,
              displayKey: "Media Back",
              ahkKey: "Media_Prev",
              abbreviation: "Prev"
            },
            {
              keyCode: 178,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 179,
              displayKey: "Media Play/Pause",
              ahkKey: "Media_Play_Pause",
              abbreviation: "Play"
            },
            {
              keyCode: 180,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 181,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 182,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 183,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 184,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 185,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 186,
              displayKey: ";",
              ahkKey: ";",
              abbreviation: ";"
            },
            {
              keyCode: 187,
              displayKey: "Equal",
              ahkKey: "=",
              abbreviation: "="
            },
            {
              keyCode: 188,
              displayKey: "Comma",
              ahkKey: ",",
              abbreviation: ","
            },
            {
              keyCode: 189,
              displayKey: "Minus",
              ahkKey: "-",
              abbreviation: "-"
            },
            {
              keyCode: 190,
              displayKey: "Period",
              ahkKey: ".",
              abbreviation: "."
            },
            {
              keyCode: 191,
              displayKey: "/",
              ahkKey: "/",
              abbreviation: "/"
            },
            {
              keyCode: 192,
              displayKey: "Backquote",
              ahkKey: "`",
              abbreviation: "`"
            },
            {
              keyCode: 193,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 194,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 195,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 196,
              displayKey: "Numpad 0",
              ahkKey: "Numpad0",
              abbreviation: "num0"
            },
            {
              keyCode: 197,
              displayKey: "Numpad 1",
              ahkKey: "Numpad1",
              abbreviation: "num1"
            },
            {
              keyCode: 198,
              displayKey: "Numpad 2",
              ahkKey: "Numpad2",
              abbreviation: "num2"
            },
            {
              keyCode: 199,
              displayKey: "Numpad 3",
              ahkKey: "Numpad3",
              abbreviation: "num3"
            },
            {
              keyCode: 200,
              displayKey: "Numpad 4",
              ahkKey: "Numpad4",
              abbreviation: "num4"
            },
            {
              keyCode: 201,
              displayKey: "Numpad 5",
              ahkKey: "Numpad5",
              abbreviation: "num5"
            },
            {
              keyCode: 202,
              displayKey: "Numpad 6",
              ahkKey: "Numpad6",
              abbreviation: "num6"
            },
            {
              keyCode: 203,
              displayKey: "Numpad 7",
              ahkKey: "Numpad7",
              abbreviation: "num7"
            },
            {
              keyCode: 204,
              displayKey: "Numpad 8",
              ahkKey: "Numpad8",
              abbreviation: "num8"
            },
            {
              keyCode: 205,
              displayKey: "Numpad 9",
              ahkKey: "Numpad9",
              abbreviation: "num9"
            },
            {
              keyCode: 206,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 207,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 208,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 209,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 210,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 211,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 212,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 213,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 214,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 215,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 216,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 217,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 218,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 219,
              displayKey: "[",
              ahkKey: "[",
              abbreviation: "["
            },
            {
              keyCode: 220,
              displayKey: "\\",
              ahkKey: "\\",
              abbreviation: "\\"
            },
            {
              keyCode: 221,
              displayKey: "]",
              ahkKey: "]",
              abbreviation: "]"
            },
            {
              keyCode: 222,
              displayKey: "Quote",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 223,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 224,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 225,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 226,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 227,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 228,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 229,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 230,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 231,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 232,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 233,
              displayKey: "Back",
              ahkKey: "XButton1",
              abbreviation: "Back"
            },
            {
              keyCode: 234,
              displayKey: "Forward",
              ahkKey: "XButton2",
              abbreviation: "Frwd"
            },
            {
              keyCode: 235,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 236,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 237,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 238,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 239,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 240,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 241,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 242,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 243,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 244,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 245,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 246,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 247,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 248,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 249,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 250,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 251,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 252,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 253,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 254,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            },
            {
              keyCode: 255,
              displayKey: "",
              ahkKey: "",
              abbreviation: ""
            }
          ]
        return keyTable
        }
    set winKey(enabled){
        this.isWin = enabled;
        this.#refreshHotkeyData();
    }
    get winKey(){
        return this.isWin;
    }

    set shiftKey(enabled){
        this.isShift = enabled;
        this.#refreshHotkeyData();
    }
    get shiftKey(){
        return this.isShift;
    }

    set ctrlKey(enabled){
        this.isCtrl = enabled;
        this.#refreshHotkeyData();
    }
    get ctrlKey(){
        return this.isCtrl;
    }

    set altKey(enabled){
        this.isAlt = enabled;
        this.#refreshHotkeyData();
    }
    get altKey(){
        return this.isAlt;
    }
       

    #refreshHotkeyData(){
        //This uses modifier states and keyCode to create displayKey, displayKeyNoMode and ahkKey.        
        let keyListObj = this.keyConversionTable.find(x => x.keyCode === this.keyCode);
        if (!keyListObj)
            return

        this.displayKeyNoMods = keyListObj.displayKey;
        this.abbreviation = keyListObj.abbreviation;
        
        //Add modifier keys to display key
        let displayKeyMods = ""
        displayKeyMods = (this.isWin) ? displayKeyMods + "Win+" : displayKeyMods;
        displayKeyMods = (this.isShift) ? displayKeyMods + "Shift+" : displayKeyMods;
        displayKeyMods = (this.isCtrl) ? displayKeyMods + "Ctrl+" : displayKeyMods;
        displayKeyMods = (this.isAlt) ? displayKeyMods + "Alt+" : displayKeyMods;
        this.displayKey = displayKeyMods + keyListObj.displayKey;

        //Add modifier keys to ahk key
        
        let ahkMods = "";
        ahkMods = (this.isWin) ? ahkMods + "#" : ahkMods;
        ahkMods = (this.isShift) ? ahkMods + "+" : ahkMods;
        ahkMods = (this.isCtrl) ? ahkMods + "^" : ahkMods;
        ahkMods = (this.isAlt) ? ahkMods + "!" : ahkMods;
        this.ahkKey = ahkMods + keyListObj.ahkKey.replace(/[\#\!\^\+]/g,"");
    }


    checkAhkModSymbol(modSymbol: string): boolean {
        return this.ahkKey.slice(0,4).includes(modSymbol);        
    }

    processDisplayKeyToFullString(displayKey: string): string{
        let returnString = ""
        if (this.checkAhkModSymbol("#")){
            returnString = returnString + "Win+"
        }
        if (this.checkAhkModSymbol("+")){
            returnString = returnString + "Shift+"
        }
        if (this.checkAhkModSymbol("^")){
            returnString = returnString + "Ctrl+"
        }
        if (this.checkAhkModSymbol("!")){
            returnString = returnString + "Alt+"
        }
        returnString = returnString + displayKey
        return returnString
    }    
}

class PieItem {
    constructor(params: DeepPartial<PieItem> = {}, _parentMenu?: PieMenu | PieSubmenu){
        _.merge(this, params);
        this.parentMenu = _parentMenu;        
        this.hotkey = new Hotkey(params?.hotkey);    
        this.icon = new Icon(params.icon);
    }
    parentMenu: PieMenu | PieSubmenu | undefined;
    text: string = "";
    icon: Icon;
    hotkey: Hotkey = new Hotkey();
    clickable: boolean = true;
    pieSubmenu: PieSubmenu | undefined = undefined;
    command: Command = new Command();
}

class Icon {
    constructor(params: DeepPartial<Icon> = {}){
        _.merge(this, params);        
    }
    filePath: string = "";
    useImageColor: boolean = false; 
}

class PieSubmenu {
    constructor(params: DeepPartial<PieSubmenu> = {}, _pieItem?: PieItem){        
        _.merge(this, params);
        this.pieItem = _pieItem;
        this.pieItems = [];
        if(params && params.pieItems && params.pieItems.length > 0){
            this.pieItems = params.pieItems.map((pieItem: PieItem) => new PieItem(pieItem, this));            
        }
    }
    pieItem: PieItem | undefined;    
    
    //#region properties
    backgroundColor: number[] = [35,35,35,255];    
    selectionColor: number[] = [28,212,220,255];
    fontColor: number[] = [255,255,255,255];
    radius: number = 32;
    thickness: number = 10;
    labelRadius: number = 77;
    labelRoundness: number = 100;
    pieAngle: number = 0;     
    //#endregion

    public pieItems: PieItem[] = [];
    
}

class Command {
    constructor(params: DeepPartial<Command> = {}, _parent?: PieMenu | PieSubmenu){          
        _.merge(this, params);  
        this.parent = _parent;                
    }
    parent: PieMenu | PieSubmenu | undefined;   

    id: string = "";        
    parameters: any = {};
    name: string = "";
    description: string = "";
    optionType: string =  "Custom Options";
    controls: Control[] = [];    
    associatedProgram: string | null = null;
    params: any = {};
    ahkScript: string = "";
    commonPlacement: any = {
        center: false,
        slice: false
    }    
}

class Control {
    constructor(){        
    }    
    htmlContent:string = '';
}

class Color {
  constructor(color: string | [number, number, number] | [number, number, number, number]) {
      [this.r, this.g, this.b, this.a] = [0,0,0,0];
      if (typeof color === 'string') {
          this.setFromHex(color);
      } else if (color.length === 3) {
          this.r = color[0];
          this.g = color[1];
          this.b = color[2];
          this.a = 1;
      } else {
          this.r = color[0];
          this.g = color[1];
          this.b = color[2];
          this.a = color[3];
      }
  }

  r: number;
  g: number;
  b: number;
  a: number;
  
  setFromHex(hex: string) {
      hex = hex.replace(/^#/, '');
      if (hex.length === 3) {
          hex = hex.split('').map(c => c + c).join('');
      }
      const num = parseInt(hex, 16);
      this.r = num >> 16;
      this.g = (num >> 8) & 0xff;
      this.b = num & 0xff;
      this.a = hex.length === 8 ? ((num >> 24) & 0xff) / 255 : 1;
  }

  toRgbArray(): number[] {
      return [this.r, this.g, this.b];
  }

  toRgbaArray(): number[] {
      return [this.r, this.g, this.b, this.a];
  }

  toRgbHex(): string {
      return `#${this.r.toString(16)}${this.g.toString(16)}${this.b.toString(16)}`;
  }

  toRgbaHex(): string {
      return `#${this.r.toString(16)}${this.g.toString(16)}${this.b.toString(16)}${Math.round(this.a * 255).toString(16)}`;
  }
}
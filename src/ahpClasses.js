var AutoHotPieSettings;
var SettingsFileName = "AHPSettings.json";


class AHPSettings {
    constructor(_settingsObj=null){ //This is the load or create default settings 
        let defaults = {
            global:{
                pieTips: true,
                app:{
                    sourceFileName:SettingsFileName,
                    version: electron.getVersion()
                },
                startup:{
                    runOnStartup:false,
                    runAHKPieMenus:false
                },
                globalAppearance: {
                    font: "Arial",
                    fontSize: 14,
                    fontColors: {
                        white: [
                            255,
                            255,
                            255
                        ],
                        grey: [
                            180,
                            180,
                            180
                        ],
                        black: [
                            35,
                            35,
                            35
                        ]
                    },
                    minimumLabelWidth: 0,
                    pieIconFolder: "%A_ScriptDir%\\icons",
                    iconSize: 24,
                    safetyStrokeColor: [
                        123,
                        123,
                        123,
                        255
                    ],
                    labelStrokeThickness: 1
                },
            },
            appProfiles:[]
        }
        let overrides = {
            global:{
            app:{
                version: electron.getVersion()
            },
            functionConfig: [
                {
                    associatedProfiles: [
                        "general"
                    ],
                    functions: [
                        {
                            name: "Send Key",
                            optionType: "Send Key",
                            ahkFunction: "sendKey"
                        },
                        {
                            name: "Mouse Click",
                            optionType: "Mouse Click",
                            ahkFunction: "mouseClick"
                        },
                        {
                            name: "Run File",
                            optionType: "Run Script",
                            ahkFunction: "runScript"
                        },
                        {
                            name: "Open Folder",
                            optionType: "Open Folder",
                            ahkFunction: "openFolder"
                        },
                        {
                            name: "Repeat Last",
                            optionType: "Repeat Last",
                            ahkFunction: "repeatLastFunction"
                        },
                        {
                            name: "Sub Menu",
                            optionType: "Sub Menu",
                            ahkFunction: "submenu"
                        },
                        {
                            name: "None",
                            optionType: "No Options",
                            ahkFunction: "none"
                        },
                        {
                            name: "Resize Window",
                            optionType: "No Options",
                            ahkFunction: "resizeWindow"
                        },
                        {
                            name: "Move Window",
                            optionType: "No Options",
                            ahkFunction: "moveWindow"
                        },
                        {
                            name: "AutoHotPie Settings",
                            optionType: "No Options",
                            ahkFunction: "openSettings"
                        }                       
                    ]
                },
                {
                    associatedProfiles: [
                        "Photoshop"
                    ],
                    functions: [
                        {
                            name: "Switch Tool",
                            optionType: "photoshop_cycleTool",
                            ahkFunction: "Photoshop_cycleTool"
                        },
                        {
                            name: "Toggle Layer by Name",
                            optionType: "Parameter List",
                            parameter: "Layer",
                            ahkFunction: "Photoshop_toggleLayerByName"
                        },
                        {
                            name: "Switch Brush",
                            optionType: "Parameter List",
                            parameter: "Brush",
                            ahkFunction: "Photoshop_cycleBrush"
                        }
                    ]
                }
            ],
            htmlAhkKeyConversionTable: [
                {
                    keyCode: 0,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 1,
                    displayKey: "Enter",
                    ahkKey: "enter"
                },
                {
                    keyCode: 2,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 3,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 4,
                    displayKey: "MMB",
                    ahkKey: "Mbutton"
                },
                {
                    keyCode: 5,
                    displayKey: "RMB",
                    ahkKey: "Rbutton"
                },
                {
                    keyCode: 6,
                    displayKey: "Back",
                    ahkKey: "XButton1"
                },
                {
                    keyCode: 7,
                    displayKey: "Forward",
                    ahkKey: "Xbutton2"
                },
                {
                    keyCode: 8,
                    displayKey: "Backspace",
                    ahkKey: "backspace"
                },
                {
                    keyCode: 9,
                    displayKey: "Tab",
                    ahkKey: "tab"
                },
                {
                    keyCode: 10,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 11,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 12,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 13,
                    displayKey: "Numpad Enter",
                    ahkKey: "NumpadEnter"
                },
                {
                    keyCode: 14,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 15,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 16,
                    displayKey: "Shift",
                    ahkKey: "shift"
                },
                {
                    keyCode: 17,
                    displayKey: "Ctrl",
                    ahkKey: "ctrl"
                },
                {
                    keyCode: 18,
                    displayKey: "Alt",
                    ahkKey: "alt"
                },
                {
                    keyCode: 19,
                    displayKey: "Pause",
                    ahkKey: "Pause"
                },
                {
                    keyCode: 20,
                    displayKey: "CapsLock",
                    ahkKey: "capslock"
                },
                {
                    keyCode: 21,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 22,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 23,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 24,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 25,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 26,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 27,
                    displayKey: "Escape",
                    ahkKey: "esc"
                },
                {
                    keyCode: 28,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 29,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 30,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 31,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 32,
                    displayKey: "Space",
                    ahkKey: "space"
                },
                {
                    keyCode: 33,
                    displayKey: "PageUp",
                    ahkKey: "pgup"
                },
                {
                    keyCode: 34,
                    displayKey: "PageDown",
                    ahkKey: "pgdn"
                },
                {
                    keyCode: 35,
                    displayKey: "End",
                    ahkKey: "end"
                },
                {
                    keyCode: 36,
                    displayKey: "Home",
                    ahkKey: "home"
                },
                {
                    keyCode: 37,
                    displayKey: "ArrowLeft",
                    ahkKey: "left"
                },
                {
                    keyCode: 38,
                    displayKey: "ArrowUp",
                    ahkKey: "up"
                },
                {
                    keyCode: 39,
                    displayKey: "ArrowRight",
                    ahkKey: "right"
                },
                {
                    keyCode: 40,
                    displayKey: "ArrowDown",
                    ahkKey: "down"
                },
                {
                    keyCode: 41,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 42,
                    displayKey: "PrintScreen",
                    ahkKey: "PrintScreen"
                },
                {
                    keyCode: 43,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 44,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 45,
                    displayKey: "Insert",
                    ahkKey: "ins"
                },
                {
                    keyCode: 46,
                    displayKey: "Delete",
                    ahkKey: "delete"
                },
                {
                    keyCode: 47,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 48,
                    displayKey: "0",
                    ahkKey: "0"
                },
                {
                    keyCode: 49,
                    displayKey: "1",
                    ahkKey: "1"
                },
                {
                    keyCode: 50,
                    displayKey: "2",
                    ahkKey: "2"
                },
                {
                    keyCode: 51,
                    displayKey: "3",
                    ahkKey: "3"
                },
                {
                    keyCode: 52,
                    displayKey: "4",
                    ahkKey: "4"
                },
                {
                    keyCode: 53,
                    displayKey: "5",
                    ahkKey: "5"
                },
                {
                    keyCode: 54,
                    displayKey: "6",
                    ahkKey: "6"
                },
                {
                    keyCode: 55,
                    displayKey: "7",
                    ahkKey: "7"
                },
                {
                    keyCode: 56,
                    displayKey: "8",
                    ahkKey: "8"
                },
                {
                    keyCode: 57,
                    displayKey: "9",
                    ahkKey: "9"
                },
                {
                    keyCode: 58,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 59,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 60,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 61,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 62,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 63,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 64,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 65,
                    displayKey: "A",
                    ahkKey: "a"
                },
                {
                    keyCode: 66,
                    displayKey: "B",
                    ahkKey: "b"
                },
                {
                    keyCode: 67,
                    displayKey: "C",
                    ahkKey: "c"
                },
                {
                    keyCode: 68,
                    displayKey: "D",
                    ahkKey: "d"
                },
                {
                    keyCode: 69,
                    displayKey: "E",
                    ahkKey: "e"
                },
                {
                    keyCode: 70,
                    displayKey: "F",
                    ahkKey: "f"
                },
                {
                    keyCode: 71,
                    displayKey: "G",
                    ahkKey: "g"
                },
                {
                    keyCode: 72,
                    displayKey: "H",
                    ahkKey: "h"
                },
                {
                    keyCode: 73,
                    displayKey: "I",
                    ahkKey: "i"
                },
                {
                    keyCode: 74,
                    displayKey: "J",
                    ahkKey: "j"
                },
                {
                    keyCode: 75,
                    displayKey: "K",
                    ahkKey: "k"
                },
                {
                    keyCode: 76,
                    displayKey: "L",
                    ahkKey: "l"
                },
                {
                    keyCode: 77,
                    displayKey: "M",
                    ahkKey: "m"
                },
                {
                    keyCode: 78,
                    displayKey: "N",
                    ahkKey: "n"
                },
                {
                    keyCode: 79,
                    displayKey: "O",
                    ahkKey: "o"
                },
                {
                    keyCode: 80,
                    displayKey: "P",
                    ahkKey: "p"
                },
                {
                    keyCode: 81,
                    displayKey: "Q",
                    ahkKey: "q"
                },
                {
                    keyCode: 82,
                    displayKey: "R",
                    ahkKey: "r"
                },
                {
                    keyCode: 83,
                    displayKey: "S",
                    ahkKey: "s"
                },
                {
                    keyCode: 84,
                    displayKey: "T",
                    ahkKey: "t"
                },
                {
                    keyCode: 85,
                    displayKey: "U",
                    ahkKey: "u"
                },
                {
                    keyCode: 86,
                    displayKey: "V",
                    ahkKey: "v"
                },
                {
                    keyCode: 87,
                    displayKey: "W",
                    ahkKey: "w"
                },
                {
                    keyCode: 88,
                    displayKey: "X",
                    ahkKey: "x"
                },
                {
                    keyCode: 89,
                    displayKey: "Y",
                    ahkKey: "y"
                },
                {
                    keyCode: 90,
                    displayKey: "Z",
                    ahkKey: "z"
                },
                {
                    keyCode: 91,
                    displayKey: "WindowsLeft",
                    ahkKey: "Lwin"
                },
                {
                    keyCode: 92,
                    displayKey: "WindowsRight",
                    ahkKey: "Rwin"
                },
                {
                    keyCode: 93,
                    displayKey: "ContextMenu",
                    ahkKey: "AppsKey"
                },
                {
                    keyCode: 94,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 95,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 96,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 97,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 98,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 99,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 100,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 101,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 102,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 103,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 104,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 105,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 106,
                    displayKey: "Numpad *",
                    ahkKey: "NumpadMult"
                },
                {
                    keyCode: 107,
                    displayKey: "Numpad +",
                    ahkKey: "NumpadPlus"
                },
                {
                    keyCode: 108,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 109,
                    displayKey: "Numpad -",
                    ahkKey: "NumpadSub"
                },
                {
                    keyCode: 110,
                    displayKey: "Numpad .",
                    ahkKey: "NumpadDot"
                },
                {
                    keyCode: 111,
                    displayKey: "Numpad /",
                    ahkKey: "NumpadDiv"
                },
                {
                    keyCode: 112,
                    displayKey: "F1",
                    ahkKey: "f1"
                },
                {
                    keyCode: 113,
                    displayKey: "F2",
                    ahkKey: "f2"
                },
                {
                    keyCode: 114,
                    displayKey: "F3",
                    ahkKey: "f3"
                },
                {
                    keyCode: 115,
                    displayKey: "F4",
                    ahkKey: "f4"
                },
                {
                    keyCode: 116,
                    displayKey: "F5",
                    ahkKey: "f5"
                },
                {
                    keyCode: 117,
                    displayKey: "F6",
                    ahkKey: "f6"
                },
                {
                    keyCode: 118,
                    displayKey: "F7",
                    ahkKey: "f7"
                },
                {
                    keyCode: 119,
                    displayKey: "F8",
                    ahkKey: "f8"
                },
                {
                    keyCode: 120,
                    displayKey: "F9",
                    ahkKey: "f9"
                },
                {
                    keyCode: 121,
                    displayKey: "F10",
                    ahkKey: "f10"
                },
                {
                    keyCode: 122,
                    displayKey: "F11",
                    ahkKey: "f11"
                },
                {
                    keyCode: 123,
                    displayKey: "F12",
                    ahkKey: "f12"
                },
                {
                    keyCode: 124,
                    displayKey: "F13",
                    ahkKey: "f13"
                },
                {
                    keyCode: 125,
                    displayKey: "F14",
                    ahkKey: "f14"
                },
                {
                    keyCode: 126,
                    displayKey: "F15",
                    ahkKey: "f15"
                },
                {
                    keyCode: 127,
                    displayKey: "F16",
                    ahkKey: "f16"
                },
                {
                    keyCode: 128,
                    displayKey: "F17",
                    ahkKey: "f17"
                },
                {
                    keyCode: 129,
                    displayKey: "F18",
                    ahkKey: "f18"
                },
                {
                    keyCode: 130,
                    displayKey: "F19",
                    ahkKey: "f19"
                },
                {
                    keyCode: 131,
                    displayKey: "F20",
                    ahkKey: "f20"
                },
                {
                    keyCode: 132,
                    displayKey: "F21",
                    ahkKey: "f21"
                },
                {
                    keyCode: 133,
                    displayKey: "F22",
                    ahkKey: "f22"
                },
                {
                    keyCode: 134,
                    displayKey: "F23",
                    ahkKey: "f23"
                },
                {
                    keyCode: 135,
                    displayKey: "F24",
                    ahkKey: "f24"
                },
                {
                    keyCode: 136,
                    displayKey: "F25",
                    ahkKey: "f25"
                },
                {
                    keyCode: 137,
                    displayKey: "F26",
                    ahkKey: "f26"
                },
                {
                    keyCode: 138,
                    displayKey: "F27",
                    ahkKey: "f27"
                },
                {
                    keyCode: 139,
                    displayKey: "F28",
                    ahkKey: "f28"
                },
                {
                    keyCode: 140,
                    displayKey: "F29",
                    ahkKey: "f29"
                },
                {
                    keyCode: 141,
                    displayKey: "F30",
                    ahkKey: "f30"
                },
                {
                    keyCode: 142,
                    displayKey: "F31",
                    ahkKey: "f31"
                },
                {
                    keyCode: 143,
                    displayKey: "F32",
                    ahkKey: "f32"
                },
                {
                    keyCode: 144,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 145,
                    displayKey: "ScrollLock",
                    ahkKey: "ScrollLock"
                },
                {
                    keyCode: 146,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 147,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 148,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 149,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 150,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 151,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 152,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 153,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 154,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 155,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 156,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 157,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 158,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 159,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 160,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 161,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 162,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 163,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 164,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 165,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 166,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 167,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 168,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 169,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 170,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 171,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 172,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 173,
                    displayKey: "Mute",
                    ahkKey: "Volume_Mute"
                },
                {
                    keyCode: 174,
                    displayKey: "Volume Down",
                    ahkKey: "Volume_Down"
                },
                {
                    keyCode: 175,
                    displayKey: "Volume Up",
                    ahkKey: "Volume_Up"
                },
                {
                    keyCode: 176,
                    displayKey: "Media Next",
                    ahkKey: "Media_Next"
                },
                {
                    keyCode: 177,
                    displayKey: "Media Back",
                    ahkKey: "Media_Prev"
                },
                {
                    keyCode: 178,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 179,
                    displayKey: "Media Play/Pause",
                    ahkKey: "Media_Play_Pause"
                },
                {
                    keyCode: 180,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 181,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 182,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 183,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 184,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 185,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 186,
                    displayKey: ";",
                    ahkKey: ";"
                },
                {
                    keyCode: 187,
                    displayKey: "Equal",
                    ahkKey: "="
                },
                {
                    keyCode: 188,
                    displayKey: "Comma",
                    ahkKey: ","
                },
                {
                    keyCode: 189,
                    displayKey: "Minus",
                    ahkKey: "-"
                },
                {
                    keyCode: 190,
                    displayKey: "Period",
                    ahkKey: "."
                },
                {
                    keyCode: 191,
                    displayKey: "/",
                    ahkKey: "/"
                },
                {
                    keyCode: 192,
                    displayKey: "Backquote",
                    ahkKey: "`"
                },
                {
                    keyCode: 193,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 194,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 195,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 196,
                    displayKey: "Numpad 0",
                    ahkKey: "Numpad0"
                },
                {
                    keyCode: 197,
                    displayKey: "Numpad 1",
                    ahkKey: "Numpad1"
                },
                {
                    keyCode: 198,
                    displayKey: "Numpad 2",
                    ahkKey: "Numpad2"
                },
                {
                    keyCode: 199,
                    displayKey: "Numpad 3",
                    ahkKey: "Numpad3"
                },
                {
                    keyCode: 200,
                    displayKey: "Numpad 4",
                    ahkKey: "Numpad4"
                },
                {
                    keyCode: 201,
                    displayKey: "Numpad 5",
                    ahkKey: "Numpad5"
                },
                {
                    keyCode: 202,
                    displayKey: "Numpad 6",
                    ahkKey: "Numpad6"
                },
                {
                    keyCode: 203,
                    displayKey: "Numpad 7",
                    ahkKey: "Numpad7"
                },
                {
                    keyCode: 204,
                    displayKey: "Numpad 8",
                    ahkKey: "Numpad8"
                },
                {
                    keyCode: 205,
                    displayKey: "Numpad 9",
                    ahkKey: "Numpad9"
                },
                {
                    keyCode: 206,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 207,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 208,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 209,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 210,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 211,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 212,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 213,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 214,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 215,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 216,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 217,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 218,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 219,
                    displayKey: "[",
                    ahkKey: "["
                },
                {
                    keyCode: 220,
                    displayKey: "\\",
                    ahkKey: "\\"
                },
                {
                    keyCode: 221,
                    displayKey: "]",
                    ahkKey: "]"
                },
                {
                    keyCode: 222,
                    displayKey: "Quote",
                    ahkKey: "'"
                },
                {
                    keyCode: 223,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 224,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 225,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 226,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 227,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 228,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 229,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 230,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 231,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 232,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 233,
                    displayKey: "Back",
                    ahkKey: "XButton1"
                },
                {
                    keyCode: 234,
                    displayKey: "Forward",
                    ahkKey: "XButton2"
                },
                {
                    keyCode: 235,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 236,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 237,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 238,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 239,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 240,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 241,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 242,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 243,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 244,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 245,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 246,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 247,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 248,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 249,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 250,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 251,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 252,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 253,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 254,
                    displayKey: "",
                    ahkKey: ""
                },
                {
                    keyCode: 255,
                    displayKey: "",
                    ahkKey: ""
                }
            ]
            }
        }
        deepMerge(deepMerge(deepMerge(this, defaults),_settingsObj),overrides)       
        this.appProfiles = [];
        if(_settingsObj && _settingsObj.appProfiles.length > 0){
            this.appProfiles = _settingsObj.appProfiles.map((appProfile) => new AppProfile(appProfile))
        } else {
            //no input was applied and the AHPSettings need to be reinitialized.
            console.log('Reinitializing AHPSettings');
        }
    }


    //Save - related to instance
    //Static Load(fileSettingsObj?)
    //Static Import(filePath?)
    //Export - related to instance    
}
class AppProfile {
    constructor(_appProfileObj=null){
        let defaults = {            
            name: "",
            ahkHandles: [],
            enable: true,
            pieEnableKey: {
                useEnableKey: false,
                enableKey: "capslock",
                toggle: false            
            },
            pieKeys: []            
        };
        deepMerge(deepMerge(this, defaults),_appProfileObj)
        this.pieKeys = []
        if(_appProfileObj && _appProfileObj.pieKeys && _appProfileObj.pieKeys.length > 0){
            this.pieKeys = _appProfileObj.pieKeys.map((pieKey) => new PieKey(pieKey))
        } else {
            console.log("No AppProfile data supplied");
        }        
    }

}
class PieKey {
    constructor(_pieKeyObj=null){        
        let defaults = {            
            name: "",
            hotkey: "",
            enable: true,
            labelDelay: 0,
            globalMenu: false,
            activationMode: {
                submenuMode: 1,
                clickableFunctions: true,
                keyReleaseDelay: true
                },
            pieMenus: []
        }   
        deepMerge(deepMerge(this, defaults),_pieKeyObj);
        this.pieMenus = [];
        if(_pieKeyObj && _pieKeyObj.pieMenus && _pieKeyObj.pieMenus.length > 0){
            this.pieMenus = _pieKeyObj.pieMenus.map((pieMenu) => new PieMenu(pieMenu))
        }
    }
}
class PieMenu {
    constructor(_pieMenu=null){
        let defaults = {
            backgroundColor: [35,35,35,255],
            selectionColor: [30,232,226,255],
            radius: 20,
            thickness: 10,
            labelRadius: 80,
            pieAngle: 0,
            functions: [],
        }  
        deepMerge(deepMerge(this, defaults),_pieMenu); 
        this.functions = [];       
        if(_pieMenu && _pieMenu.functions && _pieMenu.functions.length > 0){
            this.functions = _pieMenu.functions.map((pieFunc) => new PieFunction(pieFunc))
        }        
    }     
}
class PieFunction {
    constructor(_pieFunction=null){   
        let defaults = { function: "none",
            params: (_pieFunction !== null) ? PieFunction.getPieFunctionDefaultParameters(_pieFunction.function) : {},            
            label: "Slice",
            hotkey: "",
            clickable: false,
            returnMousePos: false,
            icon: {
                filePath: "",
                WBOnly: true
            }
        }
        deepMerge(deepMerge(this, defaults),_pieFunction); 
    }

    static fill (numFunctions=1) {
        let funcArray = Array.from({length:numFunctions})
        for (let i = 0; i < funcArray.length; i += 1) {
            funcArray[i] = new PieFunction({label:"Slice " + i});
        }
        return funcArray
    }

    static getPieFunctionDefaultParameters(pieAHKFuncName){      
        let returnParamObj = getFuncDefaultParams(pieAHKFuncName)
        function getFuncDefaultParams(pieFuncName){
        switch (pieFuncName){ 
            case "sendKey":                            
                return {
                    keys:[],
                    keyDelay:50,
                    delayKeyRelease:true
                }
                break;
            case "mouseClick":
                //Set Icon for mouse?
                return {
                button:"right",
                shift:false,
                ctrl:false,
                alt:false,
                drag:true
            }
                break;
            case "runScript":
                return {
                    filePath:""                                                                
                }
                break;
            case "openFolder":
                return {
                    filePath:""                                                                
                }
                break;
            case "repeatLastFunction":
                return {
                    timeout:1
                }
                break;
            case "submenu":             
                return {pieMenuNumber: 0,isBack: false}
                break;
            // case "Parameter List":
            //     return {
            //         parameter:selectedFunc.parameter,
            //         list:[]                               
            //     }                            
            //     break;
            case "Photoshop_cycleTool":
                return {
                    //This might have to be updated later... fire waiting to happen.
                    toolOptions:["moveTool","artboardTool","marqueeRectTool","marqueeEllipTool","marqueeSingleRowTool","marqueeSingleColumnTool","lassoTool","polySelTool","magneticLassoTool","quickSelectTool","magicWandTool","cropTool","perspectiveCropTool","sliceTool","sliceSelectTool","framedGroupTool","eyedropperTool","3DMaterialSelectTool","colorSamplerTool","rulerTool","textAnnotTool","countTool","spotHealingBrushTool","magicStampTool","patchSelection","recomposeSelection","redEyeTool","paintbrushTool","pencilTool","colorReplacementBrushTool","wetBrushTool","cloneStampTool","patternStampTool","historyBrushTool","artBrushTool","eraserTool","backgroundEraserTool","magicEraserTool","gradientTool","bucketTool","3DMaterialDropTool","blurTool","sharpenTool","smudgeTool","dodgeTool","burnInTool","saturationTool","penTool","freeformPenTool","curvaturePenTool","addKnotTool","deleteKnotTool","convertKnotTool","typeCreateOrEditTool","typeVerticalCreateOrEditTool","typeVerticalCreateMaskTool","typeCreateMaskTool","pathComponentSelectTool","directSelectTool","rectangleTool","roundedRectangleTool","ellipseTool","polygonTool","lineTool","customShapeTool","handTool","rotateTool","zoomTool"],
                    tools:[]
                }
                break;
            default:
                //includes "No Options"
                return {}
                break;
        }     
        }
        
        
        return returnParamObj
    }
}
//Load or create Settings File

try{
    LoadSettingsJsonFile(SettingsFileName);
}catch(e){
    console.log("Cannot Load Settings File:\n" + e);
    AutoHotPieSettings = createIntialAHPSettingsProfile()
    // AutoHotPieSettings.appProfiles[0].pieKeys = [];
}



function deepMerge(target, source) {
    if (source == null){
        return target
    }
    Object.entries(source).forEach(([key, value]) => {
        if (value && typeof value === 'object' && !Array.isArray(value)) {
            deepMerge(target[key] = target[key] || {}, value);
            return;
        }
        target[key] = value;
    });
    return target;  
}

function LoadSettingsJsonFile(settingsFileName){
    AutoHotPieSettings = new AHPSettings(JSONFile.open(settingsFileName));    
    JSONFile.save(settingsFileName.replace('.','-old.'),AutoHotPieSettings) //Create backup file 
    console.log(AutoHotPieSettings)
    return

}

function createDefaultAHPSettings(){        
    return {
        global: {
        pieTips: true,
        app:{
            sourceFileName:SettingsFileName,
            appVersion: electron.getVersion()
        },
        startup:{
            runOnStartup:false,
            runAHKPieMenus:false
        },
        globalAppearance: {
            font: "Arial",
            fontSize: 14,
            fontColors: {
                white: [
                    255,
                    255,
                    255
                ],
                grey: [
                    180,
                    180,
                    180
                ],
                black: [
                    35,
                    35,
                    35
                ]
            },
            minimumLabelWidth: 0,
            pieIconFolder: "%A_ScriptDir%\\icons",
            iconSize: 24,
            safetyStrokeColor: [
                123,
                123,
                123,
                255
            ],
            labelStrokeThickness: 1
        },
        functionConfig: [
            {
                associatedProfiles: [
                    "general"
                ],
                functions: [
                    {
                        name: "Send Key",
                        optionType: "Send Key",
                        ahkFunction: "sendKey"
                    },
                    {
                        name: "Mouse Click",
                        optionType: "Mouse Click",
                        ahkFunction: "mouseClick"
                    },
                    {
                        name: "Run File",
                        optionType: "Run Script",
                        ahkFunction: "runScript"
                    },
                    {
                        name: "Open Folder",
                        optionType: "Open Folder",
                        ahkFunction: "openFolder"
                    },
                    {
                        name: "Repeat Last",
                        optionType: "Repeat Last",
                        ahkFunction: "repeatLastFunction"
                    },
                    {
                        name: "Sub Menu",
                        optionType: "Sub Menu",
                        ahkFunction: "submenu"
                    },
                    {
                        name: "None",
                        optionType: "No Options",
                        ahkFunction: "none"
                    },
                    {
                        name: "Resize Window",
                        optionType: "No Options",
                        ahkFunction: "resizeWindow"
                    },
                    {
                        name: "Move Window",
                        optionType: "No Options",
                        ahkFunction: "moveWindow"
                    },
                    {
                        name: "AutoHotPie Settings",
                        optionType: "No Options",
                        ahkFunction: "openSettings"
                    }                       
                ]
            },
            {
                associatedProfiles: [
                    "Photoshop"
                ],
                functions: [
                    {
                        name: "Switch Tool",
                        optionType: "photoshop_cycleTool",
                        ahkFunction: "Photoshop_cycleTool"
                    },
                    {
                        name: "Toggle Layer by Name",
                        optionType: "Parameter List",
                        parameter: "Layer",
                        ahkFunction: "Photoshop_toggleLayerByName"
                    },
                    {
                        name: "Switch Brush",
                        optionType: "Parameter List",
                        parameter: "Brush",
                        ahkFunction: "Photoshop_cycleBrush"
                    }
                ]
            }
        ],
        htmlAhkKeyConversionTable: [
            {
                keyCode: 0,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 1,
                displayKey: "Enter",
                ahkKey: "enter"
            },
            {
                keyCode: 2,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 3,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 4,
                displayKey: "MMB",
                ahkKey: "Mbutton"
            },
            {
                keyCode: 5,
                displayKey: "RMB",
                ahkKey: "Rbutton"
            },
            {
                keyCode: 6,
                displayKey: "Back",
                ahkKey: "XButton1"
            },
            {
                keyCode: 7,
                displayKey: "Forward",
                ahkKey: "Xbutton2"
            },
            {
                keyCode: 8,
                displayKey: "Backspace",
                ahkKey: "backspace"
            },
            {
                keyCode: 9,
                displayKey: "Tab",
                ahkKey: "tab"
            },
            {
                keyCode: 10,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 11,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 12,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 13,
                displayKey: "Numpad Enter",
                ahkKey: "NumpadEnter"
            },
            {
                keyCode: 14,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 15,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 16,
                displayKey: "Shift",
                ahkKey: "shift"
            },
            {
                keyCode: 17,
                displayKey: "Ctrl",
                ahkKey: "ctrl"
            },
            {
                keyCode: 18,
                displayKey: "Alt",
                ahkKey: "alt"
            },
            {
                keyCode: 19,
                displayKey: "Pause",
                ahkKey: "Pause"
            },
            {
                keyCode: 20,
                displayKey: "CapsLock",
                ahkKey: "capslock"
            },
            {
                keyCode: 21,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 22,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 23,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 24,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 25,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 26,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 27,
                displayKey: "Escape",
                ahkKey: "esc"
            },
            {
                keyCode: 28,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 29,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 30,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 31,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 32,
                displayKey: "Space",
                ahkKey: "space"
            },
            {
                keyCode: 33,
                displayKey: "PageUp",
                ahkKey: "pgup"
            },
            {
                keyCode: 34,
                displayKey: "PageDown",
                ahkKey: "pgdn"
            },
            {
                keyCode: 35,
                displayKey: "End",
                ahkKey: "end"
            },
            {
                keyCode: 36,
                displayKey: "Home",
                ahkKey: "home"
            },
            {
                keyCode: 37,
                displayKey: "ArrowLeft",
                ahkKey: "left"
            },
            {
                keyCode: 38,
                displayKey: "ArrowUp",
                ahkKey: "up"
            },
            {
                keyCode: 39,
                displayKey: "ArrowRight",
                ahkKey: "right"
            },
            {
                keyCode: 40,
                displayKey: "ArrowDown",
                ahkKey: "down"
            },
            {
                keyCode: 41,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 42,
                displayKey: "PrintScreen",
                ahkKey: "PrintScreen"
            },
            {
                keyCode: 43,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 44,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 45,
                displayKey: "Insert",
                ahkKey: "ins"
            },
            {
                keyCode: 46,
                displayKey: "Delete",
                ahkKey: "delete"
            },
            {
                keyCode: 47,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 48,
                displayKey: "0",
                ahkKey: "0"
            },
            {
                keyCode: 49,
                displayKey: "1",
                ahkKey: "1"
            },
            {
                keyCode: 50,
                displayKey: "2",
                ahkKey: "2"
            },
            {
                keyCode: 51,
                displayKey: "3",
                ahkKey: "3"
            },
            {
                keyCode: 52,
                displayKey: "4",
                ahkKey: "4"
            },
            {
                keyCode: 53,
                displayKey: "5",
                ahkKey: "5"
            },
            {
                keyCode: 54,
                displayKey: "6",
                ahkKey: "6"
            },
            {
                keyCode: 55,
                displayKey: "7",
                ahkKey: "7"
            },
            {
                keyCode: 56,
                displayKey: "8",
                ahkKey: "8"
            },
            {
                keyCode: 57,
                displayKey: "9",
                ahkKey: "9"
            },
            {
                keyCode: 58,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 59,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 60,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 61,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 62,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 63,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 64,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 65,
                displayKey: "A",
                ahkKey: "a"
            },
            {
                keyCode: 66,
                displayKey: "B",
                ahkKey: "b"
            },
            {
                keyCode: 67,
                displayKey: "C",
                ahkKey: "c"
            },
            {
                keyCode: 68,
                displayKey: "D",
                ahkKey: "d"
            },
            {
                keyCode: 69,
                displayKey: "E",
                ahkKey: "e"
            },
            {
                keyCode: 70,
                displayKey: "F",
                ahkKey: "f"
            },
            {
                keyCode: 71,
                displayKey: "G",
                ahkKey: "g"
            },
            {
                keyCode: 72,
                displayKey: "H",
                ahkKey: "h"
            },
            {
                keyCode: 73,
                displayKey: "I",
                ahkKey: "i"
            },
            {
                keyCode: 74,
                displayKey: "J",
                ahkKey: "j"
            },
            {
                keyCode: 75,
                displayKey: "K",
                ahkKey: "k"
            },
            {
                keyCode: 76,
                displayKey: "L",
                ahkKey: "l"
            },
            {
                keyCode: 77,
                displayKey: "M",
                ahkKey: "m"
            },
            {
                keyCode: 78,
                displayKey: "N",
                ahkKey: "n"
            },
            {
                keyCode: 79,
                displayKey: "O",
                ahkKey: "o"
            },
            {
                keyCode: 80,
                displayKey: "P",
                ahkKey: "p"
            },
            {
                keyCode: 81,
                displayKey: "Q",
                ahkKey: "q"
            },
            {
                keyCode: 82,
                displayKey: "R",
                ahkKey: "r"
            },
            {
                keyCode: 83,
                displayKey: "S",
                ahkKey: "s"
            },
            {
                keyCode: 84,
                displayKey: "T",
                ahkKey: "t"
            },
            {
                keyCode: 85,
                displayKey: "U",
                ahkKey: "u"
            },
            {
                keyCode: 86,
                displayKey: "V",
                ahkKey: "v"
            },
            {
                keyCode: 87,
                displayKey: "W",
                ahkKey: "w"
            },
            {
                keyCode: 88,
                displayKey: "X",
                ahkKey: "x"
            },
            {
                keyCode: 89,
                displayKey: "Y",
                ahkKey: "y"
            },
            {
                keyCode: 90,
                displayKey: "Z",
                ahkKey: "z"
            },
            {
                keyCode: 91,
                displayKey: "WindowsLeft",
                ahkKey: "Lwin"
            },
            {
                keyCode: 92,
                displayKey: "WindowsRight",
                ahkKey: "Rwin"
            },
            {
                keyCode: 93,
                displayKey: "ContextMenu",
                ahkKey: "AppsKey"
            },
            {
                keyCode: 94,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 95,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 96,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 97,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 98,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 99,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 100,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 101,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 102,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 103,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 104,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 105,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 106,
                displayKey: "Numpad *",
                ahkKey: "NumpadMult"
            },
            {
                keyCode: 107,
                displayKey: "Numpad +",
                ahkKey: "NumpadPlus"
            },
            {
                keyCode: 108,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 109,
                displayKey: "Numpad -",
                ahkKey: "NumpadSub"
            },
            {
                keyCode: 110,
                displayKey: "Numpad .",
                ahkKey: "NumpadDot"
            },
            {
                keyCode: 111,
                displayKey: "Numpad /",
                ahkKey: "NumpadDiv"
            },
            {
                keyCode: 112,
                displayKey: "F1",
                ahkKey: "f1"
            },
            {
                keyCode: 113,
                displayKey: "F2",
                ahkKey: "f2"
            },
            {
                keyCode: 114,
                displayKey: "F3",
                ahkKey: "f3"
            },
            {
                keyCode: 115,
                displayKey: "F4",
                ahkKey: "f4"
            },
            {
                keyCode: 116,
                displayKey: "F5",
                ahkKey: "f5"
            },
            {
                keyCode: 117,
                displayKey: "F6",
                ahkKey: "f6"
            },
            {
                keyCode: 118,
                displayKey: "F7",
                ahkKey: "f7"
            },
            {
                keyCode: 119,
                displayKey: "F8",
                ahkKey: "f8"
            },
            {
                keyCode: 120,
                displayKey: "F9",
                ahkKey: "f9"
            },
            {
                keyCode: 121,
                displayKey: "F10",
                ahkKey: "f10"
            },
            {
                keyCode: 122,
                displayKey: "F11",
                ahkKey: "f11"
            },
            {
                keyCode: 123,
                displayKey: "F12",
                ahkKey: "f12"
            },
            {
                keyCode: 124,
                displayKey: "F13",
                ahkKey: "f13"
            },
            {
                keyCode: 125,
                displayKey: "F14",
                ahkKey: "f14"
            },
            {
                keyCode: 126,
                displayKey: "F15",
                ahkKey: "f15"
            },
            {
                keyCode: 127,
                displayKey: "F16",
                ahkKey: "f16"
            },
            {
                keyCode: 128,
                displayKey: "F17",
                ahkKey: "f17"
            },
            {
                keyCode: 129,
                displayKey: "F18",
                ahkKey: "f18"
            },
            {
                keyCode: 130,
                displayKey: "F19",
                ahkKey: "f19"
            },
            {
                keyCode: 131,
                displayKey: "F20",
                ahkKey: "f20"
            },
            {
                keyCode: 132,
                displayKey: "F21",
                ahkKey: "f21"
            },
            {
                keyCode: 133,
                displayKey: "F22",
                ahkKey: "f22"
            },
            {
                keyCode: 134,
                displayKey: "F23",
                ahkKey: "f23"
            },
            {
                keyCode: 135,
                displayKey: "F24",
                ahkKey: "f24"
            },
            {
                keyCode: 136,
                displayKey: "F25",
                ahkKey: "f25"
            },
            {
                keyCode: 137,
                displayKey: "F26",
                ahkKey: "f26"
            },
            {
                keyCode: 138,
                displayKey: "F27",
                ahkKey: "f27"
            },
            {
                keyCode: 139,
                displayKey: "F28",
                ahkKey: "f28"
            },
            {
                keyCode: 140,
                displayKey: "F29",
                ahkKey: "f29"
            },
            {
                keyCode: 141,
                displayKey: "F30",
                ahkKey: "f30"
            },
            {
                keyCode: 142,
                displayKey: "F31",
                ahkKey: "f31"
            },
            {
                keyCode: 143,
                displayKey: "F32",
                ahkKey: "f32"
            },
            {
                keyCode: 144,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 145,
                displayKey: "ScrollLock",
                ahkKey: "ScrollLock"
            },
            {
                keyCode: 146,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 147,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 148,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 149,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 150,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 151,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 152,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 153,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 154,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 155,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 156,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 157,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 158,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 159,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 160,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 161,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 162,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 163,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 164,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 165,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 166,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 167,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 168,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 169,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 170,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 171,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 172,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 173,
                displayKey: "Mute",
                ahkKey: "Volume_Mute"
            },
            {
                keyCode: 174,
                displayKey: "Volume Down",
                ahkKey: "Volume_Down"
            },
            {
                keyCode: 175,
                displayKey: "Volume Up",
                ahkKey: "Volume_Up"
            },
            {
                keyCode: 176,
                displayKey: "Media Next",
                ahkKey: "Media_Next"
            },
            {
                keyCode: 177,
                displayKey: "Media Back",
                ahkKey: "Media_Prev"
            },
            {
                keyCode: 178,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 179,
                displayKey: "Media Play/Pause",
                ahkKey: "Media_Play_Pause"
            },
            {
                keyCode: 180,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 181,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 182,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 183,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 184,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 185,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 186,
                displayKey: ";",
                ahkKey: ";"
            },
            {
                keyCode: 187,
                displayKey: "Equal",
                ahkKey: "="
            },
            {
                keyCode: 188,
                displayKey: "Comma",
                ahkKey: ","
            },
            {
                keyCode: 189,
                displayKey: "Minus",
                ahkKey: "-"
            },
            {
                keyCode: 190,
                displayKey: "Period",
                ahkKey: "."
            },
            {
                keyCode: 191,
                displayKey: "/",
                ahkKey: "/"
            },
            {
                keyCode: 192,
                displayKey: "Backquote",
                ahkKey: "`"
            },
            {
                keyCode: 193,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 194,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 195,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 196,
                displayKey: "Numpad 0",
                ahkKey: "Numpad0"
            },
            {
                keyCode: 197,
                displayKey: "Numpad 1",
                ahkKey: "Numpad1"
            },
            {
                keyCode: 198,
                displayKey: "Numpad 2",
                ahkKey: "Numpad2"
            },
            {
                keyCode: 199,
                displayKey: "Numpad 3",
                ahkKey: "Numpad3"
            },
            {
                keyCode: 200,
                displayKey: "Numpad 4",
                ahkKey: "Numpad4"
            },
            {
                keyCode: 201,
                displayKey: "Numpad 5",
                ahkKey: "Numpad5"
            },
            {
                keyCode: 202,
                displayKey: "Numpad 6",
                ahkKey: "Numpad6"
            },
            {
                keyCode: 203,
                displayKey: "Numpad 7",
                ahkKey: "Numpad7"
            },
            {
                keyCode: 204,
                displayKey: "Numpad 8",
                ahkKey: "Numpad8"
            },
            {
                keyCode: 205,
                displayKey: "Numpad 9",
                ahkKey: "Numpad9"
            },
            {
                keyCode: 206,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 207,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 208,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 209,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 210,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 211,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 212,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 213,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 214,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 215,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 216,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 217,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 218,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 219,
                displayKey: "[",
                ahkKey: "["
            },
            {
                keyCode: 220,
                displayKey: "\\",
                ahkKey: "\\"
            },
            {
                keyCode: 221,
                displayKey: "]",
                ahkKey: "]"
            },
            {
                keyCode: 222,
                displayKey: "Quote",
                ahkKey: "'"
            },
            {
                keyCode: 223,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 224,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 225,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 226,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 227,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 228,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 229,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 230,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 231,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 232,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 233,
                displayKey: "Back",
                ahkKey: "XButton1"
            },
            {
                keyCode: 234,
                displayKey: "Forward",
                ahkKey: "XButton2"
            },
            {
                keyCode: 235,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 236,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 237,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 238,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 239,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 240,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 241,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 242,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 243,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 244,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 245,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 246,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 247,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 248,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 249,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 250,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 251,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 252,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 253,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 254,
                displayKey: "",
                ahkKey: ""
            },
            {
                keyCode: 255,
                displayKey: "",
                ahkKey: ""
            }
        ]
    },
    appProfiles: [
        {
            name: "Default Profile",
            ahkHandles: [
                "ahk_group regApps"
            ],
            enable: true,
            pieEnableKey: {
                useEnableKey: false,
                enableKey: "capslock",
                toggle: false
            },
            pieKeys: [
                {
                    name: "Pie Menu 1",
                    hotkey: "`",
                    enable: true,
                    labelDelay: 0,
                    globalMenu: false,
                    activationMode: {
                        submenuMode: 1,
                        clickableFunctions: true,
                        keyReleaseDelay: true
                    },
                    pieMenus: [
                        {
                            backgroundColor: [
                                35,
                                35,
                                35,
                                255
                            ],
                            selectionColor: [
                                30,
                                232,
                                226,
                                255
                            ],
                            radius: 20,
                            thickness: 10,
                            labelRadius: 80,
                            pieAngle: 0,
                            functions: [
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 0",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 1",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 2",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 3",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 4",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 5",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                },
                                {
                                    function: "none",
                                    params: {},
                                    label: "Slice 6",
                                    hotkey: "",
                                    clickable: false,
                                    returnMousePos: false,
                                    icon: {
                                        filePath: "",
                                        WBOnly: true
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
    }
}

function createIntialAHPSettingsProfile(){
    let AHPSettingsObj = new AHPSettings({
        appProfiles: [new AppProfile({
            name: "Default Profile",
            ahkHandles: ["ahk_group regApps"],                      
            pieKeys: [new PieKey({
                name: "Newborn Pie Menu",
                hotkey: "`",
                pieMenus : [new PieMenu({
                    functions: fillPieFunctions(7)
                })]
            })]
        })]    
    });    
    function fillPieFunctions(numFunctions=1){
        let funcArray = Array.from({length:numFunctions})
        for (let i = 0; i < funcArray.length; i += 1) {
            funcArray[i] = new PieFunction({label:"Slice " + i});
        }
        return funcArray
    }   
    return AHPSettingsObj
}

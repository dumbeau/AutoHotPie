"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.initElectronAPI = void 0;
const electron_1 = require("electron");
const child_process = require("child_process");
const Preferences_1 = require("./preferences/Preferences");
const NativeAPI_1 = require("./nativeAPI/NativeAPI");
const GlobalHotkeyService_1 = require("./nativeAPI/GlobalHotkeyService");
const KeyEvent_1 = require("./nativeAPI/KeyEvent");
/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
function initElectronAPI() {
    electron_1.ipcMain.handle('openInBrowser', (event, args) => {
        console.debug("ipcBridge.ts openInBrowser(): opening " + args[0] + " in browser");
        child_process.execSync('start ' + args[0]);
    });
    electron_1.ipcMain.handle('getSettings', () => {
        console.debug("ipcBridge.ts getSettings(): retrieving settings");
        const settings = [];
        Object.entries(Preferences_1.Preferences.getAHPSettings()).forEach((entry) => {
            settings.push({ key: entry[0], value: entry[1] });
        });
        return settings;
    });
    electron_1.ipcMain.handle('isUpdateAvailable', () => __awaiter(this, void 0, void 0, function* () {
        console.log("isUpdateAvailable() called, checking for updates");
        // TODO: Implement isUpdateAvailable
        return true;
    }));
    electron_1.ipcMain.handle('getForegroundApplication', () => {
        var _a;
        console.log("getForegroundApplication() called, retrieving foreground application info");
        const fgDetail = (_a = NativeAPI_1.NativeAPI.instance.getForegroundWindow()) === null || _a === void 0 ? void 0 : _a.toJSONString();
        console.log("ipcBridge.ts: getForegroundApplication() returning " + fgDetail);
        return fgDetail !== null && fgDetail !== void 0 ? fgDetail : "";
    });
    electron_1.ipcMain.handle('toggleService', (event, args) => {
        console.log("toggleService() called, the service is now " + args[0] + ". Turning it " + (!args[0] ? "on" : "off") + "");
        // args[0] = serviceActive
        if (GlobalHotkeyService_1.GlobalHotkeyService.isRunning()) {
            GlobalHotkeyService_1.GlobalHotkeyService.getInstance().exitProcess();
            return false;
        }
        else {
            GlobalHotkeyService_1.GlobalHotkeyService.getInstance();
            return true;
        }
    });
    electron_1.ipcMain.handle('listenKeyForResult', () => {
        return new Promise(resolve => {
            console.log("listenKeyForResult() called, listening for key");
            const listener = (event) => {
                var _a;
                if (event.type === KeyEvent_1.RespondType.KEY_DOWN
                    && !["Alt",
                        "Control",
                        "Modifiers",
                        "LMenu",
                        "RMenu",
                        "Capital",
                        "Tab",
                        "Shift",
                        "Escape",
                        "LShiftKey",
                        "RShiftKey",
                        "LControlKey",
                        "RControlKey",
                        "ControlKey"].includes(((_a = event.value.split('+').pop()) !== null && _a !== void 0 ? _a : 'PLACEHOLDER').trim())) {
                    GlobalHotkeyService_1.GlobalHotkeyService.getInstance().removeTempKeyListener();
                    console.log("ipcBridge.ts: listenKeyForResult() returning " + event.value);
                    resolve(event.value);
                }
            };
            GlobalHotkeyService_1.GlobalHotkeyService.getInstance().addTempKeyListener(listener);
        });
    });
}
exports.initElectronAPI = initElectronAPI;
//# sourceMappingURL=ipcBridge.js.map
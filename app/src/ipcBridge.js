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
const Profile_1 = require("./preferences/Profile");
const PieMenu_1 = require("./preferences/PieMenu");
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
    electron_1.ipcMain.handle('getProfileIds', () => {
        const ids = Preferences_1.Preferences.getProfileIds();
        console.debug("ipcBridge.ts getProfileIds(): returning [" + ids + "]");
        return ids;
    });
    electron_1.ipcMain.handle('getPieItem', (event, args) => {
        var _a;
        console.debug("getPieItem() called, retrieving pie item info for pie item id " + args[0] + "");
        // args[0] = pieItemId
        const pieItem = (_a = Preferences_1.Preferences.getPieItem(args[0])) === null || _a === void 0 ? void 0 : _a.toJsonString();
        console.debug("ipcBridge.ts: getPieItem() returning " + pieItem);
        return pieItem;
    });
    electron_1.ipcMain.handle('getProfile', (event, args) => {
        console.debug("getProfile() called, retrieving profile info for profile id " + args[0] + "");
        // args[0] = profId
        const profile = Preferences_1.Preferences.getProfile(args[0]).toJsonString();
        console.debug("ipcBridge.ts: getProfile() returning " + profile);
        return profile;
    });
    electron_1.ipcMain.handle('getPieMenu', (event, args) => {
        console.log("getPieMenu() called, retrieving pie menu info for pie menu id " + args[0] + "");
        // args[0] = pieId
        const pieMenu = Preferences_1.Preferences.getPieMenu(args[0]).toJsonString();
        console.log("ipcBridge.ts: getPieMenu() returning " + pieMenu);
        return pieMenu;
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
    electron_1.ipcMain.handle('createProfile', (event, args) => {
        console.log("createProfile() called, creating new profile with name " + args[0] + "exePath " + args[1] + " and iconPath " + args[2] + "");
        // args[0] = profName, args[1] = exePath, args[2] = iconBase64
        const id = Date.now().toString();
        Preferences_1.Preferences.setUserData(Profile_1.Profile.create(id, args[0], true, [], args[1], args[2]));
        return id;
    });
    electron_1.ipcMain.handle('updateProfileName', (event, args) => {
        console.log("updateProfileName() called, updating profile name");
        // args[0] = profId, args[1] = newName
        const profile = Preferences_1.Preferences.getProfile(args[0]);
        profile.name = args[1];
        Preferences_1.Preferences.setUserData(profile);
        // return true if successful, false if failed
        return true;
    });
    electron_1.ipcMain.handle('listenHotkeyForResult', () => {
        console.log("listenHotkeyForResult() called, listening for hotkey");
        // TODO: Implement listenHotkeyForResult
        return 'ctrl+shift+p';
    });
    electron_1.ipcMain.handle('createPieMenuIn', (event, args) => {
        console.log("createPieMenuIn() called, creating pie menu");
        // args[0] = profId
        const pie = PieMenu_1.PieMenu.create(Date.now().toString(), "New Pie Menu", true, PieMenu_1.ActivationMode.RELEASE_ON_FUNCTION, '', -1, false, '#FFFFFF', []);
        Preferences_1.Preferences.setUserData(pie);
        Preferences_1.Preferences.addPieMenuToProfile(args[0], pie.id);
        return true;
    });
    electron_1.ipcMain.handle('removePieMenuFromProfile', (event, args) => {
        console.log("removePieMenuFromProfile() called, removing pie menu from profile");
        // args[0] = profId, args[1] = pieId
        Preferences_1.Preferences.removePieMenuFromProfile(args[0], args[1]);
        return true;
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
    electron_1.ipcMain.handle('updatePieMenu', (event, args) => {
        console.log("updatePieMenu() called, updating pie menu");
        // args[0] = JsonString of pie menu
        Preferences_1.Preferences.setUserData(PieMenu_1.PieMenu.fromJsonString(args[0]));
    });
    electron_1.ipcMain.handle('updateProfile', (event, args) => {
        console.log("updateProfile() called, updating profile");
        // args[0] = JsonString of pie menu
        Preferences_1.Preferences.setUserData(Profile_1.Profile.fromJsonString(args[0]));
    });
}
exports.initElectronAPI = initElectronAPI;
//# sourceMappingURL=ipcBridge.js.map
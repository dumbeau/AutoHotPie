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
exports.initializeIPCListeners = void 0;
const electron_1 = require("electron");
const child_process = require("child_process");
const Preferences_1 = require("../pref/Preferences");
const NativeAPI_1 = require("../src/NativeAPI");
/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
function initializeIPCListeners() {
    electron_1.ipcMain.handle('openInBrowser', (event, args) => {
        child_process.execSync('start ' + args[0]);
    });
    electron_1.ipcMain.handle('getSettings', () => {
        console.log("getSettings() called, retrieving settings");
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
        console.log("getForegroundApplication() called, retrieving foreground application info");
        const fgWinDetail = JSON.parse(NativeAPI_1.NativeAPI.instance.getForegroundWindowDetails());
        const result = [fgWinDetail["exePath"], "exeIconPath"];
        console.log("ipcBridge.ts: getForegroundApplication() returning " + result);
        // TODO: Find a way to get the icon, it's best to have bitmap data
        return result;
    });
    electron_1.ipcMain.handle('createProfile', (event, args) => {
        console.log("createProfile() called, retrieving foreground application info");
        // TODO: Implement createProfile
        // args[0] = profName, args[1] = exePath, args[2] = iconPath
        // return the ID of the newly created profile, -1 if failed
        return 0;
    });
    electron_1.ipcMain.handle('updateProfileName', (event, args) => {
        console.log("updateProfileName() called, updating profile name");
        // TODO: Implement createProfile
        // args[0] = profId, args[1] = newName
        // return true if successful, false if failed
        return true;
    });
    electron_1.ipcMain.handle('getProfile', (event, args) => {
        console.log("getProfile() called, retrieving profile info for profile id " + args[0] + "");
        // args[0] = profId
        const profile = JSON.stringify(Preferences_1.Preferences.getProfiles()[args[0]]);
        console.log("ipcBridge.ts: getProfile() returning " + profile);
        return profile;
    });
    electron_1.ipcMain.handle('getProfileIds', () => {
        console.log("getProfileIds() called, retrieving profile id list");
        const ids = Object.keys(Preferences_1.Preferences.getProfiles());
        console.log("ipcBridge.ts: getProfileIds() returning [" + ids + "]");
        return ids;
    });
    electron_1.ipcMain.handle('getPieMenu', (event, args) => {
        console.log("getPieMenu() called, retrieving pie menu info for pie menu id " + args[0] + "");
        // args[0] = pieId
        const pieMenu = JSON.stringify(Preferences_1.Preferences.getPieMenus()[args[0]]);
        console.log("ipcBridge.ts: getPieMenu() returning " + pieMenu);
        return pieMenu;
    });
    electron_1.ipcMain.handle('listenHotkeyForResult', () => {
        console.log("listenHotkeyForResult() called, listening for hotkey");
        // TODO: Implement listenHotkeyForResult
        return 'ctrl+shift+p';
    });
    electron_1.ipcMain.handle('createPieMenu', () => {
        console.log("createPieMenu() called, creating pie menu");
        // TODO: Implement listenHotkeyForResult
        return true;
    });
    electron_1.ipcMain.handle('removePieMenuFromProfile', () => {
        console.log("removePieMenuFromProfile() called, removing pie menu from profile");
        // TODO: Implement removePieMenuFromProfile
        return true;
    });
}
exports.initializeIPCListeners = initializeIPCListeners;
//# sourceMappingURL=ipcBridge.js.map
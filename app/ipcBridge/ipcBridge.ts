import {ipcMain} from "electron";
import * as child_process from "child_process";
import {Preferences} from "../pref/Preferences";
import {get, request} from "https";
import {NativeAPI} from "../src/NativeAPI";

/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
export function initializeIPCListeners() {
    ipcMain.handle('openInBrowser', (event, args) => {
        child_process.execSync('start ' + args[0]);
    });
    ipcMain.handle('getSettings', () => {
        console.log("getSettings() called, retrieving settings");

        const settings: { key: string; value: any; }[] = [];
        Object.entries(Preferences.getAHPSettings()).forEach((entry) => {
            settings.push({key: entry[0], value: entry[1]});
        });

        return settings;
    });
    ipcMain.handle('isUpdateAvailable', async () => {
        console.log("isUpdateAvailable() called, checking for updates");
        // TODO: Implement isUpdateAvailable
        return true;
    });
    ipcMain.handle('getForegroundApplication', () => {
        console.log("getForegroundApplication() called, retrieving foreground application info");

        const fgWinDetail = JSON.parse(NativeAPI.instance.getForegroundWindowDetails());
        const result = [fgWinDetail["exePath"], "exeIconPath"];

        console.log("ipcBridge.ts: getForegroundApplication() returning " + result);

        // TODO: Find a way to get the icon, it's best to have bitmap data

        return result;
    });
    ipcMain.handle('createProfile', (event, args) => {
        console.log("createProfile() called, retrieving foreground application info");
        // TODO: Implement createProfile
        // args[0] = profName, args[1] = exePath, args[2] = iconPath

        // return the ID of the newly created profile, -1 if failed
        return 0;
    });
    ipcMain.handle('updateProfileName', (event, args) => {
        console.log("updateProfileName() called, updating profile name");
        // TODO: Implement createProfile
        // args[0] = profId, args[1] = newName

        // return true if successful, false if failed
        return true;
    });
    ipcMain.handle('getProfile', (event, args: string) => {
        console.log("getProfile() called, retrieving profile info for profile id " + args[0] + "");
        // args[0] = profId

        const profile = JSON.stringify(Preferences.getProfiles()[args[0] as keyof JSON]);
        console.log("ipcBridge.ts: getProfile() returning " + profile);

        return profile;
    });
    ipcMain.handle('getProfileIds', () => {
        console.log("getProfileIds() called, retrieving profile id list");

        const ids = Object.keys(Preferences.getProfiles());
        console.log("ipcBridge.ts: getProfileIds() returning [" + ids + "]");

        return ids;
    });
    ipcMain.handle('getPieMenu', (event, args) => {
        console.log("getPieMenu() called, retrieving pie menu info for pie menu id " + args[0] + "");
        // args[0] = pieId

        const pieMenu = JSON.stringify(Preferences.getPieMenus()[args[0] as keyof JSON]);
        console.log("ipcBridge.ts: getPieMenu() returning " + pieMenu);

        return pieMenu;
    });
    ipcMain.handle('listenHotkeyForResult', () => {
        console.log("listenHotkeyForResult() called, listening for hotkey");
        // TODO: Implement listenHotkeyForResult

        return 'ctrl+shift+p';
    });
    ipcMain.handle('createPieMenu', () => {
        console.log("createPieMenu() called, creating pie menu");
        // TODO: Implement listenHotkeyForResult

        return true;
    });
    ipcMain.handle('removePieMenuFromProfile', () => {
        console.log("removePieMenuFromProfile() called, removing pie menu from profile");
        // TODO: Implement removePieMenuFromProfile

        return true;
    });
}

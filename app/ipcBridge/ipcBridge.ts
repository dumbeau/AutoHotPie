import {ipcMain} from "electron";
import * as child_process from "child_process";

/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
export function initializeIPCListeners() {
    ipcMain.handle('openInBrowser', (event, args) => {
        child_process.execSync('start ' + args[0]);
    });
    ipcMain.handle('getSettings', () => {
        // TODO: Implement get settings
        return [
            {key: "TEST_SETTING_1", value: true},
            {key: "TEST_SETTING_1", value: false}
        ];
    });
    ipcMain.handle('isUpdateAvailable', () => {
        console.log("isUpdateAvailable() called, checking for updates");
        // TODO: Implement isUpdateAvailable
        return true;
    });
    ipcMain.handle('getForegroundApplication', () => {
        console.log("getForegroundApplication() called, retrieving foreground application info");
        // TODO: Implement getForegroundApplication
        return ["exePath", "exeIconPath"];
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
    ipcMain.handle('getProfile', (event, args) => {
        console.log("getProfile() called, retrieving profile info for profile id " + args[0] + "");
        // TODO: Implement createProfile
        // args[0] = profId

        // return the json string
        if (args[0] === '0')
            return '{"name":"test1"}';
        else
            return '{"name":"test2"}';
    });
    ipcMain.handle('getProfileIds', () => {
        console.log("getProfileIds() called, retrieving profile id list");
        // TODO: Implement getProfileIds

        return ["0", "1"];
    });
    ipcMain.handle('getPieMenu', (event, args) => {
        console.log("getPieMenu() called, retrieving pie menu info for pie menu id " + args[0] + "");
        // TODO: Implement getPieMenu
        // args[0] = pieId

        return '{"name":"test1"}';
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

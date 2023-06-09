import {ipcMain} from "electron";
import * as child_process from "child_process";
import {Preferences} from "./preferences/Preferences";
import {NativeAPI} from "./nativeAPI/NativeAPI";
import {Profile} from "./preferences/Profile";
import {ActivationMode, PieMenu} from "./preferences/PieMenu";
import {GlobalHotkeyService} from "./nativeAPI/GlobalHotkeyService";
import {KeyEvent, RespondType} from "./nativeAPI/KeyEvent";

/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
export function initElectronAPI() {
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

        const fgDetail = NativeAPI.instance.getForegroundWindow()?.toJSONString();

        console.log("ipcBridge.ts: getForegroundApplication() returning " + fgDetail);

        return fgDetail ?? "";
    });
    ipcMain.handle('createProfile', (event, args) => {
        console.log("createProfile() called, creating new profile with name " + args[0] + "exePath " + args[1] + " and iconPath " + args[2] + "");
        // args[0] = profName, args[1] = exePath, args[2] = iconBase64

        const id = Date.now().toString();
        Preferences.setUserData(Profile.create(id, args[0], true, [], args[1], args[2]))

        return id;
    });
    ipcMain.handle('updateProfileName', (event, args) => {
        console.log("updateProfileName() called, updating profile name");
        // args[0] = profId, args[1] = newName

        const profile = Preferences.getProfile(args[0]);
        profile.name = args[1];

        Preferences.setUserData(profile);
        // return true if successful, false if failed
        return true;
    });
    ipcMain.handle('getProfile', (event, args: string) => {
        console.log("getProfile() called, retrieving profile info for profile id " + args[0] + "");
        // args[0] = profId


        const profile = Preferences.getProfile(args[0]).toJsonString();

        console.log("ipcBridge.ts: getProfile() returning " + profile);

        return profile;
    });
    ipcMain.handle('getProfileIds', () => {
        console.log("getProfileIds() called, retrieving profile id list");

        const ids = Preferences.getProfileIds();
        console.log("ipcBridge.ts: getProfileIds() returning [" + ids + "]");

        return ids;
    });
    ipcMain.handle('getPieMenu', (event, args) => {
        console.log("getPieMenu() called, retrieving pie menu info for pie menu id " + args[0] + "");
        // args[0] = pieId

        const pieMenu = Preferences.getPieMenu(args[0]).toJsonString()
        console.log("ipcBridge.ts: getPieMenu() returning " + pieMenu);

        return pieMenu;
    });
    ipcMain.handle('listenHotkeyForResult', () => {
        console.log("listenHotkeyForResult() called, listening for hotkey");
        // TODO: Implement listenHotkeyForResult

        return 'ctrl+shift+p';
    });
    ipcMain.handle('createPieMenuIn', (event, args) => {
        console.log("createPieMenuIn() called, creating pie menu");
        // args[0] = profId

        const pie = PieMenu.create(
            Date.now().toString(),
            "New Pie Menu",
            true,
            ActivationMode.RELEASE_ON_FUNCTION,
            '',
            -1,
            false,
            '#FFFFFF',
            []);

        Preferences.setUserData(pie);
        Preferences.addPieMenuToProfile(args[0], pie.id);

        return true;
    });
    ipcMain.handle('removePieMenuFromProfile', (event, args) => {
        console.log("removePieMenuFromProfile() called, removing pie menu from profile");
        // args[0] = profId, args[1] = pieId

        Preferences.removePieMenuFromProfile(args[0], args[1]);

        return true;
    });
    ipcMain.handle('getPieItem', (event, args) => {
        console.log("getPieItem() called, retrieving pie item info for pie item id " + args[0] + "");
        // TODO: Implement getPieItem
        // args[0] = pieItemId

        const pieItem = Preferences.getPieItem(args[0])?.toJsonString();

        console.log("ipcBridge.ts: getPieItem() returning " + pieItem);

        return pieItem;
    });
    ipcMain.handle('toggleService', (event, args) => {
        console.log("toggleService() called, the service is now " + args[0] + ". Turning it " + (!args[0] ? "on" : "off") + "");
        // args[0] = serviceActive

        if (GlobalHotkeyService.isRunning()) {
            GlobalHotkeyService.getInstance().exitProcess();
            return false;
        } else {
            GlobalHotkeyService.getInstance();
            return true;
        }
    });
    ipcMain.handle('listenKeyForResult', () => {
        return new Promise(resolve => {
            console.log("listenKeyForResult() called, listening for key");

            const listener = (event: KeyEvent) => {
                if (event.type === RespondType.KEY_DOWN
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
                        "ControlKey"].includes((event.value.split('+').pop() ?? 'PLACEHOLDER').trim())) {

                    GlobalHotkeyService.getInstance().removeTempKeyListener();
                    console.log("ipcBridge.ts: listenKeyForResult() returning " + event.value);
                    resolve(event.value);
                }
            }

            GlobalHotkeyService.getInstance().addTempKeyListener(listener);

        });

    });
    ipcMain.handle('updatePieMenu', (event, args) => {
        console.log("updatePieMenu() called, updating pie menu");
        // args[0] = JsonString of pie menu

        Preferences.setUserData(PieMenu.fromJsonString(args[0]));
    })
    ipcMain.handle('updateProfile', (event, args) => {
        console.log("updateProfile() called, updating profile");
        // args[0] = JsonString of pie menu

        Preferences.setUserData(Profile.fromJsonString(args[0]));
    })
}

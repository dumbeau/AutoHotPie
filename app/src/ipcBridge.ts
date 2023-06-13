import {ipcMain} from "electron";
import * as child_process from "child_process";
import {Preferences} from "./preferences/Preferences";
import {NativeAPI} from "./nativeAPI/NativeAPI";
import {GlobalHotkeyService} from "./nativeAPI/GlobalHotkeyService";
import {KeyEvent, RespondType} from "./nativeAPI/KeyEvent";

/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
export function initElectronAPI() {
    ipcMain.handle('openInBrowser', (event, args) => {
        console.debug("ipcBridge.ts openInBrowser(): opening " + args[0] + " in browser")
        child_process.execSync('start ' + args[0]);
    });
    ipcMain.handle('getSettings', () => {
        console.debug("ipcBridge.ts getSettings(): retrieving settings");

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
}

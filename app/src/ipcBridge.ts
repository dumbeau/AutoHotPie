import {app, ipcMain, dialog} from "electron";
import * as child_process from "child_process";
import {ahpSettings} from "./settings/AHPSettings";
import {logger, rendererLogger} from "../main";
import * as activeWindow from "active-win";
import {getGHotkeyServiceInstance, isGHotkeyServiceRunning, KeyEvent, RespondType} from "mousekeyhook.js";
import {ReadonlyWindowDetails} from "./appWindow/WindowDetails";

/**
 * Sets up IPC listeners for the main process,
 * see typings.d.ts for the list of available listeners and its documentation
 * */
export function initElectronAPI() {
  ipcMain.handle('openInBrowser', (event, args) => {
    logger.info("Opening " + args[0] + " in (default) browser");
    child_process.execSync('start ' + args[0]);
  });

  ipcMain.handle('isUpdateAvailable', async () => {
    logger.info("Checking for updates");
    logger.warn("isUpdateAvailable() is not implemented yet");
    // TODO: Implement isUpdateAvailable
    return true;
  });
  ipcMain.handle('getForegroundApplication', async () => {
    logger.info("Retrieving information about the foreground application");

    const result = activeWindow.sync();

    if (result === undefined) return "";

    const base64Icon = (await app.getFileIcon(result.owner.path)).toDataURL();

    return JSON.stringify(new ReadonlyWindowDetails(
      result.title,
      result.id,
      result.bounds,
      result.owner,
      result.memoryUsage,
      base64Icon,
    ))
  });

  ipcMain.handle('getFileIcon', (event, args) => app.getFileIcon(args[0]));

  ipcMain.handle('toggleService', (event, args) => {
    logger.info("Toggling Global Hotkey Service. Turning it " + (!args[0] ? "on" : "off") + "");
    // args[0] = serviceActive

    if (isGHotkeyServiceRunning()) {
      getGHotkeyServiceInstance().exitProcess();
      return false;
    } else {
      getGHotkeyServiceInstance();
      return true;
    }
  });
  ipcMain.handle('getVersion', () => {
    logger.info("Retrieving app version, current app version is " + app.getVersion() + "");
    return app.getVersion();
  });
  ipcMain.handle('getSetting', (event, args) => {
    // args[0] = settingKey
    const value = ahpSettings.get(args[0]);

    logger.info("Retrieving setting " + args[0] + ", value is " + value + "");

    return value;
  });
  ipcMain.handle('setSetting', (event, args) => {
    logger.info("Setting " + args[0] + " to " + args[1] + "");
    return ahpSettings.set(args[0], args[1]);
  });
  ipcMain.handle('openDialogForResult', (event, args) => {
    // args[0] = default path
    return dialog.showOpenDialogSync({defaultPath: args[0], filters: [{name: "Executables", extensions: ["exe"]}], properties: ['openFile'] })
  });
  ipcMain.handle('listenKeyForResult', (event, args) => {
    // args[0] = ignoredKeys

    return new Promise(resolve => {
      logger.info("Listening for valid hotkey once");

      const listener = (event: KeyEvent) => {
        if (event.type === RespondType.KEY_DOWN
          && !args[0].includes((event.value.split('+').pop() ?? 'PLACEHOLDER').trim())) {

          getGHotkeyServiceInstance().removeTempKeyListener();
          logger.info("Hotkey " + event.value + " is pressed");
          resolve(event.value);
        }
      }

      getGHotkeyServiceInstance().addTempKeyListener(listener);

    });

  });
}

export function initLoggerForRenderer() {
  ipcMain.handle('trace', (event, args) => rendererLogger.trace(args[0]));
  ipcMain.handle('info', (event, args) => rendererLogger.info(args[0]));
  ipcMain.handle('debug', (event, args) => rendererLogger.debug(args[0]));
  ipcMain.handle('warn', (event, args) => rendererLogger.warn(args[0]));
  ipcMain.handle('error', (event, args) => rendererLogger.error(args[0]));
  ipcMain.handle('fatal', (event, args) => rendererLogger.fatal(args[0]));
}

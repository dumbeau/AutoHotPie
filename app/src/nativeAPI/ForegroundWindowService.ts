import {spawnSync} from "child_process";
import {IForegroundWindow} from "./ForegroundWindow";
import * as fs from "fs";

export class ForegroundWindowService {
  /**
   * Get the details of the foreground window using external library GetForegroundWindow.
   *
   * @returns {IForegroundWindow} The details of the foreground window in json formatted string.
   * Available keys: "title", "exePath"
   */
  static get foregroundWindow() {
    if (!fs.existsSync('./bin/ForegroundWindow.exe')) {
      return JSON.parse(spawnSync(process.env.PORTABLE_EXECUTABLE_DIR + '/bin/ForegroundWindow.exe').stdout.toString()) as IForegroundWindow;
    } else {
      return JSON.parse(spawnSync('./bin/ForegroundWindow.exe').stdout.toString()) as IForegroundWindow;
    }
  }
}

import * as child_process from 'child_process';

/**
 * This class exposes certain native APIs.
 */
export class NativeAPI {

  /**
   * Get the details of the foreground window using external library GetForegroundWindow.
   *
   * @returns {string} The details of the foreground window in json formatted string.
   * Available keys: "title", "exePath"
   */
  static getForegroundWindowDetails(): string {
    return child_process.spawnSync('./bin/GetForegroundWindow.exe').stdout.toString();
  }
}

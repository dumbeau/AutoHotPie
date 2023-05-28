import * as child_process from 'child_process';
import {spawn} from "child_process";

export class NativeAPI {
  static getForegroundWindowDetails(): string {
    return child_process.spawnSync('./bin/GetForegroundWindow.exe').stdout.toString();
  }
}

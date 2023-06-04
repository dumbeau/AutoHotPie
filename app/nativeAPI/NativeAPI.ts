import * as child_process from 'child_process';
import {ForegroundWindow} from "./ForegroundWindow";

/**
 * This class exposes certain native APIs.
 */
export class NativeAPI {
    static get instance(): NativeAPI {
        if (NativeAPI._instance === undefined) {
            NativeAPI._instance = new NativeAPI();
        }

        return NativeAPI._instance;
    }

    private static _instance: NativeAPI | undefined = undefined;

    private constructor() {
    }

    /**
     * Get the details of the foreground window using external library GetForegroundWindow.
     *
     * @returns {string} The details of the foreground window in json formatted string.
     * Available keys: "title", "exePath"
     */
    public getForegroundWindow() {
        return ForegroundWindow.fromJsonString(
            child_process.spawnSync('./bin/GetForegroundWindow.exe').stdout.toString());
    }
}

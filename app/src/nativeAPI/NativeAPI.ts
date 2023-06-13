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

    private constructor() {}

    /**
     * Get the details of the foreground window using external library GetForegroundWindow.
     *
     * @returns {string} The details of the foreground window in json formatted string.
     * Available keys: "title", "exePath"
     */
    public getForegroundWindow() {
        // TODO: Comment out the following two lines for release build.
        console.warn('At NativeAPI.ts line.29: You HAVE to comment out this line in NativeAPI.ts for release build!');
        return ForegroundWindow.fromJsonString(child_process.spawnSync('./bin/ForegroundWindow.exe').stdout.toString());
        // return ForegroundWindow.fromJsonString(child_process.spawnSync(process.env.PORTABLE_EXECUTABLE_DIR + '/bin/ForegroundWindow.exe').stdout.toString());
    }
}

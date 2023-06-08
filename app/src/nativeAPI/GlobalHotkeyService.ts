import {ChildProcessWithoutNullStreams, spawn} from "child_process";
import {KeyEvent} from "./KeyEvent";

type HotkeyEventListener = (event: KeyEvent) => void;
type OnProcessExitListener = () => void;

/**
 * This class is used to start the Global Hotkey Service and listen to the response from it.
 * */
export class GlobalHotkeyService {

    private static instance: GlobalHotkeyService | undefined;

    // [0] is reserved for temporary listeners, which only one can be added at a time, new temporary
    // listeners will replace the old one.
    private static onHotkeyEvent: HotkeyEventListener[] = [()=>{}];
    private static onProcessExit: OnProcessExitListener | undefined

    private hotkeyService: ChildProcessWithoutNullStreams;

    private constructor() {
        this.hotkeyService = spawn(process.env.PORTABLE_EXECUTABLE_DIR +'/bin/GlobalKeyEvent.exe');

        this.hotkeyService.stdout.on("data", (data) => {

            for (const callback of GlobalHotkeyService.onHotkeyEvent) {
                const respond = KeyEvent.fromString(data.toString());
                callback(respond);
            }
        })

        this.hotkeyService.on('close', () => GlobalHotkeyService.onProcessExit?.())
    }

    static isRunning(){
        return GlobalHotkeyService.instance !== undefined;
    }

    static getInstance() {
        if (GlobalHotkeyService.instance === undefined)
            GlobalHotkeyService.instance = new GlobalHotkeyService();

        return GlobalHotkeyService.instance;
    }

    public static addKeyEventListener(listener: HotkeyEventListener, temporary: boolean = false) {
        if (temporary) {
            this.onHotkeyEvent[0] = listener;
            return this;
        }

        this.onHotkeyEvent.push(listener);
        return this;
    }

    public static removeKeyEventListener(listener: HotkeyEventListener) {
        const index = this.onHotkeyEvent.indexOf(listener);
        if (index == 0)
            this.onHotkeyEvent[0] = ()=>{};
        if (index > -1) {
            this.onHotkeyEvent.splice(index, 1);
        }
    }

    public static setOnCloseListener(listener: OnProcessExitListener) {
        this.onProcessExit = listener;
    }

    public exitProcess(){
        this.hotkeyService.kill();
        GlobalHotkeyService.instance = undefined;
    }


}

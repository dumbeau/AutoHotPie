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
    private static onHotkeyEvent: HotkeyEventListener[] = [];
    private static onProcessExit: OnProcessExitListener | undefined

    private tempListener: HotkeyEventListener | undefined;
    private hotkeyService: ChildProcessWithoutNullStreams;

    private constructor() {
        // TODO: Comment out the following line and uncomment the next line for release build.
        console.warn('At GlobalHotkeyService.ts line.23: You HAVE to comment out this line in GlobalHotkeyService.ts for release build!');
        this.hotkeyService = spawn('./bin/GlobalKeyEvent.exe');
        // this.hotkeyService = spawn(process.env.PORTABLE_EXECUTABLE_DIR +'/bin/GlobalKeyEvent.exe');

        this.hotkeyService.stdout.on("data", (data) => {

            for (const callback of GlobalHotkeyService.onHotkeyEvent) {
                const respond = KeyEvent.fromString(data.toString());
                callback(respond);
            }

            this.tempListener?.(KeyEvent.fromString(data.toString()));
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

    public static addKeyEventListener(listener: HotkeyEventListener) {
        this.onHotkeyEvent.push(listener);
        return this;
    }

    public static removeKeyEventListener(listener: HotkeyEventListener) {
        const index = this.onHotkeyEvent.indexOf(listener);
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

    addTempKeyListener(listener: (event: KeyEvent) => void) {
        this.tempListener = listener;
    }

    removeTempKeyListener() {
        this.tempListener = undefined;
    }
}

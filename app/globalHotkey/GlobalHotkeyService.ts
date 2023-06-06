import {ChildProcessWithoutNullStreams, spawn} from "child_process";
import {KeyEvent} from "./KeyEvent";

type HotkeyEventListener = (event: KeyEvent) => void;
type OnProcessExitListener = () => void;

/**
 * This class is used to start the Global Hotkey Service and listen to the response from it.
 * */
export class GlobalHotkeyService {

    private static instance: GlobalHotkeyService | undefined;
    private static onHotkeyEvent: HotkeyEventListener[] = [];
    private static onProcessExit: OnProcessExitListener | undefined

    private hotkeyService: ChildProcessWithoutNullStreams;

    private constructor() {
        this.hotkeyService = spawn(__dirname + '/../../bin/GlobalKeyEvent.exe');

        this.hotkeyService.stdout.on("data", (data) => {

            for (const callback of GlobalHotkeyService.onHotkeyEvent) {
                const respond = KeyEvent.fromString(data.toString());
                callback(respond);
            }
        })

        this.hotkeyService.on('close', () => GlobalHotkeyService.onProcessExit?.())
    }

    static get isRunning(){
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

    public static setOnCloseListener(listener: OnProcessExitListener) {
        this.onProcessExit = listener;
    }

    public exitProcess(){
        this.hotkeyService.kill();
        GlobalHotkeyService.instance = undefined;
    }


}

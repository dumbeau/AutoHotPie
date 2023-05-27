import {ChildProcessWithoutNullStreams, spawn} from "child_process";
import {HotkeyEventListener} from "./HotkeyEventListener";
import {GlobalHotkeyServiceRespond, RespondType} from "./GlobalHotkeyServiceRespond";

/**
 * This class is used to start the Global Hotkey Service and listen to the response from it.
 * */
export class GlobalHotkeyService {

  private static hotkeyService: ChildProcessWithoutNullStreams | undefined;
  private static keyEventListener : HotkeyEventListener[] = [];

  /**
   * Start the Global Hotkey Service.
   * */
  static start() {
    if (this.hotkeyService != undefined) return;

    // TODO: Change the path to the exe file, it is currently still the path for the test exe file.
    this.hotkeyService = spawn('./lib/customGlobalHotKey/AHPGlobalShortcutDetector.exe');
    this.hotkeyService.stdout.on("data", (data) => {

      for (const listener of this.keyEventListener) {
        const respond = new GlobalHotkeyServiceRespond(data);
        switch (respond.type) {
          case RespondType.KEYUP:
            listener.onKeyUp(respond.value);
            break;
          case RespondType.KEYDOWN:
            listener.onKeyDown(respond.value)
            break;
        }
      }
    })

  }

  public static addKeyEventListener(listener: HotkeyEventListener){
    this.keyEventListener.push(listener);
  }


}

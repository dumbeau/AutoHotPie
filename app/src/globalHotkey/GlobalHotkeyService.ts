import {ChildProcessWithoutNullStreams, spawn} from "child_process";
import {HotkeyEventListener} from "./HotkeyEventListener";
import {GlobalHotkeyServiceRespond, RespondType} from "./GlobalHotkeyServiceRespond";

export class GlobalHotkeyService {

  private static hotkeyService: ChildProcessWithoutNullStreams | undefined;
  private static keyEventListener : HotkeyEventListener[] = [];
  static start() {
    if (this.hotkeyService != undefined) return;

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

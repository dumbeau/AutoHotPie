import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class SendKeyAction extends Action {
  sendKey: string;
  holdTime: number;
  constructor(sendKey: string, delay = 0, repeat = 1, holdTime = 0) {
    super(ActionType.sendkey, delay, repeat);
    this.sendKey = sendKey;
    this.holdTime = holdTime;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

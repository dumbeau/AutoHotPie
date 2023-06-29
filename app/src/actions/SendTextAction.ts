import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class SendTextAction extends Action {
  sendText: string;
  holdTime: number;

  constructor(sendText: string, delay = 0, repeat = 1, holdTime = 0) {
    super(ActionType.sendtext, delay, repeat);
    this.sendText = sendText;
    this.holdTime = holdTime;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

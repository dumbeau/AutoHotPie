import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class MouseClickAction extends Action {
  holdTime: number;
  sendClick: string;
  constructor(sendClick: string, delay = 0, repeat = 1, holdTime = 0) {
    super(ActionType.mouseclick, delay, repeat);
    this.sendClick = sendClick;
    this.holdTime = holdTime;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

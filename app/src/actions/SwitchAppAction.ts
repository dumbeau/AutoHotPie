import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class SwitchAppAction extends Action {
  exePath: string;
  newWindow: boolean;
  constructor(exePath: string, newWindow: boolean, delay = 0, repeat = 1) {
    super(ActionType.switchapp, delay, repeat);
    this.exePath = exePath;
    this.delay = delay;
    this.repeat = repeat;
    this.newWindow = newWindow;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

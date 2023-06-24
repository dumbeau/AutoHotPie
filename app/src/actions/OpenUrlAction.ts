import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class OpenUrlAction extends Action {
  url: string;
  constructor(url: string, delay = 0, repeat = 1) {
    super(ActionType.openurl, delay, repeat);
    this.url = url;
    this.delay = delay;
    this.repeat = repeat;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class ResizeWindowAction extends Action {
  width: number;
  height: number;
  constructor(width = 0, height = 0, delay = 0) {
    super(ActionType.resizewindow, delay, 1);
    this.width = width;
    this.height = height;
    this.delay = delay;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

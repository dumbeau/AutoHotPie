import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class RunCommandAction extends Action {
  command: string;
  constructor(command: string, delay = 0, repeat = 1) {
    super(ActionType.command, delay, repeat);
    this.command = command;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

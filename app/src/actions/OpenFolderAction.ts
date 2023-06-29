import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class OpenFolderAction extends Action {
  folder: string;
  constructor(folder: string, delay = 0, repeat = 1) {
    super(ActionType.openfolder, delay, repeat);
    this.folder = folder;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

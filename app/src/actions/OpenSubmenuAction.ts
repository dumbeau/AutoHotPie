import {Action} from "./Action";
import {ActionType} from "./ActionType";

export class OpenSubmenuAction extends Action {
  menuId: string;
  constructor(menuId: string, delay = 0) {
    super(ActionType.submenu, delay, 1);
    this.menuId = menuId;
    this.delay = delay;
  }

  execute(): void {
    throw new Error('Method not implemented.');
  }
}

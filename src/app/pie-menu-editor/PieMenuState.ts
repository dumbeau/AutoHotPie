import {PieMenu} from '../../../app/src/userData/PieMenu';
import {PieItem} from '../../../app/src/userData/PieItem';

export class PieMenuState {
  constructor(
    public pieMenu: PieMenu,
    public pieItems: Map<number, PieItem>,
  ) {
  }
}

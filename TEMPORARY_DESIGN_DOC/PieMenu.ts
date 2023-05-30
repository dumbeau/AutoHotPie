import {PieItem1} from './PieItem';

class PieMenu1 extends PieItem1 {
  // Insert all other data members
  private children: PieItem[];
  private color: string;

  constructor(
    name: string,
    enabled: boolean,
    hotkey: string,
    color: string) {

    super(name, enabled, hotkey);
    this.color = color;

    getConfigAndCreateChildren();

    for (const child of children) {
      child.onComplete() = this.onSubmenuClosed;
    }
  }

  onSubmenuClosed() {
    openThisMenu();
  }
}

import {PieMenu} from '../../../../app/src/userData/PieMenu';
import {PieItem} from '../../../../app/src/userData/PieItem';
import {Action} from '../../../../app/src/actions/Action';
// singleton
export class PieMenuStateManager {
  private static manager: PieMenuStateManager;

  // aka the tab index that is currently selected
  public activePieMenuStateId = 0;

  private readonly pieMenuStates: PieMenuState[] = [];

  private constructor() {
  }

  static get instance(): PieMenuStateManager {
    if (this.manager === undefined) {
      this.manager = new PieMenuStateManager();
    }

    return this.manager;
  }

  public get activePieMenuState(): PieMenuState {
    if (this.pieMenuStates.length === 0) {
      throw new Error('No pie menu states exist');
    }
    return this.pieMenuStates[this.activePieMenuStateId];
  }

  public get readonlyPieMenuStates(): ReadonlyArray<PieMenuState> {
    return this.pieMenuStates;
  }

  public clearPieMenuStates() {
    this.pieMenuStates.splice(0, this.pieMenuStates.length);
  }

  public addPieMenuState(pieMenuState: PieMenuState) {
    if (this.pieMenuStates.find((state) => state.pieMenu.id === pieMenuState.pieMenu.id)) {
      window.log.warn('Pie menu state already exists');
      return;
    }

    this.pieMenuStates.push(pieMenuState);
  }

}

export class PieMenuState {
  constructor(
    public pieMenu: PieMenu,
    public pieItems: Map<number, PieItem>,
  ) {
  }

  public getPieItemActions(id: number): Action[] {
    return this.pieItems.get(id)?.actions ?? [];
  }

  public setPieItemActions(id: number, actions: Action[]) {
    if (this.pieItems.get(id) === undefined) {
      return;
    }

    // this.pieItems.get(id)?.actions must not be undefined
    // eslint-disable-next-line  @typescript-eslint/no-non-null-assertion
    this.pieItems.get(id)!.actions = actions;
  }
}

import {Component, Input, OnInit} from '@angular/core';
import {PieMenuState, PieMenuStateManager} from '../state/PieMenuState';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';

@Component({
  selector: 'app-work-area-component',
  templateUrl: './work-area.component.html',
  styleUrls: ['./work-area.component.scss']
})
export class WorkAreaComponent implements OnInit {
  pieMenuState: PieMenuState = PieMenuStateManager.instance.activePieMenuState;
  selectedPieItemId: number | undefined;

  ngOnInit(): void {
    window.log.debug('Pie menu state: ' + JSON.stringify(this.pieMenuState));

    this.selectedPieItemId = this.pieMenuState.pieMenu.pieItems[0];
  }

  moveUp(i: number) {
    if (!this.isStateOperable()) { return; }

    const actions = this.pieMenuState.getPieItemActions(this.selectedPieItemId ?? -1);
    if (i > 0) {
      const temp = actions[i - 1];
      actions[i - 1] = actions[i];
      actions[i] = temp;
    }

    this.pieMenuState.setPieItemActions(this.selectedPieItemId ?? -1, actions);
  }

  moveDown(i: number) {
    if (!this.isStateOperable()) { return; }

    const actions = this.pieMenuState.getPieItemActions(this.selectedPieItemId ?? -1);

    if (i < actions.length - 1) {
      const temp = actions[i + 1];
      actions[i + 1] = actions[i];
      actions[i] = temp;
    }

    this.pieMenuState.setPieItemActions(this.selectedPieItemId ?? -1, actions);
  }

  deleteAction(i: number) {
    if (!this.isStateOperable()) { return; }

    if (this.pieMenuState.getPieItemActions(this.selectedPieItemId ?? -1).length ?? 0 > 0) {
      this.pieMenuState.getPieItemActions(this.selectedPieItemId ?? -1).splice(i, 1);
    }
  }

  addAction() {
    if (!this.isStateOperable()) { return; }

    this.pieMenuState.getPieItemActions(this.selectedPieItemId ?? -1).push(new SendKeyAction(''));
  }

  isStateOperable(): boolean{
    if (this.selectedPieItemId === undefined || this.pieMenuState.pieItems.get(this.selectedPieItemId) === undefined) {
      window.log.error('Either selectedPieItemId or pieMenuState.pieItems is undefined');
      window.log.error('selectedPieItemId: ' + this.selectedPieItemId);
      window.log.error('pieMenuState.pieItems: ' + this.pieMenuState.pieItems);
      return false;
    }
    if (this.pieMenuState.pieItems.get(this.selectedPieItemId) === undefined) {
      window.log.error(`Pie menu state for pie item ${this.selectedPieItemId} is undefined`);

      return false;
    }

    return true;
  }
}

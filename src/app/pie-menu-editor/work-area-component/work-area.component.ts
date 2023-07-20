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

  actions: Action[] = [];

  ngOnInit(): void {
    window.log.debug('Pie menu state: ' + JSON.stringify(this.pieMenuState));

    this.selectedPieItemId = this.pieMenuState?.pieMenu.pieItems[0];
    this.actions = this.pieMenuState?.pieItems.get(this.selectedPieItemId ?? -1)?.actions ?? [];
  }

  moveUp(i: number) {
    if (i > 0) {
      const temp = this.actions[i - 1];
      this.actions[i - 1] = this.actions[i];
      this.actions[i] = temp;
    }
  }

  moveDown(i: number) {

    if (i < this.actions.length - 1) {
      const temp = this.actions[i + 1];
      this.actions[i + 1] = this.actions[i];
      this.actions[i] = temp;
    }
  }

  deleteAction(i: number) {
    this.actions = this.actions.filter((value, index) => index !== i);
  }

  addAction() {
    if (this.selectedPieItemId === undefined || this.pieMenuState?.pieItems.get(this.selectedPieItemId) === undefined) {
      window.log.error('Either selectedPieItemId or pieMenuState.pieItems is undefined');
      window.log.error('selectedPieItemId: ' + this.selectedPieItemId);
      window.log.error('pieMenuState.pieItems: ' + this.pieMenuState?.pieItems);
      return;
    }

    // @ts-ignore
    this.pieMenuState.pieItems.get(this.selectedPieItemId).actions.push(new SendKeyAction(''));
  }
}

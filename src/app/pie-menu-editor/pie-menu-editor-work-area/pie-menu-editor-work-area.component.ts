import {Component, Input, OnInit} from '@angular/core';
import {PieMenuState} from '../PieMenuState';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';

@Component({
  selector: 'app-pie-menu-editor-work-area',
  templateUrl: './pie-menu-editor-work-area.component.html',
  styleUrls: ['./pie-menu-editor-work-area.component.scss']
})
export class PieMenuEditorWorkAreaComponent implements OnInit {
  @Input() pieMenuState: PieMenuState | undefined;
  selectedPieItemId: number | undefined;

  actions: Action[] = [];

  ngOnInit(): void {
    window.log.debug('Pie menu state: ' + JSON.stringify(this.pieMenuState));
    this.selectedPieItemId = this.pieMenuState?.pieMenu.pieItems[0];
    this.actions = this.pieMenuState?.pieItems.get(this.selectedPieItemId ?? -1)?.actions ?? [];
  }

  moveUp(i: number) {
    // if (this.pieMenuState?.pieItems === undefined) {
    //   return;
    // }
    //
    // if (i > 0) {
    //   const temp = this.pieMenuState.selectedPieItem.actions[i - 1];
    //   this.pieMenuState.selectedPieItem.actions[i - 1] = this.pieMenuState.selectedPieItem.actions[i];
    //   this.pieMenuState.selectedPieItem.actions[i] = temp;
    // }
  }

  moveDown(i: number) {
    // if (this.pieMenuState?.selectedPieItem === undefined) {
    //   return;
    // }
    //
    // if (i < this.pieMenuState.selectedPieItem.actions.length - 1) {
    //   const temp = this.pieMenuState.selectedPieItem.actions[i + 1];
    //   this.pieMenuState.selectedPieItem.actions[i + 1] = this.pieMenuState.selectedPieItem.actions[i];
    //   this.pieMenuState.selectedPieItem.actions[i] = temp;
    // }
  }

  deleteAction(i: number) {
    // if (this.pieMenuState?.selectedPieItem === undefined) {
    //   return;
    // }
    //
    // this.pieMenuState.selectedPieItem.actions = this.pieMenuState.selectedPieItem.actions.filter((value, index) => index !== i);
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

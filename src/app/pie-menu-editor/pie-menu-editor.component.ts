import {Component, Input, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {PieMenu, PieMenuActivationMode} from '../../../app/src/userData/PieMenu';
import {PieItem} from '../../../app/src/userData/PieItem';
import {Action} from '../../../app/src/actions/Action';
import {SendKeyAction} from '../../../app/src/actions/SendKeyAction';

@Component({
  selector: 'app-pie-menu-editor',
  templateUrl: './pie-menu-editor.component.html',
  styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent implements OnInit {
  @Input() pieMenuId: string;

  // Using map so that we can have multiple editor tabs opened at the same time.
  openedPieMenus: Map<number, PieMenu> = new Map<number, PieMenu>();

  // pieItems is (kind of) independent of pieMenus. It is used to cache the pieItems
  // for all opened pieMenus.
  pieItems: Map<number, PieItem> = new Map<number, PieItem>();

  actions: Action[] = [
    new SendKeyAction('a')];

  constructor(private activatedRoute: ActivatedRoute) {
    // TODO: REPLACE following hardcoded pieMenus with real data from database.
    this.openedPieMenus.set(1, new PieMenu(
      'Test',
      true, PieMenuActivationMode.HOVER_OVER_THEN_RELEASE,
      'string',
      0,
      false,
      'string',
      [], 1));
    this.openedPieMenus.set(2, new PieMenu(
      'Test2',
      true, PieMenuActivationMode.HOVER_OVER_THEN_RELEASE,
      'string',
      0,
      false,
      'string',
      [], 2));
    this.pieMenuId = this.activatedRoute.snapshot.paramMap.get('pieMenuId') ?? '';
    console.log('PieMenuEditorComponent constructor called. pieMenuId: ' + this.pieMenuId);
  }

  ngOnInit(): void {
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
    this.actions.push(new SendKeyAction(''));
  }
}

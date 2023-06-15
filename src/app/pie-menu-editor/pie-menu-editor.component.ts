import {Component, Input, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {Action, ActionType} from '../../../app/src/preferences/AHPDB';

@Component({
  selector: 'app-pie-menu-editor',
  templateUrl: './pie-menu-editor.component.html',
  styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent implements OnInit {
  @Input() pieMenuId: string;
  actions: Action[] = [
    {type: ActionType.sendkey},
    {type: ActionType.sendtext},
    {type: ActionType.mouseclick},
    {type: ActionType.command},
    {type: ActionType.openfolder},
    {type: ActionType.submenu},
    {type: ActionType.resizewindow},
    {type: ActionType.movewindow},
    {type: ActionType.openurl},
    {type: ActionType.switchapp}];

  constructor(private activatedRoute: ActivatedRoute) {
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
}

import {Component, Input, OnInit} from '@angular/core';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';
import {ActionType} from '../../../../app/src/actions/ActionType';

@Component({
  selector: 'app-action-card',
  templateUrl: './action-card.component.html',
  styleUrls: ['./action-card.component.scss']
})
export class ActionCardComponent implements OnInit {
  @Input() action: Action = new SendKeyAction('a');
  actionList: number[] = [];

  protected readonly actionType = ActionType;

  ngOnInit(): void {
    window.electronAPI.getActionList().then((actionList: number[]) => {
      this.actionList = actionList;
    });
  }
}

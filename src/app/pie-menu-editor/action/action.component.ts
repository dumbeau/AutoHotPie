import {Component, Input} from '@angular/core';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';
import {ActionType} from '../../../../app/src/actions/ActionType';

@Component({
  selector: 'app-action',
  templateUrl: './action.component.html',
  styleUrls: ['./action.component.scss']
})
export class ActionComponent {
  @Input() action: Action = new SendKeyAction('a');

  protected readonly actionType = ActionType;
}

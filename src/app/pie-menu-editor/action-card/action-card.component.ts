import {Component, Input} from '@angular/core';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';
import {ActionType} from '../../../../app/src/actions/ActionType';

@Component({
  selector: 'app-action-card',
  templateUrl: './action-card.component.html',
  styleUrls: ['./action-card.component.scss']
})
export class ActionCardComponent {
  @Input() action: Action = new SendKeyAction('a');

  protected readonly actionType = ActionType;
}

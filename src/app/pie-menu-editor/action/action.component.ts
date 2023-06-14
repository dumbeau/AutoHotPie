import {Component, Input} from '@angular/core';
import {Action, ActionType} from '../../../../app/src/preferences/AHPDB';

@Component({
  selector: 'app-action',
  templateUrl: './action.component.html',
  styleUrls: ['./action.component.scss']
})
export class ActionComponent {
  @Input() action: Action = {type: ActionType.sendkey};

  protected readonly ActionType = ActionType;
}

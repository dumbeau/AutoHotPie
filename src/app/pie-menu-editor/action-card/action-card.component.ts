import {Component, Input, OnInit} from '@angular/core';
import {SendKeyAction} from '../../../../app/src/actions/SendKeyAction';
import {Action} from '../../../../app/src/actions/Action';
import {ActionType} from '../../../../app/src/actions/ActionType';
import {PluginProperties} from 'autohotpie-core';

@Component({
  selector: 'app-action-card',
  templateUrl: './action-card.component.html',
  styleUrls: ['./action-card.component.scss']
})
export class ActionCardComponent implements OnInit {
  @Input() action: Action = new SendKeyAction('a');
  pluginPropertyList: PluginProperties[] = [];
  selectedPluginPropertyIndex = -1;

  protected readonly actionType = ActionType;

  ngOnInit(): void {
    window.electronAPI.getDetailedActionList().then((pluginPropertyList: string[]) => {
      this.pluginPropertyList = pluginPropertyList.map((pluginProperty: string) => JSON.parse(pluginProperty) as PluginProperties);

      window.log.info(JSON.stringify(this.pluginPropertyList[0].parameters));
    });
  }
}

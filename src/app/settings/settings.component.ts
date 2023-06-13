import {ChangeDetectionStrategy, ChangeDetectorRef, Component, ViewChild} from '@angular/core';
import {Settings} from '../../../app/src/preferences/Settings';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush

})
export class SettingsComponent {
  @ViewChild('settingList') settingList: any;

  settings: Promise<Record<string, any>[]> = window.electronAPI.getSettings();
  displaySettingPage = true;

  constructor(private cd: ChangeDetectorRef) {
  }
  updateSingleSelectGroupValue(value: any): void {
    this.displaySettingPage = value[0] === 'settings';
    console.log('Select group value changed to: ' + value);
  }


}

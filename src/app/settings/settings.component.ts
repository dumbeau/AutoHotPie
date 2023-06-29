import {Component, OnInit, ViewChild} from '@angular/core';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],

})
export class SettingsComponent implements OnInit {
  @ViewChild('settingList') settingList: any;

  displaySettingPage = true;
  runOnAppQuit = false;

  ngOnInit() {
    this.runOnAppQuit = window.electronAPI.getSetting('runOnAppQuit');
  }

  updateSingleSelectGroupValue(value: any): void {
    this.displaySettingPage = value[0] === 'settings';
    console.log('Select group value changed to: ' + value);
  }


  setRunOnAppQuit($event: boolean) {
    this.runOnAppQuit = $event;
    window.electronAPI.setSetting('runOnAppQuit', $event);
  }
}

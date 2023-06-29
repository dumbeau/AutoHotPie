import {Component, OnInit, ViewChild} from '@angular/core';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],

})
export class SettingsComponent implements OnInit {
  @ViewChild('settingList') settingList: any;

  runOnAppQuit = false;
  runOnStartup = false;
  pieMenuCancelKey = '';

  ngOnInit() {
    window.electronAPI.getSetting('runOnAppQuit').then((value) => {
      this.runOnAppQuit = value;

      window.log.info('Retrieved runOnAppQuit from settings: ' + this.runOnAppQuit);
    });

    window.electronAPI.getSetting('runOnStartup').then((value) => {
      this.runOnStartup = value;

      window.log.info('Retrieved runOnStartup from settings: ' + this.runOnStartup);
    });

    window.electronAPI.getSetting('pieMenuCancelKey').then((value) => {
      this.pieMenuCancelKey = value;

      window.log.info('Retrieved pieMenuCancelKey from settings: ' + this.pieMenuCancelKey);
    });
  }

  setRunOnAppQuit($event: boolean) {
    this.runOnAppQuit = $event;
    window.electronAPI.setSetting('runOnAppQuit', $event);
  }

  setRunOnStartup($event: boolean) {
    this.runOnStartup = $event;
    window.electronAPI.setSetting('runOnStartup', $event);
  }

  setPieMenuCancelKey($event: string) {
    // TODO: This should not use the normal shortcut input component, it should detect only one key
    this.pieMenuCancelKey = $event;
    window.electronAPI.setSetting('pieMenuCancelKey', $event);
  }
}

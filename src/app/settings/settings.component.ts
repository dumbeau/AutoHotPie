import {ChangeDetectionStrategy, ChangeDetectorRef, Component} from '@angular/core';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush

})
export class SettingsComponent {
  settings: Record<string, any>[] = [{}];
  singleSelectGroupValue = [];

  constructor(private cd: ChangeDetectorRef) {
    this.initSettingValues();
  }
  updateSingleSelectGroupValue(value: any): void {
    this.singleSelectGroupValue = value;
    this.cd.markForCheck();
  }

  async initSettingValues() {
    // @ts-ignore
    const settingsHandler: Array<Record<string, any>> = await window.electronAPI.getSettings();

    console.log('Loading settings: ', settingsHandler);
  }
}

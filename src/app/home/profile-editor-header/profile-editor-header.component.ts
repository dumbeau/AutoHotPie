import {Component, EventEmitter, Input, Output} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {ProfileUpdateListener} from '../../../helpers/ProfileUpdateListener';

@Component({
  selector: 'app-profile-editor-header',
  templateUrl: './profile-editor-header.component.html',
  styleUrls: ['./profile-editor-header.component.scss']
})
export class ProfileEditorHeaderComponent implements ProfileUpdateListener {
  @Input() profId = 0;
  @Output() settingsClicked = new EventEmitter();

  profName = 'Default Profile';

  constructor() {
    if (this.profId){
      this.profName = Profile.getProfileName(this.profId);
    }
  }

  onProfileNameChanged(newName: string): void {
    this.profName = newName;
    console.log('Profile name changes detected in ProfileEditorHeaderComponent, new name is ' + newName + '.');
  }
}

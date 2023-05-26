import {Component, Input} from '@angular/core';
import {ProfileUtils} from '../../../lib/ProfileUtils';
import {ProfileUpdateListener} from '../../../lib/ProfileUpdateListener';

@Component({
  selector: 'app-profile-editor-header',
  templateUrl: './profile-editor-header.component.html',
  styleUrls: ['./profile-editor-header.component.scss']
})
export class ProfileEditorHeaderComponent implements ProfileUpdateListener {
  @Input() profId = 0;

  profName = 'Default Profile';

  constructor() {
    if (this.profId){
      this.profName = ProfileUtils.getProfileName(this.profId);
    }
  }

  onProfileNameChanged(newName: string): void {
    this.profName = newName;
    console.log('Profile name changes detected in ProfileEditorHeaderComponent, new name is ' + newName + '.');
  }
}

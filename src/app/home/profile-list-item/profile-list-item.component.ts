import {Component, ElementRef, Input, ViewChild} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {ProfileUpdateListener} from '../../../helpers/ProfileUpdateListener';

@Component({
  selector: 'app-profile-list-item',
  templateUrl: './profile-list-item.component.html',
  styleUrls: ['./profile-list-item.component.scss']
})

export class ProfileListItemComponent {
  @Input() profId = 0;
  @ViewChild('profNameInput') profNameInput: any;

  inputDisabled = true;
  profName = 'Default Profile';
  profUpdateListener: ProfileUpdateListener | undefined;

  constructor() {
    if (this.profId){
      this.profName = Profile.getProfileName(this.profId);
    }
  }

  setProfileUpdateListener(listener: ProfileUpdateListener) {
    this.profUpdateListener = listener;
  }

  startEditing() {
    this.inputDisabled = false;
    this.profNameInput.nativeElement.focus();
  }

  completeEditing() {
    this.inputDisabled = true;

    this.profName = this.profNameInput.nativeElement.value;
    Profile.updateProfName(this.profId, this.profName);

    if (this.profUpdateListener !== undefined){
      this.profUpdateListener.onProfileNameChanged(this.profName);
      console.log('Profile name changed to ' + this.profName + ', calling onProfileNameChanged() on listener');
    }
  }

}

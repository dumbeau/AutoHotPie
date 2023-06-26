import {Component, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {db} from '../../../../app/src/userData/AHPDatabase';
import {Profile} from '../../../../app/src/userData/Profile';

@Component({
  selector: 'app-profile-list-item',
  templateUrl: './profile-list-item.component.html',
  styleUrls: ['./profile-list-item.component.scss']
})

export class ProfileListItemComponent {
  @Input() profile: Profile = new Profile('', '');
  @Input() selectedProfileId = 0;
  @Output() profileSelected = new EventEmitter<number>();
  @Output() profileUpdated = new EventEmitter();

  @ViewChild('profNameInput') profNameInput: any;
  @ViewChild('editButton') editButton: any;

  inputDisabled = true;

  selectProfile() {
    this.profileSelected.emit(this.profile.id);
  }

  startEditing() {
    this.inputDisabled = !this.inputDisabled;
  }

  completeEditing() {
    this.inputDisabled = true;

    db.profile.update(this.profile.id ?? 0, {name: this.profNameInput.nativeElement.value}).then(() => {
      this.profile.name = this.profNameInput.nativeElement.value;
      console.log('ProfileListItemComponent completeEditing(): Profile name updated');
    });
  }

}

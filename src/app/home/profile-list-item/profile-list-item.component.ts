import {Component, EventEmitter, Input, OnInit, Output, ViewChild} from '@angular/core';
import {Profile} from '../../../../app/src/preferences/Profile';

@Component({
    selector: 'app-profile-list-item',
    templateUrl: './profile-list-item.component.html',
    styleUrls: ['./profile-list-item.component.scss']
})

export class ProfileListItemComponent implements OnInit {
    @Input() profId = '0';
    @Input() selectedProfileId = '';
    @Output() profileSelected = new EventEmitter<string>();
    @Output() profileUpdated = new EventEmitter();

    @ViewChild('profNameInput') profNameInput: any;
    @ViewChild('editButton') editButton: any;

    inputDisabled = true;
    prof = new Profile();

    selectProfile() {
        this.profileSelected.emit(this.prof.id);
    }

    startEditing() {
        this.inputDisabled = !this.inputDisabled;
    }

    completeEditing() {
        this.inputDisabled = true;

        window.electronAPI.updateProfileName(this.prof.id, this.profNameInput.nativeElement.value)
            .then((success: boolean) => {
                if (success) {
                    this.prof.name = this.profNameInput.nativeElement.value;
                    this.profileUpdated.emit();
                } else {
                    console.log('Failed to update profile name');
                }
            });
    }

    ngOnInit(): void {
        console.log('Requesting profile with id ' + this.profId);

        window.electronAPI.getProfile(this.profId).then((profJson: string) => {

            this.prof = Profile.fromJsonString(profJson);
        });
    }

}

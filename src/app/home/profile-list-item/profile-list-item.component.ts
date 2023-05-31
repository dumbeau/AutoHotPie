import {AfterViewInit, Component, ElementRef, Input, OnInit, ViewChild} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {ProfileUpdateListener} from '../../../helpers/ProfileUpdateListener';

@Component({
    selector: 'app-profile-list-item',
    templateUrl: './profile-list-item.component.html',
    styleUrls: ['./profile-list-item.component.scss']
})

export class ProfileListItemComponent implements OnInit {
    @Input() profId = '0';
    @ViewChild('profNameInput') profNameInput: any;
    @ViewChild('editButton') editButton: any;

    inputDisabled = true;
    prof = new Profile();
    profUpdateListener: ProfileUpdateListener | undefined;

    setProfileUpdateListener(listener: ProfileUpdateListener) {
        this.profUpdateListener = listener;
    }

    startEditing() {
        this.inputDisabled = !this.inputDisabled;
    }

    completeEditing() {
        this.inputDisabled = true;


        // this.profName = this.profNameInput.nativeElement.value;
        // Profile.updateProfName(this.profId, this.profName);
        //
        // if (this.profUpdateListener !== undefined){
        //   this.profUpdateListener.onProfileNameChanged(this.profName);
        //   console.log('Profile name changed to ' + this.profName + ', calling onProfileNameChanged() on listener');
        // }
    }

    ngOnInit(): void {
        console.log('Requesting profile with id ' + this.profId);

        window.electronAPI.getProfile(this.profId).then((profJson: string) => {
            this.prof = Profile.fromJsonString(profJson);
        });
    }

}

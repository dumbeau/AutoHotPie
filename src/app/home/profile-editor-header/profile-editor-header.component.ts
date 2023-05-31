import {Component, EventEmitter, Input, Output} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {ProfileUpdateListener} from '../../../helpers/ProfileUpdateListener';
import {PieMenu} from "../../../helpers/PieMenu";

@Component({
    selector: 'app-profile-editor-header',
    templateUrl: './profile-editor-header.component.html',
    styleUrls: ['./profile-editor-header.component.scss']
})
export class ProfileEditorHeaderComponent implements ProfileUpdateListener {
    @Input() profId = '0';
    @Output() settingsClicked = new EventEmitter();

    profile = new Profile();

    constructor() {
        if (this.profId) {
            window.electronAPI.getProfile(this.profId).then((profJson: string) => {
                this.profile = Profile.fromJsonString(profJson);
            });
        }
    }

    onProfileNameChanged(newName: string): void {
        this.profile.name = newName;
        console.log('Profile name changes detected in ProfileEditorHeaderComponent, new name is ' + newName + '.');
    }
}

import {Component, Input, OnChanges, SimpleChanges} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {ActivationMode} from '../../../helpers/PieMenu';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent implements OnChanges {
    @Input() profId = '0';

    profSettingsRevealed = false;
    profile = new Profile();
    color: any;

    ngOnChanges(changes: SimpleChanges): void {
        this.updateProfile(this.profId);
    }

    updateProfile(profId: string): void {
        window.electronAPI.getProfile(profId).then((prof) => {
            console.log('ProfileEditorComponent: got profile: ' + prof);
            this.profile = Profile.fromJsonString(prof);
        });
    }


    deletePieMenu($event: any) {
        window.electronAPI.removePieMenuFromProfile(this.profId, $event).then((success) => {
            if (success) {
                this.updateProfile(this.profId);
                console.log('ProfileEditorComponent: successfully removed pie menu from profile');
            }
        });
    }

    addPieMenu() {
        window.electronAPI.createPieMenu(
            'New Pie Menu',
            '',
            ActivationMode.RELEASE_ON_FUNCTION,
            '', this.profId)
            .then(_ => this.updateProfile(this.profId));
    }
}

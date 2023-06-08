import {Component, Input, OnChanges, SimpleChanges} from '@angular/core';
import {Profile} from '../../../../app/preferences/Profile';
import {ActivationMode} from '../../../../app/preferences/PieMenu';

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
        this.refreshProfileView(this.profId);
    }

    refreshProfileView(profId: string): void {
        window.electronAPI.getProfile(profId).then((prof) => {
            console.log('ProfileEditorComponent: got profile: ' + prof);
            this.profile = Profile.fromJsonString(prof);
        });
    }

    addPieMenu() {
        window.electronAPI.createPieMenuIn(this.profId)
            .then(_ => this.refreshProfileView(this.profId));
    }

    removePieMenuFromProf(event: string) {
        window.electronAPI.removePieMenuFromProfile(this.profId, event).then(
            () => {this.refreshProfileView(this.profId);});
    }
}

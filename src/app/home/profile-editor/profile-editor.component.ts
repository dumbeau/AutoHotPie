import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent {
    @Input() profId = '0';
    profSettingsRevealed = false;


}

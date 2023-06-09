import {Component, Input, OnChanges, SimpleChanges} from '@angular/core';
import {db, Profile} from '../../../../app/src/preferences/AHPDB';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent {
  @Input() profile: Profile = {id: 0, enabled: false, exePath: '', iconBase64: '', name: '', pieMenus: []};

  profSettingsRevealed = false;

  color: any;

  addPieMenu() {
    this.profSettingsRevealed = false;

    db.pieMenu.add({
      activationMode: '',
      escapeRadius: 0,
      hotkey: '',
      name: 'New Pie Menu',
      openInScreenCenter: false,
      pieItems: [],
      selectionColor: '',
      enabled: true})
      .then((pieMenuId) => {
        db.profile.update(this.profile, {pieMenus: [...this.profile.pieMenus, pieMenuId]});
    });

    console.log('ProfileEditorComponent.addPieMenu(): this.profile.pieMenus = ' + this.profile.pieMenus);
  }

  removePieMenuFromProf(event: number) {
    console.log('ProfileEditorComponent.removePieMenuFromProf(): event = ' + event);
    db.profile.update(
      this.profile.id ?? 0,
      {pieMenus: this.profile.pieMenus.filter((pieMenuId) => pieMenuId !== event)})
      .then(() => { this.profile.pieMenus = this.profile.pieMenus.filter((pieMenuId) => pieMenuId !== event); });
  }

  updateProfile() {
    db.profile.update(this.profile.id ?? 0, this.profile);

    console.log('ProfileEditorComponent.updateProfile(): this.profile = ' + this.profile);
  }
}

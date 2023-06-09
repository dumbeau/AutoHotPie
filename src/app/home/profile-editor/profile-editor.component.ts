import {Component, Input, OnChanges, SimpleChanges} from '@angular/core';
import {db, Profile} from '../../../../app/src/preferences/AHPDB';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent implements OnChanges {
  @Input() profile: Profile = {id: 0, enabled: false, exePath: '', iconBase64: '', name: '', pieMenus: []};

  profSettingsRevealed = false;

  color: any;

  ngOnChanges(changes: SimpleChanges): void {
    // this.refreshProfileView(this.profId);
  }

  refreshProfileView(profId: number): void {
    db.profile.get(profId).then((prof) => {
      if (prof === undefined) {
        console.log('ProfileEditorComponent refreshProfileView(): profile not found');
        return;
      }

      console.log('ProfileEditorComponent refreshProfileView(): ' + prof);
      this.profile = prof;
    });
  }

  addPieMenu() {
    this.profSettingsRevealed = false;

    db.pieMenu.add({
      activationMode: '',
      escapeRadius: 0,
      hotkey: '',
      name: '',
      openInScreenCenter: false,
      pieItems: [],
      selectionColor: '',
      enabled: false})
      .then((pieMenuId) => {
        db.profile.update(this.profile, {pieMenus: [...this.profile.pieMenus, pieMenuId]})
          .then(() => { this.profile.pieMenus.push(pieMenuId as number); });
    });
  }

  removePieMenuFromProf(event: number) {
    db.profile.update(
      this.profile.id ?? 0,
      {pieMenus: this.profile.pieMenus.filter((pieMenuId) => pieMenuId !== event)})
      .then(() => { this.profile.pieMenus = this.profile.pieMenus.filter((pieMenuId) => pieMenuId !== event); });
  }

  updateProfile() {
    // window.electronAPI.updateProfile(this.profile.toJsonString());
  }
}

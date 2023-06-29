import {Component, Input, TemplateRef} from '@angular/core';
import {db} from '../../../../app/src/userData/AHPDatabase';
import {NbDialogService, NbPosition} from '@nebular/theme';
import {Profile} from '../../../../app/src/userData/Profile';
import {PieMenu} from '../../../../app/src/userData/PieMenu';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.scss']
})
export class ProfileEditorComponent {
  @Input() profile: Profile = new Profile('');

  profSettingsRevealed = false;

  color: any;

  protected readonly nbPosition = NbPosition;

  constructor(private dialogService: NbDialogService) {
  }

  newPieMenu() {
    this.profSettingsRevealed = false;

    db.pieMenu.add(new PieMenu())
      .then((pieMenuId) => {
        this.addPieMenu(pieMenuId as number);
      });

    console.log('ProfileEditorComponent.addPieMenu(): this.profile.pieMenus = ' + this.profile.pieMenus);
  }

  onPieMenuChanged(event: { remove: number | undefined; add: number | undefined }) {
    // Force update if no change
    // Gosh this has caused me like 3 hours of debugging :smiley_face::smiley_face::smiley_face::smiley_face:
    // and I finally know that when event is going to be undefined if both remove and add is undefined
    // because they're not passed in the event
    if (event === undefined) {
      this.profile.pieMenus = [...this.profile.pieMenus];

      console.log('ProfileEditorComponent.removePieMenuFromProf(): Forcing update');

      return;
    }

    console.log('ProfileEditorComponent.removePieMenuFromProf(): event = ' + event);

    let newPieMenuList = this.profile.pieMenus;
    if (event.remove !== undefined) {
      newPieMenuList = newPieMenuList.filter((pieMenuId) => pieMenuId !== event.remove);
    }
    if (event.add !== undefined) {
      newPieMenuList = [...newPieMenuList, event.add];
    }

    if (event.remove !== undefined || event.add !== undefined) {
      db.profile.update(
        this.profile.id ?? 0,
        {pieMenus: newPieMenuList})
        .then(() => {
          this.profile.pieMenus = newPieMenuList;
        });
    }
  }

  updateProfile() {
    db.profile.update(this.profile.id ?? 0, this.profile);

    console.log('ProfileEditorComponent.updateProfile(): this.profile = ' + this.profile);
  }

  openPieMenuSelector(pieMenuSelectorDialog: TemplateRef<any>) {
    this.dialogService.open(pieMenuSelectorDialog, {
      context: db.pieMenu.where('id').noneOf(this.profile.pieMenus).toArray(),
    });
  }

  addPieMenu(id: number) {
    if (this.profile.pieMenus.includes(id)) {
      return;
    }
    db.profile.update(this.profile, {pieMenus: [...this.profile.pieMenus, id]});
  }
}


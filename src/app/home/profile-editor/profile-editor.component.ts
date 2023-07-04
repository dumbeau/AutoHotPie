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

        window.log.info('Created new pie menu, the id is ' + pieMenuId);
      });

  }

  onPieMenuChanged(event: { remove: number | undefined; add: number | undefined }) {
    // Force update if no change
    // Gosh this has caused me like 3 hours of debugging :smiley_face::smiley_face::smiley_face::smiley_face:
    // and I finally know that when event is going to be undefined if both remove and add is undefined
    // because they're not passed in the event
    if (event === undefined) {
      this.profile.pieMenus = [...this.profile.pieMenus];

      return;
    }

    let newPieMenuList = this.profile.pieMenus;
    if (event.remove !== undefined) {
      newPieMenuList = newPieMenuList.filter((pieMenuId) => pieMenuId !== event.remove);
      window.log.info('Removed pie menu ' + event.remove + ' from profile ' + this.profile.id);
    }
    if (event.add !== undefined) {
      newPieMenuList = [...newPieMenuList, event.add];
      window.log.info('Added pie menu ' + event.add + ' to profile ' + this.profile.id);
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

    window.log.info('Updated profile ' + this.profile.id + ' (name: ' + this.profile.name + ')');
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

  async addMissingExeClicked() {
    window.log.info('Waiting for user to select exe');
    const path: string = await window.electronAPI.openDialogForResult(this.profile.exes[0]);

    window.log.info('User selected exe ' + path);

    db.profile.update(this.profile, {exes: [...this.profile.exes, path]});

  }

  removeExecutableVersion($event: string) {
    db.profile.update(this.profile, {exes: this.profile.exes.filter((exe) => exe !== $event)});
  }
}


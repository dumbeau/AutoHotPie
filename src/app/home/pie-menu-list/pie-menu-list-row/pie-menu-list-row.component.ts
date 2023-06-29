import {Component, EventEmitter, Input, OnInit, Output, TemplateRef, ViewChild} from '@angular/core';
import {NbDialogService, NbPosition} from '@nebular/theme';
import {db} from '../../../../../app/src/userData/AHPDatabase';
import {PieMenu} from '../../../../../app/src/userData/PieMenu';

@Component({
  selector: 'app-pie-menu-list-row',
  templateUrl: './pie-menu-list-row.component.html',
  styleUrls: ['./pie-menu-list-row.component.scss']
})
export class PieMenuListRowComponent implements OnInit {
  @Input() pieMenu: PieMenu = new PieMenu();
  @Output() pieMenuChange = new EventEmitter<{ remove: number | undefined; add: number | undefined }>();
  @ViewChild('shortcutInput') shortcutInput: any;
  @ViewChild('nameInput') nameInput: any;
  @ViewChild('hotkeyAcquisitionDialog') confirmReplaceDialog: any;

  newHotkey = '';
  prevHotkey = '';

  nProfilesConnected = 1;

  protected readonly nbPosition = NbPosition;

  constructor(private dialogService: NbDialogService) {
  }

  updatePieMenu() {
    this.nameInput.nativeElement.blur();

    // this.pieMenu.selectionColor is auto updated in the color picker

    this.pieMenu.name = this.nameInput.nativeElement.value;
    db.pieMenu.put(this.pieMenu);
  }

  ngOnInit(): void {
    db.profile.where('pieMenus').equals(this.pieMenu.id ?? 0).count().then((count) => {
      this.nProfilesConnected = count;
    });
  }

  duplicatePieMenu() {
    if (this.nProfilesConnected > 1) {
      console.log('PieMenuListRowComponent.duplicatePieMenu(): Duplicating pie menu ' + this.pieMenu.id);

      db.pieMenu.add({
        activationMode: this.pieMenu.activationMode,
        enabled: this.pieMenu.enabled,
        escapeRadius: this.pieMenu.escapeRadius,
        hotkey: this.pieMenu.hotkey,
        name: this.pieMenu.name + ' (copy)',
        openInScreenCenter: this.pieMenu.openInScreenCenter,
        pieItems: this.pieMenu.pieItems,
        selectionColor: this.pieMenu.selectionColor
      }).then((id) => {
        this.pieMenuChange.emit({remove: this.pieMenu.id, add: id as number});
      });
    }
  }

  acquireHotkey(success = true) {
    if (!success) {
      this.pieMenu.hotkey = this.prevHotkey;
      return;
    }
    db.pieMenu.where('hotkey').equals(this.newHotkey)
      .modify((pieMenu: PieMenu) => pieMenu.hotkey = '')
      .then(() => {
        db.pieMenu.put(this.pieMenu);
        this.pieMenuChange.emit();
      });
  }

  async shortcutInputChanged(newHotkey: string) {
    console.log('PieMenuListRowComponent: Updating shortcut for pie menu to ', newHotkey);
    this.newHotkey = newHotkey;
    this.prevHotkey = this.pieMenu.hotkey;

    this.pieMenu.hotkey = newHotkey;

    if ((await db.pieMenu.where('hotkey').equals(newHotkey).count()) > 0) {
      this.dialogService.open(this.confirmReplaceDialog);

    } else {
      db.pieMenu.put(this.pieMenu);
    }
  }
}

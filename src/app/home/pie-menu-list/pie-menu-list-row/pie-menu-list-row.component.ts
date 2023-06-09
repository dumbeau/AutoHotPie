import {Component, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {NbPosition} from '@nebular/theme';
import {db, PieMenu} from '../../../../../app/src/preferences/AHPDB';

@Component({
  selector: 'app-pie-menu-list-row',
  templateUrl: './pie-menu-list-row.component.html',
  styleUrls: ['./pie-menu-list-row.component.scss']
})
export class PieMenuListRowComponent {
  @Input() pieMenu: PieMenu = {
    activationMode: '',
    enabled: true,
    escapeRadius: 0,
    hotkey: '',
    name: '',
    openInScreenCenter: false,
    pieItems: [],
    selectionColor: ''
  };
  @Output() pieMenuRemoved = new EventEmitter();
  @ViewChild('shortcutInput') shortcutInput: any;
  @ViewChild('nameInput') nameInput: any;

  protected readonly NbPosition = NbPosition;

  listenShortcut() {
    window.electronAPI.listenKeyForResult().then((key: string) => {

      if (key.trim() === 'None+Back' || key.trim() === 'None+Delete') {
        this.pieMenu.hotkey = '';
      } else {
        this.pieMenu.hotkey = key;
      }

      this.shortcutInput.nativeElement.blur();
      console.log('PieMenuListComponent.getLastKeyPress(): listenKeyForResult() returned ' + key);

      db.pieMenu.put(this.pieMenu);
    });
  }

  cancelLastListener() {
    window.electronAPI.listenKeyForResult();
  }


  updatePieMenu() {
    this.nameInput.nativeElement.blur();

    // this.pieMenu.selectionColor is auto updated in the color picker

    this.pieMenu.name = this.nameInput.nativeElement.value;
    db.pieMenu.put(this.pieMenu);
  }


}

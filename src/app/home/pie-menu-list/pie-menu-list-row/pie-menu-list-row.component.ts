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

  shortcutInputFocusout() {
    console.log('PieMenuListRowComponent: Updating shortcut for pie menu to ', this.pieMenu.hotkey);
    db.pieMenu.put(this.pieMenu);
  }


  updatePieMenu() {
    this.nameInput.nativeElement.blur();

    // this.pieMenu.selectionColor is auto updated in the color picker

    this.pieMenu.name = this.nameInput.nativeElement.value;
    db.pieMenu.put(this.pieMenu);
  }


}

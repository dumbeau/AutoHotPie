import {Component, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {NbPosition} from '@nebular/theme';
import {PieMenu} from '../../../../../app/preferences/PieMenu';

@Component({
  selector: 'app-pie-menu-list-row',
  templateUrl: './pie-menu-list-row.component.html',
  styleUrls: ['./pie-menu-list-row.component.scss']
})
export class PieMenuListRowComponent {
    @Input() pieMenu: PieMenu = new PieMenu();
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

            window.electronAPI.updatePieMenu(this.pieMenu.toJsonString());
        });
    }

    cancelLastListener() {
        window.electronAPI.listenKeyForResult();
    }


    updatePieMenu() {
        this.nameInput.nativeElement.blur();

        // this.pieMenu.selectionColor is auto updated in the color picker

        this.pieMenu.name = this.nameInput.nativeElement.value;
        window.electronAPI.updatePieMenu(this.pieMenu.toJsonString());
    }


}

import {Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges, ViewChild} from '@angular/core';
import {PieMenu} from '../../../preferences/PieMenu';
import {NbPosition} from '@nebular/theme';

@Component({
    selector: 'app-pie-menu-list',
    templateUrl: './pie-menu-list.component.html',
    styleUrls: ['./pie-menu-list.component.scss']
})
export class PieMenuListComponent implements OnChanges {
    @Input() pieMenuIds: string[] = [];
    @Output() deletePieMenu = new EventEmitter<string>();

    selectedInput: any;
    toBeDeletedPieId = '';
    pieMenus: Array<PieMenu> = [];

    updatePieMenus() {
        const newPieMenus: Array<PieMenu> = [];
        for (const pieMenuId of this.pieMenuIds) {
            window.electronAPI.getPieMenu(pieMenuId).then((pieMenuJson: string) => {
                newPieMenus.push(PieMenu.fromJsonString(pieMenuJson));
            });
        }
        this.pieMenus = newPieMenus;
    }

    ngOnChanges(changes: SimpleChanges): void {
        this.updatePieMenus();
    }

    protected readonly NbPosition = NbPosition;

    listenShortcut(pieMenu: PieMenu) {
        window.electronAPI.listenKeyForResult().then((key: string) => {

            pieMenu.hotkey = key;
            this.selectedInput?.blur();
            console.log('PieMenuListComponent.getLastKeyPress(): listenKeyForResult() returned ' + key);

            // window.electronAPI.updatePieMenu(pieMenu.toJsonString());
        });
    }

    cancelLastListener() {
        window.electronAPI.listenKeyForResult();
    }

    protected readonly onfocus = onfocus;

    onFocus($event: FocusEvent) {
        this.selectedInput = $event.target;
    }
}

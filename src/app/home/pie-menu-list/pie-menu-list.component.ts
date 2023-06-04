import {Component, EventEmitter, Input, OnChanges, Output, SimpleChanges, ViewChild} from '@angular/core';
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

    @ViewChild('pieMenuList') pieMenuList: any;

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
}

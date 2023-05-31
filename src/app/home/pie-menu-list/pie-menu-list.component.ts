import {Component, Input, ViewChild} from '@angular/core';
import {Profile} from '../../../helpers/Profile';
import {PieMenu} from '../../../helpers/PieMenu';

@Component({
    selector: 'app-pie-menu-list',
    templateUrl: './pie-menu-list.component.html',
    styleUrls: ['./pie-menu-list.component.scss']
})
export class PieMenuListComponent {
    @Input() profId = '0';
    @ViewChild('pieMenuList') pieMenuList: any;

    tableEmpty = true;
    pieMenuPrefs: Array<PieMenu> = [];

    constructor() {
        window.electronAPI.getProfile(this.profId).then((profJson: string) => {
            const pieMenuIdList = Profile.fromJsonString(profJson).pieMenus;
            for (const id of pieMenuIdList) {
                this.pieMenuPrefs.push(new PieMenu('a', '#ff3322', 'a'));
            }
        });
    }

}

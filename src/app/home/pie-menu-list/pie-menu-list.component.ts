import {Component, Input, ViewChild} from '@angular/core';
import {ProfileUtils} from '../../../helpers/ProfileUtils';
import {PieMenuPreferences} from '../../../helpers/PieMenuPreferences';

@Component({
  selector: 'app-pie-menu-list',
  templateUrl: './pie-menu-list.component.html',
  styleUrls: ['./pie-menu-list.component.scss']
})
export class PieMenuListComponent {
  @Input() profId = 0;
  @ViewChild('pieMenuList') pieMenuList: any;

  tableEmpty = true;
  pieMenuPrefs: Array<PieMenuPreferences> = [];

  constructor() {
    const pieMenuIdList = ProfileUtils.getPieMenuIdList(this.profId);

    for (const id of pieMenuIdList) {
        this.pieMenuPrefs.push(new PieMenuPreferences('a', 'a', 'a'));
    }

  }

}

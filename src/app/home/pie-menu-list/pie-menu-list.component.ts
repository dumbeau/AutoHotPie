import {Component, EventEmitter, Input, OnChanges, Output, SimpleChanges} from '@angular/core';
import {db} from '../../../../app/src/userData/AHPDatabase';
import {PieMenu} from '../../../../app/src/userData/PieMenu';

@Component({
  selector: 'app-pie-menu-list',
  templateUrl: './pie-menu-list.component.html',
  styleUrls: ['./pie-menu-list.component.scss']
})
export class PieMenuListComponent implements OnChanges {
  @Input() pieMenuIds: number[] = [];
  @Output() pieMenuChange = new EventEmitter<{remove: number|undefined; add: number|undefined}>();

  pieMenus: Array<PieMenu> = [];

  refreshPieMenuList() {
    db.pieMenu.bulkGet(this.pieMenuIds).then((pieMenus) => {
      this.pieMenus = [];

      for (const pieMenu of pieMenus) {
        if (pieMenu !== undefined) {
          this.pieMenus.push(pieMenu);
        }
      }
    });
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.refreshPieMenuList();
  }
}

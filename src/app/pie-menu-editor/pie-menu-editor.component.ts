import {Component, Input} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {PieMenuState, PieMenuStateManager} from './state/PieMenuState';
import {db} from '../../../app/src/userData/AHPDatabase';
import {PieItem} from '../../../app/src/userData/PieItem';

@Component({
  selector: 'app-pie-menu-editor',
  templateUrl: './pie-menu-editor.component.html',
  styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent {
  @Input() pieMenuId: number;

  pieMenuStates: ReadonlyArray<PieMenuState> = PieMenuStateManager.instance.readonlyPieMenuStates;

  // pieMenuStateLoaded is used to prevent the work area from loading until the pie menu state has created.
  pieMenuStateLoaded?: Promise<boolean>;

  constructor(private activatedRoute: ActivatedRoute) {

    this.pieMenuId = parseInt(this.activatedRoute.snapshot.paramMap.get('pieMenuId') ?? '0', 10);

    window.log.debug('Pie Menu Editor is opening pie menu of id: ' + this.pieMenuId);

    this.loadWorkArea(this.pieMenuId);
  }

  async loadWorkArea(pieMenuId: number) {
    const pieMenu = await db.pieMenu.get(pieMenuId);

    if (!pieMenu) {
      throw new Error('Pie Menu not found');
    }
    const rawPieItems = await db.pieItem.bulkGet(pieMenu.pieItems);
    const pieItems = new Map<number, PieItem>();

    window.log.debug('Finding pie items: ' + JSON.stringify(pieMenu.pieItems));
    window.log.debug('Found pie items: ' + JSON.stringify(rawPieItems));

    for (let i = 0; i < rawPieItems.length; i++) {
      if (rawPieItems[i] === undefined) {
        throw new Error('Trying to load work area but pie Item of id ' + pieMenu.pieItems[i] + ' not found');
      }

      pieItems.set(pieMenu.pieItems[i], rawPieItems[i] as PieItem);
    }

    const pieMenuState = new PieMenuState(pieMenu, pieItems);

    PieMenuStateManager.instance.addPieMenuState(pieMenuState);
    this.pieMenuStateLoaded = Promise.resolve(true);
  }

  clearState() {
    PieMenuStateManager.instance.clearPieMenuStates();
  }
}

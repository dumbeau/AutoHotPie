import {Component, ViewChild} from '@angular/core';
import {ElectronService} from './core/services';
import {TranslateService} from '@ngx-translate/core';
import {APP_CONFIG} from '../environments/environment';
import {db} from '../../app/src/userData/AHPDatabase';
import {Router} from '@angular/router';
import {NbPosition} from '@nebular/theme';
import {PieMenu} from '../../app/src/userData/PieMenu';
import {Profile} from '../../app/src/userData/Profile';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  @ViewChild('icon') icon: any;

  version = '0.0.0';
  activePage = 'none';
  serviceActive = true;
  loaded = false;

  protected readonly nbPosition = NbPosition;

  constructor(
    private router: Router,
    private electronService: ElectronService,
    private translate: TranslateService
  ) {
    this.initAppdata();

    window.electronAPI.getVersion().then((version) => {
      this.version = version;
    });

    this.translate.setDefaultLang('en');
    console.log('APP_CONFIG', APP_CONFIG);

    if (electronService.isElectron) {
      console.log(process.env);
      console.log('Run in electron');
      console.log('Electron ipcRenderer', this.electronService.ipcRenderer);
      console.log('NodeJS childProcess', this.electronService.childProcess);
    } else {
      console.log('Run in browser');
    }

    window.electronAPI.globalHotkeyServiceExited(() => {
      console.log('App component: globalHotkeyServiceExited');
    });
  }

  async initAppdata() {
    if ((await db.profile.count()) === 0) {
      db.pieMenu.add(new PieMenu()
      ).then((pieMenuId) => {
        db.profile.add(new Profile('Global Profile', [pieMenuId as number]))
          .then(() => {
            this.loaded = true;
          });
      });
    } else {
      this.loaded = true;
    }
  }

  setActive(emitter: string) {
    this.activePage = this.activePage === emitter ? 'none' : emitter;

    if (document.activeElement instanceof HTMLElement) {
      document.activeElement.blur();
    }
  }

  toggleService() {
    window.electronAPI.toggleService(this.serviceActive).then((serviceActive) => {
      this.serviceActive = serviceActive;
    });
  }

  isPieMenu() {
    return this.router.url === '/pieMenuUI';
  }

  openInBrowser(emitter: string) {
    switch (emitter) {
      case 'github':
        window.electronAPI.openInBrowser('https://github.com/dumbeau/AutoHotPie');
        break;
      case 'paypal':
        window.electronAPI.openInBrowser(
          'https://www.paypal.com/donate?business=RBTDTCUBK4Z8S&no_recurring=1&item_name=Support+Pie+Menus+Development&currency_code=USD');
        break;
      case 'bug':
        window.electronAPI.openInBrowser('https://github.com/dumbeau/AutoHotPie/issues/new');
        break;
    }
  }


}

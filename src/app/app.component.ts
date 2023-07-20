import {Component, ViewChild} from '@angular/core';
import {ElectronService} from './core/services';
import {TranslateService} from '@ngx-translate/core';
import {APP_CONFIG} from '../environments/environment';
import {db} from '../../app/src/userData/AHPDatabase';
import {Router} from '@angular/router';
import {NbPosition} from '@nebular/theme';
import {PieMenu, PieMenuActivationMode} from '../../app/src/userData/PieMenu';
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

    window.log.info('APP_CONFIG ' + APP_CONFIG);

    if (electronService.isElectron) {
      window.log.info('' + process.env);
      window.log.info('Run in electron');
      window.log.info('Electron ipcRenderer ' + this.electronService.ipcRenderer);
      window.log.info('NodeJS childProcess ' + this.electronService.childProcess);
    } else {
      window.log.info('Run in browser');
    }

    window.electronAPI.globalHotkeyServiceExited(() => {
      window.log.info('Global hotkey service exited as notified by the main process');
    });
  }

  async initAppdata() {
    window.log.info('Initializing/Loading app data');

    if ((await db.profile.count()) === 0) {
      window.log.info('No profile found, creating default profile');

      const pieMenuId = await db.pieMenu.put(new PieMenu(
        'Default Pie Menu',
        true,
        PieMenuActivationMode.HOVER_OVER_THEN_RELEASE,
        '',
        0,
        false,
        '',
        [],
        1
        ));
      await db.profile.put(new Profile(
        'Default Profile',
        [pieMenuId as number],
        [],
        undefined,
        true,
        1
      ));

    }

    window.log.info('App data loaded');
    this.loaded = true;
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

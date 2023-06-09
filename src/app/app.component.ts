import {Component, ViewChild} from '@angular/core';
import { ElectronService } from './core/services';
import { TranslateService } from '@ngx-translate/core';
import { APP_CONFIG } from '../environments/environment';
import {db} from "../../app/src/preferences/AHPDB";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  @ViewChild('icon') icon: any;
  activePage = 'none';
  serviceActive = true;

  constructor(
    private electronService: ElectronService,
    private translate: TranslateService
  ) {

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

    window.electronAPI.globalHotkeyServiceExited(()=>{
        console.log('App component: globalHotkeyServiceExited');
    });
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
}

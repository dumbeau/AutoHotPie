import { Component } from '@angular/core';

@Component({
  selector: 'app-help-and-about',
  templateUrl: './help-and-about.component.html',
  styleUrls: ['./help-and-about.component.scss']
})
export class HelpAndAboutComponent {
  updateBtnText = 'PAGES.SETTINGS.ABOUT_CHECK_FOR_UPDATES';

  checkUpdate() {
    this.updateBtnText = 'PAGES.SETTINGS.ABOUT_CHECKING_FOR_UPDATES';
    window.electronAPI.isUpdateAvailable().then((isUpdateAvailable) => {
      window.log.info('Update available: ' + isUpdateAvailable);
      if (isUpdateAvailable) {
        this.updateBtnText = 'PAGES.SETTINGS.ABOUT_UPDATE_AVAILABLE';
      } else {
        this.updateBtnText = 'PAGES.SETTINGS.ABOUT_NO_UPDATE_AVAILABLE';
      }
    });
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

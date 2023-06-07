import {Component, ViewChild} from '@angular/core';
import {ActivationMode} from '../../preferences/PieMenu';

@Component({
    selector: 'app-new-pie-wizard',
    templateUrl: './new-pie-wizard.component.html',
    styleUrls: ['./new-pie-wizard.component.scss']
})
export class NewPieWizardComponent {

    @ViewChild('finish') finishButton: any;
    currentPage = 0;

    pieName = '';
    hotkey = '';
    activationMode = ActivationMode.RELEASE_ON_FUNCTION;
    style = 'default';

    nextPage($event: any, source: any) {
        this.currentPage = (this.currentPage + 1) % 4;
        switch (source) {
            case 'pieName':
                this.pieName = $event;
                break;
            case 'hotkey':
                this.hotkey = $event;
                break;
            case 'activationMode':
                this.activationMode = $event;
                break;
        }
    }

    finishWizard() {
        // TODO: create the pie and then exit the wizard

        this.finishButton.nativeElement.click();
        console.log('Creating pie with name: '
            + this.pieName
            + ' and hotkey: '
            + this.hotkey
            + ' and activation mode: '
            + this.activationMode);

        // window.electronAPI.createPieMenuIn(this.pieName, this.hotkey, this.activationMode, this.style, 'global');
    }

    prevPage() {
        this.currentPage = this.currentPage === 0 ? 0 : this.currentPage - 1;
    }
}

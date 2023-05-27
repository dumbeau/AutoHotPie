import {Component, ViewChild} from '@angular/core';

@Component({
  selector: 'app-new-pie-wizard',
  templateUrl: './new-pie-wizard.component.html',
  styleUrls: ['./new-pie-wizard.component.scss']
})
export class NewPieWizardComponent {
  @ViewChild('finish') finishButton: any;
  currentPage = 0;

  nextPage() {
    this.currentPage = (this.currentPage + 1) % 4;
  }

  finishWizard() {
    // TODO: save the pie and then exit the wizard

    this.finishButton.nativeElement.click();
  }
}

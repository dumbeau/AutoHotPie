import {Component, EventEmitter, Output, ViewChild} from '@angular/core';

@Component({
  selector: 'app-page-pie-menu-name',
  templateUrl: './page-pie-menu-name.component.html',
  styleUrls: ['./page-pie-menu-name.component.scss']
})
export class PagePieMenuNameComponent {
  @Output() next = new EventEmitter<string>();
  @Output() prev = new EventEmitter();

  @ViewChild('pieNameInput') pieNameInput: any;

  onNextClick() {
    this.next.emit(this.pieNameInput.nativeElement.value);
  }

}

import {Component, EventEmitter, Output} from '@angular/core';

@Component({
  selector: 'app-page-selection-mode',
  templateUrl: './page-selection-mode.component.html',
  styleUrls: ['./page-selection-mode.component.scss']
})
export class PageSelectionModeComponent {
  @Output() next = new EventEmitter();
  @Output() prev = new EventEmitter();

  onNextClick() {
    this.next.emit();
  }

  onPrevClick() {
    this.prev.emit();
  }
}

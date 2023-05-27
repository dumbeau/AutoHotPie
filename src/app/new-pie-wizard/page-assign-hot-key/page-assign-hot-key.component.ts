import {Component, EventEmitter, Output} from '@angular/core';

@Component({
  selector: 'app-page-assign-hot-key',
  templateUrl: './page-assign-hot-key.component.html',
  styleUrls: ['./page-assign-hot-key.component.scss']
})
export class PageAssignHotKeyComponent {
  @Output() next = new EventEmitter();

  onNextClick() {
    this.next.emit();
  }
}

import {Component, EventEmitter, Output} from '@angular/core';

@Component({
  selector: 'app-page-style-selection',
  templateUrl: './page-style-selection.component.html',
  styleUrls: ['./page-style-selection.component.scss']
})
export class PageStyleSelectionComponent {
  @Output() finish = new EventEmitter();
  @Output() prev = new EventEmitter();

  //TODO: complete this component, user can't choose style yet
  onFinishClick() {
    this.finish.emit();
  }

  onPrevClick() {
    this.prev.emit();
  }
}

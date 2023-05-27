import {Component, EventEmitter, Output} from '@angular/core';

@Component({
  selector: 'app-page-style-selection',
  templateUrl: './page-style-selection.component.html',
  styleUrls: ['./page-style-selection.component.scss']
})
export class PageStyleSelectionComponent {
  @Output() finish = new EventEmitter();

  onFinishClick() {
    this.finish.emit();
  }
}

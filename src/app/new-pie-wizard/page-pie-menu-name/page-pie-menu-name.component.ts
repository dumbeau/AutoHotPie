import {Component, EventEmitter, Output} from '@angular/core';
import { TranslateModule } from "@ngx-translate/core";

@Component({
  selector: 'app-page-pie-menu-name',
  templateUrl: './page-pie-menu-name.component.html',
  styleUrls: ['./page-pie-menu-name.component.scss']
})
export class PagePieMenuNameComponent {
  @Output() next = new EventEmitter();

  onNextClick() {
    this.next.emit();
  }
}

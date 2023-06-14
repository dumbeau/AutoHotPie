import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TranslateModule } from '@ngx-translate/core';

import { PageNotFoundComponent } from './components/';
import { WebviewDirective } from './directives/';
import { FormsModule } from '@angular/forms';
import { ShortcutInputComponent } from './components/shortcut-input/shortcut-input.component';
import {NbInputModule} from "@nebular/theme";

@NgModule({
  declarations: [PageNotFoundComponent, WebviewDirective, ShortcutInputComponent],
  imports: [CommonModule, TranslateModule, FormsModule, NbInputModule],
  exports: [TranslateModule, WebviewDirective, FormsModule, ShortcutInputComponent]
})
export class SharedModule {}

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {HelpAndAboutComponent} from './help-and-about.component';
import {TranslateModule} from "@ngx-translate/core";
import {NbButtonModule} from "@nebular/theme";


@NgModule({
  declarations: [HelpAndAboutComponent],
  imports: [
    CommonModule,
    TranslateModule,
    NbButtonModule,
  ]
})
export class HelpAndAboutModule { }

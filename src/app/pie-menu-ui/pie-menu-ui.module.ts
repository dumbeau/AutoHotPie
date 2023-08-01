import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {PieMenuUIComponent} from './pie-menu-ui.component';
import {NbButtonModule, NbLayoutModule} from '@nebular/theme';
import {RouterOutlet} from '@angular/router';
import {PieMenuUIRoutingModule} from './pie-menu-ui-routing-module';
import {PieCenterButtonComponent} from './pie-center-button/pie-center-button.component';
import { PieGuidingLineComponent } from './pie-guiding-line/pie-guiding-line.component';


@NgModule({
  declarations: [
    PieMenuUIComponent,
    PieCenterButtonComponent,
    PieGuidingLineComponent
  ],
  imports: [
    CommonModule,
    NbLayoutModule,
    PieMenuUIRoutingModule,
    NbButtonModule,
    RouterOutlet
  ]
})
export class PieMenuUIModule { }

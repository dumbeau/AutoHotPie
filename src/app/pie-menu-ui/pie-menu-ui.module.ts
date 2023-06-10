import {NgModule} from '@angular/core';
import {CommonModule, NgOptimizedImage} from '@angular/common';
import {PieMenuUIComponent} from './pie-menu-ui.component';
import {
  NbButtonModule,
  NbCardModule,
  NbFormFieldModule,
  NbIconModule,
  NbInputModule,
  NbLayoutModule,
  NbPopoverModule,
  NbSelectModule,
  NbToggleModule
} from '@nebular/theme';
import {RouterOutlet} from '@angular/router';
import {PieMenuUIRoutingModule} from './pie-menu-ui-routing-module';
import {SharedModule} from '../shared/shared.module';
import {NgxColorsModule} from 'ngx-colors';


@NgModule({
  declarations: [
    PieMenuUIComponent
  ],
  imports: [
    CommonModule,
    PieMenuUIRoutingModule,
    RouterOutlet,
    SharedModule,
    NbButtonModule,
    NbLayoutModule,
    NgOptimizedImage,
    NbInputModule,
    NbIconModule,
    NbFormFieldModule,
    NgxColorsModule,
    NbCardModule,
    NbPopoverModule,
    NbSelectModule,
    NbToggleModule
  ]
})
export class PieMenuUIModule { }

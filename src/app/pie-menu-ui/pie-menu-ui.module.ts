import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuUIComponent } from './pie-menu-ui.component';
import {NbButtonModule, NbLayoutModule} from "@nebular/theme";
import {RouterOutlet} from "@angular/router";



@NgModule({
  declarations: [
    PieMenuUIComponent
  ],
  imports: [
    CommonModule,
    NbLayoutModule,
    NbButtonModule,
    RouterOutlet
  ]
})
export class PieMenuUIModule { }

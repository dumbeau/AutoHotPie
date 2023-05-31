import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import {PieMenuUIComponent} from './pie-menu-ui.component';

const routes: Routes = [
  {
    path: 'pieMenuUI',
    component: PieMenuUIComponent
  }
];

@NgModule({
  declarations: [],
  imports: [CommonModule, RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PieMenuUIRoutingModule {}

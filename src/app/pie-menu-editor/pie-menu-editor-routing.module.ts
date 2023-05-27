import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import {PieMenuEditorComponent} from './pie-menu-editor.component';

const routes: Routes = [
  {
    path: 'home',
    component: PieMenuEditorComponent
  }
];

@NgModule({
  declarations: [],
  imports: [CommonModule, RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PieMenuEditorRoutingModule {}

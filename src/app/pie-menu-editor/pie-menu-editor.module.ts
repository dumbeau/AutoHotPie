import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuEditorComponent } from './pie-menu-editor.component';
import {TreeModule} from '@circlon/angular-tree-component';

@NgModule({
  declarations: [
    PieMenuEditorComponent
  ],
  imports: [
    CommonModule,
    TreeModule
  ]
})
export class PieMenuEditorModule { }

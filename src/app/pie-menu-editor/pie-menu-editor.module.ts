import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuEditorComponent } from './pie-menu-editor.component';
import {MenuItemTreeComponent} from "./menu-item-tree/menu-item-tree.component";

@NgModule({
  declarations: [
    PieMenuEditorComponent,
    MenuItemTreeComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PieMenuEditorModule { }

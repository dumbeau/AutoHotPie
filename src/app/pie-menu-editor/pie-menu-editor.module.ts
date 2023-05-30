import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuEditorComponent } from './pie-menu-editor.component';
import {TreeModule} from '@circlon/angular-tree-component';
import {TranslateModule} from "@ngx-translate/core";
import {PreferencesEditorComponent} from "./preferences-editor/preferences-editor.component";
import {NbListModule, NbToggleModule} from "@nebular/theme";

@NgModule({
  declarations: [
    PieMenuEditorComponent,
    PreferencesEditorComponent
  ],
  imports: [
    CommonModule,
    TreeModule,
    TranslateModule,
    NbListModule,
    NbToggleModule
  ]
})
export class PieMenuEditorModule { }

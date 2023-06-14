import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuEditorComponent } from './pie-menu-editor.component';
import {TranslateModule} from '@ngx-translate/core';
import {PreferencesEditorComponent} from './preferences-editor/preferences-editor.component';
import {
  NbButtonGroupModule,
  NbButtonModule, NbCardModule, NbCheckboxModule,
  NbFormFieldModule,
  NbIconModule, NbInputModule,
  NbListModule, NbRadioModule,
  NbSelectModule,
  NbToggleModule
} from '@nebular/theme';
import {RouterLink} from '@angular/router';
import { ActionComponent } from './action/action.component';
import {SharedModule} from "../shared/shared.module";

@NgModule({
  declarations: [
    PieMenuEditorComponent,
    PreferencesEditorComponent,
    ActionComponent
  ],
  imports: [
    CommonModule,
    TranslateModule,
    NbListModule,
    NbToggleModule,
    NbButtonModule,
    NbIconModule,
    RouterLink,
    NbSelectModule,
    NbFormFieldModule,
    NbInputModule,
    SharedModule,
    NbButtonGroupModule,
    NbRadioModule,
    NbCheckboxModule,
    NbCardModule
  ]
})
export class PieMenuEditorModule { }

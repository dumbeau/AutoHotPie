import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PieMenuEditorComponent } from './pie-menu-editor.component';
import {TranslateModule} from '@ngx-translate/core';
import {PreferencesEditorComponent} from './preferences-editor/preferences-editor.component';
import {NbButtonModule, NbIconModule, NbListModule, NbToggleModule} from '@nebular/theme';
import {RouterLink} from '@angular/router';

@NgModule({
  declarations: [
    PieMenuEditorComponent,
    PreferencesEditorComponent
  ],
    imports: [
        CommonModule,
        TranslateModule,
        NbListModule,
        NbToggleModule,
        NbButtonModule,
        NbIconModule,
        RouterLink
    ]
})
export class PieMenuEditorModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {SettingsComponent} from './settings.component';
import {NbButtonGroupModule, NbButtonModule, NbIconModule, NbListModule, NbToggleModule} from '@nebular/theme';
import {RouterLink} from '@angular/router';
import {TranslateModule} from '@ngx-translate/core';
import {SharedModule} from "../shared/shared.module";

@NgModule({
  declarations: [ SettingsComponent ],
    imports: [
        CommonModule,
        NbButtonModule,
        NbIconModule,
        RouterLink,
        TranslateModule,
        NbListModule,
        NbToggleModule,
        NbButtonGroupModule,
        SharedModule
    ]
})
export class SettingsModule { }

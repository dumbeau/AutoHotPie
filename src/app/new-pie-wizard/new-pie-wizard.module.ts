import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewPieWizardComponent } from './new-pie-wizard.component';
import { PagePieMenuNameComponent } from './page-pie-menu-name/page-pie-menu-name.component';
import { PageAssignHotKeyComponent } from './page-assign-hot-key/page-assign-hot-key.component';
import { PageSelectionModeComponent } from './page-selection-mode/page-selection-mode.component';
import { PageStyleSelectionComponent } from './page-style-selection/page-style-selection.component';
import {TranslateModule} from '@ngx-translate/core';
import {NbButtonModule, NbIconModule, NbInputModule} from "@nebular/theme";
import {RouterLink} from '@angular/router';

@NgModule({
  declarations: [
    NewPieWizardComponent,
    PagePieMenuNameComponent,
    PageAssignHotKeyComponent,
    PageSelectionModeComponent,
    PageStyleSelectionComponent
  ],
  exports: [
    PageAssignHotKeyComponent,
    PagePieMenuNameComponent,
    PageSelectionModeComponent,
    PageStyleSelectionComponent
  ],
  imports: [
    CommonModule,
    TranslateModule,
    NbButtonModule,
    RouterLink,
    NbInputModule,
    NbIconModule
  ]
})
export class NewPieWizardModule { }

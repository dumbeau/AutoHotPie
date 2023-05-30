import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PageNotFoundComponent } from './shared/components';
import {NewPieWizardComponent} from './new-pie-wizard/new-pie-wizard.component';

import { HomeRoutingModule } from './home/home-routing.module';
import { DetailRoutingModule } from './detail/detail-routing.module';
import {NewPieWizardRoutingModule} from './new-pie-wizard/new-pie-wizard-routing.module';
import {PieMenuEditorComponent} from './pie-menu-editor/pie-menu-editor.component';
import {PieMenuEditorModule} from './pie-menu-editor/pie-menu-editor.module';
import {SettingsComponent} from "./settings/settings.component";
import {SettingsModule} from "./settings/settings.module";

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'new-pie-wizard',
    component: NewPieWizardComponent
  },
  {
    path: 'pie-menu-editor',
    component: PieMenuEditorComponent
  },
  {
    path: 'settings',
    component: SettingsComponent
  },
  {
    path: '**',
    component: PageNotFoundComponent
  }

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {}),
    HomeRoutingModule,
    DetailRoutingModule,
    NewPieWizardRoutingModule,
    PieMenuEditorModule,
    SettingsModule
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

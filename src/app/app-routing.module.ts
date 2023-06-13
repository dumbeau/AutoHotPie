import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PageNotFoundComponent } from './shared/components';

import { HomeRoutingModule } from './home/home-routing.module';
import { DetailRoutingModule } from './detail/detail-routing.module';

// Please keep the following line. It is not certain where this is being used
// but the program will crash without this import
import {PieMenuEditorModule} from './pie-menu-editor/pie-menu-editor.module';
import {SettingsComponent} from './settings/settings.component';
import {SettingsModule} from './settings/settings.module';
import {HelpAndAboutComponent} from './help-and-about/help-and-about.component';
import {HelpAndAboutModule} from './help-and-about/help-and-about.module';
import {PieMenuEditorRoutingModule} from './pie-menu-editor/pie-menu-editor-routing.module';
import {PieMenuUIRoutingModule} from './pie-menu-ui/pie-menu-ui-routing-module';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'settings',
    component: SettingsComponent
  },
  {
    path: 'helpAndAbout',
    component: HelpAndAboutComponent
  },
  {
    path: '**',
    component: PageNotFoundComponent
  }

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {useHash: true}),
    HomeRoutingModule,
    DetailRoutingModule,
    PieMenuEditorRoutingModule,
    PieMenuUIRoutingModule,
    SettingsModule,
    HelpAndAboutModule,

    // This import is not really used but to keep the IDE acknowledge
    // to not remove this import
    PieMenuEditorModule
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

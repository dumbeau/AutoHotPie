import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {PageNotFoundComponent} from './shared/components';

import {HomeRoutingModule} from './home/home-routing.module';
import {DetailRoutingModule} from './detail/detail-routing.module';
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
    HelpAndAboutModule
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

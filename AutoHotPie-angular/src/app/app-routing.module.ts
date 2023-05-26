import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PageNotFoundComponent } from './shared/components';
import {NewPieWizardComponent} from './new-pie-wizard/new-pie-wizard.component';

import { HomeRoutingModule } from './home/home-routing.module';
import { DetailRoutingModule } from './detail/detail-routing.module';
import {NewPieWizardRoutingModule} from './new-pie-wizard/new-pie-wizard-routing.module';

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
    path: '**',
    component: PageNotFoundComponent
  }

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {}),
    HomeRoutingModule,
    DetailRoutingModule,
    NewPieWizardRoutingModule
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

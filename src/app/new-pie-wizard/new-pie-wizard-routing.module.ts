import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { NewPieWizardComponent } from './new-pie-wizard.component';

const routes: Routes = [
  {
    path: 'home',
    component: NewPieWizardComponent
  }
];

@NgModule({
  declarations: [],
  imports: [CommonModule, RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NewPieWizardRoutingModule {}

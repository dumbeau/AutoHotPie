import { NgModule } from '@angular/core';
import {CommonModule, NgOptimizedImage} from '@angular/common';

import { HomeRoutingModule } from './home-routing.module';

import { HomeComponent } from './home.component';
import { SharedModule } from '../shared/shared.module';
import {
  NbButtonModule,
  NbCardModule,
  NbFormFieldModule,
  NbIconModule,
  NbInputModule,
  NbLayoutModule, NbPopoverModule, NbSelectModule
} from '@nebular/theme';
import {ProfileListItemComponent} from './profile-list-item/profile-list-item.component';
import {PieMenuListComponent} from './pie-menu-list/pie-menu-list.component';
import {NgxColorsModule} from 'ngx-colors';
import { ProfileEditorComponent } from './profile-editor/profile-editor.component';

@NgModule({
  declarations: [HomeComponent, ProfileListItemComponent, PieMenuListComponent, ProfileEditorComponent],
  imports: [
    CommonModule,
    SharedModule,
    HomeRoutingModule,
    NbButtonModule,
    NbLayoutModule,
    NgOptimizedImage,
    NbInputModule,
    NbIconModule,
    NbFormFieldModule,
    NgxColorsModule,
    NbCardModule,
    NbPopoverModule,
    NbSelectModule
  ]
})
export class HomeModule {}

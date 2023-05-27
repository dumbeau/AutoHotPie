import { NgModule } from '@angular/core';
import {CommonModule, NgOptimizedImage} from '@angular/common';

import { HomeRoutingModule } from './home-routing.module';

import { HomeComponent } from './home.component';
import { SharedModule } from '../shared/shared.module';
import {NbButtonModule, NbFormFieldModule, NbIconModule, NbInputModule, NbLayoutModule} from '@nebular/theme';
import {ProfileListItemComponent} from './profile-list-item/profile-list-item.component';
import {ProfileEditorHeaderComponent} from './profile-editor-header/profile-editor-header.component';
import {PieMenuListComponent} from './pie-menu-list/pie-menu-list.component';
import {NgxColorsModule} from "ngx-colors";

@NgModule({
  declarations: [HomeComponent, ProfileListItemComponent, ProfileEditorHeaderComponent, PieMenuListComponent],
  imports: [CommonModule, SharedModule, HomeRoutingModule, NbButtonModule, NbLayoutModule, NgOptimizedImage, NbInputModule, NbIconModule, NbFormFieldModule, NgxColorsModule]
})
export class HomeModule {}

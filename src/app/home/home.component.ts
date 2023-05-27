import {AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, AfterViewInit {
  @ViewChild('profileListItemComponent') profileListItemComponent: any;
  @ViewChild('profileEditorHeaderComponent') profileEditorHeaderComponent: any;

  constructor(private router: Router) {
  }

  ngOnInit(): void {
    console.log('HomeComponent INIT');

  }

  ngAfterViewInit(): void {
    this.profileListItemComponent.setProfileUpdateListener(this.profileEditorHeaderComponent);
  }

}

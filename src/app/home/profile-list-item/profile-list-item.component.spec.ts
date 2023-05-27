import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileListItemComponent } from './profile-list-item.component';

describe('ProfileListItemComponent', () => {
  let component: ProfileListItemComponent;
  let fixture: ComponentFixture<ProfileListItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfileListItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProfileListItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

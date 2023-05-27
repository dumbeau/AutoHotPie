import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileEditorHeaderComponent } from './profile-editor-header.component';

describe('ProfileEditorHeaderComponent', () => {
  let component: ProfileEditorHeaderComponent;
  let fixture: ComponentFixture<ProfileEditorHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfileEditorHeaderComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProfileEditorHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

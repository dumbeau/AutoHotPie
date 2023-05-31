import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileEditorComponent } from './profile-editor.component';

describe('ProfileEditorComponent', () => {
  let component: ProfileEditorComponent;
  let fixture: ComponentFixture<ProfileEditorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfileEditorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProfileEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

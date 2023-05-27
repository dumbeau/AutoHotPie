import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PreferencesEditorComponent } from './preferences-editor.component';

describe('PreferencesEditorComponent', () => {
  let component: PreferencesEditorComponent;
  let fixture: ComponentFixture<PreferencesEditorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PreferencesEditorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PreferencesEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

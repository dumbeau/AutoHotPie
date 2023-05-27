import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PieMenuEditorComponent } from './pie-menu-editor.component';

describe('PieMenuEditorComponent', () => {
  let component: PieMenuEditorComponent;
  let fixture: ComponentFixture<PieMenuEditorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PieMenuEditorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PieMenuEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PieMenuEditorWorkAreaComponent } from './pie-menu-editor-work-area.component';

describe('PieMenuEditorWorkAreaComponent', () => {
  let component: PieMenuEditorWorkAreaComponent;
  let fixture: ComponentFixture<PieMenuEditorWorkAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PieMenuEditorWorkAreaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PieMenuEditorWorkAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

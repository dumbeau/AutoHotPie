import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WorkAreaComponent } from './work-area.component';

describe('PieMenuEditorWorkAreaComponent', () => {
  let component: WorkAreaComponent;
  let fixture: ComponentFixture<WorkAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WorkAreaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(WorkAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

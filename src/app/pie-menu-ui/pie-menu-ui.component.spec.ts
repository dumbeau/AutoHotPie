import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PieMenuUIComponent } from './pie-menu-ui.component';

describe('PieMenuUIComponent', () => {
  let component: PieMenuUIComponent;
  let fixture: ComponentFixture<PieMenuUIComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PieMenuUIComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PieMenuUIComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

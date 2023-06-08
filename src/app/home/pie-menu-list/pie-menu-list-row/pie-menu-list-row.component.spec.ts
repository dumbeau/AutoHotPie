import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PieMenuListRowComponent } from './pie-menu-list-row.component';

describe('PieMenuListRowComponent', () => {
  let component: PieMenuListRowComponent;
  let fixture: ComponentFixture<PieMenuListRowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PieMenuListRowComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PieMenuListRowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

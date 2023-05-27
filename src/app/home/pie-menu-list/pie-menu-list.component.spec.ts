import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PieMenuListComponent } from './pie-menu-list.component';

describe('PieMenuListComponent', () => {
  let component: PieMenuListComponent;
  let fixture: ComponentFixture<PieMenuListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PieMenuListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PieMenuListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

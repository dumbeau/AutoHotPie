import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PagePieMenuNameComponent } from './page-pie-menu-name.component';

describe('PagePieMenuNameComponent', () => {
  let component: PagePieMenuNameComponent;
  let fixture: ComponentFixture<PagePieMenuNameComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PagePieMenuNameComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PagePieMenuNameComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

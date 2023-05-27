import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PageAssignHotKeyComponent } from './page-assign-hot-key.component';

describe('PageAssignHotKeyComponent', () => {
  let component: PageAssignHotKeyComponent;
  let fixture: ComponentFixture<PageAssignHotKeyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PageAssignHotKeyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PageAssignHotKeyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

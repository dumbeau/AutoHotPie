import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuItemTreeComponent } from './menu-item-tree.component';

describe('MenuItemTreeComponent', () => {
  let component: MenuItemTreeComponent;
  let fixture: ComponentFixture<MenuItemTreeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MenuItemTreeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MenuItemTreeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

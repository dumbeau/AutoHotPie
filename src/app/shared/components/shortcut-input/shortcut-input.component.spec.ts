import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShortcutInputComponent } from './shortcut-input.component';

describe('ShortcutInputComponent', () => {
  let component: ShortcutInputComponent;
  let fixture: ComponentFixture<ShortcutInputComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShortcutInputComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShortcutInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

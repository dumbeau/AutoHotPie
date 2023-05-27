import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PageSelectionModeComponent } from './page-selection-mode.component';

describe('PageSelectionModeComponent', () => {
  let component: PageSelectionModeComponent;
  let fixture: ComponentFixture<PageSelectionModeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PageSelectionModeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PageSelectionModeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

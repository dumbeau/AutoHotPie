import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PageStyleSelectionComponent } from './page-style-selection.component';

describe('PageStyleSelectionComponent', () => {
  let component: PageStyleSelectionComponent;
  let fixture: ComponentFixture<PageStyleSelectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PageStyleSelectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PageStyleSelectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

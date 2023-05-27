import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewPieWizardComponent } from './new-pie-wizard.component';

describe('NewPieWizardComponent', () => {
  let component: NewPieWizardComponent;
  let fixture: ComponentFixture<NewPieWizardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewPieWizardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NewPieWizardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

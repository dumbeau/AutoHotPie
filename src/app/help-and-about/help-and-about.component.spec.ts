import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HelpAndAboutComponent } from './help-and-about.component';

describe('HelpAndAboutComponent', () => {
  let component: HelpAndAboutComponent;
  let fixture: ComponentFixture<HelpAndAboutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HelpAndAboutComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HelpAndAboutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

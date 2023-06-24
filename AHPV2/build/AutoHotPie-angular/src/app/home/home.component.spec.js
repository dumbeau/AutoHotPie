"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@angular/core/testing");
const home_component_1 = require("./home.component");
const core_1 = require("@ngx-translate/core");
const testing_2 = require("@angular/router/testing");
describe('HomeComponent', () => {
    let component;
    let fixture;
    beforeEach((0, testing_1.waitForAsync)(() => {
        testing_1.TestBed.configureTestingModule({
            declarations: [home_component_1.HomeComponent],
            imports: [core_1.TranslateModule.forRoot(), testing_2.RouterTestingModule]
        }).compileComponents();
        fixture = testing_1.TestBed.createComponent(home_component_1.HomeComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));
    it('should create', () => {
        expect(component).toBeTruthy();
    });
    it('should render title in a h1 tag', (0, testing_1.waitForAsync)(() => {
        const compiled = fixture.debugElement.nativeElement;
        expect(compiled.querySelector('h1').textContent).toContain('PAGES.HOME.TITLE');
    }));
});
//# sourceMappingURL=home.component.spec.js.map
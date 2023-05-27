"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@angular/core/testing");
const detail_component_1 = require("./detail.component");
const core_1 = require("@ngx-translate/core");
const testing_2 = require("@angular/router/testing");
describe('DetailComponent', () => {
    let component;
    let fixture;
    beforeEach((0, testing_1.waitForAsync)(() => {
        testing_1.TestBed.configureTestingModule({
            declarations: [detail_component_1.DetailComponent],
            imports: [core_1.TranslateModule.forRoot(), testing_2.RouterTestingModule]
        }).compileComponents();
        fixture = testing_1.TestBed.createComponent(detail_component_1.DetailComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));
    it('should create', () => {
        expect(component).toBeTruthy();
    });
    it('should render title in a h1 tag', (0, testing_1.waitForAsync)(() => {
        const compiled = fixture.debugElement.nativeElement;
        expect(compiled.querySelector('h1').textContent).toContain('PAGES.DETAIL.TITLE');
    }));
});
//# sourceMappingURL=detail.component.spec.js.map
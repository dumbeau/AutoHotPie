"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@angular/core/testing");
const page_not_found_component_1 = require("./page-not-found.component");
describe('PageNotFoundComponent', () => {
    let component;
    let fixture;
    beforeEach((0, testing_1.waitForAsync)(() => {
        testing_1.TestBed.configureTestingModule({
            declarations: [page_not_found_component_1.PageNotFoundComponent]
        })
            .compileComponents();
        fixture = testing_1.TestBed.createComponent(page_not_found_component_1.PageNotFoundComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));
    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
//# sourceMappingURL=page-not-found.component.spec.js.map
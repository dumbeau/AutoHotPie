"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@angular/core/testing");
const testing_2 = require("@angular/router/testing");
const app_component_1 = require("./app.component");
const core_1 = require("@ngx-translate/core");
const services_1 = require("./core/services");
describe('AppComponent', () => {
    beforeEach((0, testing_1.waitForAsync)(() => {
        testing_1.TestBed.configureTestingModule({
            declarations: [app_component_1.AppComponent],
            providers: [services_1.ElectronService],
            imports: [testing_2.RouterTestingModule, core_1.TranslateModule.forRoot()]
        }).compileComponents();
    }));
    it('should create the app', (0, testing_1.waitForAsync)(() => {
        const fixture = testing_1.TestBed.createComponent(app_component_1.AppComponent);
        const app = fixture.debugElement.componentInstance;
        expect(app).toBeTruthy();
    }));
});
//# sourceMappingURL=app.component.spec.js.map
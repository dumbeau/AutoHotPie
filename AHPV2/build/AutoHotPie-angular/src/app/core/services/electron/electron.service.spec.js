"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@angular/core/testing");
const electron_service_1 = require("./electron.service");
describe('ElectronService', () => {
    beforeEach((0, testing_1.waitForAsync)(() => testing_1.TestBed.configureTestingModule({})));
    it('should be created', () => {
        const service = testing_1.TestBed.get(electron_service_1.ElectronService);
        expect(service).toBeTruthy();
    });
});
//# sourceMappingURL=electron.service.spec.js.map
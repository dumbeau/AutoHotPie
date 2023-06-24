"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const playwright_1 = require("playwright");
const test_1 = require("@playwright/test");
const PATH = require('path');
test_1.test.describe('Check Home Page', async () => {
    let app;
    let firstWindow;
    let context;
    test_1.test.beforeAll(async () => {
        app = await playwright_1._electron.launch({ args: [PATH.join(__dirname, '../app/main.js'), PATH.join(__dirname, '../app/package.json')] });
        context = app.context();
        await context.tracing.start({ screenshots: true, snapshots: true });
        firstWindow = await app.firstWindow();
        await firstWindow.waitForLoadState('domcontentloaded');
    });
    (0, test_1.test)('Launch electron app', async () => {
        const windowState = await app.evaluate(async (process) => {
            const mainWindow = process.BrowserWindow.getAllWindows()[0];
            const getState = () => ({
                isVisible: mainWindow.isVisible(),
                isDevToolsOpened: mainWindow.webContents.isDevToolsOpened(),
                isCrashed: mainWindow.webContents.isCrashed(),
            });
            return new Promise((resolve) => {
                if (mainWindow.isVisible()) {
                    resolve(getState());
                }
                else {
                    mainWindow.once('ready-to-show', () => setTimeout(() => resolve(getState()), 0));
                }
            });
        });
        (0, test_1.expect)(windowState.isVisible).toBeTruthy();
        (0, test_1.expect)(windowState.isDevToolsOpened).toBeFalsy();
        (0, test_1.expect)(windowState.isCrashed).toBeFalsy();
    });
    // test('Check Home Page design', async ({ browserName}) => {
    //   // Uncomment if you change the design of Home Page in order to create a new screenshot
    //   const screenshot = await firstWindow.screenshot({ path: '/tmp/home.png' });
    //   expect(screenshot).toMatchSnapshot(`home-${browserName}.png`);
    // });
    (0, test_1.test)('Check title', async () => {
        const elem = await firstWindow.$('app-home h1');
        const text = await elem.innerText();
        (0, test_1.expect)(text).toBe('App works !');
    });
    test_1.test.afterAll(async () => {
        await context.tracing.stop({ path: 'e2e/tracing/trace.zip' });
        await app.close();
    });
});
//# sourceMappingURL=main.spec.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AHPSettings = void 0;
const KeyEvent_1 = require("../nativeAPI/KeyEvent");
const electron_1 = require("electron");
const Store = require("electron-store");
const SettingsConstants_1 = require("../constants/SettingsConstants");
class AHPSettings {
    /**
     * store.get('') will return the value of the key
     * store.set('', [value]) will set the value of the key
     * Details could be found here: https://github.com/sindresorhus/electron-store#readme
     */
    static get store() {
        if (AHPSettings.ahpSettings === undefined) {
            const schema = {
                pieMenuCancelKey: {
                    type: 'object',
                    default: new KeyEvent_1.KeyEvent(KeyEvent_1.RespondType.MOUSE_DOWN, 'Right')
                },
                settingsVersion: {
                    type: 'string',
                    default: '0.0.0' // 0.0.0 means the settings is first created. i.e. the user is using the app for the first time.
                },
                runOnStartup: {
                    type: 'boolean',
                    default: true
                },
                runOnAppQuit: {
                    type: 'boolean',
                    default: true
                }
            };
            // Set the path of the settings file to be in the userData folder of AHPv3
            // This is to ensure the path is correct no matter when ahpSettings is initialized
            electron_1.app.setPath("userData", SettingsConstants_1.SettingsConstants.DEFAULT_SETTINGS_PATH);
            AHPSettings.ahpSettings = new Store({
                schema
            });
        }
        return AHPSettings.ahpSettings;
    }
}
exports.AHPSettings = AHPSettings;
AHPSettings.PIE_MENU_CANCEL_KEY = 'pieMenuCancelKey';
AHPSettings.SETTINGS_VERSION = 'settingsVersion';
AHPSettings.RUN_ON_STARTUP = 'runOnStartup';
AHPSettings.RUN_ON_APP_QUIT = 'runOnAppQuit';
//# sourceMappingURL=AHPSettings.js.map
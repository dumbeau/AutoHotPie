import {Schema} from "electron-store";
import {app} from "electron";
import * as Store from "electron-store";
import {SettingsConstants} from "../constants/SettingsConstants";
import {KeyEvent, RespondType} from "mousekeyhook.js";

interface AHPSettingsSchema {
  pieMenuCancelKey: string;
  settingsVersion: string;
  runOnStartup: boolean;
  runOnAppQuit: boolean;
}

const schema: Schema<AHPSettingsSchema> = {
  pieMenuCancelKey: {
    type: 'object',
    default: new KeyEvent(RespondType.MOUSE_DOWN, 'Right')
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
app.setPath("userData", SettingsConstants.DEFAULT_SETTINGS_PATH);

/**
 * ahpSettings.get('') will return the value of the key
 * ahpSettings.set('', [value]) will set the value of the key
 * Details could be found here: https://github.com/sindresorhus/electron-store#readme
 */
export const ahpSettings = new Store<AHPSettingsSchema>({
  schema
});

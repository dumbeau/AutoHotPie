import * as fs from "fs";
import {Settings} from "./Settings";
import {SettingsConstants} from "../constants/SettingsConstants";

const AHP_SETTINGS_FILENAME = "settings.json";

/**
 * TODO: Remove this class if no usage
 * @deprecated The project is migrating to dexie which uses indexedDB instead of JSON files
 */
export class Preferences {
  static init() {
    console.warn('⚠️⚠️⚠️Class Preferences is deprecated and will be removed after 30th June 2023. ' +
      'Please migrate to using ahpSettings object (which is based on electron-store) before the deadline.');
    if (!fs.existsSync(SettingsConstants.DEFAULT_SETTINGS_PATH)) {
      fs.mkdirSync(SettingsConstants.DEFAULT_SETTINGS_PATH);
    }
    if (!fs.existsSync(SettingsConstants.DEFAULT_SETTINGS_PATH + AHP_SETTINGS_FILENAME)) {
      fs.writeFileSync(SettingsConstants.DEFAULT_SETTINGS_PATH + AHP_SETTINGS_FILENAME, (new Settings()).toJsonString());
    }
  }

  static getAHPSettings(): JSON {
    console.warn('⚠️⚠️⚠️Class Preferences is deprecated and will be removed after 30th June 2023. ' +
      'Please migrate to using ahpSettings object (which is based on electron-store) before the deadline.');
    return JSON.parse(fs.readFileSync(SettingsConstants.DEFAULT_SETTINGS_PATH + AHP_SETTINGS_FILENAME, 'utf8'));
  }

}

import * as fs from "fs";
import {Settings} from "./Settings";

const AHP_SETTINGS_FILENAME = "settings.json";
const USER_SETTINGS_PATH = process.env.APPDATA + '/AHP/';

/**
 * @deprecated The project is migrating to dexie which uses indexedDB instead of JSON files
 */
export class Preferences {
  static init() {
    if (!fs.existsSync(process.env.APPDATA + '/AHP/')) {
      fs.mkdirSync(process.env.APPDATA + '/AHP');
    }
    if (!fs.existsSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME)) {
      fs.writeFileSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME, (new Settings()).toJsonString());
    }
  }

  static getAHPSettings(): JSON {
    return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME, 'utf8'));
  }

}

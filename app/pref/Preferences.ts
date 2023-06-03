import * as fs from "fs";

const AHP_SETTINGS_FILENAME = "settings.json"
const PROFILE_SETTINGS_FILENAME = "profiles.json"
const PIE_MENU_SETTINGS_FILENAME = "pieMenus.json"
const PIE_ITEMS_SETTINGS_FILENAME = "pieItems.json"
const USER_SETTINGS_PATH = process.env.APPDATA + '/AHP/';

export class Preferences {
    static init() {
        if (!fs.existsSync(process.env.APPDATA + '/AHP/')) {
            fs.mkdirSync(process.env.APPDATA + '/AHP');
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME)) {
            fs.copyFileSync(__dirname + '/' + AHP_SETTINGS_FILENAME.replace(".json", ".template.json"),
                USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME);
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME)) {
            fs.copyFileSync(__dirname + '/' + PROFILE_SETTINGS_FILENAME.replace(".json", ".template.json"),
                USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME);
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME)) {
            fs.copyFileSync(__dirname + '/' + PIE_MENU_SETTINGS_FILENAME.replace(".json", ".template.json"),
                USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME);
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PIE_ITEMS_SETTINGS_FILENAME)) {
            fs.copyFileSync(__dirname + '/' + PIE_ITEMS_SETTINGS_FILENAME.replace(".json", ".template.json"),
                USER_SETTINGS_PATH + PIE_ITEMS_SETTINGS_FILENAME);
        }
    }

    static getAHPSettings(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME, 'utf8'));
    }

    static getProfiles(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, 'utf8'));
    }

    static getPieMenus(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME, 'utf8'));
    }
}

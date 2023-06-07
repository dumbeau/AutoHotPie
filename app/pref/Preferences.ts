import * as fs from "fs";
import {Profile} from "../../src/preferences/Profile";
import {PieMenu} from "../../src/preferences/PieMenu";
import {PieItem} from "../../src/preferences/PieItem";
import {Settings} from "../../src/preferences/Settings";
import {UserDataObject} from "../../src/preferences/UserDataObject";

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
            fs.writeFileSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME, (new Settings()).toJsonString());
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME)) {
            fs.writeFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, (new Profile()).toJsonString());
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME)) {
            fs.writeFileSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME, (new PieMenu()).toJsonString());
        }
        if (!fs.existsSync(USER_SETTINGS_PATH + PIE_ITEMS_SETTINGS_FILENAME)) {
            fs.writeFileSync(USER_SETTINGS_PATH + PIE_ITEMS_SETTINGS_FILENAME,
                PieItem.create("1", "New Pie Item", true, [], "", true).toJsonString());

        }
    }

    static getAHPSettings(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + AHP_SETTINGS_FILENAME, 'utf8'));
    }

    private static getAllProfilesInJSON(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, 'utf8'))
    }

    private static getAllPieMenusInJSON(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME, 'utf8'))
    }

    private static getAllPieItemsInJSON(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PIE_ITEMS_SETTINGS_FILENAME, 'utf8'))
    }

    static getProfile(id: string): Profile {
        const profile =
            "{\"" + id + "\":" + JSON.stringify(Preferences.getAllProfilesInJSON()[id as keyof JSON]) + "}";
        return Profile.fromJsonString(profile);
    }

    static getPieMenu(id: string): PieMenu {
        const profile =
            "{\"" + id + "\":" + JSON.stringify(Preferences.getAllPieMenusInJSON()[id as keyof JSON]) + "}";

        console.log("Preferences.getPieMenu: " + profile);

        return PieMenu.fromJsonString(profile);
    }

    static getPieItem(id: string) {
        const pieItems =
            "{\"" + id + "\":" + JSON.stringify(Preferences.getAllPieItemsInJSON()[id as keyof JSON]) + "}";
        return PieItem.fromJsonString(pieItems);
    }

    static getProfileIds(): string[] {
        return Object.keys(JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, 'utf8')));
    }

    static addPieMenuToProfile(profileId: string, pieMenuId: string) {
        const profile = Preferences.getProfile(profileId);
        profile.pieMenus.push(pieMenuId);
        Preferences.setUserData(profile);
    }

    /**
     * Updates the settings file for the given userData or creates a new one if it doesn't exist
     * @param userData
     */
    static setUserData(userData: UserDataObject) {
        let settingsFilename: string;

        let userDataRecords: Record<string, any>;

        if (userData instanceof Profile) {
            settingsFilename = PROFILE_SETTINGS_FILENAME;
            userDataRecords = Preferences.getAllProfilesInJSON();
        } else if (userData instanceof PieMenu) {
            settingsFilename = PIE_MENU_SETTINGS_FILENAME;
            userDataRecords = Preferences.getAllPieMenusInJSON();
        } else if (userData instanceof PieItem) {
            settingsFilename = PIE_ITEMS_SETTINGS_FILENAME;
            userDataRecords = Preferences.getAllPieItemsInJSON();
        } else {
            console.error("userData is either null or not a valid subclass of UserDataObject")
            console.error("Aborting updateUserData")
            return;
        }

        userDataRecords[userData.id] = Object.fromEntries(userData.toMap());

        console.log(JSON.stringify(userDataRecords));

        fs.writeFileSync(USER_SETTINGS_PATH + settingsFilename, JSON.stringify(userDataRecords));
    }
}

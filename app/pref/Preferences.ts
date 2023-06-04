import * as fs from "fs";
import {Profile} from "../../src/preferences/Profile";
import {PieMenu} from "../../src/preferences/PieMenu";
import {PieItem} from "../../src/preferences/PieItem";
import {Settings} from "../../src/preferences/Settings";

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

    static getProfileIds(): string[] {
        return Object.keys(JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, 'utf8')));
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

    static addPieMenuToProfile(profileId: string, pieMenuId: string) {
        const profile = Preferences.getProfile(profileId);
        profile.pieMenus.push(pieMenuId);
        Preferences.updateProfile(profile);
    }

    static getPieMenu(id: string): PieMenu {
        const profile =
            "{\"" + id + "\":" + JSON.stringify(Preferences.getAllPieMenusInJSON()[id as keyof JSON]) + "}";

        console.log("Preferences.getPieMenu: " + profile);

        return PieMenu.fromJsonString(profile);
    }

    static getPieMenus(): JSON {
        return JSON.parse(fs.readFileSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME, 'utf8'));
    }

    static addPieMenu(pieMenu: PieMenu) {
        const pieMenus: Record<string, any> = Preferences.getPieMenus();

        pieMenus[pieMenu.id] = Object.fromEntries(pieMenu.toMap());

        console.log("Preferences.addPieMenu: " + JSON.stringify(pieMenus));
        fs.writeFileSync(USER_SETTINGS_PATH + PIE_MENU_SETTINGS_FILENAME, JSON.stringify(pieMenus));
    }

    static addProfile(profile: Profile) {
        const profiles: Record<string, any> = Preferences.getAllProfilesInJSON();

        profiles[profile.id] = Object.fromEntries(profile.toMap());

        console.log("P")
        console.log("" + JSON.stringify(profiles));
        fs.writeFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, JSON.stringify(profiles));
    }

    static updateProfile(profile: Profile) {
        const profiles: Record<string, any> = Preferences.getAllProfilesInJSON();

        profiles[profile.id] = Object.fromEntries(profile.toMap());

        console.log(JSON.stringify(profiles));
        fs.writeFileSync(USER_SETTINGS_PATH + PROFILE_SETTINGS_FILENAME, JSON.stringify(profiles));
    }

    static getPieItem(id: string) {
        const pieItems =
            "{\"" + id + "\":" + JSON.stringify(Preferences.getAllPieItemsInJSON()[id as keyof JSON]) + "}";
        return PieItem.fromJsonString(pieItems);
    }
}

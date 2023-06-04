import {DataObject} from './DataObject';

export class Profile extends DataObject{
    exePath = '';
    iconPath = '';
    pieMenus: string[] = ['default'];

    constructor() {
        super();
        this.id = 'global';
        this.name = 'Global Profile';
        this.enabled = true;

    }

    static create(id: string, name: string, enabled: boolean, pieMenus: string[], exePath: string, iconPath: string) {
        const prof = new Profile();

        prof.id = id;
        prof.name = name;
        prof.enabled = enabled;
        prof.pieMenus = pieMenus;
        prof.exePath = exePath;
        prof.iconPath = iconPath;

        return prof;
    }

    static fromJsonString(jsonString: string) {
        console.log('Profile.fromJsonString() called with ' + jsonString);

        try {
            const json = JSON.parse(jsonString);

            const id = Object.keys(json)[0];
            const profJson = json[id];
            return Profile.create(id, profJson.name, profJson.enabled, profJson.pieMenus, profJson.exePath, profJson.iconPath);
        } catch (e) {
            console.error('Profile.fromJsonString() failed to parse JSON: ' + e);
            return new Profile();
        }
    }
}

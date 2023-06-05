import {UserDataObject} from './UserDataObject';

/**
 * This class defines the structure of the Profile JSON object which will be stored in the AppData directory.
 * It also contains methods for manipulating the profiles.
 */
export class Profile extends UserDataObject{
    exePath = '';
    iconBase64 = '';
    pieMenus: string[] = ['default'];

    /**
     * Creates a new Profile object with default values.
     *
     * This constructor is intended to be used to create the very first profile, which is the global profile, for
     * new users.
     *
     * **_It is strongly recommended to use the static create() method instead of this constructor._**
     */
    constructor() {
        super();
        this.id = 'global';
        this.name = 'Global Profile';
        this.enabled = true;

    }

    /**
     * Creates a new Profile object with the specified values.
     * @param id
     * @param name
     * @param enabled
     * @param pieMenus
     * @param exePath
     * @param iconPath
     */
    static create(id: string, name: string, enabled: boolean, pieMenus: string[], exePath: string, iconPath: string) {
        const prof = new Profile();

        prof.id = id;
        prof.name = name;
        prof.enabled = enabled;
        prof.pieMenus = pieMenus;
        prof.exePath = exePath;
        prof.iconBase64 = iconPath;

        return prof;
    }

    /**
     * Creates a new Profile object from the specified JSON string.
     *
     * @param jsonString The JSON string must be in the format: {[id]: {...all other properties of Profile...}}
     */
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

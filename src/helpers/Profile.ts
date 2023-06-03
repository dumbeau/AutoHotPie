// TODO: This class is still under its design stage.
export class Profile {
    id = 'global';
    name = 'Global Profile';
    enabled = true;
    ahkHandles = ['regApps'];
    useProfileToggle = false;
    profileToggleHotkey = 'capslock';
    pieMenus: string[] = [];

    static fromJsonString(jsonString: string) {
        const profJson = JSON.parse(jsonString);

        const prof = new Profile();
        prof.id = profJson.id;
        prof.name = profJson.name;
        prof.enabled = profJson.enabled;
        prof.ahkHandles = profJson.ahkHandles;
        prof.useProfileToggle = profJson.useProfileToggle;
        prof.profileToggleHotkey = profJson.profileToggleHotkey;
        prof.pieMenus = profJson.pieMenus;

        return prof;
    }

    toJsonString() {
        return JSON.stringify(this);
    }
}

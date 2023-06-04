export abstract class DataObject {
    id = 'default';
    name = 'Default';
    enabled = true;

    toJsonString() {
        const profile = new Map<string, any>();

        profile.set(this.id, Object.fromEntries(this.toMap()));

        return JSON.stringify(Object.fromEntries(profile));
    }

    toMap() {
        const map = new Map<string, any>();
        const {...object} = this;
        Object.entries(object).forEach(([key, value]) => {
            if (key !== 'id') {
                map.set(key, value);
            }
        });
        return map;
    }
}

export class Settings{
    runOnStartup = true;

    fromJsonString(jsonString: string) {
        try {
            const json = JSON.parse(jsonString);
            this.runOnStartup = json.runOnStartup;
        } catch (e) {
            console.error('Settings.fromJsonString() failed to parse JSON: ' + e);
        }
    }

    toJsonString() {
        return JSON.stringify(this);
    }
}

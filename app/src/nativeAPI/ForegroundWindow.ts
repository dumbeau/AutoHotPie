export class ForegroundWindow {
    title: string;
    exePath: string;
    iconBase64: string;

    private constructor(title: string, exePath: string, iconBase64: string) {
        this.title = title;
        this.exePath = exePath;
        this.iconBase64 = iconBase64;
    }

    static fromJsonString(jsonString: string) {
        try {
            const json = JSON.parse(jsonString);

            return new ForegroundWindow(
                json.title,
                json.exePath,
                json.iconBase64);
        } catch (e) {
            console.error('Error parsing ForegroundWindow JSON: ' + e);
            console.error('JSON: ' + jsonString);
        }
    }

    private static create(title: string, exePath: string, iconBase64: string) {
        return new ForegroundWindow(title, exePath, iconBase64);
    }

    toJSONString() {
        return JSON.stringify(this);
    }
}

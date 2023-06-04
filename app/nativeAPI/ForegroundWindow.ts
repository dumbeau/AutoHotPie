export class ForegroundWindow {
    title: string | undefined;
    exePath: string | undefined;

    static fromJsonString(jsonString: string) {
        try {
            const json = JSON.parse(jsonString);

            return ForegroundWindow.create(
                json.title,
                json.exePath);
        } catch (e) {
            console.error('Error parsing ForegroundWindow JSON: ' + e);
            console.error('JSON: ' + jsonString);
        }
    }

    private static create(title: string, exePath: string) {
        const foregroundWindow = new ForegroundWindow();

        foregroundWindow.title = title;
        foregroundWindow.exePath = exePath;

        return foregroundWindow;
    }
}

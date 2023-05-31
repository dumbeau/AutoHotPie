export enum ActivationMode {
    // eslint-disable-next-line @typescript-eslint/naming-convention
    RELEASE_THAN_HOVER, HOVER_ALL, CLICK_ALL, RELEASE_ON_FUNCTION
}
export class PieMenu {
    id = '0';
    name = 'default pie menu';
    enabled = true;
    labelDelaySeconds = 1;
    activationMode = ActivationMode.RELEASE_ON_FUNCTION;
    cancelOnEscape = false;
    cancelRadius = 150;
    openInScreenCenter = false;
    hotkey = 'ctrl+r';
    backgroundColor = '#232323';
    selectionColor = '#1cd4dc';
    fontColor = '#ffffff';
    radius = 16;
    thickness = 10;
    labelCornerRadius = 77;
    pieItems = ['1', '2', '3', '4', '5', '6'];

    // TODO: Please check if the missing properties are needed. If so, it would be helpful to add them back with comments.

    static fromJsonString(jsonString: string): PieMenu {
        const pieMenu = new PieMenu();
        const json = JSON.parse(jsonString);
        pieMenu.id = json.id;
        pieMenu.name = json.name;
        pieMenu.enabled = json.enabled;
        pieMenu.labelDelaySeconds = json.labelDelaySeconds;
        pieMenu.activationMode = json.activationMode;
        pieMenu.cancelOnEscape = json.cancelOnEscape;
        pieMenu.cancelRadius = json.cancelRadius;
        pieMenu.openInScreenCenter = json.openInScreenCenter;
        pieMenu.hotkey = json.hotkey;
        pieMenu.backgroundColor = json.backgroundColor;
        pieMenu.selectionColor = json.selectionColor;
        pieMenu.fontColor = json.fontColor;
        pieMenu.radius = json.radius;
        pieMenu.thickness = json.thickness;
        pieMenu.labelCornerRadius = json.labelCornerRadius;
        pieMenu.pieItems = json.pieItems;
        return pieMenu;
    }

    toJsonString(): string {
        return JSON.stringify(this);
    }
}

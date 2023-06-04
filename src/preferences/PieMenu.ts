import {DataObject} from './DataObject';

export enum ActivationMode {
    // eslint-disable-next-line @typescript-eslint/naming-convention
    RELEASE_THAN_HOVER, HOVER_ALL, CLICK_ALL, RELEASE_ON_FUNCTION
}

export class PieMenu extends DataObject {
    activationMode = ActivationMode.RELEASE_ON_FUNCTION;
    hotkey = 'Shift+Control+Alt+P';
    escapeRadius = -1;
    openInScreenCenter = false;
    selectionColor = '#ffffff';
    pieItems = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    constructor() {
        super();
        this.id = 'default';
        this.name = 'Default';
        this.enabled = true;

    }
    static create(id: string,
                  name: string,
                  enabled: boolean,
                  activationMode: ActivationMode,
                  hotkey: string,
                  escapeRadius: number,
                  openInScreenCenter: boolean,
                  selectionColor: string,
                  pieItems: string[]) {

        const pieMenu = new PieMenu();

        pieMenu.id = id;
        pieMenu.name = name;
        pieMenu.enabled = enabled;
        pieMenu.activationMode = activationMode;
        pieMenu.hotkey = hotkey;
        pieMenu.escapeRadius = escapeRadius;
        pieMenu.openInScreenCenter = openInScreenCenter;
        pieMenu.pieItems = pieItems;
        pieMenu.selectionColor = selectionColor;

        return pieMenu;
    }

    static fromJsonString(jsonString: string) {
        const id = Object.keys(JSON.parse(jsonString))[0];
        const json = JSON.parse(jsonString)[id];

        return PieMenu.create(
            id,
            json.name,
            json.enabled,
            json.activationMode,
            json.hotkey,
            json.escapeRadius,
            json.openInScreenCenter,
            json.selectionColor,
            json.pieItems);
    }
}

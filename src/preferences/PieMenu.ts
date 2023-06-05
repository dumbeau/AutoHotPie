import {UserDataObject} from './UserDataObject';

export enum ActivationMode {
    // eslint-disable-next-line @typescript-eslint/naming-convention
    RELEASE_THAN_HOVER, HOVER_ALL, CLICK_ALL, RELEASE_ON_FUNCTION
}

/**
 * This class defines the structure of the PieMenu JSON object which will be stored in the AppData directory.
 * It also contains methods for manipulating the pie menus.
 */
export class PieMenu extends UserDataObject {
    activationMode = ActivationMode.RELEASE_ON_FUNCTION;
    hotkey = 'Shift+Control+Alt+P';
    escapeRadius = -1;
    openInScreenCenter = false;
    selectionColor = '#ffffff';
    pieItems = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    /**
     * Creates a new PieMenu object with default values.
     *
     * This constructor is intended to be used to create a default pie menu for new users.
     *
     * **_It is strongly recommended to use the static create() method instead of this constructor._**
     */
    constructor() {
        super();
        this.id = 'default';
        this.name = 'Default';
        this.enabled = true;

    }

    /**
     * Creates a new PieMenu object with the specified values.
     *
     * @param id
     * @param name
     * @param enabled
     * @param activationMode
     * @param hotkey
     * @param escapeRadius
     * @param openInScreenCenter
     * @param selectionColor
     * @param pieItems
     */
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

    /**
     * Creates a new PieMenu object from the specified JSON string.
     *
     * @param jsonString The JSON string must be in the format: {[id]: {...all other properties of PieMenu...}}
     */
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

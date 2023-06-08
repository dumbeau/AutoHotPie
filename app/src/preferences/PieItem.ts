import {UserDataObject} from './UserDataObject';
import {Action} from './Action';

/**
 * This class defines the structure of the PieItem JSON object which will be stored in the AppData directory.
 * It also contains methods for manipulating the PieItems.
 */
export class PieItem extends UserDataObject {
    actions: Action[] = [];
    iconPath = '';
    useIconColor = false;

    /**
     * Creates a new PieItem object with default values.
     *
     * This constructor is intended to be used to create a default pie item for new users.
     *
     * **_It is strongly recommended to use the static create() method instead of this constructor._**
     */
    constructor() {
        super(Date.now().toString(), 'New Pie Item');
    }

    /**
     * Creates a new PieItem object with the specified values.
     * @param id
     * @param name
     * @param enabled
     * @param actions
     * @param iconPath
     * @param useIconColor
     */
    static create(id: string, name: string, enabled: boolean, actions: Action[], iconPath: string, useIconColor: boolean) {

        const pieItem = new PieItem();

        pieItem.id = id;
        pieItem.name = name;
        pieItem.enabled = enabled;
        pieItem.actions = actions;
        pieItem.iconPath = iconPath;
        pieItem.useIconColor = useIconColor;

        return pieItem;
    }

    /**
     * Creates a new PieItem object from the specified JSON string.
     *
     * @param jsonString The JSON string must be in the format: {[id]: {...all other properties of PieItem...}}
     */
    static fromJsonString(jsonString: string) {
        try {
            const id = Object.keys(JSON.parse(jsonString))[0];
            const json = JSON.parse(jsonString)[id];

            const actions: Action[] = [];
            json.actions.forEach((action: any) => {
                actions.push(Action.fromJSON(action));
            });

            return PieItem.create(
                id,
                json.name,
                json.enabled,
                actions,
                json.iconPath,
                json.useIconColor);
        } catch (e) {
            console.error('Error parsing PieItem JSON: ' + e);
            console.error('JSON: ' + jsonString);
        }
    }
}

import {DataObject} from './DataObject';
import {Action} from './Action';
export class PieItem extends DataObject {
    actions: Action[] = [];
    iconPath = '';
    useIconColor = false;

    constructor() {
        super();
        this.id = Date.now().toString();
        this.name = 'New Pie Item';
        this.enabled = true;
    }
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

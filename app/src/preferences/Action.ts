enum ActionType {
    sendkey = 'SEND_KEY',
    sendtext = 'SEND_TEXT',
    mouseclick = 'MOUSE_CLICK',
    command = 'COMMAND',
    openfolder = 'OPEN_FOLDER',
    submenu = 'SUB_MENU',
    resizewindow = 'RESIZE_WINDOW',
    movewindow = 'MOVE_WINDOW',
    openurl = 'OPEN_URL',
    switchapp = 'SWITCH_APP',
    none = 'NONE',
}

export abstract class Action {
    type: ActionType;
    delay: number;
    repeat: number;

    protected constructor(type: ActionType, delay: number, repeat: number) {
        this.type = type;
        this.delay = delay;
        this.repeat = repeat;
    }

    static fromJSON(json: any) {
        switch (json.type as ActionType) {
            case ActionType.sendkey:
                return new SendKeyAction(json.sendKey, json.delay, json.repeat, json.holdTime);
            case ActionType.command:
                return new CommandAction(json.command, json.delay, json.repeat);
            case ActionType.movewindow:
                // TODO: implement
                break;
            case ActionType.resizewindow:
                return new ResizeWindowAction(json.width, json.height, json.delay);
            case ActionType.openurl:
                return new OpenUrlAction(json.url, json.delay, json.repeat);
            case ActionType.switchapp:
                return new SwitchAppAction(json.exePath, json.newWindow, json.delay, json.repeat);
            case ActionType.openfolder:
                return new OpenFolderAction(json.path, json.delay, json.repeat);
            case ActionType.submenu:
                return new SubMenuAction(json.subMenuId, json.delay);
            case ActionType.sendtext:
                return new SendTextAction(json.sendText, json.delay, json.repeat, json.holdTime);
        }
        return new None();
    }

    abstract execute(): void;
}

export class SendKeyAction extends Action {
    sendKey = '';
    holdTime = 0;
    constructor(sendKey: string, delay: number, repeat: number, holdTime: number) {
        super(ActionType.sendkey, delay, repeat);
        this.sendKey = sendKey;
        this.holdTime = holdTime;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class SendTextAction extends Action {
    sendText = '';
    holdTime = 0;

    constructor(sendText: string, delay: number, repeat: number, holdTime: number) {
        super(ActionType.sendtext, delay, repeat);
        this.sendText = sendText;
        this.holdTime = holdTime;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}
export class MouseClickAction extends Action {
    holdTime = 0;
    sendClick = '';
    constructor(sendClick: string, delay: number, repeat: number, holdTime: number) {
        super(ActionType.mouseclick, delay, repeat);
        this.sendClick = sendClick;
        this.holdTime = holdTime;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class CommandAction extends Action {
    command = '';
    constructor(command: string, delay: number, repeat: number) {
        super(ActionType.command, delay, repeat);
        this.command = command;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class OpenFolderAction extends Action {
    folder = '';
    constructor(folder: string, delay: number, repeat: number) {
        super(ActionType.openfolder, delay, repeat);
        this.folder = folder;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class SubMenuAction extends Action {
    menuId = '';
    constructor(menuId: string, delay: number) {
        super(ActionType.submenu, delay, 1);
        this.menuId = menuId;
        this.delay = delay;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class ResizeWindowAction extends Action {
    width = 0;
    height = 0;
    constructor(width: number, height: number, delay: number) {
        super(ActionType.resizewindow, delay, 1);
        this.width = width;
        this.height = height;
        this.delay = delay;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class OpenUrlAction extends Action {
    url = '';
    constructor(url: string, delay: number, repeat: number) {
        super(ActionType.openurl, delay, repeat);
        this.url = url;
        this.delay = delay;
        this.repeat = repeat;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class SwitchAppAction extends Action {
    exePath = '';
    newWindow = false;
    constructor(exePath: string, delay: number, repeat: number, newWindow: boolean) {
        super(ActionType.switchapp, delay, repeat);
        this.exePath = exePath;
        this.delay = delay;
        this.repeat = repeat;
        this.newWindow = newWindow;
    }

    execute(): void {
        throw new Error('Method not implemented.');
    }
}

export class None extends Action {
    constructor() {
        super(ActionType.none, 0, 1);
    }
    execute(): void {
        throw new Error('Method not implemented.');
    }

}

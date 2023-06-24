"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.db = exports.AHPDB = exports.ActionType = void 0;
const dexie_1 = require("dexie");
var ActionType;
(function (ActionType) {
    ActionType["sendkey"] = "SEND_KEY";
    ActionType["sendtext"] = "SEND_TEXT";
    ActionType["mouseclick"] = "MOUSE_CLICK";
    ActionType["command"] = "COMMAND";
    ActionType["openfolder"] = "OPEN_FOLDER";
    ActionType["submenu"] = "SUB_MENU";
    ActionType["resizewindow"] = "RESIZE_WINDOW";
    ActionType["movewindow"] = "MOVE_WINDOW";
    ActionType["openurl"] = "OPEN_URL";
    ActionType["switchapp"] = "SWITCH_APP";
})(ActionType = exports.ActionType || (exports.ActionType = {}));
class AHPDatabase extends dexie_1.default {
    constructor() {
        super('myDatabase');
        this.version(1).stores({
            pieItem: "++id, name, enabled, *actions, iconPath, useIconColor",
            pieMenu: "++id, name, enabled, activationMode, hotkey, escapeRadius, openInScreenCenter, selectionColor, *pieItems",
            profile: "++id, name, enabled, *pieMenus, exePath, iconBase64",
        });
    }
}
exports.AHPDB = AHPDatabase;
exports.db = new AHPDatabase();
//# sourceMappingURL=AHPDatabase.js.map

import Dexie, {Table} from "dexie";
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
export interface PieItem {
  id?: number;
  name: string;
  enabled: boolean;
  actions: string[];
  iconPath: string;
  useIconColor: boolean;
}

export interface PieMenu {
  id?: number;
  name: string;
  enabled: boolean;
  activationMode: string;
  hotkey: string;
  escapeRadius: number;
  openInScreenCenter: boolean;
  selectionColor: string;
  pieItems: PieItem[];
}

export interface Profile {
  id?: number;
  name: string;
  enabled: boolean;
  pieMenus: PieMenu[];
  exePath: string;
  iconBase64: string;
}

export class AHPDB extends Dexie {
  // 'friends' is added by dexie when declaring the stores()
  // We just tell the typing system this is the case
  pieItem!: Table<PieItem>;
  pieMenu!: Table<PieMenu>;
  profile!: Table<Profile>;

  constructor() {
    super('myDatabase');
    this.version(1).stores({
      // TODO: Change the schema string to be directly generated from the interface
      pieItem: "++id, name, enabled, actions, iconPath, useIconColor",
      pieMenu: "++id, name, enabled, activationMode, hotkey, escapeRadius, openInScreenCenter, selectionColor, pieItems",
      profile: "++id, name, enabled, pieMenus, exePath, iconBase64",
    });
  }
}

export const db = new AHPDB();

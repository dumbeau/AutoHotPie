import Dexie, {Table} from "dexie";
import {PieItem} from "./PieItem";
import {PieMenu} from "./PieMenu";
import {Profile} from "./Profile";

export class AHPDatabase extends Dexie {
  pieItem!: Table<PieItem>;
  pieMenu!: Table<PieMenu>;
  profile!: Table<Profile>;

  constructor() {
    super('myDatabase');

    // If a data column is array, you have to add * in front of it.
    this.version(1).stores({
      pieItem: "++id, name, enabled, *actions, iconPath, useIconColor",
      pieMenu: "++id, name, enabled, activationMode, hotkey, escapeRadius, openInScreenCenter, selectionColor, *pieItems",
      profile: "++id, name, enabled, *pieMenus, *exes, iconBase64",
    });
  }
}

export const db = new AHPDatabase();

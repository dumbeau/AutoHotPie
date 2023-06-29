/**
 * TODO: Remove if no usage
 * The UserDataObject is the base class for all id-based
 * data structures that will be output to the user's appdata directory.
 *
 * @deprecated
 */
export abstract class UserDataObject {
  id: string;
  name: string;
  enabled = true;

  protected constructor(id: string, name: string) {
    console.warn('⚠️⚠️⚠️Class UserDataObject is deprecated and will be removed after 30th June 2023. Please migrate to dexie.js before the deadline.');
    this.id = id;
    this.name = name;
  }

  /**
   * Converts the DataObject to a JSON string. The JSON string is a map of the DataObject's id to the DataObject's other properties.
   *
   * @returns The JSON string will be in the format: {"[id]": {...all properties except id...}}
   */
  toJsonString() {
    console.warn('⚠️⚠️⚠️Class UserDataObject is deprecated and will be removed after 30th June 2023. Please migrate to dexie.js before the deadline.');

    const profile = new Map<string, any>();

    profile.set(this.id, Object.fromEntries(this.toMap()));

    return JSON.stringify(Object.fromEntries(profile));
  }

  /**
   * Converts the DataObject to a Map. The Map is a map of the DataObject's properties excluding the id.
   *
   * @returns
   */
  toMap() {
    console.warn('⚠️⚠️⚠️Class UserDataObject is deprecated and will be removed after 30th June 2023. Please migrate to dexie.js before the deadline.');

    const map = new Map<string, any>();
    const {...object} = this;
    Object.entries(object).forEach(([key, value]) => {
      if (key !== 'id') {
        map.set(key, value);
      }
    });
    return map;
  }
}

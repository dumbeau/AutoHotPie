/**
 * TODO: Remove this class if no usage
 * @deprecated
 */
export class Settings {
  runOnStartup = true;

  fromJsonString(jsonString: string) {
    console.warn('⚠️⚠️⚠️Class Settings is deprecated and will be removed after 30th June 2023. ' +
      'Please migrate to using ahpSettings object (which is based on electron-store) before the deadline.');

    try {
      const json = JSON.parse(jsonString);
      this.runOnStartup = json.runOnStartup;
    } catch (e) {
      console.error('Settings.fromJsonString() failed to parse JSON: ' + e);
    }
  }

  toJsonString() {
    console.warn('⚠️⚠️⚠️Class Settings is deprecated and will be removed after 30th June 2023. ' +
      'Please migrate to using ahpSettings object (which is based on electron-store) before the deadline.');
    return JSON.stringify(this);
  }
}

export abstract class PieItem1 {


  protected name: string;
  protected enabled: boolean;
  protected hotkey: string;
  // eslint-disable-next-line @typescript-eslint/ban-types
  private _onComplete: (() => void) | undefined;

  protected constructor(
    name: string,
    enabled: boolean,
    hotkey: string) {


    this.name = name;
    this.enabled = enabled;
    this.hotkey = hotkey;
  }
  set onComplete(value: (() => void)) {
    this._onComplete = value;
  }
}

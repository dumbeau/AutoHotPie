export interface IForegroundWindow {
  title: string;
  exePath: string;
  iconBase64: string;
}

export class ForegroundWindow implements IForegroundWindow {
  /**
   * Creates a new ForegroundWindow. Only intended for use within this class.
   * Please use the static create() method instead.
   * @param title
   * @param exePath
   * @param iconBase64
   * @private
   */
  constructor(
    public title: string,
    public exePath: string,
    public iconBase64: string) {
  }
}

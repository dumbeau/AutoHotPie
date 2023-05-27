export enum RespondType {
  KEYUP, KEYDOWN
}
export class GlobalHotkeyServiceRespond {
  private readonly _type: RespondType;
  private readonly _value: string;
  constructor(respond: string) {
    // TODO: decided the respond type of the respond string
    this._type = RespondType.KEYDOWN;

    // TODO: decided the respond string
    this._value = "";


  }

  get type(): RespondType {
    return this._type;
  }

  get value(): string {
    return this._value;
  }
}

export enum RespondType {
  KEY_UP = 'KEY_UP', KEY_DOWN = 'KEY_DOWN', MOUSE_UP = 'MOUSE_UP', MOUSE_DOWN = 'MOUSE_DOWN'
}

/**
 * This class is used to represent the response of the global hotkey service.
 * The constructor will parse the response string and decide the type of the response.
 * */
export class KeyEvent {
  private readonly _type: RespondType;
  private readonly _value: string;
  constructor(type: RespondType, value: string) {
    this._type = type;
    this._value = value;
  }

  public static fromString(respond: string){
      console.log("Creating KeyEvent object from string: " + respond);

      return new KeyEvent(respond.split(',')[0] as RespondType, respond.split(',')[1]);
  }

  get type(): RespondType {
    return this._type;
  }

  get value(): string {
    return this._value;
  }
}

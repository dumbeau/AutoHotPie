import {ActionType} from "./ActionType";

export function DeserializeAction<T>(json: string): T{
  return JSON.parse(json) as T;
}

export abstract class Action {
  type: ActionType;
  delay: number;
  repeat: number;

  protected constructor(type: ActionType, delay = 0, repeat = 1) {
    this.type = type;
    this.delay = delay;
    this.repeat = repeat;
  }

  abstract execute(): void;
}

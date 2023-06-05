export interface HotkeyEventListener {
  onKeyDown(key: string): void;
  onKeyUp(key: string): void;
}

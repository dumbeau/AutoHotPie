export interface PieMenu {
  id?: number;
  name: string;
  enabled: boolean;
  activationMode: string;
  hotkey: string;
  escapeRadius: number;
  openInScreenCenter: boolean;
  selectionColor: string;
  pieItems: number[];
}

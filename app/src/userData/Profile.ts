export interface Profile {
  id?: number;
  name: string;
  enabled: boolean;
  pieMenus: number[];
  exePath: string;
  iconBase64: string;
}

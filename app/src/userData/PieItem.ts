import {Action} from "../actions/Action";

export interface PieItem {
  id?: number;
  name: string;
  enabled: boolean;
  actions: Action[];
  iconPath: string;
  useIconColor: boolean;
}

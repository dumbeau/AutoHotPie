export enum PieMenuActivationMode {
  RELEASE_THEN_HOVER_OVER = "releaseThenHoverOver",
  HOVER_OVER_THEN_RELEASE = "hoverOverThenRelease",
  HOVER_OVER_ALL = "hoverOverAll",
  CLICK = "click"
}

export class PieMenu {
  constructor(
    public name = "New Pie Menu",
    public enabled = true,
    public activationMode = PieMenuActivationMode.HOVER_OVER_THEN_RELEASE,
    public hotkey = '',
    public escapeRadius = 0,
    public openInScreenCenter = false,
    public selectionColor = '',
    public pieItems: number[] = [],
    public id?: number
  ) {}
}

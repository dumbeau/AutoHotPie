export class Profile {
  constructor(
    public exePath: string,
    public iconBase64: string,
    public name = "New Profile",
    public enabled = true,
    public pieMenus: number[] = [],
    public id?: number
  ) {}
}

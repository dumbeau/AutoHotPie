// TODO: This class is still under its design stage. Replace it with the one from V2.
export class PieMenu {
  name: string;
  color: string;
  shortcut: string;

  constructor(name: string, color: string, shortcut: string) {
    this.name = name;
    this.color = color;
    this.shortcut = shortcut;

  }
  static fromProfId(id: number){
    return new PieMenu('a','a','a');
  }
}

export class PieMenuPreferences {
  name: string;
  color: string;
  shortcut: string;

  constructor(name: string, color: string, shortcut: string) {
    this.name = name;
    this.color = color;
    this.shortcut = shortcut;

  }
  static fromProfId(id: number){

    return new PieMenuPreferences('a','a','a');
  }
}

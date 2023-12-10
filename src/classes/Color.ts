class Color {
    constructor(color: string | [number, number, number] | [number, number, number, number]) {
        [this.r, this.g, this.b, this.a] = [0,0,0,0];
        if (typeof color === 'string') {
            this.setFromHex(color);
        } else if (color.length === 3) {
            this.r = color[0];
            this.g = color[1];
            this.b = color[2];
            this.a = 1;
        } else {
            this.r = color[0];
            this.g = color[1];
            this.b = color[2];
            this.a = color[3];
        }
    }
  
    r: number;
    g: number;
    b: number;
    a: number;  
  
    setFromHex(hex: string) {
        hex = hex.replace(/^#/, '');
        if (hex.length === 3) {
            hex = hex.split('').map(c => c + c).join('');
        }
        const num = parseInt(hex, 16);
        this.r = num >> 16;
        this.g = (num >> 8) & 0xff;
        this.b = num & 0xff;
        this.a = hex.length === 8 ? ((num >> 24) & 0xff) / 255 : 1;
    }
  
    toRgbArray(): number[] {
        return [this.r, this.g, this.b];
    }
  
    toRgbaArray(): number[] {
        return [this.r, this.g, this.b, this.a];
    }
  
    toRgbHex(): string {
        return `#${this.r.toString(16)}${this.g.toString(16)}${this.b.toString(16)}`;
    }
    
    toRgbaHex(): string {
        return `#${this.r.toString(16)}${this.g.toString(16)}${this.b.toString(16)}${Math.round(this.a * 255).toString(16)}`;
    }
  }
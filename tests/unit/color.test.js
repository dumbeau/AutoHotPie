import { describe, expect, it } from "vitest";
const { rgbToHex, hexToRgb, rgbLightness } = require("../../shared/color");

describe("color helpers", () => {
  it("converts rgb arrays to hex", () => {
    expect(rgbToHex([255, 0, 128, 255])).toBe("#ff0080");
  });

  it("converts hex to rgba arrays", () => {
    expect(hexToRgb("#00ff00")).toEqual([0, 255, 0, 255]);
  });

  it("computes relative lightness", () => {
    expect(rgbLightness([255, 255, 255])).toBeCloseTo(1, 5);
    expect(rgbLightness([0, 0, 0])).toBeCloseTo(0, 5);
  });
});

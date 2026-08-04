import { describe, expect, it } from "vitest";
const {
  calcAngle,
  cycleRange,
  extendAlongAngle,
} = require("../../shared/geometry");
const parity = require("../fixtures/js-ahk-parity.json");

describe("geometry helpers", () => {
  for (const sample of parity.calcAngle) {
    it(`calcAngle(${sample.a} -> ${sample.b})`, () => {
      expect(calcAngle(...sample.a, ...sample.b)).toBeCloseTo(sample.expected, 5);
    });
  }

  for (const sample of parity.cycleRange) {
    it(`cycleRange(${sample.num}, ${sample.range})`, () => {
      expect(cycleRange(sample.num, sample.range)).toBe(sample.expected);
    });
  }

  for (const sample of parity.extendAlongAngle) {
    it(`extendAlongAngle theta=${sample.theta}`, () => {
      expect(
        extendAlongAngle(sample.iPos, sample.theta, sample.distance)
      ).toEqual(sample.expected);
    });
  }
});

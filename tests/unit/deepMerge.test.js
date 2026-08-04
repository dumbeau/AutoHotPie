import { describe, expect, it } from "vitest";
const { deepMerge } = require("../../shared/deepMerge");

describe("deepMerge", () => {
  it("merges nested objects without dropping siblings", () => {
    const target = { a: 1, nested: { x: 1, y: 2 } };
    const result = deepMerge(target, { nested: { y: 9, z: 3 }, b: 2 });
    expect(result).toEqual({ a: 1, b: 2, nested: { x: 1, y: 9, z: 3 } });
  });

  it("returns target when source is nullish", () => {
    const target = { a: 1 };
    expect(deepMerge(target, null)).toBe(target);
  });

  it("replaces arrays instead of merging by index", () => {
    const result = deepMerge({ list: [1, 2] }, { list: [3] });
    expect(result.list).toEqual([3]);
  });
});

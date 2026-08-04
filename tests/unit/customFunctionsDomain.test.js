import { describe, expect, it } from "vitest";
const {
  normalizeCustomFunctions,
  upsertCustomFunction,
} = require("../../shared/customFunctions");

describe("customFunctions domain helpers", () => {
  it("normalizes missing custom lists to empty arrays", () => {
    expect(normalizeCustomFunctions(null)).toEqual([]);
    expect(normalizeCustomFunctions(undefined)).toEqual([]);
  });

  it("maps custom functions through a constructor-like function", () => {
    const mapped = normalizeCustomFunctions([{ name: "A" }], (item) => ({
      ...item,
      id: "1",
    }));
    expect(mapped).toEqual([{ name: "A", id: "1" }]);
  });

  it("upserts by id without dropping siblings", () => {
    const next = upsertCustomFunction(
      [
        { id: "a", name: "One" },
        { id: "b", name: "Two" },
      ],
      { id: "b", name: "Two Updated" }
    );
    expect(next).toEqual([
      { id: "a", name: "One" },
      { id: "b", name: "Two Updated" },
    ]);
  });
});

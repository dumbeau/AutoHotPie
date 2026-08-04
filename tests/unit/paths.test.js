import { describe, expect, it } from "vitest";
const fs = require("fs");
const os = require("os");
const path = require("path");
const { resolvePieMenuPaths, getUserDataFolder } = require("../../src/main/paths");

describe("resolvePieMenuPaths", () => {
  it("resolves repo src layout in development", () => {
    const repoRoot = path.resolve(__dirname, "../..");
    const resolved = resolvePieMenuPaths(repoRoot, false);
    expect(resolved.pieMenuFolder).toBe(path.join(repoRoot, "src"));
    expect(fs.existsSync(resolved.pieMenuAhk)).toBe(true);
  });
});

describe("getUserDataFolder", () => {
  it("prefers AHP_USER_DATA", () => {
    const temp = fs.mkdtempSync(path.join(os.tmpdir(), "ahp-ud-"));
    const app = { getPath: () => path.join(temp, "should-not-use") };
    expect(getUserDataFolder(app, { AHP_USER_DATA: temp })).toBe(path.resolve(temp));
  });
});

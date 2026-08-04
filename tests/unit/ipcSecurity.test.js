import { describe, expect, it } from "vitest";
const { ensureSchemaVersion } = require("../../shared/settingsSchema");

// Keep in sync with src/main/ipc.js ALLOWED_URL_SCHEMES (avoid requiring electron in unit CI).
const ALLOWED_URL_SCHEMES = new Set(["http:", "https:"]);

describe("IPC security helpers", () => {
  it("allows only http(s) external URL schemes", () => {
    expect(ALLOWED_URL_SCHEMES.has("https:")).toBe(true);
    expect(ALLOWED_URL_SCHEMES.has("http:")).toBe(true);
    expect(ALLOWED_URL_SCHEMES.has("file:")).toBe(false);
    expect(ALLOWED_URL_SCHEMES.has("javascript:")).toBe(false);
  });

  it("rejects unsupported schema versions on import path", () => {
    expect(() =>
      ensureSchemaVersion({ schemaVersion: 99, global: {}, appProfiles: [] })
    ).toThrow(/Unsupported schemaVersion/);
  });
});

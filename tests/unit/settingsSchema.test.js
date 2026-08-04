import { describe, expect, it } from "vitest";
const fs = require("fs");
const path = require("path");
const Ajv2020 = require("ajv/dist/2020");
const {
  AHPSettingsSchema,
  ensureSchemaVersion,
  CURRENT_SCHEMA_VERSION,
} = require("../../shared/settingsSchema");

const fixturesDir = path.join(__dirname, "../fixtures/settings");
const ajv = new Ajv2020({ allErrors: true, strict: false });
const validate = ajv.compile(AHPSettingsSchema);

function loadFixture(name) {
  return JSON.parse(fs.readFileSync(path.join(fixturesDir, name), "utf8"));
}

describe("AHPSettings schema", () => {
  it("accepts minimal-default fixture", () => {
    expect(validate(loadFixture("minimal-default.json"))).toBe(true);
  });

  it("accepts single-pie-sendkey fixture", () => {
    expect(validate(loadFixture("single-pie-sendkey.json"))).toBe(true);
  });

  it("accepts custom-function fixture", () => {
    expect(validate(loadFixture("custom-function.json"))).toBe(true);
  });

  it("rejects missing appProfiles", () => {
    expect(validate(loadFixture("malformed-missing-profiles.json"))).toBe(false);
  });

  it("migrates legacy settings without schemaVersion", () => {
    const legacy = loadFixture("legacy-no-schema-version.json");
    const migrated = ensureSchemaVersion(legacy);
    expect(migrated.schemaVersion).toBe(CURRENT_SCHEMA_VERSION);
    expect(validate(migrated)).toBe(true);
  });

  it("rejects future schema versions", () => {
    expect(() =>
      ensureSchemaVersion({ schemaVersion: CURRENT_SCHEMA_VERSION + 1 })
    ).toThrow(/Unsupported schemaVersion/);
  });
});

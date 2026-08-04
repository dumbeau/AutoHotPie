import { describe, expect, it } from "vitest";
const fs = require("fs");
const path = require("path");
const { ensureSchemaVersion } = require("../../shared/settingsSchema");

describe("custom function persistence contract", () => {
  it("keeps functionConfig.custom through ensureSchemaVersion", () => {
    const fixture = JSON.parse(
      fs.readFileSync(
        path.join(__dirname, "../fixtures/settings/custom-function.json"),
        "utf8"
      )
    );
    const migrated = ensureSchemaVersion(fixture);
    expect(migrated.global.functionConfig.custom).toHaveLength(1);
    expect(migrated.global.functionConfig.custom[0].name).toBe("Hello Box");
  });
});

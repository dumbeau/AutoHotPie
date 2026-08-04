const { test, expect, _electron: electron } = require("@playwright/test");
const fs = require("fs");
const os = require("os");
const path = require("path");

const repoRoot = path.resolve(__dirname, "../..");

test.describe("Electron smoke", () => {
  let userData;
  let app;

  test.beforeEach(async () => {
    userData = fs.mkdtempSync(path.join(os.tmpdir(), "ahp-e2e-"));
    fs.mkdirSync(path.join(userData, "User Scripts"), { recursive: true });
    fs.mkdirSync(path.join(userData, "icons"), { recursive: true });
    fs.copyFileSync(
      path.join(repoRoot, "tests/fixtures/settings/minimal-default.json"),
      path.join(userData, "AHPSettings.json")
    );

    app = await electron.launch({
      args: [repoRoot],
      env: {
        ...process.env,
        AHP_USER_DATA: userData,
        AHP_ELECTRON_TEST: "1",
      },
    });
  });

  test.afterEach(async () => {
    if (app) {
      await app.close();
    }
  });

  test("launches settings window", async () => {
    const page = await app.firstWindow();
    await page.waitForLoadState("domcontentloaded");
    await expect(page).toHaveTitle(/AutoHotPie/i);
    await expect(page.locator("#app-tabs")).toBeVisible();
  });

  test("persists settings file in isolated userData", async () => {
    const page = await app.firstWindow();
    await page.waitForLoadState("domcontentloaded");
    const settingsPath = path.join(userData, "AHPSettings.json");
    expect(fs.existsSync(settingsPath)).toBe(true);
    const parsed = JSON.parse(fs.readFileSync(settingsPath, "utf8"));
    expect(parsed.appProfiles[0].name).toBe("Default Profile");
  });
});

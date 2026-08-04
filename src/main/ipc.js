"use strict";

const { ipcMain, dialog, shell } = require("electron");
const path = require("path");
const fs = require("fs");
const { spawn, execFile } = require("child_process");
const { promisify } = require("util");
const execFileAsync = promisify(execFile);
const { resolvePieMenuPaths, getUserDataFolder } = require("./paths");
const { ensureSchemaVersion } = require("../../shared/settingsSchema");

const ALLOWED_URL_SCHEMES = new Set(["http:", "https:"]);

function registerIpcHandlers({ app, getMainWindow }) {
  const isPackaged = app.isPackaged;
  const piePaths = () => resolvePieMenuPaths(app.getAppPath(), isPackaged);

  ipcMain.handle("app:getUserDataFolder", () => getUserDataFolder(app));
  ipcMain.handle("app:getVersion", () => app.getVersion());
  ipcMain.handle("app:isDev", () => !app.isPackaged && !!process.defaultApp);
  ipcMain.handle("app:getPath", (_e, pathString) => app.getPath(pathString));
  ipcMain.handle("app:getDate", () => {
    const dateTime = new Date();
    const fullDate =
      dateTime.getFullYear() +
      ("0" + (dateTime.getMonth() + 1)).slice(-2) +
      ("0" + dateTime.getDate()).slice(-2);
    return fullDate.slice(2);
  });
  ipcMain.handle("app:getNow", () => Date.now());

  ipcMain.handle("app:setRunOnLogin", (_e, runOnLogin, isAHK) => {
    const paths = piePaths();
    const usePath = isAHK ? paths.pieMenuAhk : paths.pieMenuExe;
    app.setLoginItemSettings({
      openAtLogin: !!runOnLogin,
      path: usePath,
    });
    return { path: usePath };
  });

  ipcMain.handle("window:focus", () => {
    const mainWindow = getMainWindow();
    if (!mainWindow) return;
    mainWindow.show();
    setTimeout(() => mainWindow.focus(), 200);
  });

  ipcMain.handle("window:confirmClose", () => {
    const mainWindow = getMainWindow();
    if (mainWindow) mainWindow.destroy();
  });

  ipcMain.handle("dialog:open", async (_e, options) => {
    const mainWindow = getMainWindow();
    return dialog.showOpenDialog(mainWindow, options);
  });

  ipcMain.handle("dialog:save", async (_e, options) => {
    const mainWindow = getMainWindow();
    return dialog.showSaveDialog(mainWindow, options);
  });

  ipcMain.handle("shell:openExternal", async (_e, url) => {
    let parsed;
    try {
      parsed = new URL(url);
    } catch {
      throw new Error("Invalid URL");
    }
    if (!ALLOWED_URL_SCHEMES.has(parsed.protocol)) {
      throw new Error(`Blocked URL scheme: ${parsed.protocol}`);
    }
    await shell.openExternal(parsed.toString());
  });

  ipcMain.handle("shell:openPath", async (_e, targetPath) => {
    return shell.openPath(path.resolve(targetPath));
  });

  ipcMain.handle("paths:getPieMenuFolder", () => piePaths().pieMenuFolder);

  ipcMain.handle("settings:read", (_e, fileName) => {
    const userData = getUserDataFolder(app);
    const settingsFile = path.isAbsolute(fileName)
      ? fileName
      : path.join(userData, fileName);
    const raw = fs.readFileSync(settingsFile, "utf8");
    const data = JSON.parse(raw);
    return ensureSchemaVersion(data);
  });

  ipcMain.handle("settings:write", (_e, fileName, data) => {
    const userData = getUserDataFolder(app);
    const settingsFile = path.isAbsolute(fileName)
      ? fileName
      : path.join(userData, fileName);
    const validated = ensureSchemaVersion(data);
    fs.mkdirSync(path.dirname(settingsFile), { recursive: true });
    fs.writeFileSync(
      settingsFile,
      JSON.stringify(validated, null, "\t"),
      "utf8"
    );
    return true;
  });

  ipcMain.handle("settings:import", async (_e, destFileName) => {
    const mainWindow = getMainWindow();
    const userData = getUserDataFolder(app);
    const result = await dialog.showOpenDialog(mainWindow, {
      title: "Select AutoHotPie settings file...",
      defaultPath: app.getPath("desktop"),
      buttonLabel: "Import Settings",
      filters: [{ name: "JSON", extensions: ["json"] }],
      properties: ["openFile"],
    });
    if (result.canceled || !result.filePaths[0]) return null;
    const raw = fs.readFileSync(result.filePaths[0], "utf8");
    let parsed;
    try {
      parsed = ensureSchemaVersion(JSON.parse(raw));
    } catch (err) {
      throw new Error(`Rejected settings import: ${err.message}`);
    }
    if (!parsed.appProfiles || !Array.isArray(parsed.appProfiles)) {
      throw new Error("Rejected settings import: missing appProfiles");
    }
    const dest = path.join(userData, destFileName);
    if (fs.existsSync(dest)) {
      const stamp = new Date().toISOString().replace(/[:.]/g, "-");
      fs.copyFileSync(dest, `${dest}.bak-${stamp}`);
    }
    fs.writeFileSync(dest, JSON.stringify(parsed, null, "\t"), "utf8");
    return parsed;
  });

  ipcMain.handle("window:getActiveProcess", () => {
    // Lazy-require keeps preload free of the native addon.
    const { windowManager } = require("node-window-manager");
    try {
      const active = windowManager.getActiveWindow();
      return {
        path: active.path,
        processName: path.basename(active.path || ""),
      };
    } catch (err) {
      return { path: "", processName: "", error: String(err) };
    }
  });

  ipcMain.handle("settings:export", async (_e, defaultFileName, settingsObj) => {
    const mainWindow = getMainWindow();
    const result = await dialog.showSaveDialog(mainWindow, {
      title: "Export AutoHotPie settings",
      defaultPath: path.join(app.getPath("desktop"), defaultFileName),
      buttonLabel: "Export Settings",
      filters: [{ name: "JSON", extensions: ["json"] }],
    });
    if (result.canceled || !result.filePath) return false;
    const validated = ensureSchemaVersion(settingsObj);
    fs.writeFileSync(
      result.filePath,
      JSON.stringify(validated, null, "\t"),
      "utf8"
    );
    return true;
  });

  ipcMain.handle("pie:run", async (_e, runAHK = false) => {
    const paths = piePaths();
    const command = runAHK ? paths.pieMenuAhk : paths.pieMenuExe;
    if (!fs.existsSync(command)) {
      throw new Error(`Pie menu runtime not found: ${command}`);
    }
    const child = spawn(command, [], {
      detached: true,
      stdio: "ignore",
      windowsHide: false,
      shell: false,
    });
    child.unref();

    const query = runAHK ? "AutoHotkey" : "PieMenu.exe";
    const deadline = Date.now() + 60000;
    while (Date.now() < deadline) {
      try {
        const { stdout } = await execFileAsync("tasklist", [], {
          windowsHide: true,
        });
        if (stdout.toLowerCase().includes(query.toLowerCase())) {
          return true;
        }
      } catch {
        // keep polling
      }
      await new Promise((r) => setTimeout(r, 250));
    }
    throw new Error("Timed out waiting for pie menus to start");
  });

  ipcMain.handle("pie:isRunning", async (_e, runAHK = false) => {
    const query = runAHK ? "PieMenu.ahk" : "PieMenu.exe";
    const { stdout } = await execFileAsync("tasklist", [], { windowsHide: true });
    return stdout.toLowerCase().includes(query.toLowerCase());
  });
}

module.exports = {
  registerIpcHandlers,
  ALLOWED_URL_SCHEMES,
};

const { app, ipcMain, dialog, BrowserWindow, Menu, shell } = require("electron");
const path = require("path");
const { registerIpcHandlers } = require("./src/main/ipc");
const { resolvePieMenuPaths, getUserDataFolder } = require("./src/main/paths");

let mainWindow;

function isDev() {
  return process.defaultApp === true;
}

function createWindow() {
  try {
    const windowWidth = isDev() ? 1271 : 960;
    mainWindow = new BrowserWindow({
      icon: path.join(__dirname, "src/assets/AutoHotPieIcon.ico"),
      backgroundColor: "#222222",
      minHeight: 670,
      minWidth: 960,
      width: windowWidth,
      height: 1030,
      webPreferences: {
        // Full sandbox requires fonts/icons/window helpers fully moved to main IPC.
        // Isolation is on; remote module is disabled; privileged APIs are being narrowed.
        sandbox: false,
        preload: path.join(__dirname, "src/preload.js"),
        contextIsolation: true,
        nodeIntegration: false,
      },
    });

    mainWindow.loadFile("src/index.html");

    if (isDev() && !process.env.AHP_ELECTRON_TEST) {
      mainWindow.webContents.openDevTools();
    }

    let timeOutVar;
    mainWindow.on("resize", function () {
      clearTimeout(timeOutVar);
      timeOutVar = setTimeout(function () {
        mainWindow.webContents.send("windowResized", mainWindow.getSize());
      }, 100);
    });

    mainWindow.on("close", async (e) => {
      if (process.env.AHP_ELECTRON_TEST) {
        return;
      }
      e.preventDefault();
      mainWindow.webContents.send("attemptClose");
    });

    // Legacy sync IPC kept briefly for any residual callers; prefer src/main/ipc.js handles.
    ipcMain.on("confirmClose", function () {
      mainWindow.destroy();
    });
    ipcMain.on("getUserDataFolder", function (event) {
      event.returnValue = getUserDataFolder(app);
    });
    ipcMain.on("setRunOnLogin", function (event, runOnLogin, isAHK) {
      const paths = resolvePieMenuPaths(app.getAppPath(), app.isPackaged);
      const usePath = isAHK ? paths.pieMenuAhk : paths.pieMenuExe;
      app.setLoginItemSettings({
        openAtLogin: runOnLogin,
        path: usePath,
      });
    });
    ipcMain.on("focusThisWindow", () => {
      mainWindow.show();
      setTimeout(() => mainWindow.focus(), 200);
    });
    ipcMain.on("openFileDialog", (event, options) => {
      event.returnValue = dialog.showOpenDialogSync(mainWindow, options);
    });
    ipcMain.on("saveFileDialog", (event, options) => {
      event.returnValue = dialog.showSaveDialogSync(mainWindow, options);
    });
    ipcMain.on("getVersionNumber", (event) => {
      event.returnValue = app.getVersion();
    });
    ipcMain.on("isDev", (event) => {
      event.returnValue = isDev();
    });
    ipcMain.on("getDate", (event) => {
      const dateTime = new Date();
      const fullDate =
        dateTime.getFullYear() +
        ("0" + (dateTime.getMonth() + 1)).slice(-2) +
        ("0" + dateTime.getDate()).slice(-2);
      event.returnValue = fullDate.slice(2);
    });
    ipcMain.on("getNow", (event) => {
      event.returnValue = Date.now();
    });
    ipcMain.on("getPath", function (event, pathString) {
      event.returnValue = app.getPath(pathString);
    });
  } catch (error) {
    dialog.showErrorBox(
      "AutoHotPie Error",
      error.toString() + "\n\nAutoHotPie will close."
    );
    app.quit();
  }
}

const gotTheLock = app.requestSingleInstanceLock();
if (!gotTheLock) {
  app.quit();
} else {
  app.on("second-instance", () => {
    if (mainWindow) {
      if (mainWindow.isMinimized()) mainWindow.restore();
      mainWindow.focus();
    }
  });

  app.whenReady().then(() => {
    registerIpcHandlers({
      app,
      getMainWindow: () => mainWindow,
    });
    createWindow();
    app.on("activate", function () {
      if (BrowserWindow.getAllWindows().length === 0) createWindow();
    });
  });
}

app.on("window-all-closed", function () {
  if (process.platform !== "darwin") app.quit();
});

const template = [
  {
    label: "File",
    submenu: [
      {
        label: "Import Settings",
        click: () => {
          mainWindow.webContents.send("menuSelected", "importSettings");
        },
      },
      {
        label: "Export Settings",
        click: () => {
          mainWindow.webContents.send("menuSelected", "exportSettings");
        },
      },
      {
        label: "Create portable AHK package",
        click: () => {
          mainWindow.webContents.send("menuSelected", "createPortablePackage");
        },
      },
      { type: "separator" },
      {
        label: "Save and Run",
        click: () => {
          mainWindow.webContents.send("menuSelected", "saveAndRun");
        },
      },
      {
        label: "Close without running",
        click: () => {
          mainWindow.webContents.send("menuSelected", "close");
        },
      },
    ],
  },
  {
    label: "Edit",
    submenu: [
      { label: "Undo", role: "undo" },
      { label: "Redo", role: "redo" },
      { type: "separator" },
      { label: "Cut", role: "cut" },
      { label: "Copy", role: "copy" },
      { label: "Paste", role: "paste" },
    ],
  },
  {
    role: "help",
    submenu: [
      {
        label: "View on Github",
        click: () => {
          shell.openExternal("https://github.com/combwizard/AutoHotPie");
        },
      },
      {
        label: "Open Developer Tools",
        click: () => {
          mainWindow.webContents.openDevTools();
        },
      },
      {
        label: "Open resources folder",
        click: () => {
          mainWindow.webContents.send("menuSelected", "openResources");
        },
      },
      {
        label: "Check for Updates",
        click: () => {
          shell.openExternal("https://github.com/combwizard/AutoHotPie/releases");
        },
      },
      {
        label: app.getVersion(),
        enabled: false,
      },
    ],
  },
];

const menu = Menu.buildFromTemplate(template);
Menu.setApplicationMenu(menu);

module.exports = {
  isDev,
  createWindow,
};

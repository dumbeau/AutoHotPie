import {app, BrowserWindow, Menu, Tray} from 'electron';
import * as path from 'path';
import * as fs from 'fs';
import {GlobalHotkeyService} from "./src/nativeAPI/GlobalHotkeyService";
import {initElectronAPI} from "./src/ipcBridge";
import {KeyEvent} from "./src/nativeAPI/KeyEvent";
import {SettingsConstants} from "./src/constants/SettingsConstants";
import {EditorConstants} from "./src/constants/EditorConstants";

// Variables
let pieMenuWindow: BrowserWindow | undefined;
let editorWindow: BrowserWindow | undefined;
app.setPath("userData", SettingsConstants.DEFAULT_SETTINGS_PATH);

let tray = null;

// Initialization
// User data is initialized in app.component.ts and can only be initialized there (with minimal code).
initGlobalHotkeyService();
initElectronWindows();
initElectronAPI();
initSystemTray();


// Functions
function initGlobalHotkeyService() {
  // Start GlobalHotkeyService
  GlobalHotkeyService.getInstance();

  GlobalHotkeyService.addKeyEventListener(
    (event: KeyEvent) => {
      console.debug("main.ts", "Main process received a key event from the global hotkey service: " + event.type + " " + event.value);
    })
    .setOnCloseListener(() => {
      console.debug("main.ts", "Main process received the exit signal from the global hotkey service.");

      editorWindow?.webContents.send('globalHotkeyServiceExited')
    });
}

function initElectronWindows() {
  try {

    // Added 400 ms to fix the black background issue while using transparent window.
    // More details at https://github.com/electron/electron/issues/15947
    app.on('ready', () => setTimeout(createWindow, 400));

    // Note: windows-all-closed listener is removed
    // because we want to keep the app running in the background

    app.on('activate', () => {
      // On OS X it's common to re-create a window in the app when the
      // dock icon is clicked and there are no other windows open.
      if (editorWindow === null) {
        createWindow();
      }
    });

  } catch (e) {
    console.error(e);
  }
}

function createWindow(): BrowserWindow {
  editorWindow = new BrowserWindow({
    minWidth: EditorConstants.WINDOW_WIDTH,
    minHeight: EditorConstants.WINDOW_HEIGHT,
    width: EditorConstants.WINDOW_WIDTH,
    height: EditorConstants.WINDOW_HEIGHT,
    // TODO: Uncomment the following line for release build
    // titleBarStyle: 'hidden',
    titleBarOverlay: {
      color: '#2f3241',
      symbolColor: '#74b1be',

      // !!! IMPORTANT !!!
      // --title-bar-height should also be updated in styles.scss when you change the height
      height: 42
    },
    webPreferences: {
      nodeIntegration: false,
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,  // false if you want to run e2e test with Spectron
    },
  });
  // Path when running electron executable
  let editorWindowPath = './index.html';

  if (fs.existsSync(path.join(__dirname, '../dist/index.html'))) {
    // Path when running electron in local folder
    editorWindowPath = '../dist/index.html';
  }

  const editorWindowURL = new URL(path.join('file:', __dirname, editorWindowPath));

  // TODO: Remove the following line for production build
  editorWindow.loadURL(editorWindowURL.href);

  pieMenuWindow = new BrowserWindow({
    webPreferences: {
      nodeIntegration: false,
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,  // false if you want to run e2e test with Spectron
    },
  });

  // ------------ Creating Editor Window End ------------

  // Path when running electron executable
  let pieMenuPath = './index.html#pieMenuUI';

  if (fs.existsSync(path.join(__dirname, '../dist/index.html'))) {
    // Path when running electron in local folder
    pieMenuPath = '../dist/index.html#pieMenuUI';
  }

  const pieMenuURL = new URL(path.join('file:', __dirname, pieMenuPath));
  pieMenuWindow.loadURL(pieMenuURL.href);

  editorWindow.on('close', (event) => {
    event.preventDefault();
    editorWindow?.hide();
  });

  return editorWindow;
}

function initSystemTray() {
  app.whenReady().then(() => {
    tray = new Tray(__dirname + '/assets/favicon.ico')
    const contextMenu = Menu.buildFromTemplate([
      {label: 'AutoHotPie', type: "normal", enabled: false},
      {type: "separator"},
      {
        label: 'Setting', type: "normal", click: () => {
          editorWindow?.show();
        }
      },
      {
        label: 'Restart', type: "normal", click: () => {
          // TODO: IMPLEMENTATION
          console.log("Item1 clicked")
        }
      },
      {
        label: 'Reload Service', type: "normal", click: () => {
          // TODO: IMPLEMENTATION
          console.log("Item1 clicked")
        }
      },
      {
        label: 'Exit', type: "normal", click: () => {
          app.exit();
        }
      },
    ])
    tray.setToolTip('Pie menyuuus!')
    tray.setContextMenu(contextMenu)
  })
}

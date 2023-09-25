import {app, BrowserWindow, Menu, Tray} from 'electron';
import * as path from 'path';
import * as fs from 'fs';
import {initElectronAPI, initLoggerForRenderer} from "./src/ipcBridge";
import {EditorConstants} from "./src/constants/EditorConstants";
import {getGHotkeyServiceInstance, KeyEvent} from "mousekeyhook.js";
import {AHPEnv} from "autohotpie-core/lib/AHPEnv";
import {Log} from "autohotpie-core";
import {AHPPluginManager} from "./src/plugin/AHPPluginManager";

// Variables
let pieMenuWindow: BrowserWindow | undefined;
let editorWindow: BrowserWindow | undefined;
app.setPath("userData", AHPEnv.DEFAULT_DATA_PATH);

let tray = null;

// Initialization
// User data is initialized in app.component.ts and can only be initialized there (with minimal code).
initGlobalHotkeyService();
initElectronWindows();
initElectronAPI();
initLoggerForRenderer();
initSystemTray();
AHPPluginManager.loadPlugins();

// Functions
function initGlobalHotkeyService() {
  Log.main.info('Initializing global hotkey service');

  getGHotkeyServiceInstance().onHotkeyEvent.push(
    (event: KeyEvent) => {
      Log.main.debug('onKeyEvent - ' + event.type + ' ' + event.value);
    });
  getGHotkeyServiceInstance().onProcessExit = (() => {
    Log.main.debug('Global hotkey service exited.');

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
    Log.main.error(e);
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
  editorWindow.loadURL(editorWindowURL.href);

  // ------------ Create Editor Window End ------------

  pieMenuWindow = new BrowserWindow({
    // transparent: true,
    // frame: false,
    // fullscreen: true,
    // resizable: false,
    webPreferences: {
      nodeIntegration: false,
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,  // false if you want to run e2e test with Spectron
    },
  });

  // Path when running electron executable
  let pieMenuPath = './index.html#pieMenuUI';

  if (fs.existsSync(path.join(__dirname, '../dist/index.html'))) {
    // Path when running electron in local folder
    pieMenuPath = '../dist/index.html#pieMenuUI';
  }

  const pieMenuURL = new URL(path.join('file:', __dirname, pieMenuPath));

  // TODO: Remove the following line for production build
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
          Log.main.warn("Item1 clicked")
        }
      },
      {
        label: 'Reload Service', type: "normal", click: () => {
          // TODO: IMPLEMENTATION
          Log.main.warn("Item1 clicked")
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

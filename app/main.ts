import {app, BrowserWindow, screen} from 'electron';
import * as path from 'path';
import * as fs from 'fs';
import {spawn} from 'child_process';
import {GlobalHotkeyService} from "./src/globalHotkey/GlobalHotkeyService";
import {HotkeyEventListener} from "./src/globalHotkey/HotkeyEventListener";

// Constants
const EDITOR_WINDOW_WIDTH = 1080;
const EDITOR_WINDOW_HEIGHT = 720;
const args = process.argv.slice(1)
const serve = args.some(val => val === '--serve');
let pieMenuWindow : BrowserWindow | undefined;
let editorWindow : BrowserWindow | undefined;

// ----------------- Set up GlobalHotkeyService -----------------

GlobalHotkeyService.start();
GlobalHotkeyService.addKeyEventListener(new class implements HotkeyEventListener {
  onKeyDown(key: string): void {
  }

  onKeyUp(key: string): void {
  }
});

// ----------------- Set up electron window -----------------
try {
  // This method will be called when Electron has finished
  // initialization and is ready to create browser windows.
  // Some APIs can only be used after this event occurs.
  // Added 400 ms to fix the black background issue while using transparent window. More detais at https://github.com/electron/electron/issues/15947
  app.on('ready', () => setTimeout(createWindow, 400));

  // Quit when all windows are closed.
  app.on('window-all-closed', () => {
    // On OS X it is common for applications and their menu bar
    // to stay active until the user quits explicitly with Cmd + Q
    if (process.platform !== 'darwin') {
      app.quit();
    }
  });

  app.on('activate', () => {
    // On OS X it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (editorWindow === null) {
      createWindow();
    }
  });

} catch (e) {
  // Catch Error
  // throw e;
}

function createWindow(): BrowserWindow {
  editorWindow = new BrowserWindow({
    minWidth: EDITOR_WINDOW_WIDTH,
    minHeight: EDITOR_WINDOW_HEIGHT,
    width: EDITOR_WINDOW_WIDTH,
    height: EDITOR_WINDOW_HEIGHT,
    titleBarStyle: 'hidden',
    titleBarOverlay: {
      color: '#2f3241',
      symbolColor: '#74b1be',
      height: 42
    },
    webPreferences: {
      nodeIntegration: true,
      allowRunningInsecureContent: (serve),
      contextIsolation: true,  // false if you want to run e2e test with Spectron
    },
  });

  pieMenuWindow = new BrowserWindow({
    webPreferences: {
      nodeIntegration: true,
      allowRunningInsecureContent: (serve),
      contextIsolation: true,  // false if you want to run e2e test with Spectron
    },
  });

  if (serve) {
    const debug = require('electron-debug');
    debug();

    require('electron-reloader')(module);
    editorWindow.loadURL('http://localhost:4200');
  } else {
    // Path when running electron executable
    let pathIndex = './index.html';

    if (fs.existsSync(path.join(__dirname, '../dist/index.html'))) {
       // Path when running electron in local folder
      pathIndex = '../dist/index.html';
    }

    const url = new URL(path.join('file:', __dirname, pathIndex));
    editorWindow.loadURL(url.href);
  }

  // Emitted when the window is closed.
  editorWindow.on('closed', () => {
    // Dereference the window object, usually you would store window
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    // editorWindow = null;
  });

  return editorWindow;
}


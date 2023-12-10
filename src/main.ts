import { app, BrowserWindow, ipcMain, nativeTheme, NativeImage, dialog, globalShortcut, screen} from "electron";

import activeWindow = require('active-win');
import * as fs from "fs";
import * as path from "path";

import {GlobalKeyboardListener} from "node-global-key-listener";
const globalKeyboardListener = new GlobalKeyboardListener();

//Log every key that's pressed.
globalKeyboardListener.addListener(function (e, down) {
  let modifierKeys = ['LEFT SHIFT', 'RIGHT SHIFT', 'LEFT CTRL', 'RIGHT CTRL', 'LEFT ALT', 'RIGHT ALT', 'LEFT META', 'RIGHT META']
  if (modifierKeys.some(key => e.name.includes(key))){
    return false;
  }
  // console.log(down);
  //   console.log(
  //       `${down} ${e.name} ${e.state == "DOWN" ? "DOWN" : "UP  "} [${e.rawKey._nameRaw}]`
  //   );
});





class Overlay {
  constructor(){
    this.win = null;
  }
  win: BrowserWindow | null;

  create() {
    this.win = new BrowserWindow({    
      width: 800,
      height: 600,
      transparent: true,
      frame: false,
      webPreferences:{
        preload: path.join(__dirname, "preload.js")
      }
    });
  
  
   // Load your HTML string into the window
   this.win.loadFile(path.join(__dirname, "overlay.html"));
      
   
   this.win.webContents.on('did-finish-load', () => {
    this.win.webContents.send('initializeOverlayCanvas');
    });
    // Clean up the overlayWindow when it's closed
    this.win.on('closed', () => {
      this.win = null;
    });
  }

  show() {    
    this.win.webContents.on('dom-ready', () => {
      const { x, y } = screen.getCursorScreenPoint();
      const overlayWindowSize = this.win.getSize();
  
      // Adjust the coordinates to center the window on the cursor
      const centerX = x - Math.round(overlayWindowSize[0] / 2)
      const centerY = y - Math.round(overlayWindowSize[1] / 2)
  
      this.win.setPosition(centerX, centerY)
    })
    this.win.show();      
  }
  hide(){
    // overlayWindow.hide(); 
    this.win.webContents.send('clearCanvas')
  }

}
let overlayWindow = new Overlay()

var mainWindow: BrowserWindow;  ``
function createWindow() {
  // Create the browser window.
  mainWindow = new BrowserWindow({
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, "preload.js"),
    },
    width: 800,
  });

  // and load the index.html of the app.
  mainWindow.loadFile(path.join(__dirname, "index.html"));

  // Open the DevTools.
  mainWindow.webContents.openDevTools();

}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createWindow();
  overlayWindow.create();

  app.on("activate", function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.    

    if (BrowserWindow.getAllWindows().length === 0) createWindow();
    
    });
});

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();    
  }
});

// In this file you can include the rest of your app"s specific main process
// code. You can also put them in separate files and require them here.
function isDev(){
  let processVal = process.defaultApp
    var returnValue: boolean;
    if (processVal == true){
      returnValue = processVal;
    } else {
      returnValue = false;
    }
  return returnValue
}

ipcMain.handle('dark-mode:system', () => {
  nativeTheme.themeSource = 'system'
})


// In this file you can include the rest of your app"s specific main process
// code. You can also put them in separate files and require them here.


class SettingsHandler {
  constructor(userDirectory:string|null = null){
    let _ahpSettingsFileName: string = this.ahpSettingsFileName;
    this.userDirectory = findUserDirectory(userDirectory);
    if (this.userDirectory == ""){
      this.initializeUserFolder(path.join(app.getPath("userData")));
    }
    function findUserDirectory(_userDirectory:string|null=null): string {
      _userDirectory = (_userDirectory) ? path.resolve(_userDirectory) : "";
      let directories: any[] = [
        _userDirectory,
        path.join(app.getPath("userData")),
        path.join(app.getAppPath(),"..") //Local path
      ]    
      for (let directory of directories){
        console.log('Checking for settings in: ' + directory);
          if(isValidAutoHotPieUserDirectory(directory)){
            return directory
          }    
      }          
      return "";  
      function isValidAutoHotPieUserDirectory(settingsDirectoryPath: string | null): boolean{
        if (!settingsDirectoryPath){
            return false
        }
        let settingFileName: string = _ahpSettingsFileName;
        if (!fs.existsSync(path.join(settingsDirectoryPath, settingFileName))){
          return false;
        }
        //
        // let autoHotPieFolders = ['icons'];
        // for (let folder of autoHotPieFolders){
        //   if (!fs.existsSync(path.join(settingsDirectoryPath,folder)))
        //     return false;
        // }
        return true; 
      }
      
    };
    // if(!fs.existsSync(path.join(this.userDirectory,'process_icons'))){      
    //   this.initializeUserFolder();
    // }    
  }
  userDirectory: string;
  ahpSettingsFileName: string = "AHPSettings.json";
  load(): any{
    if(this.userDirectory == ''){return false}; //Create first time settings on false
    let ahpSettingsFilePath = path.join(this.userDirectory,this.ahpSettingsFileName); 
    let settingsObject: any;
    if (fs.existsSync(ahpSettingsFilePath)) {
      settingsObject = JSON.parse(fs.readFileSync(ahpSettingsFilePath, {encoding:"utf8"}));
    } else {
      settingsObject = {}      
    }    
    if(settingsObject.userDirectory && settingsObject.version){
      settingsObject.userDirectory = this.userDirectory;
      settingsObject.settingsFileName = this.ahpSettingsFileName;
    } else {      
      console.log("Invalid Settings file")
    }
    return settingsObject;
  };
  save(objectData: any, directory: string | null = null): void{
    let autoHotPieSettingsToSave: any = Object.getPrototypeOf(Object.create(objectData));
      removeCircular(autoHotPieSettingsToSave);
      function removeCircular(obj: any) {
          const seen = new Map();
          const recurse = (obj: any) => {
              if (obj == null || obj == undefined){return;}
              seen.set(obj,true);
              for( let [k, v] of Object.entries(obj)) {
                  if( typeof v !== "object") continue;                        
                  if(seen.has(v)) delete obj[k];
                  else recurse(v);
              }
          }
          recurse(obj);
      }           
      let settingsText: string = JSON.stringify(autoHotPieSettingsToSave,null, "\t");
      let saveToDirectory: string = (directory) ? directory : this.userDirectory;
      fs.writeFileSync(path.join(saveToDirectory, this.ahpSettingsFileName),settingsText); //Add Error callback !!!
      return;
  }
  initializeUserFolder(userDirectory: string){
    
    let directories = [
      path.join('Icons', 'process'),           
      path.join('Icons', 'User'),            
      path.join('Icons', 'stock'),
      path.join('User Scripts')   
    ]
    directories.forEach( (directory) => {
      createUserDirectory(directory);
    })    

    function createUserDirectory(directoryPath:string){
      let testPath = path.join(userDirectory, directoryPath)
      if(!fs.existsSync(testPath)){
        fs.mkdirSync(testPath, {recursive: true});
      }      
    }     
    this.userDirectory = userDirectory;
  }  
}
var settingsHandler = new SettingsHandler();


ipcMain.on('loadSettingsFile',(event) => {
  event.returnValue = settingsHandler.load();
});
ipcMain.on('saveSettingsFile', (event, data:any) => {
  settingsHandler.save(data);
});
ipcMain.on('getUserDirectory', (event) => {
  event.returnValue = settingsHandler.userDirectory;
})
ipcMain.on('openFileDialog', (event, options) => {    
  event.returnValue = dialog.showOpenDialogSync(options);
});
ipcMain.on('saveFileDialog', (event, options) => {
  event.returnValue = dialog.showSaveDialogSync(mainWindow, options);
});
ipcMain.on('getApplicationVersion', (event)=>{
  event.returnValue = (isDev()) ? "debugVersion" : app.getVersion();  
});
ipcMain.on('getPathBasename', (event, filePath) => {
  event.returnValue = path.basename(filePath);
});

ipcMain.handle('getActiveWindowProcess', async () => {
  try {
    const result = await activeWindow() // call the async function and wait for the promise
    return result // send the result back to the renderer process
  } catch (error) {
    console.error(error) // handle any errors
  }
})

class ProcessIconManager {
  constructor(userDirectory: string){
    this.iconDirectory = path.join(userDirectory, 'Icons','process');
  }
  iconDirectory:string;
  add(imageData: NativeImage, name:string){
    fs.writeFile(path.join(this.iconDirectory, name + ".png"), imageData.toPNG(),(err) => {
      if (err){
        console.log("Oops");
      } else {
        console.log("File written sucessfully")
      }
    });        
  };
  getList(): string[] {
    let processIconFiles = fs.readdirSync(this.iconDirectory); 
    return processIconFiles
  };
  async get(exePath:string): Promise<any> {
    // let returnImageString = await nativeImage.createThumbnailFromPath(exePath, {width:256,height:256});
    let returnImageString = await app.getFileIcon(exePath, {size:"large"})    
    return returnImageString.toPNG().toString("base64");
  };
};
var processIconManager = new ProcessIconManager(settingsHandler.userDirectory);
ipcMain.on('addProcessIcon', (event, imageData, name) => {
  processIconManager.add(imageData, name);
});
ipcMain.handle('getProcessIcon', async (event, exePath:string) => {
  let processIconImageString = await processIconManager.get(exePath);
  return processIconImageString;
});



//Handle global shortcut registration.
let isKeyPressed = false;

ipcMain.handle('globalShortcutRegister', (event, accelerator) => {
  const ret = globalShortcut.register(accelerator, () => {
    if (isKeyPressed) {
      return;
    }
    isKeyPressed = true;
    console.log(`${accelerator} is pressed`);
    let thisListener =  globalKeyboardListener.addListener( (e, down) => {
      // console.log(e);
      // console.log(down);
      if(e.name == 'T' && e.state =="UP"){        
        overlayWindow.hide();
        globalKeyboardListener.kill();
        isKeyPressed = false;        
      }
    });
    overlayWindow.show();
    event.sender.send('acceleratorPressed', accelerator);
  });

  if (!ret) {
    console.log(`registration of ${accelerator} failed`);
  }

  // Check whether the shortcut is registered.
  console.log(globalShortcut.isRegistered(accelerator));
  return ret
});

ipcMain.handle('globalShortcutUnregister', (event, accelerator) => {
  globalShortcut.unregister(accelerator);
  return globalShortcut.isRegistered(accelerator); // should return false
});









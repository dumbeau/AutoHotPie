import { app, BrowserWindow, Menu, shell, ipcMain, nativeTheme, dialog, session, NativeImage } from "electron";
import * as path from "path";
import * as fs from 'fs';
import { windowManager } from "node-window-manager";



let mainWindow: BrowserWindow;
function createWindow() {

  let windowWidth = (isDev()) ? 1500 : 800
  // Create the browser window.
  mainWindow = new BrowserWindow({        
    darkTheme: true,
    title: "AutoHotPie",
    height: 800,    
    minHeight: 400,
    minWidth:600,
    webPreferences: { 
      spellcheck: false,
      preload: path.join(__dirname, "preload.js")         
    },
    width: windowWidth    
  });
  // and load the index.html of the app.
  mainWindow.loadFile(path.join(`${__dirname}/index.html`)).then(() => {
    // some implementation here
    }).catch(e => console.error(e));;

  // Open the DevTools.
  mainWindow.webContents.openDevTools();

  const template: any[] = [
    {
       label: 'File',
       submenu: [
          {
            label: 'Import Settings',          
            click: () => {  
              // ipcMain.send('menuSelected', event)
              mainWindow.webContents.send('menuSelected', 'importSettings')            
            }    
          },
          {
            label: 'Export Settings',          
            click: () => {
              mainWindow.webContents.send('menuSelected', 'exportSettings')            
            }          
          },        
          {
            label: 'Create portable AHK package',          
            click: () => {
              mainWindow.webContents.send('menuSelected', 'createPortablePackage')
            }           
          },
          {
            type: 'separator'
          },
          { 
            label: 'Save and Run',          
            click: () => {
              mainWindow.webContents.send('menuSelected', 'saveAndRun')
            }
          },
          { 
            label: 'Close without running',          
            click: () => {
              mainWindow.webContents.send('menuSelected', 'close')
            }
          }
       ]
    },  
    {
       role: 'help',
       submenu: [
          {
             label: 'Check for Updates',
             click: () => {
              shell.openExternal('https://github.com/dumbeau/AutoHotPie/releases')             
             }
          },
          {
            label: 'View on Github',
            click: () => {
              shell.openExternal('https://github.com/dumbeau/AutoHotPie')             
            }
          },
          {
            label: 'Donate',
            click: () => {
              shell.openExternal('https://www.paypal.com/donate?business=RBTDTCUBK4Z8S&no_recurring=1&item_name=Support+Pie+Menus+Development&currency_code=USD')             
            }
          },
          {
            label: 'Developer Tools',
            click: () => {
              mainWindow.webContents.openDevTools()              
            }
          }
       ]
    }
  ];

  var timeOutVar:any;
  mainWindow.on('resize',function(){
    clearTimeout(timeOutVar);
    timeOutVar = setTimeout(function() {
      mainWindow.webContents.send('windowResized',mainWindow.getSize())
    }, 100);
    // mainWindow.webContents.send('windowResized',mainWindow.getSize())
  });
  
  const menu = Menu.buildFromTemplate(template);
  Menu.setApplicationMenu(menu)
}

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

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.




app.whenReady().then(() => {
  createWindow();

  app.on("activate", function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
  session.defaultSession.webRequest.onHeadersReceived((details, callback) => {
    callback({
      responseHeaders: {
        ...details.responseHeaders,
        'Content-Security-Policy': ['script-src \'self\' https://cdnjs.cloudflare.com/ajax/libs/ https://unpkg.com/@lottiefiles/lottie-player@latest/dist/']
      }
    })
  })
});

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();
  }
});

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
        app.getPath("userData"),
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
      path.join('Local Scripts')     
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


ipcMain.on('getActiveWindowProcess', (event) => {
  event.returnValue = getActiveWindow();
    function getActiveWindow(){
      let exe = windowManager.getActiveWindow();
      let exeName = path.basename(exe.path).toString().replace(".exe","") 
      // let exeIcon = nativeImage.createFromPath(exe.path).toPNG();
      // processIconManager.add(exeIcon, exeName)
      // let exeIcon = new Blob( [exe.getIcon(256).buffer], {type: 'image/png'})
      let exeIcon = exe.path;
      // let exeIcon = exe.getIcon(64);
      // let exeIcon = fileIcon(exe.path, 256);

      exeName = exeName.charAt(0).toUpperCase() + exeName.slice(1);
      if (["autohotpie.exe","electron.exe"].includes(path.basename(exe.path).toString().toLowerCase())){        
        return {}
        throw new Error('User is a bit of a dumdum'); //Easter egg here?
      } else {
        return {
          path: exe.path,
          // icon: app.getFileIcon(exe.path),
          icon: exeIcon,
          name: exeName,
          exe: path.basename(exe.path).toString()        
        }     
      }
    }  
});
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


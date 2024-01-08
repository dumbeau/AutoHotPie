// Modules to control application life and create native browser window
const {app, ipcMain, dialog, contextBridge, BrowserWindow, Menu, MenuItem, shell} = require('electron')
const path = require('path')
const fs = require('fs')
// const { isDataView } = require('util/types')


let mainWindow
function createWindow() {
  try {
  // Create the browser window.  

  let windowWidth = (isDev()) ? 1271 : 960
  mainWindow = new BrowserWindow({
    icon: path.join(__dirname, 'src/assets/AutoHotPieIcon.ico'),
    backgroundColor: '#222222',
    minHeight: 670,
    minWidth: 960,
    width: windowWidth,
    height: 1030,    
    webPreferences: {
      // contextIsolation:false,
      sandbox:false,
      enableRemoteModule: true,
      preload: path.join(__dirname, 'src/preload.js'),
      contextIsolation: true
    }
  })
  

  // and load the index.html of the app.
  mainWindow.loadFile('src/index.html')

  // Open the DevTools.
  if (isDev()){
    mainWindow.webContents.openDevTools()
  }
  // mainWindow.webContents.openDevTools() //Use if debug exe needed
  
  // mainWindow.removeMenu()

  
  var timeOutVar
  mainWindow.on('resize',function(e){
    clearTimeout(timeOutVar);
    timeOutVar = setTimeout(function() {
      mainWindow.webContents.send('windowResized',mainWindow.getSize())
    }, 100);
    // mainWindow.webContents.send('windowResized',mainWindow.getSize())
  });
  mainWindow.on('close', async e => {
    e.preventDefault()
    mainWindow.webContents.send('attemptClose')
  })
  ipcMain.on('confirmClose',function(event){    
    mainWindow.destroy();
  });
  ipcMain.on('getUserDataFolder', function(event){
    event.returnValue = app.getPath('userData');
  });
  ipcMain.on('setRunOnLogin', function(event, runOnLogin, isAHK){    
    let usePath
    if (isAHK){
      usePath = path.join(__dirname, '..','src','PieMenu.ahk')
    }else{
      usePath = path.resolve( path.join(__dirname, '..','src','PieMenu.exe'))
    }
    app.setLoginItemSettings({
      openAtLogin:runOnLogin,
      path:usePath
    });
  });
  ipcMain.on('focusThisWindow', () => {
    mainWindow.show();
    mainWindow.on('show', () => {
      setTimeout(() => {
        mainWindow.focus();
      }, 200);
    });    
  });
  ipcMain.on('openFileDialog', (event, options) => {    
    event.returnValue = dialog.showOpenDialogSync(options);
  });
  ipcMain.on('saveFileDialog', (event, options) => {
    event.returnValue = dialog.showSaveDialogSync(mainWindow, options);
  });
  ipcMain.on('getVersionNumber', (event) => {
    event.returnValue = app.getVersion();
  });
  ipcMain.on('isDev', (event) =>{
      event.returnValue = isDev();
  });
  ipcMain.on('getDate', (event) => {
    var dateTime = new Date()
    // fullDate = dateTime.getFullYear() + "-" + dateTime.getUTCMonth() + "-" + dateTime.getDate();

    fullDate = dateTime.getFullYear() + ('0' + (dateTime.getMonth()+1)).slice(-2) + ('0' + dateTime.getDate()).slice(-2);

    event.returnValue = fullDate.slice(2).replaceAll("-","")
  });
  ipcMain.on('getNow', (event) => {    
    event.returnValue = Date.now();
  });
  ipcMain.on('getPath',function(event, pathString){
    event.returnValue = app.getPath(pathString);
  });
} catch (error) {
  dialog.showErrorBox("AutoHotPie Error", error.toString() + "\n\nAutoHotPie will close.").then(()=>{
    app.quit();
  });  
}
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.

const gotTheLock = app.requestSingleInstanceLock();
  if (!gotTheLock) {
    app.quit()
  } else {
    app.on('second-instance', () => {
      // Someone tried to run a second instance, we should focus our window.
      if (mainWindow) {
        if (mainWindow.isMinimized()) mainWindow.restore()
        mainWindow.focus()
      }
  })
app.whenReady().then(() => {  
  createWindow();
  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })  
})
  }

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function (event) {
  if (process.platform !== 'darwin') app.quit()
})


// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.

function isDev(){   
  let processVal = process.defaultApp
    if (processVal == true){
      returnValue = processVal;
    } else {
      returnValue = false;
    }
  return returnValue
}

const template = [
  {
     label: 'File',
     submenu: [
        {
          label: 'Import Settings',  
          // accelerator: 'CmdOrCtrl+I',        
          click: (event) => {  
            // ipcMain.send('menuSelected', event)
            mainWindow.webContents.send('menuSelected', 'importSettings')            
          }    
        },
        {
          label: 'Export Settings',  
          // accelerator: 'CmdOrCtrl+E',        
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
          // accelerator: 'CmdOrCtrl+S',      
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
    label: 'Edit',
    submenu: [
      {
        label: 'Undo',
        // accelerator: 'CmdOrCtrl+Z',
        role: 'undo',
        click: () => {}
      },
      {
        label: 'Redo',
        // accelerator: 'Shift+CmdOrCtrl+Z',
        role: 'redo',
        click: () => {}
      },
      { type: 'separator' },
      {
        label: 'Cut',
        // accelerator: 'CmdOrCtrl+X',
        role: 'cut',
        click: () => {}
      },
      {
        label: 'Copy',
        // accelerator: 'CmdOrCtrl+C',
        role: 'copy',
        click: () => {}
      },
      { 
        label: 'Paste',
        // accelerator: 'CmdOrCtrl+V',
        role: 'paste',
        click: () => {}
      }      
    ]
  },  
  {
     role: 'help',
     submenu: [        
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
          label: 'Open Developer Tools',
          click: () => {
            mainWindow.webContents.openDevTools();
          }

        },
        {
          label: 'Open resources folder',
          click: () => {
            mainWindow.webContents.send('menuSelected', 'openResources')
          }
          
        },
        {
          label: 'Check for Updates',
          click: () => {
            shell.openExternal('https://github.com/dumbeau/AutoHotPie/releases')             
          }
        },
        {
          label: app.getVersion(),
          enabled: false
        }
     ]
  }
]


const menu = Menu.buildFromTemplate(template)
Menu.setApplicationMenu(menu)

// Modules to control application life and create native browser window
const {app, ipcMain, dialog, contextBridge, BrowserWindow} = require('electron')
const path = require('path')
const fs = require('fs')
const { isDataView } = require('util/types')



function createWindow() {
  // Create the browser window.


  mainWindow = new BrowserWindow({
    icon: path.join(__dirname, 'src/assets/AutoHotPieIcon.ico'),
    backgroundColor: '#222222',
    minHeight: 670,
    minWidth: 960,
    width: 960,
    height: 1030,
    webPreferences: {
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
  
  mainWindow.removeMenu()
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
    mainWindow.webContents.send('attemptClose') //WORKING ON THIS PART RIGHT HERE!!! 
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
  ipcMain.on('openFileDialog', (event, options) => {    
    event.returnValue = dialog.showOpenDialogSync(options);
  });
  ipcMain.on('getVersionNumber', (event) => {
    event.returnValue = app.getVersion();
  });
  ipcMain.on('isDev', (event) =>{    
      event.returnValue = isDev();
  });
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  
  createWindow();   
  
  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

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

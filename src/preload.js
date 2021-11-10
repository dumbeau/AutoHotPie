// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.

const fs = require("fs")
const path = require("path")
const { ipcRenderer , contextBridge, shell, app, BrowserWindow, ipcMain } = require('electron')

// var exec = require('child_process').execFile;
const child_process = require('child_process');
const { clearInterval } = require("timers");




var PieMenuFolder
if(ipcRenderer.sendSync('isDev')){
  PieMenuFolder = path.resolve(__dirname);
} else {
  PieMenuFolder = path.resolve(__dirname, '..','..','src');
}
var UserDataFolder = path.join(ipcRenderer.sendSync('getUserDataFolder'));

contextBridge.exposeInMainWorld('JSONFile', {
  open: function(JSONFile){    
    let settingsFile = path.join(UserDataFolder,JSONFile);
    let settingsObj = JSON.parse(fs.readFileSync(path.resolve(settingsFile)))     
    return settingsObj
  },
  save: function(JSONFile, JSONData){    
    let settingsFile = path.join(UserDataFolder,JSONFile)    
    fs.writeFileSync(path.resolve(settingsFile),JSON.stringify(JSONData,null, "\t"), function(err){
      if (err) {
        console.log("Failed to save file.\n" + err)
      }
    })
  }
})

contextBridge.exposeInMainWorld('setRunOnLogin', function(runOnLogin, isAHK=false){
  ipcRenderer.send('setRunOnLogin', runOnLogin, isAHK);    
});


contextBridge.exposeInMainWorld('openURL',function(openURL){
  shell.openExternal(openURL);
})

contextBridge.exposeInMainWorld('updateApp',function(){
  console.log("Updating is not currently supported")
})

contextBridge.exposeInMainWorld('isPieMenusRunning', function(runAHK){
  let query = (runAHK) ? "PieMenu.ahk" : "PieMenu.exe";
  let platform = process.platform;
    let cmd = '';
    switch (platform) {
        case 'win32' : cmd = `tasklist`; break;
        case 'darwin' : cmd = `ps -ax | grep ${query}`; break;
        case 'linux' : cmd = `ps -A`; break;
        default: break;
    }
    child_process.exec(cmd, (err, stdout, stderr) => {
        return (stdout.toLowerCase().indexOf(query.toLowerCase()) > -1);
    });
});

contextBridge.exposeInMainWorld('pieMenus', {
  run: async function(runAHK=false){  
    function run_script(command, args, callback) {      
      var child = child_process.spawn("\"" + command + "\"", args, {
          encoding: 'utf8',
          shell: true,
          detached: true
      });
      // You can also use a variable to save the output for when the script closes later
      child.on('error', (error) => {
          console.log(error)
      });
  
      child.stdout.setEncoding('utf8');
      child.stdout.on('data', (data) => {
          //Here is the output
          data=data.toString();   
          console.log(data);      
      });
  
      child.stderr.setEncoding('utf8');
      child.stderr.on('data', (data) => {
          // Return some data to the renderer process with the mainprocess-response ID
          // mainWindow.webContents.send('mainprocess-response', data);
          //Here is the output from the command
          console.log(data);  
          console.log(command);  
      });
  
      if (typeof callback === 'function')
          callback();
    }
    if (runAHK){
      run_script(path.resolve(PieMenuFolder, 'PieMenu.ahk')) 
    } else {
      run_script(path.resolve(PieMenuFolder, 'PieMenu.exe'))
    }
    console.log(path.resolve(PieMenuFolder, 'PieMenu.ahk'))
    let runningPromise = await waitForPieMenuRunning(runAHK);
    return runningPromise 
  
    function waitForPieMenuRunning(runAHK){
      return new Promise((resolve, reject) => { 
        pieRunningState = false;
        var pieRunningIntervalId = setInterval(isPieMenuRunning, 250)
        setTimeout(pieMenuRunFailed,60000) //
        function pieMenuRunFailed(){
          clearInterval(pieRunningIntervalId)
          reject();
        }
    
        function isPieMenuRunning(){
          let query = (runAHK) ? "PieMenu.ahk" : "PieMenu.exe";
          let platform = process.platform;
            let cmd = '';
            switch (platform) {
                case 'win32' : cmd = `tasklist`; break;
                case 'darwin' : cmd = `ps -ax | grep ${query}`; break;
                case 'linux' : cmd = `ps -A`; break;
                default: break;
            }
            child_process.exec(cmd, (err, stdout, stderr) => {
                pieRunningState = stdout.toLowerCase().indexOf(query.toLowerCase()) > -1;
                if (pieRunningState){
                  resolve();     
                }            
                return pieRunningState;
            });
        }
      })  
    };
  },
  close:function(){}
})

contextBridge.exposeInMainWorld('addCloseWindowListener', function(func){
  ipcRenderer.on('attemptClose', function(event, arg){
    func();    
  })    
})


contextBridge.exposeInMainWorld('closeWindow', function(func){
  ipcRenderer.send('confirmClose')
})


contextBridge.exposeInMainWorld('createWindowSizeListener', function(func){
  ipcRenderer.on('windowResized', function(event, arg){
    func() 
  })    
})

contextBridge.exposeInMainWorld('electron', {
  isDev: function(){
    return ipcRenderer.sendSync('isDev');
  },
  getVersion: function(){
    return ipcRenderer.sendSync('getVersionNumber');
  },
  loadIconImagesToBuffer: function(){    
    let imageBufferDiv = document.getElementById('image-buffer')
    let iconFolder = path.join(PieMenuFolder, 'icons')
    imageBufferDiv.innerHTML = '';
    fs.readdir(iconFolder, function(err, files){
      if (err) {      
        return console.error(err)      
      }
      files.forEach(function(file, index){      
        let img = document.createElement('img');
        img.src = path.join(iconFolder, file)      
        imageBufferDiv.appendChild(img);     
      })
    })
  },
  openEXE: function(){
  // WIN = new BrowserWindow({width: 800, height: 600})
  let options = {
      // See place holder 1 in above image
      title : "Select Program File",
      
      // See place holder 3 in above image
      // buttonLabel : "Open...",
      
      // See place holder 4 in above image
      filters :[
        {name: 'Applications', extensions: ['exe']}        
      ],
      properties: ['openFile']
      }
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  if (filePath != null){
    exeFile = path.basename(filePath[0])
    return exeFile
  } else {
    return null
  }    
  },
  openIconImage: function(){
    let localFilepath = path.join(PieMenuFolder, 'icons')
    let options = {
      // See place holder 1 in above image
      title : "Select Icon Image",
      defaultPath: localFilepath,
      
      // See place holder 3 in above image
      // buttonLabel : "Open...",
      
      // See place holder 4 in above image
      filters :[
        {name: 'Image', extensions: ['png','PNG']}        
      ],
      properties: ['openFile']
      }    
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  if(filePath == null){
    return false
  }else{    
    let iconImageFile = path.basename(filePath[0])    
    return iconImageFile
  }
  
  },
  openScriptFile: function(){
    let localFilepath = path.join(PieMenuFolder, 'Local Scripts')
    let options = {
      // See place holder 1 in above image
      title : "Select File",
      defaultPath: localFilepath,
      
      // See place holder 3 in above image
      buttonLabel : "Select File",
      
      // See place holder 4 in above image
      // filters :[
      //   {name: 'Image', extensions: ['png','PNG']}        
      // ],
      properties: ['openFile']
      }    
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  if(filePath == null){
    return false
  }else{    
    let scriptFile = filePath[0]
    let localScriptFolderName = "Local Scripts"
    if(scriptFile.includes(localScriptFolderName)){
      scriptFile = scriptFile.slice(scriptFile.indexOf(localScriptFolderName))
      scriptFile = scriptFile.replace(localScriptFolderName,"%A_ScriptDir%\\" + localScriptFolderName)
      console.log(scriptFile)
    }    
    return scriptFile
  }
  
  },
  openFolderDialog: function(){
    // let localFilepath = path.join(PieMenuFolder, 'Local Scripts')
    let options = {
      // See place holder 1 in above image
      title : "Select Folder",
      // defaultPath: localFilepath,
      
      // See place holder 3 in above image
      buttonLabel : "Select Folder",
      
      // See place holder 4 in above image
      // filters :[
      //   {name: 'Image', extensions: ['png','PNG']}        
      // ],
      properties: ['openDirectory']
      }    
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  if(filePath == null){
    return false
  }else{    
    let scriptFile = filePath[0]   
    return scriptFile
  }
  
  }
});


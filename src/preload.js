// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.
const fs = require("fs");
const path = require("path");
const { ipcRenderer , contextBridge, shell, app, BrowserWindow, ipcMain } = require('electron');
const { windowManager } = require("node-window-manager");

// var exec = require('child_process').execFile;
const child_process = require('child_process');
const { clearInterval } = require("timers");

// Font Lbraries
const fontList = require('font-list');
// const fontManager = require('electron-font-manager'); //Depreciated, going back to font-list
// const fontManager = require("fontmanager-redux");

const nodeDir = require('node-dir');
// const uuidv4 = require('uuid');

var PieMenuFolder
if (__dirname.includes('app.asar\\src')) {
  PieMenuFolder = path.resolve(__dirname, '..','..','src');  
} else {
  PieMenuFolder = path.resolve(__dirname);  
}
console.log("App folder: " + PieMenuFolder);
var UserDataFolder = path.join(ipcRenderer.sendSync('getUserDataFolder'));
console.log("User Data folder: " + UserDataFolder);

if (!fs.existsSync(path.resolve(UserDataFolder,'User Scripts'))){      
  fs.mkdir(path.resolve(UserDataFolder,'User Scripts'), (err) => {if(err){throw err;}})
}

function copyDirectory(source, destination) {
  fs.mkdirSync(destination, { recursive: true });
  
  fs.readdirSync(source, { withFileTypes: true }).forEach((entry) => {
    let sourcePath = path.join(source, entry.name);
    let destinationPath = path.join(destination, entry.name);

    entry.isDirectory() ? copyDirectory(sourcePath, destinationPath) : fs.copyFileSync(sourcePath, destinationPath);
  });
}

// fs.mkdirSync(path.resolve(UserDataFolder,'icons'), { recursive: true });
// copyDirectory(path.resolve(UserDataFolder,'icons'), path.resolve(PieMenuFolder, 'icons'));

function loadJSONFile(JSONFile){
  let settingsFile = path.join(UserDataFolder,JSONFile);
  let settingsObj = JSON.parse(fs.readFileSync(path.resolve(settingsFile)))     
  return settingsObj
}
function saveJSONFile(JSONFilePath, JSONData){
  let settingsFile
  if (JSONFilePath.indexOf('\\') > -1){
    settingsFile = JSONFilePath  
  } else {
    settingsFile = path.join(UserDataFolder, JSONFilePath)
  }  
    fs.writeFileSync(path.resolve(settingsFile),JSON.stringify(JSONData,null, "\t"), function(err){
      if (err) {
        console.log("Failed to save file.\n" + err)
      }
    })
}



contextBridge.exposeInMainWorld('getDate', function(){
  return getDate();
});
contextBridge.exposeInMainWorld('getNow', function(){
  return ipcRenderer.sendSync('getNow');
});
function getDate(){
  return ipcRenderer.sendSync('getDate');
};

contextBridge.exposeInMainWorld('JSONFile', {
  open: function(JSONFile){  
    return loadJSONFile(JSONFile)
  },
  save: function(JSONFile, JSONData){    
    saveJSONFile(JSONFile, JSONData);
  },
  import: function(destJSONFileName){
    let localFilepath = path.resolve(getUserPath('desktop'));
    let options = {      
      title : "Select AutoHotPie settings file...",
      defaultPath: localFilepath,      
      buttonLabel : "Import Settings",      
      filters :[
        {extensions: ['json']}        
      ],
      properties: ['openFile']
      }    
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  
  if(filePath != null){
    try{
      let settingsFilePath = path.resolve(filePath[0]);   
      console.log(settingsFilePath) 
      fs.copyFileSync(settingsFilePath,path.resolve(UserDataFolder,destJSONFileName))
      let returnObj = loadJSONFile(destJSONFileName)
      // returnObj.global.app.sourceFileName = path.basename(filePath[0])
      return returnObj;
    }catch (e){
      console.log("Failed to import settings file.\n" + filePath[0])
      console.log(e)
      return false
    }
  }    
  },
  export: function(defaultFileName,settingsObj){
    let localFilepath = path.resolve(getUserPath('desktop'),defaultFileName);
    let options = {
      title : "Export AutoHotPie settings",
      defaultPath: localFilepath,      
      buttonLabel : "Export Settings",
      filters :[
        {extensions: ['json']}        
      ],
      properties: ['openFile']
      }
    let filePath = ipcRenderer.sendSync('saveFileDialog', options);
    if (filePath != null){
      fs.writeFile(filePath, JSON.stringify(settingsObj,null, "\t"), function (err) {
        if (err) console.error(err)
      })
    }        
  }
})

contextBridge.exposeInMainWorld('setRunOnLogin', function(runOnLogin, isAHK=false){
  ipcRenderer.send('setRunOnLogin', runOnLogin, isAHK);    
});

contextBridge.exposeInMainWorld('win', {
  focus: function(){
    ipcRenderer.send('focusThisWindow');
  }
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

      console.log(child);

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
        setTimeout(pieMenuRunFailed,60000) 
        function pieMenuRunFailed(){
          clearInterval(pieRunningIntervalId)
          reject();
        }
    
        function isPieMenuRunning(){
          let query = (runAHK) ? "AutoHotkey" : "PieMenu.exe";
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

contextBridge.exposeInMainWorld('generateUUID', function(){
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  );
})

contextBridge.exposeInMainWorld('closeWindow', function(func){
  ipcRenderer.send('confirmClose')
})

function getUserPath(pathString){
  return ipcRenderer.sendSync('getPath', pathString);  
}
// contextBridge.exposeInMainWorld('getPath', function(pathString){
//   return getUserPath(pathString);
// })

contextBridge.exposeInMainWorld('createWindowSizeListener', function(func){
  ipcRenderer.on('windowResized', function(event, arg){
    func()
  })
})

function loadIconImagesToBuffer(){     
  function walk(dir) {
    return new Promise((resolve, reject) => {
      fs.readdir(dir, (error, files) => {
        if (error) {
          return reject(error);
        }
        Promise.all(files.map((file) => {
          return new Promise((resolve, reject) => {
            const filepath = path.join(dir, file);
            fs.stat(filepath, (error, stats) => {
              if (error) {
                return reject(error);
              }
              if (stats.isDirectory()) {
                walk(filepath).then(resolve);
              } else if (stats.isFile()) {
                resolve(filepath);
              }
            });
          });
        }))
        .then((foldersContents) => {
          resolve(foldersContents.reduce((all, folderContents) => all.concat(folderContents), []));
        });
      });
    });
  }  
  let imageBufferDiv = document.getElementById('image-buffer')
  let iconFolder = path.join(PieMenuFolder, 'icons')
  let userIconsFolder = path.join(UserDataFolder, 'icons')
  imageBufferDiv.innerHTML = '';
  walk(iconFolder).then((files) => {
    files.forEach(function(file){
      let img = document.createElement('img');      
      img.src = file
      imageBufferDiv.appendChild(img);     
    })      
  },(err) => {return console.error(err)})
  walk(userIconsFolder).then((files) => {
    files.forEach(function(file){
      let img = document.createElement('img');
      img.src = file
      imageBufferDiv.appendChild(img);     
    })      
  },(err) => {return console.error(err)})
}

contextBridge.exposeInMainWorld('electron', {
  isDev: function(){
    return ipcRenderer.sendSync('isDev');
  },
  getVersion: function(){
    return ipcRenderer.sendSync('getVersionNumber');
  },
  loadIconImagesToBuffer: function(){ 
      loadIconImagesToBuffer();    //Might not need this
  },
  openEXE: function(){
  // WIN = new BrowserWindow({width: 800, height: 600})
  let options = {
      // See place holder 1 in above image
      title : "Select Program Executable",
      
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
  openEXEFullPath: function(){
    // WIN = new BrowserWindow({width: 800, height: 600})
    let options = {
        // See place holder 1 in above image
        title : "Select Program Executable",
        
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
      return filePath[0];
    } else {
      return null
    }    
    },
  // openIconImage: function(){ //May no longer be needed
  //   let localFilepath = path.join(PieMenuFolder, 'icons')
  //   let options = {
  //     // See place holder 1 in above image
  //     title : "Select Icon Image",
  //     defaultPath: localFilepath,
      
  //     // See place holder 3 in above image
  //     // buttonLabel : "Open...",
      
  //     // See place holder 4 in above image
  //     filters :[
  //       {name: 'Image', extensions: ['png','PNG']}        
  //     ],
  //     properties: ['openFile']
  //     }    
  // let filePath = ipcRenderer.sendSync('openFileDialog', options)
  // if(filePath == null){
  //   return false
  // }else{    
  //   let iconImageFile = path.basename(filePath[0])    
  //   return iconImageFile
  // }
  
  // },
  openScriptFile: function(){
    let UserScriptsFolder = path.resolve(UserDataFolder,'User Scripts')
    if (!fs.existsSync(path.resolve(UserDataFolder,'User Scripts'))){      
      fs.mkdir(path.resolve(UserDataFolder,'User Scripts'), (err) => {if(err){throw err;}})
    }
    // let localFilepath = path.join(PieMenuFolder, 'User Scripts')
    let options = {
      // See place holder 1 in above image
      title : "Select File",
      defaultPath: UserScriptsFolder,
      
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
    let localScriptFolderName = "User Scripts"
    if(scriptFile.includes(localScriptFolderName)){
      scriptFile = scriptFile.slice(scriptFile.indexOf(localScriptFolderName))
      scriptFile = scriptFile.replace(localScriptFolderName,"%A_WorkingDir%\\" + localScriptFolderName)
      console.log(scriptFile)
    }    
    return scriptFile
  }
  
  },
  openFolderDialog: function(){
    // let localFilepath = path.join(PieMenuFolder, 'User Scripts')
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
  
  },
  createPortablePackage: function(settingsData){
    let folderName = 'AutoHotPie-Standalone'
    let folderPath = ''
    let localFilepath = path.resolve(getUserPath('desktop'),folderName);
    let options = {
      // See place holder 1 in above image
      title : "Create AutoHotPie portable folder",
      defaultPath: localFilepath,
      
      // See place holder 3 in above image
      buttonLabel : "Select destination folder",
      
      // See place holder 4 in above image
      // filters :[
      //   {name: 'Image', extensions: ['png','PNG']}        
      // ],
      properties: ['openDirectory']
      }    
  let filePath = ipcRenderer.sendSync('openFileDialog', options)
  console.log(filePath)
  if(filePath == null){
    return false
  }else{
    try{
      folderPath = path.join(filePath[0],folderName)
      fs.mkdir(path.resolve(folderPath), {recursive:true},(err)=>{if(err){throw err;}})
      fs.copyFileSync(path.resolve(PieMenuFolder,"PieMenu.ahk"),path.resolve(folderPath,"PieMenu.ahk"))
      // fs.copyFileSync(path.resolve(PieMenuFolder,"PieMenu.exe"),path.resolve(folderPath,"PieMenu.exe"))    
      fs.mkdir(path.resolve(folderPath,'lib'), {recursive:true}, (err)=>{if(err){throw err;}})
      copyDirectory(path.resolve(PieMenuFolder,"lib"),path.resolve(folderPath,'lib'))
      fs.mkdir(path.resolve(folderPath,'icons'), {recursive:true}, (err)=>{if(err){throw err;}})
      copyDirectory(path.resolve(PieMenuFolder,"icons"),path.resolve(folderPath,'icons'))
      copyDirectory(path.resolve(UserDataFolder,"icons"),path.resolve(folderPath,'icons'))
      fs.mkdir(path.resolve(folderPath,'User Scripts'), {recursive:true}, (err)=>{if(err){throw err;}})
      copyDirectory(path.resolve(UserDataFolder,"User Scripts"),path.resolve(folderPath,'User Scripts')) 
      saveJSONFile(path.resolve(folderPath, "AHPSettings.json"), settingsData);
      shell.openPath(folderPath);
    } catch (e){
      alert("Could not create the package at this destination:\n" . folderPath)
      return false
    }
    return true
  }
  }
});

contextBridge.exposeInMainWorld('openResourcesFolder',()=>{
  shell.openPath(PieMenuFolder);
});

contextBridge.exposeInMainWorld('iconManager',{ // FIX MEEEEEEEEEEEEEEEEEEE
  refreshIconLibrary: function(){
    let UserIconsFolder = path.resolve(UserDataFolder,'icons')
    if (!fs.existsSync(UserIconsFolder)){      
      fs.mkdir(UserIconsFolder, (err) => {if(err){throw err;}})
    }

    // copyDirectory(UserIconsFolder, path.resolve(PieMenuFolder,'icons','User Icons'))
    //Don't want to need the combined default and User Icons folder.
    loadIconImagesToBuffer();
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
  addIcons: function(){
    // let localFilepath = path.join(PieMenuFolder, 'icons')
    let options = {
      // See place holder 1 in above image
      title : "Select Icon Images...",
      // defaultPath: localFilepath,
      
      // See place holder 3 in above image
      // buttonLabel : "Open...",
      
      // See place holder 4 in above image
      filters :[
        {name: 'Image', extensions: ['png','PNG']}
      ],
      properties: ['openFile','multiSelections']
      }    
    let icons = ipcRenderer.sendSync('openFileDialog', options)
    if(icons == null){
      console.log('none selected')
      return false
    }else{
      console.log(icons);
      let userIconsFolder = path.join(UserDataFolder, 'icons')
      // let userIconsFolder = path.join(UserDataFolder, 'testIconFolder')
      icons.forEach((icon)=>{
        console.log(icon)
        // fs.copyFile(icon, path.join(userIconsFolder,path.basename(icon)), (err)=>{
        //   console.log(err);
        // });
        fs.copyFileSync(icon, path.join(userIconsFolder,path.basename(icon)));
      });
      
      // let iconImageFile = path.basename(filePath[0])    
      // return iconImageFile
      return
    }  
  },
  openUserIconFolder: function(){
    shell.openPath(path.resolve(UserDataFolder,'icons'));    
  },
  getDefaultIcons: function(){    
    let appIconsFolder = path.resolve(PieMenuFolder,'icons');    
    return nodeDir.promiseFiles(appIconsFolder);
  },
  getUserIcons: function(){    
    let userIconsFolder = path.resolve(UserDataFolder,'icons');
    return nodeDir.promiseFiles(userIconsFolder);
  },
  getLocalIconPath:function(iconFilepath){
    let appIconsFolder = path.resolve(PieMenuFolder,'icons');
    let userIconsFolder = path.resolve(UserDataFolder,'icons');
    let subPat = path.join(appIconsFolder).split('\\').slice(-2); 
    subPat = subPat[0] + '/' + subPat[1];
    // let subPat = path.join(PieMenuFolder);
    let returnPath;
    // console.log(iconFilePath); 
    // console.log(iconFilepath.slice(8) + "\n\n" + userIconsFolder.replaceAll('\\',"/")); 
    userIconFolderStringTest = userIconsFolder.replaceAll('\\',"/");
    if ( iconFilepath.includes(userIconFolderStringTest)){
      // console.log("What")
      returnPath = "%UserIcons%" + iconFilepath.slice(iconFilepath.indexOf(userIconFolderStringTest)+userIconFolderStringTest.length).replaceAll('%20',' ');  
      returnPath = returnPath.replaceAll('/','\\');
      // console.log(returnPath)
      // returnPath = iconFilepath.slice(iconFilepath.indexOf(subPat)+subPat.length+1).replaceAll('%20',' ')         
    } else {
      // console.log("Why doesn't this run?")
      returnPath = iconFilepath.slice(iconFilepath.indexOf(subPat)+subPat.length+1).replaceAll('%20',' ')
    }
    // returnPath = iconFilepath.slice(iconFilepath.indexOf(subPat)+subPat.length+1).replaceAll('%20',' ')
    
    
    // console.log(returnPath)
    return returnPath 
  }
});

contextBridge.exposeInMainWorld('nodePath',{
  basename:function(filepath, removeFromResult=null){
    if (removeFromResult == null){
      return path.basename(filepath);    
    } else {
      return path.basename(filepath, removeFromResult);    
    }
    
  }
})

contextBridge.exposeInMainWorld('font',{
  list: [],
  get: function(){
    return this.list;
  },
  refresh: async function(){
    let fontFamilies = await fontList.getFonts({disableQuoting:true});
    this.list = fontFamilies;    
  },
  getMembers: function(familiy){
    // let members = fontManager.getAvailableMembersOfFontFamily(familiy);
    let members = fontList.getFontsSync({disableQuoting:true, family:familiy});    
    return members        
  }
});

contextBridge.exposeInMainWorld('getActiveWindowProcess', () => {
  return new Promise((resolve, reject) => {
    let delaySeconds = 5;
    function getActiveWindow(){
      let exe = {path:"",name:""};
      exe.path = windowManager.getActiveWindow().path;
      exe.name = path.basename(exe.path);      
      if (["autohotpie.exe","electron.exe"].includes(exe.name.toString().toLowerCase())){        
        reject();        
      } else {
        resolve(exe);        
      }
    }  
    setTimeout(getActiveWindow, (delaySeconds*1000)-300)
  })
});

contextBridge.exposeInMainWorld('windowManager', windowManager);



contextBridge.exposeInMainWorld('menuListener', function(func){
  ipcRenderer.on('menuSelected', function(event, arg){
    func(event, arg);
  })
});
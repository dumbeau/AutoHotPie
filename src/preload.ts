// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.
import { NativeImage, contextBridge, ipcRenderer, globalShortcut } from 'electron';
import { Callbacks } from 'jquery';

window.addEventListener("DOMContentLoaded", () => {
  const replaceText = (selector: string, text: string) => {
    const element = document.getElementById(selector);
    if (element) {
      element.innerText = text;
    }
  };

 
  for (const type of ["chrome", "node", "electron"]) {
    // replaceText(`${type}-version`, process.versions[type as keyof NodeJS.ProcessVersions]);
    replaceText(`${type}-version`, process.version)
  }
});

contextBridge.exposeInMainWorld('AHP', () => {
  let AHP = ipcRenderer.sendSync('getAHP');
  return AHP
});

contextBridge.exposeInMainWorld('createWindowSizeListener', function(func:any){
  ipcRenderer.on('windowResized', function(event, arg){
    func()
  })
})

contextBridge.exposeInMainWorld('settingsHandler', {
  load: () => {
    let settingsObj: string = ipcRenderer.sendSync('loadSettingsFile');
    return settingsObj;
  },
  save: (objectData: AutoHotPie) => {
    ipcRenderer.sendSync('saveSettingsFile',objectData);
    return
  },
  getUserDirectory: (): string => {
    return ipcRenderer.sendSync('getUserDirectory');
  }
});

contextBridge.exposeInMainWorld('getApplicationVersion',() => {
  return ipcRenderer.sendSync('getApplicationVersion');
});

contextBridge.exposeInMainWorld('getActiveWindowProcess', () => {
    return ipcRenderer.invoke('getActiveWindowProcess');    
  });


contextBridge.exposeInMainWorld('processIcon', {
  get(exePath: string): Promise<any> {    
    return ipcRenderer.invoke('getProcessIcon', exePath);    
  },
  async add(imageData: Buffer, name:string): Promise<boolean> {
    return ipcRenderer.sendSync('addProcessIcon', imageData, name)      
  }
});

contextBridge.exposeInMainWorld('iconManager',{
  addIcon: function(){},
  getIcon: function(){},
  getIcons: function(){},
})

contextBridge.exposeInMainWorld('path', {
  basename: function(filePath:string): string{
    return ipcRenderer.sendSync('getPathBasename', filePath)        
  }
});


contextBridge.exposeInMainWorld('globalShortcut', {
  register: (accelerator: string, callback: () => void) => {
    ipcRenderer.invoke('globalShortcutRegister', accelerator);
    ipcRenderer.on('acceleratorPressed', (event, pressedAccelerator) => {
      if (pressedAccelerator === accelerator) {
        callback();
      }
    });
  },
  unregisterHotkey: (accelerator: string) => {
    ipcRenderer.invoke('globalShortcutUnregister', accelerator);
  },
}
);

ipcRenderer.on('initializeOverlayCanvas', ()=>{});

contextBridge.exposeInMainWorld('createOverlayCanvasListener', function(func:any){
  ipcRenderer.on('initializeOverlayCanvas', function(event, arg){    
    func();
  })
})

contextBridge.exposeInMainWorld('clearCanvasListener', function(func:any){
  ipcRenderer.on('clearCanvas', function(event, arg){    
    func();
  })
})
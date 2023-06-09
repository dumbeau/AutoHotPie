const {contextBridge, ipcRenderer} = require('electron')

console.log("preload.js is loaded")

// !!! IMPORTANT !!!
// Also declare the API you want to expose in typings.d.ts
contextBridge.exposeInMainWorld('electronAPI', {
  getSettings: () => ipcRenderer.invoke('getSettings'),
  openInBrowser: (url) => ipcRenderer.invoke('openInBrowser', [url]),
  isUpdateAvailable: () => ipcRenderer.invoke('isUpdateAvailable'),
  getForegroundApplication: () => ipcRenderer.invoke('getForegroundApplication'),
  toggleService: (serviceActive) => ipcRenderer.invoke('toggleService', [serviceActive]),
  listenKeyForResult: () => ipcRenderer.invoke('listenKeyForResult'),
  globalHotkeyServiceExited: (callback) => ipcRenderer.on('globalHotkeyServiceExited', callback),
})

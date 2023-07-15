const {contextBridge, ipcRenderer} = require('electron')

console.log("preload.js is loaded")

// !!! IMPORTANT !!!
// Also declare the API you want to expose in typings.d.ts
contextBridge.exposeInMainWorld('electronAPI', {
  openInBrowser: (url) => ipcRenderer.invoke('openInBrowser', [url]),
  isUpdateAvailable: () => ipcRenderer.invoke('isUpdateAvailable'),
  getForegroundApplication: () => ipcRenderer.invoke('getForegroundApplication'),
  toggleService: (serviceActive) => ipcRenderer.invoke('toggleService', [serviceActive]),
  listenKeyForResult: (ignoredKeys) => ipcRenderer.invoke('listenKeyForResult', [ignoredKeys]),
  getVersion: () => ipcRenderer.invoke('getVersion'),
  globalHotkeyServiceExited: (callback) => ipcRenderer.on('globalHotkeyServiceExited', callback),
  getSetting: (settingName) => ipcRenderer.invoke('getSetting', [settingName]),
  setSetting: (settingName, value) => ipcRenderer.invoke('setSetting', [settingName, value]),
  openDialogForResult: (defaultPath) => ipcRenderer.invoke('openDialogForResult', [defaultPath]),
  getFileIcon: (path) => ipcRenderer.sendSync('getFileIcon', [path]),
})

contextBridge.exposeInMainWorld('log', {
  trace: (message) => ipcRenderer.invoke('trace', [message]),
  debug: (message) => ipcRenderer.invoke('debug', [message]),
  info: (message) => ipcRenderer.invoke('info', [message]),
  warn: (message) => ipcRenderer.invoke('warn', [message]),
  error: (message) => ipcRenderer.invoke('error', [message]),
  fatal: (message) => ipcRenderer.invoke('fatal', [message]),
})

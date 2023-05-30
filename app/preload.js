const { contextBridge, ipcRenderer } = require('electron')

console.log("preload.js is loaded")

// !!! IMPORTANT !!!
// Also declare the API you want to expose in typings.d.ts
contextBridge.exposeInMainWorld('electronAPI', {
  getSettings: () => ipcRenderer.invoke('getSettings'),
})

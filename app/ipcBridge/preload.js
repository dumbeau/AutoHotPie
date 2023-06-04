const {contextBridge, ipcRenderer} = require('electron')

console.log("preload.js is loaded")

// !!! IMPORTANT !!!
// Also declare the API you want to expose in typings.d.ts
contextBridge.exposeInMainWorld('electronAPI', {
    getSettings: () => ipcRenderer.invoke('getSettings'),
    openInBrowser: (url) => ipcRenderer.invoke('openInBrowser', [url]),
    isUpdateAvailable: () => ipcRenderer.invoke('isUpdateAvailable'),
    getForegroundApplication: () => ipcRenderer.invoke('getForegroundApplication'),
    createProfile: (profName, exePath, iconPath) => ipcRenderer.invoke('createProfile', [profName, exePath, iconPath]),
    updateProfileName: (profId, newName) => ipcRenderer.invoke('updateProfileName', [profId, newName]),
    getProfile: (profId) => ipcRenderer.invoke('getProfile', [profId]),
    getProfileIds: () => ipcRenderer.invoke('getProfileIds'),
    getPieMenu: (pieId) => ipcRenderer.invoke('getPieMenu', [pieId]),
    listenHotkeyForResult: () => ipcRenderer.invoke('listenHotkeyForResult'),
    createPieMenu: (pieName, hotkey, activationMode, style, profId) => ipcRenderer.invoke('createPieMenu', [pieName, hotkey, activationMode, style, profId]),
    removePieMenuFromProfile: (profId, pieId) => ipcRenderer.invoke('removePieMenuFromProfile', [profId, pieId]),
    getPieItem: (itemId) => ipcRenderer.invoke('getPieItem', [itemId]),
})

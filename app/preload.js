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

  /**
   * @deprecated
   * @param profId
   * @return {Promise<any>}
   */
  getProfile: (profId) => ipcRenderer.invoke('getProfile', [profId]),
  getProfileIds: () => ipcRenderer.invoke('getProfileIds'),
  getPieMenu: (pieId) => ipcRenderer.invoke('getPieMenu', [pieId]),
  listenHotkeyForResult: () => ipcRenderer.invoke('listenHotkeyForResult'),
  createPieMenuIn: (profId) => ipcRenderer.invoke('createPieMenuIn', [profId]),
  removePieMenuFromProfile: (profId, pieId) => ipcRenderer.invoke('removePieMenuFromProfile', [profId, pieId]),
  getPieItem: (itemId) => ipcRenderer.invoke('getPieItem', [itemId]),
  toggleService: (serviceActive) => ipcRenderer.invoke('toggleService', [serviceActive]),
  listenKeyForResult: () => ipcRenderer.invoke('listenKeyForResult'),
  globalHotkeyServiceExited: (callback) => ipcRenderer.on('globalHotkeyServiceExited', callback),
  updatePieMenu: (json) => ipcRenderer.invoke('updatePieMenu', [json]),
  updateProfile: (json) => ipcRenderer.invoke('updateProfile', [json]),
})

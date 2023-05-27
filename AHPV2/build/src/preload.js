"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.
// const { app, contextBridge, ipcRenderer } = require('electron');
const electron_1 = require("electron");
window.addEventListener("DOMContentLoaded", () => {
    const replaceText = (selector, text) => {
        const element = document.getElementById(selector);
        if (element) {
            element.innerText = text;
        }
    };
    for (const type of ["chrome", "node", "electron"]) {
        // replaceText(`${type}-version`, process.versions[type as keyof NodeJS.ProcessVersions]);
        replaceText(`${type}-version`, process.version);
    }
});
// var AHP = new AutoHotPie().settingsBuilder.load("C:\\Users\\Beau\\beaugilles\\Projects\\PM\\AutoHotPie\\project files\\code\\Electron\\AutoHotPie\\AHPSettings-saved.json");
electron_1.contextBridge.exposeInMainWorld('AHP', () => {
    let AHP = electron_1.ipcRenderer.sendSync('getAHP');
    return AHP;
});
electron_1.contextBridge.exposeInMainWorld('createWindowSizeListener', function (func) {
    electron_1.ipcRenderer.on('windowResized', function (event, arg) {
        func();
    });
});
electron_1.contextBridge.exposeInMainWorld('settingsHandler', {
    load: () => {
        let settingsObj = electron_1.ipcRenderer.sendSync('loadSettingsFile');
        return settingsObj;
    },
    save: (objectData) => {
        electron_1.ipcRenderer.sendSync('saveSettingsFile', objectData);
        return;
    },
    getUserDirectory: () => {
        return electron_1.ipcRenderer.sendSync('getUserDirectory');
    }
});
electron_1.contextBridge.exposeInMainWorld('getApplicationVersion', () => {
    return electron_1.ipcRenderer.sendSync('getApplicationVersion');
});
electron_1.contextBridge.exposeInMainWorld('getActiveWindowProcess', () => {
    return electron_1.ipcRenderer.sendSync('getActiveWindowProcess');
});
electron_1.contextBridge.exposeInMainWorld('processIcon', {
    get(exePath) {
        return electron_1.ipcRenderer.invoke('getProcessIcon', exePath);
    },
    async add(imageData, name) {
        return electron_1.ipcRenderer.sendSync('addProcessIcon', imageData, name);
    }
});
electron_1.contextBridge.exposeInMainWorld('iconManager', {
    addIcon: function () { },
    getIcon: function () { },
    getIcons: function () { },
});
electron_1.contextBridge.exposeInMainWorld('path', {
    basename: function (filePath) {
        return electron_1.ipcRenderer.sendSync('getPathBasename', filePath);
    }
});
//# sourceMappingURL=preload.js.map
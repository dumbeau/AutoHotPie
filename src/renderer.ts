// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// No Node.js APIs are available in this process unless
// nodeIntegration is set to true in webPreferences.
// Use preload.js to selectively enable features
// needed in the renderer process.

//#region Global declarations
declare namespace settingsHandler {
    function load():any;
    function save(objectData:AutoHotPie):void;
    function getUserDirectory():string;
}
declare namespace jscolor {
    var presets: any;
    function install():void;
    function processValueInput(color:string): void;
}
interface HTMLElement {
    jscolor: any;
    width: number;
    height: number;
} 
declare function getActiveWindowProcess(): Promise<any>

declare interface GlobalShortcut {
    register(accelerator: Accelerator, callback: () => void): boolean;
    isRegistered(accelerator: Accelerator): boolean;
    unregister(accelerator: Accelerator): void;
    unregisterAll(): void;
  }  
declare type Accelerator = string;  
declare var globalShortcut: GlobalShortcut;

declare function createOverlayCanvasListener(func: () => void): void;
declare function clearCanvasListener(func: () => void): void;
//#endregion

//#region Global renderer functions
function captureElementTemplate(elementID: string): JQuery<HTMLElement>{
    // return $('#' + elementID);    
    let elementClipboard = $('#element-clipboard'); 
    let foundElements = checkElementClipboard(elementID);   
    let element: JQuery<HTMLElement>;
    if (foundElements.length == 0){
        // search globally
        element = $('#' + elementID).first(); 
        element.appendTo('#element-clipboard');        
        console.log('Appended element to clipboard');
        foundElements = checkElementClipboard(elementID);        
    }
    let returnElement = foundElements.first().clone()
    returnElement.removeAttr('id');
    return returnElement; 
      
    function checkElementClipboard(id:string){
        return elementClipboard.find('#' + elementID);
    }
}
//#endregion


//Hide page tabs
$('#full-page-tab-items').hide();
$('#app-with-sidebar-tab-items').hide();


const Pages = {
    editProfile: new EditProfilePage(2),
    newProfile: new NewProfilePage(7),
    newPieMenu: new NewPieMenuPage(11),
    editPieMenu: new EditPieMenuPage(3)
}
const Sidebar = new SidebarComponent();


// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// No Node.js APIs are available in this process unless
// nodeIntegration is set to true in webPreferences.
// Use preload.js to selectively enable features
// needed in the renderer process.

$(".hidden-bootstrap-page-tabs .nav-tabs").hide();

declare namespace settingsHandler {
    function load():any;
    function save(objectData:AutoHotPie):void;
    function getUserDirectory():string;
}

declare namespace processIcon {
    function get(exePath: string): Promise<string>;
    function add(imageData: Buffer, name:string): Promise<boolean>;       
}



declare namespace path {
    function basename(filePath: string): string;
}

declare namespace jscolor {
    var presets: any;
    function install():void;
    function processValueInput(color:string): void;
}
interface HTMLButtonElement {
    jscolor: any;
}
interface HTMLElement {
    jscolor: any;
}

declare namespace iconManager {
    function addIcon(): void;
    function getIcon(): Promise<string>;
    function getIcons(): Promise<string[]>;
}



declare function createWindowSizeListener(func:any):void; 

//Load autohotpie object

//Set JSColor default
jscolor.presets.default = {
	backgroundColor:'rgba(68,68,68,1)', hash:false, hideOnPaletteClick:true, shadowColor:'rgba(0,0,0,0.65)', borderRadius:2, borderWidth:0, previewSize:50, width:300, height:150, 
    pointerThickness:1, forceStyle: true	
};
jscolor.install();


function loadAutoHotPie(testObject: any): AutoHotPie{
    
    if (testObject.version){
        return new AutoHotPie(testObject);
    } else {
        //First time run
        let defaultAutoHotPieSettings = new AutoHotPie({
            applicationProfiles: [new ApplicationProfile({
                name: "Default Profile",
                executables: [new ApplicationExecutable("regApps")],
                icon:"AutoHotPieIcon.svg",
                pieMenus: [new PieMenu({
                    hotkey: new Hotkey("w"),
                    name:"My first Pie Menu",
                    pieItems: [new PieItem({
                        text: "Center"
                    }),new PieItem({
                        text: "Slice 1"
                    }),new PieItem({
                        text: "Slice 2"
                    }),new PieItem({
                        text: "Slice 3"
                    }),new PieItem({
                        text: "Slice 4"
                    }),new PieItem({
                        text: "Slice 5"
                    }),new PieItem({
                        text: "Slice 6"
                    })]
                })]                
            })]        
        })
        return defaultAutoHotPieSettings        
    }

}

var ahp: AutoHotPie = loadAutoHotPie(settingsHandler.load());

console.log(ahp);
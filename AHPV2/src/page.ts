// class Page {
//     private tabNumber: number;
//     globalTabWithSidebar = $('[href="#tab-6"]');
//     mainAppTabs = $('#app-with-sidebar-tab-items');

//     constructor(tabNumber: number) {
//         this.tabNumber = tabNumber;
//     }

//     open() {
//         let tab = $('[href="#tab-' + this.tabNumber.toString() + '"]');
//         if (tab.parents()[1].id == this.mainAppTabs[0].id) {
//             this.globalTabWithSidebar[0].click();
//         }
//         tab[0].click();
//     }

//     getActivePage() {
//         let globalTabActive = this.globalTabWithSidebar.tabs("option", "active");
//         let mainTabActive = this.mainAppTabs.tabs("option", "active");
//     }
// }

class Page {
    private static pages: Page[] = [];
    private tabNumber: number;
    private globalTabWithSidebar = $('[href="#tab-6"]');
    private mainAppTabs = $('#app-with-sidebar-tab-items');
    public active: boolean = false;

    constructor(tabNumber: number) {
        this.tabNumber = tabNumber;
        this.active = false;
        Page.pages.push(this);
    }

    open() {
        let tab = $('[href="#tab-' + this.tabNumber.toString() + '"]');
        if (tab.parents()[1].id == this.mainAppTabs[0].id) {
            this.globalTabWithSidebar[0].click();
        }
        tab[0].click();
        Page.pages.forEach(page => page.active = false);
        this.active = true;
    }
}


function captureElementTemplate(elementID:string): JQuery<HTMLElement>{
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
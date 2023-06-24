"use strict";
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
    constructor(tabNumber) {
        this.globalTabWithSidebar = $('[href="#tab-6"]');
        this.mainAppTabs = $('#app-with-sidebar-tab-items');
        this.active = false;
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
Page.pages = [];
function captureElementTemplate(elementID) {
    // return $('#' + elementID);    
    let elementClipboard = $('#element-clipboard');
    let foundElements = checkElementClipboard(elementID);
    let element;
    if (foundElements.length == 0) {
        // search globally
        element = $('#' + elementID).first();
        element.appendTo('#element-clipboard');
        console.log('Appended element to clipboard');
        foundElements = checkElementClipboard(elementID);
    }
    let returnElement = foundElements.first().clone();
    returnElement.removeAttr('id');
    return returnElement;
    function checkElementClipboard(id) {
        return elementClipboard.find('#' + elementID);
    }
}
//# sourceMappingURL=page.js.map
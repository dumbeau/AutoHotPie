"use strict";
class NewPieMenuPage extends Page {
    constructor(pageTabNumber) {
        super(pageTabNumber);
        this.nameTextInput = $('#new-pie-menu-name-text-input');
        this.hotkeyBtn = $('#new-pie-menu-hotkey-btn');
        this.modeBtn = $('#new-pie-menu-mode-btn');
        this.selectionColorInput = $('#new-pie-menu-selection-color-input')[0].jscolor;
        this.backgroundColorInput = $('#new-pie-menu-background-color-input')[0].jscolor;
        this.cancelBtn = $('#new-pie-menu-cancel-btn');
        this.createBtn = $('#new-pie-menu-create-btn');
        this.selectedApplicationProfile = new ApplicationProfile();
        this.createBtn.on('click', () => {
            this.resolve();
        });
        this.cancelBtn.on('click', () => {
            this.reject();
        });
        this.hotkeyBtn.on('click', () => { });
        this.modeBtn.on('click', () => { });
    }
    addPieMenu(selectedApplicationProfile) {
        this.selectedApplicationProfile = selectedApplicationProfile;
        this.open();
        return this.waitForUserSubmission().then(() => {
            var _a;
            //resolved    
            let pieMenu = new PieMenu({
                name: (_a = this.nameTextInput.val()) === null || _a === void 0 ? void 0 : _a.toString(),
                hotkey: new Hotkey(this.hotkeyBtn.html()),
                selectionColor: new Color(this.selectionColorInput.processValueInput()),
                backgroundColor: new Color(this.backgroundColorInput.processValueInput()),
                activation: { mode: 1 } //TODO: Add mode selection
            }, this.selectedApplicationProfile);
            this.selectedApplicationProfile.pieMenus.push(pieMenu);
            return this.selectedApplicationProfile;
        });
    }
    waitForUserSubmission() {
        return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;
        });
    }
    ;
}
;
var newPieMenuPage = new NewPieMenuPage(11);
//# sourceMappingURL=new_pie_menu.js.map
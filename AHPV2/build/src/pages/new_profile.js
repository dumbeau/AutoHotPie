"use strict";
class NewProfilePage extends Page {
    constructor(pageTabNumber) {
        super(pageTabNumber);
        this.getFocusedApplicationButton = $('#get-focused-application-btn');
        this.profileNameTextInput = $('#profile-name-text-input');
        this.profileExecutableTextInput = $('#profile-executable-text-input').first();
        this.profileExecutableSelectPathButton = $('#profile-executable-select-path-button');
        this.cancelButton = $('#cancel-new-profile-button');
        this.submitButton = $('#submit-new-profile-button');
        this.backButton = $('#new-profile-back-button');
        this.iconTestDiv = $('#icon-test-div');
        this.icon = "";
        this.name = "";
        this.backButton.on('click', () => {
            this.reject();
        });
        this.submitButton.on('click', () => {
            //If fields filled:            
            this.resolve();
        });
        this.getFocusedApplicationButton.on('click', () => {
            getFocusedApplicationPage.run().then((exeInfo) => {
                this.open();
                this.profileNameTextInput.val(exeInfo.name);
                // this.profileExecutableTextInput.val(exeInfo.exe);
                this.profileExecutableTextInput.val(exeInfo.path);
                //exeInfo.path;
                let exeIconName = exeInfo.exe.replace(".exe", "");
                // this.icon = exeIconName;     
                // if (typeof exeInfo.icon === "")                
                // this.icon = "data:image/png;base64," + exeInfo.icon;                              
                // processIcon.add(exeInfo.icon, exeIconName);
            });
        });
    }
    waitForUserSubmission() {
        return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;
        });
    }
    async createNewProfile() {
        this.open();
        this.profileNameTextInput.val("");
        this.profileExecutableTextInput.val("");
        let profilePromise = await this.waitForUserSubmission().then(() => {
            var _a;
            //resolved    
            console.log(this.profileExecutableTextInput.val());
            let exeString = this.profileExecutableTextInput.val();
            exeString = (typeof exeString === 'string') ? exeString : "";
            let appProfile = new ApplicationProfile({
                name: (_a = this.profileNameTextInput.val()) === null || _a === void 0 ? void 0 : _a.toString(),
                executables: [new ApplicationExecutable(exeString)],
                icon: this.icon
            });
            return appProfile;
        }, () => {
            throw new Error('User did not want to make a new profile');
        });
        return profilePromise;
    }
}
var newProfilePage = new NewProfilePage(7);
//# sourceMappingURL=new_profile.js.map
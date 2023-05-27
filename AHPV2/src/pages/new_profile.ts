class NewProfilePage extends Page {
    public constructor(pageTabNumber:number){
        super(pageTabNumber); 
        this.backButton.on('click', () => {                        
            this.reject();            
        })
        this.submitButton.on('click', () => {              
            //If fields filled:            
            this.resolve();
        })    
        this.getFocusedApplicationButton.on('click', () => {            
            getFocusedApplicationPage.run().then((exeInfo) =>{                
                this.open();                
                this.profileNameTextInput.val(exeInfo.name);                
                // this.profileExecutableTextInput.val(exeInfo.exe);
                this.profileExecutableTextInput.val(exeInfo.path);
                //exeInfo.path;
                let exeIconName = exeInfo.exe.replace(".exe","")
                // this.icon = exeIconName;     
                // if (typeof exeInfo.icon === "")                
                // this.icon = "data:image/png;base64," + exeInfo.icon;                              
                // processIcon.add(exeInfo.icon, exeIconName);
            });
        });
    }
    getFocusedApplicationButton = $('#get-focused-application-btn');
    profileNameTextInput = $('#profile-name-text-input');
    profileExecutableTextInput = $('#profile-executable-text-input').first();
    profileExecutableSelectPathButton = $('#profile-executable-select-path-button');
    cancelButton = $('#cancel-new-profile-button');
    submitButton = $('#submit-new-profile-button');
    backButton = $('#new-profile-back-button');
    iconTestDiv = $('#icon-test-div');
    icon: string = "";
    name: string = "";

    resolve: any;
    reject: any;

    waitForUserSubmission(){return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;        
        });
    }
    async createNewProfile(): Promise<ApplicationProfile> {        
        this.open();
        this.profileNameTextInput.val("");        
        this.profileExecutableTextInput.val("");
        
        let profilePromise = await this.waitForUserSubmission().then(():ApplicationProfile=>{
            //resolved    
            console.log(this.profileExecutableTextInput.val());
            let exeString = this.profileExecutableTextInput.val();
            exeString = (typeof exeString === 'string') ? exeString : "";      
            let appProfile = new ApplicationProfile({
                name: this.profileNameTextInput.val()?.toString(),
                executables: [new ApplicationExecutable(exeString)],
                icon: this.icon
            });            
            
            return appProfile
        },()=>{
            throw new Error('User did not want to make a new profile');
        });
        return profilePromise; 
    }
}
var newProfilePage = new NewProfilePage(7);
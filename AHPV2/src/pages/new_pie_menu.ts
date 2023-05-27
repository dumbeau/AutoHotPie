class NewPieMenuPage extends Page {  
    constructor(pageTabNumber:number){
        super(pageTabNumber);   
        this.selectedApplicationProfile = new ApplicationProfile();    
        
        this.createBtn.on('click', () => {
            this.resolve();
        });
        this.cancelBtn.on('click', () => {
            this.reject();
        });
        this.hotkeyBtn.on('click', () => {});
        this.modeBtn.on('click', () => {}); 
    }  

    nameTextInput = $('#new-pie-menu-name-text-input');
    hotkeyBtn = $('#new-pie-menu-hotkey-btn');
    modeBtn = $('#new-pie-menu-mode-btn');
    

    selectionColorInput = $('#new-pie-menu-selection-color-input')[0].jscolor;
    backgroundColorInput = $('#new-pie-menu-background-color-input')[0].jscolor;
    cancelBtn = $('#new-pie-menu-cancel-btn');
    createBtn = $('#new-pie-menu-create-btn');

    selectedApplicationProfile: ApplicationProfile;
    selectedMode: any;

    addPieMenu(selectedApplicationProfile: ApplicationProfile): Promise<ApplicationProfile> {
        this.selectedApplicationProfile = selectedApplicationProfile;
        this.open();
        return this.waitForUserSubmission().then(():ApplicationProfile=>{
            //resolved    
            let pieMenu = new PieMenu({
                name: this.nameTextInput.val()?.toString(),
                hotkey: new Hotkey(this.hotkeyBtn.html()),
                selectionColor: new Color(this.selectionColorInput.processValueInput()),
                backgroundColor: new Color(this.backgroundColorInput.processValueInput()),
                activation: {mode: 1} //TODO: Add mode selection
            }, this.selectedApplicationProfile);
            this.selectedApplicationProfile.pieMenus.push(pieMenu);
            return this.selectedApplicationProfile;
        });
    }

    resolve: any;
    reject: any;

    waitForUserSubmission(){return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;        
        });
    };
    
    
};

var newPieMenuPage = new NewPieMenuPage(11);
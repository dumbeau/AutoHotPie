var exitPage = {
    resolve: null,
    reject: null,
    backBtn: $('#exit-back-btn'),
    dontSaveBtn: $('#exit-dont-save-btn'),
    saveQuitBtn: $('#exit-save-btn'),
    runPieMenusCheckbox: $('#run-on-exit-checkbox'),
    alwaysRunCheckbox: $('#confirm-exit-always-run-checkbox'),
    initialize: function(){
        this.backBtn.on('click', () => {
            profileManagement.open();
        });
        this.dontSaveBtn.on('click', () => {
            if (AutoHotPieSettings.global.startup.runOnAppQuit){
                RunPieMenuApp();
            } else {
                closeWindow();
            }            
        });
        this.saveQuitBtn.on('click', () => {
            JSONFile.save(SettingsFileName, AutoHotPieSettings);            
            if (AutoHotPieSettings.global.startup.runOnAppQuit){
                RunPieMenuApp();
            } else {
                closeWindow();
            }
        });
        this.runPieMenusCheckbox.change((e) => {            
            AutoHotPieSettings.global.startup.runOnAppQuit = this.runPieMenusCheckbox.is(":checked");            
        });
        this.alwaysRunCheckbox.change((e) => {            
            AutoHotPieSettings.global.startup.alwaysRunOnAppQuit = this.alwaysRunCheckbox.is(":checked");            
        });
    },
    open: function (){
        $('[href="#tab-31"]').tab('show');
    },
    refresh: function(){   
        // console.log(AutoHotPieSettings.global.startup.runOnAppQuit);     
        this.runPieMenusCheckbox.prop('checked', AutoHotPieSettings.global.startup.runOnAppQuit);        
        this.alwaysRunCheckbox.prop('checked', AutoHotPieSettings.global.startup.alwaysRunOnAppQuit);        
    }
}

// exitPage.initialize();

function ExitApp(){
    if(AutoHotPieSettings.global.startup.alwaysRunOnAppQuit){
        JSONFile.save(SettingsFileName, AutoHotPieSettings)
        RunPieMenuApp();
    } else {
        exitPage.open();
        exitPage.refresh();
    }    
}
var exitPage = {
    resolve: null,
    reject: null,
    backBtn: $('#exit-back-btn'),
    dontSaveBtn: $('#exit-dont-save-btn'),
    saveQuitBtn: $('#exit-save-btn'),
    runPieMenusCheckbox: $('#run-on-exit-checkbox'),
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
            JSONFile.save(SettingsFileName, AutoHotPieSettings)
            if (AutoHotPieSettings.global.startup.runOnAppQuit){
                RunPieMenuApp();
            } else {
                closeWindow();
            }
        });
        this.runPieMenusCheckbox.change((e) => {            
            AutoHotPieSettings.global.startup.runOnAppQuit = this.runPieMenusCheckbox.is(":checked");            
        });
    },
    open: function (){
        $('[href="#tab-31"]').tab('show');
    },
    refresh: function(){   
        // console.log(AutoHotPieSettings.global.startup.runOnAppQuit);     
        this.runPieMenusCheckbox.prop('checked', AutoHotPieSettings.global.startup.runOnAppQuit);        
    }
}

exitPage.initialize();

function ExitApp(){
    exitPage.open();
    exitPage.refresh();
}
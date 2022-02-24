

function InitializeAppPages(){
    profileManagement.initialize();
    editPieMenu.initialize();
    handleAppClose.initialize();
    globalSettings.initialize();
    actModePage.initialize();
    confirmationDialog.initialize();
    configureNewProfile.initialize();
    createNewScriptPage.initialize();
    newPieMenu.initialize();
    runningPieMenu.initialize();
    selectIconPage.initialize();
    hotkeyManagement.initialize();
    functionSelectPage.initialize();
    exitPage.initialize();
    ErrorPage.initialize();
    editScriptPage.initialize();
}

InitializeAppPages();

//Open profilemanagement page
setTimeout(function(){
    try {        
        $('[href="#tab-1"]').tab('show');        
    } catch (e) {
        setTimeout(function(){$('[href="#tab-1"]').tab('show');},2000)
    }
},100)

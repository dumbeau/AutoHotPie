menuListener(function(event, arg){    
    switch (arg){
        case 'importSettings':
        {
            let importStatus = JSONFile.import(SettingsFileName);            
            if (importStatus){
                //Need to set function to 
                LoadSettingsJsonFile(SettingsFileName);
                profileManagement.selectProfile(0);
                globalSettings.refresh();
            }
            return
        }
        case 'exportSettings':
        {
            JSONFile.export(SettingsFileName.replace('.json', "-" + getDate() + '.json'), AutoHotPieSettings)
            return
        }
        case 'createPortablePackage':
        {            
            electron.createPortablePackage(AutoHotPieSettings);
            return
        }
        case 'saveAndRun':
        {
            JSONFile.save(SettingsFileName, AutoHotPieSettings)
            closeWindow();
            return
        }
        case 'close':
        {            
            closeWindow();
            return
        }
        case 'openResources':
        {
            openResourcesFolder();
            return
        }
        default:
            return            
    }
});

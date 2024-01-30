var handleAppClose = {
    initialize:function(){
        addCloseWindowListener(e => {
            ExitApp();                 
        })
    }
}

var profileManagement = {
    selectedProfile:{},
    initialize:function(){       
        this.profileList.initialize();
        this.selectProfile(0);
        this.pieEnableKey.initialize();
        this.associatedPrograms.initialize();
        this.pieMenuOverview.initialize();        
    },
    open:function(){
        this.updateUIControls()
        $('[href="#tab-1"]').tab('show');        
    },
    updateUIControls: function(){   
        profileButton = document.getElementById("app-profile-dropdown-button")
        profileDropDown = document.getElementById("app-profile-dropdown-items")           

        profileDropDown.innerHTML = "";        
        profileButton.innerHTML = this.selectedProfile.name

        AutoHotPieSettings.appProfiles.forEach(function(appProfile,index){
            
            var appProfileOption = document.createElement("a")
            appProfileOption.setAttribute("id","app-profile-item")
            appProfileOption.setAttribute("class","dropdown-item")
            appProfileOption.text = appProfile.name
            profileDropDown.appendChild(appProfileOption)        
        })   
        let enabledCheckbox = document.getElementById("profile-enabled-checkbox")        
        enabledCheckbox.checked = this.selectedProfile.enable;        

        let deleteBtn = document.getElementById("delete-app-profile-btn") 
        if (this.selectedProfile.name == "Default Profile"){            
            deleteBtn.style.display = 'none'
        } else {
            deleteBtn.style.display = 'block'
        }
        this.pieEnableKey.updateUIControls();   
        this.associatedPrograms.updateUIControls();   
        this.pieMenuOverview.updateUIControls();   
    },

    selectProfile: function(profileIndex){        
        this.selectedProfile = AutoHotPieSettings.appProfiles[profileIndex]
        this.updateUIControls();
    },
    deleteProfile: function(){        
        let profileIndex = AutoHotPieSettings.appProfiles.indexOf(this.selectedProfile)        
        AutoHotPieSettings.appProfiles.splice(profileIndex,1)
        this.selectProfile(profileIndex-1)
    },
    addProfile: function(profileObject){
        AutoHotPieSettings.appProfiles.push(profileObject)
        this.selectProfile(AutoHotPieSettings.appProfiles.length-1)
    },
    deletePieKey: function(pieKeyIndex){        
        this.selectedProfile.pieKeys.splice(pieKeyIndex,1)
        this.updateUIControls()                        
    },
    addPieKey: function(){
        
    },
    getInvalidPieKeys: function(){
        let usedAHKKeys = [];
        for (pieKeyIndex in this.selectedProfile.pieKeys){
            let pieKey = this.selectedProfile.pieKeys[pieKeyIndex].hotkey
            usedAHKKeys.push(pieKey)
        }
        if (this.selectedProfile.pieEnableKey.useEnableKey){
            usedAHKKeys.push(this.selectedProfile.pieEnableKey.enableKey);
        }
        return usedAHKKeys;
    },
    profileList: {
        initialize: function(){            
            this.createProfileSelectionListener();        
            this.createNewProfileBtnListener()   ;     
            this.createEnableCheckboxListener()  ;      
            this.createDeleteProfileBtnListener();
            this.createSaveAndRunBtnListener();
            this.createSettingsBtnListener();
        },
        createProfileSelectionListener: function() {                 
            $('#app-profile-dropdown-items').on('click', 'a', function(event) {
                var appProfileName = this.textContent;
                profileManagement.selectProfile( $(this).index() )
                profileButton.innerHTML = appProfileName                
            });
        },
        createNewProfileBtnListener: function() { 
            document.getElementById("new-profile-btn").addEventListener("click", function(event){            
                configureNewProfile.open()
            });
        },
        createDeleteProfileBtnListener: function() { 
            document.getElementById("delete-app-profile-btn").addEventListener("click", function(event){                
                let confirm = confirmDialog().then(val => {                    
                    profileManagement.open() 
                    profileManagement.deleteProfile()                  
                }, val => {                   
                    profileManagement.open() 
                });                
            });
        },
        createEnableCheckboxListener: function() {            
            checkbox = document.getElementById("profile-enabled-checkbox")
            checkbox.addEventListener("click", function(event){
                profileManagement.selectedProfile.enable = checkbox.checked
            });
        },
        createSaveAndRunBtnListener: function(){
            let btn = document.getElementById('save-and-run-pie-menus')
            btn.addEventListener('click', function(){ 
                runningPieMenu.open();                   
                JSONFile.save(SettingsFileName, AutoHotPieSettings);
                RunPieMenuApp(); 
            });
        },
        createSettingsBtnListener: function(){
            let btn = document.getElementById('settings-btn')
            btn.addEventListener('click', function(){
                // throw 'EVERYTHING IS BAD';
                globalSettings.open();
            });
        }
             
        
    },

    pieEnableKey:{
        initialize:function(){
            this.addPieEnableKeyCheckBoxListener()
            this.addPieEnableKeyBtnListener()
            this.addPieEnableKeyModeRadioHoldListener()
            this.addPieEnableKeyModeRadioHoldListener()
            this.addPieEnableKeyModeRadioToggleListener()
            this.addMoreSettingsListener();  
            this.addPieEnableKeySendOriginalFuncListener();  
            $('#less-profile-settings-btn-text').toggle();                
            $('#more-profile-settings-div').toggle();                                       
            this.updateUIControls()               
        },
        updateUIControls:function(){
            selectedPieEnableKey = profileManagement.selectedProfile.pieEnableKey
            this.pieEnableCheckBox.checked = selectedPieEnableKey.useEnableKey;
            if (selectedPieEnableKey.useEnableKey){
                //disable controls //mute div
                this.pieEnableDiv.removeClass("text-muted");                
                this.keyBtn.removeClass("btn btn-secondary disabled");               
                this.keyBtn.removeClass("btn btn-secondary");
                this.keyBtn.addClass("btn btn-secondary");                
            }else{                
                this.pieEnableDiv.removeClass("text-muted");
                this.pieEnableDiv.addClass("text-muted");
                this.keyBtn.removeClass("btn btn-secondary disabled");               
                this.keyBtn.removeClass("btn btn-secondary");                
                this.keyBtn.addClass("btn btn-secondary disabled");                                                
            }
            
            this.keyBtn.html(new Hotkey(selectedPieEnableKey.enableKey).displayKey);
            this.modeRadioHold.checked = !(selectedPieEnableKey.toggle);
            this.modeRadioToggle.checked = selectedPieEnableKey.toggle;
            this.sendOriginalFuncCheckbox.prop('checked', selectedPieEnableKey.sendOriginalFunc);
            if (selectedPieEnableKey.toggle == false){                
                this.sendOriginalFuncDiv.show();
            } else {
                this.sendOriginalFuncDiv.hide();
            }
            

        },
        moreSettingsBtn:$('#more-settings-accordion'),        
        addMoreSettingsListener: function(){            
            this.moreSettingsBtn.on('click', () => {                
                $('#more-profile-settings-div').toggle();                
                $('#more-profile-settings-btn-text').toggle();                
                $('#less-profile-settings-btn-text').toggle();                
            });            
        },
        pieEnableDiv: $('#pie-enable-div'),
        pieEnableCheckBox: document.getElementById("pie-enable-key-check"),        
        addPieEnableKeyCheckBoxListener: function(){
            let checkbox = this.pieEnableCheckBox          
            checkbox.addEventListener("click", function(event){
                profileManagement.selectedProfile.pieEnableKey.useEnableKey = checkbox.checked;
                profileManagement.pieEnableKey.updateUIControls();
            }); 
        },
        keyBtn: $("#pie-enable-key-btn"),
        addPieEnableKeyBtnListener: function(){
            keyBtn = this.keyBtn
            keyBtn.on("click", function(event){
                assignKey({invalidAHKKeys:profileManagement.getInvalidPieKeys()}).then(val => { 
                    profileManagement.selectedProfile.pieEnableKey.enableKey = val.ahkKey                    
                    keyBtn.innerHTML = val.displayKey                 
                    profileManagement.open()
                }, val => {                   
                    profileManagement.open()
                });
            })  
        },
        modeRadioHold:document.getElementById("pie-enable-key-radio-hold"),
        addPieEnableKeyModeRadioHoldListener:function(){            
            this.modeRadioHold.addEventListener("click", function(event){
                profileManagement.selectedProfile.pieEnableKey.toggle = false;
                profileManagement.pieEnableKey.updateUIControls();               
            })
        },
        modeRadioToggle: document.getElementById("pie-enable-key-radio-toggle"),
        addPieEnableKeyModeRadioToggleListener:function(){            
            this.modeRadioToggle.addEventListener("click", function(event){
                profileManagement.selectedProfile.pieEnableKey.toggle = true;
                profileManagement.pieEnableKey.updateUIControls();    
            })                   
        },
        sendOriginalFuncDiv: $('#send-original-key-checkbox-div'),
        sendOriginalFuncCheckbox: $('#send-original-key-checkbox-input'),
        addPieEnableKeySendOriginalFuncListener: function(){
            this.sendOriginalFuncCheckbox.on('click', () => {                
                profileManagement.selectedProfile.pieEnableKey.sendOriginalFunc = profileManagement.pieEnableKey.sendOriginalFuncCheckbox.is(":checked");
                profileManagement.pieEnableKey.updateUIControls();
            });
        }
    },
    associatedPrograms:{
        initialize:function(){
            // this.addProgramListListener()
            this.addProgramBtnListener();
            this.updateUIControls();
            this.addRemoveEventListener();
        },
        updateUIControls:function(){
            let selectedProfile = profileManagement.selectedProfile            
            let assignedProgramDiv = document.getElementById("assigned-programs-div")
            if (selectedProfile.name == "Default Profile"){
                assignedProgramDiv.style.display = "none"                
            }else{
                assignedProgramDiv.style.display = "block"
            };            
            this.programList.innerHTML = ""            
            function addProgramListDiv(ahkHandle){
                let programListItem = $('#program-list-item-template').clone();
                programListItem.removeAttr('id');
                programListItem.children('p').html(ahkHandle)
                // console.log(programListItem.children('div:eq(1)').children('p').html(ahkHandle))
                programListItem.children('div:eq(1)').children('p').html(ahkHandle)
                $('#assigned-programs-list').append(programListItem)
            }
            selectedProfile.ahkHandles.forEach(function(ahkHandle,index){ // Populate List
                addProgramListDiv(ahkHandle);
            });  
            if ($('#assigned-programs-list').children().length == 1){
                $('[name="program-remove-btn"]').hide();
            }else{
                $('[name="program-remove-btn"]').show();
            }
        },        
        programList:document.getElementById("assigned-programs-list"),
        programListItem: document.getElementsByName("assigned-programs-item")[0],

        // addProgramListListener:function(){       
        // },
        addProgramBtn:document.getElementById("add-program-btn"),
        addProgramBtnListener:function(){            
            this.addProgramBtn.addEventListener("click", function(event){  
                let exeName = electron.openEXE()                
                if (exeName){
                    profileManagement.selectedProfile.ahkHandles.push(exeName);
                }
                profileManagement.associatedPrograms.updateUIControls();            
            })
        },
        addRemoveEventListener: function(){
            $('#assigned-programs-list').on('click', (event) => {
                if(event.target.nodeName == "I"){
                    // $('#assigned-programs-list').children().length
                    // console.log($('#assigned-programs-list').children().length)
                    $('#assigned-programs-list').children('div').each((index, element) => {
                        if (element == event.target.parentNode.parentNode){
                            console.log(index);
                            profileManagement.selectedProfile.ahkHandles.splice(index, 1)
                            profileManagement.associatedPrograms.updateUIControls();                            
                        }
                    });
                    // console.log(event.target.parentNode.parentNode)
                }
            });
        }
    },
    pieMenuOverview:{     
        initialize:function(){
            this.createOverviewTableListeners();
            this.updateUIControls()
        },
        updateUIControls:function(){
            
            this.overviewTable.innerHTML = "";            
            profileManagement.selectedProfile.pieKeys.forEach(function(pieKey,index){
                this.overviewTable  
                createPieKeyRow(pieKey.pieMenus[0].selectionColor,pieKey.hotkey, pieKey.name, pieKey.globalMenu)              
                function createPieKeyRow(rgbArrayColor,pieHotKey,pieKeyName,globalState){
                    let table = profileManagement.pieMenuOverview.overviewTable
                    let row = table.insertRow(index)
                    let cell1 = row.insertCell(0)
                    let cell2 = row.insertCell(1)
                    let cell3 = row.insertCell(2)
                    let cell4 = row.insertCell(3)
                    let cell5 = row.insertCell(4)
                    let cell6 = row.insertCell(5)
                    cell1.innerHTML = '<button class="btn btn-primary" type="button" style="width: 97.3125px;" name="pie-menu-edit-btn">Edit</button>'
                    cell1.class = "text-center"
                    cell1.style = "width: 98px;"
                    // cell2.innerHTML = '<input type="button" data-jscolor value="' + rgbToHex(rgbArrayColor) + '" data-bs-toggle="tooltip" style="width: 55px;height: 30px;margin-top: 3px;" title="Color of pie menu." name="pie-menu-color-control" />'
                    let jsColorBtn = $('#color-button-template').clone();
                    let colorControlId = 'overview-color-control-' + index;

                    jsColorBtn.attr('id',colorControlId);
                    
                    cell2.append(jsColorBtn[0]);
                    let newJSColor = new JSColor('#' + colorControlId);  
                    newJSColor.onChange = function(){
                        profileManagement.selectedProfile.pieKeys[index].pieMenus[0].selectionColor = hexToRgb(this.toHEXString());                        
                    };                  
                    newJSColor.processValueInput(rgbToHex(rgbArrayColor));               
                    cell2.class = "text-center";
                    cell2.style = "width: 98px;padding-top: 13px;";                    
                    cell3.innerHTML = new Hotkey(pieHotKey).displayKey;
                    cell3.style = "padding-top: 13px;"
                    cell3.setAttribute("name","pie-key-display")
                    cell4.innerHTML = pieKeyName                    
                    cell4.style = "padding-top: 13px;"
                    cell4.setAttribute("name","pie-key-name-display")
                    cell5Header = document.getElementById('header-global-menu')
                    if (profileManagement.selectedProfile.name == "Default Profile"){
                        cell5Header.innerHTML = 'Global'
                        if(globalState){                            
                            cell5.innerHTML = '<div class="form-check" style="width: 19px;padding-left: 39px;"><input type="checkbox" checked class="form-check-input" id="formCheck-1" /><label class="form-check-label" for="formCheck-1"></label></div>'
                        }else{                            
                            cell5.innerHTML = '<div class="form-check" style="width: 19px;padding-left: 39px;"><input type="checkbox" class="form-check-input" id="formCheck-1" /><label class="form-check-label" for="formCheck-1"></label></div>'
                        }
                        
                    }else{
                        cell5Header.innerHTML = ''
                        cell5.innerHTML = ''
                    }
                    cell5.style = "padding-top: 13px;"
                    cell5.setAttribute("name","pie-key-name-display")
                    cell6.innerHTML = '<i class="fa fa-remove" data-bs-toggle="tooltip" style="padding: 4px;" title="Remove this pie menu." name="delete-pie-menu-icon-btn"></i>'                    
                    cell6.style = "padding-top: 13px;"
                };
            });
            
        },
        overviewTable: document.getElementById('pie-menu-overview-table'),
        newPieMenuBtn: document.getElementById('add-new-pie-menu-btn'),
        createOverviewTableListeners: function(){
            this.overviewTable.addEventListener("onChange", function(event){ 
                console.log(event)  
                let target = event.target;
                let pieKeyIndex = $(target).closest('td').parent()[0].sectionRowIndex;
                if (target && target.name == "color"){   
                    // console.log(ran)             
                    profileManagement.selectedProfile.pieKeys[pieKeyIndex].pieMenus[0].selectionColor = hexToRgb(target.value);
                }
            });           
            this.overviewTable.addEventListener('click', function(e){
                try{
                let target = e.target 
                let pieKeyIndex = $(target).closest('td').parent()[0].sectionRowIndex
                let selectedPieKey = profileManagement.selectedProfile.pieKeys[pieKeyIndex]                
                if (target && target.nodeName == "BUTTON" && target.name == "pie-menu-edit-btn"){
                    //Edit Button Pressed
                    editPieMenu.open(selectedPieKey)
                }else if (target && target.type == "color"){
                    //Changing color  
                }else if (target && target.type == "checkbox"){
                    selectedPieKey.globalMenu = target.checked
                }else if (target && target.nodeName == "I"){
                    //Delete Pie Menu button
                    let options = {
                        heading:"Delete " + selectedPieKey.name + "?",
                        cancelText:"Cancel",
                        confirmText:"Delete"
                    }
                    confirmDialog(options).then(val => {
                        profileManagement.open() 
                        profileManagement.deletePieKey(pieKeyIndex)                  
                    }, val => {                   
                        profileManagement.open()
                    }); 
                }
            }catch(err){{console.log(err)}}
            });
            this.newPieMenuBtn.addEventListener('click', function(e){                
                createNewPieMenu().then(val => { 
                    let arrLength = profileManagement.selectedProfile.pieKeys.push(val)                           
                    editPieMenu.open(profileManagement.selectedProfile.pieKeys[arrLength-1]);
                }, val => {              
                    profileManagement.open();
                }); 
            });

        }
    }
}

var globalSettings = {
    open: function(){
        $('[href="#tab-5"]').tab('show'); 
        this.refresh();
    },
    refresh:function(){        
        this.runOnStartupCheckbox.checked = AutoHotPieSettings.global.startup.runOnStartup;
        this.enableEscapeKeyMenuCancelCheckbox.checked = AutoHotPieSettings.global.enableEscapeKeyMenuCancel;
        this.useAHKPieMenuCheckbox.checked = AutoHotPieSettings.global.startup.runAHKPieMenus;   
        this.alwaysRunOnQuitCheckbox.checked = AutoHotPieSettings.global.startup.alwaysRunOnAppQuit;   
        setRunOnLogin(AutoHotPieSettings.global.startup.runOnStartup, AutoHotPieSettings.global.startup.runAHKPieMenus);
    },
    initialize: function(){
        this.backBtn.addEventListener('click', function(){
            profileManagement.open();
        });
        this.runOnStartupCheckbox.addEventListener('click', function(event){
            AutoHotPieSettings.global.startup.runOnStartup = event.target.checked
            // console.log(AutoHotPieSettings.global.startup.runOnStartup);
            setRunOnLogin(AutoHotPieSettings.global.startup.runOnStartup, AutoHotPieSettings.global.startup.runAHKPieMenus);
        });
        this.enableEscapeKeyMenuCancelCheckbox.addEventListener('click', function(event){
            AutoHotPieSettings.global.enableEscapeKeyMenuCancel = event.target.checked            
        });

        this.useAHKPieMenuCheckbox.addEventListener('click', function(event){
            AutoHotPieSettings.global.startup.runAHKPieMenus = event.target.checked
            setRunOnLogin(AutoHotPieSettings.global.startup.runOnStartup, AutoHotPieSettings.global.startup.runAHKPieMenus);
        });   
        this.alwaysRunOnQuitCheckbox.addEventListener('click', function(event){
            AutoHotPieSettings.global.startup.alwaysRunOnAppQuit = event.target.checked            
        });    
        this.updateBtn.addEventListener('click', function(){
            // updateApp();   
            openURL("https://github.com/dumbeau/AutoHotPie/releases");  
        });        
        this.versionText.innerHTML = "This version: " + electron.getVersion();
        this.githubBtn.addEventListener('click', function(){
            openURL("https://github.com/dumbeau/AutoHotPie");           
        });
        this.ahkLink.addEventListener('click', () => {
            openURL("https://www.autohotkey.com/");    
        });
        this.donateBtn.addEventListener('click', () => {
            openURL("https://www.paypal.com/donate?business=RBTDTCUBK4Z8S&no_recurring=1&item_name=Support+Pie+Menus+Development&currency_code=USD")
        })
        setRunOnLogin(AutoHotPieSettings.global.startup.runOnStartup, AutoHotPieSettings.global.startup.runAHKPieMenus);        
    },
    ahkLink: document.getElementById('ahk-link'),
    backBtn: document.getElementById('global-settings-back-btn'),    
    runOnStartupCheckbox: document.getElementById('run-on-startup-checkbox'),
    enableEscapeKeyMenuCancelCheckbox: document.getElementById('escape-cancel-menu-checkbox'),
    useAHKPieMenuCheckbox: document.getElementById('use-ahk-pie-menu-checkbox'),
    alwaysRunOnQuitCheckbox: document.getElementById('always-run-on-quit-checkbox'),
    updateBtn: document.getElementById('check-for-update-btn'),    
    versionText: document.getElementById('version-text'),    
    githubBtn: document.getElementById('github-btn'),
    donateBtn: document.getElementById('paypal-donate-btn')
}
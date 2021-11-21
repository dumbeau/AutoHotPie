var hotkeyManagement = {
    resolve: null,
    reject: null,
    invalidAHKKeys:[],
    hotkeyObj:{},
    validateAHKKey:function(ahkKey){
        let isKeyValid = (!this.invalidAHKKeys.includes(ahkKey)) ? true : false;
        // hotkeyManagement.editKeyPage.invalidKeyWarningDiv.style.display = (isKeyValid) ? 'block' : 'none';
        if (isKeyValid) {
            hotkeyManagement.editKeyPage.invalidKeyWarningDiv.hide();
            hotkeyManagement.editKeyPage.hotkeyAcceptBtn.show();
        } else {
            hotkeyManagement.editKeyPage.invalidKeyWarningDiv.show();
            hotkeyManagement.editKeyPage.hotkeyAcceptBtn.hide();            
        }
        return isKeyValid;
    },
    initialize:function(){
        this.listenForKeyPage.initialize();    
        this.editKeyPage.initialize();    
    },
    listenForKeyPage:{        
        hotkeyInputField: document.getElementById('pressed-hotkey-text-input'),
        hotkeyClickField: document.getElementById('listen-for-click-div'),
        cancelBtn: document.getElementById('hotkey-listen-cancel-btn'),
        specialKeyBtn: $('#special-key-menu').children('button'),
        specialKeyMenu: $('#special-key-menu').children('div'),
        initialize: function(){
            let lp = hotkeyManagement.listenForKeyPage;

            initializeSpecialKeyMenu();
            function initializeSpecialKeyMenu(){
                specialKeys = [
                    {
                        key: "Back / 4th Click",
                        keyCode: 6
                    },
                    {
                        key: "Forward / 5th Click",
                        keyCode: 7
                    },
                    {
                        key: "F13",
                        keyCode: 124
                    },
                    {
                        key: "F14",
                        keyCode: 125
                    },
                    {
                        key: "F15",
                        keyCode: 126
                    },
                    {
                        key: "F16",
                        keyCode: 127
                    },
                    {
                        key: "F17",
                        keyCode: 128
                    },
                    {
                        key: "F18",
                        keyCode: 129
                    },
                    {
                        key: "F19",
                        keyCode: 130
                    },
                    {
                        key: "F20",
                        keyCode: 131
                    },
                    {
                        key: "F21",
                        keyCode: 132
                    },
                    {
                        key: "F22",
                        keyCode: 133
                    },
                    {
                        key: "F23",
                        keyCode: 134
                    },
                    {
                        key: "F24",
                        keyCode: 135
                    },
                    {
                        key: "F25",
                        keyCode: 136
                    },
                    {
                        key: "F26",
                        keyCode: 137
                    },
                    {
                        key: "F27",
                        keyCode: 138
                    },
                    {
                        key: "F28",
                        keyCode: 139
                    },
                    {
                        key: "F29",
                        keyCode: 140
                    },
                    {
                        key: "F30",
                        keyCode: 141
                    },
                    {
                        key: "F31",
                        keyCode: 142
                    },
                    {
                        key: "F32",
                        keyCode: 143
                    }
                ]   
                lp.specialKeyMenu.empty();
                specialKeys.forEach(element => {
                    addButtonItem(element);                                
                });
                function addButtonItem(specialKeyObj){
                    lp.specialKeyMenu.append($("<a class=\"dropdown-item\" name=" + specialKeyObj.keyCode + ">" + specialKeyObj.key + "</a>"))
                };
                lp.specialKeyMenu.on('click', (e) => { 
                    processHotkeyInputEvent({
                        keyCode:parseInt(e.target.name)
                    });
                });
            }
            this.hotkeyInputField.style.opacity = 0;
            this.hotkeyClickField.addEventListener("mouseup", function(event){
                processHotkeyInputEvent(event);                          
            })
            this.hotkeyInputField.addEventListener("keyup", function(event){
                processHotkeyInputEvent(event)
            })
            this.cancelBtn.addEventListener("click", function(event){                
                hotkeyManagement.reject(false);
            });
        }, 
        open:function(){            
            $('[href="#tab-11"]').tab('show');
            this.hotkeyInputField.focus(); 
        },
        
    },
    editKeyPage:{        
        modBtnGroup: document.getElementById('modifier-btn-group'),
        hotkeyDisplayField: document.getElementById('hotkey-display-field'),
        invalidKeyWarningDiv: $('#invalid-key-warning-div'),
        shiftBtnCheck: document.getElementById('hotkey-modifier-shift-check'),
        ctrlBtnCheck: document.getElementById('hotkey-modifier-ctrl-check'),
        altBtnCheck: document.getElementById('hotkey-modifier-alt-check'),
        hotkeyCancelBtn: document.getElementById('hotkey-cancel-btn'),
        hotkeyAcceptBtn: $('#hotkey-accept-btn'),
        hotkeyReassignBtn: document.getElementById('hotkey-reassign-btn'),
        initialize: function(){
            let hm = hotkeyManagement
            let ep = hotkeyManagement.editKeyPage;    
            
            this.shiftBtnCheck.addEventListener("click", function(event){                    
                hm.hotkeyObj.isShift = ep.shiftBtnCheck.checked;
                // hm.validateAHKKey(hm.hotkeyObj.ahkKey);                                
                console.log(hm.hotkeyObj);
            });
            this.ctrlBtnCheck.addEventListener("click", function(event){
                hm.hotkeyObj.isCtrl = ep.ctrlBtnCheck.checked;                
            });
            this.altBtnCheck.addEventListener("click", function(event){ 
                hm.hotkeyObj.isAlt = ep.altBtnCheck.checked;                            
            });
            this.hotkeyAcceptBtn.on("click", function(event){                 
                hm.hotkeyObj.displayKey = processKeyEventToFullString()
                function resolveAHKString(){
                    let returnString = ""
                    if (hm.hotkeyObj.isShift){
                        returnString = returnString + "+"
                    }
                    if (hm.hotkeyObj.isCtrl){
                        returnString = returnString + "^"                            
                    }
                    if (hm.hotkeyObj.isAlt){
                        returnString = returnString + "!"
                    }
                    returnString = returnString + hm.hotkeyObj.ahkKey.replace(/[\!\^\+]/g,"")                        
                    return returnString                              
                }
                hm.hotkeyObj.ahkKey = resolveAHKString()
                // console.log(hotkeyObj.ahkKey)                
                if (hotkeyManagement.validateAHKKey(hotkeyManagement.hotkeyObj.ahkKey)){
                    hotkeyManagement.resolve(hm.hotkeyObj);
                }                                
            });
            this.hotkeyReassignBtn.addEventListener("click", function(event){
                hm.listenForKeyPage.open()
            });
            this.hotkeyCancelBtn.addEventListener("click", function(event){
                hotkeyManagement.reject();
            });
        },
        open:function(){            
            $('[href="#tab-7"]').tab('show'); 
            this.refresh();       
        },
        refresh: function(){
            let hm = hotkeyManagement;
            this.shiftBtnCheck.checked = hm.hotkeyObj.isShift;           
            this.ctrlBtnCheck.checked = hm.hotkeyObj.isCtrl;            
            this.altBtnCheck.checked = hm.hotkeyObj.isAlt; 
            this.hotkeyDisplayField.value = hm.hotkeyObj.displayKeyNoMods;
        }
    }
}

// var rejectHotkeyPromise, resolveHotkeyPromise;

function processHotkeyInputEvent(event){
    hm = hotkeyManagement;    
    var keyNumber = event.keyCode    
    if (event.type == "mouseup"){//Mousebutton        
        
        if (event.button == 0){
            hm.listenForKeyPage.hotkeyInputField.focus();
            return} //Don't allow LMB click
        keyNumber = event.button + 3
        event.code = "mousebutton"
        event.keyCode = event.button + 3
    }else{ //Keystroke
        var ignoreKeys = ['Control','Shift','Alt']
        if (ignoreKeys.includes(event.key)){
            hm.listenForKeyPage.hotkeyInputField.focus();
            return}
        keyNumber = event.keyCode                    
    } 
    
    hotkeyManagement.hotkeyObj = processHotkey(event)
    
    
    hm.editKeyPage.hotkeyAcceptBtn.focus()
    
    //Intitalize value of input fields

    hotkeyManagement.editKeyPage.open();
    hotkeyManagement.validateAHKKey(hotkeyManagement.hotkeyObj.ahkKey);
    hotkeyInputField = document.getElementById('pressed-hotkey-text-input');
};
function processKeyEventToFullString(){ // Refactor pls
        hotkeyObj = hotkeyManagement.hotkeyObj
        let returnString = ""
        if (hotkeyObj.isShift){
            returnString = returnString + "Shift+"
        }
        if (hotkeyObj.isCtrl){
            returnString = returnString + "Ctrl+"
        }
        if (hotkeyObj.isAlt){
            returnString = returnString + "Alt+"
        }                        
        returnString = returnString + hotkeyObj.displayKeyNoMods
        return returnString
    }
function processHotkey(keyEvent){
        let keyTableArray = AutoHotPieSettings.global.htmlAhkKeyConversionTable;
        let keyNumber = (keyEvent.code == "Enter") ? 1 : keyEvent.keyCode        
        
        // console.log(keyNumber)
        let allowModifiers = (hotkeyManagement.editKeyPage.modBtnGroup.style.display == "block") ? true : false;
        let keyObj = keyTableArray.find(x => x.keyCode === keyNumber)                    

        function processKeyEventToAHKString(){
            let returnString = ""
            if (keyEvent.shiftKey){
                returnString = returnString + "+"
            }
            if (keyEvent.ctrlKey){
                returnString = returnString + "^"
            }
            if (keyEvent.altKey){
                returnString = returnString + "!"
            }
            returnString = returnString + keyObj.ahkKey
            return returnString                              
        }
        
        function processKeyEventToFullString(){
            let returnString = ""
            if (keyEvent.shiftKey){
                returnString = returnString + "Shift+"
            }
            if (keyEvent.ctrlKey){
                returnString = returnString + "Ctrl+"
            }
            if (keyEvent.altKey){
                returnString = returnString + "Alt+"
            }                        
            returnString = returnString + keyObj.displayKey
            return returnString
        } 
        if(allowModifiers){
            return {
                isShift:keyEvent.shiftKey,                        
                isCtrl:keyEvent.ctrlKey,                        
                isAlt:keyEvent.altKey,
                keyCode:keyObj.keyCode,
                displayKey:processKeyEventToFullString(),
                displayKeyNoMods:keyObj.displayKey,
                ahkKey:processKeyEventToAHKString()
            }
        }else{
            return {
                isShift:false,                        
                isCtrl:false,                        
                isAlt:false,
                keyCode:keyObj.keyCode,
                displayKey:keyObj.displayKey,
                displayKeyNoMods:keyObj.displayKey,
                ahkKey:keyObj.ahkKey
            }
        }
    }

async function assignKey(options){
    var defaults = {
        allowModifiers:true,
        invalidAHKKeys:[],
        warningText:"This key is already in use, edit or choose another key."
    }    
    var setting = Object.assign({}, defaults, options);
    let hm = hotkeyManagement;
    hotkeyManagement.invalidAHKKeys = setting.invalidAHKKeys;    
    // hm.editKeyPage.invalidKeyWarningDiv.html(setting.warningText);    
    // hm.editKeyPage.invalidKeyWarningDiv.hidden = false;    
    hotkeyManagement.editKeyPage.modBtnGroup.style.display = (setting.allowModifiers) ? 'block' : 'none';
    
    hotkeyManagement.listenForKeyPage.open();
    let myPromise = await waitForUserInput()
    return myPromise
    function waitForUserInput(){
        return new Promise((resolve, reject) => {
            hotkeyManagement.resolve = resolve;
            hotkeyManagement.reject = reject;
        });
    }       
}

hotkeyManagement.initialize();



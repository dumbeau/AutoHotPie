var hotkeyManagement = {
    resolve: null,
    reject: null,
    invalidAHKKeys:[],
    invalidKeyCodes:[],
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
        winBtnCheck: document.getElementById('hotkey-modifier-win-check'),
        shiftBtnCheck: document.getElementById('hotkey-modifier-shift-check'),
        ctrlBtnCheck: document.getElementById('hotkey-modifier-ctrl-check'),
        altBtnCheck: document.getElementById('hotkey-modifier-alt-check'),
        hotkeyCancelBtn: document.getElementById('hotkey-cancel-btn'),
        hotkeyAcceptBtn: $('#hotkey-accept-btn'),
        hotkeyReassignBtn: document.getElementById('hotkey-reassign-btn'),
        initialize: function(){
            let hm = hotkeyManagement
            let ep = hotkeyManagement.editKeyPage;   
                        
            this.winBtnCheck.addEventListener("click", function(event){
                hm.hotkeyObj.winKey = ep.winBtnCheck.checked;
                hm.validateAHKKey(hm.hotkeyObj.ahkKey);          
            });
            this.shiftBtnCheck.addEventListener("click", function(event){                    
                hm.hotkeyObj.shiftKey = ep.shiftBtnCheck.checked; 
                hm.validateAHKKey(hm.hotkeyObj.ahkKey);          
            });
            this.ctrlBtnCheck.addEventListener("click", function(event){
                hm.hotkeyObj.ctrlKey = ep.ctrlBtnCheck.checked; 
                hm.validateAHKKey(hm.hotkeyObj.ahkKey);          
            });
            this.altBtnCheck.addEventListener("click", function(event){ 
                hm.hotkeyObj.altKey = ep.altBtnCheck.checked;     
                hm.validateAHKKey(hm.hotkeyObj.ahkKey);                                 
            });
            this.hotkeyAcceptBtn.on("click", function(event){                 
                
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
            this.winBtnCheck.checked = hm.hotkeyObj.winKey;           
            this.shiftBtnCheck.checked = hm.hotkeyObj.shiftKey;           
            this.ctrlBtnCheck.checked = hm.hotkeyObj.ctrlKey;            
            this.altBtnCheck.checked = hm.hotkeyObj.altKey; 
            this.hotkeyDisplayField.value = hm.hotkeyObj.displayKeyNoMods;
            this.hotkeyAcceptBtn.focus()
        }
    }
}


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
    } else { //Keystroke
        var ignoreKeys = ['Control','Shift','Alt']
        if (ignoreKeys.includes(event.key)){
            hm.listenForKeyPage.hotkeyInputField.focus();
            return}
        keyNumber = event.keyCode        
    } 
    
    // console.log(keyNumber)
    // console.log(event.code)
    
    // hotkeyManagement.hotkeyObj = processHotkey(event)
    let allowModifiers = (hotkeyManagement.editKeyPage.modBtnGroup.style.display == "block") ? true : false;    
    hotkeyManagement.hotkeyObj = new Hotkey(event,allowModifiers);
    
    
    hm.editKeyPage.hotkeyAcceptBtn.focus();
    
    //Intitalize value of input fields

    hotkeyManagement.editKeyPage.open();
    hotkeyManagement.validateAHKKey(hotkeyManagement.hotkeyObj.ahkKey);
    hotkeyInputField = document.getElementById('pressed-hotkey-text-input');
};

async function assignKey(options){
    var defaults = {
        allowModifiers:true,
        allowScrollInputs:false,
        invalidAHKKeys:[],   
        warningText:"This key is already in use, edit or choose another key."
    }     
    
    var setting = Object.assign({}, defaults, options);
    if (!setting.allowScrollInputs) {
        setting.invalidAHKKeys.push('WheelUp','WheelDown');       
    }
    
    let hm = hotkeyManagement;
    hotkeyManagement.invalidAHKKeys = setting.invalidAHKKeys;
    hotkeyManagement.invalidKeyCodes = [];    
    setting.invalidAHKKeys.forEach( (key) => {        
        hotkeyManagement.invalidKeyCodes.push(new Hotkey(key).keyCode);
    });
    
    
    // hm.editKeyPage.invalidKeyWarningDiv.html(setting.warningText);    
    // hm.editKeyPage.invalidKeyWarningDiv.hidden = false;   
    
    hotkeyManagement.editKeyPage.modBtnGroup.style.display = (setting.allowModifiers) ? 'block' : 'none';
    refreshSpecialKeyMenu();
    function refreshSpecialKeyMenu(){
        let lp = hotkeyManagement.listenForKeyPage;        
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
                key: "Scroll Wheel Up",
                keyCode: 146
            },
            {
                key: "Scroll Wheel Down",
                keyCode: 147
            },                    
            {
                key: "Media Play",
                keyCode: 179
            },
            {
                key: "Media Next",
                keyCode: 176
            },
            {
                key: "Media Previous",
                keyCode: 177
            },
            {
                key: "Media Mute",
                keyCode: 173
            },
            {
                key: "Volume Up",
                keyCode: 175
            },
            {
                key: "Volume Down",
                keyCode: 174
            },
            {
                key: "Print Screen",
                keyCode: 44
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
            }
        ]   
        lp.specialKeyMenu.empty();
        specialKeys.forEach(element => {
            addButtonItem(element);
            // if (!hotkeyManagement.invalidKeyCodes.includes(element.keyCode)){                
            //     addButtonItem(element);
            // }                    
        });
        function addButtonItem(specialKeyObj){
            lp.specialKeyMenu.append($("<a class=\"dropdown-item\" name=" + specialKeyObj.keyCode + ">" + specialKeyObj.key + "</a>"))
        };
        lp.specialKeyMenu.on('click', (e) => { 
            processHotkeyInputEvent({
                metaKey:false,                        
                shiftKey:false,
                ctrlKey:false,
                altKey:false,                       
                keyCode:parseInt(e.target.name)
            });
        });
    }
    
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

// hotkeyManagement.initialize();



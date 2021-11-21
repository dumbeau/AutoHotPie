var newPieMenu = {
    newPieKeyObj: {},
    pieMenuNameField: document.getElementById('new-pie-menu-name-input'),
    pieKeyBtn: document.getElementById('new-pie-key-btn'),
    pieKeyValidationWarning: $('#pie-key-validation-warning'),
    activationModeBtn: document.getElementById('new-act-mode-btn'),
    activationModeValidationWarning: $('#activation-mode-validation-warning'),
    selectionColorInput: document.getElementById('new-selection-color-input'),
    backgroundColorInput: document.getElementById('new-background-color-input'),
    cancelBtn: document.getElementById('new-pie-menu-cancel-btn'),
    createBtn: document.getElementById('new-pie-menu-create-btn'),
    backBtn: document.getElementById('new-pie-menu-back-btn'),
    subMenuModeDescriptions: ["Key down, hover over submenus, release on function.",
    "Key down, release on first function, hover over next.",
    "Hover over all selections."],
    initialize: function(){        
        this.pieKeyBtn.addEventListener("click", function(event){
            assignKey({invalidAHKKeys:profileManagement.getInvalidPieKeys()}).then(val => {
                newPieMenu.newPieKeyObj.hotkey = val.ahkKey
                newPieMenu.pieKeyBtn.innerHTML = val.displayKey  
                newPieMenu.validateInput(false)               
                $('[href="#tab-4"]').tab('show');
            }, val => {                   
                $('[href="#tab-4"]').tab('show');
            });
        });
        this.activationModeBtn.addEventListener("click", function(event){
            let newPieActMode = newPieMenu.newPieKeyObj.activationMode
            changeActivationMode().then(val => {
                newPieActMode.submenuMode = val
                newPieMenu.activationModeBtn.innerHTML = newPieMenu.subMenuModeDescriptions[val-1];
                newPieMenu.validateInput(false)
                $('[href="#tab-4"]').tab('show');                                
            },val => {
                $('[href="#tab-4"]').tab('show');
            });                                       
        });
        this.selectionColorInput.addEventListener("change", function(event){            
            // selectionColorInput = selectionColorInput;  //WHAT WHY??
            newPieMenu.newPieKeyObj.pieMenus[0].selectionColor = hexToRgb(newPieMenu.selectionColorInput.value);
        });
        this.backgroundColorInput.addEventListener("change", function(event){            
            newPieMenu.newPieKeyObj.pieMenus.forEach((pieMenu) => {
                pieMenu.backgroundColor = hexToRgb(newPieMenu.backgroundColorInput.value)
            });                         
        });
        this.pieMenuNameField.addEventListener("change", function(event){
            newPieMenu.newPieKeyObj.name = event.target.value;            
        });
        this.backBtn.addEventListener("click", function(event){
            rejectNewPieMenuPromise(false);                
        });
        this.cancelBtn.addEventListener("click", function(event){
            rejectNewPieMenuPromise(false);                
        });
        this.createBtn.addEventListener("click", function(event){
            event.preventDefault()            
            if (newPieMenu.validateInput()){
                resolveNewPieMenuPromise(newPieMenu.newPieKeyObj);
            }              
        });        

    },
    validateInput: function(showWarnings=true){
        let newPieKeyObj = newPieMenu.newPieKeyObj;
        if(newPieKeyObj.hotkey != "" && newPieKeyObj.activationMode.submenuMode != null){
            this.pieKeyValidationWarning.hide();
            this.activationModeValidationWarning.hide();
            return true
        } else if(showWarnings) {
            //Warn user
            if(newPieKeyObj.hotkey == "") {
                this.pieKeyValidationWarning.show();
            }     
            if (newPieKeyObj.activationMode.submenuMode == null){
                this.activationModeValidationWarning.show();
            }
            return false      
        } 
        return       
    },
    open: function(){     
        this.refresh();   
        $('[href="#tab-4"]').tab('show');  
    },
    refresh:function(){
        let np = newPieMenu;
        this.pieKeyValidationWarning.hide();
        this.activationModeValidationWarning.hide();        
        if(this.newPieKeyObj.activationMode.submenuMode != null){
            this.activationModeBtn.innerHTML = this.subMenuModeDescriptions[this.newPieKeyObj.activationMode.submenuMode-1]
        } else {
            this.activationModeBtn.innerHTML = "Choose Activation Mode..."        
        }        
        this.pieMenuNameField.value = this.newPieKeyObj.name;  
        this.pieKeyBtn.innerHTML = "Choose Keystroke...";        
        this.selectionColorInput.value = rgbToHex(np.newPieKeyObj.pieMenus[0].selectionColor)    
        this.backgroundColorInput.value =  rgbToHex(np.newPieKeyObj.pieMenus[0].backgroundColor)        
    }
}

newPieMenu.initialize();

var resolveNewPieMenuPromise, rejectNewPieMenuPromise

async function createNewPieMenu(options={}){     
    newPieMenu.newPieKeyObj = getDefaultPieKeyObj();
    function getDefaultPieKeyObj(){                
        function determineCopyPieMenu(){
            let newCopyMenu
            if(profileManagement.selectedProfile.pieKeys[0]){
                newCopyMenu = profileManagement.selectedProfile.pieKeys[0]
            }else if(AutoHotPieSettings.appProfiles[0].pieKeys[0]){
                newCopyMenu = AutoHotPieSettings.appProfiles[0].pieKeys[0]
                // newCopyMenu.activationMode.submenuMode = null;
            }else{
                newCopyMenu = new PieKey();
                // newCopyMenu.activationMode.submenuMode = null;
            }
            return newCopyMenu;
        };
        copyMenu = determineCopyPieMenu();
        let defaultPieKey = new PieKey({
            name:"Pie Menu " + (profileManagement.selectedProfile.pieKeys.length+1),
            labelDelay:copyMenu.labelDelay,  
            activationMode:{submenuMode: copyMenu.activationMode.submenuMode},            
            pieMenus:[new PieMenu({
                backgroundColor: copyMenu.pieMenus[0].backgroundColor,
                selectionColor: copyMenu.pieMenus[0].selectionColor,
                radius:copyMenu.pieMenus[0].radius,
                thickness:copyMenu.pieMenus[0].thickness,
                labelRadius: copyMenu.pieMenus[0].labelRadius,
                pieAngle: 0,
                functions: PieFunction.fill(7)                
            })]
        }) 
        // defaultPieKey = {	
        //     name:"Pie Menu " + (profileManagement.selectedProfile.pieKeys.length+1),
        //     hotkey: "",
        //     enable:true,
        //     labelDelay:copyMenu.labelDelay,
        //     globalMenu:false,		
        //     activationMode:{
        //         submenuMode: copyMenu.activationMode.submenuMode,
        //         clickableFunctions:true,
        //         keyReleaseDelay:true		
        //     },						
        //     pieMenus:
        //         [
        //         {
        //         backgroundColor: copyMenu.pieMenus[0].backgroundColor,
        //         selectionColor: copyMenu.pieMenus[0].selectionColor,
        //         radius:copyMenu.pieMenus[0].radius,
        //         thickness:copyMenu.pieMenus[0].thickness,
        //         labelRadius: copyMenu.pieMenus[0].labelRadius,
        //         pieAngle: 0,
        //         functions:[]
        //         }
        //         ]
        //     }    
    
        // for(let i=0; i<=6; i++){
        //     defaultPieKey.pieMenus[0].functions.push(
        //         {
        //         function:"none",
        //         params:{},
        //         label:"Slice " + i,
        //         hotkey:"",
        //         clickable:false,
        //         returnMousePos:false,
        //         icon:{							
        //             filePath:"",
        //             WBOnly:true
        //             }
        //         }
        //     )
        // }
        return defaultPieKey
    };    
    newPieMenu.open();

    let myPromise = await waitForUserInput()
    return myPromise     
    function waitForUserInput(){
        return new Promise((resolve, reject) => {
            resolveNewPieMenuPromise = resolve;
            rejectNewPieMenuPromise = reject;            
        });
    }
}
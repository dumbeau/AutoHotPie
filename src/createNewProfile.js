
let configureNewProfile = {
    backBtn: document.getElementById('create-new-profile-back-btn'),
    newProfileNameField: $("#new-profile-name"),
    getFocusedWindowBtn: $('#get-focused-app-button'),
    selectEXEButton: $('#select-profile-exe-btn'),    
    newProfileExeField: $('#new-profile-exe-field'),
    newProfileExeValidation: $('#new-profile-exe-path-validiation-warning'),
    focusTimerGIF: $('#focus-timer-gif'),
    initialize:function(){       
        this.selectEXEButton.on("click", function(event){
            let exeName = electron.openEXE()
            configureNewProfile.newProfileExeField.val(exeName);
        });
        this.getFocusedWindowBtn.on('click', (e) => {


            $('[href="#tab-34"]').tab('show');
            configureNewProfile.focusTimerGIF.hide();
            configureNewProfile.focusTimerGIF.fadeIn(10);

            getActiveWindowProcess().then((exe) => {
                configureNewProfile.newProfileExeField.val(exe.name);
                if (configureNewProfile.newProfileNameField.val() == ""){
                    configureNewProfile.newProfileNameField.val(exe.name.replace('.exe',''));
                }
                $('[href="#tab-3"]').tab('show');
                win.focus();         
            }, () => {
                confirmDialog({heading:"You dun goofed.",
                description:"Focus the application you want to add a profile for.",
                cancelText:"Go Back",
                confirmText:"Back in Blue"                            
            }).then(() => {
                $('[href="#tab-3"]').tab('show');                
            }, () => {
                $('[href="#tab-3"]').tab('show');
            })
            });                     
        });
        
        document.getElementById("create-profile-cancel-btn").addEventListener("click", function(event){
            profileManagement.open();
        });
        document.getElementById("create-profile-btn").addEventListener("click", function(event){
        });
        $("#create-new-profile-form").submit(function(event){            
            event.preventDefault();
            console.log(event);
            let nameFieldValue = event.target.elements[0].value;
            let exeFieldValue = event.target.elements[2].value
            if (nameFieldValue == "" || exeFieldValue == ""){
                if(exeFieldValue == ""){
                    configureNewProfile.newProfileExeValidation.show();
                }
                return //Don't submit because things are not filled out
            }
            var newProfile = new AppProfile({
                name:event.target.elements[0].value,
                ahkHandles:[exeFieldValue],
                enable:true
            });
            profileManagement.addProfile(newProfile)
            $('[href="#tab-1"]').tab('show');
         })
         this.backBtn.addEventListener('click', () => {
            profileManagement.open();
         })
    },    
open:function(){
    this.newProfileNameField.val("");
    this.newProfileExeField.val("");
    this.newProfileExeValidation.hide();              
    $('[href="#tab-3"]').tab('show');
    }    
}  
// configureNewProfile.initialize()
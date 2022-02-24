
let configureNewProfile = {
    backBtn: document.getElementById('create-new-profile-back-btn'),
    newProfileNameField: document.getElementById("new-profile-name"),    
    newProfileExeField: document.getElementById("new-profile-exe"),
    newProfileExeValidation: $('#new-profile-exe-path-validiation-warning'),
    initialize:function(){        
        document.getElementById("select-profile-exe-btn").addEventListener("click", function(event){
            let exeName = electron.openEXE()
            document.getElementById("new-profile-exe").value = exeName
        });
        document.getElementById("create-profile-cancel-btn").addEventListener("click", function(event){
            profileManagement.open();
        });
        document.getElementById("create-profile-btn").addEventListener("click", function(event){
        });
        $("#create-new-profile-form").submit(function(event){            
            event.preventDefault()
            // console.log(event)
            if (event.target.elements[0].value == "" || event.target.elements[1].value == ""){
                if(event.target.elements[1].value == ""){
                    configureNewProfile.newProfileExeValidation.show();
                }
                return //Don't submit because things are not filled out
            }
            var newProfile = new AppProfile({
                name:event.target.elements[0].value,
                ahkHandles:[event.target.elements[1].value],
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
    this.newProfileNameField.value = "";
    this.newProfileExeField.value = "";
    this.newProfileExeValidation.hide();              
    $('[href="#tab-3"]').tab('show');
    }    
}  
// configureNewProfile.initialize()
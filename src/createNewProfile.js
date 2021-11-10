
let configureNewProfile = {
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
                return //Don't submit because things are not filled out
            }
            var newProfile = {
                name:event.target.elements[0].value,
                ahkHandles:[event.target.elements[1].value],
                enable:true,	
                pieEnableKey:{
                    useEnableKey:false,
                    enableKey:"XButton1",
                    toggle:true
                    },
                pieKeys:[]
            }
            profileManagement.addProfile(newProfile)
            $('[href="#tab-1"]').tab('show');
         })
         this.backBtn.addEventListener('click', () => {
            profileManagement.open();
         })
    },    
    open:function(){
        this.newProfileNameField.value = ""
        this.newProfileExeField.value = ""                
        $('[href="#tab-3"]').tab('show');
    },
    backBtn: document.getElementById('create-new-profile-back-btn'),
    newProfileNameField: document.getElementById("new-profile-name"),    
    newProfileExeField: document.getElementById("new-profile-exe")
}

configureNewProfile.initialize()
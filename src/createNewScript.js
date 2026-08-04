var createNewScriptPage = {    
    rejectPromise: null,
    resolvePromise: null,
    open: function(){
        $('[href="#tab-30"]').tab('show');               
    },
    form:$('#create-new-script-form'),  
    backBtn:$('#create-script-back-btn'),  
    heading:$('#create-script-heading'),  
    subHeading:$('#cnew-script-program-heading'),  
    nameInput:$('#new-script-name-input'),  
    descriptionInput:$('#new-script-description-input'),  
    cancelBtn:$('#create-new-script-cancel-btn'),  
    submitBtn:$('#create-new-script-confirm'),  
    initialize:function(){

        this.backBtn.on('click', () => {
            createNewScriptPage.rejectPromise();
        });
        this.cancelBtn.on('click', () => {
            createNewScriptPage.rejectPromise();
        });

        this.form.submit( (event) => {
            event.preventDefault();
            const name = (createNewScriptPage.nameInput.val() || "").trim();
            const description = (createNewScriptPage.descriptionInput.val() || "").trim();
            if (!name) {
                return;
            }
            console.log("Creating new script");
            let tempCustomScript = new CustomFunction({
                name: name,
                description: description
            });
            createNewScriptPage.resolvePromise(tempCustomScript);
        });
        
    },
    new: async function(associatedProgram=""){
        this.open();
        let subHeadingText = (associatedProgram != "") ? ("New script for " + associatedProgram) : "";
        this.subHeading.text(subHeadingText);
        let myPromise = await waitForUserInput()
        return myPromise
        function waitForUserInput(){
            return new Promise((resolve, reject) => {
                createNewScriptPage.resolvePromise = resolve;
                createNewScriptPage.rejectPromise = reject; 
            });
        }
    }
}

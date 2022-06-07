var editScriptPage = {    
    rejectPromise: null,
    resolvePromise: null,
    open: function(){
        $('[href="#tab-29"]').tab('show');               
    },    
    backBtn:$('#edit-script-back-btn'),  
    heading:$('#edit-script-heading'),
    nameInput:$('#edit-script-name-input'),  
    descriptionInput:$('#edit-script-description-input'),
    initialize:function(){

        this.backBtn.on('click', () => {
            editScriptPage.rejectPromise();
        });        
    },
    new: async function(associatedProgram=""){
        this.open();
        let subHeadingText = (associatedProgram != "") ? ("New script for" + associatedProgram) : "";
        this.subHeading.html(subHeadingText);
        let myPromise = await waitForUserInput();
        return myPromise
        function waitForUserInput(){
            return new Promise((resolve, reject) => {
                editScriptPage.resolvePromise = resolve;
                editScriptPage.rejectPromise = reject;
            });
        }
    }
}
// editScriptPage.initialize();
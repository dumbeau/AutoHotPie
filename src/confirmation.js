var confirmationDialog = {
    resolve: null,
    reject: null,
    confirmBtn: document.getElementById("confirmation-confirm-btn"),
    cancelBtn: document.getElementById("confirmation-cancel-btn"),
    secondaryCancelBtn: $("#secondary-confirmation-btn"),
    heading: document.getElementById("confirmation-heading"),
    description: document.getElementById("confirmation-description"),
    showAgainDiv: document.getElementById("show-again-div"),
    askAgainLabel: document.getElementById("ask-again-label"),
    initialize: function(){
        this.confirmBtn.addEventListener('click',function(){
            confirmationDialog.resolve(true);            
        });
        this.cancelBtn.addEventListener('click',function(){
            confirmationDialog.reject(false);     
        });
        this.secondaryCancelBtn.on('click',function(){
            confirmationDialog.reject(true);  
        });         
    },
    open:function(){
        $('[href="#tab-6"]').tab('show');
    }        
}
// confirmationDialog.initialize();

/**
 * 
 * @param {object} options Object to override default options.
 * @param {string} options.heading The heading of the dialog
 * @param {string} options.description The description of the dialog.
 * @param {string} options.cancelText Text in the 'Cancel' button.
 * @param {string} options.confirmText Text in the 'Confirm' button.
 * @param {boolean} options.askAgainBox Show a checkbox option?
 * @param {string} options.askAgainLabel Text for the checkbox option.
 * @param {string} options.secondaryText Extra option button text.  Will not show if empty.
 * @returns {Promise} Resolves on confirm and Rejects on cancel.
 */
async function confirmDialog(options){    
    let cd = confirmationDialog;
    //Get active tab
    // activeTabText
    // $('.nav-tabs .active').text()        
    var defaults = {
        heading:"Are you sure?",
        description:"",
        cancelText:"Cancel",
        confirmText:"Confirm",
        askAgainBox:false,
        askAgainLabel:"Don't ask me again",
        secondaryText:""
    }    
    var setting = Object.assign({}, defaults, options);
    cd.heading.innerHTML = setting.heading;
    cd.description.innerHTML = setting.description;
    cd.cancelBtn.innerHTML = setting.cancelText;
    cd.confirmBtn.innerHTML = setting.confirmText;
    
    let visibilityState = "hidden"
    if (setting.askAgainBox == true) {
        visibilityState = "none"
    }
    cd.showAgainDiv.style.visibility = visibilityState;
    cd.askAgainLabel.innerHTML = setting.askAgainLabel;
    
    if(setting.secondaryText != ""){
        cd.secondaryCancelBtn.show();
        cd.secondaryCancelBtn.html(setting.secondaryText)
    }else{
        cd.secondaryCancelBtn.hide();
    }    
    confirmationDialog.open();
    
    let myPromise = await waitForUserInput()
    return myPromise 
    
    function waitForUserInput(){
        return new Promise((resolve, reject) => {
            confirmationDialog.resolve = resolve;
            confirmationDialog.reject = reject;
        });
    }
}


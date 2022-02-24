var functionSelectPage = {    
    rejectPromise: null,
    resolvePromise: null,
    open: function(){
        $('[href="#tab-25"]').tab('show');
        this.refresh();        
    },
    backBtn:$('#function-select-back-btn'),    
    common:{
        functionButtons: $('[name="selectable-icon-div"]'),
    }, 
    custom: {
        window: $('#custom-script-list-div'),
        templateFunctionDiv: $('#custom-function-div-template'),
        editScriptBtns: $('[name="custom-func-edit-btn"]'),
        removeScriptBtns: $('[name="custom-func-remove-btn"]'),
        customFunctionBtns: $('[name="custom-function-div"]'),
        general:{
            functionDiv: $('#general-custom-scripts-div'),
            newScriptBtn: $('#new-script-general-btn')            
        },
        appSpecific:{
            functionDiv: $('#app-specific-custom-scripts-div'),
            newScriptBtn: $('#new-script-app-specific-btn')
        }
    },    
    initialize:function(){
        
        //Hide custom functions for now... soon though.
        this.custom.window.hide();

        this.backBtn.on('click', () => {
            functionSelectPage.rejectPromise();
        });
        
        this.common.functionButtons.on('click', (e) => {
            let clickedFuncName = $(e.currentTarget).find('p').html();
            functionSelectPage.resolvePromise(clickedFuncName)            
        });


        this.custom.editScriptBtns.on('click', (event) => {
            //Get function id and Go to edit page                        
            let customFuncId = event.currentTarget.parentNode.parentNode.parentNode.id;
            let customFunc = CustomFunction.getCustomFunctionByID(customFuncId);

            //Edit script page!!!

            event.stopPropagation();
        });
        this.custom.removeScriptBtns.on('click', (event) => {   
            let customFuncId = event.currentTarget.parentNode.parentNode.parentNode.id;                    
            let customFunc = CustomFunction.getCustomFunctionByID(customFuncId);            
            confirmDialog({
                heading: "Delete " + customFunc.name + "?",                                                
            }).then( (val) => {
                CustomFunction.removeCustomFunction(customFuncId);
                functionSelectPage.open();
                functionSelectPage.refresh();
            }, (val) => {
                functionSelectPage.open();
            });
            event.stopPropagation();            
            return
        });
        this.custom.customFunctionBtns.on('click', (event) => {
            console.log(event);     
            functionSelectPage.resolvePromise(event.currentTarget.id);          
            //Get function id and resolve

        });

        this.custom.general.newScriptBtn.on('click', (e) => {
            createNewScriptPage.new().then((val) => {

                //Go to editscriptPage!!!
                
                AHPSettings.saveCustomFunction(val);
            }, () => {});
        });
        
    },
    refresh: function(){
        //Delete custom functions list        
        this.custom.general.functionDiv.html('');
        this.custom.appSpecific.functionDiv.html(''); 
        let templateDiv = this.custom.templateFunctionDiv;
        AutoHotPieSettings.global.functionConfig.custom.forEach((functionObj) => {
            let tempDiv = templateDiv.clone(true);
            tempDiv = $(tempDiv).removeAttr('id');
            tempDiv.find('h5').eq(0).html(functionObj.name);
            tempDiv.find('p').eq(0).html(functionObj.description);
            tempDiv.attr('id',functionObj.id)            
            if (functionObj.associatedProgram == ""){
                functionSelectPage.custom.general.functionDiv.append(tempDiv);
            } else if (profileManagement.selectedProfile.ahkHandles.includes(functionObj.associatedProgram)){
                functionSelectPage.custom.appSpecific.functionDiv.append(tempDiv);
            }            
        })        

        
        

          

    },
    selectFunction: async function(){
        this.open();
        let myPromise = await waitForUserInput()
        return myPromise
        function waitForUserInput(){
            return new Promise((resolve, reject) => {
                functionSelectPage.resolvePromise = resolve;
                functionSelectPage.rejectPromise = reject; 
            });
        }
    }
}
// functionSelectPage.initialize();
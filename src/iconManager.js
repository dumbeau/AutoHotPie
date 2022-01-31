var selectIconPage = {
    rejectPromise: null,
    resolvePromise: null,
    stockIconDiv: $('#stock-icon-library'),
    userIconDiv: $('#user-icon-library'),
    manageUserIconsDiv: $('#manage-icons-btn'),
    backBtn: $('#icon-manager-back-btn'),
    refreshIconsBtn: $('#refresh-icons-btn'),
    iconTempElement:$('#template-select-icon-div'),
    open:function(){
        $('[href="#tab-28"]').tab('show');
    },
    initialize:function(){
        function handleIconSelection(event){
            // console.log(event.target)
            if(event.target.name == "selectable-icon-div"){
                console.log('clicked')
                // let selectedIconImage = 
                // selectIconPage.resolvePromise(selectedIconImage);                
            }
        };
        this.stockIconDiv.on('click', '#template-select-icon-div', (e) => {
            // console.log(e.currentTarget)
            // console.log(e.currentTarget.childNodes[1].childNodes[0])
            let returnImg = e.currentTarget.childNodes[1].childNodes[0].src;            
            if (returnImg){
                console.log(returnImg)
                selectIconPage.resolvePromise(returnImg)
            }
        })
        this.userIconDiv.on('click', '#template-select-icon-div', (e) => {
            // console.log(e.currentTarget)
            // console.log(e.currentTarget.childNodes[1].childNodes[0])
            let returnImg = e.currentTarget.childNodes[1].childNodes[0].src;       
            if (returnImg){
                selectIconPage.resolvePromise(returnImg)
            }
        });
        
        this.backBtn.on('click', () => {
            selectIconPage.rejectPromise();
        });
        this.manageUserIconsDiv.on('click', () => {
            iconManager.openUserIconFolder();
        });
        this.refreshIconsBtn.on('click', () => {
            iconManager.refreshIconLibrary();
            this.refreshIcons();
        })
        this.refreshIcons();      
    },
    refreshIcons:function(){
        this.stockIconDiv.html('');
        this.userIconDiv.html('');
        iconManager.getIcons().then((files) => {            
            files.forEach((iconFile)=>{
                let newIconDiv = this.iconTempElement.clone()[0];
                newIconDiv.childNodes[1].childNodes[0].src = iconFile
                newIconDiv.childNodes[1].childNodes[2].innerHTML = nodePath.basename(iconFile,".png");                
                if (iconFile.includes('\\User\ Icons\\')){
                    selectIconPage.userIconDiv.append(newIconDiv);                    
                } else {
                    selectIconPage.stockIconDiv.append(newIconDiv);
                }
            })
        },(err)=>{console.log(err)});
    },
    selectIcon: async function(){        
        this.refreshIcons();
        this.open();
        let myPromise = await waitForUserInput()
        return myPromise
        function waitForUserInput(){
            return new Promise((resolve, reject) => {
                selectIconPage.resolvePromise = resolve;
                selectIconPage.rejectPromise = reject; 
            });
        }
    }
    
}

selectIconPage.initialize();


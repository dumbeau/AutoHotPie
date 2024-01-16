var IsDragging = false //Used in editPieMenu for Divs with sliders and number inputs
var editPieMenu = {
    selectedPieKey: {},
    selectedPieMenu: {},
    selectedSlice: {},
    open: function(pieKeyObj){        
        this.selectedPieKey = pieKeyObj;        
        this.selectPieMenu(0);
        this.slice.select(0);        
        this.loadSelectedPieKey();  
        this.pieMenuDisplay.loadPieMenuElements(this.selectedPieMenu);
        this.pieMenuDisplay.draw.elements(editPieMenu.pieMenuDisplay.elements)
        $('[href="#tab-2"]').tab('show');
        this.launchSettings.open();              
        return
    },
    initialize: function(){
        let disp = editPieMenu.pieMenuDisplay


        var elementExists = document.getElementById("pie-menu-foreground")
        if(!elementExists){
            addInteractionCanvas()
            editPieMenu.pieMenuDisplay.canvasForeground = document.getElementById('pie-menu-foreground')

        }

        
        
        function addInteractionCanvas(){
            var canvas = document.createElement("canvas");
            canvas.id = "pie-menu-foreground"
            canvas.style.cssText = "position:absolute;left:0;top:93";            
            document.getElementById("pie-menu-display-div").appendChild(canvas);
        };

        document.getElementById('edit-pie-menu-back-btn').addEventListener('click', function(){
            if (editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu) == 0){
                profileManagement.open();
            } else { 
                let parentMenuIndex = editPieMenu.findSubMenuParent() 
                let parentMenu = editPieMenu.selectedPieKey.pieMenus[parentMenuIndex];
                editPieMenu.selectPieMenu(parentMenuIndex);
                // selectParentMenuSlice(parentMenu, editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu))              
                
                $('[href="#tab-10"]').tab('show');
            }
        });

        let pieKeyBtn = document.getElementById('piekey-change-btn');
        pieKeyBtn.addEventListener('click',function(){
            assignKey({invalidAHKKeys:editPieMenu.getInvalidPieKeys()}).then(val => {
                editPieMenu.selectedPieKey.hotkey = val.ahkKey 
                pieKeyBtn.innerHTML = val.displayKey                 
                $('[href="#tab-2"]').tab('show');
            }, val => {
                $('[href="#tab-2"]').tab('show');
            });            
        });
        let pieKeyNameTextInput = document.getElementById('edit-piekey-name-text-input');
        pieKeyNameTextInput.addEventListener('change',function(event){
            editPieMenu.selectedPieKey.name = event.target.value;
        });


        createWindowSizeListener(function(){             
            //If in Edit Pie Menu Tab
            if($('#app-tabs > .nav-tabs .active').text() == "Edit Pie Menu"){
                disp.loadPieMenuElements(editPieMenu.selectedPieMenu);
                disp.draw.elements(editPieMenu.pieMenuDisplay.elements);
            }            
        });
        canvas = document.getElementById('pie-menu-center');  
        
        fgCanvas = document.getElementById('pie-menu-foreground');        
        // bgCanvas = document.getElementById('pie-menu-background');

        
        fgCanvas.addEventListener("mousemove", function(mouseEvent) {
            handleMouseMove(mouseEvent);
            // editPieMenu.pieMenuDisplay.refresh(mouseEvent)
        });
        fgCanvas.addEventListener("mousedown", function(mouseEvent) {
            handleMouseDown(mouseEvent);
        });
        fgCanvas.addEventListener("mouseup", function(mouseEvent) {
            handleMouseUp(mouseEvent);
            // editPieMenu.selectSlice();
            // console.log("mouseup")
            
        });

        //Initialize all other control pages.
        this.globalAppearanceSettings.initialize();
        this.launchSettings.initialize();
        this.appearanceSettings.initialize();
        this.sliceSettings.initialize();
        
        var clickedPosition
        var clickedElement
        function handleMouseMove(mouseEvent){            
            let mouse = disp.getMouse(mouseEvent)
            //Dragging?
            if (clickedPosition && clickedElement){
                if( Math.abs(clickedPosition[0]-mouse.position[0]) > 5 || Math.abs(clickedPosition[1]-mouse.position[1]) > 5 ){
                    if(clickedElement){
                        clickedElement.isDragging = true;                        
                        disp.draw.elements(editPieMenu.pieMenuDisplay.elements);                    
                    }
                }
            }
            var draggingElement = disp.elements.filter(element => {                
                return element.isDragging == true
            })
            draggingElement = draggingElement[0]
            if(draggingElement && draggingElement.type == "sliceLabel"){
                // console.log(draggingElement);
                disp.setActiveCanvas(2);
                // disp.clearActiveCanvas();              
                let eData = draggingElement.data;
                disp.draw.label(eData.label, eData.icon, eData.hotkey, mouse.position,[0,0]);         
                disp.setActiveCanvas(1);
            }

            //Test for object hovered over
        };
        function handleMouseDown(mouseEvent){          
            
            
            let mouse = disp.getMouse(mouseEvent)
            clickedPosition = mouse.position

            clickedElement = disp.getElementUnderMouse(mouse);  
            // console.log(clickedElement);

            disp.draw.elements(editPieMenu.pieMenuDisplay.elements);            
        };
        function handleMouseUp(mouseEvent){
            let mouse = disp.getMouse(mouseEvent)
            let releaseElement = disp.getElementUnderMouse(mouse)
            
            //Dragging?
            var draggingElement = disp.elements.filter(element => {                
                return element.isDragging == true
            })

            for (k in draggingElement){
                draggingElement[k].isDragging = false;                
            }              
            draggingElement = draggingElement[0];
            
            if(draggingElement && draggingElement.type == "sliceLabel"){
                draggingElement.isDragging = false;
                //Check if hovered over another slice to validate swap                
                let swapLabelElement = releaseElement;
                if (swapLabelElement && swapLabelElement.type == "sliceLabel") {                    
                    if(mouseEvent.ctrlKey){
                        editPieMenu.slice.copyTo(clickedElement.data, swapLabelElement.data);                    
                    } else {
                        editPieMenu.slice.swap(clickedElement.data, swapLabelElement.data);                    
                    }                    
                }                
                disp.setActiveCanvas(2);
                disp.clearActiveCanvas();                     
            }else if(clickedElement && clickedElement == releaseElement){
                if(clickedElement.selectable == true){
                    editPieMenu.slice.select(clickedElement.data);
                } else {                    
                    if(clickedElement.type == "addSliceBtn"){                        
                        editPieMenu.slice.add(clickedElement.data)
                    } else if(clickedElement.type == "deleteSliceBtn"){
                        if (editPieMenu.selectedPieMenu.functions.length > 2){
                            editPieMenu.slice.delete(clickedElement.data)
                        } else {
                            let options = {
                                heading:"Are you sure you want to delete the last slice?",
                                cancelText:"Cancel",
                                confirmText:"Yes",
                                description:"A pie with NO SLICES???",
                            }
                            confirmDialog(options).then(val => {
                                let options = {
                                    heading:"Wait, seriously???",
                                    cancelText:"Cancel",
                                    confirmText:"Do it",
                                    description:"I promise you, you don't want that.",
                                }
                                confirmDialog(options).then(val => {
                                    let options = {
                                        heading:"No... I cannot allow this.",
                                        cancelText:"Cancel",
                                        confirmText:"Cancel harder",
                                        description:"Think about what you've done.",
                                    }
                                    confirmDialog(options).then(val=>{
                                        $('[href="#tab-2"]').tab('show');
                                    },val=>{
                                        $('[href="#tab-2"]').tab('show');
                                    })
                                }, val => {                   
                                    $('[href="#tab-2"]').tab('show');
                                });                                
                            }, val => {                   
                                $('[href="#tab-2"]').tab('show');
                            }); 
                        }
                        
                    }                    
                }
            }
            clickedElement = null;
            clickedPosition = null;
            disp.draw.elements(editPieMenu.pieMenuDisplay.elements);
        };      

    },
    loadSelectedPieKey:function(){
        let pieKeyBtn = document.getElementById('piekey-change-btn');        
        pieKeyBtn.innerHTML = new Hotkey(editPieMenu.selectedPieKey.hotkey).displayKey;
        let pieKeyNameTextInput = document.getElementById('edit-piekey-name-text-input');
        pieKeyNameTextInput.value = editPieMenu.selectedPieKey.name;
        this.launchSettings.loadSelectedPieKey();
        this.appearanceSettings.loadSelectedPieKey();
        this.sliceSettings.loadSelectedPieKey();
    },
    selectPieKey: function(pieKeyNumber){},
    selectPieMenu: function(pieMenuNumber){
        editPieMenu.selectedPieMenu = editPieMenu.selectedPieKey.pieMenus[pieMenuNumber];
        if (pieMenuNumber == 0){
            editPieMenu.appearanceSettings.mainMenu.show();
        }else{
            editPieMenu.appearanceSettings.subMenu.show();
        } 
        this.slice.select(0)

        let backBtn = document.getElementById('edit-pie-menu-back-btn');
        if (editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu) == 0){
            backBtn.innerHTML = "<i class=\"icon ion-chevron-left\" style=\"margin-right: 12px;\"></i>Back"
        } else {
            backBtn.innerHTML = "<i class=\"icon ion-chevron-left\" style=\"margin-right: 12px;\"></i>To Parent Menu"
        }
        editPieMenu.pieMenuDisplay.refresh();       
    },
    forceReload: function(){
        let currentSliceIndex = editPieMenu.selectedSlice;
        // editPieMenu.selectedPieMenu.functions.indexOf(editPieMenu.selectedSlice);        
        this.slice.select(0);           
        this.slice.select(editPieMenu.selectedPieMenu.functions.indexOf(currentSliceIndex));    
        this.loadSelectedPieKey();  
        this.pieMenuDisplay.loadPieMenuElements(this.selectedPieMenu);
        this.pieMenuDisplay.draw.elements(editPieMenu.pieMenuDisplay.elements);        
        $('[href="#tab-2"]').tab('show');        
    },
    getInvalidPieKeys:function(){
        let usedAHKKeys = []
        usedAHKKeys = profileManagement.getInvalidPieKeys();
        usedAHKKeys.push.apply(usedAHKKeys, editPieMenu.getInvalidSliceHotkeys(editPieMenu.selectedPieKey.pieMenus[0]));
        var index = usedAHKKeys.indexOf(editPieMenu.selectedPieKey.hotkey) //Remove currently selected key
        if (index !== -1){
            usedAHKKeys.splice(index, 1);
        }  
        return usedAHKKeys;
    },
    getInvalidSliceHotkeys: function(pieMenu){
        let usedAHKKeys = [];
        let removeCurrent = false;
        if (pieMenu == null){ //In case this is called by getInvalidPieKeys()
            pieMenu = this.selectedPieMenu;   
            let barePieKey = this.selectedPieKey.hotkey        
            usedAHKKeys.push(barePieKey.replace('+','').replace('!','').replace('^',''))             
            removeCurrent = true;                                       
        }   
        for (let funcIndex in pieMenu.functions){
            let sliceHotkey = pieMenu.functions[funcIndex].hotkey
            if (sliceHotkey != ""){
                usedAHKKeys.push(sliceHotkey)
            }            
        }
        if (removeCurrent) {
            var index = usedAHKKeys.indexOf(editPieMenu.selectedSlice.hotkey) //Remove currently selected key
            if (index !== -1){
                usedAHKKeys.splice(index, 1);
            } 
        }
        return usedAHKKeys;
    },
    findSubMenuParent: function(){
        for (let pieMenuIndex in editPieMenu.selectedPieKey.pieMenus){
            let pieMenu = editPieMenu.selectedPieKey.pieMenus[pieMenuIndex];
            for (let sliceFuncIndex in pieMenu.functions){
                let sliceFunc = pieMenu.functions[sliceFuncIndex];
                if(sliceFunc.function == "submenu"){                                
                    if(sliceFunc.params.pieMenuNumber == editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu)){
                        return pieMenuIndex                  
                    }
                }
            }
        }
        console.log("Didn't find parent")
        return 0
    },
    slice:{        
        select: function(slice){
            let previousSelectedSlice = editPieMenu.selectedSlice;
            if(typeof slice == "number"){                
                editPieMenu.selectedSlice = editPieMenu.selectedPieMenu.functions[slice]
            }else{
                let sliceIndex = editPieMenu.selectedPieMenu.functions.indexOf(slice);
                editPieMenu.selectedSlice = editPieMenu.selectedPieMenu.functions[sliceIndex];
            }
            
            if(editPieMenu.selectedSlice.params.isBack == true){  // Don't allow back function to be selected.
                editPieMenu.selectedSlice = previousSelectedSlice;
                return
            }
            for (k in editPieMenu.pieMenuDisplay.elements){ //unselect all elements
                let element = editPieMenu.pieMenuDisplay.elements[k];
                element.isSelected = false
            }         
            editPieMenu.appearanceSettings.loadSelectedPieKey();
            editPieMenu.sliceSettings.loadSelectedPieKey();  
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);                     
        },
        swap: function(slice1, slice2){
            if (slice1.params.isBack == true || slice2.params.isBack == true){
                
            }else{
                let selectedPieMenu = editPieMenu.selectedPieMenu;   
                let s1Index = selectedPieMenu.functions.indexOf(slice1);
                let s2Index = selectedPieMenu.functions.indexOf(slice2);            
                [selectedPieMenu.functions[s1Index],selectedPieMenu.functions[s2Index]] = [selectedPieMenu.functions[s2Index],selectedPieMenu.functions[s1Index]];
            }
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);                     
            
        },
        copyTo: function(slice1, slice2){
            if (slice1.params.isBack == true || slice2.params.isBack == true){
                
            }else{
                let selectedPieMenu = editPieMenu.selectedPieMenu;   
                let s1Index = selectedPieMenu.functions.indexOf(slice1);
                let s2Index = selectedPieMenu.functions.indexOf(slice2); 
                selectedPieMenu.functions[s2Index] = new PieFunction(selectedPieMenu.functions[s1Index]);                
                // [selectedPieMenu.functions[s1Index],selectedPieMenu.functions[s2Index]] = [selectedPieMenu.functions[s2Index],selectedPieMenu.functions[s1Index]];
            }
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);                     
            
        },
        add: function(insertAfterSlice=null, sliceObj=null){
            let selectedPieMenu = editPieMenu.selectedPieMenu;
            let selectedSliceIndex            
            
            if(insertAfterSlice == null){
                selectedSliceIndex = selectedPieMenu.functions.indexOf(editPieMenu.selectedSlice);                
            } else {
                selectedSliceIndex = insertAfterSlice;                
            }              
            if(sliceObj == null){
                sliceObj = {
                    function: "none",
                    params: {},
                    label: "Slice " + selectedSliceIndex,
                    hotkey: "",
                    clickable: false,
                    returnMousePos: false,
                    icon: {
                        filePath: "",
                        WBOnly: true
                        }
                    }
            }             
            selectedPieMenu.functions.splice(selectedSliceIndex+1,0,sliceObj)
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);
            editPieMenu.pieMenuDisplay.refresh();
        },
        delete: function(slice=null){
            let deleteIndex
            if (slice == null){
                deleteIndex = editPieMenu.selectedPieMenu.functions.indexOf(editPieMenu.selectedSlice);
            }else{
                deleteIndex = slice;                
            }            
            editPieMenu.selectedPieMenu.functions.splice(deleteIndex,1);                        
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);
            editPieMenu.pieMenuDisplay.refresh();
            editPieMenu.slice.select(0);
        }
    },    
    pieMenuDisplay:{
        canvas: document.getElementById('pie-menu-center'),
        canvasForeground: document.getElementById('pie-menu-foreground'),
        centerPos:[0,0],
        loadingGraphic:$('#loading-graphic'),
        setActiveCanvas:function(layerNumber=1){
            if (layerNumber == 1){ //Main Layer
                editPieMenu.pieMenuDisplay.activeCanvas = editPieMenu.pieMenuDisplay.canvas                
            }
            else if (layerNumber == 2){ //Foreground layer
                editPieMenu.pieMenuDisplay.activeCanvas = editPieMenu.pieMenuDisplay.canvasForeground
            }          
        },
        clearActiveCanvas:function(){
            ctx = editPieMenu.pieMenuDisplay.activeCanvas.getContext("2d");            
            ctx.clearRect(0,0,canvas.width,canvas.height)
        },
        activeCanvas: {},
        elements:[
            {
                type:"pieCircle",
                data:null,
                region:{rect:[20,20,50,50], arc:[0,360,0,20]},
                selectable:true,
                isSelected:false,
                draggable:false,
                isDragging:false,
                isHovered:false,
                isClicked:false          
            },
            {
                type:"addSliceBtn",
                data:null,
                region:{rect:[20,20,50,50], arc:null},
                isSelected:false,
                draggable:false,
                isDragging:false,
                isHovered:false,
                isClicked:false          
            },
            {
                type:"deleteSliceBtn",
                data:null,
                region:{rect:[20,20,50,50], arc:null},
                isSelected:false,
                draggable:false,
                isDragging:false,
                isHovered:false,
                isClicked:false
            },
            {
                type:"sliceLabel",
                data:{},
                region:{rect:[20,20,50,50], arc:[0,60,0,20]},
                isSelected:false,
                draggable:true,
                isDragging:false,
                isHovered:false,
                isClicked:false          
            }
        ],
        loadPieMenuElements:function(pieMenuObj){
            elements = this.elements;
            elements.length = 0; //Clear elements 

            //Add pie circle  
                      
            pieCircleElement = {
                type:"pieCircle",
                data:pieMenuObj.functions[0],
                region:{rect:null, arc:[0,360,0,pieMenuObj.radius]},
                selectable:true,
                isSelected:false,
                draggable:false,
                isDragging:false,
                isHovered:false,
                isClicked:false          
            };
            elements.push(pieCircleElement)

            //Add slices
            
            for(let i=1; i < pieMenuObj.functions.length; i++){
                pieSliceLabelObj = {
                    type:"sliceLabel",
                    data:pieMenuObj.functions[i],
                    region:{rect:[0,0,0,0], arc:[0,0,0,0]},
                    selectable:true,
                    isSelected:false,
                    draggable:true,
                    isDragging:false,
                    isHovered:false,
                    isClicked:false          
                };
                elements.push(pieSliceLabelObj)
            }   
        },
        draw:{
            rect:function(position, color='blue'){
                c = editPieMenu.pieMenuDisplay.activeCanvas;
                ctx = c.getContext("2d");
    
                ctx.beginPath();
                ctx.fillStyle = color;
                ctx.fillRect(position[0], position[1], 20, 20);
                // ctx.fillRect(50, 50, 20, 20);
            },
            pieCircle:function(pieCircleElement, position){
                // let selectedPieKey = editPieMenu.selectedPieKey
                let selectedPieMenu = editPieMenu.selectedPieMenu
                ctx = editPieMenu.pieMenuDisplay.activeCanvas.getContext("2d");                
                // let selectedSlice = editPieMenu.selectedSlice

                thickness = selectedPieMenu.thickness;
                pieRadius = selectedPieMenu.radius+(thickness/2);
                centerPos = position;              


                ctx.lineWidth = thickness                  
                ctx.strokeStyle = rgbToHex(selectedPieMenu.backgroundColor)                
                ctx.beginPath();
                ctx.arc(centerPos[0], centerPos[1], pieRadius, 0, 2 * Math.PI);
                ctx.stroke();

                if(editPieMenu.selectedPieKey.activationMode.escapeRadius.enable){
                    ctx.lineWidth = 2                  
                    ctx.strokeStyle = rgbToHex([255,0,0,0])                
                    // ctx.strokeStyle = rgbToHex(selectedPieMenu.backgroundColor)                
                    ctx.beginPath();
                    let escapeRad = editPieMenu.selectedPieKey.activationMode.escapeRadius.radius
                    ctx.arc(centerPos[0], centerPos[1], escapeRad, 0, 2 * Math.PI);
                    ctx.stroke();
                }

                pieCircleElement.region = {rect:null,arc:[0,360,0,pieRadius]}                
                
                //Draw Selected Region Slice
                ctx.beginPath();
                //if index of selected slice is 0
                if (pieCircleElement.isSelected == true){                    
                    
                    ctx.lineWidth = (thickness/2);
                    ctx.strokeStyle = rgbToHex(selectedPieMenu.selectionColor);
                    
                    ctx.arc(centerPos[0], centerPos[1], pieRadius-(thickness/4), 0, 2 * Math.PI);
                    ctx.stroke();
                }
            },
            label: function(labelText, labelIcon, sliceHotkey, labelPos, labelAnchor=[0,0], element=null){     
                
                //Initialize font canvas settings
                ctx = editPieMenu.pieMenuDisplay.activeCanvas.getContext("2d");                
                let fontStyle
                // console.log(AutoHotPieSettings.global.globalAppearance.font) 

                // if (AutoHotPieSettings.global.globalAppearance.font == ""){
                //     fontStyle = "";
                // } else {
                //     fontStyle = AutoHotPieSettings.global.globalAppearance.font.cssName.style + " ";
                // }   
                // ctx.font = fontStyle + AutoHotPieSettings.global.globalAppearance.fontSize.toString() + "px " + AutoHotPieSettings.global.globalAppearance.font.cssName.family; 
                ctx.font = AutoHotPieSettings.global.globalAppearance.fontSize.toString() + "px " + AutoHotPieSettings.global.globalAppearance.font; 
                // ctx.font = "Bold " + AutoHotPieSettings.global.globalAppearance.fontSize.toString() + "px Gilroy"; 
                
                // ctx.font.style = AutoHotPieSettings.global.globalAppearance.font.style

                // ctx.font.style
                // console.log(ctx.font + " : " + AutoHotPieSettings.global.globalAppearance.font.style);             
   
                //Determine Content Box using text and icon
                // let iconFolder = AutoHotPieSettings.global.pieIconFolder
                selectedPieMenu = editPieMenu.selectedPieMenu
                // let iconFolder = './icons'
                let iconDiv = document.getElementById('image-buffer');
                let iconImg = getImageFromBuffer(labelIcon.filePath);
                // let iconColor = selectedPieMenu.selectionColor
                let iconSize = AutoHotPieSettings.global.globalAppearance.iconSize
                let textHeight = ctx.measureText("W").actualBoundingBoxAscent
                // console.log(textHeight)
                let minLabelWidth = AutoHotPieSettings.global.globalAppearance.minimumLabelWidth

                let innerWidthPadding = 6;
                let outerBoxPadding = 6;

                //determine if label is selected
                let isSelected = false
                if(element){
                    isSelected = element.isSelected;      
                }

                function getImageFromBuffer(filename){   
                    let returnImage = false 
                    let imagesHTMLCollection = iconDiv.getElementsByTagName('img')
                    var images = [].slice.call(imagesHTMLCollection);
                    images.forEach(function(element, index){
                        // let localIconPath = iconManager.getLocalIconPath(element.src).replaceAll('%20',' ');                        
                        let localIconPath = iconManager.getLocalIconPath(element.src)                      
                        if (localIconPath == filename){
                            returnImage = element
                        }
                    })
                    return returnImage
                }
                
                //Load labelElements array
                let labelElements = [];
                if(iconImg){                    
                    let newElement = {type:"icon",data:iconImg,rect:[iconSize,iconSize],padding:[innerWidthPadding,innerWidthPadding]}
                    labelElements.push(newElement)
                }
                if(labelText != ""){
                    let textBox = ctx.measureText(labelText);
                    let newElement = {type:"labelText",data:labelText,rect:[textBox.width,textHeight],padding:[innerWidthPadding,innerWidthPadding]}
                    labelElements.push(newElement)
                }
                if(sliceHotkey != ""){
                    let textBox = ctx.measureText(sliceHotkey); 
                    let newElement = {type:"hotkeyText",data:sliceHotkey,rect:[textBox.width,textHeight],padding:[innerWidthPadding,innerWidthPadding]}                   
                    labelElements.push(newElement)
                }                  
                
                //Determine content rect
                let contentBox = [0,iconSize];
                for (let k in labelElements){                    
                    let labelElement = labelElements[k];
                    let padding
                    if (k == labelElements.length-1){
                        padding = 0;
                    }else{
                        padding = labelElement.padding[0]
                    }
                    contentBox = [Math.ceil(contentBox[0]+labelElement.rect[0]+padding),iconSize]
                }
                //Set positioning variables
                let labelSize = [Math.max(contentBox[0]+(2*outerBoxPadding),minLabelWidth,contentBox[1]+(2*outerBoxPadding)),contentBox[1]+(2*outerBoxPadding)]
                let labelCenter = [labelPos[0]-( labelAnchor[0]*(labelSize[0]/2) )+(labelAnchor[0]*(labelSize[1]/2)), labelPos[1]+( labelAnchor[1]*(labelSize[1]/2) ) ] //May need -                
                let labelRoundness = selectedPieMenu.labelRoundness;
                //Draw label background rect
                
                if(isSelected){
                    ctx.fillStyle = rgbToHex(selectedPieMenu.selectionColor);            
                    // ctx.strokeStyle = rgbToHex(selectedPieMenu.selectionColor);                    
                    ctx.strokeStyle = 'rgba(1,1,1,0)';                    
                }else{
                    ctx.fillStyle = rgbToHex(selectedPieMenu.backgroundColor);            
                    // ctx.strokeStyle = rgbToHex(AutoHotPieSettings.global.globalAppearance.safetyStrokeColor);
                    ctx.strokeStyle = 'rgba(1,1,1,0)';                    
                }      
                ctx.lineWidth = 1;    
                // roundRect(ctx, labelCenter[0]-(labelSize[0]/2), labelCenter[1]-(labelSize[1]/2), labelSize[0], labelSize[1],1,true,true);
                // roundRect(ctx, labelCenter[0]-(labelSize[0]/2), labelCenter[1]-(labelSize[1]/2), labelSize[0], labelSize[1], selectedPieMenu.labelRoundess ,true,true);
                
                roundRect(ctx, labelCenter[0]-(labelSize[0]/2), labelCenter[1]-(labelSize[1]/2), labelSize[0], labelSize[1], (labelSize[1]/2)*(labelRoundness/100),true,true);
                
                //Draw label elements
                elementPlacementPos = [labelCenter[0]-(contentBox[0]/2), labelCenter[1]]
                for (let k in labelElements){
                    let labelElement = labelElements[k];
                    if (labelElement.type == "icon"){
                        let iconPosition = [elementPlacementPos[0], elementPlacementPos[1]-(labelElement.rect[1]/2)]                      
                        if (labelIcon.WBOnly == true){
                            let tintedIconCanvas;                                            
                            if(isSelected){
                                tintedIconCanvas = filterIcon(labelElement.data, selectedPieMenu.backgroundColor)                
                            }else{
                                tintedIconCanvas = filterIcon(labelElement.data, selectedPieMenu.selectionColor)
                            }
                            // Initaliase a 2-dimensional drawing context
                            ctx.drawImage(tintedIconCanvas, iconPosition[0], iconPosition[1], labelElement.rect[0], labelElement.rect[1]);
                        } else {                                
                            ctx.drawImage(labelElement.data, iconPosition[0], iconPosition[1], labelElement.rect[0], labelElement.rect[1]);
                        }
                        
                        elementPlacementPos = [elementPlacementPos[0]+labelElement.rect[0]+labelElement.padding[0],elementPlacementPos[1]]

                    }
                    if (labelElement.type == "labelText"){
                        if(isSelected){
                            ctx.fillStyle = rgbToHex(selectedPieMenu.backgroundColor);                   
                        }else{
                            ctx.fillStyle = rgbToHex(selectedPieMenu.fontColor);
                            // ctx.fillStyle = "rgba(255,255,255,0.5)";
                        }
                        ctx.textAlign = "center";
                        let textPos = [elementPlacementPos[0]+(labelElement.rect[0]/2),elementPlacementPos[1]+(labelElement.rect[1]/2)]
                        // let textPos = [elementPlacementPos[0]+(labelElement.rect[0]/2),elementPlacementPos[1]]
                        ctx.fillText(labelElement.data, textPos[0], textPos[1]);
                        }
                    if (labelElement.type == "hotkeyText"){
                        if(isSelected){
                            ctx.fillStyle = rgbToHex(selectedPieMenu.backgroundColor); 
                            // ctx.fillStyle = "rgba(255,255,255,0.5)";                  
                        }else{
                            let x = selectedPieMenu.fontColor;
                            let newHCColor = 'rgba(' + x[0] +','+ x[1] +','+ x[2] +',0.5)'
                            ctx.fillStyle = newHCColor;
                        }
                        ctx.textAlign = "center";
                        let textPos = [labelCenter[0]+(contentBox[0]/2)-(labelElement.rect[0]/2), labelCenter[1]+(labelElement.rect[1]/2)]
                        // let textPos = [labelCenter[0]+(contentBox[0]/2)-(labelElement.rect[0]/2), labelCenter[1]+(labelElement.rect[1])]
                        ctx.fillText(labelElement.data, textPos[0], textPos[1]);
                        }
                    }
                    
                function filterIcon(img, color) {
                    // Create an empty canvas element
                    var buffer = document.createElement("canvas");
                    buffer.width = img.width;
                    buffer.height = img.height;
                
                    // Copy the image contents to the canvas
                    var btx = buffer.getContext("2d");
                    btx.drawImage(img, 0, 0);
                    var imgData = btx.getImageData(0,0,buffer.width,buffer.height);
                    var i;
                    // for (var i = 0; i < imgData.length; i += 4) {
                    //     iData[i]     = color[0]; // red
                    //     iData[i + 1] = color[1]; // green
                    //     iData[i + 2] = color[2]; // blue
                    // }
                    for (i = 0; i < imgData.data.length; i += 4) {
                        imgData.data[i]     = color[0]; // red
                        imgData.data[i + 1] = color[1]; // green
                        imgData.data[i + 2] = color[2]; // blue
                    }
                    btx.putImageData(imgData,0,0)                            
                    return buffer
                }
                return [labelCenter[0]-(labelSize[0]/2), labelCenter[1]-(labelSize[1]/2), labelSize[0], labelSize[1]]
                
                
            },
            elements:function(elements){
                //init
                let selectedPieKey = editPieMenu.selectedPieKey
                let selectedPieMenu = editPieMenu.selectedPieMenu
                let selectedSlice = editPieMenu.selectedSlice
                let disp = editPieMenu.pieMenuDisplay
                
                let c = document.getElementById('pie-menu-center');
                let cFG = document.getElementById('pie-menu-foreground');
                let ctx = c.getContext("2d");
                let cFGtx = cFG.getContext("2d");
                ctx.clearRect(0,0,canvas.width,canvas.height)


                

                // let bounds = [window.innerWidth, window.innerHeight];
                let bounds = [window.innerWidth, Math.max(selectedPieMenu.radius+selectedPieMenu.labelRadius+200,400)];  //FIX ME
                c.width = bounds[0]
                c.height = bounds[1]          
                cFG.width = bounds[0]
                cFG.height = bounds[1]
                //Set canvas color based on pie menu background color
                c.style.backgroundColor = (rgbLightness(selectedPieMenu.backgroundColor) > 0.9) ? "#303030" : "white"

                
                
                editPieMenu.pieMenuDisplay.centerPos = [bounds[0]/2,bounds[1]/2];                
                let centerPos = editPieMenu.pieMenuDisplay.centerPos; 
                
                //add button elements if slice is seleted               
                if(editPieMenu.selectedSlice != editPieMenu.selectedPieMenu.functions[0]){
                    disp.elements.push({
                        type:"addSliceBtn",
                        data:null,
                        region:{rect:[0,0,0,0], arc:null},
                        selectable:false,
                        isSelected:false,
                        draggable:false,
                        isDragging:false,
                        isHovered:false,
                        isClicked:false          
                    })
                    disp.elements.push({
                        type:"deleteSliceBtn",
                        data:null,
                        region:{rect:[0,0,0,0], arc:null},
                        selectable:false,
                        isSelected:false,
                        draggable:false,
                        isDragging:false,
                        isHovered:false,
                        isClicked:false          
                    })
                }


                //determine selected slice and set element state
                for (k in elements){
                    element = elements[k]
                    if (selectedSlice == element.data){
                        element.isSelected = true;                        
                        //add control buttons when slices are drawn.
                    }
                }

                let numSlices = selectedPieMenu.functions.length-1    
                let editButtonSize = 20; 
                let buttonPadding = 0;            

                disp.setActiveCanvas(1);
                for (k in elements){
                    let element = elements[k];

                    let selectedSlicePosition;
                    
                    if(element.type == "pieCircle"){                        
                        //draw circle and set region
                        disp.draw.pieCircle(element, centerPos);
                    }
                    else if(element.type == "sliceLabel" && element.isDragging == false){
                        let isSelected = element.isSelected;

                        let thickness = selectedPieMenu.thickness;
                        let pieRadius = selectedPieMenu.radius+(thickness/2);

                        let pieAngleOffset = editPieMenu.selectedPieMenu.pieAngle;
                        let sliceNum = selectedPieMenu.functions.indexOf(element.data)-1;   
                        let sliceAngleCenterOffset = (180/numSlices)              
                        let sliceAngle = (sliceNum*(360/numSlices))+sliceAngleCenterOffset+pieAngleOffset
                        // console.log("SliceNum: " + sliceNum + "\nAngle: " + sliceAngle)
                        let sliceArcLength = 360/numSlices;
                        let labelRadius = editPieMenu.selectedPieMenu.labelRadius+pieRadius+(thickness/2);                        
                        let labelPosition = [
                            Math.round(centerPos[0]+(labelRadius*Math.cos((sliceAngle-90)*(Math.PI/180)))) ,
                            Math.round(centerPos[1]+(labelRadius*Math.sin((sliceAngle-90)*(Math.PI/180))))
                        ];
                        //Draw Pie Circle Slice Indicator
                        if (isSelected){
                            ctx.lineWidth = thickness                  
                            ctx.strokeStyle = rgbToHex(selectedPieMenu.selectionColor)                  
                            ctx.beginPath();
                            ctx.arc(centerPos[0], centerPos[1], pieRadius, ((sliceAngle-90)-(180/numSlices))*(Math.PI/180), ((sliceAngle-90)+(180/numSlices))*(Math.PI/180));
                            ctx.stroke();  
                            // disp.setActiveCanvas(2)                          
                        }

                        let labelAnchor
                        let testSliceAngle = cycleRange(sliceAngle);
                        if (testSliceAngle > 0.1 && testSliceAngle < 179.9){
                            labelAnchor = [-1,0]
                        } else if (testSliceAngle > 180.1 && testSliceAngle < 359.9) {
                            labelAnchor = [1,0]
                        } else if (testSliceAngle == 0 || testSliceAngle == 360) {
                            labelAnchor = [0,0]
                        } else {
                            labelAnchor = [0,0]
                        }
                        let labelData = element.data                                               
                            // console.log(labelAnchor);

                        
                        
                        let labelRect = disp.draw.label(labelData.label, labelData.icon, labelData.hotkey, labelPosition,labelAnchor,element)
                        if (isSelected == true){
                            // disp.setActiveCanvas(1)
                            selectedSliceButtonPosition = [labelRect[0]-buttonPadding-2,labelRect[1]-1];
                        }
                        element.region = {rect:labelRect,arc:null}

                    } else if(element.type == "addSliceBtn"){
                        element.region={rect:[selectedSliceButtonPosition[0]-editButtonSize,selectedSliceButtonPosition[1],editButtonSize,editButtonSize],arc:null}
                        disp.draw.addSliceButton([selectedSliceButtonPosition[0]-editButtonSize,selectedSliceButtonPosition[1],editButtonSize,editButtonSize])
                    } else if(element.type == "deleteSliceBtn"){
                        element.region={rect:[
                            selectedSliceButtonPosition[0]-editButtonSize,
                            selectedSliceButtonPosition[1]+editButtonSize+buttonPadding,
                            editButtonSize,
                            editButtonSize],arc:null}
                        disp.draw.deleteSliceButton([selectedSliceButtonPosition[0]-editButtonSize,selectedSliceButtonPosition[1]+editButtonSize+buttonPadding,editButtonSize,editButtonSize])
                    }
                };                 
                //draw slice labels and set regions
                    //draw selected buttons if slice is selected.                
            },
            addSliceButton:function(rect){                
                let ctx = editPieMenu.pieMenuDisplay.activeCanvas.getContext("2d");
                let rectCenter = [rect[0]+(rect[2]/2),rect[1]+(rect[3]/2)];
                let iconPadding = 5;
                ctx.fillStyle = '#82B67D';            
                ctx.strokeStyle = 'white';                
                ctx.lineWidth = 1;
                ctx.beginPath()
                // roundRect(ctx, rect[0], rect[1], rect[3], rect[4],1,true,true);
                roundRect(ctx, rect[0], rect[1], rect[2], rect[3],1,true,true);
                ctx.lineWidth = 2;

                ctx.moveTo(rectCenter[0],rect[1]+iconPadding)
                ctx.lineTo(rectCenter[0], (rect[1]+rect[3])-iconPadding);
                ctx.moveTo(rect[0]+iconPadding,rectCenter[1]);
                ctx.lineTo((rect[0]+rect[2])-iconPadding,rectCenter[1]);
                ctx.stroke();     
            },
            deleteSliceButton:function(rect){
                let ctx = editPieMenu.pieMenuDisplay.activeCanvas.getContext("2d");
                let rectCenter = [rect[0]+(rect[2]/2),rect[1]+(rect[3]/2)];
                let iconPadding = 5;
                ctx.fillStyle = '#F05B5B';            
                ctx.strokeStyle = 'white';                
                ctx.lineWidth = 1;
                ctx.beginPath()                
                // roundRect(ctx, rect[0], rect[1], rect[3], rect[4],1,true,true);
                roundRect(ctx, rect[0], rect[1], rect[2], rect[3],1,true,true);
                ctx.lineWidth = 2;

                ctx.moveTo(rect[0]+iconPadding,rect[1]+iconPadding)
                ctx.lineTo((rect[0]+rect[2])-iconPadding, (rect[1]+rect[3])-iconPadding);
                ctx.moveTo(rect[0]+iconPadding,(rect[1]+rect[3])-iconPadding);
                ctx.lineTo((rect[0]+rect[2])-iconPadding,rect[1]+iconPadding);
                ctx.stroke();
            }       
        },
        refresh:function(){                       
            editPieMenu.pieMenuDisplay.loadPieMenuElements(editPieMenu.selectedPieMenu);
            editPieMenu.appearanceSettings.refreshPieAngle();                      
            editPieMenu.pieMenuDisplay.draw.elements(editPieMenu.pieMenuDisplay.elements); 
            
            function setDPI(canvas, dpi) {
                // Set up CSS size.
                canvas.style.width = canvas.style.width || canvas.width + 'px';
                canvas.style.height = canvas.style.height || canvas.height + 'px';
            
                // Get size information.
                var scaleFactor = dpi / 96;
                var width = parseFloat(canvas.style.width);
                var height = parseFloat(canvas.style.height);
            
                // Backup the canvas contents.
                var oldScale = canvas.width / width;
                var backupScale = scaleFactor / oldScale;
                var backup = canvas.cloneNode(false);
                backup.getContext('2d').drawImage(canvas, 0, 0);
            
                // Resize the canvas.
                var ctx = canvas.getContext('2d');
                canvas.width = Math.ceil(width * scaleFactor);
                canvas.height = Math.ceil(height * scaleFactor);
            
                // Redraw the canvas image and scale future draws.
                ctx.setTransform(backupScale, 0, 0, backupScale, 0, 0);
                ctx.drawImage(backup, 0, 0);
                ctx.setTransform(scaleFactor, 0, 0, scaleFactor, 0, 0);
            }         
        },
        getMouse: function(mouseEvent){
            let canvas = editPieMenu.pieMenuDisplay.canvas
            var cRect = canvas.getBoundingClientRect();        // Gets CSS pos, and width/height
            var canvasX = Math.round(mouseEvent.clientX - cRect.left);  // Subtract the 'left' of the canvas 
            var canvasY = Math.round(mouseEvent.clientY - cRect.top);   // from the X/Y positions to make    
            let position =  [canvasX,canvasY];
            let centerPos = editPieMenu.pieMenuDisplay.centerPos;
            let theta = cycleRange(calcAngle(centerPos[0],centerPos[1],position[0],position[1])+90)
            let dist = Math.sqrt( ((position[0]-centerPos[0])**2) + ((position[1]-centerPos[1])**2) )
            return {
                position: position,
                theta: theta,
                distance: dist
            }     
        },
        getElementUnderMouse: function(mouse){
            let disp = editPieMenu.pieMenuDisplay;
            for (let k in disp.elements){
                let element = disp.elements[k];
                if (element.region.rect != null){                    
                    if(element.region.rect[0] < mouse.position[0] && mouse.position[0] < (element.region.rect[0]+element.region.rect[2]) ){
                        if(element.region.rect[1] < mouse.position[1] && mouse.position[1] < (element.region.rect[1]+element.region.rect[3]) ){
                            return(element);
                        }
                    }
                } else if (element.region.arc != null){
                    let arc = element.region.arc;                    
                    if(arc[2] < mouse.distance && mouse.distance < arc[3]){
                        if(arc[1] < arc[0]){ // region crosses 0, 360
                            if (mouse.theta > arc[0] || mouse.theta < arc[1]){
                                return(element);
                            }                                    
                        }else{
                            if(arc[0] < mouse.theta && mouse.theta < arc[1]){
                                return(element);
                            }
                        }                       
                    }
                }
            }
            return null
        }
        
    },
    globalAppearanceSettings:{  
        tab:document.getElementById('global-appearance-tab'),      
        fontFamilySelect:$('#global-font-select'),
        fontSizeSlider: $('#global-font-size-slider-div'),
        iconSizeSlider: $('#global-icon-size-slider-div'),
        initialize:function(){
            this.tab.addEventListener('click',()=>{

                let fonts = font.get();
                console.log(fonts);
                fonts.forEach( (font) => {
                    editPieMenu.globalAppearanceSettings.fontFamilySelect.append(`<option value="${font}">${font}</option>`)
                });
                editPieMenu.globalAppearanceSettings.fontFamilySelect.val(AutoHotPieSettings.global.globalAppearance.font)

            },{once:true});            
            setSliderDivValue(editPieMenu.globalAppearanceSettings.fontSizeSlider,AutoHotPieSettings.global.globalAppearance.fontSize,6,30)

            this.fontFamilySelect.on('change', (event) => {                
                AutoHotPieSettings.global.globalAppearance.font = editPieMenu.globalAppearanceSettings.fontFamilySelect.val();       
                editPieMenu.pieMenuDisplay.refresh();                
            });

            this.fontSizeSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (AutoHotPieSettings.global.globalAppearance.fontSize = newValue)                
                editPieMenu.pieMenuDisplay.refresh();
            });    

            setSliderDivValue(editPieMenu.globalAppearanceSettings.iconSizeSlider,AutoHotPieSettings.global.globalAppearance.iconSize,16,128);
            this.iconSizeSlider.on('mousedown mousemove change', (event) => {
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (AutoHotPieSettings.global.globalAppearance.iconSize = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            })
        },
        loadSelectedPieKey:function(){},
    },
    launchSettings:{
        tab: document.getElementById('launch-settings-tab'),
        activationModeBtn: document.getElementById('change-activation-mode-btn'),  
        pieKeyAction: {
            div: $('#hotkey-action-div'), 
            select: $('#hotkey-action-select')
        },      
        escapeRadiusCheckbox: $('#enable-escape-radius-checkbox'),
        escapeRadiusSlider: $('#escape-radius-slider'),
        clickableFunctionsCheckbox: document.getElementById('clickable-functions-checkbox'),
        openMenuInCenterCheckbox: $('#force-center-screen-checkbox'),
        decoupleMouse:{
            div: $('#decouple-mouse-div'),
            checkbox: $('#decouple-mouse-checkbox')
        },
        initialize:function(){  

            this.tab.addEventListener('click',()=>{
                editPieMenu.launchSettings.loadSelectedPieKey();
            });

            this.activationModeBtn.addEventListener('click',function(){                
                changeActivationMode().then(val => {                    
                    let activationModeBtn = editPieMenu.launchSettings.activationModeBtn;
                    editPieMenu.selectedPieKey.activationMode.submenuMode = val;
                    activationModeBtn.innerHTML = subMenuModeDescriptions[val-1];
                    editPieMenu.loadSelectedPieKey();
                    $('[href="#tab-2"]').tab('show');                                
                },val => {
                    editPieMenu.loadSelectedPieKey();                    
                    $('[href="#tab-2"]').tab('show');
                });                
            });

            this.pieKeyAction.select.on('change', (e) => {
                editPieMenu.selectedPieKey.activationMode.pieKeyAction = e.target.value;                
            });

            this.escapeRadiusCheckbox.change((e)=>{
                let boxEnabled = this.escapeRadiusCheckbox.is(":checked");
                editPieMenu.selectedPieKey.activationMode.escapeRadius.enable = boxEnabled;
                editPieMenu.pieMenuDisplay.refresh();
                // if (boxEnabled){
                //     this.escapeRadiusSlider.show();
                // } else {
                //     this.escapeRadiusSlider.hide();
                // }
            });

            //may be hidden
            this.escapeRadiusSlider.on('mousedown mousemove change', (event) => {
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieKey.activationMode.escapeRadius.radius = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });

            let clickableFunctionsCheckbox = this.clickableFunctionsCheckbox
            clickableFunctionsCheckbox.addEventListener('click',function(){                
                editPieMenu.selectedPieKey.activationMode.clickableFunctions = clickableFunctionsCheckbox.checked;                                
            });  
            
            this.openMenuInCenterCheckbox.change((e)=>{
                editPieMenu.selectedPieKey.activationMode.openMenuInCenter = this.openMenuInCenterCheckbox.is(":checked");                            
            });

            this.decoupleMouse.checkbox.change((e)=>{
                editPieMenu.selectedPieKey.activationMode.decoupleMouse = this.decoupleMouse.checkbox.is(":checked");                            
            });
        },
        loadSelectedPieKey:function(){
            let actMode = editPieMenu.selectedPieKey.activationMode;
            this.activationModeBtn.innerHTML = subMenuModeDescriptions[actMode.submenuMode-1];
            if(actMode.submenuMode > 2){
                this.pieKeyAction.div.show();                
                this.pieKeyAction.select.val(actMode.pieKeyAction);
            } else {this.pieKeyAction.div.hide();}
            this.clickableFunctionsCheckbox.checked = actMode.clickableFunctions;
            this.escapeRadiusCheckbox.prop('checked', editPieMenu.selectedPieKey.activationMode.escapeRadius.enable);        
            this.openMenuInCenterCheckbox.prop('checked', editPieMenu.selectedPieKey.activationMode.openMenuInCenter);
            this.decoupleMouse.checkbox.prop('checked', editPieMenu.selectedPieKey.activationMode.decoupleMouse);
            function getEscapeRadiusMinimum(){    
                let minDistanceFromEdge = 5;       
                let maxDistance = 0;          
                editPieMenu.selectedPieKey.pieMenus.forEach( (menu) => {
                    let testVal = menu.radius + menu.thickness + minDistanceFromEdge;
                    if (testVal > maxDistance){
                        maxDistance = testVal;
                    }                                        
                });
                return maxDistance
            }
            let escapeRadiusMinimum = getEscapeRadiusMinimum();
            console.log(escapeRadiusMinimum)
            setSliderDivValue(this.escapeRadiusSlider,Math.max(escapeRadiusMinimum,editPieMenu.selectedPieKey.activationMode.escapeRadius.radius),getEscapeRadiusMinimum(),500);        
        },
        open: function(){
            $('[href="#tab-8"]').tab('show');            
        }
    },
    appearanceSettings:{
        initialize:function(){
            let colorRefreshTime = 16           

            this.mainMenu.selectionColorInput.onInput = throttle(function(){                                  
                    editPieMenu.selectedPieMenu.selectionColor = hexToRgb(this.toHEXString());
                    editPieMenu.pieMenuDisplay.refresh();
                },colorRefreshTime);
            this.mainMenu.selectionColorInput.onChange = function(){
                editPieMenu.selectedPieMenu.selectionColor = hexToRgb(this.toHEXString());
                editPieMenu.pieMenuDisplay.refresh();                
            }; 

            this.mainMenu.backgroundColorInput.onInput = throttle(function(){    
                editPieMenu.selectedPieKey.pieMenus.forEach((pieMenu) => {pieMenu.backgroundColor = hexToRgb(this.toHEXString())})
                editPieMenu.pieMenuDisplay.refresh();
            },colorRefreshTime);
            this.mainMenu.backgroundColorInput.onChange = function(){
                editPieMenu.selectedPieKey.pieMenus.forEach((pieMenu) => {pieMenu.backgroundColor = hexToRgb(this.toHEXString())})
                editPieMenu.pieMenuDisplay.refresh();                
            };

            this.mainMenu.fontColorInput.onInput = throttle(function(){                                  
                editPieMenu.selectedPieKey.pieMenus.forEach((pieMenu) => {pieMenu.fontColor = hexToRgb(this.toHEXString())})
                editPieMenu.pieMenuDisplay.refresh();
            },colorRefreshTime);
            this.mainMenu.fontColorInput.onChange = function(){
                editPieMenu.selectedPieKey.pieMenus.forEach((pieMenu) => {pieMenu.fontColor = hexToRgb(this.toHEXString())})                
                editPieMenu.pieMenuDisplay.refresh();                
            };


            this.mainMenu.radiusSlider.on('mousedown mousemove change', (event) => {
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.radius = newValue);
                editPieMenu.launchSettings.loadSelectedPieKey();                                
                editPieMenu.pieMenuDisplay.refresh();
            });
            this.mainMenu.thicknessSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                editPieMenu.selectedPieMenu.thickness = (newValue) ? newValue : editPieMenu.selectedPieMenu.thickness;
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.thickness = newValue);
                editPieMenu.launchSettings.loadSelectedPieKey();
                editPieMenu.pieMenuDisplay.refresh();
            });            

            this.mainMenu.labelRadiusSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);                
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.labelRadius = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });

            this.mainMenu.labelRoundnessSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);                
                // (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.labelRoundness = newValue)
                if (typeof(newValue) === 'number') {
                    editPieMenu.selectedPieKey.pieMenus.forEach((pieMenu) => {pieMenu.labelRoundness = newValue})
                }        
                editPieMenu.pieMenuDisplay.refresh();
            });

            //Main Angle Offset
            this.mainMenu.angleOffsetBtnGroup.addEventListener('click',function(event){ 
                event.stopPropagation()
                event.preventDefault();
                $("#main-angle-offset-btn-group :input").each(function(index, val){                    
                    if(event.target.previousElementSibling && val.name == event.target.previousElementSibling.name){                        
                        val.checked = true                        
                        if (val.name == "offset"){
                            editPieMenu.appearanceSettings.refreshPieAngle(true)                          
                        } else { // == "none"                            
                            editPieMenu.appearanceSettings.refreshPieAngle(false)
                        }                        
                    } else {
                        val.checked = false                            
                    };                    
                })                
                editPieMenu.pieMenuDisplay.refresh();            
            });

            this.mainMenu.labelDelaySlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieKey.labelDelay = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });  


            //Submenu controls
            
            this.subMenu.selectionColorInput.onInput = throttle(function(){                                  
                editPieMenu.selectedPieMenu.selectionColor = hexToRgb(this.toHEXString());
                editPieMenu.pieMenuDisplay.refresh();
            },colorRefreshTime);
            this.subMenu.selectionColorInput.onChange = function(){
                editPieMenu.selectedPieMenu.selectionColor = hexToRgb(this.toHEXString());
                editPieMenu.pieMenuDisplay.refresh();                
            };


            this.subMenu.radiusSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.radius = newValue)
                editPieMenu.launchSettings.loadSelectedPieKey();
                editPieMenu.pieMenuDisplay.refresh();
            });
            this.subMenu.thicknessSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.thickness = newValue)
                editPieMenu.launchSettings.loadSelectedPieKey();
                editPieMenu.pieMenuDisplay.refresh();
            });
            this.subMenu.labelRadiusSlider.on('mousedown mousemove change', (event) => {                         
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedPieMenu.labelRadius = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });
            
            this.subMenu.backFunctionCheckBox.addEventListener('click',function(event){
                if(event.target.checked){
                    //Create and insert Back functionn                    
                    editPieMenu.slice.add(0,{
                        function: "submenu",
                        params: {
                            pieMenuNumber: editPieMenu.findSubMenuParent(),
                            isBack: true
                        },
                        label: "Back",
                        hotkey: "",
                        clickable: false,
                        returnMousePos: false,
                        icon: {
                            filePath: "SubmenuBack.png",
                            WBOnly: true
                            }
                        })
                    //Set Pie Angle?
                    // editPieMenu.appearanceSettings.refreshPieAngle();
                    //Hide Angle buttons
                    $("#sub-menu-angle-offset-div").removeClass()
                    $("#sub-menu-angle-offset-div").hide()
                }else{
                    editPieMenu.slice.delete(1);
                    editPieMenu.appearanceSettings.refreshPieAngle(false);
                    $("#sub-menu-angle-offset-div").addClass('d-flex align-items-center')
                    $("#sub-menu-angle-offset-div").show()                    
                    //Remove back function
                }                
                editPieMenu.pieMenuDisplay.refresh();
                editPieMenu.appearanceSettings.loadSelectedPieKey();
            });

            this.subMenu.angleOffsetBtnGroup.addEventListener('click',function(event){   
                event.stopPropagation();
                event.preventDefault();             
                $("#sub-angle-offset-btn-group :input").each(function(index, val){
                    if(event.target.previousElementSibling && val.name == event.target.previousElementSibling.name){ 
                        val.checked = true
                        if (val.name == "offset"){                            
                            editPieMenu.appearanceSettings.refreshPieAngle(true)                          
                        } else { // == "none"                            
                            editPieMenu.appearanceSettings.refreshPieAngle(false)
                        }                        
                    } else {
                        val.checked = false                            
                    };
                });
                editPieMenu.pieMenuDisplay.refresh();            
            });
           
        },        
        loadSelectedPieKey:function(){
            let selectedPieMenu = editPieMenu.selectedPieMenu;

            if(editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu) == 0){                
                if(editPieMenu.selectedPieMenu.pieAngle != 0){
                    $('#main-angle-offset-btncheck1').prop('checked', false)
                    $('#main-angle-offset-btncheck2').prop('checked', true)                    
                }else{
                    $('#main-angle-offset-btncheck1').prop('checked', true)                    
                    $('#main-angle-offset-btncheck2').prop('checked', false)                    
                }               

                this.mainMenu.selectionColorInput.processValueInput(rgbToHex(selectedPieMenu.selectionColor))
                
                this.mainMenu.backgroundColorInput.processValueInput(rgbToHex(selectedPieMenu.backgroundColor))                 
                this.mainMenu.fontColorInput.processValueInput(rgbToHex(selectedPieMenu.fontColor))                 
                
                setSliderDivValue(this.mainMenu.radiusSlider,selectedPieMenu.radius,1,100);
                setSliderDivValue(this.mainMenu.thicknessSlider,selectedPieMenu.thickness,2,69);
                setSliderDivValue(this.mainMenu.labelRadiusSlider,selectedPieMenu.labelRadius,1,150);                
                setSliderDivValue(this.mainMenu.labelRoundnessSlider,selectedPieMenu.labelRoundness,0,100);
                editPieMenu.selectedPieKey.pieMenus.forEach( (pieMenu) => {pieMenu.labelRoundness = editPieMenu.selectedPieKey.pieMenus[0].labelRoundness});
                setSliderDivValue(this.mainMenu.labelDelaySlider,editPieMenu.selectedPieKey.labelDelay,0,50,1);
            }else{
                if(editPieMenu.selectedPieMenu.pieAngle != 0){
                    $('#sub-angle-offset-btncheck1').prop('checked', false)
                    $('#sub-angle-offset-btncheck2').prop('checked', true)                    
                }else{
                    $('#sub-angle-offset-btncheck1').prop('checked', true)  
                    $('#sub-angle-offset-btncheck2').prop('checked', false)
                                      
                }
                this.subMenu.selectionColorInput.processValueInput(rgbToHex(selectedPieMenu.selectionColor));
                setSliderDivValue(this.subMenu.radiusSlider,selectedPieMenu.radius,1,100);
                setSliderDivValue(this.subMenu.thicknessSlider,selectedPieMenu.thickness,2,69);
                setSliderDivValue(this.subMenu.labelRadiusSlider,selectedPieMenu.labelRadius,1,150);
                //Init previous menu value                
                if (editPieMenu.selectedPieMenu.functions[1].params.isBack == true){
                    this.subMenu.backFunctionCheckBox.checked = true
                } else {
                    this.subMenu.backFunctionCheckBox.checked = false                    
                }
            }  
        },
        refreshPieAngle(setIsOffset=null){
            // let pieAngle = editPieMenu.selectedPieMenu.pieAngle
            let isSubmenu = (editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu) != 0) ? true : false;
            
            function getParentMenuAngle(parentMenu, pieMenuNumber){                
                for (k in parentMenu.functions){
                    let func = parentMenu.functions[k];
                    if (func.function == "submenu"){
                        if(func.params.pieMenuNumber == pieMenuNumber){                            
                            let parentNumSlices = parentMenu.functions.length-1; 
                            let newMenuNumSlices = editPieMenu.selectedPieMenu.functions.length-1;                           
                            // let parentFuncAngle = (360/parentNumSlices)*(k-1)+parentMenu.pieAngle-((360/newMenuNumSlices)/2);
                            let parentFuncAngle = (360/parentNumSlices)*(k-1)+(180/parentNumSlices)+parentMenu.pieAngle;
                            let backAngle = cycleRange(parentFuncAngle+180-(180/newMenuNumSlices));                          
                            // let parentFuncAngle = (360/parentNumSlices)*(k-1)
                            // console.log("Parent: " + parentFuncAngle)
                            // console.log("back: " + backAngle)
                            
                            return backAngle                                                 
                        }                                
                    }
                }
                return 0
            }
            function findOffsetAngle(){
                let numSlices = editPieMenu.selectedPieMenu.functions.length-1
                return 180/numSlices
            }
            function handleIsOffset(isOffset){
                if (isOffset != null){
                    if (isOffset){
                        editPieMenu.selectedPieMenu.pieAngle = findOffsetAngle();
                    }else{
                        editPieMenu.selectedPieMenu.pieAngle = 0;
                    }
                } else {
                    if (editPieMenu.selectedPieMenu.pieAngle != 0){
                        editPieMenu.selectedPieMenu.pieAngle = findOffsetAngle();
                    }
                    return                                        
                } 
            }
            if (isSubmenu){
                let backExists = editPieMenu.selectedPieMenu.functions[1].params.isBack ? true : false;                
                if(backExists){                    
                    //Set Angle to align back to opposite of previous menu angle
                    let parentMenu = editPieMenu.selectedPieKey.pieMenus[editPieMenu.findSubMenuParent()]
                    let newAngle = getParentMenuAngle(parentMenu, editPieMenu.selectedPieKey.pieMenus.indexOf(editPieMenu.selectedPieMenu))
                    editPieMenu.selectedPieMenu.pieAngle = newAngle;  
                    // console.log(editPieMenu.selectedPieMenu.pieAngle);              
                    return                 
                } else {
                    // Treat as none or offset angle    
                    handleIsOffset(setIsOffset);                
                }         
            }else{
                handleIsOffset(setIsOffset);
            }  
        },
        mainMenu:{
            show:function(){
                mainMenuGroup = document.getElementById('main-menu-appearance-settings');                                
                subMenuGroup = document.getElementById('sub-menu-appearance-settings');
                mainMenuGroup.style.display = "block"                           
                subMenuGroup.style.display = "none"                           
            },            
            selectionColorInput: $('#main-selection-color-input')[0].jscolor,            
            backgroundColorInput:$('#main-background-color-input')[0].jscolor,            
            fontColorInput:$('#menu-font-color-input')[0].jscolor,            
            radiusSlider:$('#main-menu-radius-slider-div'),
            // radiusSlider:document.getElementById('main-menu-radius-slider-div'),
            thicknessSlider:$('#main-menu-thickness-slider-div'),
            labelRadiusSlider:$('#main-menu-label-radius-slider-div'),
            labelRoundnessSlider:$('#label-roundness-slider'),
            angleOffsetBtnGroup:document.getElementById('main-angle-offset-btn-group'),
            labelDelaySlider:$('#main-menu-label-delay-slider-div')
        },
        subMenu:{
            show:function(){
                mainMenuGroup = document.getElementById('main-menu-appearance-settings');                                
                subMenuGroup = document.getElementById('sub-menu-appearance-settings');
                mainMenuGroup.style.display = "none"                           
                subMenuGroup.style.display = "block"                
            },
            selectionColorInput:$('#sub-menu-selection-color-input')[0].jscolor,            
            radiusSlider:$('#sub-menu-radius-slider-div'),
            thicknessSlider:$('#sub-menu-thickness-slider-div'),
            labelRadiusSlider:$('#sub-menu-label-radius-slider-div'),
            backFunctionCheckBox:document.getElementById('include-back-function-checkbox'),
            angleOffsetBtnGroup:document.getElementById('sub-angle-offset-btn-group')           
        },
    },
    sliceSettings:{
        sliceLabelTextInput: document.getElementById('slice-label-text-input'),
        sliceLabelIconInput: {
            chooseFileBtn:document.getElementById('slice-icon-choose-file-btn'),
            fileText:document.getElementById('slice-icon-file-display-text'),
            removeIconBtn:document.getElementById('remove-label-icon-btn'),
            greyscaleCheckbox:document.getElementById('icon-greyscale-checkbox')
        },        
        sliceHotkeyBtn: document.getElementById('change-slice-hotkey-btn'),
        sliceRemoveHotkeyBtn:document.getElementById('unset-slice-hotkey-btn'),
        sliceFunction: {
            dropdownBtn: document.getElementById('function-dropdown-btn'),
            dropdownMenu: document.getElementById('function-dropdown-menu'),
            tabs: document.getElementById('function-tabs'),
            sendKey:{
                keysDiv: document.getElementById('send-keys-div'),
                keysListDiv: $('#send-key-button-list'),
                keyButtonGroupTemplate: document.getElementById('send-key-btn-group-template'),               
                keyButtonTemplate: document.getElementById('send-key-btn-template'),               
                keyAddButton: $('#send-key-add-keystroke-btn'),               
                timeBetweenKeysDiv: $('#time-between-keys-input-div'),
                delayKeyReleaseCheckbox: $('#delay-key-release-checkbox')
            },
            mouseClick:{
                clickBtnGroup: document.getElementById('mouse-click-btn-group'),
                modifierBtnGroup: document.getElementById('mouse-click-modifier-btn-group'),
                dragCheckbox: document.getElementById('mouse-drag-checkbox')                           
            },
            runScript:{
                chooseFileBtn: document.getElementById('run-script-choose-btn'),
                runScriptExeInput: document.getElementById('run-script-text-input'),
                removeBtn: document.getElementById('remove-script-btn')
            },
            openFolder:{
                chooseFolderBtn: document.getElementById('open-folder-choose-btn'),
                displayText: document.getElementById('open-folder-display-text'),
                removeBtn: document.getElementById('remove-folder-btn')                
            },
            menuSelect:{
                itemsDiv: $('#menu-select-items'),
                itemTemplate: $('#menu-select-item-div-template'),
                addBtn: $('#menu-select-add-item-btn')
            },
            repeatLast:{
                timeoutSliderDiv: $('#repeat-timeout-slider-input')
            },
            subMenu:{
                editSubMenuBtn: document.getElementById('edit-sub-menu-btn')            
            },
            openURL:{
                urlTextInput:$('#url-text-input')
            },
            switchApplication:{
                findExeButton: $('#switch-app-find-exe-button'),
                getFocusedApplicationButton: $('#switch-app-get-focused-exe-button'),
                exeTextInput:$('#switch-app-exe-text-input'),
                multipleInstanceCheckbox:$('#multiple-instance-app-checkbox')
            },
            noOptions:{}
        },
        
        initialize:function(){   
            let disp = editPieMenu.pieMenuDisplay;            
            this.sliceLabelTextInput.addEventListener('change', function(event){
                editPieMenu.selectedSlice.label = event.target.value;                
                disp.refresh();
            });
            this.sliceLabelIconInput.chooseFileBtn.addEventListener('click',function(event){
                function getImageFromBuffer(filename){   
                    let returnImage = false 
                    let imagesHTMLCollection = document.getElementById('image-buffer').getElementsByTagName('img')
                    var images = [].slice.call(imagesHTMLCollection);
                    images.forEach(function(element, index){
                        let localIconPath = iconManager.getLocalIconPath(element.src);
                        if (localIconPath == filename){
                            returnImage = element;
                        }                                
                    })
                    return returnImage
                }
                function determineGreyscale(img) {
                    // Create an empty canvas element                    
                    var buffer = document.createElement("canvas");
                    buffer.width = img.width;
                    buffer.height = img.height;
                
                    // Copy the image contents to the canvas
                    var btx = buffer.getContext("2d");
                    btx.drawImage(img, 0, 0);
                    var imgData = btx.getImageData(0,0,buffer.width,buffer.height);
                    var i;
                    for (i = 0; i < imgData.data.length; i += 4) {
                        if(imgData.data[i] == imgData.data[i+1] && imgData.data[i] == imgData.data[i+2]){
                            continue 
                        }else{
                            return false                            
                        }                      
                    }
                    return true
                } 
                selectIconPage.selectIcon().then((returnImg) => {
                    if(returnImg){ 
                        // console.log(returnImg);    
                        let newFileName = iconManager.getLocalIconPath(returnImg) 
                        
                        editPieMenu.selectedSlice.icon.filePath = newFileName
                        editPieMenu.selectedSlice.icon.WBOnly = determineGreyscale(getImageFromBuffer(newFileName));                                       
                    }                    
                    editPieMenu.sliceSettings.loadSelectedPieKey();
                    disp.refresh();
                    $('[href="#tab-2"]').tab('show');
                    return
                },(val)=>{
                    $('[href="#tab-2"]').tab('show');
                });              
            });
            // this.sliceLabelIconInput.fileText
            this.sliceLabelIconInput.removeIconBtn.addEventListener('click',function(event){
               editPieMenu.selectedSlice.icon.filePath = "";
               editPieMenu.sliceSettings.sliceLabelIconInput.fileText.innerHTML = "No icon selected";               
               disp.refresh();                                         
            });
            this.sliceLabelIconInput.greyscaleCheckbox.addEventListener('click',function(event){                
                editPieMenu.selectedSlice.icon.WBOnly = event.target.checked;
                disp.refresh();
            });
            sliceLabelIconGreyscaleCheckbox = document.getElementById('icon-greyscale-checkbox');
            this.sliceHotkeyBtn.addEventListener('click',function(event){
                assignKey({allowModifiers:false,allowScrollInputs:true,invalidAHKKeys:editPieMenu.getInvalidSliceHotkeys()}).then(val => {
                    editPieMenu.selectedSlice.hotkey = val.ahkKey 
                    editPieMenu.sliceSettings.sliceHotkeyBtn.innerHTML = val.displayKey   
                    editPieMenu.sliceSettings.loadSelectedPieKey();
                    editPieMenu.pieMenuDisplay.refresh();
                    $('[href="#tab-2"]').tab('show');
                }, val => {                   
                    $('[href="#tab-2"]').tab('show');
                });
            });
            this.sliceRemoveHotkeyBtn.addEventListener('click',function(event){
                editPieMenu.selectedSlice.hotkey = "";
                editPieMenu.sliceSettings.loadSelectedPieKey();  
                editPieMenu.pieMenuDisplay.refresh();             
            });

            $('#app-profile-dropdown-items').on('click', 'a', function(event) {
                var appProfileName = this.textContent;
            });

            this.sliceFunction.dropdownBtn.addEventListener('click',function(event){
            });

            this.sliceFunction.dropdownMenu.addEventListener('click',function(event){
                
                //Block selecting edge of menu.
                if(event.target.nodeName == "DIV"){return}
                
                if (event.target.innerHTML == "More Functions..."){
                    functionSelectPage.selectFunction().then((val) => {                        
                        processFunctionSelection(val, true);
                        // editPieMenu.forceReload();
                        // $('[href="#tab-2"]').tab('show');                         
                    }, () => {
                        editPieMenu.forceReload();
                        // $('[href="#tab-2"]').tab('show');
                    });
                    return
                } else {
                    processFunctionSelection(event.target.innerHTML, true);         
                }
                
                
                function processFunctionSelection(functionNameString, configureFunctionOnSelect=false){
                    let selectedFunc = getAHKFunc(functionNameString);                      
                
                    // editPieMenu.selectedSlice.function = selectedFunc.ahkFunction

                    let newPieFunc;
                    if (selectedFunc.ahkFunction == "customFunction"){ 
                        newPieFunc = new PieFunction({
                            function: selectedFunc.ahkFunction,                    
                            params: PieFunction.getPieFunctionDefaultParameters(selectedFunc.id),   
                            label: editPieMenu.selectedSlice.label,
                            hotkey: editPieMenu.selectedSlice.hotkey,
                            clickable: editPieMenu.selectedSlice.clickable,
                            returnMousePos: editPieMenu.selectedSlice.returnMousePos,
                            icon: editPieMenu.selectedSlice.icon
                        });                     
                    } else {
                        newPieFunc = new PieFunction({
                            function: selectedFunc.ahkFunction,                    
                            params: PieFunction.getPieFunctionDefaultParameters(selectedFunc.ahkFunction),   
                            label: editPieMenu.selectedSlice.label,
                            hotkey: editPieMenu.selectedSlice.hotkey,
                            clickable: editPieMenu.selectedSlice.clickable,
                            returnMousePos: editPieMenu.selectedSlice.returnMousePos,
                            icon: editPieMenu.selectedSlice.icon
                        });
                    }                 
                    Object.assign(editPieMenu.selectedSlice, newPieFunc)

                    if (editPieMenu.selectedSlice.function == "submenu"){
                        editPieMenu.selectedSlice.params = setSubMenuDefaults();
                    }

                    function getAHKFunc(p_funcNameString){
                        let functionConfigList = AutoHotPieSettings.global.functionConfig;
                        // let selectedFuncName = event.target.innerHTML;
                        let selectedFuncName = p_funcNameString;
                        //Check common functions
                        for(let functionProfileIndex in functionConfigList.common){
                            let p_func = functionConfigList.common[functionProfileIndex];                    
                            if (p_func.name == selectedFuncName){                                
                                return p_func
                            }
                        }

                        //Check custom functions
                        let foundCustomFunc = CustomFunction.getCustomFunctionByID(p_funcNameString);
                        if (foundCustomFunc){
                            return foundCustomFunc;
                        }

                        // Didn't find anything
                        return
                    };
                    
                    function setSubMenuDefaults(){
                        function determineAvailablePieNumber(){
                            let occupiedPieNumbers = [0]
                            for (let pieMenuIndex in editPieMenu.selectedPieKey.pieMenus){
                                let pieMenu = editPieMenu.selectedPieKey.pieMenus[pieMenuIndex];                                    
                                for (let sliceFuncIndex in pieMenu.functions){
                                    let sliceFunc = pieMenu.functions[sliceFuncIndex];                                        
                                    if(sliceFunc.function == "submenu"){                                              
                                        if(!occupiedPieNumbers.includes(sliceFunc.params.pieMenuNumber)){  
                                            if (typeof sliceFunc.params.pieMenuNumber == "number"){
                                                occupiedPieNumbers.push(sliceFunc.params.pieMenuNumber)                                                    
                                            }
                                        }
                                    }
                                }
                            }
                            // console.log(occupiedPieNumbers)
                            let vacantPieNumber = 0
                            while(occupiedPieNumbers.includes(vacantPieNumber)){
                                vacantPieNumber++
                            }
                            return vacantPieNumber
                        };
                        let pieNumber = determineAvailablePieNumber();
                        let newPieMenuObj = new PieMenu({
                            backgroundColor: editPieMenu.selectedPieMenu.backgroundColor,
                            selectionColor: editPieMenu.selectedPieMenu.selectionColor,
                            radius:40,
                            thickness:editPieMenu.selectedPieMenu.thickness,
                            labelRadius: 80,
                            pieAngle: 0,
                            functions: PieFunction.fill(9)
                        });
                        editPieMenu.selectedPieKey.pieMenus[pieNumber] = newPieMenuObj
                        return {pieMenuNumber: pieNumber,isBack: false}
                    }
                    
                    // editPieMenu.sliceSettings.loadSelectedPieKey(); //Maybe this should be removed or moved to the else of the next statement.
                    if (configureFunctionOnSelect || true) {
                        runParameterSelection(editPieMenu.selectedSlice.function);
                    } else {
                        checkForDefaultLabel();
                        editPieMenu.sliceSettings.loadSelectedPieKey();
                    }
                    function runParameterSelection(pieFunc){
                        switch (pieFunc){
                            case "sendKey":
                                assignKey().then(val => {                            
                                    editPieMenu.selectedSlice.params.keys[0] = val.ahkKey    
                                    let textLabel = editPieMenu.selectedSlice.label                                
                                    if (textLabel.includes("New Slice") || textLabel == ""){                                        
                                        setDefaultLabel(val.displayKey, "")
                                    }                                    
                                    $('[href="#tab-2"]').tab('show');
                                    // editPieMenu.sliceSettings.sliceFunction.sendKey.keysDiv.scrollIntoView({behavior:"smooth"});
                                    window.scrollTo(0,document.body.scrollHeight);
                                    
                                    editPieMenu.sliceSettings.loadSelectedPieKey();   //Mayb be able to remove these if everything is loaded anyway at the end.
                                }, val => {                   
                                    $('[href="#tab-2"]').tab('show');                                
                                });
                                return;
                            case "mouseClick":                            
                                setDefaultLabel("Click","FillMouse.png");
                                editPieMenu.sliceSettings.loadSelectedPieKey();
                                return;
                            case "runScript":
                                let scriptFilename = electron.openScriptFile()
                                if(scriptFilename){                    
                                    editPieMenu.selectedSlice.params.filePath = scriptFilename;                                       
                                    editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExeInput.value = scriptFilename; 
                                    console.log(scriptFilename);        
                                    setDefaultLabel(nodePath.basename(scriptFilename),"RunScript.png");          
                                } else {
                                    $('[href="#tab-2"]').tab('show');
                                }                                                                
                                editPieMenu.sliceSettings.loadSelectedPieKey();                                
                                return
                            case "openFolder":
                                let folderPath = electron.openFolderDialog()
                                if(folderPath){
                                    editPieMenu.selectedSlice.params.filePath = folderPath;   
                                    editPieMenu.sliceSettings.sliceFunction.openFolder.displayText.innerHTML = folderPath; 
                                    setDefaultLabel(nodePath.basename(folderPath),"Folder.png");          
                                } else {
                                    $('[href="#tab-2"]').tab('show');
                                }   
                                editPieMenu.sliceSettings.loadSelectedPieKey();             
                                return;
                            case "submenu":
                                setDefaultLabel("Submenu","SubmenuLine.png");
                                editPieMenu.sliceSettings.loadSelectedPieKey();                              
                                return;
                            case "repeatLastFunction":                                
                                setDefaultLabel("Repeat Last","Repeat.png");                          
                                return;
                            case "submenu":
                                setDefaultLabel("Submenu","SubmenuLine.png");                          
                                return;
                            case "none":
                                setDefaultLabel("","");
                                return;
                            case "resizeWindow":
                                setDefaultLabel("Resize Window","ResizeWindow.png");               
                                return;
                            case "moveWindow":
                                setDefaultLabel("Move Window","MoveWindow.png");               
                                return;
                            case "openURL":
                                setDefaultLabel("Open Link","OpenURL.png");
                                return;
                            case "openSettings":
                                setDefaultLabel("AHP Settings","SettingsCog.png");               
                                return;
                            case "switchApplication":
                                setDefaultLabel("Switch App", "SwitchApplication.png");
                                return;                      
                            default:
                                return;
                        }
                    }                   

                    function setDefaultLabel(text=null, icon=null){
                        if (text != null){
                            editPieMenu.selectedSlice.label = text;
                        }
                        if (icon != null){
                            editPieMenu.selectedSlice.icon = {filePath:icon,WBOnly:true};
                        }
                        editPieMenu.pieMenuDisplay.refresh();
                        editPieMenu.sliceSettings.loadSelectedPieKey();
                        $('[href="#tab-2"]').tab('show');
                        // editPieMenu.forceReload();
                    }
                    function checkForDefaultLabel(){                        
                        switch (editPieMenu.selectedSlice.function){
                        case "mouseClick":                            
                            setDefaultLabel("Click","FillMouse.png");
                            return;
                        case "repeatLastFunction":
                            setDefaultLabel("Repeat Last","Repeat.png");                          
                            return;
                        case "submenu":
                            setDefaultLabel("Submenu","SubmenuLine.png");                          
                            return;
                        case "none":
                            setDefaultLabel("","");               
                            return;
                        case "resizeWindow":
                            setDefaultLabel("Resize Window","ResizeWindow.png");               
                            return;
                        case "moveWindow":
                            setDefaultLabel("Move Window","MoveWindow.png");               
                            return;
                        case "openURL":
                            setDefaultLabel("Open Link","OpenURL.png");               
                            return;
                        case "openSettings":
                            setDefaultLabel("AHP Settings","SettingsCog.png");               
                            return;
                        case "openSettings":
                            setDefaultLabel("AHP Settings","SettingsCog.png");               
                            return;
                        default:
                            return;
                        }

                    }
                }
                
            });

            //Send Keystroke
            //Remove button group template and save to var 

            this.sliceFunction.sendKey.keysDiv.addEventListener("click",function(event){
                selKeyObj = editPieMenu.selectedSlice.params
                if(!event.target){
                    return;
                }
                let target;
                if(event.target.nodeName == "I"){
                    
                    target = event.target.parentElement;
                }else{
                    target = event.target;
                }                
                
                if(target.name && target.name.slice(0,18) == "send-keystroke-btn"){
                    //Get index
                    let keyIndex = parseInt(target.name.split("-").slice(-1)[0])
                    //Remove or edit
                    
                    if(target.name.split("-")[3]=="remove"){
                        selKeyObj.keys.splice(keyIndex,1)
                        editPieMenu.sliceSettings.loadSelectedPieKey();
                    }else if(target.name.split("-")[3]=="add"){
                        assignKey().then(val => { 
                            selKeyObj.keys.push(val.ahkKey)                            
                            $('[href="#tab-2"]').tab('show');
                            // editPieMenu.sliceSettings.sliceFunction.sendKey.keysDiv.scrollIntoView({behavior:"smooth"});
                            window.scrollTo(0,document.body.scrollHeight);
                            editPieMenu.sliceSettings.loadSelectedPieKey();
                        }, val => {                   
                            $('[href="#tab-2"]').tab('show');
                        });
                    }else{
                        // console.log(getKeyObjFromAhkString(selKeyObj.keys[keyIndex]))
                        assignKey().then(val => {                            
                            selKeyObj.keys[keyIndex] = val.ahkKey                            
                            $('[href="#tab-2"]').tab('show');
                            // editPieMenu.sliceSettings.sliceFunction.sendKey.keysDiv.scrollIntoView({behavior:"smooth"});
                            window.scrollTo(0,document.body.scrollHeight);
                            editPieMenu.sliceSettings.loadSelectedPieKey();                            
                        }, val => {                   
                            $('[href="#tab-2"]').tab('show');
                            
                        });
                    }                    
                }
            });

            this.sliceFunction.sendKey.timeBetweenKeysDiv.on('mousedown mousemove change', (event) => {
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedSlice.params.keyDelay = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });
            this.sliceFunction.sendKey.delayKeyReleaseCheckbox.on('change', (event) => {
                editPieMenu.selectedSlice.params.delayKeyRelease = event.target.checked
            });


            this.sliceFunction.repeatLast.timeoutSliderDiv.on('mousedown mousemove change', (event) => {
                let newValue = handleSliderDiv(event);
                (typeof(newValue) === 'number') && (editPieMenu.selectedSlice.params.timeout = newValue)
                editPieMenu.pieMenuDisplay.refresh();
            });

            //Mouse Click
            this.sliceFunction.mouseClick.clickBtnGroup.addEventListener('click',function(event){
                $("#mouse-click-btn-group :input").each(function(index, val){                     
                    // console.log(event.target.previousElementSibling.name)            
                    if(val.name == event.target.previousElementSibling.name){
                        val.checked = true
                        editPieMenu.selectedSlice.params.button = event.target.previousElementSibling.name;
                    } else {
                        val.checked = false                            
                    };
                });

            
            });
            this.sliceFunction.mouseClick.modifierBtnGroup.addEventListener('click',function(event){
                $("#mouse-click-modifier-btn-group :input").each(function(index, val){
                    if(event.target.previousElementSibling.name == val.name){                        
                        val.checked = !val.checked;
                    }                                          
                    if(index == 0){
                        editPieMenu.selectedSlice.params.shift = val.checked;
                    }else if (index == 1){
                        editPieMenu.selectedSlice.params.ctrl  = val.checked;
                    }else if (index == 2){
                        editPieMenu.selectedSlice.params.alt = val.checked;                           
                    }
                });                   
            });

            this.sliceFunction.mouseClick.dragCheckbox.addEventListener('click',function(event){                
                editPieMenu.selectedSlice.params.drag = event.target.checked;
            })

            //Run Script
            this.sliceFunction.runScript.chooseFileBtn.addEventListener('click',function(event){
                let scriptFilename = electron.openScriptFile()
                if(scriptFilename){                    
                    editPieMenu.selectedSlice.params.filePath = scriptFilename;   
                    console.log(scriptFilename);
                    editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExeInput.value = scriptFilename;                    
                }                
                editPieMenu.sliceSettings.loadSelectedPieKey();
                return
            })            
            this.sliceFunction.runScript.removeBtn.addEventListener('click',function(event){
                editPieMenu.selectedSlice.params.filePath = "";
                // editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExe.innerHTML = "No file selected";
                editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExeInput.value = "";
                editPieMenu.sliceSettings.loadSelectedPieKey(); 
             });
             this.sliceFunction.runScript.runScriptExeInput.addEventListener('change', (e) => {
                editPieMenu.selectedSlice.params.filePath = e.target.value;               
             });

             //Menu Select
             this.sliceFunction.menuSelect.addBtn.click( () => {
                let ms = editPieMenu.sliceSettings.sliceFunction.menuSelect;
                let newItemDiv = ms.itemTemplate.clone()[0];
                ms.itemsDiv.append(newItemDiv);
             });

             //Open Folder
             this.sliceFunction.openFolder.chooseFolderBtn.addEventListener('click', () => {
                let folderPath = electron.openFolderDialog()
                if(folderPath){                    
                    editPieMenu.selectedSlice.params.filePath = folderPath;   
                    editPieMenu.sliceSettings.sliceFunction.openFolder.displayText.innerHTML = folderPath;           
                }
                editPieMenu.sliceSettings.loadSelectedPieKey();
                return
             });
            //  this.sliceFunction.openFolder.displayText
            this.sliceFunction.openFolder.removeBtn.addEventListener('click', () => {
                editPieMenu.selectedSlice.params.filePath = "";
                editPieMenu.sliceSettings.sliceFunction.openFolder.displayText.innerHTML = "No folder selected";
                editPieMenu.sliceSettings.loadSelectedPieKey(); 
            });

            //Submenu
            this.sliceFunction.subMenu.editSubMenuBtn.addEventListener('click', function(){
                editPieMenu.selectPieMenu(editPieMenu.selectedSlice.params.pieMenuNumber)
                $('[href="#tab-9"]').tab('show');
            });

            //Open URL
            this.sliceFunction.openURL.urlTextInput.on('input propertychange', (event) => {
                // console.log(event)
                editPieMenu.selectedSlice.params.url = event.target.value;                               
            });

            //Switch Application
            this.sliceFunction.switchApplication.findExeButton.on('click', () => {
                let applicationFilePath = electron.openEXEFullPath();
                if(applicationFilePath){                    
                    editPieMenu.selectedSlice.params.filePath = applicationFilePath;                       
                }                
                editPieMenu.sliceSettings.loadSelectedPieKey();
                return                     
            });
            this.sliceFunction.switchApplication.getFocusedApplicationButton.on('click', () => {
                $('[href="#tab-34"]').tab('show');
                configureNewProfile.focusTimerGIF.hide();
                configureNewProfile.focusTimerGIF.fadeIn(10);
                getActiveWindowProcess().then((exe) => {                    
                    editPieMenu.selectedSlice.params.filePath = exe.path;
                    $('[href="#tab-2"]').tab('show');
                    editPieMenu.sliceSettings.loadSelectedPieKey();
                    win.focus();         
                }, () => {
                    confirmDialog({heading:"You dun goofed.",
                    description:"Focus the application you want to add a profile for.",
                    cancelText:"Go Back",
                    confirmText:"Back in Blue"                            
                }).then(() => {
                    $('[href="#tab-2"]').tab('show');
                }, () => {
                    $('[href="#tab-2"]').tab('show');
                })
                });
            });
            this.sliceFunction.switchApplication.exeTextInput.on('change', (e) => {
                editPieMenu.selectedSlice.params.filePath = e.target.value;
            });
            this.sliceFunction.switchApplication.multipleInstanceCheckbox.on('click', (e) => {
                editPieMenu.selectedSlice.params.multipleInstanceApplication = e.target.value;
            });

        },
        loadSelectedPieKey:function(){            
            let selectedSlice = editPieMenu.selectedSlice;             
            this.sliceLabelTextInput.value = selectedSlice.label;
            let selectedIsCenter = (editPieMenu.selectedPieMenu.functions.indexOf(editPieMenu.selectedSlice) == 0);
            
            //Handle icon control
            if (editPieMenu.selectedSlice.icon.filePath == ""){
                this.sliceLabelIconInput.fileText.setAttribute('class','text-muted')
                this.sliceLabelIconInput.fileText.innerHTML = "No icon selected"
            }else{
                this.sliceLabelIconInput.fileText.removeAttribute('class')                                                            
                this.sliceLabelIconInput.fileText.innerHTML = editPieMenu.selectedSlice.icon.filePath
            }
            
            this.sliceLabelIconInput.greyscaleCheckbox.checked = editPieMenu.selectedSlice.icon.WBOnly
            
            //Handle hotkey field
            if(editPieMenu.selectedSlice.hotkey == ""){
                this.sliceHotkeyBtn.innerHTML = "Assign Function Hotkey";
                editPieMenu.sliceSettings.sliceRemoveHotkeyBtn.style.visibility = "hidden";
            }else{
                this.sliceHotkeyBtn.innerHTML = editPieMenu.selectedSlice.hotkey;
                editPieMenu.sliceSettings.sliceRemoveHotkeyBtn.style.visibility = "visible";
            }
            
            let selectedSliceFunction = getSelectedFunction();            
            if(editPieMenu.selectedPieMenu.functions.indexOf(editPieMenu.selectedSlice) == 0){            
                //Hide Label, icon and Slice hotkey controls
                $('#pie-menu-display-description').show()
                $('#slice-label-div').hide()
                $('#icon-label-div').hide()
                $('#slice-hotkey-div').hide()
            }else{
                //Show Label, icon and Slice hotkey controls
                $('#pie-menu-display-description').hide()
                $('#slice-label-div').show()
                $('#icon-label-div').show()
                $('#slice-hotkey-div').show()
            }
            this.sliceFunction.dropdownBtn.innerHTML = selectedSliceFunction.name;
            //Show tab corresponding to option type
            showTabByName(selectedSliceFunction.optionType)
            function showTabByName(name){                
                let tabNames = editPieMenu.sliceSettings.sliceFunction.tabs.getElementsByClassName('nav-link')
                for(tabNameIndex in tabNames){
                    let tab = tabNames[tabNameIndex];
                    if(tab.nodeName == "A"){                        
                        if(tab.innerHTML == name){                            
                            $('[href="' + tab.getAttribute('href') + '"]').tab('show');                                                            
                        }
                    }
                }
            };  

            function getSelectedFunction(){                
                let selectedAHKFunc = editPieMenu.selectedSlice.function;                
                let funcList = AutoHotPieSettings.global.functionConfig.common;                    
                for(funcIndex in funcList){
                    let p_func = funcList[funcIndex];
                    if (p_func.ahkFunction == selectedAHKFunc){
                        if (p_func.ahkFunction == "customFunction"){
                            p_func = CustomFunction.getCustomFunctionByID(editPieMenu.selectedSlice.params.id)
                            return p_func
                        } else {
                            return p_func
                        }                        
                    }        
                }
                
                
                // let foundCustomFunc = CustomFunction.getCustomFunctionByID(p_funcNameString);
                //     if (foundCustomFunc){
                //         return foundCustomFunc;
                //     }
                
                return {
                    name:"None",
                    optionType:"No Options",
                    ahkFunction:"none"
                }
            };

            this.sliceFunction.dropdownMenu.innerHTML = "";              
            //Populate dropdown options  
            function loadAppProfileFunctionsArray(){
                let functionSettingsArray = [];
                let fc = AutoHotPieSettings.global.functionConfig.common
                // functionSettingsArray.push(fc[0].functions)
                for (let fcKey in fc){
                    let p_func = fc[fcKey];                    
                    
                    // foundAppSpecificFunctions = profileManagement.selectedProfile.ahkHandles.some(r=> p_func.associatedProfiles.includes(r.replace('.exe','')));
                    if(selectedIsCenter){
                        if(p_func.commonPlacement.center){
                            functionSettingsArray = functionSettingsArray.concat(p_func);                                                        
                        }                                                
                    }else{
                        if(p_func.commonPlacement.slice){
                            functionSettingsArray = functionSettingsArray.concat(p_func);                                                        
                        }
                    }
                }
                return functionSettingsArray
            };
            let sliceFunctionsList = loadAppProfileFunctionsArray();        
            sliceFunctionsList.forEach(function(sliceFunction,index){                
                addFunctionMenuItem(sliceFunction.name);           
            })
            addFunctionMenuItem("More Functions...");

            function addFunctionMenuItem(optionName){
                let menuItemOption = document.createElement("a");
                menuItemOption.setAttribute("id","slice-function-item");
                menuItemOption.setAttribute("class","dropdown-item");
                menuItemOption.text = optionName;
                editPieMenu.sliceSettings.sliceFunction.dropdownMenu.appendChild(menuItemOption);                
            }            

            let selectedFunc = this.sliceFunction.dropdownBtn.innerHTML
            console.log(selectedFunc);            
            let ahkParamObj = {}
            switch (selectedFunc){
                case "Send Key":
                    ahkParamObj = editPieMenu.selectedSlice.params;
                    function addKeystrokeButtonGroup(hotkeyObj, index, isRemoveable=true){
                        let btnClone
                        if (isRemoveable){
                            btnClone = editPieMenu.sliceSettings.sliceFunction.sendKey.keyButtonGroupTemplate.cloneNode(true); 
                            btnClone.children[0].setAttribute('name','send-keystroke-btn-' + index)
                            btnClone.children[0].innerHTML = hotkeyObj.displayKey;
                            btnClone.children[1].setAttribute('name','send-keystroke-btn-remove-' + index);                       
                        } else {
                            btnClone = editPieMenu.sliceSettings.sliceFunction.sendKey.keyButtonTemplate.cloneNode(true);
                            btnClone.setAttribute('name','send-keystroke-btn-' + index)
                            btnClone.innerHTML = hotkeyObj.displayKey;
                        }
                        
                        editPieMenu.sliceSettings.sliceFunction.sendKey.keysListDiv.append(btnClone);                        
                    }

                    //refresh key buttons

                    // $('#send-keys-div [class="btn-group"]').remove()
                    // $('#send-keys-div [class="btn-group"]').remove()
                    editPieMenu.sliceSettings.sliceFunction.sendKey.keysListDiv.empty();

                    if (ahkParamObj.keys.length == 0){
                        // $('#send-keys-div [name="send-keystroke-btn-0"]')[0].innerHTML = "Assign Key" 
                        $('#send-key-assign-key-btn').show();
                        editPieMenu.sliceSettings.sliceFunction.sendKey.keyAddButton.hide();
                    } else {
                        $('#send-key-assign-key-btn').hide();
                        editPieMenu.sliceSettings.sliceFunction.sendKey.keyAddButton.show();                      
                    }
                    ahkParamObj.keys.forEach(function(val, index){
                        // let p_HotkeyObj = getKeyObjFromAhkString(val);
                        let p_HotkeyObj = new Hotkey(val);
                        if(ahkParamObj.keys.length == 1){
                            addKeystrokeButtonGroup(p_HotkeyObj,index, false);
                            // $('#send-keys-div [name="send-keystroke-btn-0"]')[0].innerHTML = p_HotkeyObj.displayKey
                        } else {                              
                            addKeystrokeButtonGroup(p_HotkeyObj,index)
                        }                        
                    });
                    setSliderDivValue(editPieMenu.sliceSettings.sliceFunction.sendKey.timeBetweenKeysDiv, editPieMenu.selectedSlice.params.keyDelay, 0, 200)
                    editPieMenu.sliceSettings.sliceFunction.sendKey.delayKeyReleaseCheckbox.prop('checked', ahkParamObj.delayKeyRelease);
                    break;
                case "Mouse Click":
                    ahkParamObj = editPieMenu.selectedSlice.params; 

                    $("#mouse-click-btn-group :input").each(function(index, val){                        
                        if(val.name == ahkParamObj.button){
                            val.checked = true;
                        }else{
                            val.checked = false                          
                        }
                    });
                    
                    $("#mouse-click-modifier-btn-group :input").each(function(index, val){                        
                        if(index == 0){
                            val.checked = ahkParamObj.shift;
                        }else if (index == 1){
                            val.checked = ahkParamObj.ctrl;
                        }else if (index == 2){
                            val.checked = ahkParamObj.alt;                           
                        }
                    });
                    
                    editPieMenu.sliceSettings.sliceFunction.mouseClick.dragCheckbox.checked = ahkParamObj.drag
                    
                    break;
                case "Run File":
                    ahkParamObj = editPieMenu.selectedSlice.params;
                    // let scriptControl = editPieMenu.sliceSettings.sliceFunction.runScript;                    
                    if (ahkParamObj.filePath == ""){
                        // scriptControl.displayText.setAttribute('class','text-muted');
                        
                        editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExeInput.value = "";
                    }else{
                        // scriptControl.displayText.removeAttribute('class');                              
                        editPieMenu.sliceSettings.sliceFunction.runScript.runScriptExeInput.value = editPieMenu.selectedSlice.params.filePath;                
                    }
                    break;
                case "Menu Select": //Menu select function
                    ahkParamObj = editPieMenu.selectedSlice.params;
                    //Add stuff here
                    break;
                case "Open Folder":
                    ahkParamObj = editPieMenu.selectedSlice.params;                    
                    // let folderControl = editPieMenu.sliceSettings.sliceFunction.openFolder;         
                    if (ahkParamObj.filePath == ""){
                        // scriptControl.displayText.setAttribute('class','text-muted');
                        editPieMenu.sliceSettings.sliceFunction.openFolder.displayText.innerHTML = "No folder selected";
                    }else{
                        // scriptControl.displayText.removeAttribute('class');                              
                        editPieMenu.sliceSettings.sliceFunction.openFolder.displayText.innerHTML = editPieMenu.selectedSlice.params.filePath;                
                    }
                    break;
                case "Repeat Last":
                    ahkParamObj = editPieMenu.selectedSlice.params;
                    setSliderDivValue(editPieMenu.sliceSettings.sliceFunction.repeatLast.timeoutSliderDiv,ahkParamObj.timeout,0, 100, 1)
                    break;
                case "Sub Menu":
                    break;
                case "Open URL":
                    ahkParamObj = editPieMenu.selectedSlice.params;                    
                    editPieMenu.sliceSettings.sliceFunction.openURL.urlTextInput.val(ahkParamObj.url);
                    break;
                case "Switch App":
                    ahkParamObj = editPieMenu.selectedSlice.params;
                    editPieMenu.sliceSettings.sliceFunction.switchApplication.exeTextInput.val(ahkParamObj.filePath)
                    editPieMenu.sliceSettings.sliceFunction.switchApplication.multipleInstanceCheckbox[0].checked = ahkParamObj.multipleInstanceApplication;
                    break;
                case "No Options":
                    break;
                case "Parameter List":
                    break;
                case "customFunction":

                    // Set custom control values!!!
                    
                    break;
                default:
                    break;
            }             
            

        }
    }
}

// editPieMenu.initialize();

function handleColorInput(event){  
    let colorControl = event.currentTarget;
    return hexToRgb(colorControl.value);
}

function handleSliderDiv(event, step=1){    
    let sliderDiv = event.currentTarget;
    let inputSlider = sliderDiv.getElementsByClassName('form-range')[0];   
    let decimalStepScalar = Math.pow(10,inputSlider.step);     
    // let displayDecimal = Math.pow(10,inputSlider.decimal);
    let textInput = sliderDiv.getElementsByClassName('bg-dark border rounded-0 border-dark')[0];

    
    // console.log(event);
    // run first time only if possible:
    let min = inputSlider.min;
    let max = inputSlider.max;

    if (event.type == "mousedown" && event.target.className == "form-range"){ //Moving slider
        //start setTimeout
        IsDragging = true;
    }
    if (event.type == "mousemove" && IsDragging){ //Moving slider
        let newValue = updateSliderValue()
        // console.log("Drag: " + parseInt(newValue))
        return updateSliderValue();
    }
    if (event.type == "change"){ //Moved slider or entered number 
        let newValue = updateSliderValue();
        IsDragging = false
        return newValue
    }
    function updateSliderValue(){
        // console.log("Refreshing");
        if(IsDragging){
            //Used slider control            
            let newValue = parseInt(inputSlider.value)/decimalStepScalar; 
            // console.log(newValue)
            textInput.value = newValue; 
            textInput.placeholder = newValue;           
            textInput.oldvalue = newValue;
            return (newValue)
        } else {
            //Used Text Control
            let testValue;
            try {
                testValue = parseFloat(textInput.value);
                // console.log(testValue)
            }catch (e){
                textInput.value = textInput.oldvalue;
                textInput.placeholder = textInput.oldvalue;
                console.log("faile1d")
                return parseFloat(textInput.oldvalue);                
            }                       
            
            if (!IsNumeric(testValue) || min > (testValue*decimalStepScalar) || (testValue*decimalStepScalar) > max){
                textInput.value = textInput.oldvalue;
                textInput.placeholder = textInput.oldvalue;
                console.log("failed2")
                return parseFloat(textInput.oldvalue);
            }
            //Accepted Value
            let newValue = Math.round(testValue*decimalStepScalar)/decimalStepScalar;            
            textInput.oldvalue = newValue;
            textInput.placeholder = newValue;
            inputSlider.value = newValue*decimalStepScalar;
            return newValue
        }
        
    };

    
    return false
};

function setSliderDivValue(sliderDivElement,value,min,max,decimalStepDigit=0){                
    // let sliderRangeInput = sliderDivElement.getElementsByClassName('form-range')[0]
    // let sliderTextInput = sliderDivElement.getElementsByClassName('bg-dark border rounded-0 border-dark')[0]
    // sliderRangeInput.value = value*Math.pow(10,decimalStep);
    // sliderTextInput.value = value;
    // sliderTextInput.oldvalue = value*Math.pow(10,decimalStep);
    // sliderTextInput.placeholder = value; 
    let sliderRangeInput = sliderDivElement.children('.form-range');    
    sliderRangeInput[0].setAttribute('min',min);
    sliderRangeInput[0].setAttribute('max',max);
    sliderRangeInput[0].setAttribute('step', decimalStepDigit);
    sliderRangeInput[0].value = value*Math.pow(10,decimalStepDigit).toString();
    // sliderRangeInput[0].setAttribute('decimal', displayDecimalPlace);
    
    let sliderTextInput = sliderDivElement.children('.bg-dark.border.rounded-0.border-dark');
    
    sliderTextInput[0].value = value;
    sliderTextInput[0].oldvalue = value*Math.pow(10,decimalStepDigit);
    sliderTextInput[0].placeholder = value; 
};
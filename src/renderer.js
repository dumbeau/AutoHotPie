// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// No Node.js APIs are available in this process because
// `nodeIntegration` is turned off. Use `preload.js` to
// selectively enable features needed in the rendering
// process.

//Hide page tabs

document.getElementsByName("hidden-tab-items").forEach(function(tabs,index){
    tabs.style.display = "none"
})

iconManager.refreshIconLibrary();
font.refresh();


function rgbToHex(rgbArray) {
    let returnString = "#"
    rgbArray.forEach(function(component,index){
        if (index<3){
            returnString += componentToHex(component)
        }        
    });
    function componentToHex(c) {
        var hex = c.toString(16);
        return hex.length == 1 ? "0" + hex : hex;
    }
return returnString;    
}


function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? [
      parseInt(result[1], 16),
      parseInt(result[2], 16),
      parseInt(result[3], 16),255] : null;
  }

function rgbLightness(rgbArray){
    rgbArray[0]
    return (0.299*(rgbArray[0]/255) + 0.587*(rgbArray[1]/255) + 0.114*(rgbArray[2]/255))
}


function getKeyByValue(object, value) {
    return Object.keys(object).find(key => object[key] === value);
}

function getIndexOfObjByKeyValue(objects, key, value){
    objects.forEach(function(val, index){
        if(val[key] == value){
            return index
        }
    })
};

function calcAngle(aX,aY,bX,bY){
    let initVal = Math.atan2(bY-aY,bX-aX)*(180/Math.PI)
    if (initVal < 0){
        return initVal+360        
    } else {
        return initVal
    }
}
function cycleRange(num, range=360){
    let returnNum = num - (range*Math.floor(num/range))
    return returnNum
}

function extendAlongAngle(iPos, theta, distance){
    var fPosX = Math.round(iPos[0]+(distance*Math.cos((theta-90)*(Math.PI/180))))		
	var fPosY = Math.round(iPos[1]+(distance*Math.sin((theta-90)*(Math.PI/180))))
    return [fPosX,fPosY]
}

function roundRect(ctx, x, y, width, height, radius, fill, stroke) {
    if (typeof stroke === 'undefined') {
      stroke = true;
    }
    if (typeof radius === 'undefined') {
      radius = 5;
    }
    if (typeof radius === 'number') {
      radius = {tl: radius, tr: radius, br: radius, bl: radius};
    } else {
      var defaultRadius = {tl: 0, tr: 0, br: 0, bl: 0};
      for (var side in defaultRadius) {
        radius[side] = radius[side] || defaultRadius[side];
      }
    }
    ctx.beginPath();
    ctx.moveTo(x + radius.tl, y);
    ctx.lineTo(x + width - radius.tr, y);
    ctx.quadraticCurveTo(x + width, y, x + width, y + radius.tr);
    ctx.lineTo(x + width, y + height - radius.br);
    ctx.quadraticCurveTo(x + width, y + height, x + width - radius.br, y + height);
    ctx.lineTo(x + radius.bl, y + height);
    ctx.quadraticCurveTo(x, y + height, x, y + height - radius.bl);
    ctx.lineTo(x, y + radius.tl);
    ctx.quadraticCurveTo(x, y, x + radius.tl, y);
    ctx.closePath();
    if (fill) {
      ctx.fill();
    }
    if (stroke) {
      ctx.stroke();
    }  
  }

function degreesToRadians(numDegrees){
    return numDegrees*(Math.PI/180)      
}

function IsNumeric(input)
{
    return (input - 0) == input && (''+input).trim().length > 0;
}

function isObject(obj){
    return Object.prototype.toString.call(obj) === '[object Object]';
};

function throttle(func, interval) {    
    var lastCall = 0;
    return function() {
        var now = getNow();
        if (lastCall + interval < now) {
            lastCall = now;
            return func.apply(this, arguments);
        }
    };
}

function RunPieMenuApp(){
    runningPieMenu.open();
    setTimeout(function(){attemptPieMenuAppRun();},5)
    function attemptPieMenuAppRun(){
        pieMenus.run(AutoHotPieSettings.global.startup.runAHKPieMenus).then(val => {
            console.log("Pie Menus are running!");
            closeWindow();
        },val => {
            console.log("Pie Menus timed out.  No pie menus for you.");
            closeWindow();
        })
    };    
}

//Set JSColor default
jscolor.presets.default = {
	backgroundColor:'rgba(68,68,68,1)', hash:false, hideOnPaletteClick:true, shadowColor:'rgba(0,0,0,0.65)', borderRadius:2, borderWidth:0, previewSize:50, width:300, height:150, 
    pointerThickness:1	
};
jscolor.install();
// electron.addErrorListener();
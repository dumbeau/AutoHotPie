// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// No Node.js APIs are available in this process because
// `nodeIntegration` is turned off. Use `preload.js` to
// selectively enable features needed in the rendering
// process.

//Hide page tabs
if (true){
    document.getElementsByName("hidden-tab-items").forEach(function(tabs,index){
        tabs.style.display = "none"
    })
}

electron.loadIconImagesToBuffer('icons');

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


function getKeyObjFromAhkString(AhkString){ 
    let keyTableArray = AutoHotPieSettings.global.htmlAhkKeyConversionTable;

    let ahkBareKey = AhkString.replace('+','').replace('!','').replace('^','')
    let keyObj = keyTableArray.find(x => x.ahkKey === ahkBareKey)
    function checkAhkModSymbol(modSymbol){
        return AhkString.slice(0,3).includes(modSymbol);
    }
    function processKeyEventToFullString(){
        returnString = ""
        if (checkAhkModSymbol("+")){
            returnString = returnString + "Shift+"
        }
        if (checkAhkModSymbol("^")){
            returnString = returnString + "Ctrl+"
        }
        if (checkAhkModSymbol("!")){
            returnString = returnString + "Alt+"
        }
        returnString = returnString + keyObj.displayKey
        // console.log(returnString)
        return returnString
    }
    return {
        isShift:checkAhkModSymbol("+"),                        
        isCtrl:checkAhkModSymbol("^"),                        
        isAlt:checkAhkModSymbol("!"),
        keyCode:keyObj.keyCode,
        displayKey:processKeyEventToFullString(),
        displayKeyNoMods:keyObj.displayKey,
        ahkKey:AhkString
    }
}

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


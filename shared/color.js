"use strict";

function componentToHex(c) {
  const hex = Number(c).toString(16);
  return hex.length === 1 ? "0" + hex : hex;
}

function rgbToHex(rgbArray) {
  let returnString = "#";
  rgbArray.forEach(function (component, index) {
    if (index < 3) {
      returnString += componentToHex(component);
    }
  });
  return returnString;
}

function hexToRgb(hex) {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result
    ? [
        parseInt(result[1], 16),
        parseInt(result[2], 16),
        parseInt(result[3], 16),
        255,
      ]
    : null;
}

function rgbLightness(rgbArray) {
  return (
    0.299 * (rgbArray[0] / 255) +
    0.587 * (rgbArray[1] / 255) +
    0.114 * (rgbArray[2] / 255)
  );
}

module.exports = {
  componentToHex,
  rgbToHex,
  hexToRgb,
  rgbLightness,
};

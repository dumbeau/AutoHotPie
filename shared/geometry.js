"use strict";

function calcAngle(aX, aY, bX, bY) {
  const initVal = (Math.atan2(bY - aY, bX - aX) * 180) / Math.PI;
  return initVal < 0 ? initVal + 360 : initVal;
}

function cycleRange(num, range = 360) {
  return num - range * Math.floor(num / range);
}

function extendAlongAngle(iPos, theta, distance) {
  const fPosX = Math.round(
    iPos[0] + distance * Math.cos(((theta - 90) * Math.PI) / 180)
  );
  const fPosY = Math.round(
    iPos[1] + distance * Math.sin(((theta - 90) * Math.PI) / 180)
  );
  return [fPosX, fPosY];
}

function degreesToRadians(numDegrees) {
  return (numDegrees * Math.PI) / 180;
}

module.exports = {
  calcAngle,
  cycleRange,
  extendAlongAngle,
  degreesToRadians,
};

"use strict";

function deepMerge(target, source) {
  if (source == null) {
    return target;
  }
  Object.entries(source).forEach(([key, value]) => {
    if (value && typeof value === "object" && !Array.isArray(value)) {
      deepMerge((target[key] = target[key] || {}), value);
      return;
    }
    target[key] = value;
  });
  return target;
}

module.exports = { deepMerge };

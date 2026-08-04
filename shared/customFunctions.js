"use strict";

/**
 * Pure helpers for custom-function persistence.
 * Browser pages use the mirrored API on globalThis.AHPDomain (src/domain/customFunctions.js).
 */

function normalizeCustomFunctions(list, mapFn) {
  if (!Array.isArray(list)) {
    return [];
  }
  if (typeof mapFn !== "function") {
    return list.slice();
  }
  return list.map((item) => mapFn(item));
}

function upsertCustomFunction(list, nextFn, idKey = "id") {
  const items = Array.isArray(list) ? list.slice() : [];
  if (!nextFn || nextFn[idKey] == null) {
    items.push(nextFn);
    return items;
  }
  const index = items.findIndex((item) => item && item[idKey] === nextFn[idKey]);
  if (index >= 0) {
    items[index] = nextFn;
  } else {
    items.push(nextFn);
  }
  return items;
}

module.exports = {
  normalizeCustomFunctions,
  upsertCustomFunction,
};

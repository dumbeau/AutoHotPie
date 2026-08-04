/**
 * Browser-facing domain API for custom functions.
 * Keep behavior aligned with shared/customFunctions.js (covered by Vitest).
 */
(function (root) {
  "use strict";

  function normalizeCustomFunctions(list, mapFn) {
    if (!Array.isArray(list)) {
      return [];
    }
    if (typeof mapFn !== "function") {
      return list.slice();
    }
    return list.map(function (item) {
      return mapFn(item);
    });
  }

  function upsertCustomFunction(list, nextFn, idKey) {
    idKey = idKey || "id";
    var items = Array.isArray(list) ? list.slice() : [];
    if (!nextFn || nextFn[idKey] == null) {
      items.push(nextFn);
      return items;
    }
    var index = -1;
    for (var i = 0; i < items.length; i++) {
      if (items[i] && items[i][idKey] === nextFn[idKey]) {
        index = i;
        break;
      }
    }
    if (index >= 0) {
      items[index] = nextFn;
    } else {
      items.push(nextFn);
    }
    return items;
  }

  root.AHPDomain = root.AHPDomain || {};
  root.AHPDomain.normalizeCustomFunctions = normalizeCustomFunctions;
  root.AHPDomain.upsertCustomFunction = upsertCustomFunction;
})(typeof globalThis !== "undefined" ? globalThis : this);

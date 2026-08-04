"use strict";

const path = require("path");
const fs = require("fs");

/**
 * Resolve PieMenu runtime paths for both `electron .` (repo root) and packaged installs.
 * Packaged layout copies src to resources/src next to the app.
 */
function resolvePieMenuPaths(appPath, isPackaged) {
  const candidates = [];

  if (isPackaged) {
    candidates.push(path.join(path.dirname(appPath), "resources", "src"));
    candidates.push(path.join(appPath, "..", "src"));
    candidates.push(path.join(appPath, "src"));
  } else {
    candidates.push(path.join(appPath, "src"));
    candidates.push(path.join(appPath, "..", "src"));
  }

  for (const dir of candidates) {
    const ahk = path.join(dir, "PieMenu.ahk");
    if (fs.existsSync(ahk)) {
      return {
        pieMenuFolder: dir,
        pieMenuAhk: ahk,
        pieMenuExe: path.join(dir, "PieMenu.exe"),
      };
    }
  }

  const fallback = path.join(appPath, "src");
  return {
    pieMenuFolder: fallback,
    pieMenuAhk: path.join(fallback, "PieMenu.ahk"),
    pieMenuExe: path.join(fallback, "PieMenu.exe"),
  };
}

function getUserDataFolder(app, env = process.env) {
  if (env.AHP_USER_DATA && env.AHP_USER_DATA.trim()) {
    return path.resolve(env.AHP_USER_DATA);
  }
  return app.getPath("userData");
}

module.exports = {
  resolvePieMenuPaths,
  getUserDataFolder,
};

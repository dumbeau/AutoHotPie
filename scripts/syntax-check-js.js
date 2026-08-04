#!/usr/bin/env node
"use strict";

const { execFileSync } = require("child_process");
const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const skipDir = new Set(["node_modules", "dist", "assets", ".git"]);
const skipFile = new Set(["jscolor.js"]);

function walk(dir, out = []) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name.startsWith(".")) continue;
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (!skipDir.has(entry.name)) walk(full, out);
      continue;
    }
    if (
      entry.isFile() &&
      entry.name.endsWith(".js") &&
      !skipFile.has(entry.name) &&
      !entry.name.endsWith(".min.js")
    ) {
      out.push(full);
    }
  }
  return out;
}

const files = walk(root);
for (const file of files) {
  execFileSync(process.execPath, ["--check", file], { stdio: "inherit" });
}
console.log(`Syntax-checked ${files.length} JavaScript files.`);

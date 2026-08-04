#!/usr/bin/env node
"use strict";

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const pkg = JSON.parse(fs.readFileSync(path.join(root, "package.json"), "utf8"));
const lock = JSON.parse(fs.readFileSync(path.join(root, "package-lock.json"), "utf8"));

const failures = [];

if (lock.name !== pkg.name) {
  failures.push(`lock name "${lock.name}" != package name "${pkg.name}"`);
}
if (lock.version !== pkg.version) {
  failures.push(`lock version "${lock.version}" != package version "${pkg.version}"`);
}
if (!lock.packages || !lock.packages[""]) {
  failures.push("package-lock.json missing packages[''] root entry");
} else {
  const rootPkg = lock.packages[""];
  if (rootPkg.name !== pkg.name) {
    failures.push(`packages[''].name "${rootPkg.name}" != package name "${pkg.name}"`);
  }
  if (rootPkg.version !== pkg.version) {
    failures.push(`packages[''].version "${rootPkg.version}" != package version "${pkg.version}"`);
  }
}

if (failures.length) {
  console.error("Lockfile verification failed:");
  for (const failure of failures) {
    console.error(`  - ${failure}`);
  }
  process.exit(1);
}

console.log(`Lockfile OK: ${pkg.name}@${pkg.version}`);

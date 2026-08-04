"use strict";

const { defineConfig } = require("@playwright/test");
const path = require("path");

module.exports = defineConfig({
  testDir: path.join(__dirname, "tests/e2e"),
  timeout: 120000,
  fullyParallel: false,
  workers: 1,
  reporter: "list",
  projects: [
    {
      name: "electron-smoke",
      testMatch: "**/*.spec.js",
    },
  ],
});

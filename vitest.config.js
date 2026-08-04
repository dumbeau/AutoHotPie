"use strict";

const { defineConfig } = require("vitest/config");
const path = require("path");

module.exports = defineConfig({
  test: {
    environment: "node",
    include: ["tests/unit/**/*.test.js"],
    exclude: ["tests/e2e/**", "node_modules/**"],
  },
  resolve: {
    alias: {
      "@shared": path.resolve(__dirname, "shared"),
    },
  },
});

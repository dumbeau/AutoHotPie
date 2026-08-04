import { describe, expect, it } from "vitest";
const {
  buildIncludeString,
  applyScriptBlock,
  toHtmlScriptPaths,
} = require("../../build/refreshIndexScripts");

describe("refreshIndexScripts", () => {
  it("builds script tags for relative paths", () => {
    expect(buildIncludeString(["lib/renderer.js", "initializePages.js"])).toBe(
      '<script src="./lib/renderer.js"></script>\n<script src="./initializePages.js"></script>\n'
    );
  });

  it("normalizes windows paths under src/", () => {
    expect(toHtmlScriptPaths(["src\\lib\\renderer.js", "src\\preload.js"])).toEqual([
      "lib/renderer.js",
    ]);
  });

  it("replaces the compile marker block", () => {
    const html =
      "head\n<!-- UPDATED ON COMPILE -->\nold\n<!-- END OF UPDATED ON COMPILE -->\ntail";
    const next = applyScriptBlock(html, '<script src="./a.js"></script>\n');
    expect(next).toContain('<!-- UPDATED ON COMPILE -->\n<script src="./a.js"></script>\n<!-- END OF UPDATED ON COMPILE -->');
    expect(next).toContain("tail");
  });
});

// Renderer boot side-effects extracted from lib/renderer.js over time.
// Keep initializePages.js as the page-controller entry until the bundler lands.

(function bootRendererSideEffects() {
  if (typeof document === "undefined") {
    return;
  }
  try {
    document.getElementsByName("hidden-tab-items").forEach(function (tabs) {
      tabs.style.display = "none";
    });
  } catch (err) {
    console.warn("Unable to hide tab items during boot", err);
  }
})();

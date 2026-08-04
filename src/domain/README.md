# Domain modules

Pure settings/domain logic lives here as the editor is modularized.

Current source of truth for classes remains [`../classes/ahpClasses.js`](../classes/ahpClasses.js).
Shared Node-testable helpers live in [`../../shared/`](../../shared/).

Migration order:

1. Keep `ahpClasses.js` API stable for pages
2. Move pure helpers into `shared/` (done for color/geometry/deepMerge/schema)
3. Split model constructors into this folder behind compatibility exports
4. Delete ambient globals only after all pages import explicitly

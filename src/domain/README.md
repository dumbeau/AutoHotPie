# Domain modules

Pure settings/domain logic lives here as the editor is modularized.

| Layer | Location |
|-------|----------|
| Node-testable helpers | [`../../shared/`](../../shared/) |
| Browser globals (`AHPDomain`) | this folder (loaded by `refreshIndexScripts`) |
| Legacy class API | [`../classes/ahpClasses.js`](../classes/ahpClasses.js) |

## Migration order

1. Keep `ahpClasses.js` API stable for pages
2. Move pure helpers into `shared/` and mirror on `AHPDomain` (custom functions done)
3. Split model constructors into this folder behind compatibility exports
4. Replace script-order injection with one bundled renderer entry
5. Delete ambient globals only after all pages import explicitly

Do not add load-time I/O or new implicit globals outside `AHPDomain` / existing page controllers.

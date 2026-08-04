# AutoHotPie architecture

AutoHotPie is a dual-runtime Windows application:

| Process | Entry | Responsibility |
|---------|-------|----------------|
| Electron editor | `main.js` → `src/index.html` | Profile/menu configuration UI |
| AHK runtime | `src/PieMenu.ahk` / `PieMenu.exe` | Hotkeys, overlay, actions |

They communicate only through `AHPSettings.json` (plus icons/user scripts on disk).

## Settings contract

- Schema: [`schema/AHPSettings.schema.json`](../schema/AHPSettings.schema.json)
- Version field: `schemaVersion` (current: `1`)
- Fixtures: [`tests/fixtures/settings/`](../tests/fixtures/settings/)

## Trust boundary

Renderer code is untrusted. Privileged filesystem/process work belongs in the Electron main process (`src/main/`). Preload should expose thin wrappers only.

## Modernization stages

See the continuation plan. Work ships as small GitHub PRs with tests at each gate.

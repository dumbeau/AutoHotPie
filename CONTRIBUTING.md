# Contributing to AutoHotPie (combwizard fork)

## Development setup

1. Install [Node.js 20](https://nodejs.org/) (see `.nvmrc`)
2. Install [AutoHotkey v1.1.34.04+](https://www.autohotkey.com/) to the default Program Files location (or update `build/ahk-toolchain.json`)
3. `npm ci`
4. `npm test`
5. `npm start` for the Electron editor

## Delivery rules

- One purpose per commit/PR
- Add or update tests with behavior changes
- Do not mix dependency bumps, refactors, and fixes unless inseparable
- Prefer the PR sequence in `.cursor/rules/github-delivery.mdc`

## Useful scripts

| Script | Purpose |
|--------|---------|
| `npm run verify` | Lockfile + generated `index.html` check |
| `npm test` | Vitest unit tests |
| `npm run test:ahk` | AHK fixture/geometry tests (Windows + AHK installed) |
| `npm run test:e2e` | Playwright Electron smoke |
| `npm run build-ahk` | Compile `PieMenu.exe` |
| `npm run build-installer` | NSIS installer under `dist/` |

## Settings contract

Changes to JSON shape require:

1. Schema update (`schema/AHPSettings.schema.json`)
2. Fixture updates
3. `schemaVersion` bump when breaking

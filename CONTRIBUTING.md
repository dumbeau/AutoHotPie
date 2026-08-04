# Contributing to AutoHotPie (combwizard fork)

## Development setup

1. Install [Node.js 20](https://nodejs.org/) (see `.nvmrc`)
2. Install [AutoHotkey v1.1.34.04+](https://www.autohotkey.com/) **or** run `npm run setup-ahk` for the pinned portable toolchain (`build/ahk-toolchain.json`). Setup caches paths in `build/.ahk-portable.json` so later `npm run build-ahk` / `npm run test:ahk` find the tools without exporting env vars.
3. `npm ci`
4. `npm test`
5. `npm run test:ahk` (portable cache, `AHK_V1_PATH`, or a system install)
6. `npm start` for the Electron editor

### Required CI gate: AHK compile

Pull requests must keep the **AHK compile** job green. That job:

1. Installs the pinned portable AHK v1 via `scripts/setup-ahk-v1.ps1`
2. Smoke-compiles `tests/fixtures/ahk/compile-smoke.ahk`
3. Runs `npm run test:ahk`
4. Compiles `src/PieMenu.ahk` → `src/PieMenu.exe` and uploads the exe + SHA-256

Do not mark AHK compile as optional. Packaging (`Package unpacked`) is a separate gate and may still fail independently of AHK.

## Delivery rules

- One purpose per commit/PR
- Add or update tests with behavior changes
- Do not mix dependency bumps, refactors, and fixes unless inseparable
- Prefer the PR sequence in `.cursor/rules/github-delivery.mdc`
- Triage guidance: [docs/backlog-triage.md](docs/backlog-triage.md)
- Active stack: [docs/pr-stack.md](docs/pr-stack.md)

## Useful scripts

| Script | Purpose |
|--------|---------|
| `npm run verify` | Lockfile + generated `index.html` check |
| `npm test` | Vitest unit tests |
| `npm run setup-ahk` | Download pinned portable AHK v1 (sets `AHK_*` env in CI) |
| `npm run test:ahk` | AHK fixture/geometry tests (Windows + `AHK_V1_PATH` or system AHK) |
| `npm run test:e2e` | Playwright Electron smoke |
| `npm run build-ahk` | Compile `PieMenu.exe` (quoted Ahk2Exe invocation + PE/SHA-256 checks) |
| `npm run build-installer` | NSIS installer under `dist/` |

## Settings contract

Changes to JSON shape require:

1. Schema update (`schema/AHPSettings.schema.json`)
2. Fixture updates
3. `schemaVersion` bump when breaking

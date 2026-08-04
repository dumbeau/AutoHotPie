# AutoHotPie (combwizard fork)

Radial menus for Windows — pie menus for digital artists, tablet users, and macro enthusiasts.

![AutoHotPie demo](https://user-images.githubusercontent.com/36665762/155584629-fd483863-2005-420f-ab3e-44369fe01884.gif)

## About this fork

This repository is a **continuation fork** of the original [AutoHotPie](https://github.com/dumbeau/AutoHotPie) project. Upstream development has slowed; this fork keeps the app maintainable and shippable on modern Windows toolchains.

Goals of this fork:

- Keep AutoHotPie usable with current Node/Electron and AutoHotkey tooling
- Add tests, CI, and a stable settings schema so changes are safer to review
- Harden the Electron editor (preload/IPC boundaries) without changing the file-based contract with the AHK runtime
- Modernize the runtime path incrementally (including AHK v2 work) behind fixtures

Releases and issues for this fork: [combwizard/AutoHotPie](https://github.com/combwizard/AutoHotPie).

## Credits

**AutoHotPie was created by [Beau Gilles](https://github.com/dumbeau)** ([dumbeau/AutoHotPie](https://github.com/dumbeau/AutoHotPie)).

This fork exists because of that work. Design, UX, and the core pie-menu idea are Beau’s. Changes here are maintenance and modernization on top of the original MIT-licensed codebase.

- Original repo: [github.com/dumbeau/AutoHotPie](https://github.com/dumbeau/AutoHotPie)
- Author site: [www.dumbeau.com](https://www.dumbeau.com)
- Community Discord (upstream): [AutoHotPie](https://discord.gg/yszsupzR7d)

Copyright © 2020 Beau Gilles. See [license.txt](license.txt).

## Installation

Go to [releases](https://github.com/combwizard/AutoHotPie/releases), download the latest version, and run the installer. Expect bugs; use at your own risk.

## General usage

### Macro mice

Some macro mice do not send key-up events on release (Logitech MX Master, Elecom mice). Use hover or click modes, or bind Back (4th click) / Forward (5th click), which usually do report release. For more menus, set one of those as the Profile Enable Key and use bare keys for pie menus as a macro layer.

### Pen tablets

To activate a pie menu with a pen button, map the pen software to send 4th click / Forward or 5th click / Back. Other keys may not send a key-up on release. Then set the pie menu key to that special key in AutoHotPie.

### External controllers or remotes

Most Bluetooth controllers can map buttons to keystrokes, but many never send key-up. Use the **Hover over all selections** launch mode so the menu stays open after the press and selections are made by hover.

## Develop with this codebase

### Prerequisites

- **Node.js 20** (see `.nvmrc`; `engines` allows Node 20–24)
- **npm** (ships with Node)
- **AutoHotkey v1.1.34.04+** with Ahk2Exe for compiling `PieMenu.exe`
- Windows 10/11 x64

### Setup

```bash
npm ci
npm run verify
npm test
npm start
```

### Scripts

| Command | Purpose |
|---------|---------|
| `npm start` | Refresh index scripts and launch Electron |
| `npm test` | Unit tests (Vitest) |
| `npm run test:e2e` | Electron smoke tests (Playwright) |
| `npm run test:ahk` | AHK geometry/fixture tests |
| `npm run build-ahk` | Compile `src/PieMenu.exe` via `scripts/build-ahk.ps1` |
| `npm run build-installer` | Build NSIS installer into `dist/` |
| `npm run verify` | Lockfile + generated `index.html` check |

See [CONTRIBUTING.md](CONTRIBUTING.md), [docs/architecture.md](docs/architecture.md), and the [continuation plan](docs/continuation-plan.md) for modernization stages and issue-informed workstreams.

### Modifying the HTML/CSS

The HTML/CSS is supplied by [Bootstrap Studio](https://bootstrapstudio.io/).

1. Open `src/AutoHotPie Settings.bsdesign`
2. Go to `Settings > Export`, and set the export destination to the `/src` directory
3. Save and click `Export` or press `Ctrl+E`
4. Run `npm run build` to refresh renderer script tags in `index.html`

### VS Code

Use the included launch configurations for the Electron app or `PieMenu.ahk`.

## Questions?

- Fork issues: [combwizard/AutoHotPie](https://github.com/combwizard/AutoHotPie/issues)
- Upstream Discord: [AutoHotPie](https://discord.gg/yszsupzR7d)

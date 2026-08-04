# Continuation plan

Canonical modernization roadmap for the combwizard fork. Contributor delivery rules live in [`.cursor/rules/github-delivery.mdc`](../.cursor/rules/github-delivery.mdc); this document is the repository-visible plan and the place where upstream evidence is mapped to stages.

Related docs: [architecture.md](architecture.md), [backlog-triage.md](backlog-triage.md), [pr-stack.md](pr-stack.md), [manual-regression.md](manual-regression.md), [hardware-matrix.md](hardware-matrix.md), [releases.md](releases.md).

## Intake rule

Upstream reports on [dumbeau/AutoHotPie](https://github.com/dumbeau/AutoHotPie/issues) are **evidence**, not a commit queue.

- Reproduce on a clean checkout (`npm ci`, fixtures where possible).
- Defects require a regression fixture or a sketched `needs-fixture` case before implementation.
- One independently reviewable outcome per PR; rebase onto the merged predecessor.
- Prefer filesystem / `AHPSettings.json` changes over inventing a live editor↔runtime IPC bridge.

## Foundation sequence (stages 1–11)

Matches the preferred sequence in `.cursor/rules/github-delivery.mdc`. Stages 1–5 and much of 6–11 are already represented by the merged stack in [pr-stack.md](pr-stack.md).

| Stage | Focus | Gate |
|-------|--------|------|
| 1 | Build metadata / toolchain | Installable Node 20 + AHK compile path |
| 2 | CI skeleton | `unit`, required AHK compile, electron-smoke |
| 3 | Pure test seams | Vitest + AHK geometry/fixture harness |
| 4 | Settings schema + fixtures | `schema/AHPSettings.schema.json`, `tests/fixtures/settings/` |
| 5 | Electron smoke harness | Playwright launch + settings persistence |
| 6 | Correctness fixes (one area per PR) | Fixture first, then fix |
| 7 | Renderer injection hardening | CSP / untrusted renderer |
| 8 | IPC hardening by capability group | Main-process privilege boundary |
| 9 | Editor module extraction | Domain helpers without behavior change |
| 10 | Runtime reliability | Hotkeys, modes, DPI, lifecycle — see below |
| 11 | AHK v2 subsystem ports | Side-by-side until parity fixtures pass |

## Issue-informed workstreams (after foundation)

These are the next correctness / reliability slices. Ship each as its own PR (or small linear stack). Do not mix with unrelated refactors or dependency bumps.

### A. Hotkey / modifier fixtures and fixes — P0

| | |
|---|---|
| Upstream | [#177](https://github.com/dumbeau/AutoHotPie/issues/177) sticky modifiers / random Ctrl; [#161](https://github.com/dumbeau/AutoHotPie/issues/161) non-QWERTY Send Key |
| Boundary | Shared settings contract + editor capture + AHK send path (`src/lib/PieFunctions.ahk`, hotkey helpers) |
| Fixtures / tests | `tests/fixtures/settings/` (modifier chords, non-QWERTY samples); `tests/unit/` hotkey conversion; optional `tests/ahk/` send-path checks |
| Acceptance | Manual matrix rows for modifier cleanup + non-QWERTY send; unit/schema tests green |
| Migration | None unless encoding shape changes — then bump `schemaVersion` per [CONTRIBUTING.md](../CONTRIBUTING.md) |
| Delivery stage | 4 + 6 |

### B. Fail-safe input cleanup and activation modes — P0 / P1

| | |
|---|---|
| Upstream | [#38](https://github.com/dumbeau/AutoHotPie/issues/38) left click blocked; [#182](https://github.com/dumbeau/AutoHotPie/issues/182) AE lockup; [#178](https://github.com/dumbeau/AutoHotPie/issues/178) toggle mode; [#160](https://github.com/dumbeau/AutoHotPie/issues/160) / [#163](https://github.com/dumbeau/AutoHotPie/issues/163) weak key-up devices |
| Boundary | Runtime-only (`src/PieMenu.ahk`, `src/lib/BGFunks.ahk`) |
| Fixtures / tests | Activation-mode fixtures (`submenuMode` 1–4); AHK input-cleanup harness under `tests/ahk/`; extend [manual-regression.md](manual-regression.md) Lifecycle / Activation modes |
| Acceptance | ESC, cancel, and focus change restore LMB / XButtons / modifiers; toggle survives repeated cycles; mode 3 documented for weak key-up hardware |
| Migration | None expected |
| Delivery stage | 10 |

### C. Startup lifecycle and single-instance replacement — P0

| | |
|---|---|
| Upstream | [#179](https://github.com/dumbeau/AutoHotPie/issues/179) Run on Startup inconsistent |
| Boundary | Electron main/preload launch path + runtime boot |
| Fixtures / tests | Unit tests for packaged vs dev PieMenu path resolution; fixture with `runOnStartup` variants; [manual-regression.md](manual-regression.md) Lifecycle + [hardware-matrix.md](hardware-matrix.md) startup row |
| Acceptance | Enable / disable / reboot behave deterministically; Save and Run replaces the previous PieMenu instance |
| Migration | None unless login-item path encoding changes |
| Delivery stage | 10 |

### D. GDI+ resource lifecycle — P1

| | |
|---|---|
| Upstream | [#40](https://github.com/dumbeau/AutoHotPie/issues/40) memory leak; [#164](https://github.com/dumbeau/AutoHotPie/issues/164) custom icons invisible; [#115](https://github.com/dumbeau/AutoHotPie/issues/115) screenshare white box |
| Boundary | Runtime overlay (`src/lib/GdipHelper.ahk`, draw path in `BGFunks.ahk`) |
| Fixtures / tests | AHK open/close cycle harness under `tests/ahk/`; manual icon + screenshare rows |
| Acceptance | Repeated menu open/close does not grow handles unboundedly; custom icons remain visible; no leftover overlay surface after cancel |
| Migration | None |
| Delivery stage | 10 — **required before** deep AHK v2 graphics port (stage 11) |

### E. Send Text as a settings-backed action — P2

| | |
|---|---|
| Upstream | [#116](https://github.com/dumbeau/AutoHotPie/issues/116) Send Text; [#181](https://github.com/dumbeau/AutoHotPie/issues/181) typed aliases; [#162](https://github.com/dumbeau/AutoHotPie/issues/162) multi-key sequences |
| Boundary | Settings contract + editor function catalog + existing runtime `pie_sendText` |
| Fixtures / tests | `tests/fixtures/settings/single-pie-sendtext.json` (or equivalent); schema params for `sendText`; unit defaults test |
| Acceptance | Editor can author Send Text; runtime types text via `AHPSettings.json` only — **no new live IPC** |
| Migration | Additive function type; bump `schemaVersion` only if defaults/shape break existing menus |
| Delivery stage | 4 + 6 |

### F. AHK v2 subsystem ports — continue after parity

| | |
|---|---|
| Prerequisite | Fixtures covering A–E behaviors that the ported subsystem touches |
| Boundary | Side-by-side under `src/v2/` until parity gates pass; v1 remains default |
| Acceptance | Same fixtures load; geometry/hotkey/action parity for the ported slice |
| Migration | Documented in release notes; cutover tag per [releases.md](releases.md) |
| Delivery stage | 11 |

## Explicitly deferred

Do not let these displace correctness / reliability workstreams:

| Topic | Examples | Disposition |
|-------|----------|-------------|
| Support / download | Upstream [#180](https://github.com/dumbeau/AutoHotPie/issues/180) | Point to fork [releases](https://github.com/combwizard/AutoHotPie/releases) |
| UI language | [#176](https://github.com/dumbeau/AutoHotPie/issues/176) | Enhancement backlog; no schema work yet |
| Visual polish | [#149](https://github.com/dumbeau/AutoHotPie/issues/149) drag line | After reliability |
| Niche media controls | [#170](https://github.com/dumbeau/AutoHotPie/issues/170) | Enhancement backlog |
| App-specific “doesn't work” without repro | [#157](https://github.com/dumbeau/AutoHotPie/issues/157), [#168](https://github.com/dumbeau/AutoHotPie/issues/168), [#174](https://github.com/dumbeau/AutoHotPie/issues/174) | Needs repro + elevation/capture diagnosis; track under triage |
| Community scripts | [#172](https://github.com/dumbeau/AutoHotPie/issues/172) | Not product backlog |

## Test locations

| Kind | Path |
|------|------|
| Settings / action fixtures | [`tests/fixtures/settings/`](../tests/fixtures/settings/) |
| JS schema / conversion unit tests | [`tests/unit/`](../tests/unit/) |
| AHK parity / input / GDI harnesses | [`tests/ahk/`](../tests/ahk/) |
| Electron smoke | [`tests/e2e/`](../tests/e2e/) |

Settings-shape changes always follow [CONTRIBUTING.md](../CONTRIBUTING.md): schema update → fixtures → `schemaVersion` bump when breaking.

## Suggested PR order

After the merged stack in [pr-stack.md](pr-stack.md):

1. **A** — hotkey/modifier fixtures (+ fix PR if failing)
2. **B** — input unblock + activation-mode correctness
3. **C** — startup / Save-and-Run single instance
4. **D** — GDI+ dispose / icon lifetime
5. **E** — Send Text settings action (when prioritized)
6. **F** — continue AHK v2 ports behind the new fixtures

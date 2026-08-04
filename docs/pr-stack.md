# Current PR stack

Merged modernization sequence:

1. [#1 foundation baseline](https://github.com/combwizard/AutoHotPie/pull/1) — toolchain, CI, settings contract tests
2. [#7 IPC harden](https://github.com/combwizard/AutoHotPie/pull/7) — Electron trust boundary + settings defect fixes (replaced auto-closed #2)
3. [#8 runtime reliability](https://github.com/combwizard/AutoHotPie/pull/8) — DPI, standalone flag, diagnostics
4. [#9 editor modules](https://github.com/combwizard/AutoHotPie/pull/9) — `AHPDomain` custom-function helpers
5. [#10 AHK v2 stubs](https://github.com/combwizard/AutoHotPie/pull/10) — side-by-side v2 geometry/settings stubs
6. This docs PR — triage + release ownership for the fork

After each merge, rebase the next branch onto the updated predecessor.

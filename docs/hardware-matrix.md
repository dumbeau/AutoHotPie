# Hardware / environment matrix

Fill results when exercising release candidates. Prefer attaching diagnostics logs (no user script bodies). All rows below are **Manual** until a stable automated seam exists; do not treat an empty Status cell as a pass.

Issue-informed scenarios map to workstreams in [continuation-plan.md](continuation-plan.md).

| Scenario | Status | Notes |
|----------|--------|-------|
| Mouse + keyboard, single monitor 100% | Manual | Baseline |
| Pen tablet side button → XButton1/2 | Manual | Prefer mode 3 if no key-up |
| Dual monitor mixed DPI | Manual | |
| Startup after reboot | Manual | Enable and disable Run on Startup |
| Suspend/resume | Manual | |
| Packaged NSIS install | Manual + CI unpacked | |
| Portable JSON-next-to-script | Manual | Standalone detection |
| Non-QWERTY keyboard (e.g. AZERTY) | Manual | Send Key / pie key capture must match physical key, not QWERTY label |
| Bluetooth / weak key-up controller | Manual | Prefer activation mode 3; confirm press and release behavior |
| Macro mouse without key-up (MX Master, Elecom) | Manual | Hover/click modes or XButtons; see README |
| App focus switching (creative app ↔ other) | Manual | Pies remain selectable; no stuck LMB after cancel |
| Screenshare / remote session (Slack share, Parsec, etc.) | Manual | No leftover overlay / white box; remote may not deliver hotkeys |

# Runtime reliability notes

## DPI awareness

`PieMenu.ahk` and `MonitorManager` both use **Per-Monitor DPI Aware v2** (`DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2` = `-4`).

Thread and process contexts must stay aligned; mismatched modes cause off-screen menus on mixed-DPI setups.

## Standalone / portable mode

When `AHPSettings.json` is found next to the script, `IsStandAlone` is set so settings resolve from the script directory instead of `%LOCALAPPDATA%`.

## Diagnostics

`src/lib/diagnostics.ahk` provides `AHP_DiagInit` / `AHP_Diag`.

- Enabled when `DebugMode` is true
- Optional log file: `%TEMP%\AutoHotPie-diag.log`
- Does not capture user script bodies by default

## Manual matrix

See [hardware-matrix.md](hardware-matrix.md) and [manual-regression.md](manual-regression.md).

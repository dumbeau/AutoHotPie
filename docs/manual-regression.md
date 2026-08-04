# Manual regression matrix

Run before releases. Automate stable rows over time. Issue-informed rows map to workstreams in [continuation-plan.md](continuation-plan.md). Until a row has an automated seam, treat status as **Manual** only — do not imply CI coverage.

## Activation modes

| Mode | Description | Keyboard | Mouse | XButton1/2 (pen) |
|------|-------------|----------|-------|------------------|
| 1 | Hold / release to select | | | |
| 2 | Release first, hover next | | | |
| 3 | Hover-all (weak key-up devices) | | | |
| 4 | Click to select | | | |

- [ ] Toggle activation survives repeated on/off cycles (menu opens, closes, opens again on the same key)
- [ ] Mode 3 remains usable on devices that never send key-up (pen / BT controller / macro mouse)

## Profiles and focus

- [ ] Default profile when foreground app is unlisted
- [ ] App profile matches by exe name
- [ ] Multi-exe profile matches each listed handle
- [ ] Custom context function profile precedence
- [ ] Switching foreground apps (e.g. creative app ↔ browser ↔ creative app) leaves pies selectable without restart

## Display

- [ ] Menu opens on correct monitor under pointer
- [ ] Mixed DPI (100% / 150%) label/icon scale
- [ ] Submenu near monitor edge stays on-screen
- [ ] Display cable unplug/replug recovers
- [ ] Custom user icons remain visible across repeated menu opens (not only in the editor preview)

## Input cleanup

- [ ] ESC / cancel restores LMB after a pie session (no stuck click)
- [ ] ESC / cancel restores XButton1 / XButton2 when those were the pie keys
- [ ] Focus change or unexpected cancel does not leave LMB remapped or blocked
- [ ] Modifier chords (Ctrl / Alt / Shift) used as pie keys or in Send Key do not leave the modifier stuck down after the action

## Lifecycle

- [ ] Save and Run replaces previous PieMenu instance (no duplicate hotkey handlers)
- [ ] Run on startup uses correct PieMenu path when **enabled**
- [ ] Run on startup does **not** launch PieMenu when **disabled**
- [ ] After reboot, enable/disable startup preference matches the last saved setting
- [ ] Import/export settings round-trip
- [ ] Portable package launches AHK with local JSON

# AutoHotkey v2 runtime (side-by-side)

The shipping runtime remains AutoHotkey **v1.1** (`src/PieMenu.ahk`).

This folder holds the incremental v2 port. It must:

- Consume the same `AHPSettings.json` contract (`schemaVersion`)
- Pass the same fixtures under `tests/fixtures/settings`
- Remain non-default until parity gates pass

## Port order

1. `geometry.ahk` / JSON load helpers
2. Profile + hotkey registration
3. Action registry (replace dynamic `%fn%()` dispatch)
4. Input / activation modes
5. GDI+ rendering via a maintained v2-compatible library

## Local checks

```powershell
# v1 suite (shipping runtime)
npm run test:ahk

# v2 geometry only (requires AutoHotkey v2 on PATH as AutoHotkey64.exe or similar)
& "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" tests\ahk\v2\run-geometry-tests.ahk
```

`loadSettings.ahk` resolves portable vs AppData paths but throws `MissingJsonLibraryError` until a v2 JSON decoder is wired. v1 remains the default packaged runtime.

Do not delete or break the v1 entrypoints while this work is incomplete.

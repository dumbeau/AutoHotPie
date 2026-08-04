# Release process

1. Ensure `master` CI is green (`unit`, optional `ahk`, `electron-smoke`).
2. Tag a known-good commit before risky cutovers (`baseline`, `security`, `editor`, `ahk-v2`).
3. Build installer locally or via the `package` CI job:
   - `npm ci`
   - `npm run build-ahk`
   - `npm run build-installer`
4. Attach checksums for `dist/*.exe` artifacts.
5. Publish a GitHub pre-release first; promote to stable after the manual matrix in `docs/manual-regression.md`.
6. Include migration notes when `schemaVersion` or runtime defaults change.

Compatibility matrix fields: Windows version, AHK v1/v2 runtime, Electron app version, settings `schemaVersion`.

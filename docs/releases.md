# Release process

Ownership for this fork: [combwizard/AutoHotPie](https://github.com/combwizard/AutoHotPie).

1. Ensure `master` CI is green (`unit`, optional `ahk`, `electron-smoke`).
2. Tag a known-good commit before risky cutovers (`baseline`, `security`, `editor`, `ahk-v2`).
3. Build installer locally or via the `package` CI job:
   - `npm ci`
   - `npm run build-ahk`
   - `npm run build-installer`
4. Attach checksums for `dist/*.exe` artifacts (`Get-FileHash` SHA256 on Windows).
5. Publish a GitHub **pre-release** first; promote to stable after the manual matrix in `docs/manual-regression.md`.
6. Include migration notes when `schemaVersion` or runtime defaults change.
7. Prefer signed installers when a code-signing certificate is available; until then, publish checksums and the exact git tag SHA.

Compatibility matrix fields: Windows version, AHK v1/v2 runtime, Electron app version, settings `schemaVersion`.

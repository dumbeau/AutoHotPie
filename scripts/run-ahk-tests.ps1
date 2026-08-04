#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$script = Join-Path $repoRoot "tests\ahk\run-tests.ahk"

$candidates = @(
    "$env:ProgramFiles\AutoHotkey\AutoHotkeyU64.exe",
    "$env:ProgramFiles\AutoHotkey\v1.1\AutoHotkeyU64.exe",
    "${env:ProgramFiles(x86)}\AutoHotkey\AutoHotkeyU64.exe"
)

$ahk = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $ahk) {
    Write-Warning "AutoHotkey v1.1 not installed; skipping AHK tests."
    exit 0
}

Write-Host "Running AHK tests with $ahk"
& $ahk /ErrorStdOut $script
exit $LASTEXITCODE

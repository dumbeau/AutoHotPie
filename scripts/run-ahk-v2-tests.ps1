#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$script = Join-Path $repoRoot "tests\ahk\v2\run-geometry-tests.ahk"

$candidates = @(
    "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey64.exe",
    "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey.exe",
    "$env:LocalAppData\Programs\AutoHotkey\v2\AutoHotkey64.exe"
)

$ahk = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $ahk) {
    Write-Warning "AutoHotkey v2 not installed; skipping AHK v2 geometry tests."
    exit 0
}

Write-Host "Running AHK v2 geometry tests with $ahk"
& $ahk $script
exit $LASTEXITCODE

#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$unpacked = Join-Path $repoRoot "dist\win-unpacked"

if (-not (Test-Path $unpacked)) {
    throw "Missing unpacked build at $unpacked. Run: npx electron-builder --dir --win"
}

$checks = @(
    "AutoHotPie.exe",
    "resources\src\PieMenu.ahk",
    "resources\src\lib\BGFunks.ahk",
    "resources\src\lib\PieFunctions.ahk",
    "resources\src\assets\AutoHotPieIcon.ico"
)

$failed = @()
foreach ($relative in $checks) {
    $path = Join-Path $unpacked $relative
    if (-not (Test-Path $path)) {
        $failed += $relative
    }
}

if ($failed.Count) {
    Write-Error "Packaging verification failed. Missing:`n$(($failed | ForEach-Object { "  - $_" }) -join "`n")"
    exit 1
}

Write-Host "Packaging verification OK ($unpacked)"

#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$script = Join-Path $repoRoot "tests\ahk\run-tests.ahk"
$toolchainPath = Join-Path $repoRoot "build\ahk-toolchain.json"
$toolchain = Get-Content $toolchainPath -Raw | ConvertFrom-Json

. (Join-Path $PSScriptRoot "ahk-portable-paths.ps1")
$portable = Get-AhkPortableToolPaths -Toolchain $toolchain -RepoRoot $repoRoot

$candidates = @()
if ($env:AHK_V1_PATH) {
    $candidates += $env:AHK_V1_PATH
}
if ($portable) {
    $candidates += $portable.Interpreter
}
if ($toolchain.interpreterCandidates) {
    $candidates += @($toolchain.interpreterCandidates)
}
$candidates += @(
    "$env:ProgramFiles\AutoHotkey\AutoHotkeyU64.exe",
    "$env:ProgramFiles\AutoHotkey\v1.1\AutoHotkeyU64.exe",
    "${env:ProgramFiles(x86)}\AutoHotkey\AutoHotkeyU64.exe"
)

$ahk = $null
foreach ($candidate in $candidates) {
    if ([string]::IsNullOrWhiteSpace($candidate)) { continue }
    $expanded = [Environment]::ExpandEnvironmentVariables($candidate)
    if (Test-Path -LiteralPath $expanded) {
        $ahk = (Resolve-Path -LiteralPath $expanded).Path
        break
    }
}

if (-not $ahk) {
    Write-Warning "AutoHotkey v1.1 not installed; skipping AHK tests. Set AHK_V1_PATH or run scripts/setup-ahk-v1.ps1."
    exit 0
}

Write-Host "Running AHK tests with $ahk"
& $ahk /ErrorStdOut $script
exit $LASTEXITCODE

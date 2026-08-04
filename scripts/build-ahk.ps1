#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

$toolchainPath = Join-Path $repoRoot "build\ahk-toolchain.json"
if (-not (Test-Path $toolchainPath)) {
    throw "Missing toolchain config: $toolchainPath"
}

$toolchain = Get-Content $toolchainPath -Raw | ConvertFrom-Json

function Expand-EnvPath([string]$PathTemplate) {
    return [Environment]::ExpandEnvironmentVariables($PathTemplate)
}

function Resolve-FirstExisting([string[]]$Candidates, [string]$Label) {
    foreach ($candidate in $Candidates) {
        $expanded = Expand-EnvPath $candidate
        if (Test-Path $expanded) {
            return (Resolve-Path $expanded).Path
        }
    }
    $list = ($Candidates | ForEach-Object { "  - $(Expand-EnvPath $_)" }) -join "`n"
    throw @"
Could not find $Label.
Install AutoHotkey v$($toolchain.ahkVersionMin)+ with Ahk2Exe, or set paths in build\ahk-toolchain.json.

Tried:
$list
"@
}

$ahk2exeCandidates = @()
$binCandidates = @()
if ($env:AHK2EXE_PATH) { $ahk2exeCandidates += $env:AHK2EXE_PATH }
if ($env:AHK_BIN_PATH) { $binCandidates += $env:AHK_BIN_PATH }
$ahk2exeCandidates += $toolchain.ahk2exeCandidates
$binCandidates += $toolchain.binCandidates

$ahk2exe = Resolve-FirstExisting $ahk2exeCandidates "Ahk2Exe.exe"
$bin = Resolve-FirstExisting $binCandidates "Unicode 64-bit.bin"
$inputPath = Join-Path $repoRoot $toolchain.input
$outputPath = Join-Path $repoRoot $toolchain.output
$iconPath = Join-Path $repoRoot $toolchain.icon

foreach ($required in @($inputPath, $iconPath)) {
    if (-not (Test-Path $required)) {
        throw "Required file missing: $required"
    }
}

Write-Host "Compiling AHK with:"
Write-Host "  Ahk2Exe: $ahk2exe"
Write-Host "  Bin:     $bin"
Write-Host "  Input:   $inputPath"
Write-Host "  Output:  $outputPath"

if (Test-Path $outputPath) {
    Remove-Item -Force $outputPath
}

$compile = Start-Process -FilePath $ahk2exe -ArgumentList @(
    "/in", $inputPath,
    "/out", $outputPath,
    "/icon", $iconPath,
    "/bin", $bin,
    "/silent"
) -PassThru -NoNewWindow

if (-not $compile.WaitForExit(120000)) {
    try { $compile.Kill() } catch {}
    throw "Ahk2Exe timed out after 120s"
}

if ($compile.ExitCode -and $compile.ExitCode -ne 0) {
    throw "Ahk2Exe failed with exit code $($compile.ExitCode)"
}

if (-not (Test-Path $outputPath)) {
    throw "Ahk2Exe did not produce output: $outputPath"
}

Write-Host "Built $outputPath"

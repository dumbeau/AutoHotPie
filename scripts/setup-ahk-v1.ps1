#Requires -Version 5.1
<#
.SYNOPSIS
  Download and extract the pinned portable AutoHotkey v1 toolchain.

.DESCRIPTION
  Reads build/ahk-toolchain.json for the release URL and SHA-256.
  Writes AHK2EXE_PATH, AHK_BIN_PATH, and AHK_V1_PATH to GITHUB_ENV when present,
  and prints the same paths for local shells.
#>
param(
    [string]$DestDir = ""
)

$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$toolchainPath = Join-Path $repoRoot "build\ahk-toolchain.json"
if (-not (Test-Path $toolchainPath)) {
    throw "Missing toolchain config: $toolchainPath"
}

$toolchain = Get-Content $toolchainPath -Raw | ConvertFrom-Json
$version = $toolchain.ahkVersionPinned
if (-not $version) {
    throw "build/ahk-toolchain.json missing ahkVersionPinned"
}
if (-not $toolchain.download -or -not $toolchain.download.url -or -not $toolchain.download.sha256) {
    throw "build/ahk-toolchain.json missing download.url / download.sha256"
}

if (-not $DestDir) {
    if ($env:RUNNER_TEMP) {
        $DestDir = Join-Path $env:RUNNER_TEMP "AutoHotkey-$version"
    } else {
        $DestDir = Join-Path $env:TEMP "AutoHotkey-$version"
    }
}

$zip = Join-Path ([System.IO.Path]::GetTempPath()) "AutoHotkey_$version.zip"
$uri = $toolchain.download.url
$expected = $toolchain.download.sha256.ToUpperInvariant()

Write-Host "Downloading AutoHotkey v$version"
Write-Host "  URL:  $uri"
Write-Host "  Dest: $DestDir"

Invoke-WebRequest -Uri $uri -OutFile $zip
$sha = [System.Security.Cryptography.SHA256]::Create()
try {
    $stream = [System.IO.File]::OpenRead($zip)
    try {
        $actual = ([BitConverter]::ToString($sha.ComputeHash($stream)) -replace '-', '').ToUpperInvariant()
    } finally {
        $stream.Dispose()
    }
} finally {
    $sha.Dispose()
}
if ($actual -ne $expected) {
    throw "AHK zip hash mismatch. Expected $expected got $actual"
}

if (Test-Path $DestDir) {
    Remove-Item -Recurse -Force $DestDir
}
Expand-Archive -Path $zip -DestinationPath $DestDir

$ahk2exeRel = $toolchain.portableRelativePaths.ahk2exe
$binRel = $toolchain.portableRelativePaths.bin
$interpRel = $toolchain.portableRelativePaths.interpreter

$ahk2exe = Join-Path $DestDir $ahk2exeRel
$bin = Join-Path $DestDir $binRel
$interpreter = Join-Path $DestDir $interpRel

foreach ($required in @($ahk2exe, $bin, $interpreter)) {
    if (-not (Test-Path $required)) {
        throw "AHK portable zip missing expected file: $required"
    }
}

$ahk2exe = (Resolve-Path $ahk2exe).Path
$bin = (Resolve-Path $bin).Path
$interpreter = (Resolve-Path $interpreter).Path

. (Join-Path $PSScriptRoot "ahk-portable-paths.ps1")
Write-AhkPortableCache -RepoRoot $repoRoot -DestDir $DestDir -Ahk2Exe $ahk2exe -Bin $bin -Interpreter $interpreter

Write-Host "AHK toolchain ready:"
Write-Host "  AHK2EXE_PATH=$ahk2exe"
Write-Host "  AHK_BIN_PATH=$bin"
Write-Host "  AHK_V1_PATH=$interpreter"
Write-Host "  Cache:   $(Join-Path $repoRoot 'build\.ahk-portable.json')"
Write-Host "Local tip: npm run build-ahk will pick up this portable install automatically."

if ($env:GITHUB_ENV) {
    "AHK2EXE_PATH=$ahk2exe" | Out-File -FilePath $env:GITHUB_ENV -Append -Encoding utf8
    "AHK_BIN_PATH=$bin" | Out-File -FilePath $env:GITHUB_ENV -Append -Encoding utf8
    "AHK_V1_PATH=$interpreter" | Out-File -FilePath $env:GITHUB_ENV -Append -Encoding utf8
}

# Also expose for the current process when called from another script in-process.
$env:AHK2EXE_PATH = $ahk2exe
$env:AHK_BIN_PATH = $bin
$env:AHK_V1_PATH = $interpreter

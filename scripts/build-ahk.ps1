#Requires -Version 5.1
<#
.SYNOPSIS
  Compile an AutoHotkey v1 script with Ahk2Exe using pinned/portable toolchain paths.

.PARAMETER InputPath
  Script to compile. Defaults to toolchain.input (src\PieMenu.ahk).

.PARAMETER OutputPath
  Output exe path. Defaults to toolchain.output (src\PieMenu.exe).

.PARAMETER IconPath
  Optional icon. Defaults to toolchain.icon. Pass empty string to omit.

.PARAMETER LogDir
  Directory for captured Ahk2Exe stdout/stderr. Defaults to $env:TEMP\ahp-ahk2exe-logs.
#>
param(
    [string]$InputPath = "",
    [string]$OutputPath = "",
    [string]$IconPath = "",
    [string]$LogDir = "",
    [int]$TimeoutMs = 0
)

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
        if ([string]::IsNullOrWhiteSpace($candidate)) { continue }
        $expanded = Expand-EnvPath $candidate
        if (Test-Path -LiteralPath $expanded) {
            return (Resolve-Path -LiteralPath $expanded).Path
        }
    }
    $list = ($Candidates | ForEach-Object { "  - $(Expand-EnvPath $_)" }) -join "`n"
    throw @"
Could not find $Label.
Install AutoHotkey v$($toolchain.ahkVersionMin)+ with Ahk2Exe, run scripts/setup-ahk-v1.ps1,
or set AHK2EXE_PATH / AHK_BIN_PATH.

Tried:
$list
"@
}

function Quote-WinArg([string]$Value) {
    # Windows process command-line quoting for CreateProcess.
    if ($null -eq $Value) { return '""' }
    if ($Value -notmatch '[\s"]') { return $Value }
    return '"' + ($Value -replace '(\\*)"', '$1$1\"' -replace '(\\+)$', '$1$1') + '"'
}

function Test-PeExecutable([string]$Path) {
    $bytes = [System.IO.File]::ReadAllBytes($Path)
    if ($bytes.Length -lt 64) { return $false }
    if ($bytes[0] -ne 0x4D -or $bytes[1] -ne 0x5A) { return $false } # MZ
    $peOffset = [BitConverter]::ToInt32($bytes, 0x3C)
    if ($peOffset -lt 0 -or ($peOffset + 4) -gt $bytes.Length) { return $false }
    return (
        $bytes[$peOffset] -eq 0x50 -and
        $bytes[$peOffset + 1] -eq 0x45 -and
        $bytes[$peOffset + 2] -eq 0x00 -and
        $bytes[$peOffset + 3] -eq 0x00
    )
}

function Stop-ProcessTree([System.Diagnostics.Process]$Process) {
    if (-not $Process) { return }
    try {
        $processId = $Process.Id
        & taskkill.exe /PID $processId /T /F 2>$null | Out-Null
    } catch {
        try { $Process.Kill() } catch {}
    }
}

. (Join-Path $PSScriptRoot "ahk-portable-paths.ps1")
$portable = Get-AhkPortableToolPaths -Toolchain $toolchain -RepoRoot $repoRoot

$ahk2exeCandidates = @()
$binCandidates = @()
if ($env:AHK2EXE_PATH) { $ahk2exeCandidates += $env:AHK2EXE_PATH }
if ($env:AHK_BIN_PATH) { $binCandidates += $env:AHK_BIN_PATH }
if ($portable) {
    $ahk2exeCandidates += $portable.Ahk2Exe
    $binCandidates += $portable.Bin
}
$ahk2exeCandidates += @($toolchain.ahk2exeCandidates)
$binCandidates += @($toolchain.binCandidates)

$ahk2exe = Resolve-FirstExisting $ahk2exeCandidates "Ahk2Exe.exe"
$bin = Resolve-FirstExisting $binCandidates "Unicode 64-bit.bin / base file"

if (-not $InputPath) { $InputPath = Join-Path $repoRoot $toolchain.input }
elseif (-not [System.IO.Path]::IsPathRooted($InputPath)) { $InputPath = Join-Path $repoRoot $InputPath }

if (-not $OutputPath) { $OutputPath = Join-Path $repoRoot $toolchain.output }
elseif (-not [System.IO.Path]::IsPathRooted($OutputPath)) { $OutputPath = Join-Path $repoRoot $OutputPath }

$useIcon = $true
if ($PSBoundParameters.ContainsKey("IconPath") -and $IconPath -eq "") {
    $useIcon = $false
} elseif (-not $IconPath) {
    $IconPath = Join-Path $repoRoot $toolchain.icon
} elseif (-not [System.IO.Path]::IsPathRooted($IconPath)) {
    $IconPath = Join-Path $repoRoot $IconPath
}

if (-not (Test-Path -LiteralPath $InputPath)) {
    throw "Required input missing: $InputPath"
}
if ($useIcon -and -not (Test-Path -LiteralPath $IconPath)) {
    throw "Required icon missing: $IconPath"
}

if ($TimeoutMs -le 0) {
    if ($toolchain.compileTimeoutMs) {
        $TimeoutMs = [int]$toolchain.compileTimeoutMs
    } else {
        $TimeoutMs = 120000
    }
}

if (-not $LogDir) {
    $LogDir = Join-Path $env:TEMP "ahp-ahk2exe-logs"
}
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$stdoutLog = Join-Path $LogDir "ahk2exe-$stamp.out.log"
$stderrLog = Join-Path $LogDir "ahk2exe-$stamp.err.log"

$compilerDir = Split-Path -Parent $ahk2exe

# Prefer /base (canonical). Pass one quoted Windows command line so paths with
# spaces (e.g. "Unicode 64-bit.bin") survive Start-Process -ArgumentList.
$argParts = @(
    "/in", (Quote-WinArg $InputPath),
    "/out", (Quote-WinArg $OutputPath)
)
if ($useIcon) {
    $argParts += @("/icon", (Quote-WinArg $IconPath))
}
$argParts += @(
    "/base", (Quote-WinArg $bin),
    "/silent", "verbose"
)
$argString = $argParts -join " "

Write-Host "Compiling AHK with:"
Write-Host "  Ahk2Exe: $ahk2exe"
Write-Host "  Base:    $bin"
Write-Host "  Input:   $InputPath"
Write-Host "  Output:  $OutputPath"
if ($useIcon) { Write-Host "  Icon:    $IconPath" }
Write-Host "  WorkDir: $compilerDir"
Write-Host "  Args:    $argString"
Write-Host "  Stdout:  $stdoutLog"
Write-Host "  Stderr:  $stderrLog"

if (Test-Path -LiteralPath $OutputPath) {
    Remove-Item -LiteralPath $OutputPath -Force
}

# Use ProcessStartInfo so the command line is not re-joined by Start-Process -ArgumentList.
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $ahk2exe
$psi.Arguments = $argString
$psi.WorkingDirectory = $compilerDir
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError = $true
$psi.CreateNoWindow = $true

$compile = New-Object System.Diagnostics.Process
$compile.StartInfo = $psi
$stdoutText = ""
$stderrText = ""
$exitCode = $null

try {
    if (-not $compile.Start()) {
        throw "Failed to start Ahk2Exe: $ahk2exe"
    }

    # Read streams asynchronously to avoid stdout/stderr pipe deadlocks.
    $stdoutTask = $compile.StandardOutput.ReadToEndAsync()
    $stderrTask = $compile.StandardError.ReadToEndAsync()

    if (-not $compile.WaitForExit($TimeoutMs)) {
        Stop-ProcessTree $compile
        try { $stdoutText = $stdoutTask.Result } catch {}
        try { $stderrText = $stderrTask.Result } catch {}
        Set-Content -LiteralPath $stdoutLog -Value $stdoutText -Encoding utf8
        Set-Content -LiteralPath $stderrLog -Value $stderrText -Encoding utf8
        Write-Host "---- Ahk2Exe stdout ----"
        Write-Host $stdoutText
        Write-Host "---- Ahk2Exe stderr ----"
        Write-Host $stderrText
        throw "Ahk2Exe timed out after ${TimeoutMs}ms"
    }

    $stdoutText = $stdoutTask.Result
    $stderrText = $stderrTask.Result
    $exitCode = $compile.ExitCode
} finally {
    $compile.Dispose()
}

Set-Content -LiteralPath $stdoutLog -Value $stdoutText -Encoding utf8
Set-Content -LiteralPath $stderrLog -Value $stderrText -Encoding utf8

Write-Host "Ahk2Exe exit code: $exitCode"
Write-Host "---- Ahk2Exe stdout ----"
Write-Host $stdoutText
Write-Host "---- Ahk2Exe stderr ----"
Write-Host $stderrText

if ($null -ne $exitCode -and $exitCode -ne 0) {
    throw "Ahk2Exe failed with exit code $exitCode"
}

if (-not (Test-Path -LiteralPath $OutputPath)) {
    throw "Ahk2Exe did not produce output: $OutputPath"
}

if (-not (Test-PeExecutable $OutputPath)) {
    throw "Output is not a valid PE executable: $OutputPath"
}

function Get-Sha256Hex([string]$Path) {
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $stream = [System.IO.File]::OpenRead($Path)
        try {
            $bytes = $sha.ComputeHash($stream)
        } finally {
            $stream.Dispose()
        }
    } finally {
        $sha.Dispose()
    }
    return ([BitConverter]::ToString($bytes) -replace '-', '').ToUpperInvariant()
}

$hash = Get-Sha256Hex $OutputPath
$size = (Get-Item -LiteralPath $OutputPath).Length
Write-Host "Built $OutputPath"
Write-Host "  Size:   $size bytes"
Write-Host "  SHA256: $hash"

# Write checksum sidecar next to output for CI artifact upload.
$checksumPath = "$OutputPath.sha256"
"$hash  $(Split-Path -Leaf $OutputPath)" | Set-Content -LiteralPath $checksumPath -Encoding ascii
Write-Host "  Checksum file: $checksumPath"

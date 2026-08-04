#Requires -Version 5.1
# Shared helpers for locating the pinned portable AHK v1 install.
# Dot-source from setup / build / test scripts after $repoRoot and $toolchain are set.

function Get-AhkPortableRoot {
    param(
        [Parameter(Mandatory = $true)]$Toolchain,
        [Parameter(Mandatory = $true)][string]$RepoRoot
    )

    $cachePath = Join-Path $RepoRoot "build\.ahk-portable.json"
    if (Test-Path -LiteralPath $cachePath) {
        try {
            $cache = Get-Content -LiteralPath $cachePath -Raw | ConvertFrom-Json
            if ($cache.destDir -and (Test-Path -LiteralPath $cache.destDir)) {
                return $cache.destDir
            }
        } catch {}
    }

    $version = $Toolchain.ahkVersionPinned
    if (-not $version) { return $null }

    $candidates = @()
    if ($env:RUNNER_TEMP) {
        $candidates += (Join-Path $env:RUNNER_TEMP "AutoHotkey-$version")
    }
    if ($env:TEMP) {
        $candidates += (Join-Path $env:TEMP "AutoHotkey-$version")
    }
    $candidates += (Join-Path ([System.IO.Path]::GetTempPath()) "AutoHotkey-$version")

    foreach ($dir in $candidates) {
        if ($dir -and (Test-Path -LiteralPath $dir)) {
            return $dir
        }
    }
    return $null
}

function Get-AhkPortableToolPaths {
    param(
        [Parameter(Mandatory = $true)]$Toolchain,
        [Parameter(Mandatory = $true)][string]$RepoRoot
    )

    $cachePath = Join-Path $RepoRoot "build\.ahk-portable.json"
    if (Test-Path -LiteralPath $cachePath) {
        try {
            $cache = Get-Content -LiteralPath $cachePath -Raw | ConvertFrom-Json
            if ($cache.ahk2exe -and (Test-Path -LiteralPath $cache.ahk2exe) -and
                $cache.bin -and (Test-Path -LiteralPath $cache.bin) -and
                $cache.interpreter -and (Test-Path -LiteralPath $cache.interpreter)) {
                return @{
                    Ahk2Exe = $cache.ahk2exe
                    Bin = $cache.bin
                    Interpreter = $cache.interpreter
                    DestDir = $cache.destDir
                }
            }
        } catch {}
    }

    $root = Get-AhkPortableRoot -Toolchain $Toolchain -RepoRoot $RepoRoot
    if (-not $root) { return $null }

    $ahk2exe = Join-Path $root $Toolchain.portableRelativePaths.ahk2exe
    $bin = Join-Path $root $Toolchain.portableRelativePaths.bin
    $interpreter = Join-Path $root $Toolchain.portableRelativePaths.interpreter
    if (-not ((Test-Path -LiteralPath $ahk2exe) -and (Test-Path -LiteralPath $bin) -and (Test-Path -LiteralPath $interpreter))) {
        return $null
    }

    return @{
        Ahk2Exe = (Resolve-Path -LiteralPath $ahk2exe).Path
        Bin = (Resolve-Path -LiteralPath $bin).Path
        Interpreter = (Resolve-Path -LiteralPath $interpreter).Path
        DestDir = $root
    }
}

function Write-AhkPortableCache {
    param(
        [Parameter(Mandatory = $true)][string]$RepoRoot,
        [Parameter(Mandatory = $true)][string]$DestDir,
        [Parameter(Mandatory = $true)][string]$Ahk2Exe,
        [Parameter(Mandatory = $true)][string]$Bin,
        [Parameter(Mandatory = $true)][string]$Interpreter
    )

    $cachePath = Join-Path $RepoRoot "build\.ahk-portable.json"
    $payload = @{
        destDir = $DestDir
        ahk2exe = $Ahk2Exe
        bin = $Bin
        interpreter = $Interpreter
        updatedAt = (Get-Date).ToString("o")
    } | ConvertTo-Json
    Set-Content -LiteralPath $cachePath -Value $payload -Encoding utf8
}

[CmdletBinding()]
param(
    [string]$DepotTools = "F:\depot_tools",
    [string]$CheckoutRoot = "F:\v8-work",
    [string]$ExpectedCommit = "68a0ee4aa9a2cba8a43cbd1ed1700828adad618f",
    [string]$OutDir = "out\x64.release",
    [switch]$PreflightOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
$RawDir = Join-Path $ProjectRoot "results\raw"
$BuildLog = Join-Path $RawDir "v8_build.txt"
$VsWhere = "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe"
$RequiredVsRange = "[18.0,19.0)"
$RequiredSdkBase = [version]"10.0.28000.0"

function Invoke-CmdChecked {
    param(
        [string]$Command,
        [string]$WorkingDirectory,
        [string]$Description
    )

    Push-Location $WorkingDirectory
    try {
        $Output = @(& $env:ComSpec /d /s /c $Command 2>&1)
        $ExitCode = $LASTEXITCODE
    }
    finally {
        Pop-Location
    }

    $Output | ForEach-Object { Write-Host $_ }
    if ($ExitCode -ne 0) {
        throw "$Description failed with exit code $ExitCode"
    }
    return $Output
}

if (-not (Test-Path -LiteralPath $VsWhere -PathType Leaf)) {
    throw "BLOCKED: vswhere.exe not found"
}

$VsInstallPaths = @(& $VsWhere -latest -products * -version $RequiredVsRange `
    -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
        Microsoft.VisualStudio.Component.VC.ATLMFC `
    -property installationPath)
if ($VsInstallPaths.Count -eq 0) {
    throw "BLOCKED: current V8 Windows documentation requires Visual Studio 2026 (>=18.0) with Desktop C++ and ATL/MFC; no matching instance was found"
}
$VsInstallPath = $VsInstallPaths[0].Trim()

$VcTools = Get-ChildItem -LiteralPath (Join-Path $VsInstallPath "VC\Tools\MSVC") `
    -Directory -ErrorAction Stop | Sort-Object Name -Descending | Select-Object -First 1
$ClPath = Join-Path $VcTools.FullName "bin\Hostx64\x64\cl.exe"
if (-not (Test-Path -LiteralPath $ClPath -PathType Leaf)) {
    throw "BLOCKED: cl.exe not found in the selected Visual Studio instance"
}

$SdkRoot = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows Kits\Installed Roots").KitsRoot10
$SdkVersions = @(Get-ChildItem -LiteralPath (Join-Path $SdkRoot "Include") `
    -Directory -ErrorAction Stop | Where-Object {
        $ParsedVersion = $null
        [version]::TryParse($_.Name, [ref]$ParsedVersion) -and
            $ParsedVersion -ge $RequiredSdkBase
    } | Sort-Object Name -Descending)
if ($SdkVersions.Count -eq 0) {
    throw "BLOCKED: current Chromium Windows documentation requires Windows 11 SDK 10.0.28000.2270; no 10.0.28000.x SDK directory was found"
}
$SdkVersion = $SdkVersions[0].Name

if (-not (Test-Path -LiteralPath $DepotTools -PathType Container)) {
    throw "BLOCKED: depot_tools not found at $DepotTools"
}
foreach ($Tool in @("fetch.bat", "gclient.bat")) {
    if (-not (Test-Path -LiteralPath (Join-Path $DepotTools $Tool) -PathType Leaf)) {
        throw "BLOCKED: $Tool not found in depot_tools"
    }
}

$DepotGitSafePath = $DepotTools -replace '\\', '/'
$DepotRevisionOutput = @(& git -c "safe.directory=$DepotGitSafePath" `
    -C $DepotTools rev-parse HEAD 2>&1)
if ($LASTEXITCODE -ne 0) {
    throw "BLOCKED: unable to read depot_tools revision: $($DepotRevisionOutput -join ' ')"
}
$DepotRevision = ($DepotRevisionOutput | Select-Object -Last 1).Trim()
$CheckoutDrive = [System.IO.DriveInfo]::new([System.IO.Path]::GetPathRoot($CheckoutRoot))
$FreeGiB = [math]::Round($CheckoutDrive.AvailableFreeSpace / 1GB, 2)

Write-Host "Visual Studio=$VsInstallPath"
Write-Host "MSVC=$($VcTools.Name)"
Write-Host "cl=$ClPath"
Write-Host "Windows SDK=$SdkVersion"
Write-Host "depot_tools=$DepotTools"
Write-Host "depot_tools_revision=$DepotRevision"
Write-Host "checkout_drive_free_gib=$FreeGiB"

$VpythonPath = Join-Path $DepotTools ".cipd_bin\vpython3.exe"
if (-not (Test-Path -LiteralPath $VpythonPath -PathType Leaf)) {
    throw "BLOCKED: depot_tools CIPD bootstrap is incomplete; .cipd_bin\vpython3.exe is missing"
}

if ($PreflightOnly) {
    Write-Host "PREFLIGHT_STATUS=PASS"
    exit 0
}

if (-not (Test-Path -LiteralPath $CheckoutRoot)) {
    New-Item -ItemType Directory -Path $CheckoutRoot | Out-Null
}
$CheckoutItems = @(Get-ChildItem -Force -LiteralPath $CheckoutRoot)
$V8Source = Join-Path $CheckoutRoot "v8"
if ($CheckoutItems.Count -ne 0 -and -not (Test-Path -LiteralPath $V8Source -PathType Container)) {
    throw "Checkout root is not empty and does not contain a V8 checkout: $CheckoutRoot"
}

$PreviousPath = $env:Path
$PreviousToolchain = $env:DEPOT_TOOLS_WIN_TOOLCHAIN
$PreviousUpdate = $env:DEPOT_TOOLS_UPDATE
$PreviousConfigCount = $env:GIT_CONFIG_COUNT
$PreviousConfigKey0 = $env:GIT_CONFIG_KEY_0
$PreviousConfigValue0 = $env:GIT_CONFIG_VALUE_0
$PreviousConfigKey1 = $env:GIT_CONFIG_KEY_1
$PreviousConfigValue1 = $env:GIT_CONFIG_VALUE_1

try {
    $env:Path = "$DepotTools;$PreviousPath"
    $env:DEPOT_TOOLS_WIN_TOOLCHAIN = "0"
    $env:DEPOT_TOOLS_UPDATE = "0"
    $env:GIT_CONFIG_COUNT = "2"
    $env:GIT_CONFIG_KEY_0 = "core.longpaths"
    $env:GIT_CONFIG_VALUE_0 = "true"
    $env:GIT_CONFIG_KEY_1 = "core.autocrlf"
    $env:GIT_CONFIG_VALUE_1 = "false"

    $Log = @(
        "V8_WINDOWS_BUILD",
        "started_utc=$([DateTime]::UtcNow.ToString('o'))",
        "expected_commit=$ExpectedCommit",
        "depot_tools_revision=$DepotRevision",
        "visual_studio=$VsInstallPath",
        "msvc_toolset=$($VcTools.Name)",
        "windows_sdk=$SdkVersion",
        "checkout_root=$CheckoutRoot",
        "gn_out_dir=$OutDir"
    )

    if (-not (Test-Path -LiteralPath $V8Source -PathType Container)) {
        $Log += Invoke-CmdChecked `
            -Command "call `"$DepotTools\fetch.bat`" --nohooks v8" `
            -WorkingDirectory $CheckoutRoot `
            -Description "fetch v8"
    }

    $V8GitSafePath = $V8Source -replace '\\', '/'
    $Log += @(& git -c "safe.directory=$V8GitSafePath" `
        -C $V8Source checkout --detach $ExpectedCommit 2>&1)
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to checkout expected V8 commit $ExpectedCommit"
    }

    $Log += Invoke-CmdChecked `
        -Command "call `"$DepotTools\gclient.bat`" sync -D" `
        -WorkingDirectory $CheckoutRoot `
        -Description "gclient sync"

    $ActualCommit = (& git -c "safe.directory=$V8GitSafePath" `
        -C $V8Source rev-parse HEAD).Trim()
    if ($ActualCommit -ne $ExpectedCommit) {
        throw "V8 commit mismatch after sync: $ActualCommit"
    }

    $GnArgs = @(
        'is_debug = false',
        'target_cpu = "x64"',
        'v8_target_cpu = "x64"',
        'is_component_build = false',
        'v8_enable_trace_unoptimized = true',
        'v8_enable_trace_ignition = true',
        'v8_enable_trace_baseline_exec = true'
    )
    $AbsoluteOutDir = Join-Path $V8Source $OutDir
    if (-not (Test-Path -LiteralPath $AbsoluteOutDir)) {
        New-Item -ItemType Directory -Force -Path $AbsoluteOutDir | Out-Null
    }
    $GnArgs | Set-Content -Encoding ASCII -LiteralPath (Join-Path $AbsoluteOutDir "args.gn")

    $Log += Invoke-CmdChecked `
        -Command "call `"$DepotTools\gn.bat`" gen $OutDir" `
        -WorkingDirectory $V8Source `
        -Description "gn gen"
    $Log += Invoke-CmdChecked `
        -Command "call `"$DepotTools\autoninja.bat`" -C $OutDir d8" `
        -WorkingDirectory $V8Source `
        -Description "autoninja d8"

    $D8Path = Join-Path $AbsoluteOutDir "d8.exe"
    if (-not (Test-Path -LiteralPath $D8Path -PathType Leaf)) {
        throw "Build completed without producing d8.exe"
    }

    $ClangPath = Join-Path $V8Source "third_party\llvm-build\Release+Asserts\bin\clang-cl.exe"
    $ClangVersion = if (Test-Path -LiteralPath $ClangPath) {
        (& $ClangPath --version | Select-Object -First 1).Trim()
    } else {
        "UNKNOWN"
    }
    $D8File = Get-Item -LiteralPath $D8Path
    $D8Hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $D8Path).Hash.ToLowerInvariant()
    $Log += @(
        "actual_commit=$ActualCommit",
        "compiler=$ClangPath",
        "compiler_version=$ClangVersion",
        "gn_args=$($GnArgs -join '; ')",
        "build_command=autoninja -C $OutDir d8",
        "d8_size_bytes=$($D8File.Length)",
        "d8_sha256=$D8Hash",
        "BUILD_STATUS=PASS"
    )
    $Log | Set-Content -Encoding UTF8 -LiteralPath $BuildLog

    Write-Host "d8=$D8Path"
    Write-Host "d8_size_bytes=$($D8File.Length)"
    Write-Host "d8_sha256=$D8Hash"
}
finally {
    $env:Path = $PreviousPath
    $env:DEPOT_TOOLS_WIN_TOOLCHAIN = $PreviousToolchain
    $env:DEPOT_TOOLS_UPDATE = $PreviousUpdate
    $env:GIT_CONFIG_COUNT = $PreviousConfigCount
    $env:GIT_CONFIG_KEY_0 = $PreviousConfigKey0
    $env:GIT_CONFIG_VALUE_0 = $PreviousConfigValue0
    $env:GIT_CONFIG_KEY_1 = $PreviousConfigKey1
    $env:GIT_CONFIG_VALUE_1 = $PreviousConfigValue1
}

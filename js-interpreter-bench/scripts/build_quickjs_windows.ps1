[CmdletBinding()]
param(
    [string]$SourceDir = "",
    [string]$BashPath = "",
    [string]$MingwBin = "",
    [ValidateRange(1, 64)]
    [int]$Jobs = 8,
    [switch]$NoClean
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ExpectedCommit = "04be246001599f5995fa2f2d8c91a0f198d3f34c"
$ExpectedVersion = "2026-06-04"
$ProjectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))

function Resolve-ExistingFile {
    param(
        [string]$RequestedPath,
        [string[]]$Candidates,
        [string]$Description
    )

    if (-not [string]::IsNullOrWhiteSpace($RequestedPath)) {
        if (-not (Test-Path -LiteralPath $RequestedPath -PathType Leaf)) {
            throw "$Description not found: $RequestedPath"
        }
        return (Resolve-Path -LiteralPath $RequestedPath).Path
    }

    foreach ($Candidate in $Candidates) {
        if (Test-Path -LiteralPath $Candidate -PathType Leaf) {
            return (Resolve-Path -LiteralPath $Candidate).Path
        }
    }

    throw "$Description not found. Checked: $($Candidates -join ', ')"
}

function Resolve-ExistingDirectory {
    param(
        [string]$RequestedPath,
        [string[]]$Candidates,
        [string]$Description
    )

    if (-not [string]::IsNullOrWhiteSpace($RequestedPath)) {
        if (-not (Test-Path -LiteralPath $RequestedPath -PathType Container)) {
            throw "$Description not found: $RequestedPath"
        }
        return (Resolve-Path -LiteralPath $RequestedPath).Path
    }

    foreach ($Candidate in $Candidates) {
        if (Test-Path -LiteralPath $Candidate -PathType Container) {
            return (Resolve-Path -LiteralPath $Candidate).Path
        }
    }

    throw "$Description not found. Checked: $($Candidates -join ', ')"
}

function Convert-ToMsysPath {
    param([string]$WindowsPath)

    $FullPath = [System.IO.Path]::GetFullPath($WindowsPath)
    $Root = [System.IO.Path]::GetPathRoot($FullPath)
    if ($Root -notmatch '^([A-Za-z]):\\$') {
        throw "Only drive-letter paths are supported by this helper: $FullPath"
    }

    $Drive = $Matches[1].ToLowerInvariant()
    $Remainder = $FullPath.Substring($Root.Length).Replace('\', '/')
    return "/$Drive/$Remainder"
}

if ([string]::IsNullOrWhiteSpace($SourceDir)) {
    $SourceDir = Join-Path $ProjectRoot "engines\quickjs-upstream"
}
$SourcePath = Resolve-ExistingDirectory -RequestedPath $SourceDir -Candidates @() -Description "QuickJS source directory"

$BashPath = Resolve-ExistingFile -RequestedPath $BashPath -Candidates @(
    "C:\msys64\usr\bin\bash.exe",
    "D:\samuel_yun\Git\bin\bash.exe"
) -Description "MSYS2-compatible bash"

$MingwBin = Resolve-ExistingDirectory -RequestedPath $MingwBin -Candidates @(
    "C:\msys64\mingw64\bin",
    "E:\mingw64\bin"
) -Description "MinGW64 bin directory"

$GitPath = (Get-Command git -ErrorAction Stop).Source
$GccPath = Join-Path $MingwBin "gcc.exe"
$MakePath = Join-Path $MingwBin "mingw32-make.exe"
$NmPath = Join-Path $MingwBin "nm.exe"
$ObjdumpPath = Join-Path $MingwBin "objdump.exe"
foreach ($RequiredTool in @($GccPath, $MakePath, $NmPath, $ObjdumpPath)) {
    if (-not (Test-Path -LiteralPath $RequiredTool -PathType Leaf)) {
        throw "Required MinGW64 tool not found: $RequiredTool"
    }
}

$SafeDirectoryPath = $SourcePath.Replace('\', '/')
$SafeDirectory = "safe.directory=$SafeDirectoryPath"
$HeadOutput = @(& $GitPath -c $SafeDirectory -C $SourcePath rev-parse HEAD)
if ($LASTEXITCODE -ne 0 -or $HeadOutput.Count -eq 0) {
    throw "Unable to read the QuickJS commit"
}
$Head = ($HeadOutput | Select-Object -First 1).Trim()
if ($Head -ne $ExpectedCommit) {
    throw "QuickJS commit mismatch. Expected $ExpectedCommit, got $Head"
}

$TrackedStatus = @(& $GitPath -c $SafeDirectory -C $SourcePath status --porcelain --untracked-files=no)
if ($LASTEXITCODE -ne 0) {
    throw "Unable to inspect QuickJS worktree"
}
if ($TrackedStatus.Count -ne 0) {
    throw "Tracked QuickJS source files are modified. Refusing to build: $($TrackedStatus -join '; ')"
}

$Version = (Get-Content -Raw -Encoding UTF8 (Join-Path $SourcePath "VERSION")).Trim()
if ($Version -ne $ExpectedVersion) {
    throw "QuickJS VERSION mismatch. Expected $ExpectedVersion, got $Version"
}

$RemoteOutput = @(& $GitPath -c $SafeDirectory -C $SourcePath remote get-url origin)
if ($LASTEXITCODE -ne 0 -or $RemoteOutput.Count -eq 0) {
    throw "Unable to read the QuickJS origin URL"
}
$Remote = ($RemoteOutput | Select-Object -First 1).Trim()
$CompilerLine = (& $GccPath --version | Select-Object -First 1).Trim()
$CompilerTarget = (& $GccPath -dumpmachine).Trim()
$CompilerVersion = (& $GccPath -dumpfullversion -dumpversion).Trim()

$RawDir = Join-Path $ProjectRoot "results\raw"
if (-not (Test-Path -LiteralPath $RawDir)) {
    New-Item -ItemType Directory -Path $RawDir | Out-Null
}
$BuildLog = Join-Path $RawDir "quickjs_build.txt"
$SmokeResult = Join-Path $RawDir "quickjs_smoke.txt"
$DispatchResult = Join-Path $RawDir "quickjs_dispatch_validation.txt"
$SmokeScript = Join-Path $PSScriptRoot "quickjs_smoke.js"
$HelperScript = Join-Path $PSScriptRoot "build_quickjs_windows_msys2.sh"
foreach ($RequiredInput in @($SmokeScript, $HelperScript)) {
    if (-not (Test-Path -LiteralPath $RequiredInput -PathType Leaf)) {
        throw "Required build input not found: $RequiredInput"
    }
}

$HelperMsysPath = Convert-ToMsysPath $HelperScript
$PreviousPath = $env:Path
$PreviousSource = $env:QJS_SOURCE_DIR
$PreviousMingw = $env:QJS_MINGW_BIN
$PreviousJobs = $env:QJS_JOBS
$PreviousClean = $env:QJS_CLEAN_BUILD

try {
    $env:QJS_SOURCE_DIR = $SourcePath
    $env:QJS_MINGW_BIN = $MingwBin
    $env:QJS_JOBS = $Jobs.ToString()
    $env:QJS_CLEAN_BUILD = if ($NoClean) { "0" } else { "1" }
    $env:Path = "$MingwBin;$PreviousPath"

    $BuildStartedUtc = [DateTime]::UtcNow.ToString("o")
    $BuildOutput = @(& $BashPath $HelperMsysPath 2>&1)
    $BuildExitCode = $LASTEXITCODE

    $BuildHeader = @(
        "QUICKJS_WINDOWS_BUILD",
        "started_utc=$BuildStartedUtc",
        "repository=$Remote",
        "commit=$Head",
        "version=$Version",
        "source_dir=$SourcePath",
        "bash=$BashPath",
        "compiler=$GccPath",
        "compiler_version=$CompilerVersion",
        "compiler_target=$CompilerTarget",
        "compiler_banner=$CompilerLine",
        "make=$MakePath",
        "jobs=$Jobs",
        "clean_build=$(-not $NoClean)",
        "make_target=qjs.exe",
        "optimization=-O2 (upstream CFLAGS_OPT; CONFIG_LTO not enabled)",
        "source_patch=none",
        "build_exit_code=$BuildExitCode",
        "--- build output ---"
    )
    @($BuildHeader + $BuildOutput) | Set-Content -Encoding UTF8 -LiteralPath $BuildLog
    $BuildOutput | ForEach-Object { Write-Host $_ }

    if ($BuildExitCode -ne 0) {
        throw "QuickJS build failed with exit code $BuildExitCode. See $BuildLog"
    }

    $QjsPath = Join-Path $SourcePath "qjs.exe"
    if (-not (Test-Path -LiteralPath $QjsPath -PathType Leaf)) {
        throw "Build reported success but qjs.exe was not produced"
    }

    $QjsFile = Get-Item -LiteralPath $QjsPath
    $QjsHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $QjsPath).Hash.ToLowerInvariant()

    $SmokeOutput = @(& $QjsPath $SmokeScript 2>&1)
    $SmokeExitCode = $LASTEXITCODE
    $SmokePassed = $SmokeExitCode -eq 0 -and ($SmokeOutput -contains "SMOKE_RESULT: PASS")
    $SmokeRecord = @(
        "QUICKJS_SMOKE_TEST",
        "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
        "repository=$Remote",
        "commit=$Head",
        "version=$Version",
        "compiler=$CompilerLine",
        "compiler_target=$CompilerTarget",
        "optimization=-O2",
        "binary=$QjsPath",
        "binary_size_bytes=$($QjsFile.Length)",
        "binary_sha256=$QjsHash",
        "command=$QjsPath $SmokeScript",
        "--- output ---"
    )
    $SmokeRecord += $SmokeOutput
    $SmokeRecord += "exit_code=$SmokeExitCode"
    $SmokeRecord += "SMOKE_STATUS=$(if ($SmokePassed) { 'PASS' } else { 'FAIL' })"
    $SmokeRecord | Set-Content -Encoding UTF8 -LiteralPath $SmokeResult
    if (-not $SmokePassed) {
        throw "QuickJS smoke test failed. See $SmokeResult"
    }

    Push-Location $SourcePath
    try {
        $MacroOutput = @(& $GccPath -dM -E quickjs.c 2>&1)
        $MacroExitCode = $LASTEXITCODE
    }
    finally {
        Pop-Location
    }
    if ($MacroExitCode -ne 0) {
        throw "QuickJS preprocessor validation failed"
    }
    $DirectDispatchMacro = @($MacroOutput | Where-Object { $_ -match '^#define\s+DIRECT_DISPATCH\s+' })

    $QuickjsObject = Join-Path $SourcePath ".obj\quickjs.o"
    $SymbolOutput = @(& $NmPath -a $QuickjsObject 2>&1)
    $RelevantSymbols = @($SymbolOutput | Where-Object { $_ -match 'JS_CallInternal|dispatch_table' })
    $Disassembly = @(& $ObjdumpPath -d -Mintel --disassemble=JS_CallInternal $QuickjsObject 2>&1)
    $IndirectDispatch = @($Disassembly | Where-Object {
        $_ -match '\bjmp\s+QWORD PTR \[' -or $_ -match '\bjmp\s+r(ax|bx|cx|dx|si|di|8|9|10|11|12|13|14|15)\b'
    })
    $PeHeader = @(& $ObjdumpPath -f $QjsPath 2>&1)
    $DllNames = @(& $ObjdumpPath -p $QjsPath 2>&1 | Where-Object { $_ -match 'DLL Name:' })
    $SourceEvidence = @(
        Select-String -Path (Join-Path $SourcePath "quickjs.c") -Pattern '#define DIRECT_DISPATCH', '#define SWITCH\(pc\).*dispatch_table'
    )

    $DispatchPassed = ($DirectDispatchMacro -contains "#define DIRECT_DISPATCH 1") -and
        ($RelevantSymbols -match 'dispatch_table') -and
        ($RelevantSymbols -match 'JS_CallInternal') -and
        $IndirectDispatch.Count -gt 0

    $DispatchRecord = @(
        "QUICKJS_INTERPRETER_DISPATCH_VALIDATION",
        "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
        "repository=$Remote",
        "commit=$Head",
        "version=$Version",
        "compiler=$CompilerLine",
        "compiler_target=$CompilerTarget",
        "object=$QuickjsObject",
        "binary=$QjsPath",
        "--- source evidence ---"
    )
    $DispatchRecord += $SourceEvidence
    $DispatchRecord += "--- preprocessor evidence ---"
    $DispatchRecord += $DirectDispatchMacro
    $DispatchRecord += "--- symbols ---"
    $DispatchRecord += $RelevantSymbols
    $DispatchRecord += "--- indirect jumps in JS_CallInternal ---"
    $DispatchRecord += $IndirectDispatch
    $DispatchRecord += "--- PE/architecture ---"
    $DispatchRecord += $PeHeader
    $DispatchRecord += "--- imported DLLs ---"
    $DispatchRecord += $DllNames
    $DispatchRecord += "DISPATCH_STATUS=$(if ($DispatchPassed) { 'PASS' } else { 'FAIL' })"
    $DispatchRecord | Set-Content -Encoding UTF8 -LiteralPath $DispatchResult
    if (-not $DispatchPassed) {
        throw "QuickJS dispatch validation failed. See $DispatchResult"
    }

    Write-Host "QuickJS Windows baseline built and validated."
    Write-Host "commit=$Head"
    Write-Host "version=$Version"
    Write-Host "compiler=$CompilerLine"
    Write-Host "binary=$QjsPath"
    Write-Host "binary_size_bytes=$($QjsFile.Length)"
    Write-Host "binary_sha256=$QjsHash"
    Write-Host "smoke_result=$SmokeResult"
    Write-Host "dispatch_result=$DispatchResult"
}
finally {
    $env:Path = $PreviousPath
    $env:QJS_SOURCE_DIR = $PreviousSource
    $env:QJS_MINGW_BIN = $PreviousMingw
    $env:QJS_JOBS = $PreviousJobs
    $env:QJS_CLEAN_BUILD = $PreviousClean
}

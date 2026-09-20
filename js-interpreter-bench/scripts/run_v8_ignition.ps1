[CmdletBinding()]
param(
    [string]$D8Path = "",
    [string]$SnapshotBlobPath = "",
    [string]$ProbePath = "",
    [string]$OutputDir = "",
    [int]$Iterations = 500000
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
$RuntimeRoot = Join-Path $ProjectRoot "engines\v8-official-15.6.21\runtime"
$ExpectedD8Sha256 = "1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87"

if ([string]::IsNullOrWhiteSpace($D8Path)) {
    $D8Path = Join-Path $RuntimeRoot "d8.exe"
}
if ([string]::IsNullOrWhiteSpace($SnapshotBlobPath)) {
    $SnapshotBlobPath = Join-Path $RuntimeRoot "snapshot_blob.bin"
}
if ([string]::IsNullOrWhiteSpace($ProbePath)) {
    $ProbePath = Join-Path $ProjectRoot "benchmarks\probes\v8_tier_probe.js"
}
if ([string]::IsNullOrWhiteSpace($OutputDir)) {
    $OutputDir = Join-Path $ProjectRoot "results\raw\v8_validation"
}

$D8Path = [System.IO.Path]::GetFullPath($D8Path)
$SnapshotBlobPath = [System.IO.Path]::GetFullPath($SnapshotBlobPath)
$ProbePath = [System.IO.Path]::GetFullPath($ProbePath)
$OutputDir = [System.IO.Path]::GetFullPath($OutputDir)

foreach ($requiredFile in @($D8Path, $SnapshotBlobPath, $ProbePath)) {
    if (-not (Test-Path -LiteralPath $requiredFile -PathType Leaf)) {
        throw "Required file not found: $requiredFile"
    }
}
if ($Iterations -lt 1) {
    throw "Iterations must be positive."
}

$ActualD8Sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $D8Path).Hash.ToLowerInvariant()
if ($ActualD8Sha256 -ne $ExpectedD8Sha256) {
    throw "d8.exe hash mismatch. Expected $ExpectedD8Sha256, got $ActualD8Sha256"
}

if (Test-Path -LiteralPath $OutputDir) {
    $ExistingEvidence = @(Get-ChildItem -LiteralPath $OutputDir -File -ErrorAction Stop)
    if ($ExistingEvidence.Count -gt 0) {
        throw "Refusing to overwrite raw evidence in $OutputDir. Pass a new -OutputDir to reproduce the validation."
    }
}
else {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

$SnapshotArgument = "--snapshot_blob=$SnapshotBlobPath"

function Invoke-D8Evidence {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    $OutputPath = Join-Path $OutputDir "$Name.txt"
    $CommandArguments = @($SnapshotArgument) + $Arguments
    # Windows PowerShell 5.1 wraps native stderr lines as non-terminating
    # ErrorRecord objects. Keep those lines as evidence without allowing the
    # script-wide Stop policy to mistake a V8 diagnostic warning for failure.
    $PreviousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $CommandOutput = @(& $D8Path @CommandArguments 2>&1)
        $ExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $PreviousErrorActionPreference
    }
    $Record = @(
        "D8_EVIDENCE=$Name",
        "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
        "d8=$D8Path",
        "d8_sha256=$ActualD8Sha256",
        "arguments=$($CommandArguments -join ' ')",
        "--- output ---"
    )
    $Record += $CommandOutput
    $Record += "exit_code=$ExitCode"
    $Record | Set-Content -Encoding UTF8 -LiteralPath $OutputPath
    if ($ExitCode -ne 0) {
        throw "d8 evidence command failed: $Name. See $OutputPath"
    }
    return ($CommandOutput -join "`n")
}

$VersionText = Invoke-D8Evidence -Name "version" -Arguments @("--version")
if ($VersionText -notmatch "V8 version 15\.6\.21") {
    throw "Unexpected V8 version output: $VersionText"
}

$HelpText = Invoke-D8Evidence -Name "help" -Arguments @("--help")
$DefaultFlagText = Invoke-D8Evidence -Name "default_flag_values" -Arguments @(
    "--print-flag-values", "-e", "0"
)
$CandidateAFlagText = Invoke-D8Evidence -Name "candidate_a_flag_values" -Arguments @(
    "--max-opt=0", "--print-flag-values", "-e", "0"
)
$CandidateBFlagText = Invoke-D8Evidence -Name "candidate_b_flag_values" -Arguments @(
    "--jitless", "--print-flag-values", "-e", "0"
)

function Test-HelpFlag {
    param([Parameter(Mandatory = $true)][string]$Name)
    return $HelpText -match "(?m)^\s*--$([regex]::Escape($Name))(?:\s|$)"
}

$TraceFlagNames = @(
    "trace-baseline",
    "trace-baseline-exec",
    "trace-opt",
    "trace-opt-status",
    "trace-deopt",
    "trace-osr",
    "trace-ignition"
)
$SupportedTraceFlags = @()
$TraceSupportLines = @()
foreach ($flagName in $TraceFlagNames) {
    $supported = Test-HelpFlag -Name $flagName
    $TraceSupportLines += "$flagName=$($supported.ToString().ToLowerInvariant())"
    if ($supported) {
        $SupportedTraceFlags += "--$flagName"
    }
}

if (-not (Test-HelpFlag -Name "print-bytecode")) {
    throw "Required evidence flag --print-bytecode is not supported by this d8.exe."
}
if (-not (Test-HelpFlag -Name "print-bytecode-filter")) {
    throw "Required evidence flag --print-bytecode-filter is not supported by this d8.exe."
}

$ProbeArguments = @($ProbePath, "--", $Iterations.ToString())
$DefaultTraceText = Invoke-D8Evidence -Name "default_tier_trace" -Arguments (
    $SupportedTraceFlags + $ProbeArguments
)
$CandidateATraceText = Invoke-D8Evidence -Name "candidate_a_tier_trace" -Arguments (
    @("--max-opt=0") + $SupportedTraceFlags + $ProbeArguments
)
$DefaultBytecodeText = Invoke-D8Evidence -Name "default_bytecode" -Arguments (
    @("--print-bytecode", "--print-bytecode-filter=tierProbeTarget") + $ProbeArguments
)
$CandidateABytecodeText = Invoke-D8Evidence -Name "candidate_a_bytecode" -Arguments (
    @("--max-opt=0", "--print-bytecode", "--print-bytecode-filter=tierProbeTarget") + $ProbeArguments
)

$RequiredCandidateAValues = [ordered]@{
    "max_opt=0" = "(?m)^--max-opt=0\s*$"
    "sparkplug=false" = "(?m)^--no-sparkplug\s*$"
    "maglev=false" = "(?m)^--no-maglev\s*$"
    "turbofan=false" = "(?m)^--no-turbofan\s*$"
}
$CandidateAValueLines = @()
$CandidateAValuesPass = $true
foreach ($entry in $RequiredCandidateAValues.GetEnumerator()) {
    $matched = $CandidateAFlagText -match $entry.Value
    $CandidateAValueLines += "$($entry.Key)=$($matched.ToString().ToLowerInvariant())"
    if (-not $matched) {
        $CandidateAValuesPass = $false
    }
}

$ProbePattern = "V8_TIER_PROBE iterations=$Iterations checksum=(-?\d+)"
$DefaultProbeMatch = [regex]::Match($DefaultTraceText, $ProbePattern)
$CandidateAProbeMatch = [regex]::Match($CandidateATraceText, $ProbePattern)
$SameProbeResult = $DefaultProbeMatch.Success -and $CandidateAProbeMatch.Success -and
    ($DefaultProbeMatch.Groups[1].Value -eq $CandidateAProbeMatch.Groups[1].Value)
$CandidateABytecodePresent = $CandidateABytecodeText -match "generated bytecode for function: tierProbeTarget"

$TierEventPatterns = [ordered]@{
    "baseline_compile" = "\[Baseline batch compilation\]|\[Concurrent Sparkplug"
    "maglev_compile" = "target MAGLEV"
    "turbofan_compile" = "target TURBOFAN"
    "osr_entry" = "\[OSR - entry"
    "interpreted_status" = "INTERPRETED_FUNCTION"
    "baseline_status" = "BASELINE"
    "maglev_status" = "\^MAGLEV"
    "turbofan_status" = "\^TURBOFAN"
}
$TierEventLines = @()
$TierEventCounts = @{}
foreach ($entry in $TierEventPatterns.GetEnumerator()) {
    $defaultCount = ([regex]::Matches($DefaultTraceText, $entry.Value)).Count
    $candidateACount = ([regex]::Matches($CandidateATraceText, $entry.Value)).Count
    $TierEventCounts[$entry.Key] = @($defaultCount, $candidateACount)
    $TierEventLines += "$($entry.Key):default=$defaultCount,candidate_a=$candidateACount"
}

$DefaultControlPass =
    $TierEventCounts["baseline_compile"][0] -gt 0 -and
    $TierEventCounts["maglev_compile"][0] -gt 0 -and
    $TierEventCounts["turbofan_compile"][0] -gt 0
$CandidateANoHigherTierPass =
    $TierEventCounts["baseline_compile"][1] -eq 0 -and
    $TierEventCounts["maglev_compile"][1] -eq 0 -and
    $TierEventCounts["turbofan_compile"][1] -eq 0 -and
    $TierEventCounts["baseline_status"][1] -eq 0 -and
    $TierEventCounts["maglev_status"][1] -eq 0 -and
    $TierEventCounts["turbofan_status"][1] -eq 0
$CandidateAInterpretedPass = $TierEventCounts["interpreted_status"][1] -gt 0
$ValidationPass =
    $CandidateAValuesPass -and
    $CandidateABytecodePresent -and
    $SameProbeResult -and
    $DefaultControlPass -and
    $CandidateANoHigherTierPass -and
    $CandidateAInterpretedPass

$Summary = @(
    "V8_INTERPRETER_VALIDATION",
    "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
    "v8_version=15.6.21",
    "v8_source_commit=37fb84941c9be9f9914ee50b1ad366f06a1bd764",
    "v8_source_tag_url=https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21",
    "v8_flag_source_url=https://chromium.googlesource.com/v8/v8/+/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/flags/flag-definitions.h",
    "d8=$D8Path",
    "d8_sha256=$ActualD8Sha256",
    "snapshot_blob=$SnapshotBlobPath",
    "probe=$ProbePath",
    "iterations=$Iterations",
    "candidate_a=d8.exe --snapshot_blob=<fixed snapshot_blob.bin> --max-opt=0",
    "candidate_b=d8.exe --snapshot_blob=<fixed snapshot_blob.bin> --jitless",
    "--- trace flag support from actual --help ---"
)
$Summary += $TraceSupportLines
$Summary += "supported_trace_arguments=$($SupportedTraceFlags -join ' ')"
$Summary += "--- candidate A effective flag checks ---"
$Summary += $CandidateAValueLines
$Summary += "candidate_a_effective_flags_pass=$($CandidateAValuesPass.ToString().ToLowerInvariant())"
$Summary += "candidate_a_bytecode_present=$($CandidateABytecodePresent.ToString().ToLowerInvariant())"
$Summary += "default_and_candidate_a_probe_result_equal=$($SameProbeResult.ToString().ToLowerInvariant())"
$Summary += "--- trace event counts: default,candidate A ---"
$Summary += $TierEventLines
$Summary += "default_control_tiers_up=$($DefaultControlPass.ToString().ToLowerInvariant())"
$Summary += "candidate_a_no_higher_tier_events=$($CandidateANoHigherTierPass.ToString().ToLowerInvariant())"
$Summary += "candidate_a_interpreted_status_present=$($CandidateAInterpretedPass.ToString().ToLowerInvariant())"
$Summary += "STATUS=$(if ($ValidationPass) { 'PASS' } else { 'BLOCKED' })"
$Summary | Set-Content -Encoding UTF8 -LiteralPath (Join-Path $OutputDir "summary.txt")

Write-Host "Evidence written to $OutputDir"
Write-Host "Candidate A effective flag checks: $CandidateAValuesPass"
Write-Host "Candidate A bytecode present: $CandidateABytecodePresent"
Write-Host "Default/A probe results equal: $SameProbeResult"
Write-Host "Default control reaches Sparkplug, Maglev, and TurboFan: $DefaultControlPass"
Write-Host "Candidate A has no higher-tier events: $CandidateANoHigherTierPass"
Write-Host "Candidate A reports interpreted execution status: $CandidateAInterpretedPass"
Write-Host "Validation status: $(if ($ValidationPass) { 'PASS' } else { 'BLOCKED' })"

if (-not $ValidationPass) {
    throw "V8 interpreter-only validation did not pass. Review $OutputDir"
}

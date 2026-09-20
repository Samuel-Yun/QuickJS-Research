[CmdletBinding()]
param(
    [string]$D8Path = "F:\v8-work\v8\out\x64.release\d8.exe",
    [string]$OutputDir = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
if ([string]::IsNullOrWhiteSpace($OutputDir)) {
    $OutputDir = Join-Path $ProjectRoot "results\raw\v8_validation"
}
$ProbeScript = Join-Path $PSScriptRoot "v8_ignition_probe.js"

if (-not (Test-Path -LiteralPath $D8Path -PathType Leaf)) {
    throw "BLOCKED: d8.exe not found: $D8Path"
}
if (-not (Test-Path -LiteralPath $ProbeScript -PathType Leaf)) {
    throw "Probe script not found: $ProbeScript"
}
if (-not (Test-Path -LiteralPath $OutputDir)) {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

function Invoke-D8Evidence {
    param(
        [string]$Name,
        [string[]]$Arguments
    )

    $OutputPath = Join-Path $OutputDir "$Name.txt"
    $Output = @(& $D8Path @Arguments 2>&1)
    $ExitCode = $LASTEXITCODE
    $Record = @(
        "D8_EVIDENCE=$Name",
        "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
        "d8=$D8Path",
        "d8_sha256=$((Get-FileHash -Algorithm SHA256 -LiteralPath $D8Path).Hash.ToLowerInvariant())",
        "arguments=$($Arguments -join ' ')",
        "--- output ---"
    )
    $Record += $Output
    $Record += "exit_code=$ExitCode"
    $Record | Set-Content -Encoding UTF8 -LiteralPath $OutputPath
    if ($ExitCode -ne 0) {
        throw "d8 evidence command failed: $Name. See $OutputPath"
    }
}

$CandidateA = @('--max-opt=0')
$CandidateB = @('--jitless')

Invoke-D8Evidence -Name 'candidate_a_flag_dump' -Arguments `
    ($CandidateA + @('--print-flag-values', '--quit'))
Invoke-D8Evidence -Name 'candidate_a_bytecode' -Arguments `
    ($CandidateA + @('--print-bytecode', '--print-bytecode-filter=hot', $ProbeScript, '--', '20'))
Invoke-D8Evidence -Name 'candidate_a_ignition_trace' -Arguments `
    ($CandidateA + @('--trace-ignition', $ProbeScript, '--', '20'))
Invoke-D8Evidence -Name 'candidate_a_tier_trace' -Arguments `
    ($CandidateA + @('--trace-baseline', '--trace-baseline-exec', '--trace-opt',
        '--trace-opt-status', '--trace-deopt', '--trace-osr', $ProbeScript, '--', '200000'))

Invoke-D8Evidence -Name 'candidate_b_flag_dump' -Arguments `
    ($CandidateB + @('--print-flag-values', '--quit'))
Invoke-D8Evidence -Name 'candidate_b_bytecode' -Arguments `
    ($CandidateB + @('--print-bytecode', '--print-bytecode-filter=hot', $ProbeScript, '--', '20'))
Invoke-D8Evidence -Name 'candidate_b_ignition_trace' -Arguments `
    ($CandidateB + @('--trace-ignition', $ProbeScript, '--', '20'))
Invoke-D8Evidence -Name 'candidate_b_tier_trace' -Arguments `
    ($CandidateB + @('--trace-baseline', '--trace-baseline-exec', '--trace-opt',
        '--trace-opt-status', '--trace-deopt', '--trace-osr', $ProbeScript, '--', '200000'))

$Summary = @(
    'V8_INTERPRETER_VALIDATION',
    "timestamp_utc=$([DateTime]::UtcNow.ToString('o'))",
    "d8=$D8Path",
    "d8_sha256=$((Get-FileHash -Algorithm SHA256 -LiteralPath $D8Path).Hash.ToLowerInvariant())",
    'candidate_a=d8.exe --max-opt=0',
    'candidate_b=d8.exe --jitless',
    'STATUS=REQUIRES_MANUAL_EVIDENCE_REVIEW',
    'Do not promote either command until flag dumps, Ignition trace, and all tier traces are reviewed.'
)
$Summary | Set-Content -Encoding UTF8 -LiteralPath (Join-Path $OutputDir 'summary.txt')
Write-Host "Evidence written to $OutputDir"

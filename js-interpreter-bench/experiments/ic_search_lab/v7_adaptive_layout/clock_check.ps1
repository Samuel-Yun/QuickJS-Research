$ErrorActionPreference = 'Stop'
$clockStartUtc = [DateTime]::UtcNow
$clockStartTicks = [System.Diagnostics.Stopwatch]::GetTimestamp()
$clockProbeOutput = & wsl.exe -d Ubuntu --exec python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v7_adaptive_layout/clock_probe.py
$clockProbeExit = $LASTEXITCODE
$clockEndTicks = [System.Diagnostics.Stopwatch]::GetTimestamp()
$clockEndUtc = [DateTime]::UtcNow
[pscustomobject]@{
  host_utc_start = $clockStartUtc.ToString('o')
  host_utc_end = $clockEndUtc.ToString('o')
  host_stopwatch_seconds = ($clockEndTicks-$clockStartTicks)/[System.Diagnostics.Stopwatch]::Frequency
  host_utc_seconds = ($clockEndUtc-$clockStartUtc).TotalSeconds
  stopwatch_frequency = [System.Diagnostics.Stopwatch]::Frequency
  probe_exit_code = $clockProbeExit
  output = $clockProbeOutput
} | ConvertTo-Json -Depth 5

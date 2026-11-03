$ErrorActionPreference = 'Stop'
$record = Join-Path $PSScriptRoot 'windows_worker.json'
if (Test-Path -LiteralPath $record) { throw 'Inspect the recorded worker before launching another.' }
$script = '/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_fast_slow_20261102/attempt01/worker.py'
$out = Join-Path $PSScriptRoot 'worker.stdout.log'
$err = Join-Path $PSScriptRoot 'worker.stderr.log'
$process = Start-Process -FilePath 'wsl.exe' -ArgumentList @('-d','Ubuntu','--','python3','-u',$script) -WindowStyle Hidden -RedirectStandardOutput $out -RedirectStandardError $err -PassThru
[ordered]@{ pid=$process.Id; script=$script; hidden=$true; purpose='serial authorized local research; no service or network'; launched=(Get-Date).ToUniversalTime().ToString('o') } | ConvertTo-Json | Set-Content -LiteralPath $record -Encoding UTF8
Write-Output ('Started WSL research worker PID '+$process.Id)

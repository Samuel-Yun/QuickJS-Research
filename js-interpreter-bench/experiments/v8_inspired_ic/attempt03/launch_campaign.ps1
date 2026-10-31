$ErrorActionPreference = 'Stop'
$attemptDirectory = $PSScriptRoot
$launchRecord = Join-Path $attemptDirectory 'windows_launcher.json'
if (Test-Path -LiteralPath $launchRecord) { throw 'Already launched; inspect processes/raw, do not duplicate.' }
$linuxScript = '/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/v8_inspired_ic/attempt03/execute_reuse.py'
$stdoutPath = Join-Path $attemptDirectory 'launcher.stdout.log'
$stderrPath = Join-Path $attemptDirectory 'launcher.stderr.log'
$workerProcess = Start-Process -FilePath 'wsl.exe' -ArgumentList @('-d','Ubuntu','--','python3','-u',$linuxScript) -WindowStyle Hidden -RedirectStandardOutput $stdoutPath -RedirectStandardError $stderrPath -PassThru
[ordered]@{ pid=$workerProcess.Id; launched_at=(Get-Date).ToUniversalTime().ToString('o'); distro='Ubuntu'; script=$linuxScript; hidden_window=$true; stdout=$stdoutPath; stderr=$stderrPath; runtime_changed=$false; note='Independent background worker; no service, scheduled task, or system configuration was installed.' } | ConvertTo-Json | Set-Content -LiteralPath $launchRecord -Encoding UTF8
Write-Output ('Started background WSL PID '+$workerProcess.Id)

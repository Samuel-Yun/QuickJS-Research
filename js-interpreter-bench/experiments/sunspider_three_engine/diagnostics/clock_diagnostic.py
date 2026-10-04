"""Investigate failed Date.now intervals without changing the frozen MAIN."""
import sys
from pathlib import Path
import subprocess
HERE = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(HERE))
import experiment as x

x.verified()
script = HERE / 'diagnostics/clock_probe.js'
for engine in x.ENGINES:
    cmd = x.cohort.command(engine, script)
    p = subprocess.run(cmd, cwd=x.ROOT, capture_output=True, text=True, timeout=30, check=False)
    record = {'engine': engine, 'command': cmd, 'exit_code': p.returncode,
              'stdout': p.stdout, 'stderr': p.stderr, 'timestamp_utc': x.now(),
              'script_sha256': x.sha(script), 'formal_sample': False}
    x.save(HERE / 'diagnostics' / (engine + '.clock.json'), record)
    print(engine, p.stdout, p.stderr, flush=True)
for name, cmd in {
    'time_status': ['timedatectl', 'show'],
    'time_services': ['systemctl', 'status', 'systemd-timesyncd', 'chrony', '--no-pager'],
    'clocksource': ['cat', '/sys/devices/system/clocksource/clocksource0/current_clocksource'],
    'available_clocksources': ['cat', '/sys/devices/system/clocksource/clocksource0/available_clocksource'],
}.items():
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=30, check=False)
    x.save(HERE / 'diagnostics' / (name + '.json'),
           {'command': cmd, 'exit_code': p.returncode, 'stdout': p.stdout, 'stderr': p.stderr})

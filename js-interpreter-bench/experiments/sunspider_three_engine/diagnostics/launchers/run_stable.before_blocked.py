"""Let this WSL boot's wall clock settle; then resume unchanged MAIN contract.

This does not set the system clock, modify services, or execute/warm a workload.
"""
import importlib.util
import subprocess
import sys
import time
from pathlib import Path
import experiment as x

x.verified()
observations = []
stable = 0
started = time.monotonic()
while stable < 12 and time.monotonic() - started < 180:
    a, ap = time.time_ns(), time.monotonic_ns()
    time.sleep(5)
    b, bp = time.time_ns(), time.monotonic_ns()
    p = subprocess.run(['timedatectl', 'show', '-p', 'NTPSynchronized', '--value'],
                       capture_output=True, text=True, timeout=10, check=False)
    divergence_ms = ((b-a) - (bp-ap)) / 1e6
    good = p.returncode == 0 and p.stdout.strip() == 'yes' and abs(divergence_ms) < 5
    stable = stable + 1 if good else 0
    observations.append({'elapsed_monotonic_seconds': time.monotonic()-started,
                         'Date_clock_delta_ms': (b-a)/1e6,
                         'monotonic_delta_ms': (bp-ap)/1e6,
                         'divergence_ms': divergence_ms,
                         'NTPSynchronized': p.stdout.strip(), 'consecutive_stable': stable})
    print(f'WSL clock settle {stable}/12, divergence={divergence_ms:.3f}ms', flush=True)
stamp = x.now().replace(':', '-')
x.save(x.HERE / 'diagnostics/stabilization' / (stamp + '.json'),
       {'timestamp_utc': x.now(), 'observations': observations, 'pass': stable == 12,
        'boot_id': Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
        'workload_warmup_calls': 0, 'system_settings_changed': False,
        'launcher_sha256': x.sha(Path(__file__))})
if stable != 12:
    raise RuntimeError('WSL wall clock failed settling gate; no new workload execution')
# Keep the distro/process alive between the settling gate and the campaign.
spec = importlib.util.spec_from_file_location('campaign_run', x.HERE / 'run.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
sys.argv = [str(x.HERE / 'run.py'), 'all']
module.main()

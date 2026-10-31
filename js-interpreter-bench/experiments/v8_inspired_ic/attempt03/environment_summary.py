"""Write a human-readable environment record from actual saved evidence only."""
import json
from pathlib import Path
HERE=Path(__file__).resolve().parent
def read(name):return json.loads((HERE/name).read_text(encoding='utf-8-sig'))
r=read('campaign_runtime.json');p=read('post_identity.json')
before=read('host_windows_before.json');after=read('host_windows_after.json')
parts=['Cohort: '+r['cohort'],'Platform: WSL2 Ubuntu 24.04.2 / x86_64',
       'Host: '+r['host'],'Kernel: '+r['kernel'],'Measurement boot: '+r['boot_id'],
       'Affinity: '+str(r['affinity']),'Python (Linux collection): '+p['Python_version'],
       'Clock: '+json.dumps(p['perf_counter_clock']),
       'QuickJS A upstream: 04be246001599f5995fa2f2d8c91a0f198d3f34c / 2026-06-04',
       'E compiler: '+r['E_build']['compiler'],
       'A/E optimization: -O2 -g -fwrapv; no added LTO/PGO/NDEBUG; exact invocations in raw/build/E.log',
       'V8 shell: d8 15.6.21 (not Node.js); --jitless --no-lazy --use-ic; frozen snapshot/ICU',
       'Actual V8 build commit/compiler/full GN args: UNKNOWN (reference commit is not artifact provenance)',
       'Artifacts: '+json.dumps(r['artifacts'],indent=2),
       'V8 data dependencies: '+json.dumps(r['v8']['dependencies'],indent=2),
       'ACLineStatus before/after: '+str(before['ACLineStatus'])+'/'+str(after['ACLineStatus']),
       'Power plan before: '+before['power_plan'].strip(),'Power plan after: '+after['power_plan'].strip(),
       'Observed Windows busy fraction before/after: '+str(before['system_busy_fraction'])+'/'+str(after['system_busy_fraction']),
       'Continuous power/load isolation, frequency, temperature, indirect retained peak, RSS: UNKNOWN',
       'No system power/governor/ASLR/security/WSL settings changed.',
       'UTC labels showed backwards adjustments; see clock_limitations.md. UTC was not the timing source.',
       'Recorded Linux preparation evidence (CPU, RAM, disk, OS, processes):',read('environment.json')['record']['stdout']]
dest=HERE/'environment.txt';assert not dest.exists();dest.write_text('\n\n'.join(parts)+'\n',encoding='utf-8')
print('Wrote environment.txt from saved records; no VM executed')

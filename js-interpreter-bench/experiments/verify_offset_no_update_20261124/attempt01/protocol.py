"""Record the deterministic same-batch full-suite schedule and input hashes."""
import json
from pathlib import Path

from build import HERE,PACKAGE,LABELS,save,sha


def main():
    tests=PACKAGE/'tests'
    catalog=json.loads((tests/'benchmarks.json').read_text())
    inputs={str(tests/'benchmarks.json'):sha(tests/'benchmarks.json')}
    for cases in catalog['cases'].values():
        for c in cases:
            assert sha(tests/c['path'])==c['sha256']
            inputs[str(tests/c['path'])]=c['sha256']
    for n,h in catalog['support'].items():
        assert sha(tests/n)==h
        inputs[str(tests/n)]=h
    schedule=[];index=0
    for i in range(26):
        for suite in ['octane','sunspider']:
            if i>=len(catalog['cases'][suite]):continue
            c=catalog['cases'][suite][i]
            for label in (LABELS if index%2==0 else LABELS[::-1]):
                schedule.append(dict(suite=suite,case=c['case'],N=c['N'],label=label))
            index+=1
    protocol=dict(schedule=schedule,processes=86,CPU=2,TZ='Asia/Shanghai',locale='C',
        inputs=inputs,engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS},
        N_and_inputs='native_confirmation_20261108/attempt02 exact hashes',
        metric='native monotonic elapsed ms / complete Run; first Run included; no warmup; load and Setup excluded',
        source_and_counter_builds_separate=True,repeats_per_case=1,run_driver_sha256=sha(HERE/'run.py'))
    save(HERE/'full_protocol.json',protocol)
    print('FULL_PROTOCOL: 86 fresh processes; input hashes verified')


if __name__=='__main__': main()

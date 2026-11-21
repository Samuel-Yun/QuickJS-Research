"""Small, paired Release timing and independent per-site counter runs."""
import argparse
import csv
import json
import math
import os
from pathlib import Path
import statistics
import subprocess

from build import HERE, PACKAGE, LABELS, sha, save

ENV = dict(os.environ, TZ='Asia/Shanghai', LANG='C', LC_ALL='C')


def binary(label, mode):
    m = json.loads((HERE / f'{label}.{mode}.manifest.json').read_text())
    assert sha(Path(m['binary'])) == m['binary_sha256']
    return m['binary']


def capture(label, mode, script, n=None, rep=0, phase='gate'):
    executable = str(PACKAGE / 'build/A/qjs') if label == 'A' else binary(label, mode)
    command = [executable, str(script)] + ([] if n is None else [str(n)])
    r = subprocess.run(command, capture_output=True, text=True, env=ENV, timeout=120)
    row = dict(label=label, mode=mode, script=str(script), iterations=n,
               rep=rep, phase=phase, command=command, exit_code=r.returncode,
               stdout=r.stdout, stderr=r.stderr)
    with (HERE / 'raw.jsonl').open('a') as f:
        f.write(json.dumps(row, ensure_ascii=False) + '\n')
    assert r.returncode == 0, row
    if mode == 'counts':
        row['counts'] = json.loads(r.stderr.removeprefix('READ_SHAPE_COUNTS:'))
    else:
        assert not r.stderr, row
    if n is not None:
        row['payload'] = json.loads(r.stdout)
        assert row['payload']['checksum'] == 3 * n
        assert row['payload']['iterations'] == n
    return row


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('phase', choices=['gate', 'pilot', 'counts', 'measure'])
    args = parser.parse_args()
    os.sched_setaffinity(0, {2})
    if args.phase == 'gate':
        cases = [HERE / 'semantics.js', PACKAGE / 'tests/property_reads.js',
                 PACKAGE / 'tests/safety.js']
        results = []
        for script in cases:
            a = capture('A', 'release', script)
            for label in LABELS:
                for mode in ['release', 'counts']:
                    row = capture(label, mode, script)
                    assert row['stdout'] == a['stdout'], row
                    results.append(dict(script=str(script), label=label, mode=mode, equal_to_A=True))
        for script in ['stable.js', 'alternating.js']:
            for label in LABELS:
                capture(label, 'release', HERE / script, 1024)
        save(HERE / 'gate.json', dict(status='PASS', comparisons=results))
        print('GATE_PASS', len(results), flush=True)
    elif args.phase == 'pilot':
        rows = [capture(label, 'release', HERE / (case + '.js'), 1048576, phase='pilot')
                for case in ['stable', 'alternating'] for label in LABELS]
        # Select one common N for both versions and both input sequences.
        fastest = min(r['payload']['elapsed_ms'] for r in rows)
        n = min(67108864, 2 ** math.ceil(math.log2(1048576 * 1200 / max(1, fastest))))
        save(HERE / 'protocol.json', dict(iterations=n, repeats=3, CPU=2,
             TZ='Asia/Shanghai', locale='C', timed='run(sequence,n) only',
             sequence_generation_timed=False, warmup_calls=0, first_call_included=True,
             counts_iterations=65536, pilot=rows))
        print('PILOT', [(Path(r['script']).stem, r['label'], r['payload']['elapsed_ms']) for r in rows], 'N', n, flush=True)
    elif args.phase == 'counts':
        all_rows = []
        n = 65536
        for case in ['stable', 'alternating']:
            for label in LABELS:
                row = capture(label, 'counts', HERE / (case + '.js'), n, phase='counts')
                c = row['counts']
                cold_or_misses = 1 if case == 'stable' else n
                assert c['fused_entries'] == c['fused_shape_checks'] == n, c
                assert c['fused_hits'] == n - cold_or_misses and c['field_hits'] == 0, c
                assert c['lookups'] == c['own_searches'] == c['updates'] == cold_or_misses, c
                if label == 'SPARSE':
                    assert c['field_entries'] == c['field_cache_probes'] == cold_or_misses, c
                    assert c['direct_lookup_entries'] == 0, c
                else:
                    assert c['field_entries'] == c['field_cache_probes'] == 0, c
                    assert c['direct_lookup_entries'] == cold_or_misses, c
                all_rows.append(row)
                print('COUNTS_PASS', case, label, c, flush=True)
        save(HERE / 'counts.json', all_rows)
    else:
        assert json.loads((HERE / 'gate.json').read_text())['status'] == 'PASS'
        protocol = json.loads((HERE / 'protocol.json').read_text())
        n = protocol['iterations']
        rows = []
        for rep in range(1, protocol['repeats'] + 1):
            for case in ['stable', 'alternating']:
                for label in (LABELS if rep % 2 else LABELS[::-1]):
                    row = capture(label, 'release', HERE / (case + '.js'), n, rep, 'measure')
                    rows.append(row)
                    print('TIME', rep, case, label, row['payload']['elapsed_ms'], flush=True)
        summary = []
        for case in ['stable', 'alternating']:
            baseline = None
            for label in LABELS:
                values = [r['payload']['elapsed_ms'] for r in rows
                          if Path(r['script']).stem == case and r['label'] == label]
                med = statistics.median(values)
                if baseline is None:
                    baseline = med
                summary.append(dict(case=case, label=label, n=n, median_ms=med,
                     min_ms=min(values), max_ms=max(values), values_ms=values,
                     change_percent=100 * (med / baseline - 1)))
        save(HERE / 'timing.json', summary)
        with (HERE / 'timing.csv').open('w') as f:
            writer = csv.DictWriter(f, fieldnames=list(summary[0]))
            writer.writeheader(); writer.writerows(summary)
        print(json.dumps(summary, ensure_ascii=False, indent=2), flush=True)


if __name__ == '__main__':
    main()

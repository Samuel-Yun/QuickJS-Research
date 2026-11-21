"""Check source scope, patch reconstruction and recorded measurements."""
import json
from pathlib import Path
import statistics
import subprocess
import tempfile

from build import HERE, PACKAGE, LABELS, candidate, save, sha


def main():
    frozen = PACKAGE / 'modified'
    expected = json.loads((PACKAGE / 'manifest.json').read_text())['modified']
    for n, digest in expected.items():
        assert sha(frozen / n) == digest, n
    old = {n: (frozen / n).read_text() for n in ['quickjs.c', 'read_ic_opcodes.inc']}
    changed = dict(zip(old, candidate(*old.values())))
    for label in LABELS:
        for mode in ['release', 'counts']:
            m = json.loads((HERE / f'{label}.{mode}.manifest.json').read_text())
            d = Path(m['binary']).parent
            assert sha(d / 'qjs') == m['binary_sha256']
            for n, digest in m['sources'].items():
                assert sha(d / n) == digest, n
                if n not in old:
                    assert digest == expected[n], n
            if mode == 'release':
                for n, s in (old if label == 'SPARSE' else changed).items():
                    assert (d / n).read_text() == s, n
    with tempfile.TemporaryDirectory(prefix='read-shape-patch-') as td:
        d = Path(td)
        for n, s in old.items():
            (d / n).write_text(s)
        r = subprocess.run(['patch', '-p1', '--batch', '--fuzz=0', '-i',
                 str(HERE / 'SPARSE-to-SKIP_REPROBE.patch')], cwd=d,
                 capture_output=True, text=True, check=True)
        for n, s in changed.items():
            assert (d / n).read_text() == s, n
    gate = json.loads((HERE / 'gate.json').read_text())
    assert gate['status'] == 'PASS' and len(gate['comparisons']) == 12
    raw = [json.loads(s) for s in (HERE / 'raw.jsonl').read_text().splitlines()]
    timings = [r for r in raw if r['phase'] == 'measure']
    assert len(timings) == 12
    for row in timings:
        assert row['mode'] == 'release' and not row['stderr'] and row['exit_code'] == 0
        assert json.loads(row['stdout'])['checksum'] == 3 * row['iterations']
    summaries = json.loads((HERE / 'timing.json').read_text())
    for s in summaries:
        values = [json.loads(r['stdout'])['elapsed_ms'] for r in timings
                  if Path(r['script']).stem == s['case'] and r['label'] == s['label']]
        assert values == s['values_ms'] and statistics.median(values) == s['median_ms']
    counts = json.loads((HERE / 'counts.json').read_text())
    alt = {r['label']: r['counts'] for r in counts if Path(r['script']).stem == 'alternating'}
    assert alt['SPARSE']['field_cache_probes'] == 65536
    assert alt['SKIP_REPROBE']['field_cache_probes'] == 0
    assert alt['SPARSE']['updates'] == alt['SKIP_REPROBE']['updates'] == 65536
    save(HERE / 'audit.json', dict(status='PASS', changed_release_files=list(old),
         frozen_source_hashes_match=True, constructor_sources_identical=True,
         bytecode_encoding_and_preparation_identical=True, patch_applies_without_fuzz=True,
         gate_comparisons=12, measured_fresh_processes=12,
         counts_separate_from_release=True, alternating_updates_preserved=True))
    print('AUDIT_PASS: original SPARSE parent, only two read-path files changed; counters and timings match')


if __name__ == '__main__':
    main()

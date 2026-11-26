"""Bounded follow-up after performance: attribute Mandreel's large time change."""
from pathlib import Path
import gzip
import hashlib
import importlib.util
import json
import os

H = Path(__file__).resolve().parent
ROOT = H.parents[2]


def main():
    assert json.loads((H / 'audit.json').read_text())['status'] == 'PASS_COMPLETE'
    spec = importlib.util.spec_from_file_location('coverage_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
    b = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(b)
    b.H = H / 'mandreel_diagnostic'
    os.sched_setaffinity(0, {2})
    b.save('environment.json', b.environment())
    protocol = b.load(H / 'protocol.json')
    original = Path(protocol['scripts']['Mandreel.Mandreel']['correctness']['path'])
    script = original.read_text()
    assert script.count('  var started=now();') == script.count('  var stopped=now();') == 1
    script = script.replace('  var started=now();', '  __diag_begin();\n  var started=now();')
    script = script.replace('  var stopped=now();', '  var stopped=now();\n  __diag_end();')
    b.save('input.js', script)
    result = {}
    for label in ['CHAIN2', 'READ_STORE']:
        runtime = H / 'work' / ('PREFLIGHT_' + label) / 'qjs'
        r = b.capture([runtime, b.H / 'input.js'], 'coverage', label, 180)
        assert r['exit_code'] == 0 and '"correctness":"PASS"' in r['stdout'], r
        counts = json.loads(next(line[14:] for line in r['stdout'].splitlines() if line.startswith('TARGET_COUNTS:')))
        result[label] = dict(**counts, binary_sha256=b.sha(runtime))
        print('MANDREEL_COVERAGE', label, counts, flush=True)
    b.save('summary.json', dict(status='PASS_DIAGNOSTIC', case='Mandreel.Mandreel', N=1,
        scope='original Run loop only; not a native performance sample', formal_performance_samples=0,
        original_script_sha256=b.sha(original), marker_script_sha256=b.sha(b.H / 'input.js'), results=result))
    raw = (b.H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    b.save('raw/runs.jsonl.gz', packed)
    b.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(), uncompressed_sha256=hashlib.sha256(raw).hexdigest()))


if __name__ == '__main__':
    main()

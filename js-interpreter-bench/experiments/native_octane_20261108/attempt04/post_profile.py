"""After performance only: distinguish instruction-work changes from native time."""
from pathlib import Path
import csv
import gzip
import hashlib
import importlib.util
import json
import os
import re
import shlex

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
D = H.parent / 'attempt02'


def main():
    assert json.loads((H / 'audit.json').read_text())['status'] == 'PASS_COMPLETE'
    spec = importlib.util.spec_from_file_location('post_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
    b = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(b)
    b.H = H / 'post_diagnostics'
    os.sched_setaffinity(0, {2})
    b.save('environment.json', b.environment())
    cases = dict(CHAIN2=['Richards.Richards', 'RayTrace.RayTrace'],
                 READ_STORE=['Richards.Richards', 'RayTrace.RayTrace'])
    for label in ['CHAIN2', 'READ_STORE']:
        for sanitized in [False, True]:
            runtime = H / 'work' / (label + '.sanitized' if sanitized else label) / 'qjs'
            command = [runtime, '--std', H / 'cold_write.js']
            if sanitized:
                command = ['env', 'ASAN_OPTIONS=detect_leaks=0:abort_on_error=1', 'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1', *command]
            result = b.capture(command, 'cold_write', label + ('/sanitized' if sanitized else '/release'), 60)
            assert result['exit_code'] == 0 and not result['stderr'] and 'COLD_SHARED_WRITE_PASS' in result['stdout'], result
    results = []
    identities = {}
    for label, selected in cases.items():
        build = json.loads((H / 'build' / (label + '.json')).read_text())
        line = next(s for s in build['stdout'].splitlines() if ' -o qjs ' in s)
        command = shlex.split(line)
        target = H / 'work' / (label + '.profile')
        command[command.index('-o') + 1] = str(target)
        for i, arg in enumerate(command):
            if arg.startswith('.obj/'):
                base = D / 'work/PROFILE' if arg == '.obj/quickjs-libc.o' else H / 'work' / label
                command[i] = str(base / arg)
        result = b.capture(command, 'profile_link', label, 60)
        assert result['exit_code'] == 0, result['stderr']
        identities[label] = dict(binary_sha256=b.sha(target), VM_object_sha256=b.sha(H / 'work' / label / '.obj/quickjs.o'),
            helper_object_sha256=b.sha(D / 'work/PROFILE/.obj/quickjs-libc.o'), source='exact release VM object; diagnostic libc hooks only')
        for case in selected:
            script = D / 'diagnostics/scripts' / (case + '.js')
            output = b.H / (label + '.' + case + '.callgrind')
            result = b.capture(['valgrind', '--tool=callgrind', '--instr-atstart=no', '--cache-sim=no', '--branch-sim=no',
                                '--callgrind-out-file=' + str(output), target, script], 'profile', label + '/' + case, 180)
            assert result['exit_code'] == 0 and '"correctness":"PASS"' in result['stdout'], result
            annotation = b.capture(['callgrind_annotate', '--show=Ir', '--auto=no', '--threshold=99', str(output) + '.1'],
                                   'annotate', label + '/' + case, 60)
            assert annotation['exit_code'] == 0
            b.save('profiles/' + label + '.' + case + '.txt', annotation['stdout'])
            def total(text):
                return int(re.search(r'([\d,]+) \(100\.0%\)  PROGRAM TOTALS', text).group(1).replace(',', ''))
            previous = total((D / 'diagnostics/profiles' / (case + '.txt')).read_text())
            current = total(annotation['stdout'])
            results.append(dict(condition=label, case=case, PREP2_Ir=previous, candidate_Ir=current,
                instruction_change_pct=100 * (current / previous - 1), script_sha256=b.sha(script),
                scope='independent N1 Run; whole instruction work, not native time or isolated cause'))
            print('POST_PROFILE', label, case, results[-1]['instruction_change_pct'], flush=True)
    with (b.H / 'instruction_comparison.csv').open('w', newline='') as out:
        writer = csv.DictWriter(out, list(results[0]), lineterminator='\n')
        writer.writeheader()
        writer.writerows(results)
    b.save('manifest.json', dict(status='PASS_DIAGNOSTIC', formal_performance_samples=0, identities=identities,
        selection='after all five performance rounds: check whether measured structural changes reduce whole-run instruction work',
        native_time_inference=False, cold_write_release_and_sanitized=True))
    rows = b.records()
    intervals = sorted([r for r in rows if r['event'] == 'process_result'], key=lambda r: r['outer_start_ns'])
    assert all(a['outer_stop_ns'] <= z['outer_start_ns'] for a, z in zip(intervals, intervals[1:]))
    main_rows = [json.loads(line) for line in gzip.decompress((H / 'raw/runs.jsonl.gz').read_bytes()).splitlines()]
    assert max(r['outer_stop_ns'] for r in main_rows if r['event'] == 'process_result') <= intervals[0]['outer_start_ns']
    raw = (b.H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    b.save('raw/runs.jsonl.gz', packed)
    b.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(), uncompressed_sha256=hashlib.sha256(raw).hexdigest()))


if __name__ == '__main__':
    main()

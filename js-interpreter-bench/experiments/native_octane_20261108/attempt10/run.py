"""Cold-call trampoline for first-entry preparation, keeping warm interpreter source.

Build and run serially. Reuse frozen native controls without executing them.
"""
import argparse
import collections
import csv
import gzip
import hashlib
import importlib.util
import io
import json
import math
import os
from pathlib import Path
import random
import statistics as st
import tarfile
import difflib
import shutil
import variants

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
OLD = ROOT / 'experiments/native_octane_20261107/attempt01'
PARENT = H.parent / 'attempt01'
LATEST = H.parent / 'attempt04'
LAB = ROOT / 'experiments/ic_search_lab'
SINGLE = H.parent / 'attempt08'
PB = ROOT / 'experiments/native_octane_20261107/attempt02'
LABELS = ['COLD_ENTRY']
PARENTS = dict(COLD_ENTRY='READ_STORE')
PREVIOUS = H.parent / 'attempt09'
SEED = 2026110810
CONTROLS = ['A', 'PREP2', 'READ_STORE', 'ENTRY1']


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


b = module('frozen_s002_recorder', OLD / 'run.py')
b.H = H
b.LABELS = LABELS
b.SEED = SEED


def verify():
    protocol = b.load(H / 'protocol.json')
    for name, expected in protocol['frozen_files'].items():
        assert b.sha(ROOT / name) == expected, name
    assert b.boot() == b.load(H / 'environment.before.json')['boot_id']
    for name, expected in b.load(H / 'inputs.json')['files'].items():
        assert b.sha(ROOT / name) == expected, name
    for phases in protocol['scripts'].values():
        for script in phases.values():
            assert b.sha(script['path']) == script['sha256']
    for label, manifest in b.load(H / 'source_manifest.json').items():
        for name, expected in manifest['files'].items():
            assert b.sha(H / 'work' / label / name) == expected, (label, name)
    if (H / 'runtime_manifest.json').exists():
        for label, runtime in b.load(H / 'runtime_manifest.json').items():
            assert b.sha(runtime['path']) == runtime['sha256']
            assert b.sha(H / 'work' / label / 'qjsc') == runtime['qjsc_sha256']
    if (H / 'runtime_frozen.json').exists():
        assert b.sha(H / 'runtime_manifest.json') == b.load(H / 'runtime_frozen.json')['sha256']
    return protocol


b.verify = verify


def checked(command, stage, name, cwd=None, timeout=180):
    result = b.capture(command, stage, name, timeout, cwd=cwd)
    assert result['exit_code'] == 0 and not result['timeout'], result['stderr'][-3000:]
    if stage not in ['build', 'native_build']:
        assert not result['stderr'], result['stderr'][-3000:]
    return result


def prepare():
    assert not (H / 'protocol.json').exists() and not (H / 'work').exists()
    os.sched_setaffinity(0, {2})
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    with tarfile.open(LAB / 'v3_mass_search/build_support.tar.gz') as archive:
        support = archive.extractfile('compat/test-closefrom.c').read()
    manifests = {}
    for label in LABELS:
        original = variants.parent(label)
        files = variants.render(label)
        dest = H / 'work' / label
        dest.mkdir(parents=True)
        for name, text in files.items():
            (dest / name).write_bytes(text.encode())
        (dest / 'compat').mkdir()
        (dest / 'compat/test-closefrom.c').write_bytes(support)
        patch = ''.join(''.join(difflib.unified_diff(original[name].splitlines(True), text.splitlines(True),
                         fromfile='a/' + name, tofile='b/' + name))
                        for name, text in files.items() if text != original[name])
        b.save('patches/' + label + '.patch', patch)
        manifests[label] = dict(parent=PARENTS[label],
            files={name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()},
            changed_files=[name for name in files if files[name] != original[name]],
            record_and_function_header_definitions_unchanged=True,
            support_sha256=hashlib.sha256(support).hexdigest())
    b.save('source_manifest.json', manifests)
    b.save('inputs.json', b.load(OLD / 'inputs.json'))
    b.save('environment.before.json', b.environment())
    tests = [LAB / 'checks.js', LAB / 'v3_mass_search/semantic.js',
             LAB / 'v6_targeted_ic/targeted.js', PB / 'combined.js',
             LATEST / 'extra.js', LATEST / 'old_layout.js', H / 'targeted.js',
             ROOT / 'experiments/read_ic_mic/attempt01/correctness/read_roundtrip.c',
             ROOT / 'experiments/read_ic_mic/attempt01/correctness/gc_cycles.c',
             LATEST / 'reentrant_store.c']
    paths = [H / 'run.py', H / 'variants.py', H / 'probe.c', PREVIOUS / 'source_manifest.json', PREVIOUS / 'build/COLD_ENTRY.json', PREVIOUS / 'diagnostics/probe_fixed.c', PREVIOUS / 'diagnostics/result.json', OLD / 'run.py', OLD / 'protocol.json',
             PARENT / 'variants.py', PARENT / 'source_manifest.json', SINGLE / 'variants.py', SINGLE / 'source_manifest.json',
             LATEST / 'variants.py', LATEST / 'source_manifest.json', *tests]
    for path in [OLD, PARENT, LATEST, SINGLE]:
        paths += [path / 'runtime_manifest.json', path / 'raw/archive.json']
    original = b.load(OLD / 'protocol.json')
    b.save('protocol.json', dict(cohort_id='native-ubuntu-cold-entry-trampoline-20261108-attempt10',
        labels=LABELS, parents=PARENTS, repetitions=5, seed=SEED, affinity=[2], cases=original['cases'],
        N=original['N'], scripts=original['scripts'], metric=original['metric'], warmup_calls=0,
        build_flags='GCC15.2; -O2 -g -fwrapv -DHAVE_CLOSEFROM; no added NDEBUG/LTO/PGO/march=native',
        frozen_files={str(p.relative_to(ROOT)): b.sha(p) for p in paths},
        new_performance_samples=85, new_control_samples=0, controls_reused=CONTROLS,
        same_boot_as_parents=all(b.boot() == b.load(path / 'environment.before.json')['boot_id'] for path in [OLD, PARENT, LATEST]),
        transformation='first-call cold function class rejoins ordinary bytecode class; parent warm JS_CallInternal source identical; no benchmark identification',
        preserved='24-byte records, 144-byte function header and parent warm interpreter source; P1/B2/shared-store semantics',
        desired_outcome='lower overall time than frozen READ_STORE; report all cases and all regressions',
        interpretation='cross-batch exploratory; independent whole-round bootstrap excludes unobserved drift; no proof of noninferiority from five samples',
        correctness='semantic, constructor/new.target/bind/Proxy/realm, argument lifetime, cold closure GC, roundtrip/GC/reentrant store, ASan/UBSan, first-entry OOM, 17 N1 gates',
        LSan='disabled: unavailable in existing sandbox checks',
        preserve_slow_samples=True, no_automatic_failure_retry=True, SunSpider=False, V8_OFF=False))
    verify()
    print('PREPARED_COLD_ENTRY', flush=True)


def qualify():
    verify()
    os.sched_setaffinity(0, {2})
    identities, all_checks = {}, []
    tests = [LAB / 'checks.js', LAB / 'v3_mass_search/semantic.js',
             LAB / 'v6_targeted_ic/targeted.js', PB / 'combined.js',
             LATEST / 'extra.js', LATEST / 'old_layout.js', H / 'targeted.js']
    native = [ROOT / 'experiments/read_ic_mic/attempt01/correctness' / (name + '.c')
              for name in ['read_roundtrip', 'gc_cycles']] + [LATEST / 'reentrant_store.c']
    sanitizer_env = ['env', 'ASAN_OPTIONS=detect_leaks=0:abort_on_error=1',
                     'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1']
    for label in LABELS:
        verify()
        dest = H / 'work' / label
        old_manifest = b.load(PREVIOUS / 'source_manifest.json')[label]['files']
        assert b.load(H / 'source_manifest.json')[label]['files'] == old_manifest
        for name, expected in old_manifest.items():
            assert b.sha(PREVIOUS / 'work' / label / name) == expected
        for name in ['qjs', 'qjsc']:
            shutil.copy2(PREVIOUS / 'work' / label / name, dest / name)
        shutil.copytree(PREVIOUS / 'work' / label / '.obj', dest / '.obj')
        result = b.load(PREVIOUS / 'build' / (label + '.json'))
        b.save('build_reuse/' + label + '.json', dict(previous_attempt=str(PREVIOUS),
            original_build_record_sha256=b.sha(PREVIOUS / 'build' / (label + '.json')),
            reused_qjs_sha256=b.sha(dest / 'qjs'), reused_qjsc_sha256=b.sha(dest / 'qjsc'),
            sources_identical=True, new_compilation=False))
        line = next(s for s in result['stdout'].splitlines() if ' -c -o .obj/quickjs.o ' in s)
        assert all(flag in line for flag in ['-O2', '-g', '-fwrapv', '-DHAVE_CLOSEFROM'])
        assert not any(flag in line for flag in ['-O3', '-flto', '-DNDEBUG', '-fprofile', '-march=native'])
        b.save('build/' + label + '.json', result)
        identities[label] = dict(path=str(dest / 'qjs'), sha256=b.sha(dest / 'qjs'),
            qjsc_sha256=b.sha(dest / 'qjsc'), compile_line=line)
        checks = []
        for test in tests:
            result = checked([dest / 'qjs', '--std', test], 'semantic', label + '/' + str(test.relative_to(ROOT)))
            checks.append(result['token'])
        core = [dest / '.obj' / (name + '.o') for name in ['quickjs', 'dtoa', 'libregexp', 'libunicode', 'cutils']]
        for test in native:
            target = H / 'work' / (label + '.' + test.stem)
            checked(['gcc', '-O2', '-g', '-I' + str(dest), test, *core,
                     '-lm', '-lpthread', '-ldl', '-o', target], 'native_build', label + '/' + test.stem)
            result = checked([target], 'native_check', label + '/' + test.stem)
            checks.append(result['token'])
        sanitized = H / 'work' / (label + '.sanitized')
        shutil.copytree(dest, sanitized, ignore=shutil.ignore_patterns('.obj', 'qjs', 'qjsc'))
        old_sanitized = PREVIOUS / 'work' / (label + '.sanitized')
        for name, expected in old_manifest.items():
            assert b.sha(old_sanitized / name) == expected
        for name in ['qjs', 'qjsc']:
            shutil.copy2(old_sanitized / name, sanitized / name)
        shutil.copytree(old_sanitized / '.obj', sanitized / '.obj')
        b.save('build_reuse/' + label + '.sanitized.json', dict(previous_attempt=str(PREVIOUS),
            qjs_sha256=b.sha(sanitized / 'qjs'), qjsc_sha256=b.sha(sanitized / 'qjsc'),
            sources_identical=True, new_compilation=False))
        for test in [PB / 'combined.js', LATEST / 'extra.js', H / 'targeted.js', LAB / 'v3_mass_search/semantic.js']:
            result = checked([*sanitizer_env, sanitized / 'qjs', '--std', test],
                             'sanitizer', label + '/' + str(test.relative_to(ROOT)))
            checks.append(result['token'])
        core = [sanitized / '.obj/asan/ubsan' / (name + '.o')
                for name in ['quickjs', 'dtoa', 'libregexp', 'libunicode', 'cutils']]
        for test in native:
            target = H / 'work' / (label + '.sanitized.' + test.stem)
            checked(['gcc', '-O2', '-g', '-fsanitize=address,undefined', '-fno-omit-frame-pointer',
                     '-I' + str(sanitized), test, *core, '-lm', '-lpthread', '-ldl', '-o', target],
                    'native_build', label + '/sanitized/' + test.stem)
            result = checked([*sanitizer_env, target], 'sanitizer_native', label + '/' + test.stem)
            checks.append(result['token'])
        probe_source = H / 'work' / (label + '.probe')
        shutil.copytree(PREVIOUS / 'work' / (label + '.probe'), probe_source)
        assert b.sha(H / 'probe.c') == b.sha(PREVIOUS / 'diagnostics/probe_fixed.c')
        prior_probe = b.load(PREVIOUS / 'diagnostics/result.json')
        assert prior_probe['status'] == 'PASS_TARGETED'
        target = probe_source / 'probe'
        shutil.copy2(PREVIOUS / 'work/probe_fixed', target)
        assert b.sha(target) == prior_probe['probe_sha256']
        b.save('probe_reuse.json', dict(previous_result_sha256=b.sha(PREVIOUS / 'diagnostics/result.json'),
            probe_source_sha256=b.sha(H / 'probe.c'), probe_binary_sha256=b.sha(target), candidate_sources_identical=True))
        result = checked([*sanitizer_env, target], 'mechanism_probe', label)
        assert 'MECHANISM_PASS' in result['stdout']
        checks.append(result['token'])
        b.save('mechanism/' + label + '.json', dict(status='PASS', stdout=result['stdout'],
            diagnostic_sources={n: b.sha(probe_source / n) for n in b.load(H / 'source_manifest.json')[label]['files']},
            binary_sha256=b.sha(target), isolated_from_performance=True))
        b.save('safety/' + label + '.json', dict(status='PASS_TARGETED', checks=checks,
            ASan=True, UBSan=True, LSan=False, full_test262=False))
        all_checks.extend(checks)
        print('SAFETY_PASS', label, len(checks), flush=True)
    b.save('runtime_manifest.json', identities)
    b.save('targeted_gate.json', dict(status='PASS_TARGETED', checks=all_checks,
                                    ASan=True, UBSan=True, LSan=False, full_test262=False))
    b.save('runtime_frozen.json', dict(sha256=b.sha(H / 'runtime_manifest.json')))
    b.correctness()
    verify()
    print('QUALIFIED_COLD_ENTRY_AND_17_WORKLOADS', flush=True)


def read_archive(path):
    packed = (path / 'raw/runs.jsonl.gz').read_bytes()
    raw = gzip.decompress(packed)
    identity = b.load(path / 'raw/archive.json')
    assert hashlib.sha256(packed).hexdigest() == identity['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest() == identity['uncompressed_sha256']
    return [json.loads(line) for line in raw.splitlines()]


def csvout(name, rows):
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream, list(rows[0]), lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
    (H / name).write_text(stream.getvalue())


def gm(ratios):
    groups = collections.defaultdict(list)
    for case, value in ratios.items():
        groups[case.split('.')[0]].append(math.log(value))
    return math.exp(st.mean(st.mean(v) for v in groups.values()))


def analyze():
    verify()
    new = [r for r in b.records() if r['event'] == 'measurement']
    assert len(new) == 85 and all(r['valid'] and r['condition'] in LABELS for r in new)
    old = [r for path in [OLD, PARENT, LATEST, SINGLE] for r in read_archive(path)
           if r['event'] == 'measurement' and r['condition'] in CONTROLS]
    values = collections.defaultdict(dict)
    for r in new + old:
        key = r['condition'], r['case']
        assert r['rep'] not in values[key]
        values[key][r['rep']] = r['payload']['elapsed_ms'] / r['N']
    assert all(set(v) == set(range(5)) for v in values.values())
    med = {key: st.median(v.values()) for key, v in values.items()}
    cases = b.load(H / 'inputs.json')['cases']
    stats = []
    for label in LABELS:
        for case in cases:
            nums = sorted(values[label, case].values())
            stats.append(dict(case=case, condition=label, N=b.load(H / 'inputs.json')['N'][case], n=5,
                median_ms=med[label, case], mean_ms=st.mean(nums), sample_stddev=st.stdev(nums),
                CV_pct=100 * st.stdev(nums) / st.mean(nums), q1=st.median(nums[:2]),
                q3=st.median(nums[-2:]), min=min(nums), max=max(nums),
                over_A=med[label, case] / med['A', case],
                over_parent=med[label, case] / med[PARENTS[label], case]))
    csvout('statistics.csv', stats)
    rng = random.Random(SEED)
    draws = [(tuple(sorted(rng.choices(range(5), k=5))),
              tuple(sorted(rng.choices(range(5), k=5)))) for _ in range(10000)]
    unique = {i for pair in draws for i in pair}
    sampled = {(key, i): st.median(v[j] for j in i) for key, v in values.items() for i in unique}
    comparisons, aggregates = [], []
    for label in LABELS:
        for control in CONTROLS:
            for case in cases:
                ratio = med[label, case] / med[control, case]
                dist = sorted(sampled[((label, case), ni)] / sampled[((control, case), oi)] for ni, oi in draws)
                comparisons.append(dict(condition=label, case=case, denominator=control,
                    control_ms=med[control, case], candidate_ms=med[label, case], ratio=ratio,
                    change_pct=100 * (ratio - 1), low95=dist[249], high95=dist[9749]))
            for subset in ['core16_13suite', 'expanded17_14suite']:
                selected = [c for c in cases if subset.startswith('expanded') or c != 'zlib.zlib']
                ratio = gm({c: med[label, c] / med[control, c] for c in selected})
                a = {i: math.log(gm({c: sampled[((label, c), i)] for c in selected})) for i in unique}
                z = {i: math.log(gm({c: sampled[((control, c), i)] for c in selected})) for i in unique}
                dist = sorted(math.exp(a[ni] - z[oi]) for ni, oi in draws)
                aggregates.append(dict(condition=label, denominator=control, subset=subset,
                    ratio=ratio, change_pct=100 * (ratio - 1), low95=dist[249], high95=dist[9749],
                    inference='independent whole-round bootstrap across batches; drift not included'))
    csvout('per_case_comparisons.csv', comparisons)
    csvout('aggregate.csv', aggregates)
    targets = ['Splay.Splay', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery']
    assessment = []
    for label in LABELS:
        parent = PARENTS[label]
        other = [r for r in comparisons if r['condition'] == label and r['denominator'] == parent and r['case'] not in targets]
        worst = max(other, key=lambda r: r['ratio'])
        assessment.append(dict(condition=label, parent=parent,
            all_three_within_1pct_of_A_point_estimate=all(med[label, c] <= med['A', c] * 1.01 for c in targets),
            other_case_median_regressions=sum(r['ratio'] > 1 for r in other),
            other_case_regression_intervals_above_one=sum(r['low95'] > 1 for r in other),
            worst_other_case=worst['case'], worst_other_change_pct=worst['change_pct'],
            interpretation='descriptive point checks; no confirmed noninferiority from cross-batch screening'))
    b.save('migration_assessment.json', assessment)
    lines = ['# 一次性冷函数入口修订', '',
        '每个组合17项各5个新进程，共85条新性能样本；旧对照复用。',
        'COLD_ENTRY基于READ_STORE，一个固定ELF完整跑17项；ENTRY1另作旧参考。',
        '单位ms/完整Run，五进程中位数。变化为候选/其直接父版-1，负数更快。跨批次探索，区间不含未观测到的环境漂移。', '',
        '|case|A|READ_STORE|COLD_ENTRY|相对READ_STORE|',
        '|---|---:|---:|---:|---:|']
    for case in cases:
        cells = [case, f'{med["A", case]:.5f}', f'{med["READ_STORE", case]:.5f}']
        for label in LABELS:
            parent = PARENTS[label]
            cells += [f'{med[label, case]:.5f}',
                      f'{100 * (med[label, case] / med[parent, case] - 1):+.2f}%']
        lines.append('|' + '|'.join(cells) + '|')
    lines += ['', '|版本|集合|对照|耗时变化|比值95%探索区间|', '|---|---|---|---:|---:|']
    for row in aggregates:
        lines.append(f'|{row["condition"]}|{row["subset"]}|{row["denominator"]}|{row["change_pct"]:+.2f}%|[{row["low95"]:.6f}, {row["high95"]:.6f}]|')
    lines += ['', '专项语义、C API保存加载/GC/native finalizer、ASan/UBSan和17条负载正确性通过；LSan关闭，不是完整test262。',
              '全部有效慢点保留，没有新A/V8_ON/V8_OFF/SunSpider性能样本。', '']
    (H / 'results.md').write_text('\n'.join(lines))
    print('ANALYSIS_COMPLETE', json.dumps([r for r in aggregates if r['denominator'] in ['A', PARENTS[r['condition']]]]), flush=True)


def audit():
    verify()
    rows = b.records()
    starts = {r['token']: r for r in rows if r['event'] == 'process_start'}
    ends = {r['token']: r for r in rows if r['event'] == 'process_result'}
    assert starts.keys() == ends.keys() and len(starts) == sum(r['event'] == 'process_start' for r in rows)
    for token, result in ends.items():
        assert result['command'] == starts[token]['command']
        assert result['exit_code'] == 0 and not result['timeout']
        assert result['boot_id'] == result['boot_id_after'] == b.boot()
    ordered = sorted(ends.values(), key=lambda r: r['outer_start_ns'])
    assert all(a['outer_stop_ns'] <= z['outer_start_ns'] for a, z in zip(ordered, ordered[1:]))
    samples = [r for r in rows if r['event'] == 'measurement']
    correct = [r for r in rows if r['event'] == 'correctness']
    assert len(samples) == 85 and len(correct) == 17 and all(r['valid'] for r in samples + correct)
    assert [dict(rep=r['rep'], case=r['case'], condition=r['condition'], order=r['order']) for r in samples] == b.schedule()
    forbidden = {item['path'] for path in [OLD, PARENT, LATEST, SINGLE]
                 for item in b.load(path / 'runtime_manifest.json').values()}
    assert all(r['command'][0] not in forbidden for r in ends.values())
    b.save('audit.json', dict(status='PASS_COMPLETE', new_performance_samples=85,
        new_control_samples=0, correctness_samples=17, samples_per_case_and_variant=5,
        frozen_files_and_inputs_verified=True, serial_order_and_schedule_verified=True,
        changes_match_declared_variants=True, record_and_function_header_definitions_unchanged=True, mechanism_probes="PASS_TARGETED",
        semantic_and_C_API_checks='PASS_TARGETED', ASan=True, UBSan=True, LSan=False, full_test262=False,
        below_1000ms_retained=sum(r['below_1000ms'] for r in samples),
        max_raw_clock_disagreement_ms=max(abs(r['raw_minus_monotonic_ms']) for r in ends.values()),
        SunSpider_samples=0, V8_OFF_samples=0))
    raw = (H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    b.save('raw/runs.jsonl.gz', packed)
    b.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),
                                   uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    print('AUDIT_PASS_85_COLD_ENTRY_ONLY', flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('stage', choices=['prepare', 'qualify', 'measure', 'analyze', 'audit', 'all'])
    args = parser.parse_args()
    if args.stage in ['prepare', 'all']:
        prepare()
    if args.stage in ['qualify', 'all']:
        qualify()
    if args.stage in ['measure', 'all']:
        verify()
        assert b.load(H / 'targeted_gate.json')['status'] == 'PASS_TARGETED'
        assert (H / 'runtime_frozen.json').exists()
        b.measure()
    if args.stage in ['analyze', 'all']:
        analyze()
    if args.stage in ['audit', 'all']:
        audit()


if __name__ == '__main__':
    main()

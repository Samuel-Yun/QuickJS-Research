"""Exact historical S002 replication; five fresh processes per Octane case.

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

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
OLD = ROOT / 'experiments/native_octane_20261107/attempt01'
PARENT = H.parent / 'attempt01'
LATEST = H.parent / 'attempt04'
LAB = ROOT / 'experiments/ic_search_lab'
SEED = 2026110805
CONTROLS = ['A', 's001', 'PREP2', 'READ_STORE']


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


b = module('frozen_s002_recorder', OLD / 'run.py')
b.H = H
b.LABELS = ['S002']
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
    for name, expected in b.load(H / 'source_manifest.json')['files'].items():
        assert b.sha(H / 'work/S002' / name) == expected, name
    if (H / 'runtime_manifest.json').exists():
        runtime = b.load(H / 'runtime_manifest.json')['S002']
        assert b.sha(runtime['path']) == runtime['sha256']
        assert b.sha(H / 'work/S002/qjsc') == runtime['qjsc_sha256']
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
    generator = LAB / 'v3_mass_search/generate.py'
    identity_path = LAB / 'v3_mass_search/identities/S002.json'
    identity = b.load(identity_path)
    assert b.sha(generator) == identity['generator_sha256']
    for name, expected in identity['templates_sha256'].items():
        assert b.sha(generator.parent / 'templates' / name) == expected
    gen = module('frozen_s002_generator', generator)
    row = dict(id='S002', family='S', parent='A', max_props=2,
               scan='forward', coverage='all_own_descriptors')
    files, config, parent, reason = gen.render(row)
    assert parent == 'A' and reason is None and config == identity['effective_config']
    hashes = {name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()}
    assert hashes == identity['source_sha256_before_build'] == identity['source_sha256_after_build']
    patch = LAB / 'v3_mass_search/patches/S002.patch'
    assert b.sha(patch) == identity['patch_sha256']
    assert gen.patch_text(files, 'A') == patch.read_text()
    dest = H / 'work/S002'
    dest.mkdir(parents=True)
    for name, text in files.items():
        (dest / name).write_bytes(text.encode())
    with tarfile.open(generator.parent / 'build_support.tar.gz') as archive:
        support = archive.extractfile('compat/test-closefrom.c').read()
    assert hashlib.sha256(support).hexdigest() == identity['build_support_files']['compat/test-closefrom.c']
    (dest / 'compat').mkdir()
    (dest / 'compat/test-closefrom.c').write_bytes(support)
    b.save('patches/S002.from_A.patch', patch.read_bytes())
    b.save('source_manifest.json', dict(parent='A', files=hashes,
        support_sha256=hashlib.sha256(support).hexdigest(), historical_source_hash_match=True,
        effective_config=config, changed_from_A=['quickjs.c', 'read_ic_config.h']))
    b.save('inputs.json', b.load(OLD / 'inputs.json'))
    b.save('environment.before.json', b.environment())
    paths = [H / 'run.py', H / 'targeted.js', OLD / 'run.py', OLD / 'protocol.json',
             OLD / 'runtime_manifest.json', OLD / 'raw/archive.json',
             PARENT / 'runtime_manifest.json', PARENT / 'raw/archive.json',
             LATEST / 'runtime_manifest.json', LATEST / 'raw/archive.json',
             generator, identity_path, patch, LAB / 'checks.js',
             generator.parent / 'semantic.js', LAB / 'v6_targeted_ic/targeted.js',
             ROOT / 'experiments/read_ic_mic/attempt01/correctness/read_roundtrip.c',
             ROOT / 'experiments/read_ic_mic/attempt01/correctness/gc_cycles.c']
    original = b.load(OLD / 'protocol.json')
    b.save('protocol.json', dict(cohort_id='native-ubuntu-s002-exact-replication-20261108-attempt06',
        labels=['S002'], repetitions=5, seed=SEED, affinity=[2], cases=original['cases'],
        N=original['N'], scripts=original['scripts'], metric=original['metric'], warmup_calls=0,
        build_flags='GCC15.2; -O2 -g -fwrapv -DHAVE_CLOSEFROM; no added NDEBUG/LTO/PGO/march=native',
        frozen_files={str(p.relative_to(ROOT)): b.sha(p) for p in paths},
        new_performance_samples=85, new_control_samples=0, controls_reused=CONTROLS,
        same_boot_as_A=b.boot() == b.load(OLD / 'environment.before.json')['boot_id'],
        same_boot_as_PREP2=b.boot() == b.load(PARENT / 'environment.before.json')['boot_id'],
        source='exact historical S002 from A; no PREP2/S002 combination',
        interpretation='cross-batch exploratory comparison; independent whole-round bootstrap; unobserved drift excluded',
        correctness='existing semantic checks, focused small-object descriptors, public C API roundtrip and GC, 17 N1 workload gates',
        sanitizers='not rerun for this exact-source performance replication',
        preserve_slow_samples=True, no_automatic_failure_retry=True, SunSpider=False, V8_OFF=False))
    verify()
    print('PREPARED_S002_EXACT_28_SOURCE_HASHES', flush=True)


def qualify():
    verify()
    os.sched_setaffinity(0, {2})
    dest = H / 'work/S002'
    result = checked(['make', '-j1', 'qjs', 'qjsc'], 'build', 'S002', dest, 300)
    line = next(s for s in result['stdout'].splitlines() if ' -c -o .obj/quickjs.o ' in s)
    assert all(flag in line for flag in ['-O2', '-g', '-fwrapv', '-DHAVE_CLOSEFROM'])
    assert not any(flag in line for flag in ['-O3', '-flto', '-DNDEBUG', '-fprofile', '-march=native'])
    b.save('build/S002.json', result)
    b.save('runtime_manifest.json', dict(S002=dict(path=str(dest / 'qjs'),
        sha256=b.sha(dest / 'qjs'), qjsc_sha256=b.sha(dest / 'qjsc'), compile_line=line)))
    tests = [LAB / 'checks.js', LAB / 'v3_mass_search/semantic.js',
             LAB / 'v6_targeted_ic/targeted.js', H / 'targeted.js']
    checks = []
    for test in tests:
        result = checked([dest / 'qjs', '--std', test], 'semantic', str(test.relative_to(ROOT)))
        checks.append(dict(name=test.name, token=result['token'], stdout=result['stdout']))
    core = [dest / '.obj' / (name + '.o') for name in ['quickjs', 'dtoa', 'libregexp', 'libunicode', 'cutils']]
    for name in ['read_roundtrip', 'gc_cycles']:
        test = ROOT / 'experiments/read_ic_mic/attempt01/correctness' / (name + '.c')
        target = H / 'work' / name
        checked(['gcc', '-O2', '-g', '-I' + str(dest), test, *core,
                 '-lm', '-lpthread', '-ldl', '-o', target], 'native_build', name)
        result = checked([target], 'native_check', name)
        checks.append(dict(name=name, token=result['token'], stdout=result['stdout']))
    b.save('targeted_gate.json', dict(status='PASS_TARGETED', checks=checks, full_test262=False,
                                    source_unchanged_from_historical_S002=True, sanitizer_rerun=False))
    b.save('runtime_frozen.json', dict(sha256=b.sha(H / 'runtime_manifest.json')))
    b.correctness()
    verify()
    print('QUALIFIED_S002_TARGETED_AND_17_WORKLOADS', flush=True)


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
    assert len(new) == 85 and all(r['valid'] and r['condition'] == 'S002' for r in new)
    old = [r for path in [OLD, PARENT, LATEST] for r in read_archive(path)
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
    for case in cases:
        nums = sorted(values['S002', case].values())
        stats.append(dict(case=case, condition='S002', N=b.load(H / 'inputs.json')['N'][case], n=5,
            median_ms=med['S002', case], mean_ms=st.mean(nums), sample_stddev=st.stdev(nums),
            CV_pct=100 * st.stdev(nums) / st.mean(nums), q1=st.median(nums[:2]),
            q3=st.median(nums[-2:]), min=min(nums), max=max(nums),
            over_A=med['S002', case] / med['A', case],
            over_PREP2=med['S002', case] / med['PREP2', case]))
    csvout('statistics.csv', stats)
    rng = random.Random(SEED)
    draws = [(tuple(sorted(rng.choices(range(5), k=5))),
              tuple(sorted(rng.choices(range(5), k=5)))) for _ in range(10000)]
    unique = {i for pair in draws for i in pair}
    sampled = {(key, i): st.median(v[j] for j in i) for key, v in values.items() for i in unique}
    comparisons, aggregates = [], []
    for control in CONTROLS:
        for case in cases:
            ratio = med['S002', case] / med[control, case]
            dist = sorted(sampled[(('S002', case), ni)] / sampled[((control, case), oi)] for ni, oi in draws)
            comparisons.append(dict(condition='S002', case=case, denominator=control,
                control_ms=med[control, case], candidate_ms=med['S002', case], ratio=ratio,
                change_pct=100 * (ratio - 1), low95=dist[249], high95=dist[9749]))
        for subset in ['core16_13suite', 'expanded17_14suite']:
            selected = [c for c in cases if subset.startswith('expanded') or c != 'zlib.zlib']
            ratio = gm({c: med['S002', c] / med[control, c] for c in selected})
            a = {i: math.log(gm({c: sampled[(('S002', c), i)] for c in selected})) for i in unique}
            z = {i: math.log(gm({c: sampled[((control, c), i)] for c in selected})) for i in unique}
            dist = sorted(math.exp(a[ni] - z[oi]) for ni, oi in draws)
            aggregates.append(dict(condition='S002', denominator=control, subset=subset,
                ratio=ratio, change_pct=100 * (ratio - 1), low95=dist[249], high95=dist[9749],
                inference='independent whole-round bootstrap across batches; drift not included'))
    csvout('per_case_comparisons.csv', comparisons)
    csvout('aggregate.csv', aggregates)
    lines = ['# S002原生Ubuntu五轮复现', '',
        '28个源码文件与旧S002逐一SHA一致，直接基于A，不是PREP2组合。',
        '只新增85条性能样本，17条N1正确性；A/s001/PREP2/READ_STORE复用已有Ubuntu结果。',
        '单位ms/完整Run，五进程中位数；变化为候选/对照-1，负数更快。跨批次比较，探索区间不含未观测到的环境漂移。', '',
        '|case|A|PREP2|READ_STORE|S002|相对A|相对PREP2|',
        '|---|---:|---:|---:|---:|---:|---:|']
    for case in cases:
        lines.append('|' + '|'.join([case, *[f'{med[label, case]:.5f}' for label in ['A', 'PREP2', 'READ_STORE', 'S002']],
            f'{100 * (med["S002", case] / med["A", case] - 1):+.2f}%',
            f'{100 * (med["S002", case] / med["PREP2", case] - 1):+.2f}%']) + '|')
    lines += ['', '|集合|对照|S002耗时变化|比值95%探索区间|', '|---|---|---:|---:|']
    for row in aggregates:
        lines.append(f'|{row["subset"]}|{row["denominator"]}|{row["change_pct"]:+.2f}%|[{row["low95"]:.6f}, {row["high95"]:.6f}]|')
    lines += ['', '全部有效慢样本保留。基本语义、小对象descriptor、C API保存加载/GC及17项负载正确性通过；本次精确源码复现未重跑sanitizer或完整test262。',
              '输入/N/首次Run计时边界和CPU2沿用旧Ubuntu协议。没有新A/V8_ON/V8_OFF/SunSpider性能样本。', '']
    (H / 'results.md').write_text('\n'.join(lines))
    print('ANALYSIS_COMPLETE', json.dumps(aggregates), flush=True)


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
    forbidden = {item['path'] for path in [OLD, PARENT, LATEST]
                 for item in b.load(path / 'runtime_manifest.json').values()}
    assert all(r['command'][0] not in forbidden for r in ends.values())
    b.save('audit.json', dict(status='PASS_COMPLETE', new_performance_samples=85,
        new_control_samples=0, correctness_samples=17, samples_per_case=5,
        historical_source_hashes_match=True, frozen_files_and_inputs_verified=True,
        serial_order_and_schedule_verified=True, semantic_and_C_API_checks='PASS_TARGETED',
        sanitizer_rerun=False, full_test262=False,
        below_1000ms_retained=sum(r['below_1000ms'] for r in samples),
        max_raw_clock_disagreement_ms=max(abs(r['raw_minus_monotonic_ms']) for r in ends.values()),
        SunSpider_samples=0, V8_OFF_samples=0))
    raw = (H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    b.save('raw/runs.jsonl.gz', packed)
    b.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),
                                   uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    print('AUDIT_PASS_85_NEW_S002_ONLY', flush=True)


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

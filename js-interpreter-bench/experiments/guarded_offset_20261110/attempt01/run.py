"""One complete Octane pass of GUARDED_OFFSET; historical controls only."""
import collections
import csv
import importlib.util
import io
import json
import math
import os
from pathlib import Path
import statistics

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OLD = ROOT / 'experiments/native_confirmation_20261108/attempt02'
spec = importlib.util.spec_from_file_location('offset_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)
b.H = HERE


def verify(protocol):
    manifest = b.load(HERE / 'build_manifest.json')
    assert b.sha(protocol['binary']) == protocol['binary_sha256']
    for name, digest in manifest['sources'].items():
        assert b.sha(Path(protocol['binary']).parent / name) == digest
    for name, digest in manifest['parent_sources'].items():
        assert b.sha(Path(manifest['parent']) / name) == digest
    assert b.sha(Path(manifest['parent']) / 'qjs') == manifest['parent_elf_sha256']
    for case, script in protocol['scripts'].items():
        assert b.sha(script['path']) == script['sha256'], case
    for name, digest in protocol['input_hashes'].items():
        assert b.sha(ROOT / name) == digest, name
    for name, digest in protocol['tooling_hashes'].items():
        assert b.sha(HERE / name) == digest, name
    assert b.boot() == protocol['boot_id']


def gm(values):
    groups = collections.defaultdict(list)
    for case, value in values.items():
        groups[case.split('.')[0]].append(math.log(value))
    assert len(groups) == 14 and len(values) == 17
    return math.exp(statistics.mean(statistics.mean(v) for v in groups.values()))


def analyze():
    protocol = b.load(HERE / 'protocol.json')
    samples = [r for r in b.records() if r['event'] == 'measurement']
    assert len(samples) == 17 and all(r['valid'] for r in samples)
    assert len({r['case'] for r in samples}) == 17
    historical = list(csv.DictReader((OLD / 'statistics.csv').open()))
    controls = {(r['case'], r['condition']): float(r['median_ms'])
                for r in historical if r['kind'] == 'octane'}
    rows = []
    for case in protocol['cases']:
        sample = next(r for r in samples if r['case'] == case)
        value = sample['elapsed_per_Run_ms']
        a, parent = controls[case, 'A'], controls[case, 'EVAL_COLD']
        rows.append(dict(case=case, A_historical_30_median_ms=a,
            EVAL_COLD_historical_30_median_ms=parent, GUARDED_OFFSET_single_ms=value,
            vs_parent_pct=100 * (value / parent - 1), vs_A_pct=100 * (value / a - 1)))
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream, fieldnames=list(rows[0]), lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
    b.save('comparison.csv', stream.getvalue())
    aggregate = dict(vs_parent_pct=100 * (gm({r['case']: r['GUARDED_OFFSET_single_ms'] / r['EVAL_COLD_historical_30_median_ms'] for r in rows}) - 1),
                     vs_A_pct=100 * (gm({r['case']: r['GUARDED_OFFSET_single_ms'] / r['A_historical_30_median_ms'] for r in rows}) - 1),
                     estimator='14 suites equal; geometric mean within each suite',
                     candidate_samples_per_case=1, historical_samples_per_case=30,
                     inference='exploratory; non-contemporaneous controls; no confidence intervals')
    b.save('aggregate.json', aggregate)
    lines = ['# GUARDED_OFFSET：完整 Octane 单轮', '',
        '新版本在 EVAL_COLD 上增加非驻留 shape 的自身属性位置提示。原快速命中路径不增加逻辑；现有 fallback 增加提示探测。',
        '未扩大类型范围，不缓存原型属性，不更改冷函数准备策略。ReadICSite 仍为24字节。', '',
        '单位 ms/完整 Run。新版本每项仅一个新进程；A/EVAL_COLD 引用此前30轮中位数，没有重跑。',
        '脚本字节、N、CPU2、TZ/locale及计时边界沿用之前确认实验；无工作负载预热，首次Run包含。',
        '跨批次单轮仅用于筛选，不能据此确认无退化。SunSpider未运行。', '',
        '|表项|A（旧30轮）|EVAL_COLD（旧30轮）|GUARDED_OFFSET（新1轮）|相对EVAL_COLD|相对A|',
        '|---|---:|---:|---:|---:|---:|']
    for r in rows:
        lines.append(f"|{r['case']}|{r['A_historical_30_median_ms']:.4f}|{r['EVAL_COLD_historical_30_median_ms']:.4f}|{r['GUARDED_OFFSET_single_ms']:.4f}|{r['vs_parent_pct']:+.2f}%|{r['vs_A_pct']:+.2f}%|")
    lines += ['', f"整体耗时变化：相对 EVAL_COLD {aggregate['vs_parent_pct']:+.3f}%，相对 A {aggregate['vs_A_pct']:+.3f}%。",
        '整体沿用原14个suite等权、suite内子项取几何平均的口径。负数表示耗时降低。', '',
        '正确性：新Release和独立ASan+UBSan构建均通过194项针对性断言；完整17项运行均通过原校验。',
        '独立计数构建的16次Math.sqrt读取：1次延迟初始化、1次位置提示填充、14次位置命中。计数构建不用于性能。',
        '未运行完整test262，也未对完整Octane运行sanitizer；泄漏检测关闭。', '']
    b.save('results.md', '\n'.join(lines))
    verify(protocol)
    b.save('audit.json', dict(status='PASS', new_measurements=17, cases=17, rounds=1,
        fresh_process_per_case=True, all_original_validations_pass=True, parent_unchanged=True,
        scripts_unchanged=True, failed_samples=0, qualification='PASS',
        references='prior 30-round medians; controls not rerun', sunspider_run=False))
    print('COMPLETE', json.dumps(aggregate), flush=True)


def main():
    os.environ.update(TZ='Asia/Shanghai', LC_ALL='C', LANG='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    assert 2 in os.sched_getaffinity(0)
    os.sched_setaffinity(0, {2})
    assert b.load(HERE / 'qualification.json')['status'] == 'PASS'
    manifest = b.load(HERE / 'build_manifest.json')
    old_protocol = b.load(OLD / 'protocol.json')
    info = b.load(OLD / 'octane.inputs.json')
    protocol = dict(label='GUARDED_OFFSET', rounds=1, CPU=2, cases=info['cases'],
        binary=manifest['elf'], binary_sha256=manifest['elf_sha256'], boot_id=b.boot(),
        scripts={case: old_protocol['scripts']['octane'][case]['measure'] for case in info['cases']},
        input_hashes=info['files'], tooling_hashes={name: b.sha(HERE / name) for name in
            ['build.py', 'qualify.py', 'run.py', 'guarded_offset.inc', 'safety.js', 'build_manifest.json']},
        references=str(OLD / 'statistics.csv'), references_sha256=b.sha(OLD / 'statistics.csv'),
        stop_rule='exactly 17 one-shot candidate measurements; retain failures; no automatic retries',
        warmup_calls=0, system_settings_changed=False, controls_rerun=False)
    if (HERE / 'protocol.json').exists():
        assert b.load(HERE / 'protocol.json') == protocol
    else:
        b.save('protocol.json', protocol)
        b.save('environment.before.json', b.environment())
    verify(protocol)
    done = {r['case'] for r in b.records() if r['event'] == 'measurement' and r['valid']}
    for case in protocol['cases']:
        if case in done:
            continue
        script = protocol['scripts'][case]
        command = [protocol['binary']]
        if case == 'zlib.zlib':
            command += ['--std', '-I', str(ROOT / 'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        command.append(script['path'])
        identity = dict(case=case, N=script['N'], binary_sha256=protocol['binary_sha256'], script_sha256=script['sha256'])
        result = b.capture(command, 'measure', case, timeout=300, identity=identity)
        payload, reason = {}, None
        try:
            assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr'], 'exit/timeout/stderr'
            prefix = 'OCTANE_IC_RESULT:'
            output = [s[len(prefix):] for s in result['stdout'].splitlines() if s.startswith(prefix)]
            assert len(output) == 1, 'result count'
            payload = json.loads(output[0])
            assert payload['case'] == case and payload['N'] == script['N'] and payload['phase'] == 'measure'
            assert payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
            assert payload['elapsed_ms'] == payload['stop_ms'] - payload['start_ms']
            assert math.isfinite(payload['elapsed_ms']) and 0 < payload['elapsed_ms'] <= result['external_wall_ms'] + 5
            if case.startswith('Crypto.'):
                gold = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto' / (case + '.N' + str(script['N']) + '.json')
                assert payload['checksum'] == b.load(gold)['final_ciphertext']
            assert result['boot_id'] == result['boot_id_after'] == protocol['boot_id']
            assert abs(result['raw_minus_monotonic_ms']) <= 5 + .002 * result['external_wall_ms']
            assert b.sha(protocol['binary']) == protocol['binary_sha256']
        except (AssertionError, KeyError, ValueError, TypeError) as error:
            reason = str(error)
        row = dict(event='measurement', valid=reason is None, failed_reason=reason, **identity,
            payload=payload, elapsed_per_Run_ms=payload.get('elapsed_ms', 0) / script['N'])
        b.append(row)
        assert row['valid'], 'saved failure, no automatic retry: ' + str(reason)
        print('SAMPLE', case, f"{row['elapsed_per_Run_ms']:.6f}", 'ms/Run', flush=True)
    b.save('environment.after.json', b.environment())
    analyze()


if __name__ == '__main__':
    main()

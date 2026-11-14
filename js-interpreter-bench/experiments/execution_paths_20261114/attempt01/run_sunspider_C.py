"""One SunSpider timing pass of the already frozen candidate C Release ELF."""
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
OUT = HERE / 'sunspider_timing01'
spec = importlib.util.spec_from_file_location('sun_c_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)
b.H = OUT


def verify(protocol, runtime):
    assert b.sha(runtime['elf']) == runtime['elf_sha256']
    for name, digest in runtime['sources'].items():
        rel = 'compat/test-closefrom.c' if name == 'test-closefrom.c' else name
        assert b.sha(Path(runtime['elf']).parent / rel) == digest, name
    for path, digest in protocol['frozen_files'].items():
        assert b.sha(path) == digest, path
    for rel, digest in protocol['input_files'].items():
        assert b.sha(ROOT / rel) == digest, rel
    for case, script in protocol['scripts'].items():
        assert b.sha(script['path']) == script['sha256'], case
    assert b.boot() == protocol['boot_id']


def analyze(protocol):
    events = b.records()
    rows = [r for r in events if r['event'] == 'measurement']
    starts = [r for r in events if r['event'] == 'process_start']
    ends = [r for r in events if r['event'] == 'process_result']
    assert len(rows) == len(starts) == len(ends) == 26
    assert len({r['case'] for r in rows}) == 26 and all(r['valid'] for r in rows)
    historical = {(r['case'], r['condition']): float(r['median_ms'])
                  for r in csv.DictReader((OLD / 'statistics.csv').open()) if r['kind'] == 'sunspider'}
    by_case = {r['case']: r for r in rows}
    table = []
    for case in protocol['scripts']:
        r = by_case[case]
        t = r['payload']['elapsed_ms'] / r['N']
        assert t == r['ms_per_Run']
        a, e, v = [historical[case, label] for label in ['A', 'EVAL_COLD', 'V8_ON']]
        table.append(dict(case=case, A_ms=a, EVAL_COLD_ms=e, C_ms=t, V8_ON_jitless_ms=v,
            EVAL_vs_A_pct=100*(e/a-1), C_vs_A_pct=100*(t/a-1), C_vs_EVAL_pct=100*(t/e-1)))
    s = io.StringIO(newline='')
    writer = csv.DictWriter(s, list(table[0]), lineterminator='\n')
    writer.writeheader(); writer.writerows(table)
    b.save('comparison.csv', s.getvalue())
    summary = {}
    for column, label in [('A_ms', 'A'), ('EVAL_COLD_ms', 'EVAL_COLD'), ('V8_ON_jitless_ms', 'V8_ON')]:
        ratio = math.exp(statistics.mean(math.log(r['C_ms']/r[column]) for r in table))
        # Independent weighted-product calculation against the log mean.
        product = math.prod((r['C_ms']/r[column])**(1/26) for r in table)
        assert abs(product-ratio) < 1e-12
        summary['GM_vs_'+label+'_pct'] = 100*(ratio-1)
        summary['sum_vs_'+label+'_pct'] = 100*(sum(r['C_ms'] for r in table)/sum(r[column] for r in table)-1)
    summary.update(C_sum_ms=sum(r['C_ms'] for r in table), A_sum_ms=sum(r['A_ms'] for r in table),
        EVAL_COLD_sum_ms=sum(r['EVAL_COLD_ms'] for r in table), samples_per_case=1, cases=26,
        references='historical 30-process medians; not contemporaneous controls',
        GM_estimator='26 cases equal weight', timing_unit='ms per complete workload Run')
    b.save('summary.json', summary)
    lines = ['# C：SunSpider 单轮耗时', '',
        'TRANSITION_EDGE_STRONG 原Release ELF；26项各一个新进程，沿用原30轮确认实验脚本与N、CPU2、Asia/Shanghai和C locale。',
        '没有工作负载预热，首次Run包含。A/EVAL_COLD/V8_ON引用旧30轮中位数，没有重跑；本次只测C。',
        '单位 ms/完整Run；括号相对原版A，负数更快。跨批次单轮仅用于筛选。', '',
        '|SunSpider表项|A|EVAL_COLD|C|C相对EVAL_COLD|V8_ON --jitless|',
        '|---|---:|---:|---:|---:|---:|']
    for r in table:
        lines.append(f"|{r['case']}|{r['A_ms']:.4f}|{r['EVAL_COLD_ms']:.4f}（{r['EVAL_vs_A_pct']:+.2f}%）|{r['C_ms']:.4f}（{r['C_vs_A_pct']:+.2f}%）|{r['C_vs_EVAL_pct']:+.2f}%|{r['V8_ON_jitless_ms']:.4f}|")
    lines += ['', f"26项等权几何平均：C相对A {summary['GM_vs_A_pct']:+.3f}%，相对EVAL_COLD {summary['GM_vs_EVAL_COLD_pct']:+.3f}%。",
        f"逐项耗时之和：C {summary['C_sum_ms']:.4f} ms，A {summary['A_sum_ms']:.4f} ms，EVAL_COLD {summary['EVAL_COLD_sum_ms']:.4f} ms。",
        f"耗时之和变化：相对A {summary['sum_vs_A_pct']:+.3f}%，相对EVAL_COLD {summary['sum_vs_EVAL_COLD_pct']:+.3f}%。",
        '26项全部通过原checksum合同。计数构建、之前N=1的覆盖运行及旧性能样本没有作为本次C时间参与计算。',
        '没有新建置信区间或按结果追加轮数；没有SunSpider算法或引擎源码变更。', '']
    b.save('results.md', '\n'.join(lines))
    b.save('audit.json', dict(status='PASS', starts=26, process_results=26, new_measurements=26,
        unique_cases=26, all_checksums_pass=True, all_scripts_match_original=True,
        all_fixed_N_match=True, independent_aggregate_matches=True,
        C_release_ELF_and_sources_unchanged=True, new_control_measurements=0))
    print('SUNSPIDER_COMPLETE', json.dumps(summary), flush=True)


def main():
    OUT.mkdir(exist_ok=True)
    os.environ.update(TZ='Asia/Shanghai', LC_ALL='C', LANG='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    assert 2 in os.sched_getaffinity(0)
    os.sched_setaffinity(0, {2})
    runtime_file = HERE / 'TRANSITION_EDGE_STRONG.release.manifest.json'
    runtime = b.load(runtime_file)
    assert b.load(HERE/'qualification/TRANSITION_EDGE_STRONG.release.gate.json')['status'] == 'PASS'
    assert b.load(HERE/'qualification/TRANSITION_EDGE_STRONG.san.gate.json')['status'] == 'PASS'
    info = b.load(OLD/'sunspider.inputs.json')
    old_protocol = b.load(OLD/'protocol.json')
    assert len(info['cases']) == 26
    scripts = {case: old_protocol['scripts']['sunspider'][case]['measure'] for case in info['cases']}
    for case, script in scripts.items():
        assert script['N'] == info['N'][case] and script['payload_phase'] == 'measure'
    if (OUT/'protocol.json').exists():
        protocol = b.load(OUT/'protocol.json')
        assert protocol['scripts'] == scripts
    else:
        protocol = dict(label='TRANSITION_EDGE_STRONG', samples_per_case=1, scripts=scripts, CPU=2,
            boot_id=b.boot(), binary_sha256=runtime['elf_sha256'], input_files=info['files'],
            frozen_files={str(p): b.sha(p) for p in [Path(__file__), runtime_file, OLD/'protocol.json',
                OLD/'statistics.csv', OLD/'sunspider.inputs.json']},
            warmup_calls=0, timezone='Asia/Shanghai', locale='C', controls_rerun=False,
            stop_rule='26 one-shot C Release processes; preserve failures; no automatic retry')
        b.save('protocol.json', protocol)
        b.save('environment.before.json', b.environment())
    verify(protocol, runtime)
    done = {r['case']: r for r in b.records() if r['event'] == 'measurement'}
    for case, script in scripts.items():
        if case in done:
            assert done[case]['valid']; continue
        result = b.capture([runtime['elf'], script['path']], 'measure', case, timeout=300,
            identity=dict(case=case, N=script['N'], binary_sha256=runtime['elf_sha256'], script_sha256=script['sha256']))
        payload, error = {}, None
        try:
            assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr'], result['stderr']
            prefix = 'TEB_RESULT:'
            lines = [s[len(prefix):] for s in result['stdout'].splitlines() if s.startswith(prefix)]
            assert len(lines) == 1
            payload = json.loads(lines[0])
            assert payload['case'] == case and payload['N'] == script['N'] and payload['phase'] == 'measure'
            assert payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
            assert payload['checksum'] in info['contract']['allowed'][case]
            assert payload['elapsed_ms'] == payload['stop_ms'] - payload['start_ms']
            assert math.isfinite(payload['elapsed_ms']) and 0 < payload['elapsed_ms'] <= result['external_wall_ms']+5
            assert result['boot_id'] == result['boot_id_after'] == protocol['boot_id']
            assert abs(result['raw_minus_monotonic_ms']) <= 5+.002*result['external_wall_ms']
            assert abs(result['utc_minus_monotonic_ms']) <= 1000
            assert b.sha(runtime['elf']) == runtime['elf_sha256']
        except (AssertionError, KeyError, ValueError, TypeError) as exc:
            error = str(exc)
        row = dict(event='measurement', case=case, N=script['N'], valid=error is None, error=error,
            payload=payload, ms_per_Run=payload.get('elapsed_ms', 0)/script['N'])
        b.append(row)
        assert row['valid'], 'saved failed sample; no automatic retry: '+str(error)
        print('SAMPLE', len(done)+1, '/26', case, f"{row['ms_per_Run']:.6f}", 'ms/Run', flush=True)
        done[case] = row
    verify(protocol, runtime)
    b.save('environment.after.json', b.environment())
    analyze(protocol)


if __name__ == '__main__': main()

"""Full per-case comparison against the original SPARSE historical pass."""
import collections
import csv
import json
import math

from build import HERE, PACKAGE, save

OUT = HERE / 'full_bench'
SPARSE = PACKAGE.parent / 'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor'


def change(rows, numerator, denominator, suite):
    groups = collections.defaultdict(list)
    for r in rows:
        group = r['case'].split('.')[0] if suite == 'octane' else r['case']
        groups[group].append(math.log(r[numerator] / r[denominator]))
    assert len(groups) == (14 if suite == 'octane' else 26)
    return 100 * (math.exp(sum(sum(v) / len(v) for v in groups.values()) / len(groups)) - 1)


def main():
    assert json.loads((OUT / 'complete.json').read_text())['status'] == 'PASS'
    samples = [r for r in map(json.loads, (OUT / 'runs.jsonl').read_text().splitlines())
               if r['event'] == 'sample']
    assert len(samples) == 43 and all(r['valid'] for r in samples)
    rows, summary = [], {}
    table = []
    for suite in ['octane', 'sunspider']:
        title = 'Octane' if suite == 'octane' else 'SunSpider'
        subset = []
        with (SPARSE / 'analysis' / (suite + '.csv')).open() as f:
            refs = list(csv.DictReader(f))
        for ref in refs:
            s = next(r for r in samples if r['suite'] == suite and r['case'] == ref['case'])
            assert s['N'] == int(ref['N'])
            old, new = float(ref['candidate_ms']), s['ms_per_Run']
            subset.append(dict(suite=suite, case=s['case'], name=s['name'], N=s['N'],
                SPARSE_ms=old, SKIP_REPROBE_ms=new, change_pct=100 * (new / old - 1),
                historical_A_ms=float(ref['A_ms'])))
        assert len(subset) == (17 if suite == 'octane' else 26)
        summary[suite] = dict(cases=len(subset),
            SKIP_REPROBE_vs_SPARSE_pct=change(subset, 'SKIP_REPROBE_ms', 'SPARSE_ms', suite),
            SPARSE_vs_historical_A_pct=change(subset, 'SPARSE_ms', 'historical_A_ms', suite),
            SKIP_REPROBE_vs_historical_A_pct=change(subset, 'SKIP_REPROBE_ms', 'historical_A_ms', suite),
            SPARSE_sum_ms=sum(r['SPARSE_ms'] for r in subset),
            SKIP_REPROBE_sum_ms=sum(r['SKIP_REPROBE_ms'] for r in subset),
            faster_cases=sum(r['change_pct'] < 0 for r in subset),
            slower_cases=sum(r['change_pct'] > 0 for r in subset),
            largest_improvement=min(subset, key=lambda r: r['change_pct']),
            largest_regression=max(subset, key=lambda r: r['change_pct']))
        table += ['## ' + title, '',
                  '| 表项 | 原 SPARSE | SKIP_REPROBE | 相对原 SPARSE |',
                  '|---|---:|---:|---:|']
        for r in subset:
            table.append(f'| {r["name"]} | {r["SPARSE_ms"]:.4f} | {r["SKIP_REPROBE_ms"]:.4f} | {r["change_pct"]:+.2f}% |')
        table += [f'| **整体 GM** | — | — | **{summary[suite]["SKIP_REPROBE_vs_SPARSE_pct"]:+.2f}%** |', '']
        rows += subset
    with (OUT / 'comparison.csv').open('w', newline='') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)
    save(OUT / 'summary.json', dict(comparison='跨批次单轮筛选',
         new_samples=43, SPARSE_new_samples=0, aggregates=summary))
    (OUT / 'table.md').write_text('\n'.join(table))
    report = ['# 跳过重复读取 IC 探测：完整基准单轮对照', '',
        '本次只新跑未插桩 SKIP_REPROBE：Octane 17 项、SunSpider 26 项，每项一个新进程。'
        '原 SPARSE 使用 03_sparse_ctor 的历史单轮成绩。**跨批次单轮筛选**，不把旧数据算成同批新测。', '',
        '单位 ms/Run，负数为更快。Octane 按 14 suite 分层等权 GM（同 suite 子项先取 GM）；'
        'SunSpider 按 26 项等权 GM。保持原输入、N、校验、Setup/Run 边界和首个 Run 计入，无额外热身；'
        'CPU 2、Asia/Shanghai、C locale。使用已验证的同一 Release 二进制，未改策略或重新编译。', '',
        '| 套件 | 新版相对原 SPARSE GM | 原 SPARSE 逐项和 | 新版逐项和 | 更快 / 更慢项数 |',
        '|---|---:|---:|---:|---:|']
    for suite, s in summary.items():
        report.append(f'| {suite} | {s["SKIP_REPROBE_vs_SPARSE_pct"]:+.2f}% | {s["SPARSE_sum_ms"]:.4f} | '
                      f'{s["SKIP_REPROBE_sum_ms"]:.4f} | {s["faster_cases"]} / {s["slower_cases"]} |')
    report += ['', '逐项和仅作补充，不是整体 GM；它是各表项 ms/Run 的和，不是这批进程的总墙钟时间。', '']
    report += ['本轮两套完整基准均未取得整体净收益，暂不替换原 SPARSE。'
               '微测试已确认重复缓存探测被删掉，但没有带来全集提速。'
               'SunSpider 有 23 项变慢，不能只归结于 access-binary-trees 一个项目；'
               '具体回退原因本轮没有另跑诊断，跨批次结果也不能把所有差异直接归因于这个补丁。', '']
    for suite, s in summary.items():
        im, reg = s['largest_improvement'], s['largest_regression']
        report += [f'- {suite} 最大改善：{im["name"]} {im["change_pct"]:+.2f}%；'
                   f'最大回退：{reg["name"]} {reg["change_pct"]:+.2f}%。']
    report += ['', *table, '## 复现和原始记录', '',
        '从本实验 attempt01 目录运行：', '', '```bash',
        'python3 full_bench.py run', 'python3 full_analyze.py', 'python3 full_audit.py', '```', '',
        '`full_bench` 已有结果时，跑数脚本拒绝覆盖。重测应在新的 attempt 内保留独立记录。', '',
        '`runs.jsonl` 保存 43 个新进程的原始计时、stdout/stderr、PID、退出状态和逐项校验；'
        '`protocol.json` 保存输入、N、执行顺序、CPU、源码/二进制及旧对照哈希；'
        '`comparison.csv` 为完整逐项表，`audit.json` 为记录核对结果。', '',
        '单轮与跨批次差异不能用于证明显著性；本轮不追加次数，也没有调整方法去改善成绩。', '']
    (OUT / 'results.md').write_text('\n'.join(report))
    print(json.dumps(summary, ensure_ascii=False, indent=2), flush=True)


if __name__ == '__main__':
    main()

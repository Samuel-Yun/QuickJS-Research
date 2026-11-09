"""Offline analysis with paired whole-round bootstrap, no VM execution."""
import collections
import csv
import gzip
import hashlib
import io
import json
import math
from pathlib import Path
import random
import statistics as st

HERE = Path(__file__).resolve().parent
LABELS = ['A', 'EVAL_COLD', 'V8_ON']
PAIRS = [('EVAL_COLD', 'A'), ('V8_ON', 'A'), ('EVAL_COLD', 'V8_ON')]


def read(name):
    return json.loads((HERE / name).read_text())


def csvout(name, rows):
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream, list(rows[0]), lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
    (HERE / name).write_text(stream.getvalue())


def gm(kind, values):
    groups = collections.defaultdict(list)
    for case, value in values.items():
        groups[case.split('.')[0] if kind == 'octane' else case].append(math.log(value))
    return math.exp(st.mean(st.mean(v) for v in groups.values()))


def main():
    protocol = read('protocol.json')
    packed = (HERE / 'raw/runs.jsonl.gz').read_bytes()
    raw = gzip.decompress(packed)
    archive = read('raw/archive.json')
    assert hashlib.sha256(packed).hexdigest() == archive['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest() == archive['uncompressed_sha256']
    rows = [json.loads(line) for line in raw.splitlines()]
    samples = [r for r in rows if r['event'] == 'measurement']
    assert len(samples) == 3870 and all(r['valid'] for r in samples)
    infos = {k: read(k + '.inputs.json') for k in ['octane', 'sunspider']}
    values = collections.defaultdict(dict)
    for r in samples:
        key = r['kind'], r['condition'], r['case']
        assert r['rep'] not in values[key]
        assert r['N'] == infos[r['kind']]['N'][r['case']]
        values[key][r['rep']] = r['elapsed_per_Run_ms']
    assert len(values) == 129 and all(set(v) == set(range(30)) for v in values.values())
    medians = {key: st.median(v.values()) for key, v in values.items()}
    stats = []
    for kind, info in infos.items():
        for case in info['cases']:
            for label in LABELS:
                data = list(values[kind, label, case].values())
                stats.append(dict(kind=kind, case=case, condition=label, n=30, N=info['N'][case],
                    median_ms=medians[kind, label, case], mean_ms=st.mean(data), sample_stddev=st.stdev(data),
                    CV_pct=100 * st.stdev(data) / st.mean(data), min=min(data), max=max(data),
                    short_samples=sum(r['below_1000ms'] for r in samples if (r['kind'], r['condition'], r['case']) == (kind, label, case))))
    csvout('statistics.csv', stats)
    rng = random.Random(protocol['seed'])
    distributions = collections.defaultdict(list)
    aggregate_distributions = collections.defaultdict(list)
    keys = list(values)
    for _ in range(10000):
        indexes = rng.choices(range(30), k=30)
        draw = {key: st.median(values[key][i] for i in indexes) for key in keys}
        for kind, info in infos.items():
            for label, control in PAIRS:
                ratios = {}
                for case in info['cases']:
                    ratio = draw[kind, label, case] / draw[kind, control, case]
                    distributions[kind, label, control, case].append(ratio)
                    ratios[case] = ratio
                aggregate_distributions[kind, label, control, 'suite_GM'].append(gm(kind, ratios))
                if kind == 'sunspider':
                    ratio = sum(draw[kind, label, c] for c in info['cases']) / sum(draw[kind, control, c] for c in info['cases'])
                    aggregate_distributions[kind, label, control, 'total_ms'].append(ratio)
    comparisons, aggregates = [], []
    for kind, info in infos.items():
        for label, control in PAIRS:
            for case in info['cases']:
                ratio = medians[kind, label, case] / medians[kind, control, case]
                distribution = sorted(distributions[kind, label, control, case])
                comparisons.append(dict(kind=kind, case=case, condition=label, denominator=control,
                    control_ms=medians[kind, control, case], candidate_ms=medians[kind, label, case],
                    ratio=ratio, change_pct=100 * (ratio - 1), low95=distribution[249], high95=distribution[9749]))
            ratios = {c: medians[kind, label, c] / medians[kind, control, c] for c in info['cases']}
            ratio = gm(kind, ratios)
            distribution = sorted(aggregate_distributions[kind, label, control, 'suite_GM'])
            aggregates.append(dict(kind=kind, metric='suite_GM', condition=label, denominator=control,
                ratio=ratio, change_pct=100 * (ratio - 1), low95=distribution[249], high95=distribution[9749],
                inference='10000 paired whole-round percentile bootstrap; 30 prespecified rounds; no multiplicity correction'))
            if kind == 'sunspider':
                ratio = sum(medians[kind, label, c] for c in info['cases']) / sum(medians[kind, control, c] for c in info['cases'])
                distribution = sorted(aggregate_distributions[kind, label, control, 'total_ms'])
                aggregates.append(dict(kind=kind, metric='total_ms', condition=label, denominator=control,
                    ratio=ratio, change_pct=100 * (ratio - 1), low95=distribution[249], high95=distribution[9749],
                    inference='ratio of sums of per-case medians; same paired round bootstrap'))
    csvout('per_case_comparisons.csv', comparisons)
    csvout('aggregate.csv', aggregates)
    totals = {label: sum(medians['sunspider', label, c] for c in infos['sunspider']['cases']) for label in LABELS}
    (HERE / 'sunspider_totals.json').write_text(json.dumps(totals, indent=2) + '\n')
    lines = ['A / EVAL_COLD / V8_ON 原生30轮确认', '',
        '全部为本批新数据：Octane 1530条、SunSpider 2340条，逐项每版30个独立进程。',
        '单位ms/完整Run，报告30进程中位数；括号相对本批A，负数更快，正数更慢。',
        '三个版本按case相邻交错，六种先后顺序各五次；V8_ON为--jitless --no-lazy --use-ic。',
        '首次Run包含在计时中，无workload预热；原输入、既定N和Setup/Run边界保留。', '']
    for kind, info in infos.items():
        lines += [kind.capitalize(), '', '|表项|A|EVAL_COLD（相对A）|V8_ON（相对A）|', '|---|---:|---:|---:|']
        for case in info['cases']:
            data = [case, f'{medians[kind, "A", case]:.5f}']
            for label in LABELS[1:]:
                value = medians[kind, label, case]
                data.append(f'{value:.5f}（{100 * (value / medians[kind, "A", case] - 1):+.2f}%）')
            lines.append('|' + '|'.join(data) + '|')
        if kind == 'sunspider':
            lines.append('|逐项中位数总和|' + '|'.join(f'{totals[label]:.5f}' +
                (f'（{100 * (totals[label] / totals["A"] - 1):+.2f}%）' if label != 'A' else '') for label in LABELS) + '|')
        lines.append('')
    lines += ['整体比较', '', '|负载|口径|比较|耗时变化|95% bootstrap区间（变化）|', '|---|---|---|---:|---:|']
    for row in aggregates:
        lines.append(f'|{row["kind"]}|{row["metric"]}|{row["condition"]}/{row["denominator"]}|{row["change_pct"]:+.3f}%|[{100 * (row["low95"] - 1):+.3f}%, {100 * (row["high95"] - 1):+.3f}%]|')
    lines += ['', 'Octane按原14个suite等权，suite内子项先取几何平均；SunSpider整体GM为26项等权，另列逐项中位数之和。',
        '区间由成对整轮bootstrap得到；每项30个独立进程才是样本数，进程内N次调用不当成独立样本。',
        '所有有效慢点及低于1000ms的样本保留，未按显著性追加轮数；没有旧性能样本参与计算。', '']
    (HERE / 'results.md').write_text('\n'.join(lines))
    print('ANALYSIS_COMPLETE', json.dumps(aggregates), flush=True)


if __name__ == '__main__':
    main()

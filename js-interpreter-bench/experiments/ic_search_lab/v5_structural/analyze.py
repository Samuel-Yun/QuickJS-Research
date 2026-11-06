"""Portable statistics from public JSONL/gzip, no runtime or old absolute path reads."""
import argparse
import csv
import gzip
import json
import math
import os
from pathlib import Path
import random
import statistics

H = Path(__file__).resolve().parent


def records():
    path = H / 'runs.jsonl'
    if path.exists() and os.environ.get('STRUCTURAL_ARCHIVE_ONLY')!='1':
        with path.open(encoding='utf-8') as stream:
            return [json.loads(line) for line in stream]
    with gzip.open(H / 'runs.jsonl.gz', 'rt', encoding='utf-8') as stream:
        return [json.loads(line) for line in stream]


def aggregate(kind, ratios, expanded=False):
    expected = 26 if kind == 'sunspider' else 17
    assert len(ratios) == expected
    if kind == 'sunspider':
        return math.exp(statistics.mean(math.log(v) for v in ratios.values()))
    suites = {}
    for case, value in ratios.items():
        if expanded or case != 'zlib.zlib':
            suites.setdefault(case.split('.')[0], []).append(math.log(value))
    assert len(suites) == (14 if expanded else 13)
    return math.exp(statistics.mean(statistics.mean(v) for v in suites.values()))


def quartiles(values):
    a = sorted(values)
    if len(a) == 1:
        return a[0], a[0]
    half = len(a) // 2
    return statistics.median(a[:half]), statistics.median(a[-half:])


def interval(values):
    a = sorted(values)
    # Linear interpolation at fixed p*(n-1).
    def q(p):
        i = p * (len(a)-1)
        k = int(i)
        return a[k] if k == len(a)-1 else a[k] + (a[k+1]-a[k])*(i-k)
    return q(.025), q(.975)


def write_csv(name, rows):
    if not rows:
        return
    fields = list(dict.fromkeys(k for row in rows for k in row))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, fields, lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def analyze(campaign, base=None):
    protocol = json.loads((H / (campaign + '.protocol.json')).read_text(encoding='utf-8'))
    rows = [r for r in records() if r.get('event') == 'measurement' and r.get('campaign') == campaign]
    cases = json.loads((H / (protocol['kind'] + '.inputs.json')).read_text(encoding='utf-8'))['cases']
    labels, rounds, kind = protocol['labels'], protocol['rounds'], protocol['kind']
    output = campaign
    if base is not None:
        assert base in labels
        labels = [base] + [x for x in labels if x != base]
        output += '.vs_' + base
    lookup = {}
    for row in rows:
        key = row['case'], row['condition'], row['rep']
        assert key not in lookup, 'duplicate position'
        lookup[key] = row
        assert row['valid'] and row['elapsed_ms'] > 0
        assert row['boot_id'] == row['boot_id_after'] == protocol['boot_id']
    assert len(rows) == len(cases)*len(labels)*rounds, 'incomplete campaign, no complete GM'
    data = {(case, label): [lookup[case, label, rep]['elapsed_per_Run_ms'] for rep in range(rounds)]
            for case in cases for label in labels}
    summaries = []
    for (case, label), values in data.items():
        q1, q3 = quartiles(values)
        summaries.append(dict(campaign=campaign, case=case, condition=label, n=len(values),
            N=lookup[case, label, 0]['N'], median_ms_per_Run=statistics.median(values),
            mean_ms_per_Run=statistics.mean(values), sample_stddev_ms=statistics.stdev(values) if len(values)>1 else None,
            q1_ms=q1, q3_ms=q3, iqr_ms=q3-q1, min_ms=min(values), max_ms=max(values),
            below1000ms=sum(lookup[case,label,r]['below_1000ms'] for r in range(rounds))))
    write_csv(output + '.statistics.csv', summaries)
    pair_rows, aggregate_rows = [], []
    for label in labels[1:]:
        base = labels[0]
        point = {c: statistics.median(data[c,label])/statistics.median(data[c,base]) for c in cases}
        boot_cases = {c: [] for c in cases}
        boot_core, boot_expanded = [], []
        if rounds > 1:
            rng = random.Random(2026110605)
            for _ in range(10000):
                # Resample complete paired campaign rounds, preserving every case/condition in a round.
                selected = [rng.randrange(rounds) for __ in range(rounds)]
                ratios = {c: statistics.median(data[c,label][i] for i in selected)/
                             statistics.median(data[c,base][i] for i in selected) for c in cases}
                for c in cases:
                    boot_cases[c].append(ratios[c])
                boot_core.append(aggregate(kind, ratios))
                boot_expanded.append(aggregate(kind, ratios, True))
        for c in cases:
            ci = interval(boot_cases[c]) if rounds>1 else (None,None)
            pair_rows.append(dict(case=c, numerator=label, denominator=base, median_time_ratio=point[c],
                                  low95=ci[0], high95=ci[1], rounds=rounds,
                                  interpretation='exploratory paired whole-round bootstrap' if rounds>1 else 'point estimate only'))
        for expanded in ([False, True] if kind == 'octane' else [False]):
            ci = interval(boot_expanded if expanded else boot_core) if rounds>1 else (None,None)
            aggregate_rows.append(dict(numerator=label, denominator=base,
                subset=('expanded17_14suite' if expanded else 'core16_13suite') if kind=='octane' else 'SunSpider26_equal_case',
                median_time_ratio=aggregate(kind, point, expanded), low95=ci[0], high95=ci[1], rounds=rounds,
                status='DIRECTION_UNCLEAR' if ci[0] is not None and ci[0]<=1<=ci[1] else 'EXPLORATORY'))
    write_csv(output + '.pairwise.csv', pair_rows)
    write_csv(output + '.aggregate.csv', aggregate_rows)
    result = dict(status='COMPLETE', actual_valid=len(rows), expected=len(cases)*len(labels)*rounds,
                  case_count=len(cases), conditions=labels, rounds=rounds, boot_id=protocol['boot_id'],
                  duplicates=0, zero_or_invalid=0, summaries=aggregate_rows)
    (H / (output + '.audit.json')).write_text(json.dumps(result,indent=2)+'\n', encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('campaign')
    parser.add_argument('--base')
    args = parser.parse_args()
    analyze(args.campaign, args.base)

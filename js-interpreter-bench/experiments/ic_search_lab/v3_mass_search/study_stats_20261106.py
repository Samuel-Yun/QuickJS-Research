"""Offline new-campaign statistics and process audit; no VM execution."""
import argparse
import csv
import gzip
import hashlib
import json
import math
import os
import random
import statistics
from collections import Counter
from pathlib import Path

import analysis

H = Path(__file__).resolve().parent


def load(name):
    return json.loads((H / name).read_text(encoding='utf-8'))


def rows():
    original = H / 'runs.jsonl'
    force_archive = os.environ.get('IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY') == '1'
    if original.exists() and not force_archive:
        with original.open(encoding='utf-8') as stream:
            return [json.loads(line) for line in stream]
    metadata = load('current_raw_archive.json')
    archive = H / metadata['file']
    assert hashlib.sha256(archive.read_bytes()).hexdigest() == metadata['compressed_sha256']
    digest = hashlib.sha256()
    result = []
    with gzip.open(archive, 'rb') as stream:
        for line in stream:
            digest.update(line); result.append(json.loads(line))
    assert digest.hexdigest() == metadata['uncompressed_sha256']
    return result


def savecsv(name, values):
    if not values: return
    columns = list(dict.fromkeys(key for value in values for key in value))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, columns, lineterminator='\n')
        writer.writeheader(); writer.writerows(values)


def desc(values):
    ordered = sorted(values)
    count = len(ordered)
    assert count and all(math.isfinite(value) and value > 0 for value in values)
    q1 = statistics.median(ordered[:count // 2]) if count > 1 else ordered[0]
    q3 = statistics.median(ordered[(count + 1) // 2:]) if count > 1 else ordered[0]
    return dict(n=count, median=statistics.median(values), mean=statistics.mean(values),
                sample_stddev=statistics.stdev(values) if count > 1 else None,
                Q1=q1, Q3=q3, IQR=q3-q1, min=min(values), max=max(values))


def percentile(values, fraction):
    ordered = sorted(values)
    position = (len(ordered) - 1) * fraction
    lower = int(position); upper = min(lower + 1, len(ordered) - 1)
    return ordered[lower] + (ordered[upper] - ordered[lower]) * (position - lower)


def recheck():
    selection = load('exploration.level3.selection.json')
    raw = rows()
    summaries = []
    stats = []
    ratios = []
    for cid in selection['selected']:
        for kind in ['octane', 'sunspider']:
            name = 'exploration.level3.' + cid + '.' + kind
            proto = load(name + '.protocol.json')
            complete = load(name + '.complete.json')
            samples = [row for row in raw if row.get('event') == 'measurement' and row.get('campaign') == proto['campaign']]
            assert len(samples) == complete['expected'] == complete['actual']
            assert all(row['valid'] for row in samples)
            keys = {(row['case'], row['condition'], row['rep'], row['order']) for row in samples}
            assert keys == {(row['case'], row['condition'], row['rep'], row['order']) for row in proto['positions']}
            cases = list(dict.fromkeys(row['case'] for row in proto['positions']))
            groups = {case: {label: [next(row['elapsed_per_Run_ms'] for row in samples
                                        if row['case'] == case and row['condition'] == label and row['rep'] == rep)
                                    for rep in range(proto['rounds'])] for label in proto['labels']} for case in cases}
            for case in cases:
                for label in proto['labels']:
                    positions = Counter(row['order'] for row in samples if row['case'] == case and row['condition'] == label)
                    assert positions == Counter({0: 1, 1: 1, 2: 1, 3: 1})
                    stats.append(dict(candidate=cid, kind=kind, case=case, condition=label, unit='ms/complete Run', **desc(groups[case][label])))
            rng = random.Random(20261105)
            draws = [[rng.randrange(proto['rounds']) for _ in range(proto['rounds'])] for _ in range(10000)]
            scopes = [False] if kind == 'sunspider' else [False, True]
            for baseline in [label for label in proto['labels'] if label != cid]:
                points = {case: statistics.median(groups[case][cid]) / statistics.median(groups[case][baseline]) for case in cases}
                per_case = {case: [] for case in cases}
                aggregate_draws = {scope: [] for scope in scopes}
                for indices in draws:
                    trial = {case: statistics.median(groups[case][cid][i] for i in indices) /
                                  statistics.median(groups[case][baseline][i] for i in indices) for case in cases}
                    for case, ratio in trial.items(): per_case[case].append(ratio)
                    for scope in scopes: aggregate_draws[scope].append(analysis.aggregate(kind, trial, scope))
                for case in cases:
                    low = percentile(per_case[case], .025); high = percentile(per_case[case], .975)
                    ratios.append(dict(candidate=cid, kind=kind, case=case, denominator=baseline,
                        ratio=points[case], low95=low, high95=high,
                        direction='lower' if high < 1 else 'higher' if low > 1 else 'unclear',
                        rounds=proto['rounds'], inference='exploratory unadjusted'))
                for scope in scopes:
                    directions = [analysis.aggregate(kind, {case: groups[case][cid][rep] / groups[case][baseline][rep] for case in cases}, scope)
                                  for rep in range(proto['rounds'])]
                    summaries.append(dict(candidate=cid, kind=kind, scope='all26' if kind == 'sunspider' else 'expanded17' if scope else 'core16',
                        denominator=baseline, ratio=analysis.aggregate(kind, points, scope),
                        low95=percentile(aggregate_draws[scope], .025), high95=percentile(aggregate_draws[scope], .975),
                        rounds=proto['rounds'], round_ratios=json.dumps(directions),
                        inference='exploratory unadjusted10000 whole-round paired bootstrap seed20261105'))
            print('RECHECK_STATS_COMPLETE', cid, kind, flush=True)
    savecsv('exploration.level3.statistics.csv', stats)
    savecsv('exploration.level3.ratios.csv', ratios)
    savecsv('exploration.level3.summary.csv', summaries)


def audit():
    raw = rows()
    pointer = H / 'exploration.active_campaign.json'
    protocol = load(load(pointer.name)['protocol'] if pointer.exists() else 'exploration.protocol.json')
    prefix = 'v3.explore.' + protocol['tag'] + '.'
    samples = [row for row in raw if row.get('event') == 'measurement' and
               (row.get('campaign', '').startswith(prefix) or row.get('campaign', '').startswith('v3.full.' + protocol['tag'])
                or row.get('campaign', '').startswith('v3.recheck.' + protocol['tag']))]
    starts = {row['token']: row for row in raw if row.get('event') == 'process_start'}
    results = {row['token']: row for row in raw if row.get('event') == 'process_result'}
    problems = []
    seen = set()
    for row in samples:
        key = (row['campaign'], row['case'], row['condition'], row['rep'], row['order'], row['N'])
        if key in seen: problems.append('duplicate position')
        seen.add(key)
        result = results.get(row['process_token'])
        if result is None or row['process_token'] not in starts: problems.append('missing process record'); continue
        if not row['valid']: problems.append('invalid measurement retained'); continue
        if row['boot_id'] != row['boot_id_after'] or result['exit_code'] != 0: problems.append('boot/exit contradiction')
        if row['elapsed_ms'] <= 0 or abs(row['elapsed_ms'] / row['N'] - row['elapsed_per_Run_ms']) > 1e-9: problems.append('elapsed/N contradiction')
        if any(flag in row['identity']['flags'] for flag in ['--trace-opt', '--trace-baseline', '--print-bytecode']): problems.append('diagnostic flag in timing')
    blocks = [load(path.name) for path in H.glob(protocol.get('file_prefix', 'exploration') + '.block*.complete.json')]
    coverage = sum(len(block['candidates']) for block in blocks)
    status = dict(record_integrity='PASS' if not problems else 'REVIEW_REQUIRED', problems=sorted(set(problems)),
                  complete_initial_configurations=coverage, expected_supported=248, requested_initial=288,
                  short_quality_counts=dict(Counter(block['quality'] for block in blocks)),
                  samples=len(samples), valid=sum(row['valid'] for row in samples),
                  stages=dict(Counter(row['stage'] for row in samples)), boots=sorted({row['boot_id'] for row in samples}),
                  unmatched_process_starts=sorted(starts.keys() - results.keys()),
                  quality_is_distinct_from_execution_validity=True, historical_data_used_as_denominator=False)
    (H / 'exploration.audit.json').write_text(json.dumps(status, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(json.dumps(status), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['recheck', 'audit'])
    args = parser.parse_args()
    globals()[args.action]()

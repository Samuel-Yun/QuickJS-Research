"""Independent full-suite rechecks of a few single-pass signals."""
import argparse
import csv
import json
import math
import os
from pathlib import Path
import random
import statistics
import time

import refine as r

H = r.H
lab = r.lab
r.SOURCE[Path(__file__).name] = lab.sha(Path(__file__))


def records():
    with (H / 'runs.jsonl').open(encoding='utf-8') as stream:
        return [json.loads(line) for line in stream]


def choose():
    path = H / 'selection.json'
    if path.exists():
        return lab.load(path)['selected']
    assert (H / 'first.complete.json').exists()
    all_rows = [lab.load(path) for path in H.glob('*.screen.json') if path.stem != 'rf000.screen']
    eligible = [row for row in all_rows if row['core_over_s001'] <= .985 or
                (row['core_over_s001'] <= 1.005 and len(row['local5']) >= 2)]
    eligible.sort(key=lambda row: row['core_over_s001'])
    selected = [row['candidate'] for row in eligible[:2]]
    reason = 'Prespecified overall or two-local-case exploratory signals'
    if not selected:
        reserve = sorted((row for row in all_rows if row['core_over_s001'] <= 1.01),
                         key=lambda row: row['core_over_s001'])
        selected = [row['candidate'] for row in reserve[:1]]
        reason = 'One prespecified best within1% reserve, not a demonstrated improvement'
    lab.save(path, dict(status='FROZEN_BEFORE_INDEPENDENT_DATA', selected=selected, reason=reason,
             rounds=5, bootstrap=10000, inference='Exploratory unadjusted paired whole-round bootstrap',
             first_stage_points_used_as_denominator=False))
    return selected


def collect(kinds):
    r.gate()
    r.snapshot()
    os.sched_setaffinity(0, {2})
    selected = choose()
    common = lab.load(r.V3 / 'identities/CTRL000.json')
    assert lab.sha(common['path']) == common['sha256']
    lab.save(H / 'identities/CTRL000.json', common)
    protocol = lab.load(H / 'protocol.json')
    for cid in selected:
        design = next(row for row in lab.load(H / 'state.json') if row['id'] == cid)
        labels = ['A', 's001', 'rf000', cid]
        parent = design['parent'] if design['parent'] in ['rf001', 'CTRL000'] else 'CTRL000'
        if parent != cid:
            labels.append(parent)
        assert len(labels) == 5
        assert len(labels) == len(set(labels))
        for kind in kinds:
            completed = H / (cid + '.recheck.' + kind + '.complete.json')
            if completed.exists():
                continue
            cases = r.measure.inputs(kind)['cases']
            positions = []
            for rep in range(5):
                shuffled = cases.copy()
                random.Random(r.SEED + rep).shuffle(shuffled)
                for case in shuffled:
                    offset = (rep + cases.index(case)) % len(labels)
                    order = labels[offset:] + labels[:offset]
                    positions.extend(dict(case=case, condition=label, rep=rep, order=position)
                                     for position, label in enumerate(order))
            campaign = 'refine.recheck.' + protocol['tag'] + '.' + cid + '.' + kind
            lab.save(H / (cid + '.recheck.' + kind + '.protocol.json'), dict(
                campaign=campaign, candidate=cid, labels=labels, kind=kind, positions=positions,
                boot_id=lab.boot(), rounds=5, N={case: protocol['N'][kind + '/' + case] for case in cases},
                warmup_calls=0, selection_sha256=lab.sha(H / 'selection.json')))
            prior = [row for row in records() if row.get('event') == 'measurement' and row.get('campaign') == campaign]
            index = {(row['case'], row['condition'], row['rep'], row['order']): row for row in prior}
            assert len(index) == len(prior) and all(row['valid'] and row['boot_id'] == lab.boot() for row in prior)
            for job in positions:
                key = (job['case'], job['condition'], job['rep'], job['order'])
                if key not in index:
                    index[key] = r.invoke(kind, job['case'], job['condition'], 'independent_recheck',
                                          campaign, job['order'], job['rep'])
            lab.save(completed, dict(status='COMPLETE_FIVE_INDEPENDENT_ROUNDS', candidate=cid, kind=kind,
                     campaign=campaign, expected=len(positions), actual=len(index), boot_id=lab.boot()))
            r.update(cid, status='RECHECKED', **{kind + '_recheck_rounds': 5})
            print('RECHECK_COMPLETE', cid, kind, len(index), flush=True)
    lab.save(H / ('recheck.' + '_'.join(kinds) + '.complete.json'), dict(status='COMPLETE_REQUESTED_INDEPENDENT_RECHECKS',
             selected=selected, kinds=kinds, formal30=False, boot_id=lab.boot()))


def quantile(values, fraction):
    values = sorted(values)
    position = (len(values) - 1) * fraction
    lower = int(position)
    upper = min(lower + 1, len(values) - 1)
    return values[lower] + (values[upper] - values[lower]) * (position - lower)


def describe(values):
    ordered = sorted(values)
    count = len(ordered)
    q1 = statistics.median(ordered[:count // 2])
    q3 = statistics.median(ordered[(count + 1) // 2:])
    return dict(n=count, median=statistics.median(values), mean=statistics.mean(values),
                sample_stddev=statistics.stdev(values), Q1=q1, Q3=q3, IQR=q3-q1, min=min(values), max=max(values))


def analyze(kinds):
    selection = lab.load(H / 'selection.json')
    raw = records()
    per_case = []
    summaries = []
    descriptions = []
    for cid in selection['selected']:
        for kind in kinds:
            protocol = lab.load(H / (cid + '.recheck.' + kind + '.protocol.json'))
            samples = [row for row in raw if row.get('event') == 'measurement' and row.get('campaign') == protocol['campaign']]
            assert len(samples) == len(protocol['positions']) and all(row['valid'] for row in samples)
            cases = r.measure.inputs(kind)['cases']
            groups = {case: {label: [next(row['elapsed_per_Run_ms'] for row in samples
                                        if row['case'] == case and row['condition'] == label and row['rep'] == rep)
                                    for rep in range(5)] for label in protocol['labels']} for case in cases}
            for case in cases:
                for label in protocol['labels']:
                    descriptions.append(dict(candidate=cid, kind=kind, case=case, condition=label,
                                             unit='ms/complete Run', **describe(groups[case][label])))
            rng = random.Random(r.SEED)
            draws = [[rng.randrange(5) for unused in range(5)] for unused in range(10000)]
            scopes = [False, True] if kind == 'octane' else [False]
            for denominator in [label for label in protocol['labels'] if label != cid]:
                point = {case: statistics.median(groups[case][cid]) / statistics.median(groups[case][denominator])
                         for case in cases}
                trial_cases = {case: [] for case in cases}
                trial_aggregate = {scope: [] for scope in scopes}
                for indices in draws:
                    trial = {case: statistics.median(groups[case][cid][index] for index in indices) /
                                  statistics.median(groups[case][denominator][index] for index in indices) for case in cases}
                    for case, value in trial.items():
                        trial_cases[case].append(value)
                    for scope in scopes:
                        trial_aggregate[scope].append(r.aggregate(kind, trial, scope))
                for case in cases:
                    per_case.append(dict(candidate=cid, kind=kind, case=case, denominator=denominator,
                        ratio=point[case], low95=quantile(trial_cases[case], .025),
                        high95=quantile(trial_cases[case], .975), rounds=5))
                for scope in scopes:
                    summaries.append(dict(candidate=cid, kind=kind,
                        scope='all26' if kind == 'sunspider' else 'expanded17' if scope else 'core16',
                        denominator=denominator, ratio=r.aggregate(kind, point, scope),
                        low95=quantile(trial_aggregate[scope], .025), high95=quantile(trial_aggregate[scope], .975),
                        rounds=5, inference='10000 exploratory unadjusted whole-round paired bootstrap',
                        round_ratios=json.dumps([r.aggregate(kind, {case: groups[case][cid][rep] /
                                             groups[case][denominator][rep] for case in cases}, scope) for rep in range(5)])))
            print('ANALYSIS_COMPLETE', cid, kind, flush=True)
    r.csvfile('recheck.statistics.csv', descriptions)
    r.csvfile('recheck.per_case.csv', per_case)
    r.csvfile('recheck.summary.csv', summaries)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['collect', 'analyze'])
    parser.add_argument('--kind', choices=['both', 'octane', 'sunspider'], default='both')
    args = parser.parse_args()
    kinds = ['octane', 'sunspider'] if args.kind == 'both' else [args.kind]
    if args.action == 'collect':
        collect(kinds)
    else:
        analyze(kinds)

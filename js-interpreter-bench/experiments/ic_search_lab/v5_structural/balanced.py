"""Independent complete-suite rounds, each condition visits every position per case."""
import argparse
import hashlib
import json
import os
import random
import sys
import run

H = run.H
original_capture = run.lab.capture


def capture(cmd, stage, label, timeout=30, identity=None, cwd=None):
    return original_capture(cmd, stage, label, timeout,
                            dict(identity or {}, balanced_runner_sha256=run.lab.sha(__file__)), cwd)


run.lab.capture = capture


def sample(labels, kind, rounds, campaign):
    run.gate()
    os.sched_setaffinity(0, {2})
    assert rounds % len(labels) == 0, 'complete cyclic position balance'
    info = run.measure.inputs(kind)
    run.measure.verify(info, labels)
    protocol = dict(campaign=campaign, labels=labels, kind=kind, rounds=rounds,
                    boot_id=run.lab.boot(), seed=run.SEED,
                    N={kind + '/' + case: info['N'][case] for case in info['cases']},
                    N_note='Independent recheck uses the full previously validated N; search used quarter N. No old elapsed values reused.',
                    runner_sha256=run.lab.sha(__file__), warmup_calls=0,
                    order='Seeded per-case base permutation, cyclic rotation every round; independent case order shuffle')
    run.lab.save(H / (campaign + '.protocol.json'), protocol)
    previous = run.measurements(campaign)
    complete = {(r['case'], r['condition'], r['rep']): r for r in previous if r['valid']}
    assert len(complete) == len(previous) and all(r['valid'] for r in previous)
    schedule = {}
    for case in info['cases']:
        base = labels.copy()
        seed = run.SEED + int(hashlib.sha256(case.encode()).hexdigest()[:8], 16)
        random.Random(seed).shuffle(base)
        schedule[case] = base
    for rep in range(rounds):
        cases = info['cases'].copy()
        random.Random(run.SEED + rep).shuffle(cases)
        for case in cases:
            base = schedule[case]
            start = rep % len(labels)
            order = base[start:] + base[:start]
            for pos, label in enumerate(order):
                key = case, label, rep
                if key in complete:
                    continue
                run.gate()
                n = protocol['N'][kind + '/' + case]
                complete[key] = run.measure.invoke(info, campaign, case, label, n,
                                      'independent', pos, rep, campaign)
    run.measure.verify(info, labels)
    run.gate()
    assert len(complete) == len(info['cases'])*len(labels)*rounds
    positions = {}
    for r in complete.values():
        key = r['case'], r['condition']
        positions.setdefault(key, [0]*len(labels))[r['order']] += 1
    assert all(len(set(x)) == 1 for x in positions.values())
    run.lab.save(H / (campaign + '.completed.json'), dict(status='COMPLETE', valid=len(complete),
        expected=len(info['cases'])*len(labels)*rounds, exact_position_balance=True,
        boot_id=run.lab.boot(), protocol_sha256=run.lab.sha(H / (campaign + '.protocol.json'))))
    print('BALANCED_COMPLETE', campaign, len(complete), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('campaign')
    parser.add_argument('--kind', choices=['octane','sunspider'], default='octane')
    parser.add_argument('--rounds', type=int, required=True)
    parser.add_argument('--labels', nargs='+', required=True)
    a = parser.parse_args()
    sample(a.labels, a.kind, a.rounds, a.campaign)

"""Fresh full-suite follow-up. Layer1 points only allocate this budget."""
import argparse
import csv
import itertools
import json
import math
import os
import random
import statistics
import sys
import time
import traceback
from pathlib import Path

import explore_20261106 as exploration
import search as s
import stages as st
import analysis

H = s.HERE
lab = s.lab
CONTROL = exploration.CONTROL
INDEX_CONTROL = 'CTRL_INDEX'


def phase_gate(protocol):
    boot = exploration.install_gate(protocol)
    original = lab.load(H / ('exploration.environment.' + protocol['tag'] + '.json'))
    assert original['boot_id'] == boot, 'New boot needs a separate cohort and explicit protocol'
    source = Path(__file__)
    lab.save(H / 'runners' / ('promote_20261106.' + lab.sha(source) + '.py'), source.read_bytes())
    environment = H / 'exploration.followup.environment.json'
    if environment.exists():
        assert lab.load(environment)['boot_id'] == boot
    else:
        lab.save(environment, dict(boot_id=boot, timestamp=lab.stamp(), affinity=[2],
                 uname=os.uname(), meminfo=Path('/proc/meminfo').read_text(),
                 controller_sha256=lab.sha(source), source_campaign=protocol['tag']))
    return boot


def matched_control(cid):
    config = st.identity(cid)['effective_config']
    return INDEX_CONTROL if not config['pc_rel'] else CONTROL


def prepare_index_control():
    if not any(row['id'] == INDEX_CONTROL for row in st.all_rows()):
        states = st.all_rows()
        states.append(dict(id=INDEX_CONTROL, family='CONTROL', parent='M', status='PLANNED',
                           config=dict(pc_rel=0), classification='MATCHED_INDEX_AOS_SINGLE_SLOT_TEMPLATE_CONTROL'))
        st.atomic_json(H / 'state.json', states)
        lab.append(dict(event='control_registered', timestamp=lab.stamp(), id=INDEX_CONTROL,
                        initial_seed_ids_unchanged=True, reason='Match index-based candidates without changing their addressing mode'))
    st.build(INDEX_CONTROL, lifecycle=True)


def savecsv(name, rows):
    if not rows: return
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, list(dict.fromkeys(key for row in rows for key in row)), lineterminator='\n')
        writer.writeheader(); writer.writerows(rows)


def choose_full_suite():
    path = H / 'exploration.level2.selection.json'
    if path.exists(): return lab.load(path)['selected']
    protocol = exploration.current_protocol()
    assert (H / (exploration.prefix(protocol) + '.complete.json')).exists()
    entries = []
    for number in range(len(protocol['blocks'])):
        checkpoint = lab.load(H / (exploration.prefix(protocol) + '.block' + str(number) + '.complete.json'))
        if not checkpoint['trials']: continue
        # The final trial is selected by the fixed drift rule, never by speed.
        block = lab.load(H / checkpoint['trials'][-1])
        for item in block['results']:
            if item['candidate'] == CONTROL: continue
            entries.append(dict(id=item['candidate'], family=st.row_for(item['candidate'])['family'],
                                quality=checkpoint['quality'],
                                sun=item['ratios']['sunspider/s001']['gm'],
                                octane=item['ratios']['octane/s001']['gm'],
                                best_case=min(case['ratio'] for comparison in ['sunspider/s001', 'octane/s001']
                                              for case in item['ratios'][comparison]['cases'])))
    chosen = []
    reasons = {}
    def add(entry, reason):
        if entry['id'] not in chosen and len(chosen) < 28:
            chosen.append(entry['id']); reasons[entry['id']] = reason
    for family in ['P', 'L', 'T', 'Q', 'H', 'F', 'S']:
        group = [entry for entry in entries if entry['family'] == family]
        stable = sorted((entry for entry in group if entry['quality'] != 'UNSTABLE'), key=lambda entry: entry['octane'])
        for entry in stable[:2]: add(entry, 'mechanism quota, better stable exploratory Octane points')
        if not stable and group:
            # Keep a mechanism even if its entire short screen was noisy.
            ordered = sorted(group, key=lambda entry: entry['id'])
            add(random.Random(20261106).choice(ordered), 'mechanism exploration quota, unstable short timing')
    for entry in sorted(entries, key=lambda entry: (entry['quality'] == 'UNSTABLE', entry['best_case'])):
        if entry['best_case'] <= .95: add(entry, 'single-case5% point signal, requires independent follow-up')
        if len(chosen) >= 22: break
    for entry in sorted(entries, key=lambda entry: (entry['quality'] == 'UNSTABLE', entry['octane'])):
        add(entry, 'remaining stable-preferred exploratory Octane allocation')
    lab.save(path, dict(status='FROZEN_BEFORE_NEW_FULL_SUITE_DATA', selected=chosen, reasons=reasons,
             requested=28, CI_from_short_data=False, controls_excluded=True,
             scope='All26 SunSpider and17 Octane, one fresh sample; common same-case N'))
    return chosen


def full_n():
    path = H / 'exploration.level2.N.json'
    if path.exists(): return lab.load(path)['N']
    ns = {}
    for kind in ['sunspider', 'octane']:
        info = st.measure.inputs(kind)
        for case in info['cases']:
            ns[kind + '/' + case] = info['N'][case] if case.startswith('Crypto.') else max(1, info['N'][case] // 4)
    lab.save(path, dict(status='FROZEN_BEFORE_LEVEL2', N=ns,
             rule='Prior N/4, min1 complete Run. Crypto retains its exact verified golden-ciphertext N. Old elapsed values are not denominators.'))
    return ns


def collect_full():
    protocol = exploration.current_protocol()
    boot = phase_gate(protocol)
    os.sched_setaffinity(0, {2})
    prepare_index_control()
    chosen = choose_full_suite()
    ns = full_n()
    for number, start in enumerate(range(0, len(chosen), 4)):
        completed = H / ('exploration.level2.block' + str(number) + '.json')
        if completed.exists(): continue
        group = chosen[start:start + 4]
        jobs = [(kind, case) for kind in ['sunspider', 'octane'] for case in st.measure.inputs(kind)['cases']]
        random.Random(20261106 + number).shuffle(jobs)
        campaign = 'v3.full.' + protocol['tag'] + '.block' + str(number)
        planned = []
        for job_number, (kind, case) in enumerate(jobs):
            middle = group + sorted({matched_control(cid) for cid in group})
            if any(st.row_for(cid)['parent'] == 'M' for cid in group): middle.append('M')
            rng = random.Random(20261106 + number * 1000 + job_number)
            rng.shuffle(middle)
            before = rng.sample(['A', 's001'], 2)
            labels = before + middle + before[::-1]
            planned.extend(dict(kind=kind, case=case, condition=label, N=ns[kind + '/' + case], order=position)
                           for position, label in enumerate(labels))
        plan_path = H / ('exploration.level2.block' + str(number) + '.schedule.json')
        lab.save(plan_path, dict(campaign=campaign, boot_id=boot, candidates=group, positions=planned,
                               matched_controls=sorted({matched_control(cid) for cid in group}), CI='not estimated'))
        existing = [row for row in st.records() if row.get('event') == 'measurement' and row.get('campaign') == campaign]
        by_position = {(row['kind'], row['case'], row['condition'], row['order']): row for row in existing}
        assert all(row['boot_id'] == boot and row['valid'] for row in existing), 'Invalid/other-boot partial cannot be resumed'
        data = []
        for job in planned:
            key = (job['kind'], job['case'], job['condition'], job['order'])
            row = by_position.get(key)
            if row is None:
                row = st.invoke(job['kind'], job['case'], job['condition'], job['N'], 'exploratory_full_suite', campaign, job['order'])
            data.append(row)
        output = []
        for kind, case in jobs:
            rows = [row for row in data if row['kind'] == kind and row['case'] == case]
            refs = {}
            drift = {}
            for label in ['A', 's001']:
                values = [row['elapsed_per_Run_ms'] for row in rows if row['condition'] == label]
                assert len(values) == 2
                refs[label] = math.sqrt(values[0] * values[1])
                drift[label] = max(values) / min(values)
            for cid in group:
                control_id = matched_control(cid)
                ctrl = next(row['elapsed_per_Run_ms'] for row in rows if row['condition'] == control_id)
                value = next(row['elapsed_per_Run_ms'] for row in rows if row['condition'] == cid)
                output.append(dict(candidate=cid, kind=kind, case=case, N=ns[kind + '/' + case],
                    candidate_ms_per_Run=value, A_reference_ms=refs['A'], s001_reference_ms=refs['s001'],
                    template_control_ms=ctrl, control_condition=control_id,
                    control_role='auxiliary PC template; A is the actual parent control' if st.row_for(cid)['parent'] == 'A' else 'matched addressing/template control',
                    over_A=value / refs['A'], over_s001=value / refs['s001'],
                    over_control=value / ctrl, A_drift=drift['A'], s001_drift=drift['s001'],
                    timing_quality='UNSTABLE' if max(drift.values()) > 1.15 else 'OK',
                    stage='exploratory_single_sample_full_suite', CI='not estimated'))
        lab.save(completed, dict(status='COMPLETE_FULL_SUITE_SINGLE_SAMPLE', candidates=group,
                 campaign=campaign, boot_id=boot, expected=len(planned), actual=len(data), rows=output))
        print('FULL_SUITE_BLOCK_COMPLETE', number, group, len(data), flush=True)
    values = [row for path in H.glob('exploration.level2.block*.json') if not path.name.endswith('.schedule.json')
              for row in lab.load(path)['rows']]
    savecsv('exploration.level2.per_case.csv', values)
    summaries = []
    for cid in chosen:
        for kind in ['sunspider', 'octane']:
            group = [row for row in values if row['candidate'] == cid and row['kind'] == kind]
            assert len(group) == (26 if kind == 'sunspider' else 17)
            for baseline in ['A', 's001', 'control']:
                ratios = {row['case']: row['over_' + baseline] for row in group}
                scopes = [False] if kind == 'sunspider' else [False, True]
                for expanded in scopes:
                    summaries.append(dict(candidate=cid, family=st.row_for(cid)['family'], kind=kind,
                        scope='all26' if kind == 'sunspider' else 'expanded17' if expanded else 'core16',
                        denominator=baseline, ratio=analysis.aggregate(kind, ratios, expanded),
                        unstable_cases=sum(row['timing_quality'] == 'UNSTABLE' for row in group),
                        over10pct_regressions=';'.join(row['case'] for row in group if row['over_' + baseline] > 1.10),
                        stage='single_sample_budget_allocation', CI='not estimated'))
    savecsv('exploration.level2.summary.csv', summaries)
    lab.save(H / 'exploration.level2.complete.json', dict(status='COMPLETE_EXPLORATORY_FULL_SUITES',
             candidates=chosen, count=len(chosen), no_confirmed_claim=True))


def choose_recheck():
    path = H / 'exploration.level3.selection.json'
    if path.exists(): return lab.load(path)['selected']
    assert (H / 'exploration.level2.complete.json').exists()
    with (H / 'exploration.level2.summary.csv').open(newline='', encoding='utf-8') as stream:
        summary = list(csv.DictReader(stream))
    entries = [row for row in summary if row['kind'] == 'octane' and row['scope'] == 'core16' and row['denominator'] == 's001']
    entries.sort(key=lambda row: float(row['ratio']))
    selected = []
    families = set()
    for row in entries:
        if row['family'] not in families:
            selected.append(row['candidate']); families.add(row['family'])
        if len(selected) == 4: break
    lab.save(path, dict(status='FROZEN_BEFORE_LAYER3', selected=selected, rounds=4,
             conditions=['A', 's001', 'candidate', CONTROL], seed=20261106, bootstrap_seed=20261105,
             rule='Up to4 lower exploratory core points, distinct mechanisms; independent balanced4-round full Octane and SunSpider',
             inference='Exploratory paired intervals, unadjusted for multiple comparisons; no confirmatory claim from selection data'))
    return selected


def collect_recheck():
    protocol = exploration.current_protocol()
    boot = phase_gate(protocol)
    os.sched_setaffinity(0, {2})
    selected = choose_recheck()
    ns = full_n()
    for cid in selected:
        for kind in ['octane', 'sunspider']:
            output = H / ('exploration.level3.' + cid + '.' + kind + '.complete.json')
            if output.exists(): continue
            cases = st.measure.inputs(kind)['cases']
            labels = ['A', 's001', cid, matched_control(cid)]
            positions = []
            for rep in range(4):
                ordered = list(cases); random.Random(20261106 + rep).shuffle(ordered)
                for index, case in enumerate(ordered):
                    offset = (rep + cases.index(case)) % 4
                    order = labels[offset:] + labels[:offset]
                    positions.extend(dict(case=case, condition=label, rep=rep, order=pos,
                                          N=ns[kind + '/' + case]) for pos, label in enumerate(order))
            campaign = 'v3.recheck.' + protocol['tag'] + '.' + cid + '.' + kind
            lab.save(H / ('exploration.level3.' + cid + '.' + kind + '.protocol.json'),
                     dict(campaign=campaign, boot_id=boot, candidates=[cid], labels=labels, kind=kind,
                          rounds=4, positions=positions, warmup_calls=0))
            existing = [row for row in st.records() if row.get('event') == 'measurement' and row.get('campaign') == campaign]
            lookup = {(row['case'], row['condition'], row['rep'], row['order']): row for row in existing}
            assert len(existing) == len(lookup) and all(row['valid'] and row['boot_id'] == boot for row in existing)
            for job in positions:
                key = (job['case'], job['condition'], job['rep'], job['order'])
                if key not in lookup:
                    lookup[key] = st.invoke(kind, job['case'], job['condition'], job['N'], 'independent_recheck', campaign, job['order'], job['rep'])
            lab.save(output, dict(status='COMPLETE_INDEPENDENT4_ROUND_RECHECK', candidate=cid, kind=kind,
                                  campaign=campaign, expected=len(positions), actual=len(lookup), boot_id=boot))
            print('RECHECK_COMPLETE', cid, kind, len(lookup), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['full', 'recheck'])
    args = parser.parse_args()
    try:
        if args.action == 'full': collect_full()
        else: collect_recheck()
    except Exception as exc:
        lab.append(dict(event='promotion_controller_error', timestamp=lab.stamp(),
                        error_type=type(exc).__name__, error=str(exc), traceback=traceback.format_exc()))
        raise

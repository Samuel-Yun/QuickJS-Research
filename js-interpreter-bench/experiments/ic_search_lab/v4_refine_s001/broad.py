"""Fallback interaction screen only after small complete-suite corrections."""
from collections import Counter
import hashlib
import json
import math
import os
from pathlib import Path
import random
import statistics

import refine as r
import combinations

H = r.H
lab = r.lab


def main():
    r.gate()
    assert (H / 'extension.complete.json').exists(), 'Finish corrections before fallback expansion'
    all_screens = [lab.load(path) for path in H.glob('rf*.screen.json') if path.name != 'rf000.screen.json']
    assert not any(row['core_over_s001'] <= .985 for row in all_screens), 'An obvious correction signal needs recheck before broad search'
    descriptions = combinations.descriptions()
    r.SOURCE['broad.py'] = lab.sha(Path(__file__))
    r.SOURCE['combinations.py'] = lab.sha(H / 'combinations.py')
    original_render = r.variants.render

    def render(cid):
        return combinations.render(cid) if cid.startswith('mx') else original_render(cid)

    r.variants.render = render
    r.variants.DESIGNS += descriptions
    rows = lab.load(H / 'state.json')
    for design in descriptions:
        if not any(row['id'] == design['id'] for row in rows):
            rows.append(dict(design, status='PLANNED'))
    r.atomic('state.json', rows)
    short = [('sunspider', case) for case in ['3d-raytrace', 'access-binary-trees', 'bitops-bitwise-and', 'regexp-dna']]
    short += [('octane', case) for case in ['Richards.Richards', 'Splay.Splay', 'RayTrace.RayTrace', 'CodeLoad.CodeLoadClosure']]
    ns = lab.load(r.V3 / 'short_n.json')['N']
    ids = [row['id'] for row in descriptions]
    random.Random(r.SEED).shuffle(ids)
    blocks = [ids[index:index + 6] for index in range(0, len(ids), 6)]
    protocol = dict(status='FROZEN_BEFORE_BOUNDED_INTERACTION_SCREEN', configurations=descriptions,
                    ids=ids, blocks=blocks, short=short, N=ns, seed=r.SEED, boot_id=lab.boot(),
                    original_corrections=len(all_screens), original_clear_signals=0, CI='not estimated',
                    scope='48 configurations of already-described corrections; not48 new algorithms',
                    next_budget='Up to4 single-pass full Octane; then only clear signals repeat',
                    earlier_times_used_as_denominator=False)
    lab.save(H / 'broad.protocol.json', protocol)
    for name in ['refine.py', 'variants.py', 'broad.py', 'combinations.py']:
        lab.save(H / 'runners' / (name[:-3] + '.' + lab.sha(H / name) + '.py'), (H / name).read_bytes())
    details = []
    summaries = []
    for number, group in enumerate(blocks):
        result_path = H / ('broad.block' + str(number) + '.json')
        if result_path.exists():
            continue
        eligible = []
        for cid in group:
            source = combinations.render(cid)
            hashes = {name: hashlib.sha256(text.encode()).hexdigest() for name, text in source.items()}
            duplicate = None
            for path in (H / 'identities').glob('rf*.json'):
                art = lab.load(path)
                if art.get('source_sha256') == hashes:
                    duplicate = art['id']
                    break
            if duplicate:
                r.update(cid, status='DUPLICATE', duplicate_of=duplicate, reason='Exact source already screened in this cohort')
            elif r.build(cid):
                eligible.append(cid)
        trials = []
        if eligible:
            for trial in range(2):
                before = {}; after = {}; values = {}
                campaign = 'refine.broad.' + lab.load(H / 'protocol.json')['tag'] + '.block' + str(number) + '.trial' + str(trial)
                jobs = short.copy()
                random.Random(r.SEED + number).shuffle(jobs)
                for order, (kind, case) in enumerate(jobs):
                    n = ns[kind + '/' + case]
                    before[(kind, case)] = r.measure.invoke(r.measure.inputs(kind), 's001', case, 's001', n,
                                                           'bounded_interaction_screen', order, 0, campaign)
                tasks = [(cid, kind, case) for cid in eligible for kind, case in short]
                random.Random(r.SEED + number + 101).shuffle(tasks)
                for order, (cid, kind, case) in enumerate(tasks, 10):
                    values[(cid, kind, case)] = r.measure.invoke(r.measure.inputs(kind), cid, case, cid, ns[kind + '/' + case],
                                                               'bounded_interaction_screen', order, 0, campaign)
                for order, (kind, case) in enumerate(jobs, 1000):
                    after[(kind, case)] = r.measure.invoke(r.measure.inputs(kind), 's001', case, 's001', ns[kind + '/' + case],
                                                          'bounded_interaction_screen', order, 0, campaign)
                drifting = [dict(kind=kind, case=case, max_over_min=max(before[(kind, case)]['elapsed_ms'], after[(kind, case)]['elapsed_ms']) /
                                min(before[(kind, case)]['elapsed_ms'], after[(kind, case)]['elapsed_ms']))
                            for kind, case in short]
                data = []
                for cid in eligible:
                    for kind, case in short:
                        reference = math.sqrt(before[(kind, case)]['elapsed_ms'] * after[(kind, case)]['elapsed_ms'])
                        data.append(dict(candidate=cid, kind=kind, case=case,
                                         ratio=values[(cid, kind, case)]['elapsed_ms'] / reference,
                                         N=ns[kind + '/' + case], trial=trial))
                unstable = any(row['max_over_min'] > 1.15 for row in drifting)
                trial_data = dict(campaign=campaign, trial=trial, rows=data, drift=drifting, unstable=unstable)
                trials.append(trial_data)
                lab.save(H / ('broad.block' + str(number) + '.trial' + str(trial) + '.json'), trial_data)
                if not unstable:
                    break
            quality = 'UNSTABLE' if trials[-1]['unstable'] else 'RETRY_RECOVERED' if len(trials) > 1 else 'OK'
            for row in trials[-1]['rows']:
                details.append(dict(row, quality=quality, block=number))
            for cid in eligible:
                record = dict(candidate=cid, quality=quality, block=number)
                for kind in ['sunspider', 'octane']:
                    ratios = [row['ratio'] for row in trials[-1]['rows'] if row['candidate'] == cid and row['kind'] == kind]
                    assert len(ratios) == 4
                    record[kind + '_subset_ratio'] = math.exp(statistics.mean(math.log(value) for value in ratios))
                summaries.append(record)
                r.update(cid, status='SCREENED_SHORT_ONLY', broad_quality=quality,
                         screen_octane4=record['octane_subset_ratio'], screen_sun4=record['sunspider_subset_ratio'])
        lab.save(result_path, dict(block=number, scheduled=group, measured=eligible, trials=trials,
                 quality=quality if eligible else 'NO_NEW_SOURCES', rows=[row for row in details if row['block'] == number],
                 summaries=[row for row in summaries if row['block'] == number], boot_id=lab.boot()))
        r.atomic('progress.json', dict(stage='bounded_interactions', completed_block=number, boot_id=lab.boot(),
                 measured=sum(len(lab.load(path)['measured']) for path in H.glob('broad.block*.json') if '.trial' not in path.name)))
        print('BROAD_BLOCK_COMPLETE', number, eligible, flush=True)
    blocks_data = [lab.load(path) for path in H.glob('broad.block*.json') if '.trial' not in path.name]
    details = [row for block in blocks_data for row in block['rows']]
    summaries = [row for block in blocks_data for row in block['summaries']]
    r.csvfile('broad.per_case.csv', details); r.csvfile('broad.summary.csv', summaries)
    ordered = sorted(summaries, key=lambda row: (row['quality'] == 'UNSTABLE', row['octane_subset_ratio']))
    selected = [row['candidate'] for row in ordered[:4]]
    lab.save(H / 'broad.full_selection.json', dict(selected=selected, rule='At most4 lower stable-preferred Octane subset points; noCI or overall claim'))
    # Register the same renderer in this process, then use the full single-pass runner.
    for cid in selected:
        r.screen(cid)
    lab.save(H / 'broad.complete.json', dict(status='BOUNDED_INTERACTIONS_AND_FULL_FOLLOWUP_COMPLETE',
             supported=len(summaries), configurations=48, full_selected=selected, boot_id=lab.boot()))
    print('BOUNDED_BROAD_COMPLETE', len(summaries), selected, flush=True)


if __name__ == '__main__':
    main()

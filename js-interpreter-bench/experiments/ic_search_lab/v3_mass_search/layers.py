"""Later layers reuse fixed inputs, independent processes and common N."""
import itertools
import json
import math
import random
import statistics
import time
from pathlib import Path

import stages as st
import analysis

H = st.H
s = st.s
lab = st.lab


def stability():
    """One predeclared longer-N retry. Failed pilot data remain intact."""
    assert (H / 'pilot.complete.json').exists(), 'Let the original representative pilot finish first'
    finished = H / 'stability.complete.json'
    if finished.exists(): return lab.load(finished)
    initial = lab.load(H / 'short_n.json')
    override = dict(status='ONE_BOUNDED_LONGER_N_RETRY', N={key: value * 4 for key, value in initial['N'].items()},
                    factor=4, trigger='pilot endpoint drift exceeds15%; original samples retained',
                    drift_limit=1.15, maximum_retries=1, adopted_before_any_longer_N_samples=True)
    lab.save(H / 'short_n_override.json', override)
    lab.save(H / 'timing_amendment01.json', dict(reason='Observed pilot drift21-57%; short timings cannot rank candidates',
             original='short_n.json; pilot.block*.json', new='short_n_override.json', seed=s.SEED,
             decision='Uniformly multiply N by4 for all8 cases and conditions; never adjust candidate-specific inputs or threshold',
             if_repeat_drift='stop performance search with no candidate ranking, preserve all evidence and restore commands'))
    begin = time.monotonic()
    ids = lab.load(H / 'pilot.complete.json')['candidates']
    blocks = []
    for start in range(0, len(ids), 6):
        result = st.quick_block(ids[start:start + 6], 'longer_pilot.block' + str(start // 6), 'screen1_stability')
        blocks.append(result['block'])
        if result['endpoint_drift']:
            data = dict(status='BLOCKED_TIMING_DRIFT', blocks=blocks, offending=result['endpoint_drift'],
                        original_short_N='short_n.json', longer_N='short_n_override.json',
                        longer_samples=sum(r.get('event') == 'measurement' and r.get('stage') == 'screen1_stability' for r in st.records()),
                        seconds=time.monotonic() - begin, candidate_ranking_allowed=False,
                        environmental_root_cause='UNKNOWN; drift observed in unchanged A/s001, not attributed to a candidate or engine crash')
            lab.save(finished, data)
            lab.save(H / 'STOP', 'Repeated endpoint drift after the sole uniform4xN retry. Preserve samples. No broad search/ranking until explicit environment recovery.\n')
            print('BLOCKED_TIMING_DRIFT', json.dumps(data), flush=True)
            return data
    data = dict(status='PASS_LONGER_N_PILOT', blocks=blocks, seconds=time.monotonic() - begin)
    lab.save(finished, data)
    print('LONGER_PILOT_PASS', flush=True)
    return data


def select_level2():
    path = H / 'level2.selection.json'
    if path.exists(): return lab.load(path)['selected']
    assert (H / 'screen.complete.json').exists(), 'Finish supported initial configurations first'
    rows = [r for r in st.all_rows() if r['status'] == 'SCREENED' and r.get('short_drift') == 'OK']
    chosen = []

    def add(row, reason):
        if row['id'] not in chosen and len(chosen) < 28:
            chosen.append(row['id'])
            reasons[row['id']] = reason

    reasons = {}
    for family in ['P', 'L', 'T', 'Q', 'H', 'F', 'S']:
        group = sorted((r for r in rows if r['family'] == family), key=lambda r: r['screen_octane'])
        for row in group[:2]: add(row, 'two best stable short Octane points for this mechanism')
    per_case = []
    for path in H.glob('*.block*.json'):
        data = lab.load(path)
        if data.get('status') != 'COMPLETE_SHORT_SCREEN_NO_CI': continue
        for item in data['results']:
            if item['candidate'] not in {r['id'] for r in rows}: continue
            current = next(r for r in rows if r['id'] == item['candidate'])
            if current.get('short_block') != data['block']: continue
            cases = item['ratios']['octane/s001']['cases'] + item['ratios']['sunspider/s001']['cases']
            signal = min(r['ratio'] for r in cases)
            if signal <= .95: per_case.append((signal, item['candidate']))
    for signal, cid in sorted(per_case):
        add(next(r for r in rows if r['id'] == cid), 'single-case >=5% short signal; exploratory only')
        if len(chosen) >= 22: break
    for row in sorted(rows, key=lambda r: r['screen_octane']): add(row, 'remaining best stable Octane points')
    lab.save(H / 'level2.selection.json', dict(selected=chosen, reasons=reasons, maximum=28, policy='Frozen before any level2 samples; quotas preserve mechanisms; no CI at layer1'))
    return chosen


def medium_n():
    path = H / 'medium_n.json'
    if path.exists(): return lab.load(path)['N']
    ns = {}
    for kind in ['sunspider', 'octane']:
        info = st.measure.inputs(kind)
        for case in info['cases']:
            old = info['N'][case]
            n = old if case.startswith('Crypto.') else max(1, old // 4)
            ns[kind + '/' + case] = n
    lab.save(path, dict(N=ns, status='FROZEN_BEFORE_LEVEL2', rule='Existing sufficiently long N/4 rounded down, minimum one complete Run; Crypto exact original N/golden ciphertext; no input scaling'))
    return ns


def level2():
    ids = select_level2()
    ns = medium_n()
    for start in range(0, len(ids), 4):
        group = ids[start:start + 4]
        block = 'level2.block' + str(start // 4)
        outfile = H / (block + '.json')
        if outfile.exists(): continue
        campaign = 'v3.' + block
        assert not any(r.get('event') == 'measurement' and r.get('campaign') == campaign for r in st.records()), 'Partial level2 block needs explicit resume'
        jobs = [(kind, case) for kind in ['sunspider', 'octane'] for case in st.measure.inputs(kind)['cases']]
        random.Random(s.SEED + start).shuffle(jobs)
        results = []
        for kind, case in jobs:
            n = ns[kind + '/' + case]
            before = {label: st.invoke(kind, case, label, n, 'level2', campaign, p) for p, label in enumerate(['A', 's001'])}
            ordered = group.copy(); random.Random(s.SEED + start + len(results)).shuffle(ordered)
            candidates = {cid: st.invoke(kind, case, cid, n, 'level2', campaign, 2 + p) for p, cid in enumerate(ordered)}
            after = {label: st.invoke(kind, case, label, n, 'level2', campaign, 2 + len(group) + p) for p, label in enumerate(['s001', 'A'])}
            for cid in group:
                result = dict(candidate=cid, kind=kind, case=case, N=n, elapsed_per_Run_ms=candidates[cid]['elapsed_per_Run_ms'],
                              A_before_ms=before['A']['elapsed_per_Run_ms'], A_after_ms=after['A']['elapsed_per_Run_ms'],
                              s001_before_ms=before['s001']['elapsed_per_Run_ms'], s001_after_ms=after['s001']['elapsed_per_Run_ms'])
                for label in ['A', 's001']:
                    result['over_' + label] = result['elapsed_per_Run_ms'] / math.sqrt(result[label + '_before_ms'] * result[label + '_after_ms'])
                    result['drift_' + label] = max(result[label + '_before_ms'], result[label + '_after_ms']) / min(result[label + '_before_ms'], result[label + '_after_ms'])
                results.append(result)
        lab.save(outfile, dict(status='COMPLETE_LEVEL2_SINGLE_NO_CI', candidates=group, campaign=campaign, rows=results))
        for cid in group:
            own = [r for r in results if r['candidate'] == cid]
            sun = {r['case']: r['over_s001'] for r in own if r['kind'] == 'sunspider'}
            octane = {r['case']: r['over_s001'] for r in own if r['kind'] == 'octane'}
            s.update(cid, status='RECHECKED', level2_sun=analysis.aggregate('sunspider', sun),
                     level2_octane=analysis.aggregate('octane', octane), decision='level2 only, no confirmed claim')
        print('LEVEL2_BLOCK_COMPLETE', start // 4, group, flush=True)
    lab.save(H / 'level2.complete.json', dict(status='COMPLETE_LEVEL2', candidates=ids))
    analysis.writecsv('level2.per_case.csv', [row for p in H.glob('level2.block*.json') for row in lab.load(p)['rows']])


def recheck():
    raise RuntimeError('Choose supported candidates from actual level2 evidence and freeze the paired schedule before new repetitions')

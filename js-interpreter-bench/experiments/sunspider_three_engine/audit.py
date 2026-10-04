"""Independent raw-evidence audit (does not call campaign statistics functions)."""
from collections import Counter
import csv
import hashlib
import itertools
import json
import math
from pathlib import Path
import statistics
import experiment as x

def rows(path):
    with Path(path).open(encoding='utf-8', newline='') as f:
        return list(csv.DictReader(f))

def main():
    x.verified()
    errors = []
    included = [r['case'] for r in x.read(x.HERE / 'compatibility.json') if r['included']]
    report = {'cohort': x.config()['cohort'], 'metric': x.config()['metric'],
              'timestamp_utc': x.now(), 'old_data_preserved': True,
              'runtime_and_inputs_before_after_verified': True,
              'static_frontend_exclusion': 'UNKNOWN', 'modes': {}, 'errors': errors}
    all_correctness = x.all_records('correctness', 'MAIN')
    positions = Counter((r['case'], r['engine'], r['N']) for r in all_correctness if r['valid'])
    expected = {(c, e, n) for c in x.CASES for e in x.ENGINES for n in (1, 2)}
    report['correctness'] = {'expected': 156, 'attempts': len(all_correctness),
                             'valid_positions': len(positions),
                             'missing_or_failed': sorted(expected - positions.keys())}
    if any(v > 1 for v in positions.values()):
        errors.append('duplicate valid correctness position')
    for mode in x.MODES:
        if not (x.HERE / 'schedule' / (mode + '.json')).exists():
            continue
        cases = included if mode == 'MAIN' else [c for c in x.DIAGNOSTIC_CASES if c in included]
        schedule = x.read(x.HERE / 'schedule' / (mode + '.json'))
        raw = x.all_records('formal', mode)
        valid = [r for r in raw if r['valid']]
        lookup = {}
        for r in valid:
            key = (r['case'], r['engine'], r['rep'])
            if key in lookup:
                errors.append('duplicate valid formal ' + str(key))
            lookup[key] = r
            try:
                p = x.payload(r)
                if p['elapsed_ms'] <= 0:
                    raise ValueError('zero interval')
                if r['elapsed_ms'] != p['elapsed_ms'] or r['elapsed_per_call'] != p['elapsed_per_call_ms']:
                    raise ValueError('raw/payload timing differs')
                if r['checksum'] != p['checksum']:
                    raise ValueError('raw/payload checksum differs')
                if r['binary_sha256'] != x.cohort.manifest()['engines'][r['engine']]['binary']['sha256']:
                    raise ValueError('binary hash differs')
                if r['flags'] != x.cohort.manifest()['engines'][r['engine']]['runtime_flags']:
                    raise ValueError('runtime flags differ')
                if r['command'] != x.cohort.command(r['engine'], Path(r['script_path'])):
                    raise ValueError('command/adapter/diagnostic flags differ')
                if x.sha(r['script_path']) != r['script_sha256']:
                    raise ValueError('script hash differs')
                if r['checks_each_call'] or r['warmup_calls'] != (0 if mode == 'MAIN' else 1):
                    raise ValueError('measurement/check/warmup policy differs')
            except Exception as exc:
                errors.append(str(key) + ': ' + str(exc))
        expected = {(c, e, rep) for c in cases for e in x.ENGINES for rep in range(1, 31)}
        missing = sorted(expected - lookup.keys())
        if missing or lookup.keys() - expected:
            errors.append(mode + ': missing/unexpected formal positions')
        for item in schedule:
            r = lookup.get((item['case'], item['engine'], item['rep']))
            if r and any(r[k] != item[k] for k in item):
                errors.append(mode + ': schedule position differs')
        permutation_counts = {}
        position_counts = {}
        for c in cases:
            perm = Counter(tuple(i['permutation']) for i in schedule if i['case'] == c and i['order'] == 1)
            permutation_counts[c] = {'/'.join(k): v for k, v in perm.items()}
            if perm != Counter({p: 5 for p in itertools.permutations(x.ENGINES)}):
                errors.append(mode + ': six-permutation policy failed ' + c)
            for e in x.ENGINES:
                cnt = Counter(i['order'] for i in schedule if i['case'] == c and i['engine'] == e)
                position_counts[c + '/' + e] = dict(cnt)
                if cnt != Counter({1: 10, 2: 10, 3: 10}):
                    errors.append(mode + ': position balance failed ' + c + '/' + e)
        summary = rows(x.HERE / 'summary' / ('per_case.' + mode + '.csv'))
        median = {}
        below_target = 0
        for c in cases:
            selected = x.read(x.HERE / 'calibration' / mode / (c + '.selected.json'))
            n = selected['N']
            pilot = x.all_records('calibration', mode)
            for e in x.ENGINES:
                trials = [r for r in pilot if r['case'] == c and r['engine'] == e and r['valid']]
                at_n = [r for r in trials if r['N'] == n]
                if len(at_n) != 1 or at_n[0]['elapsed_ms'] < 1000:
                    errors.append(mode + ': calibration gate failed ' + c + '/' + e)
            for k in range(n.bit_length() - 1):
                smaller = [r for r in pilot if r['case'] == c and r['N'] == 2**k and r['valid']]
                if len(smaller) != 3 or all(r['elapsed_ms'] >= 1000 for r in smaller):
                    errors.append(mode + ': nonminimal/missing doubling pilot ' + c)
            full_checks = x.all_records('selected_n_correctness', mode)
            for e in x.ENGINES:
                if not any(r['case'] == c and r['engine'] == e and r['N'] == n and r['valid']
                           and r['checks_each_call'] for r in full_checks):
                    errors.append(mode + ': missing all-call independent gate ' + c + '/' + e)
                group = [r for r in valid if r['case'] == c and r['engine'] == e]
                if len(group) != 30 or {r['N'] for r in group} != {n}:
                    errors.append(mode + ': group size/N failed ' + c + '/' + e)
                    continue
                if len({r['script_sha256'] for r in valid if r['case'] == c}) != 1:
                    errors.append(mode + ': cross-engine script differs ' + c)
                values = sorted(r['elapsed_ms'] / n for r in group)
                med = statistics.median(values)
                median[c, e] = med
                calculated = {'median_ms': med, 'mean_ms': statistics.mean(values),
                              'sample_stddev_ms': statistics.stdev(values),
                              'IQR_ms': statistics.median(values[15:]) - statistics.median(values[:15]),
                              'min_ms': values[0], 'max_ms': values[-1]}
                output = next(r for r in summary if r['case'] == c and r['engine'] == e)
                for field, value in calculated.items():
                    if not math.isclose(float(output[field]), value, rel_tol=1e-12, abs_tol=1e-12):
                        errors.append(mode + ': statistic mismatch ' + c + '/' + e + '/' + field)
                below_target += sum(r['elapsed_ms'] < 1000 for r in group)
        pair = rows(x.HERE / 'summary' / ('pairwise.' + mode + '.csv'))
        complete = [c for c in cases if all((c, e) in median for e in x.ENGINES)]
        pairs = {'V8/QJS': ('v8', 'quickjs'), 'JSC/QJS': ('jsc', 'quickjs'), 'JSC/V8': ('jsc', 'v8')}
        for r in pair:
            for label, (a, b) in pairs.items():
                expected_ratio = median[r['case'], a] / median[r['case'], b]
                if not math.isclose(float(r[label]), expected_ratio, rel_tol=1e-12):
                    errors.append(mode + ': pairwise ratio differs')
        gmrows = rows(x.HERE / 'summary' / ('pairwise_summary.' + mode + '.csv'))
        gm = {}
        for r in gmrows:
            members = json.loads(r['cases'])
            a, b = pairs[r['pair']]
            expected_gm = math.exp(statistics.mean(math.log(median[c, a] / median[c, b]) for c in members)) if members else None
            if expected_gm is not None and not math.isclose(float(r['GM']), expected_gm, rel_tol=1e-12):
                errors.append(mode + ': GM differs ' + r['subset'])
            if r['subset'] == 'all_complete':
                if members != complete:
                    errors.append(mode + ': GM intersections differ')
                gm[r['pair']] = expected_gm
        report['modes'][mode] = {'expected_valid': len(cases) * 90,
                                'valid': len(valid), 'attempts': len(raw),
                                'invalid_attempts': len(raw) - len(valid), 'missing': missing,
                                'complete_intersection': complete, 'GM': gm,
                                'below_calibration_target_kept': below_target,
                                'permutation_counts': permutation_counts,
                                'engine_position_counts': position_counts}
    report['status'] = 'PASS' if not errors else 'FAIL'
    # Re-audits are distinct evidence, not overwrites of the original decision.
    target = x.HERE / 'summary/audit.json'
    if target.exists():
        target = x.HERE / 'summary/audits' / (report['timestamp_utc'].replace(':', '-') + '.json')
    x.save(target, report)
    print(json.dumps({'status': report['status'], 'modes': {k: {'valid': v['valid'], 'expected': v['expected_valid'],
                        'GM': v['GM']} for k, v in report['modes'].items()}, 'errors': errors}, indent=2), flush=True)
    if errors:
        raise RuntimeError('independent audit failed')

if __name__ == '__main__':
    main()

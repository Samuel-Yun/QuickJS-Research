"""Read historical CSVs only; never build or invoke a benchmark/runtime."""
import csv
import hashlib
import json
import math
from pathlib import Path

H = Path(__file__).resolve().parent
E = H.parents[1] / 'experiments'
sources = {}
comparisons = []
v8 = []


def read(name):
    path = E / name
    data = path.read_bytes()
    rows = list(csv.DictReader(data.decode().splitlines()))
    sources[name] = dict(sha256=hashlib.sha256(data).hexdigest(), rows=len(rows))
    return rows


def number(value):
    return float(value) if value not in ('', None) else None


def add(source, line, suite, case, candidate, denominator, ratio, n,
        low=None, high=None, quality='historical same-batch exploratory'):
    comparisons.append(dict(source=source, source_line=line, suite=suite, case=case,
        candidate=candidate, denominator=denominator, ratio=float(ratio),
        time_change_pct=100 * (float(ratio) - 1), n=int(n),
        low95=number(low), high95=number(high), quality=quality))


def write(name, rows):
    with (H / name).open('w', newline='') as out:
        writer = csv.DictWriter(out, list(dict.fromkeys(k for row in rows for k in row)), lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def main():
    lab = 'ic_search_lab/'
    for name, candidate, n in [('c004', 'c004', 3), ('v2_20261105/s004', 's004', 3),
                              ('v2_20261105/final', 's001', 30)]:
        for suite in ['octane', 'sunspider']:
            suffix = '.recheck_ratios.csv' if name == 'c004' else '.ratios.csv'
            source = lab + name + '.' + suite + suffix
            for line, r in enumerate(read(source), 2):
                numerator, denominator = r['comparison'].split('/')
                add(source, line, suite, r['case'], numerator, denominator, r['ratio'],
                    r.get('n', n), r['low95'], r['high95'])
    for name in ['v3_mass_search/exploration.level3.ratios.csv', 'v4_refine_s001/recheck.per_case.csv']:
        source = lab + name
        for line, r in enumerate(read(source), 2):
            add(source, line, r['kind'], r['case'], r['candidate'], r['denominator'],
                r['ratio'], r['rounds'], r['low95'], r['high95'])
    for suite in ['octane', 'sunspider']:
        source = lab + 'v5_structural/comparison_' + suite + '.csv'
        for line, r in enumerate(read(source), 2):
            for candidate in ['mx019', 'd03', 'd04']:
                if candidate + '_median_ms' not in r:
                    continue
                for denominator in ['A', 's001']:
                    ratio = float(r[candidate + '_median_ms']) / float(r[denominator + '_median_ms'])
                    prefix = candidate + '_over_' + denominator
                    if prefix in r:
                        assert math.isclose(ratio, float(r[prefix]), rel_tol=1e-12)
                    add(source, line, suite, r['case'], candidate, denominator, ratio,
                        r['samples_per_condition'], r.get(prefix + '_low95'), r.get(prefix + '_high95'))
    for stem, n in [('full_accept01_octane', 3), ('full_accept02_sunspider', 3), ('full_expand01_octane', 3)]:
        source = lab + 'v6_targeted_ic/' + stem + '.paired_intervals.csv'
        for line, r in enumerate(read(source), 2):
            if r['condition'] in ['A', 's001', 'ID_CTRL', 'ID_READ']:
                continue
            add(source, line, r['kind'], r['case'], r['condition'], r['denominator'],
                r['time_ratio'], n, r['ci95_low'], r['ci95_high'])
    for suite in ['octane', 'sunspider']:
        source = lab + 'v7_adaptive_layout/comparison_' + suite + '.csv'
        for line, r in enumerate(read(source), 2):
            if r['condition'] in ['A', 's001', 'a02'] or int(r['rounds']) < 3:
                continue
            for denominator in ['A', 's001']:
                add(source, line, suite, r['case'], r['condition'], denominator,
                    r['over_' + denominator], r['rounds'], r['ci95_low_' + denominator],
                    r['ci95_high_' + denominator], r['timing_quality'])

    for campaign in ['legacy_ng_ic', 'legacy_ng_ic_slotfix', 'legacy_ng_ic_read_hit',
                     'read_ic_mic', 'read_ic_dequickening', 'read_ic_hit_ablation']:
        source = campaign + '/attempt01/analysis/summary.csv'
        for line, r in enumerate(read(source), 2):
            labels = [k[10:-7] for k in r if k.startswith('execution_') and k.endswith('_median')]
            for candidate in labels:
                if candidate == 'A':
                    continue
                for denominator in ['A'] + (['M'] if candidate == 'R' else []):
                    ratio = float(r['execution_' + candidate + '_median']) / float(r['execution_' + denominator + '_median'])
                    add(source, line, 'micro' if r['case'].split('.')[0] in [f'M{i}' for i in range(1, 9)] else 'octane',
                        r['case'], candidate, denominator, ratio, r[candidate + '_n'])

    # Direct V8 comparisons retain the A measurement from that exact campaign.
    direct = [
        ('ic_search_lab/v2_20261105/final.octane.per_case.csv', 'octane', ['s001'], 30, 'v2'),
        ('v8_inspired_ic/attempt03/summary/comparison.csv', 'octane', ['E'], 30, 'standard'),
        ('ic_fast_slow_20261102/attempt01/octane/analysis/comparison.csv', 'octane', ['M', 'U'], 30, 'standard'),
        ('ic_fast_slow_20261102/attempt01/sunspider/analysis/comparison.csv', 'sunspider', ['M', 'U'], 30, 'standard'),
        ('ic_mechanism_audit/attempt01/analysis/summary.csv', 'mixed', ['M'], 30, 'audit'),
    ]
    for source, suite, labels, n, schema in direct:
        for line, r in enumerate(read(source), 2):
            a_key = {'v2': 'A_median_ms_per_Run', 'audit': 'QJS_A_median_ms'}.get(schema, 'A_median_ms')
            v8_key = 'V8_ON_median_ms_per_Run' if schema == 'v2' else 'V8_ON_median_ms'
            for candidate in labels:
                c_key = candidate + '_median_ms_per_Run' if schema == 'v2' else ('QJS_' if schema == 'audit' else '') + candidate + '_median_ms'
                a, c, v = map(float, [r[a_key], r[c_key], r[v8_key]])
                if schema == 'v2':
                    assert math.isclose(c / v, float(r['candidate_over_V8_ON']), rel_tol=1e-12)
                v8.append(dict(source=source, source_line=line, suite=suite, case=r['case'], candidate=candidate,
                    n=n, A_ms=a, candidate_ms=c, V8_ON_ms=v, candidate_over_A=c / a,
                    candidate_over_V8_ON=c / v, A_over_V8_ON=a / v,
                    change_pct_A=100 * (c / a - 1), change_pct_V8_ON=100 * (c / v - 1)))
                add(source, line, suite, r['case'], candidate, 'A', c / a, n)
                add(source, line, suite, r['case'], candidate, 'V8_ON', c / v, n)

    scan = []
    source = lab + 'v3_mass_search/exploration.per_case.csv'
    for line, r in enumerate(read(source), 2):
        if r['denominator'] == 'A':
            scan.append(dict(source=source, source_line=line, **r))
    source = lab + 'v3_mass_search/exploration.level2.per_case.csv'
    for line, r in enumerate(read(source), 2):
        scan.append(dict(source=source, source_line=line, **r))
    candidates = read(lab + 'v3_mass_search/exploration.candidates.csv')
    implemented = [r for r in candidates if r['status'] in ['SCREENED', 'RECHECKED']]
    assert len(implemented) == 248
    assert all(r['n'] >= 3 and r['ratio'] > 0 for r in comparisons)
    write('repeated_comparisons.csv', comparisons)
    write('same_batch_v8.csv', v8)
    write('v3_screening_points.csv', scan)
    (H / 'sources.json').write_text(json.dumps(dict(
        status='PASS_OFFLINE_EXTRACTION', benchmarks_executed=0, runtime_executed=False,
        v3_implemented_configurations=len(implemented), v3_planned_configurations=len(candidates),
        repeated_comparisons=len(comparisons), direct_v8_rows=len(v8),
        ratio_recomputation_tolerance=1e-12, sources=sources), indent=2) + '\n')
    print(json.dumps(dict(status='PASS_OFFLINE_EXTRACTION', source_csvs=len(sources),
        repeated_comparisons=len(comparisons), direct_v8_rows=len(v8), benchmarks_executed=0)))


if __name__ == '__main__':
    main()

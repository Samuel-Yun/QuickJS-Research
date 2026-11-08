"""Offline review of three Octane cases. Never builds or invokes an engine."""
import csv
import hashlib
import json
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
EXP = ROOT / 'experiments'
CASES = ('Splay.Splay', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery')
SOURCES = {}
ROWS = []


def read(relative):
    data = (ROOT / relative).read_bytes()
    SOURCES[relative] = hashlib.sha256(data).hexdigest()
    return list(csv.DictReader(data.decode().splitlines()))


def add(source, line, case, candidate, control, ratio, n, quality,
        low='', high='', candidate_ms='', control_ms='', scope='same campaign'):
    ratio = float(ratio)
    assert case in CASES and ratio > 0 and int(n) > 0
    if candidate_ms != '' and control_ms != '':
        assert math.isclose(float(candidate_ms) / float(control_ms), ratio, rel_tol=1e-12)
    ROWS.append(dict(source=source, source_line=line, case=case,
        candidate=candidate, control=control, n=int(n), ratio=ratio,
        time_change_pct=100 * (ratio - 1), low95=low, high95=high,
        candidate_ms=candidate_ms, control_ms=control_ms,
        quality=quality, control_scope=scope))


def write(name, rows):
    with (HERE / name).open('w', newline='') as out:
        writer = csv.DictWriter(out, list(rows[0]), lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def main():
    previous = 'notes/historical_highlights_20261108/repeated_comparisons.csv'
    old_manifest_path = ROOT / 'notes/historical_highlights_20261108/sources.json'
    old_manifest = json.loads(old_manifest_path.read_text())['sources']
    for r in read(previous):
        if r['case'] not in CASES or r['denominator'] == 'V8_ON':
            continue
        source = 'experiments/' + r['source']
        if source not in SOURCES:
            read(source)
        assert SOURCES[source] == old_manifest[r['source']]['sha256']
        add(source, r['source_line'], r['case'], r['candidate'], r['denominator'],
            r['ratio'], r['n'], r['quality'], r['low95'], r['high95'])

    # Check the highlighted ratios against the frozen descriptive statistics.
    for directory in ['v3_mass_search', 'v4_refine_s001']:
        stem = 'exploration.level3' if directory.startswith('v3') else 'recheck'
        prefix = f'experiments/ic_search_lab/{directory}/{stem}'
        stats = read(prefix + '.statistics.csv')
        lookup = {(r['candidate'], r['case'], r['condition']): float(r['median'])
                  for r in stats if r['case'] in CASES}
        source = prefix + ('.ratios.csv' if directory.startswith('v3') else '.per_case.csv')
        for r in ROWS:
            if r['source'] == source:
                key = (r['candidate'], r['case'])
                r['candidate_ms'] = lookup[(*key, r['candidate'])]
                r['control_ms'] = lookup[(*key, r['control'])]
                assert math.isclose(r['candidate_ms'] / r['control_ms'], r['ratio'], rel_tol=1e-12)

    # Single-process screens remain single-process screens, including UNSTABLE rows.
    prefix = 'experiments/ic_search_lab/v3_mass_search/'
    source = prefix + 'exploration.per_case.csv'
    for line, r in enumerate(read(source), 2):
        if r['case'] in CASES:
            add(source, line, r['case'], r['candidate'], r['denominator'],
                r['ratio'], 1, r['timing_quality'] + '; trial=' + r['trial'])
    source = prefix + 'exploration.level2.per_case.csv'
    for line, r in enumerate(read(source), 2):
        if r['case'] in CASES:
            for control in ['A', 's001']:
                add(source, line, r['case'], r['candidate'], control,
                    r['over_' + control], 1, 'SINGLE_FULL_SUITE; ' + r['timing_quality'],
                    candidate_ms=r['candidate_ms_per_Run'], control_ms=r[control + '_reference_ms'])
    source = 'experiments/ic_search_lab/v4_refine_s001/screen.per_case.csv'
    for line, r in enumerate(read(source), 2):
        if r['case'] in CASES:
            add(source, line, r['case'], r['candidate'], 'A', r['ratio_over_A'],
                1, 'SINGLE_FULL_SUITE; ' + r['quality'], candidate_ms=r['ms_per_Run'])
            add(source, line, r['case'], r['candidate'], 's001', r['ratio'],
                1, 'SINGLE_FULL_SUITE; ' + r['quality'], candidate_ms=r['ms_per_Run'],
                control_ms=r['s001_reference_ms_per_Run'])

    # Retain the local A/s001 times for the clock-limited v7 campaigns.
    source = 'experiments/ic_search_lab/v7_adaptive_layout/comparison_octane.csv'
    v7 = read(source)
    lookup = {(r['campaign'], r['case'], r['condition']): r['median_ms_per_Run'] for r in v7}
    for r in ROWS:
        if r['source'] == source:
            original = v7[int(r['source_line']) - 2]
            key = (original['campaign'], r['case'])
            r['candidate_ms'] = lookup[(*key, r['candidate'])]
            r['control_ms'] = lookup[(*key, r['control'])]
            assert math.isclose(float(r['candidate_ms']) / float(r['control_ms']), r['ratio'], rel_tol=1e-12)

    # This partial cohort was followed by the complete 30-process cohort.
    source = 'experiments/v8_inspired_ic/attempt02/summary/comparison.csv'
    for line, r in enumerate(read(source), 2):
        if r['case'] in CASES:
            a, value = float(r['A_median_ms']), float(r['E_median_ms'])
            add(source, line, r['case'], 'E', 'A', value / a, r['E_n'],
                'INCOMPLETE_INTERRUPTED; not the completed attempt03 cohort',
                candidate_ms=value, control_ms=a)

    source = 'experiments/ic_search_lab/v6_targeted_ic/full_expand01_octane.times_and_parent_ratios.csv'
    for line, r in enumerate(read(source), 2):
        if r['case'] in CASES:
            for candidate in ['s001', 'P1', 'L1']:
                value, a = float(r[candidate + '_ms_per_Run']), float(r['A_ms_per_Run'])
                add(source, line, r['case'], candidate, 'A', value / a, 3,
                    'EXPLORATORY; inspect same-campaign s001 before attributing a gain',
                    candidate_ms=value, control_ms=a)

    native = ['native_octane_20261107/attempt01', 'native_octane_20261107/attempt02',
              'native_octane_20261108/attempt01', 'native_octane_20261108/attempt03',
              'native_octane_20261108/attempt04']
    a_source = 'experiments/' + native[0] + '/statistics.csv'
    a_times = {r['case']: float(r['median_ms']) for r in read(a_source) if r['condition'] == 'A'}
    for cohort in native:
        source = 'experiments/' + cohort + '/statistics.csv'
        for line, r in enumerate(read(source), 2):
            if r['case'] in CASES and r['condition'] not in ['A', 'V8_ON']:
                value, a = float(r['median_ms']), a_times[r['case']]
                ratio = value / a
                assert math.isclose(ratio, float(r['over_A']), rel_tol=1e-12)
                add(source, line, r['case'], r['condition'], 'A', ratio, r['n'],
                    'NATIVE_UBUNTU; five-process median', candidate_ms=value, control_ms=a,
                    scope='same campaign' if cohort == native[0] else 'reused native A; separate campaign')

    write('target_comparisons.csv', ROWS)
    audit = dict(status='PASS_OFFLINE', cases=CASES, rows=len(ROWS),
        benchmarks_executed=0, runtime_executed=False, build_executed=False,
        ratio_tolerance=1e-12, sources=SOURCES,
        scope='Frozen statistics and source labels; not a new per-process raw audit. '
              'No merging of different campaigns or hosts; UNSTABLE/partial/clock-limited labels retained.')
    (HERE / 'audit.json').write_text(json.dumps(audit, indent=2) + '\n')
    print(json.dumps({k: v for k, v in audit.items() if k != 'sources'}))


if __name__ == '__main__':
    main()

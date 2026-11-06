"""Portable offline summaries. No binaries are launched by this module."""
import csv
import gzip
import hashlib
import json
import math
import os
import statistics
from collections import Counter
from pathlib import Path

H = Path(__file__).resolve().parent


def load(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))


def rows():
    raw = H / 'runs.jsonl'
    archive_only = os.environ.get('IC_SEARCH_V3_ARCHIVE_ONLY') == '1'
    compressed = not raw.exists() or archive_only
    if compressed:
        archive = H / 'runs.jsonl.gz'
        expected = load(H / 'raw_archive.json')
        assert hashlib.sha256(archive.read_bytes()).hexdigest() == expected['compressed_sha256']
    opener = raw.open if not compressed else lambda **kw: gzip.open(H / 'runs.jsonl.gz', 'rt', **kw)
    digest = hashlib.sha256()
    data = []
    with opener(encoding='utf-8', newline='') as stream:
        for line in stream:
            digest.update(line.encode('utf-8'))
            data.append(json.loads(line))
    if compressed: assert digest.hexdigest() == expected['uncompressed_sha256']
    return data


def writecsv(name, data):
    if not data: return
    columns = list(dict.fromkeys(key for row in data for key in row))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, columns, lineterminator='\n')
        writer.writeheader(); writer.writerows(data)


def gm(values):
    assert values and all(value > 0 and math.isfinite(value) for value in values)
    return math.exp(statistics.mean(math.log(value) for value in values))


def aggregate(kind, ratios, expanded=False):
    if kind == 'sunspider':
        assert len(ratios) == 26
        return gm(list(ratios.values()))
    if not expanded: ratios = {case: value for case, value in ratios.items() if case != 'zlib.zlib'}
    assert len(ratios) == (17 if expanded else 16)
    suites = {}
    for case, value in ratios.items(): suites.setdefault(case.split('.')[0], []).append(value)
    assert len(suites) == (14 if expanded else 13)
    return gm([gm(values) for values in suites.values()])


def main():
    states = load(H / 'state.json')
    counts = Counter(r['status'] for r in states)
    samples = [r for r in rows() if r.get('event') == 'measurement']
    phase_counts = Counter(r['stage'] for r in samples)
    per_case = []
    summaries = []
    for path in sorted(H.glob('*.block*.json')):
        block = load(path)
        if 'results' not in block: continue
        for result in block['results']:
            for comparison, data in result['ratios'].items():
                kind, baseline = comparison.split('/')
                summaries.append(dict(candidate=result['candidate'], kind=kind, baseline=baseline,
                                      short_subset_gm=data['gm'], block=block['block'], block_status=block['status'], CI='not estimated'))
                for item in data['cases']:
                    per_case.append(dict(candidate=result['candidate'], kind=kind, baseline=baseline,
                                         **item, block=block['block'], block_status=block['status']))
    writecsv('short_summary.csv', summaries)
    writecsv('short_per_case.csv', per_case)
    actual = [r for r in states if r.get('binary_sha256')]
    snapshot = dict(status='IN_PROGRESS' if any(r['status'] in ['PLANNED', 'BUILDING', 'CHECKED'] for r in states) else 'INITIAL_LAYER_ACCOUNTED_FOR',
                    initial_ids=288, total_ids=len(states), actual_binaries=len(actual), counts=dict(counts),
                    sample_phase_counts=dict(phase_counts), valid_measurements=sum(bool(r.get('valid')) for r in samples),
                    invalid_measurements=sum(not r.get('valid') for r in samples))
    if (H / 'stability.complete.json').exists():
        snapshot['status'] = load(H / 'stability.complete.json')['status']
        snapshot['accepted_complete_screen_configs'] = 0 if snapshot['status'] == 'BLOCKED_TIMING_DRIFT' else None
    snapshot['formal_measurements'] = sum(r['stage'] == 'formal' for r in samples)
    (H / 'summary.json').write_text(json.dumps(snapshot, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(snapshot, ensure_ascii=False), flush=True)


def audit():
    raw = rows()
    starts = {r['token']: r for r in raw if r.get('event') == 'process_start'}
    results = {r['token']: r for r in raw if r.get('event') == 'process_result'}
    samples = [r for r in raw if r.get('event') == 'measurement']
    problems = []
    missing = sorted(starts.keys() - results.keys())
    if missing: problems.append('unmatched process starts')
    keys = set()
    for row in samples:
        result = results.get(row['process_token'])
        if result is None:
            problems.append('measurement missing process_result'); continue
        if not row['valid']:
            problems.append('invalid measurement retained'); continue
        if row['boot_id'] != row['boot_id_after'] or result['exit_code'] != 0:
            problems.append('boot/exit contradiction')
        if row['elapsed_ms'] <= 0 or abs(row['elapsed_ms'] / row['N'] - row['elapsed_per_Run_ms']) > 1e-9:
            problems.append('elapsed/N contradiction')
        if row['identity']['script_sha256'] != result['identity']['script_sha256']:
            problems.append('script identity contradiction')
        key = (row['campaign'], row['kind'], row['case'], row['condition'], row['rep'], row['order'], row['N'])
        if key in keys: problems.append('duplicate measurement position')
        keys.add(key)
    data = dict(status='PASS_RECORDED_DATA_ONLY' if not problems else 'REVIEW_REQUIRED',
                problems=sorted(set(problems)), unmatched_starts=missing, process_starts=len(starts), process_results=len(results),
                measurements=len(samples), phase_counts=dict(Counter(r['stage'] for r in samples)),
                boots=sorted({r['boot_id'] for r in samples}),
                limitation='Does not certify unrun configurations, source safety, or missing experiment stages; no engine access')
    if (H / 'STOP').exists(): data['search_status'] = 'BLOCKED_TIMING_DRIFT'
    (H / 'audit.json').write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(data, ensure_ascii=False), flush=True)

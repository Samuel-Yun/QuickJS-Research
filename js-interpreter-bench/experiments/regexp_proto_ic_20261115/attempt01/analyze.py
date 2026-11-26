"""Offline analysis only: never starts an interpreter or creates new samples."""
import collections
import csv
import hashlib
import json
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OLD = ROOT / 'experiments/execution_paths_20261114/attempt01'


def read(p):
    return json.loads(p.read_text())


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def gm(values):
    return math.exp(sum(math.log(v) for v in values) / len(values))


def aggregate(rows, column, suite):
    groups = collections.defaultdict(list)
    for row in rows:
        group = row['case'].split('.')[0] if suite == 'octane' else row['case']
        groups[group].append(row['B3_ms'] / row[column])
    assert len(groups) == (14 if suite == 'octane' else 26)
    return 100 * (gm([gm(v) for v in groups.values()]) - 1)


def samples(mode, suite):
    folder = HERE / 'runs' / mode / suite
    assert read(folder / 'audit.json')['status'] == 'PASS'
    events = [json.loads(s) for s in (folder / 'runs.jsonl').read_text().splitlines()]
    expected = 17 if suite == 'octane' else 26
    assert collections.Counter(x['event'] for x in events) == {
        'process_start': expected, 'process_result': expected, 'sample': expected}
    rows = [x for x in events if x['event'] == 'sample']
    assert len({x['case'] for x in rows}) == expected and all(x['valid'] for x in rows)
    starts = [x for x in events if x['event'] == 'process_start']
    results = [x for x in events if x['event'] == 'process_result']
    assert len({x['token'] for x in starts}) == expected
    assert {x['token'] for x in starts} == {x['token'] for x in results}
    m = read(HERE / (mode + '.manifest.json'))
    for x in starts:
        assert x['identity']['binary_sha256'] == m['elf_sha256']
    protocol = read(folder / 'protocol.json')
    assert protocol['CPU'] == 2 and protocol['warmup_calls'] == 0
    for script in protocol['scripts'].values():
        assert sha(Path(script['path'])) == script['sha256']
    for path, digest in protocol['frozen_files'].items():
        assert sha(Path(path)) == digest
    for path, digest in protocol['input_files'].items():
        assert sha(ROOT / path) == digest
    for row in rows:
        assert row['N'] == protocol['scripts'][row['case']]['N']
        assert row['payload']['correctness'] == 'PASS'
    return {r['case']: r for r in rows}


def main():
    out = HERE / 'analysis'
    out.mkdir(exist_ok=True)
    # All four measured/diagnostic builds and the qualification gate stay frozen.
    for mode in ['inspect', 'release', 'counts', 'san']:
        manifest = read(HERE / (mode + '.manifest.json'))
        source_root = Path(manifest['elf']).parent
        assert sha(Path(manifest['elf'])) == manifest['elf_sha256']
        for name, digest in manifest['sources'].items():
            assert sha(source_root / name) == digest
    manifest = read(HERE / 'release.manifest.json')
    assert sorted(n for n in manifest['sources'] if manifest['sources'][n] != manifest['parent_sources'][n]) == [
        'read_ic_opcodes.inc', 'read_ic_runtime.inc']
    assert sha(ROOT / 'experiments/execution_paths_20261114/attempt01/candidates/TRANSITION_EDGE_STRONG-source.tar.gz') == manifest['parent_archive_sha256']
    gate = read(HERE / 'qualification/gate.json')
    assert gate['status'] == 'PASS'
    for name, digest in gate['frozen_files'].items():
        assert sha(Path(name)) == digest
    summaries = {}
    tables = []
    count_rows = []
    totals = collections.Counter()
    frozen = {}
    for suite, reference, ccol in [
        ('octane', OLD / 'runs/TRANSITION_EDGE_STRONG/octane/comparison.csv', 'candidate_ms'),
        ('sunspider', OLD / 'sunspider_timing01/comparison.csv', 'C_ms')]:
        old = list(csv.DictReader(reference.open()))
        frozen[str(reference)] = sha(reference)
        release, counts = samples('release', suite), samples('counts', suite)
        assert set(release) == set(counts) == {r['case'] for r in old}
        rows = []
        for r in old:
            case = r['case']
            c = counts[case]['counts']
            assert release[case]['N'] == counts[case]['N']
            assert c['regexp_named_queries'] == c['new_hits'] + c['fallbacks']
            assert c['normal_lookup_calls_skipped'] == 2 * c['new_hits']
            for key in ['regexp_named_queries', 'new_hits', 'fallbacks', 'normal_lookup_calls',
                        'normal_lookup_calls_skipped', 'exec_queries', 'exec_new_hits', 'promotions']:
                totals[key] += c[key]
            row = dict(case=case, N=release[case]['N'], A_ms=float(r['A_ms']),
                       EVAL_COLD_ms=float(r['EVAL_COLD_ms']), C_ms=float(r[ccol]),
                       B3_ms=release[case]['ms_per_Run'])
            for col in ['A', 'EVAL_COLD', 'C']:
                row['vs_' + col + '_pct'] = 100 * (row['B3_ms'] / row[col + '_ms'] - 1)
            row.update(queries=c['regexp_named_queries'], hits=c['new_hits'], fallbacks=c['fallbacks'])
            rows.append(row)
            count_rows.append(dict(suite=suite, case=case, **{k:v for k,v in c.items() if k != 'sites'}))
        summaries[suite] = {col:aggregate(rows, col + '_ms', suite) for col in ['A','EVAL_COLD','C']}
        if suite == 'sunspider':
            sums = {col:sum(r[col + '_ms'] for r in rows) for col in ['A','EVAL_COLD','C','B3']}
            summaries[suite]['sum_ms'] = sums
        with (out / (suite + '.csv')).open('w') as f:
            writer = csv.DictWriter(f, fieldnames=list(rows[0])); writer.writeheader(); writer.writerows(rows)
        table = ['| 表项 | A（历史） | EVAL_COLD（历史） | C（旧单轮） | 3B（新单轮） | 3B 相对 C | 新命中 / 回退 |',
                 '|---|---:|---:|---:|---:|---:|---:|']
        for r in rows:
            case = r['case']
            if suite == 'octane':
                case = case.split('.')[1] if case.split('.')[0] == case.split('.')[1] else case
                case = case.replace('CodeLoad.CodeLoad', 'CodeLoad.')
            table.append(f"| {case} | {r['A_ms']:.4f} | {r['EVAL_COLD_ms']:.4f} | {r['C_ms']:.4f} | {r['B3_ms']:.4f} | {r['vs_C_pct']:+.2f}% | {r['hits']:,} / {r['fallbacks']:,} |")
        table += ['', '3B 几何平均时间变化：' + '；'.join(f"相对 {col} **{summaries[suite][col]:+.4f}%**" for col in ['A','EVAL_COLD','C']) + '。', '']
        (out / (suite + '.md')).write_text('\n'.join(table))
        tables.extend([f'### {suite}', '', *table])
    with (out / 'counts.csv').open('w') as f:
        writer=csv.DictWriter(f,fieldnames=list(count_rows[0]));writer.writeheader();writer.writerows(count_rows)
    pre = read(HERE / 'preflight/RegExp_counts.json')
    reg = samples('counts', 'octane')['RegExp.RegExp']['counts']
    assert pre['regexp_named_queries'] == reg['regexp_named_queries'] == 5432000
    assert pre['normal_lookup_calls'] - reg['normal_lookup_calls'] == reg['normal_lookup_calls_skipped']
    summary = dict(status='PASS',fresh_release_processes=43,independent_count_processes=43,
                   C_formal_retests=0,aggregates=summaries,counts_total=dict(totals),
                   parent_comparison='historical cross-batch single C vs fresh single 3B',
                   unit='milliseconds / complete Run; smaller is faster',
                   octane_aggregation='equal 14 suites; geometric mean within split suites',
                   reference_sha256=frozen)
    (out / 'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (out / 'tables.md').write_text('\n'.join(tables))
    (HERE / 'results.md').write_text((HERE / 'method.md').read_text() + '\n' + '\n'.join(tables))
    print(json.dumps(summary,indent=2))


if __name__ == '__main__':
    main()

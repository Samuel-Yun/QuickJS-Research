"""Portable raw audit and tables for the user-authorized ten-condition batch."""
import argparse
import csv
import datetime as dt
import gzip
import hashlib
import math
from pathlib import Path
import statistics as st

import performance_report as report


H = Path(__file__).resolve().parent
ROOT = H.parents[2]
LABELS = ['A', 's001', 'B2', 'K1', 'L1', 'W1', 'P1', 'C1', 'ID_CTRL', 'ID_READ']
EPOCH = 'expand01'


def archive_rows():
    metadata = report.load(H / 'performance_expand01.archive.json')
    packed = (H / metadata['file']).read_bytes()
    assert hashlib.sha256(packed).hexdigest() == metadata['sha256']
    plain = gzip.decompress(packed)
    assert hashlib.sha256(plain).hexdigest() == metadata['decompressed_sha256']
    return [report.json.loads(line) for line in plain.splitlines()]


def summarize_one_round():
    name = 'full_expand01_sunspider.one_round'
    completion = report.load(H / (name + '.completed.json'))
    assert completion['status'] == 'COMPLETE_USER_ONE_ROUND'
    raw = archive_rows()
    rows = [row for row in raw if row['event'] == 'measurement' and
            row['campaign'] == 'full_expand01_sunspider' and row['rep'] == 0]
    assert len(rows) == 260 and all(row['valid'] for row in rows)
    lookup = {(row['case'], row['condition']): row for row in rows}
    assert len(lookup) == 260
    output = []
    for (case, label), row in sorted(lookup.items()):
        own = row['elapsed_per_Run_ms']
        baseline = lookup[case, 'A']['elapsed_per_Run_ms']
        seed = lookup[case, 's001']['elapsed_per_Run_ms']
        parent_label = report.PARENT[label]
        parent = lookup.get((case, parent_label), {}).get('elapsed_per_Run_ms')
        output.append(dict(kind='sunspider', case=case, condition=label, actual_parent=parent_label,
                           N=row['N'], n=1, median_ms_per_Run=own, mean_ms_per_Run=own,
                           sample_stddev_ms=None, q1_ms=own, q3_ms=own, iqr_ms=0,
                           min_ms=own, max_ms=own, over_parent=own / parent if parent else None,
                           parent_change_pct=100 * (own / parent - 1) if parent else None,
                           over_A=own / baseline, over_s001=own / seed,
                           timing_status='COMPLETE_USER_ONE_ROUND', point_estimate_only=True))
    report.table(name + '.parent_summary.csv', output)
    aggregates = []
    for label in LABELS:
        for denominator in dict.fromkeys(['A', 's001', report.PARENT[label]]):
            if not denominator or denominator == label or denominator not in LABELS:
                continue
            ratio = report.gm(lookup[case, label]['elapsed_per_Run_ms'] /
                              lookup[case, denominator]['elapsed_per_Run_ms']
                              for case in report.info_cases('sunspider'))
            aggregates.append(dict(subset='SunSpider26', condition=label, denominator=denominator,
                                   time_ratio=ratio, time_change_pct=100 * (ratio - 1),
                                   ci95_low=None, ci95_high=None, rounds=1, bootstrap_draws=0,
                                   unit='one fresh process per case and condition', direction='point_only',
                                   interpretation='User-requested single round; uncertainty UNKNOWN'))
    report.table(name + '.aggregate.csv', aggregates)


def read_csv(name):
    with (H / name).open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))


def markdown(headers, rows):
    lines = ['| ' + ' | '.join(headers) + ' |', '|' + '|'.join('---' for _ in headers) + '|']
    lines.extend('| ' + ' | '.join(map(str, row)) + ' |' for row in rows)
    return '\n'.join(lines) + '\n'


def local_path(value):
    if value.startswith('/mnt/c/') and Path('C:/').exists():
        return Path('C:/' + value[len('/mnt/c/'):])
    return Path(value)


def audit_raw(check_files):
    raw = archive_rows()
    starts = {row['token']: row for row in raw if row['event'] == 'process_start'}
    results = {row['token']: row for row in raw if row['event'] == 'process_result'}
    stop = report.load(H / 'sunspider_one_round_stop.expand01.json')
    cancelled_pids = {child['pid'] for child in stop['cancelled_next_round_children']}
    unmatched = set(starts) - set(results)
    for token in unmatched:
        start = starts[token]
        assert start['child_pid'] in cancelled_pids
        assert start['identity']['campaign'] == 'full_expand01_sunspider' and start['identity']['rep'] >= 1
    assert set(results) <= set(starts)
    assert not (H / 'STOP.expand01.json').exists(), 'Saved STOP needs review'
    audits = []
    verified_files = {}
    boot_ids = set()
    for kind, target, rounds in [('octane', 510, 3), ('sunspider', 260, 1)]:
        name = 'full_expand01_' + kind
        output_name = name if kind == 'octane' else name + '.one_round'
        plan = report.load(H / (name + '.protocol.json'))
        completion = report.load(H / (output_name + '.completed.json'))
        assert completion['status'] == ('COMPLETE' if kind == 'octane' else 'COMPLETE_USER_ONE_ROUND')
        assert completion['valid'] == completion['expected'] == target
        assert plan['labels'] == LABELS and plan['rounds'] == 3
        assert plan['extra_warmup'] == 0 and plan['epoch'] == EPOCH
        post = report.load(H / (output_name + '.identity_after.json'))
        assert post['status'] == 'PASS' and post['boot_id'] == plan['boot_id']
        expected = {(group['case'], label, group['rep']): (position, group['N'])
                    for group in plan['order'] if group['rep'] < rounds
                    for position, label in enumerate(group['conditions'])}
        measurements = [row for row in raw if row['event'] == 'measurement' and
                        row['campaign'] == name and row['rep'] < rounds]
        assert len(measurements) == target
        observed = set()
        scripts = {}
        grouped = {}
        below_threshold = 0
        info = report.load(H / (kind + '.inputs.json'))
        for row in measurements:
            key = row['case'], row['condition'], row['rep']
            assert key in expected and key not in observed
            observed.add(key)
            assert (row['order'], row['N']) == expected[key]
            proc = results[row['process_token']]
            start = starts[row['process_token']]
            assert row['valid'] and proc['exit_code'] == 0 and not proc['timeout'] and not proc['stderr']
            assert proc['command'] == start['command']
            assert row['boot_id'] == row['boot_id_after'] == proc['boot_id'] == proc['boot_id_after'] == plan['boot_id']
            assert row['elapsed_ms'] > 0 and row['elapsed_ms'] <= proc['wall_time_ms'] + 5
            assert row['elapsed_per_Run_ms'] == row['elapsed_ms'] / row['N']
            utc_ms = (dt.datetime.fromisoformat(proc['completed_at']) -
                      dt.datetime.fromisoformat(proc['timestamp'])).total_seconds() * 1000
            assert abs(utc_ms - proc['wall_time_ms']) <= 1000
            assert row['mode'] == 'FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1'
            assert row['payload']['correctness'] == 'PASS' and row['payload']['warmup_calls'] == 0
            assert row['payload']['case'] == row['case'] and row['payload']['N'] == row['N']
            identity = report.load(H / 'identities' / (row['condition'] + '.json'))
            assert row['identity']['binary_sha256'] == proc['identity']['binary_sha256'] == identity['sha256']
            assert proc['command'][0] == identity['path']
            flags = proc['command'][1:-1]
            if row['case'] == 'zlib.zlib':
                assert flags[:2] == ['--std', '-I'] and flags[2].endswith('/inputs/zlib_read.js')
            else:
                assert not flags
            assert row['identity']['input_sha256'] == info['files']
            assert row['identity']['script_sha256'] == proc['identity']['script_sha256']
            scripts.setdefault((row['case'], row['N']), set()).add(row['identity']['script_sha256'])
            if kind == 'sunspider':
                assert row['checksum'] in info['contract']['allowed'][row['case']]
            elif row['case'].startswith('Crypto.'):
                golden_path = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto' / (row['case'] + '.N' + str(row['N']) + '.json')
                assert row['checksum'] == report.load(golden_path)['final_ciphertext']
            if check_files:
                targets = [(local_path(identity['path']), identity['sha256']),
                           (local_path(proc['command'][-1]), row['identity']['script_sha256'])]
                targets.extend((ROOT / path, digest) for path, digest in info['files'].items())
                for path, digest in targets:
                    if str(path) not in verified_files:
                        verified_files[str(path)] = hashlib.sha256(path.read_bytes()).hexdigest()
                    assert verified_files[str(path)] == digest, str(path)
            grouped.setdefault((row['case'], row['condition']), []).append(row['elapsed_per_Run_ms'])
            below_threshold += row['elapsed_ms'] < 1000
        assert observed == set(expected) and all(len(values) == rounds for values in grouped.values())
        assert all(len(values) == 1 for values in scripts.values())
        published = read_csv(output_name + '.parent_summary.csv')
        assert len(published) == len(info['cases']) * len(LABELS)
        for value in published:
            values = grouped[value['case'], value['condition']]
            median = st.median(values)
            baseline = st.median(grouped[value['case'], 'A'])
            assert math.isclose(median, float(value['median_ms_per_Run']), rel_tol=1e-12)
            assert math.isclose(median / baseline, float(value['over_A']), rel_tol=1e-12)
        aggregates = read_csv(output_name + '.aggregate.csv')
        for value in aggregates:
            cases = [case for case in info['cases'] if value['subset'] != 'Octane_core16_13suite' or case != 'zlib.zlib']
            logs = {case: math.log(st.median(grouped[case, value['condition']]) /
                                  st.median(grouped[case, value['denominator']])) for case in cases}
            if kind == 'sunspider':
                estimate = math.exp(st.mean(logs.values()))
            else:
                suites = {}
                for case, logarithm in logs.items():
                    suites.setdefault(case.split('.')[0], []).append(logarithm)
                estimate = math.exp(st.mean(st.mean(values) for values in suites.values()))
            assert math.isclose(estimate, float(value['time_ratio']), rel_tol=1e-12)
        boot_ids.add(plan['boot_id'])
        audits.append(dict(campaign=name, valid=len(measurements), expected=target,
                           groups=len(grouped), samples_per_group=rounds, same_script_per_case=True,
                           below_1000ms_retained=below_threshold, aggregate_checks=len(aggregates),
                           correctness_commands_clocks_and_identity_pass=True))
    assert len(boot_ids) == 1
    excluded = [row for row in raw if row['event'] == 'measurement' and
                row['campaign'] == 'full_expand01_sunspider' and row['rep'] >= 1]
    result = dict(status='PASS_COMPLETE_EXPAND01_USER_ONE_ROUND', campaigns=audits, valid=770, expected=770,
                  boot_id=next(iter(boot_ids)), old_data_pooled=False,
                  local_file_checks=check_files, unique_files_checked=len(verified_files),
                  intentional_unmatched_extra_starts=len(unmatched), excluded_later_round_measurements=len(excluded),
                  user_requested_sunspider_rounds=1)
    report.save_new('audit.expand01' + ('.files' if check_files else '') + '.json', result)
    return result


def main(check_files):
    summarize_one_round()
    audit = audit_raw(check_files)
    aggregates = []
    wide_tables = {}
    for kind in ['octane', 'sunspider']:
        name = 'full_expand01_' + kind + ('.one_round' if kind == 'sunspider' else '')
        rows = read_csv(name + '.parent_summary.csv')
        lookup = {(row['case'], row['condition']): row for row in rows}
        wide = []
        display = []
        for case in report.info_cases(kind):
            record = dict(case=case)
            cells = [case]
            for label in LABELS:
                value = lookup[case, label]
                elapsed = float(value['median_ms_per_Run'])
                change = 100 * (float(value['over_A']) - 1)
                record[label + '_median_ms_per_Run'] = elapsed
                record[label + '_change_vs_A_pct'] = change
                record[label + '_Q1_ms_per_Run'] = float(value['q1_ms'])
                record[label + '_Q3_ms_per_Run'] = float(value['q3_ms'])
                cells.append(f'{elapsed:.4f}' if label == 'A' else f'{elapsed:.4f} ({change:+.2f}%)')
            wide.append(record)
            display.append(cells)
        report.table(kind + '.all_conditions.expand01.csv', wide)
        wide_tables[kind] = markdown(['case'] + LABELS, display)
        aggregates.extend(dict(campaign=name, boot_id=audit['boot_id'], **row)
                          for row in read_csv(name + '.aggregate.csv') if row['denominator'] == 'A')
    report.table('all_conditions.expand01.aggregate.csv', aggregates)
    ranking_rows = []
    winners = {}
    for subset in ['Octane_core16_13suite', 'Octane_expanded17_14suite', 'SunSpider26']:
        values = sorted([row for row in aggregates if row['subset'] == subset], key=lambda row: float(row['time_ratio']))
        winners[subset] = values[0]['condition']
        for position, row in enumerate(values, 1):
            interval = (f"[{float(row['ci95_low']):.6f}, {float(row['ci95_high']):.6f}]"
                        if row['ci95_low'] else 'UNKNOWN (n=1)')
            ranking_rows.append([subset, position, row['condition'], f"{float(row['time_change_pct']):+.2f}%",
                                 interval, row['direction']])
    lines = ['# 十条件完整 Octane / SunSpider 对照', '',
             '## 做了什么', '',
             '新批次 expand01，十条件，共 770 条有效记录。',
             'Octane 17 项每组 3 个新进程，共 510 条；SunSpider 按用户后续要求每组 1 个新进程，共 260 条。',
             '原 SunSpider 三轮计划保留，用户修改及停止记录另存。旧批次不混入。',
             '用户提及 L2，冻结清单只有 L1，本批使用已有 L1。',
             '同一 WSL2 Ubuntu24.04.2 x86_64 boot，冻结 Release 制品，固定输入及 N。',
             '首次 Run 计入，加载和必需 Setup 在外，内部 CLOCK_MONOTONIC 计时，无额外 workload 预跑。', '',
             '## 相对 A 的聚合耗时变化', '',
             '变化率 = 100 × (版本中位耗时 / A 中位耗时 − 1)，负数较快。',
             'Octane 先 suite 内 GM 再 suite 等权 GM，SunSpider 为 26 case 等权 GM。',
             'Octane 每组只有三个新进程，10000 次整轮配对 bootstrap 区间为探索性结果，未作多重检验校正。',
             'SunSpider 每组一个进程，只报告点估计，样本标准差及置信区间 UNKNOWN。Q1/Q3 为同一观测值。',
             'Octane 区间跨 1 表示方向不明确。排序依据聚合点估计，区间仅比较该版本与 A。', '',
             markdown(['范围', '点估计排序', '版本', '相对 A 耗时变化', '比值 95% 区间', '区间方向'], ranking_rows), '',
             '## Octane 逐项', '',
             '单位 ms/完整 Run，括号相对同批 A。完整精度、Q1/Q3 和更多统计见 CSV。', '',
             wide_tables['octane'], '', '## SunSpider 逐项', '', wide_tables['sunspider'], '',
             '## 证据与限制', '',
             '原始记录 performance_expand01.runs.jsonl.gz，压缩与解压后 SHA256 见对应 archive.json。',
             'audit.expand01.json 或 audit.expand01.files.json 检查数量、位置、命令、正确性、时钟、源码及制品身份。',
             'below_1000ms_retained 在审计中逐 suite 报告，保留偏短样本及全部慢样本。',
             '结果覆盖现有固定 17 项及 26 项；Box2D 和官方 latency 指标沿用既有覆盖限制。',
             'L1 对应本批制品，L2 身份仍缺失。更细的机制成本及代码布局贡献 UNKNOWN。', '',
             '## 离线重算', '', '```powershell',
             'python performance_report.py summary --epoch expand01 --campaign full_expand01_octane',
             'python finish_expand01.py --check-files', '```']
    report.save_new('results.expand01.md', '\n'.join(lines) + '\n')
    report.save_new('delivery.expand01.json', dict(status='COMPLETE_TEN_CONDITION_USER_ONE_ROUND', valid=770,
                    expected=770, conditions=LABELS, point_estimate_winners=winners,
                    octane_samples_per_group=3, sunspider_samples_per_group=1,
                    formal30=False, new_implementation=False, boot_id=audit['boot_id'],
                    user_L2_interpreted_as_existing_L1=True))
    print(report.json.dumps(dict(status='COMPLETE', audit=audit, point_estimate_winners=winners), indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--check-files', action='store_true')
    main(parser.parse_args().check_files)

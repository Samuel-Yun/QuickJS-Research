#!/usr/bin/env python3
"""Run one benchmark, a suite, or both suites using fresh qjs processes."""
import argparse
import collections
import csv
from datetime import datetime
import hashlib
import json
import math
import os
from pathlib import Path
import statistics
import subprocess
import sys
import time
from zoneinfo import ZoneInfo

TESTS = Path(__file__).resolve().parent
PACKAGE = TESTS.parent
LABELS = {'A': '原版 A', 'method': '按需构造缓存'}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def select_cases(catalog, suite, names, parser):
    suites = ['octane', 'sunspider'] if suite == 'all' else [suite]
    selected = [(s, c) for s in suites for c in catalog['cases'][s]]
    if not names:
        return selected
    wanted = set()
    for name in names:
        key = Path(name).stem.casefold() if name.endswith('.js') else name.casefold()
        found = [(s, c) for s, c in selected if key in {
            c['name'].casefold(), c['case'].casefold(), c['group'].casefold(),
            c['name'].split('.')[-1].casefold()}]
        if not found:
            parser.error(f'找不到样例 {name!r}，用 {suite} --list 查看名称')
        wanted.update((s, c['case']) for s, c in found)
    return [(s, c) for s, c in selected if (s, c['case']) in wanted]


def validate(payload, suite, case):
    if (payload.get('case'), payload.get('N'), payload.get('phase'),
            payload.get('correctness'), payload.get('warmup_calls')) != (
            case['case'], case['N'], 'measure', 'PASS', 0):
        raise ValueError('结果的样例/N/校验/预热状态不正确')
    elapsed = payload.get('elapsed_ms')
    if not isinstance(elapsed, (int, float)) or not math.isfinite(elapsed) or elapsed <= 0:
        raise ValueError('无效的内部计时')
    if not math.isclose(elapsed, payload['stop_ms'] - payload['start_ms'], abs_tol=1e-6):
        raise ValueError('内部计时区间不一致')
    if 'checksums' in case and payload.get('checksum') not in case['checksums']:
        raise ValueError('结果校验值不符')
    return elapsed / case['N']


def summarize(samples, selected, engines, repeat, output, complete):
    groups = collections.defaultdict(list)
    for row in samples:
        if row['valid']:
            groups[row['suite'], row['case'], row['engine']].append(row['ms_per_Run'])
    rows = []
    for suite, case in selected:
        for engine in engines:
            values = groups.get((suite, case['case'], engine), [])
            if values:
                rows.append(dict(suite=suite, case=case['case'], name=case['name'],
                                 group=case['group'], engine=engine, N=case['N'],
                                 processes=len(values), median_ms=statistics.median(values),
                                 min_ms=min(values), max_ms=max(values)))
    with (output / 'summary.csv').open('w', newline='') as f:
        fields = ['suite', 'case', 'name', 'group', 'engine', 'N', 'processes',
                  'median_ms', 'min_ms', 'max_ms']
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    report = ['# 本次测试结果', '', '单位 ms/Run；越小越快。每项每轮一个新进程，'
              'Setup/加载不计时，首个 Run 计入，无额外预热。', '',
              f'状态：{"完成" if complete else "未完成，不能当作完整套件结果"}；'
              f'每版每项计划 {repeat} 个进程。', '']
    aggregate = {}
    for suite in dict.fromkeys(s for s, _ in selected):
        report += [f'## {suite}', '']
        both = engines == ['A', 'method']
        if both:
            report += ['| 样例 | N | A ms/Run | 按需构造缓存 ms/Run | 相对 A |',
                       '|---|---:|---:|---:|---:|']
        else:
            report += [f'| 样例 | N | {LABELS[engines[0]]} ms/Run | 最小～最大 |',
                       '|---|---:|---:|---:|']
        medians = {}
        suite_cases = [c for s, c in selected if s == suite]
        suite_complete = all(len(groups.get((suite, c['case'], e), [])) == repeat
                             for c in suite_cases for e in engines)
        for case in suite_cases:
            values = {e: groups.get((suite, case['case'], e), []) for e in engines}
            medians[case['case']] = {e: statistics.median(v) for e, v in values.items() if v}
            if both:
                a, m = (medians[case['case']].get(e) for e in engines)
                a_text = f'{a:.4f}' if a is not None else '未完成'
                m_text = f'{m:.4f}' if m is not None else '未完成'
                change = f'{100*(m/a-1):+.2f}%' if a is not None and m is not None else '—'
                report.append(f'| {case["name"]} | {case["N"]} | {a_text} | {m_text} | {change} |')
            else:
                v = values[engines[0]]
                if v:
                    report.append(f'| {case["name"]} | {case["N"]} | '
                                  f'{statistics.median(v):.4f} | {min(v):.4f}～{max(v):.4f} |')
        report.append('')
        if suite_complete:
            totals = {e: sum(medians[c['case']][e] for c in suite_cases) for e in engines}
            aggregate[suite] = {'cases': len(suite_cases), 'sum_ms': totals}
            report += ['逐项耗时中位数之和：' + '；'.join(
                f'{LABELS[e]} {totals[e]:.4f} ms' for e in engines) + '。', '']
            if both:
                logs = collections.defaultdict(list)
                for c in suite_cases:
                    v = medians[c['case']]
                    logs[c['group']].append(math.log(v['method'] / v['A']))
                change = 100 * (math.exp(statistics.mean(
                    statistics.mean(v) for v in logs.values())) - 1)
                aggregate[suite]['method_vs_A_GM_pct'] = change
                full = len(suite_cases) == (17 if suite == 'octane' else 26)
                scope = '全集' if full else '所选项（不是全集）'
                weighting = '14 suite 分层等权' if suite == 'octane' and full else (
                    '按所选 suite 分层等权' if suite == 'octane' else '表项等权')
                report += [f'{scope}耗时几何平均变化：**{change:+.2f}%**（{weighting}，相对 A）。', '']
    text = '\n'.join(report) + '\n'
    (output / 'summary.md').write_text(text)
    write_json(output / 'results.json', dict(complete=complete, rows=rows, aggregate=aggregate))
    return text


def main():
    parser = argparse.ArgumentParser(description='单项或整套 Octane/SunSpider，本机新进程计时')
    parser.add_argument('suite', choices=['octane', 'sunspider', 'all'])
    parser.add_argument('cases', nargs='*', help='样例名；省略则跑整套，也可填 Crypto/EarleyBoyer 等组名')
    parser.add_argument('--engine', choices=['A', 'method', 'both'], default='method')
    parser.add_argument('--repeat', type=int, default=1, help='每项每版的新进程数，默认 1')
    parser.add_argument('--cpu', type=int, default=2, help='固定 CPU，默认 2')
    parser.add_argument('--timeout', type=float, default=600, help='每个进程超时秒数')
    parser.add_argument('--list', action='store_true', help='列出样例和固定 N，不执行')
    parser.add_argument('--output', type=Path, help='新的结果目录；默认 test_runs/时间戳')
    args = parser.parse_intermixed_args()
    if args.repeat < 1 or args.timeout <= 0:
        parser.error('repeat 和 timeout 必须大于 0')
    catalog = json.loads((TESTS / 'benchmarks.json').read_text())
    selected = select_cases(catalog, args.suite, args.cases, parser)
    if args.list:
        for suite, case in selected:
            print(f'{suite:10} {case["name"]:28} N={case["N"]}')
        return 0
    engines = ['A', 'method'] if args.engine == 'both' else [args.engine]
    binaries = {e: PACKAGE / 'build' / e / 'qjs' for e in engines}
    for binary in binaries.values():
        if not binary.is_file():
            parser.error(f'找不到 {binary}，请先运行 python3 tools/manage.py build both')
    available = os.sched_getaffinity(0)
    if args.cpu not in available:
        parser.error(f'CPU {args.cpu} 不可用，可用 CPU：{sorted(available)}')
    # This runner remains useful after editing and rebuilding an engine: record
    # its actual hash, rather than claiming it is still the frozen release.
    files = {str(TESTS / c['path']): c['sha256'] for _, c in selected}
    files.update({str(TESTS / n): h for n, h in catalog['support'].items()})
    for name, digest in files.items():
        if sha(Path(name)) != digest:
            parser.error(f'基准文件发生变化：{name}')
    stamp = datetime.now(ZoneInfo('Asia/Shanghai')).strftime('%Y%m%d_%H%M%S_%f')
    output = (args.output or PACKAGE / 'test_runs' / stamp).resolve()
    output.mkdir(parents=True, exist_ok=False)
    os.sched_setaffinity(0, {args.cpu})
    env = dict(os.environ, TZ='Asia/Shanghai', LANG='C', LC_ALL='C')
    write_json(output / 'protocol.json', dict(
        suite=args.suite, cases=[dict(suite=s, case=c['case'], N=c['N']) for s, c in selected],
        engines={e: dict(path=str(p), sha256=sha(p)) for e, p in binaries.items()},
        repeats=args.repeat, CPU=args.cpu, environment={k: env[k] for k in ['TZ', 'LANG', 'LC_ALL']},
        input_files=files, runner_sha256=sha(Path(__file__)),
        metric=catalog['metric'], warmup_calls=0,
        order='case blocks; A/method order reverses each repetition',
        failure_policy='save failed process; stop without retry'))
    print(f'CPU {args.cpu}；每版每项 {args.repeat} 个新进程；耗时单位 ms/Run，越小越快。', flush=True)
    print(f'结果目录：{output}', flush=True)
    samples, complete, error = [], False, None
    try:
        for rep in range(args.repeat):
            order = engines if rep % 2 == 0 else engines[::-1]
            for suite, case in selected:
                for engine in order:
                    token = f'{len(samples)+1:04d}_{suite}_{case["name"]}_{engine}'
                    command = [str(binaries[engine])]
                    if case['case'] == 'zlib.zlib':
                        command += ['--std', '-I', str(TESTS / 'support/zlib_read.js')]
                    command.append(str(TESTS / case['path']))
                    row = dict(suite=suite, case=case['case'], name=case['name'], engine=engine,
                               rep=rep+1, N=case['N'], command=command, valid=False)
                    print(f'运行 {suite}/{case["name"]}  {LABELS[engine]}  '
                          f'第 {rep+1}/{args.repeat} 次…', flush=True)
                    with (output / 'raw.jsonl').open('a') as log:
                        log.write(json.dumps(dict(event='start', **row), ensure_ascii=False) + '\n')
                    started = time.perf_counter()
                    try:
                        r = subprocess.run(command, cwd=PACKAGE, env=env, capture_output=True,
                                           text=True, timeout=args.timeout)
                        row.update(exit_code=r.returncode, stdout=r.stdout, stderr=r.stderr)
                        if r.returncode != 0:
                            raise ValueError(f'qjs 退出码 {r.returncode}: {r.stderr[-1500:]}')
                        prefix = 'OCTANE_IC_RESULT:' if suite == 'octane' else 'TEB_RESULT:'
                        lines = [line[len(prefix):] for line in r.stdout.splitlines() if line.startswith(prefix)]
                        if len(lines) != 1:
                            raise ValueError('没有找到唯一的基准计时结果')
                        payload = json.loads(lines[0])
                        row.update(ms_per_Run=validate(payload, suite, case), payload=payload, valid=True)
                    except subprocess.TimeoutExpired as exc:
                        row.update(error=f'进程超过 {args.timeout} 秒',
                                   stdout=(exc.stdout or b'').decode(errors='replace'),
                                   stderr=(exc.stderr or b'').decode(errors='replace'))
                        raise RuntimeError(row['error']) from exc
                    except Exception as exc:
                        row['error'] = str(exc)
                        raise
                    finally:
                        row['process_wall_ms'] = 1000 * (time.perf_counter() - started)
                        for stream in ['stdout', 'stderr']:
                            (output / (token + '.' + stream)).write_text(row.get(stream, ''))
                        with (output / 'raw.jsonl').open('a') as log:
                            log.write(json.dumps(dict(event='result', **row), ensure_ascii=False) + '\n')
                        samples.append(row)
                    print(f'  {row["ms_per_Run"]:.4f} ms/Run  '
                          f'（N={case["N"]}，Run 总计 {payload["elapsed_ms"]:.2f} ms，校验通过）', flush=True)
        for name, p in binaries.items():
            before = json.loads((output / 'protocol.json').read_text())['engines'][name]['sha256']
            if sha(p) != before:
                raise RuntimeError('测试期间引擎文件发生变化')
        complete = True
    except (Exception, KeyboardInterrupt) as exc:
        error = f'{type(exc).__name__}: {exc}'
    finally:
        report = summarize(samples, selected, engines, args.repeat, output, complete)
        write_json(output / 'status.json', dict(complete=complete, error=error,
                                               finished_processes=len(samples)))
        print('\n' + report, flush=True)
        print(f'原始记录、CSV、汇总表：{output}', flush=True)
    if error:
        print(f'测试中止：{error}', file=sys.stderr)
    return 0 if complete else 1


if __name__ == '__main__':
    sys.exit(main())

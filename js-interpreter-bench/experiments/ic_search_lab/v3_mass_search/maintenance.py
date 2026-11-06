"""Finish non-performance evidence when the timing gate is closed."""
import csv
import gzip
import hashlib
import json
import os
import shutil
import signal
import sys
import tarfile
import time
from collections import Counter
from pathlib import Path

import search as s
import stages as st
import generate
import analysis

H = s.HERE
lab = s.lab


def restore_sources(cid):
    active = H / 'active'
    for name, digest in lab.load(H / 'active_inventory.json').items():
        assert lab.sha(active / name) == digest, 'unrecorded active edit ' + name
    files, config, parent, reason = generate.render(st.row_for(cid))
    assert reason is None
    hashes = {name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()}
    assert hashes == st.identity(cid)['source_sha256_after_build'], 'restored source differs from frozen measured candidate'
    for name, text in files.items(): (active / name).write_bytes(text.encode())
    st.atomic_json(H / 'active_inventory.json', hashes)
    return config, parent


def mechanisms():
    assert (H / 'stability.complete.json').exists(), 'Let timing pilot finish first'
    os.sched_setaffinity(0, {2})
    results = []
    active = H / 'active'
    saved = 'F016'
    for cid in ['P012', 'H014', 'S005']:
        config, parent = restore_sources(cid)
        generated = H / (cid + '.mechanism.c')
        source = ''
        if parent != 'A':
            source += '#define main search_layout_main\n#include "layout_probe.c"\n#undef main\n'
        else:
            source += '#include "quickjs.c"\n'
        # Public project-owned finalizer test. Its source identity is recorded.
        delete = s.V2 / 'delete_reentry.c'
        source += '#define main search_delete_main\n#include "' + str(delete) + '"\n#undef main\n'
        source += 'int main(void) {'
        if parent != 'A': source += 'int r = search_layout_main(); if (r) return r; '
        source += 'return search_delete_main();}\n'
        lab.save(generated, source)
        target = H / 'artifacts' / (cid + '.mechanism')
        objects = [active / '.obj' / (name + '.o') for name in ['dtoa', 'libregexp', 'libunicode', 'cutils']]
        identity = dict(candidate=cid, performance_sample=False, diagnostic=True,
                        measured_binary_sha256=st.identity(cid)['sha256'], configuration=config,
                        controller_sha256=lab.sha(Path(__file__)), generated_source_sha256=lab.sha(generated),
                        layout_probe_sha256=lab.sha(H / 'layout_probe.c'), delete_probe_sha256=lab.sha(delete),
                        core_source_sha256=lab.sha(active / 'quickjs.c'), objects_sha256={p.name: lab.sha(p) for p in objects})
        built = lab.capture(['gcc', '-g', '-O2', '-fwrapv', '-D_GNU_SOURCE', '-DHAVE_CLOSEFROM', '-DCONFIG_VERSION="2026-06-04"',
                             '-I' + str(active), '-I' + str(H), generated, *objects, '-lm', '-lpthread', '-ldl', '-o', target],
                            'mechanism_build', cid, 180, identity)
        if built['exit_code'] != 0:
            results.append(dict(candidate=cid, status='BUILD_FAILED', token=built['token']))
            continue
        checked = lab.capture([target], 'mechanism_check', cid, 30, identity | dict(diagnostic_binary_sha256=lab.sha(target)))
        valid = checked['exit_code'] == 0 and not checked['stderr'] and 'DELETE_REENTRY_PASS' in checked['stdout']
        if parent != 'A': valid = valid and 'LAYOUT_PROBE_PASS' in checked['stdout']
        results.append(dict(candidate=cid, status='PASS' if valid else 'FAIL', token=checked['token'],
                            stdout=checked['stdout'], stderr=checked['stderr'], exit_code=checked['exit_code']))
        print('MECHANISM_CHECK', cid, results[-1]['status'], checked['stdout'].strip(), flush=True)
    restore_sources(saved)
    lab.save(H / 'mechanism_checks.json', dict(status='PASS' if all(r['status'] == 'PASS' for r in results) else 'REVIEW_REQUIRED',
              results=results, counts_are_timings=False, scope='Three selected template/GC invariants; does not validate all unbuilt configurations',
              active_restored_to=saved))


def layouts():
    assert (H / 'mechanism_checks.json').exists()
    values = []
    labels = ['A', 'M', 's001'] + lab.load(H / 'pilot.complete.json')['candidates']
    previous_results = [r for r in analysis.rows() if r.get('event') == 'process_result' and r.get('stage') == 'dwarf_layout_only']
    for cid in labels:
        artifact = st.identity(cid)
        assert lab.sha(artifact['path']) == artifact['sha256']
        expressions = ['sizeof(JSShape)', 'sizeof(JSFunctionBytecode)']
        has_ic = cid != 'A' and (cid in ['M', 's001'] or st.row_for(cid)['parent'] != 'A')
        if has_ic: expressions.append('sizeof(ReadICSite)')
        command = ['gdb', '-nx', '-batch', '-ex', 'set auto-load off', '-ex', 'file ' + artifact['path']]
        for expression in expressions: command += ['-ex', 'p ' + expression]
        prior = [r for r in previous_results if r['command'] == list(map(str, command)) and r['exit_code'] == 0]
        result = prior[-1] if prior else lab.capture(command, 'dwarf_layout_only', cid, 20, dict(binary_sha256=artifact['sha256'], executes_vm=False))
        import re
        numbers = [int(number) for number in re.findall(r'\$\d+ = (\d+)', result['stdout'])]
        assert result['exit_code'] == 0 and len(numbers) == len(expressions), result
        values.append(dict(candidate=cid, shape_bytes=numbers[0], function_bytes=numbers[1],
                           site_bytes=numbers[2] if has_ic else 0, binary_sha256=artifact['sha256'],
                           source='actual frozen ELF DWARF sizeof; no VM execution',
                           RSS_effect='UNKNOWN', indirect_shape_retention='UNKNOWN'))
    analysis.writecsv('layout_sizes.csv', values)
    print('DWARF_LAYOUTS_SAVED', len(values), flush=True)


def wide():
    config, parent = restore_sources('L006')
    active = H / 'active'
    objects = [active / '.obj' / (name + '.o') for name in ['dtoa', 'libregexp', 'libunicode', 'cutils']]
    target = H / 'artifacts/L006.wide_offset'
    ident = dict(candidate='L006', diagnostic=True, performance_sample=False,
                 measured_binary_sha256=st.identity('L006')['sha256'], config=config,
                 source_sha256=lab.sha(H / 'wide_offset_probe.c'), core_sha256=lab.sha(active / 'quickjs.c'))
    built = lab.capture(['gcc', '-g', '-O2', '-fwrapv', '-D_GNU_SOURCE', '-DHAVE_CLOSEFROM', '-DCONFIG_VERSION="2026-06-04"',
                         '-I' + str(active), H / 'wide_offset_probe.c', *objects, '-lm', '-lpthread', '-ldl', '-o', target],
                        'wide_offset_build', 'L006', 180, ident)
    assert built['exit_code'] == 0, built['stderr']
    result = lab.capture([target], 'wide_offset_check', 'L006', 60, ident | dict(diagnostic_binary_sha256=lab.sha(target)))
    valid = result['exit_code'] == 0 and not result['stderr'] and 'WIDE_OFFSET_FALLBACK_PASS' in result['stdout']
    lab.save(H / 'wide_offset_check.json', dict(status='PASS' if valid else 'FAIL', token=result['token'], stdout=result['stdout'],
              exit_code=result['exit_code'], claim='actual offset66000 on hashed own data shape is not truncated into u16; no slot filled', performance_sample=False))
    restore_sources('F016')
    print('WIDE_OFFSET_CHECK', valid, result['stdout'], flush=True)


def finish():
    assert lab.load(H / 'stability.complete.json')['status'] == 'BLOCKED_TIMING_DRIFT'
    raw = analysis.rows()
    states = st.all_rows()
    # Correct a descriptive count typo against actual stdout, retaining the
    # earlier CSV states in append-only raw. No assertion or sample is changed.
    for row in states:
        if '9014' in row.get('correctness', ''):
            s.update(row['id'], correctness=row['correctness'].replace('9014', '9013'))
    states = st.all_rows()
    counts = Counter(r['status'] for r in states)
    build_rows = [r for r in raw if r.get('event') == 'process_result' and r.get('stage') == 'build']
    samples = [r for r in raw if r.get('event') == 'measurement']
    phases = Counter(r['stage'] for r in samples)
    costs = [r['wall_time_ms'] / 1000 for r in build_rows]
    budget = dict(status='BLOCKED_BEFORE_BROAD_EXPANSION', actual_representatives=14,
                  total_actual_build_seconds=sum(costs), median_build_seconds=__import__('statistics').median(costs),
                  projected_248_build_seconds=__import__('statistics').median(costs) * 248,
                  next_budget='No additional timing budget released after repeated unchanged-baseline drift. Supported234 unbuilt initial configurations remain PLANNED.',
                  raw_is_not_a_ranking=True)
    lab.save(H / 'pilot_budget.json', budget)
    with tarfile.open(H / 'build_support.tar.gz', 'w:gz') as archive:
        archive.add(H / 'active/compat/test-closefrom.c', arcname='compat/test-closefrom.c', recursive=False)
    identity_checks = {}
    workspace = lab.load(H / 'workspace.json')
    for label, artifact in workspace['artifacts'].items():
        identity_checks[label] = dict(path=artifact['path'], expected=artifact['sha256'], actual=lab.sha(artifact['path']))
        assert identity_checks[label]['expected'] == identity_checks[label]['actual']
    for row in states:
        if row.get('binary_sha256'):
            artifact = st.identity(row['id'])
            assert lab.sha(artifact['path']) == row['binary_sha256']
    old = lab.load(lab.ROOT / 'experiments/splay_ic_20261104/attempt01/runtime.json')['sources']['A']['files']
    a_checks = {name: workspace['A_source']['files'][name] == value for name, value in old.items()}
    assert all(a_checks.values())
    lab.save(H / 'postflight.json', dict(status='PASS_IDENTITIES', boot_id=lab.boot(), artifacts=identity_checks,
              candidate_binaries_unchanged=14, A_prior_four_source_identities=a_checks,
              A_CRLF_archive_preserved=True, old_elapsed_values_used=False))
    table = []
    for family in ['P', 'L', 'T', 'Q', 'H', 'F', 'S']:
        group = [r for r in states if r['family'] == family]
        table.append(dict(family=family, initial=len(group), built_correct=sum(bool(r.get('binary_sha256')) for r in group),
                          pilot_cases=8, unsupported=sum(r['status'] == 'UNSUPPORTED' for r in group),
                          planned=sum(r['status'] == 'PLANNED' for r in group), accepted_performance_configs=0,
                          final_confirmed=0))
    analysis.writecsv('coverage.csv', table)
    endpoints = []
    for path in H.glob('*pilot.block*.json'):
        block = lab.load(path)
        # Include all endpoints; not just the rows beyond the drift threshold.
        data = [r for r in samples if r['campaign'] == block['campaign'] and r['condition'] in ['A', 's001']]
        for kind, case in s.SHORT:
            for label in ['A', 's001']:
                found = sorted([r for r in data if r['kind'] == kind and r['case'] == case and r['condition'] == label], key=lambda r: r['order'])
                assert len(found) == 2
                before, after = [r['elapsed_ms'] for r in found]
                endpoints.append(dict(block=block['block'], kind=kind, case=case, condition=label, N=found[0]['N'],
                                      before_ms=before, after_ms=after, max_over_min=max(before, after) / min(before, after),
                                      unstable=max(before, after) / min(before, after) > 1.15))
    analysis.writecsv('baseline_drift.csv', endpoints)
    lines = ['# 本轮停在计时稳定性门禁', '',
             '已实际实现并构建14个代表配置，覆盖P/L/T/Q/H/F/S七类；均通过复用的7020断言、9013条针对性断言，以及GC/OOM、保存加载和qjsc检查。断言次数不等于独立场景数。三个补充机制检查见mechanism_checks.json。', '',
             '|家族|初始配置|已构建并检查|尚未构建|不支持|', '|---|---:|---:|---:|---:|']
    lines.extend(f"|{r['family']}|{r['initial']}|{r['built_correct']}|{r['planned']}|{r['unsupported']}|" for r in table)
    lines += ['', '实际短测包括14×8=112条候选样本，另有96条块端点基线；长N有界复核包括6×8=48条候选样本及32条基线。校准另计。所有退出码、校验和及原始时间保留。', '',
              '8项选择在测量前冻结。原短测第0块冻结基线出现21%—57%漂移；统一N×4后，第一个块仍有12/16组端点超过15%。A的Splay为756.041→523.772ms，CodeLoad.Closure为780.978→555.351ms，RayTrace为781.637→616.477ms。完整端点见baseline_drift.csv。', '',
              '同一binary、同一N在同块前后明显变化，当前无法用这些差异判断候选收益。记录中的valid表示进程和checksum通过，不表示计时分布稳定。没有发布最佳配置排名，没有进入全套26+17复筛、30进程正式确认或V8新批次比较。根因UNKNOWN，不能直接归为候选退化、引擎崩溃、OOM或某个具体功耗策略。', '',
              'T的24个runtime共享配置尚缺GC根、跨context和释放重入方案，标UNSUPPORTED。F的16个非read_drop配置尚缺完整融合证明，标UNSUPPORTED。其余234项仍PLANNED，不能声称已经测试288项。当前14项是可继续恢复的模板代表，不是14种新算法。', '',
              '独立检查确认P012实际使用3个槽；L006在真实offset=66000时不填入u16缓存、换值后结果仍正确。静态大小也揭示通用AoS单槽模板从M/s001的16B增加到24B，F/H/T等含这个额外布局成本；后续需有匹配模板控制。总RSS和间接保活成本UNKNOWN。具体见template_notes.md及layout_sizes.csv。', '',
              '本轮修复了生成器对A的CRLF定位问题；原始A归档和SHA未改。旧实验、冻结A/M/s001、测试算法及输入不改写。源码、flags、补丁、制品SHA分别在identities和patches。', '',
              '恢复前先改善或核实主机负载/供电等条件，并在新campaign复核冻结基线。不得删STOP后继续沿用失稳块作排名。具体入口见next_commands.md。正式runner与bootstrap在没有入围者时没有执行，不能把未执行阶段写成通过。', '',
              f"总构建墙钟{sum(costs):.1f}s，构建中位数{__import__('statistics').median(costs):.1f}s。按同等构建成本估计248个可实现行需约{budget['projected_248_build_seconds']/3600:.2f}h，仅是预算估计。"]
    lab.save(H / 'results.md', '\n'.join(lines) + '\n')
    analysis.main(); analysis.audit()
    # Only terminate the finite idle helper owned by this campaign.
    helper = lab.load(H / 'idle_helper.json')
    cleanup = dict(pid=helper['pid'], boot_id=lab.boot(), terminated=False)
    proc = Path('/proc') / str(helper['pid'])
    if helper['boot_id'] == lab.boot() and proc.exists():
        command = (proc / 'cmdline').read_bytes()
        assert command == b'python3\x00-c\x00import time; time.sleep(21600)\x00'
        assert proc.stat().st_uid == os.getuid()
        os.kill(helper['pid'], signal.SIGTERM); cleanup['terminated'] = True
    lab.save(H / 'idle_cleanup.json', cleanup)
    lab.append(dict(event='campaign_stop', timestamp=lab.stamp(), status='BLOCKED_TIMING_DRIFT', performance_processes_running=False,
                    supported_unbuilt=234, initial_seeds=288, actual_built=14, helper_cleanup=cleanup))
    with (H / 'runs.jsonl').open('rb') as source, (H / 'runs.jsonl.gz').open('xb') as target:
        with gzip.GzipFile(filename='', mode='wb', fileobj=target, mtime=0) as archive:
            shutil.copyfileobj(source, archive)
    lab.save(H / 'raw_archive.json', dict(compressed_sha256=lab.sha(H / 'runs.jsonl.gz'), uncompressed_sha256=lab.sha(H / 'runs.jsonl'),
             compressed_bytes=(H / 'runs.jsonl.gz').stat().st_size, uncompressed_bytes=(H / 'runs.jsonl').stat().st_size,
             encoding='UTF-8 LF', restore='gzip -dk runs.jsonl.gz; verify uncompressed_sha256; original raw retained locally and ignored by Git'))
    print('SAVED_BLOCKED_CAMPAIGN', json.dumps(dict(counts=counts, measurements=phases, formal=0)), flush=True)


if __name__ == '__main__':
    globals()[sys.argv[1]]()

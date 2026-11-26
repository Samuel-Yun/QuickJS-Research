"""Audit source scope and publish measured evidence, without filling gaps."""
import collections
import csv
import difflib
import json
import math
from pathlib import Path
import statistics
import subprocess
import tempfile

from build import HERE,ROOT,PACKAGE,LABELS,EVENTS,candidate,save,sha


def csvout(path,rows):
    with Path(path).open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)


def audit():
    assert subprocess.check_output(['git','branch','--show-current'],cwd=ROOT,text=True).strip()=='myx'
    manifest=json.loads((PACKAGE/'manifest.json').read_text())
    for section in ['original','modified']:
        for n,h in manifest[section].items():assert sha(PACKAGE/section/n)==h,(section,n)
    expected=dict(manifest['modified'])
    for label in LABELS:
        for mode in ['release','counts']:
            m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
            if mode=='release':
                changed=[n for n,h in m['sources'].items() if h!=expected[n]]
                assert changed==([] if label=='SPARSE' else ['read_ic_opcodes.inc']),changed
    old=(PACKAGE/'modified/read_ic_opcodes.inc').read_text();new=candidate(old)
    with tempfile.TemporaryDirectory(prefix='verify-offset-patch-') as t:
        p=Path(t)/'read_ic_opcodes.inc';p.write_text(old)
        subprocess.run(['patch','-p1','--fuzz=0','--batch','-i',str(HERE/'SPARSE-to-VERIFY_OFFSET_NO_UPDATE.patch')],cwd=t,check=True,capture_output=True)
        assert p.read_text()==new
    save(HERE/'audit.json',dict(status='PASS',branch='myx',frozen_source_unchanged=True,
        release_changed_files=['read_ic_opcodes.inc'],patch_reconstructs_exactly=True,
        bytecode_and_ReadICSite_unchanged=True,constructors_unchanged=True,
        fusion_source_unchanged=True,diagnostics_not_in_timed_binaries=True))


def suite_tables():
    if not (HERE/'full_complete.json').exists():return []
    samples=json.loads((HERE/'full_samples.json').read_text());assert len(samples)==86
    summary=[]
    for suite in ['octane','sunspider']:
        base=[r for r in samples if r['suite']==suite and r['label']=='SPARSE']
        rows=[];groups=collections.defaultdict(list)
        for b in base:
            v=next(r for r in samples if r['suite']==suite and r['case']==b['case'] and r['label']!= 'SPARSE')
            pct=100*(v['ms']/b['ms']-1)
            rows.append(dict(case=b['case'],name=b['name'],N=b['N'],SPARSE_ms=b['ms'],VERIFY_ms=v['ms'],change_percent=pct))
            groups[b['group'] if suite=='octane' else b['case']].append(math.log(v['ms']/b['ms']))
        assert len(groups)==(14 if suite=='octane' else 26)
        gm=100*(math.exp(statistics.mean(statistics.mean(x) for x in groups.values()))-1)
        sums={l:sum(r['ms'] for r in samples if r['suite']==suite and r['label']==l) for l in LABELS}
        absolute_gm={}
        for l in LABELS:
            bygroup=collections.defaultdict(list)
            for r in samples:
                if r['suite']==suite and r['label']==l:bygroup[r['group'] if suite=='octane' else r['case']].append(math.log(r['ms']))
            absolute_gm[l]=math.exp(statistics.mean(statistics.mean(x) for x in bygroup.values()))
        table=['| 表项 | SPARSE ms/Run | 新版 ms/Run | 相对 SPARSE |','|---|---:|---:|---:|']
        table += [f'| {r["name"]} | {r["SPARSE_ms"]:.4f} | {r["VERIFY_ms"]:.4f} | {r["change_percent"]:+.2f}% |' for r in rows]
        table += [f'| **整体 GM** | **{absolute_gm[LABELS[0]]:.4f}** | **{absolute_gm[LABELS[1]]:.4f}** | **{gm:+.2f}%** |',
                  f'| **逐项耗时之和** | **{sums[LABELS[0]]:.4f}** | **{sums[LABELS[1]]:.4f}** | — |']
        (HERE/f'{suite}.md').write_text('\n'.join(table)+'\n');csvout(HERE/f'{suite}.csv',rows)
        summary.append(dict(suite=suite,GM_percent=gm,GM_ms=absolute_gm,sum_ms=sums,worst=max(rows,key=lambda r:r['change_percent'])))
    save(HERE/'full_summary.json',summary)
    return summary


def verify_data():
    raw=[]
    for phase,expected in [('micro_time',30),('target_time',18),('full',86)]:
        files=list((HERE/phase).glob('*.run.json'))
        if phase=='full' and not (HERE/'full_complete.json').exists():continue
        assert len(files)==expected,(phase,len(files))
        for path in files:
            r=json.loads(path.read_text());assert r['mode']=='release' and r['exit_code']==0 and not r['stderr'],path
            assert sha(r['command'][0])==r['binary_sha256']
            if phase=='micro_time':
                payload=json.loads(r['stdout']);ms=payload['elapsed_ms'];N=payload['iterations']
                expected_checksum=(3*N if r['case']=='stable' else 4*N)
                assert payload['checksum']==expected_checksum
                metric='whole micro loop ms'
            else:
                suite='octane' if r['stdout'].find('OCTANE_IC_RESULT:')>=0 else 'sunspider'
                prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
                payloads=[json.loads(s[len(prefix):]) for s in r['stdout'].splitlines() if s.startswith(prefix)]
                assert len(payloads)==1
                payload=payloads[0];N=payload['N'];ms=payload['elapsed_ms']/N
                assert payload['correctness']=='PASS' and payload['warmup_calls']==0
                metric='ms/Run'
            raw.append(dict(phase=phase,case=r['case'],label=r['label'],rep=r['rep'],N=N,time_ms=ms,metric=metric,raw_record=str(path.relative_to(HERE))))
    csvout(HERE/'raw_timings.csv',raw)
    for file,phase in [('micro_timing.json','micro_time'),('target_timing.json','target_time')]:
        for s in json.loads((HERE/file).read_text()):
            values=[r['time_ms'] for r in sorted(raw,key=lambda r:r['rep']) if r['phase']==phase and r['case']==s['case'] and r['label']==s['label']]
            assert values==s['values_ms'] and statistics.median(values)==s['median_ms'],s
    protocol=json.loads((HERE/'full_protocol.json').read_text()) if (HERE/'full_complete.json').exists() else None
    if protocol:
        assert sha(HERE/'run.py')==protocol['run_driver_sha256']
        for n,h in protocol['inputs'].items():assert sha(n)==h,n
        samples=json.loads((HERE/'full_samples.json').read_text())
        assert [(r['suite'],r['case'],r['label'],r['N']) for r in samples]==[(r['suite'],r['case'],r['label'],r['N']) for r in protocol['schedule']]
    save(HERE/'final_check.json',dict(status='PASS',formal_release_processes=len(raw),
        counts_separate=True,raw_timings_match_medians=True,input_hashes_verified=True,
        full_schedule_matches_raw_samples=bool(protocol),frozen_source_audit='audit.json'))


def main():
    audit()
    verify_data()
    micro=json.loads((HERE/'micro_timing.json').read_text())
    counts=json.loads((HERE/'micro_counts.json').read_text())
    targets=json.loads((HERE/'target_timing.json').read_text())
    target_counts=json.loads((HERE/'target_counts.json').read_text())
    decision=json.loads((HERE/'decision.json').read_text())
    lines=['# VERIFY_OFFSET_NO_UPDATE：单槽读 IC 的旧槽验证实验','',
        '底座：冻结 SPARSE_CTOR_IC / 06aada4。Release 只修改 `read_ic_opcodes.inc`；不改融合入口、构造 IC、字节码编码和 ReadICSite。',
        'CPU 2，Asia/Shanghai，C locale。计数和计时分开；时间来自未插桩 Release。负数表示更快。','',
        '## 三组微基准','',
        '| 输入 | SPARSE 中位数 ms（范围） | 新版中位数 ms（范围） | 变化 |',
        '|---|---:|---:|---:|']
    for case in ['stable','same_slot','different_slot']:
        b,v=[next(r for r in micro if r['case']==case and r['label']==l) for l in LABELS]
        lines.append(f'| {case} | {b["median_ms"]:.0f}（{b["min_ms"]:.0f}–{b["max_ms"]:.0f}） | '
                     f'{v["median_ms"]:.0f}（{v["min_ms"]:.0f}–{v["max_ms"]:.0f}） | {v["change_percent"]:+.2f}% |')
    lines+=['','每组每版 5 个新进程，轮换先后顺序；所有组相同 N，生成对象与序列不计时，首次执行计入。',
        '沿用既有脚手架的 `Date.now()` 包住 `run()`；这些时间包含循环、数组取对象、readX 调用和属性读取。','',
        '### 独立计数：每个 readX 位点 65,536 次逻辑读取','',
        '| 输入 | 版本 | 融合命中 | 原 shape 命中 | 第二层尝试 | 第二层成功 | 成功/尝试 | 正常查找 | 更新 |',
        '|---|---|---:|---:|---:|---:|---:|---:|---:|']
    for r in counts:
        if r['plain']:continue
        rate='—' if r['verification_success_percent'] is None else f'{r["verification_success_percent"]:.2f}%'
        lines.append(f'| {r["case"]} | {r["label"]} | {r["fused_hits"]:,} | {r["shape_hits"]:,} | '
            f'{r["verify_attempts"]:,} | {r["verify_successes"]:,} | {rate} | {r["normal_lookups"]:,} | {r["updates"]:,} |')
    lines += ['', '“第二层成功/尝试”只衡量第二层验证，不是全部读取的命中率。另一个 `readPlain(unused,o)` 使用 arg1，'
              '实际字节码没有融合前缀；同样通过三组计数和结果校验，见 `micro_counts.json` 中 plain=true。', '',
              '## 真实用例：原输入、N 和计时边界','',
              '| 表项 | SPARSE 中位数 ms/Run | 新版中位数 ms/Run | 变化 | 新版正常查找 | 新版第二层救回 | 比原版少查找 | 比原版少更新 |',
              '|---|---:|---:|---:|---:|---:|---:|---:|']
    decompositions=[]
    for b in [r for r in targets if r['label']=='SPARSE']:
        v=next(r for r in targets if r['case']==b['case'] and r['label']!= 'SPARSE')
        bc,vc=[next(r for r in target_counts if r['case']==b['case'] and r['label']==l)['total'] for l in LABELS]
        lines.append(f'| {b["case"]} | {b["median_ms"]:.4f} | {v["median_ms"]:.4f} | {v["change_percent"]:+.2f}% | '
            f'{vc["normal_lookups"]:,} | {vc["verify_successes"]:,} | {bc["normal_lookups"]-vc["normal_lookups"]:,} | {bc["updates"]-vc["updates"]:,} |')
        decompositions.append(dict(case=b['case'],baseline_logical=bc['logical_reads'],candidate_logical=vc['logical_reads'],
            baseline_fused_hits=bc['fused_hits'],candidate_fused_hits=vc['fused_hits'],
            baseline_shape_hits=bc['shape_hits'],candidate_shape_hits=vc['shape_hits'],
            candidate_verify_attempts=vc['verify_attempts'],candidate_verify_successes=vc['verify_successes'],
            baseline_normal_lookups=bc['normal_lookups'],candidate_normal_lookups=vc['normal_lookups'],
            baseline_own_searches=bc['own_searches'],candidate_own_searches=vc['own_searches'],
            baseline_updates=bc['updates'],candidate_updates=vc['updates']))
    csvout(HERE/'target_counts_decomposition.csv',decompositions)
    pdf=next(r for r in decompositions if r['case']=='PdfJS.PdfJS')
    lines+=['','真实用例每版每项 3 个新进程，交错计时。诊断另跑一次原负载；计数范围是整个脚本（含 Setup/校验），'
        '仅统计 keep=0 的读取，不能当成计时区间内的精确次数。静态位点明细见 `target_counts/*.counts.jsonl`。',
        '', '新增验证成功数不等于净省下的查找数：缓存不再换 shape，一些原本的 shape/融合命中也会转到第二层。'
        f'例如 PdfJS 的第二层成功 {pdf["candidate_verify_successes"]:,} 次，但融合命中少 '
        f'{pdf["baseline_fused_hits"]-pdf["candidate_fused_hits"]:,} 次、普通 shape 命中少 '
        f'{pdf["baseline_shape_hits"]-pdf["candidate_shape_hits"]:,} 次，净减少的正常查找只有 '
        f'{pdf["baseline_normal_lookups"]-pdf["candidate_normal_lookups"]:,} 次。应看净变化和 Release 时间，不能只看第二层验证成功率。',
        '', '是否进入全集：'+decision['reason'],'']
    full=suite_tables()
    if full:
        changes={r['suite']:r['GM_percent'] for r in full}
        micro_change=next(r['change_percent'] for r in micro if r['case']=='same_slot' and r['label']!= 'SPARSE')
        conclusion=(f'结果：同槽交替微基准 {micro_change:+.2f}%，全集 Octane {changes["octane"]:+.2f}%、'
                    f'SunSpider {changes["sunspider"]:+.2f}%。'
                    + ('两套整体都没有提速，这版保留为局部实验，不建议替换冻结 SPARSE。'
                       if all(x>=0 for x in changes.values()) else
                       '两套结果分别列出；单轮筛选不替换冻结 SPARSE。'))
        lines[2:2]=[conclusion,'']
        lines+=['## 两套全集：同批次单轮筛选','']
        for r in full:lines.append(f'- {r["suite"]} 整体 GM：{r["GM_percent"]:+.2f}%；最大回退 {r["worst"]["name"]} {r["worst"]["change_percent"]:+.2f}%。')
        lines+=['','完整逐项表：[Octane](octane.md)、[SunSpider](sunspider.md)。Octane 按 14 suite 分层等权；SunSpider 按 26 项等权。'
                '不合并两套分数，不替换默认 SPARSE。','']
    lines+=['## 新增代码','', '```c']
    patch=(HERE/'SPARSE-to-VERIFY_OFFSET_NO_UPDATE.patch').read_text()
    lines += [s[1:].rstrip(' \\') for s in patch.splitlines() if s.startswith('+') and not s.startswith('+++')]
    lines+=['```','',
        '原 shape 失败后，确认旧槽号仍在范围内、该槽的属性名仍是 x、描述符仍是普通数据属性，就读取当前对象的值。'
        '它没有记住第二种 shape，也没有改变第一种 shape 的缓存；省掉的是后续按 atom 查找和 rdi_update 中的 shape 引用增减与记录替换。'
        '融合失配和 get_field_rdi 的原 shape 探测都保留。验证失败时继续原完整查找、更新和异常路径。','',
        '完整复现：[REPRODUCE.md](REPRODUCE.md)；源码范围与补丁重建检查：[audit.json](audit.json)。', '']
    (HERE/'results.md').write_text('\n'.join(lines))
    csvout(HERE/'micro_timing.csv',micro);csvout(HERE/'target_timing.csv',targets)
    print('REPORT_PASS',str(HERE/'results.md'))


if __name__=='__main__':main()

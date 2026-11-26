"""User-requested full pass, independently of the earlier screening decision."""
import argparse
import collections
import csv
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess

from build import HERE,ROOT,PACKAGE,LABELS,save,sha
from run import CATALOG,TESTS,bench


def verify(p):
    for m in p['engines'].values():
        assert not m['instrumented'] and not m['sanitized']
        assert sha(m['binary'])==m['binary_sha256']
        for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
    for n,h in p['inputs'].items():assert sha(n)==h,n


def csvout(path,rows):
    with Path(path).open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)


def analyze(out,samples):
    aggregates={};tables={};all_rows=[]
    for suite in ['octane','sunspider']:
        rows=[];groups=collections.defaultdict(list);absolute={l:collections.defaultdict(list) for l in LABELS}
        for c in CATALOG['cases'][suite]:
            b,v=[next(s for s in samples if s['suite']==suite and s['case']==c['case'] and s['label']==l) for l in LABELS]
            row=dict(suite=suite,case=c['case'],name=c['name'],N=c['N'],SPARSE_ms=b['ms'],
                CTOR_LOCAL_SHAPE_GUARD_ms=v['ms'],change_percent=100*(v['ms']/b['ms']-1))
            rows.append(row)
            group=c['group'] if suite=='octane' else c['case']
            groups[group].append(math.log(v['ms']/b['ms']))
            for label,s in zip(LABELS,[b,v]):absolute[label][group].append(math.log(s['ms']))
        assert len(groups)==(14 if suite=='octane' else 26)
        gm=100*(math.exp(statistics.mean(statistics.mean(v) for v in groups.values()))-1)
        absolute_gm={l:math.exp(statistics.mean(statistics.mean(v) for v in absolute[l].values())) for l in LABELS}
        sums={l:sum(s['ms'] for s in samples if s['suite']==suite and s['label']==l) for l in LABELS}
        aggregates[suite]=dict(GM_percent=gm,GM_ms=absolute_gm,sum_ms=sums,
            faster=sum(r['change_percent']<0 for r in rows),slower=sum(r['change_percent']>0 for r in rows),
            worst=max(rows,key=lambda r:r['change_percent']),best=min(rows,key=lambda r:r['change_percent']))
        lines=['| 表项 | 原 SPARSE ms/Run | 局部守卫版 ms/Run | 相对 SPARSE |','|---|---:|---:|---:|']
        lines += [f'| {r["name"]} | {r["SPARSE_ms"]:.4f} | {r["CTOR_LOCAL_SHAPE_GUARD_ms"]:.4f} | {r["change_percent"]:+.2f}% |' for r in rows]
        lines += [f'| **整体 GM** | **{absolute_gm[LABELS[0]]:.4f}** | **{absolute_gm[LABELS[1]]:.4f}** | **{gm:+.2f}%** |',
            f'| **逐项耗时之和** | **{sums[LABELS[0]]:.4f}** | **{sums[LABELS[1]]:.4f}** | — |']
        (out/f'{suite}.md').write_text('\n'.join(lines)+'\n');csvout(out/f'{suite}.csv',rows)
        tables[suite]=lines;all_rows+=rows
    csvout(out/'comparison.csv',all_rows)
    regressions=[r for r in all_rows if r['change_percent']>5]
    if regressions:csvout(out/'regressions_over_5pct.csv',regressions)
    report=['# CTOR_LOCAL_SHAPE_GUARD 追加全集：同批单轮','',
        '按用户要求追加，独立于此前的定向筛选门槛。原 SPARSE 与候选均现场新测，复用原未插桩 Release，不重编译。'
        '每版每项一个新进程；原输入、固定 N、校验、Setup/Run 边界、首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。','',
        '| 套件 | 整体耗时 GM 变化 | 改善 / 回退项数 | 最大单项回退 |','|---|---:|---:|---|']
    for suite,a in aggregates.items():
        report.append(f'| {suite} | {a["GM_percent"]:+.2f}% | {a["faster"]} / {a["slower"]} | {a["worst"]["name"]} {a["worst"]["change_percent"]:+.2f}% |')
    report += ['', '负数表示耗时下降。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权，不合并两套分数。'
        '这是单轮筛选，不自动替换冻结 SPARSE。','',
        '此前的独立计数在原白盒、Boyer、Tree 上局部守卫覆盖为 0；本次全集仅计时，没有新增命中率诊断。'
        '耗时变化与已测到的机制证据分别报告。此前定向报告、decision.json 和原始时间全部保留。','',
        '## Octane','',*tables['octane'],'','## SunSpider','',*tables['sunspider'],'',
        '原始命令和完整 stdout：raw/*.run.json；逐项 CSV：comparison.csv；完整进程顺序和哈希：protocol.json。','',
        '复现：仓库根执行 `python3 js-interpreter-bench/experiments/ctor_local_shape_guard_20261124/attempt01/full_confirmation.py`，'
        '自动建立下一个 full_confirmationNN 目录，不覆盖旧数据。','']
    (out/'results.md').write_text('\n'.join(report))
    save(out/'summary.json',dict(status='PASS',new_release_processes=len(samples),aggregates=aggregates,
        rows=all_rows,regressions_over_5pct=regressions,previous_screening_unchanged=True))
    return aggregates


def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',type=Path);a=ap.parse_args()
    assert subprocess.check_output(['git','branch','--show-current'],cwd=ROOT,text=True).strip()=='myx'
    os.sched_setaffinity(0,{2});os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    if a.output:out=a.output.resolve()
    else:
        i=1
        while (HERE/f'full_confirmation{i:02d}').exists():i+=1
        out=HERE/f'full_confirmation{i:02d}'
    out.mkdir(parents=True,exist_ok=False)
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    schedule=[];inputs={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json')}
    for i in range(26):
        # Rotate each suite's engine order too; interleave the two suites.
        for suite in ['octane','sunspider']:
            if i>=len(CATALOG['cases'][suite]):continue
            c=CATALOG['cases'][suite][i];ref=native['scripts'][suite][c['case']]['measure']
            assert c['N']==ref['N'] and c['sha256']==ref['sha256']
            inputs[str(TESTS/c['path'])]=c['sha256']
            candidate_first=(i%2==0) if suite=='octane' else (i%2!=0)
            for label in (LABELS[::-1] if candidate_first else LABELS):schedule.append(dict(label=label,suite=suite,case=c))
    for n,h in CATALOG['support'].items():inputs[str(TESTS/n)]=h
    old={str(HERE/n):sha(HERE/n) for n in ['decision.json','timing_samples.json','mechanism.json','results.md','audit.json']}
    p=dict(engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS},
        inputs=inputs,schedule=schedule,CPU=2,TZ='Asia/Shanghai',locale='C',fresh_processes=86,
        first_Run_included=True,extra_warmup=0,repeats_per_case=1,platform=platform.platform(),
        authorization='explicit user request for full Octane and SunSpider despite earlier zero-coverage screening',
        prior_files=old,driver_sha256=sha(Path(__file__)),failure_policy='no automatic retries')
    save(out/'protocol.json',p);verify(p);print('OUTPUT',out,flush=True)
    samples=[]
    for i,j in enumerate(schedule):
        verify(p)
        r=bench(j['label'],'release',j['suite'],j['case'],str(out/'raw'),1)
        samples.append(r);save(out/'samples.json',samples)
        print('PASS',f'{i+1}/86',j['suite'],r['name'],r['label'],f'{r["ms"]:.6f}',flush=True)
    verify(p)
    for path,h in old.items():assert sha(path)==h,path
    results=analyze(out,samples)
    save(out/'complete.json',dict(status='PASS',fresh_processes=86,octane=17,sunspider=26,
        binaries_and_inputs_verified=True,previous_results_untouched=True))
    print('COMPLETE',json.dumps({s:r['GM_percent'] for s,r in results.items()}),flush=True)


if __name__=='__main__':main()

"""One additional paired Octane pass, preserving all previous measurements."""
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


def verify(protocol):
    for m in protocol['engines'].values():
        assert not m['instrumented'] and sha(m['binary'])==m['binary_sha256']
        for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
    for p,h in protocol['inputs'].items():assert sha(p)==h,p


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--output',type=Path)
    args=parser.parse_args()
    assert subprocess.check_output(['git','branch','--show-current'],cwd=ROOT,text=True).strip()=='myx'
    os.sched_setaffinity(0,{2})
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    if args.output:
        out=args.output.resolve()
    else:
        i=1
        while (HERE/f'octane_repeat{i:02d}').exists():i+=1
        out=HERE/f'octane_repeat{i:02d}'
    out.mkdir(parents=True,exist_ok=False)
    print('OUTPUT',out,flush=True)
    engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS}
    inputs={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json')}
    for c in CATALOG['cases']['octane']:inputs[str(TESTS/c['path'])]=c['sha256']
    for n,h in CATALOG['support'].items():inputs[str(TESTS/n)]=h
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    schedule=[]
    for i,c in enumerate(CATALOG['cases']['octane']):
        ref=native['scripts']['octane'][c['case']]['measure']
        assert ref['N']==c['N'] and ref['sha256']==c['sha256']
        # Start with the candidate; alternate order at every Octane item.
        for label in (LABELS[::-1] if i%2==0 else LABELS):
            schedule.append(dict(label=label,case=c))
    protocol=dict(engines=engines,inputs=inputs,schedule=schedule,CPU=2,TZ='Asia/Shanghai',locale='C',
        fresh_processes=34,processes_per_engine_per_case=1,extra_warmup=0,first_Run_included=True,
        timer='original native monotonic Run interval; load/Setup excluded',
        order='candidate first on first case; alternate engine order per Octane case',
        compiler='reuse exact previous uninstrumented Release binaries; no rebuild',
        previous_single_pass=str(HERE/'full_samples.json'),previous_sha256=sha(HERE/'full_samples.json'),
        driver_sha256=sha(Path(__file__)),platform=platform.platform(),
        failure_policy='preserve failed sample, no automatic retry')
    save(out/'protocol.json',protocol);verify(protocol)
    samples=[]
    for i,job in enumerate(schedule):
        verify(protocol)
        r=bench(job['label'],'release','octane',job['case'],str(out/'raw'),1)
        samples.append(r);save(out/'samples.json',samples)
        print('PASS',f'{i+1}/34',r['name'],r['label'],f'{r["ms"]:.6f}',flush=True)
    old=json.loads((HERE/'full_samples.json').read_text())
    assert sha(HERE/'full_samples.json')==protocol['previous_sha256']
    rows=[];new_groups=collections.defaultdict(list);old_groups=collections.defaultdict(list)
    for c in CATALOG['cases']['octane']:
        b,v=[next(r for r in samples if r['case']==c['case'] and r['label']==l) for l in LABELS]
        ob,ov=[next(r for r in old if r['suite']=='octane' and r['case']==c['case'] and r['label']==l) for l in LABELS]
        rows.append(dict(name=c['name'],case=c['case'],N=c['N'],SPARSE_ms=b['ms'],VERIFY_ms=v['ms'],
            change_percent=100*(v['ms']/b['ms']-1),previous_SPARSE_ms=ob['ms'],previous_VERIFY_ms=ov['ms'],
            previous_change_percent=100*(ov['ms']/ob['ms']-1)))
        new_groups[c['group']].append(math.log(v['ms']/b['ms']))
        old_groups[c['group']].append(math.log(ov['ms']/ob['ms']))
    assert len(new_groups)==len(old_groups)==14
    gm=lambda g:100*(math.exp(statistics.mean(statistics.mean(a) for a in g.values()))-1)
    aggregate=dict(new_GM_percent=gm(new_groups),previous_GM_percent=gm(old_groups),
        new_sum_ms={l:sum(r['ms'] for r in samples if r['label']==l) for l in LABELS},
        previous_sum_ms={l:sum(r['ms'] for r in old if r['suite']=='octane' and r['label']==l) for l in LABELS})
    table=['# Octane 追加一轮：两版同批交错','',
        '复用同一对未插桩 Release；CPU 2、Asia/Shanghai、C locale、原输入与 N。每项每版一个新进程，按表项交替先后顺序，首次 Run 计入，无额外热身。'
        '本轮独立保存，未覆盖或合并上一轮，不重跑 SunSpider。','',
        '| 表项 | 本轮 SPARSE ms/Run | 本轮新版 ms/Run | 本轮变化 | 上轮变化 |',
        '|---|---:|---:|---:|---:|']
    table += [f'| {r["name"]} | {r["SPARSE_ms"]:.4f} | {r["VERIFY_ms"]:.4f} | {r["change_percent"]:+.2f}% | {r["previous_change_percent"]:+.2f}% |' for r in rows]
    table += [f'| **整体 GM** | — | — | **{aggregate["new_GM_percent"]:+.2f}%** | **{aggregate["previous_GM_percent"]:+.2f}%** |','',
        'GM 按 Octane 14 suite 分层等权。负数表示耗时降低。原始进程命令和输出见 `raw/`；`comparison.csv` 保留两轮绝对时间。','',
        '复现：在仓库根目录运行 `python3 js-interpreter-bench/experiments/verify_offset_no_update_20261124/attempt01/octane_repeat.py`。默认新建下一个 repeat 目录，不覆盖已有记录。','']
    (out/'results.md').write_text('\n'.join(table))
    with (out/'comparison.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
    verify(protocol)
    save(out/'summary.json',dict(status='PASS',fresh_processes=34,rows=rows,aggregate=aggregate,
        previous_results_untouched=True,inputs_and_binaries_verified=True))
    print('COMPLETE',json.dumps(aggregate),flush=True)


if __name__=='__main__':main()

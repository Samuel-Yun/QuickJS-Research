"""One comparison table: historical A/SPARSE/V8 and the new TWICE pass."""
import collections
import csv
import json
import math
from pathlib import Path

from build import HERE,ROOT,sha,save

OUT=HERE/'full_bench'
SPARSE=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor'
NATIVE=ROOT/'experiments/native_confirmation_20261108/attempt02'
def csvout(path,rows):
    with path.open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def change(rows,numerator,denominator,suite):
    groups=collections.defaultdict(list)
    for r in rows:
        group=r['case'].split('.')[0] if suite=='octane' else r['case']
        groups[group].append(math.log(r[numerator]/r[denominator]))
    assert len(groups)==(14 if suite=='octane' else 26)
    return 100*(math.exp(sum(sum(v)/len(v) for v in groups.values())/len(groups))-1)
def main():
    assert json.loads((OUT/'complete.json').read_text())['status']=='PASS'
    samples=[r for r in map(json.loads,(OUT/'runs.jsonl').read_text().splitlines()) if r['event']=='sample']
    assert len(samples)==43 and all(r['valid'] for r in samples)
    native=list(csv.DictReader((NATIVE/'statistics.csv').open()))
    rows=[];summary={}
    for suite in ['octane','sunspider']:
        refs=list(csv.DictReader((SPARSE/'analysis'/f'{suite}.csv').open()))
        subset=[]
        for old in refs:
            s=next(r for r in samples if r['suite']==suite and r['case']==old['case'])
            assert s['N']==int(old['N'])
            for condition,column in [('A','A_ms'),('V8_ON','V8_ON_ms')]:
                ref=next(r for r in native if r['kind']==suite and r['case']==old['case'] and r['condition']==condition)
                assert int(ref['n'])==30 and int(ref['N'])==s['N']
                assert math.isclose(float(ref['median_ms']),float(old[column]),rel_tol=1e-12)
            r=dict(suite=suite,name=s['name'],case=s['case'],N=s['N'],
                A_ms=float(old['A_ms']),SPARSE_ms=float(old['candidate_ms']),
                TWICE_ms=s['ms_per_Run'],V8_ON_ms=float(old['V8_ON_ms']))
            for label in ['SPARSE','TWICE','V8_ON']:r[label+'_vs_A_pct']=100*(r[label+'_ms']/r['A_ms']-1)
            r['TWICE_vs_SPARSE_pct']=100*(r['TWICE_ms']/r['SPARSE_ms']-1)
            subset.append(r)
        assert len(subset)==(17 if suite=='octane' else 26)
        sums={label:sum(r[label+'_ms'] for r in subset) for label in ['A','SPARSE','TWICE','V8_ON']}
        summary[suite]=dict(cases=len(subset),SPARSE_vs_A_pct=change(subset,'SPARSE_ms','A_ms',suite),
            TWICE_vs_A_pct=change(subset,'TWICE_ms','A_ms',suite),
            TWICE_vs_SPARSE_pct=change(subset,'TWICE_ms','SPARSE_ms',suite),
            V8_ON_vs_A_pct=change(subset,'V8_ON_ms','A_ms',suite),sum_ms=sums,
            largest_improvement=min(subset,key=lambda r:r['TWICE_vs_SPARSE_pct']),
            largest_regression=max(subset,key=lambda r:r['TWICE_vs_SPARSE_pct']))
        rows+=subset
    csvout(OUT/'comparison.csv',rows)
    save(OUT/'summary.json',dict(comparison='跨批次单轮筛选',new_samples=43,
        controls_new_samples=0,aggregates=summary))
    table=['| 套件 | 表项 | A | 原 SPARSE | 两次失配版 | V8_ON --jitless |',
        '|---|---|---:|---:|---:|---:|']
    for suite in ['octane','sunspider']:
        title='Octane' if suite=='octane' else 'SunSpider'
        for r in rows:
            if r['suite']!=suite:continue
            table.append(f'| {title} | {r["name"]} | {r["A_ms"]:.4f} | '
                f'{r["SPARSE_ms"]:.4f} ({r["SPARSE_vs_A_pct"]:+.2f}%) | '
                f'{r["TWICE_ms"]:.4f} ({r["TWICE_vs_A_pct"]:+.2f}%) | {r["V8_ON_ms"]:.4f} |')
        s=summary[suite]
        table.append(f'| **{title}** | **整体 GM 相对 A** | **0.00%** | '
            f'**{s["SPARSE_vs_A_pct"]:+.2f}%** | **{s["TWICE_vs_A_pct"]:+.2f}%** | **{s["V8_ON_vs_A_pct"]:+.2f}%** |')
    (OUT/'table.md').write_text('\n'.join(table)+'\n')
    report=['# 两次失配版完整 Octane / SunSpider 单轮筛选','',
        '按用户后半段要求，只新测 TWICE：Octane 17 项、SunSpider 26 项，每项一个独立 Release 进程。'
        'A 与 V8_ON --jitless 使用历史 30 进程中位数，原 SPARSE 使用已有历史单轮。'
        '**这是跨批次单轮筛选，不是四版同一批次交错计时。** 新版的两套负载按表项交错执行。','',
        '单位 ms/Run，越小越快。SPARSE 和两次失配版括号里均为相对 A 的耗时变化；'
        '整体 GM 行仅列相对 A 的百分比。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。','']
    report+=table
    report+=['','## 新版相对原 SPARSE','']
    for suite in ['octane','sunspider']:
        s=summary[suite];im=s['largest_improvement'];reg=s['largest_regression']
        report.append(f'- {suite} 整体 GM：{s["TWICE_vs_SPARSE_pct"]:+.2f}%；'
            f'最大改善 {im["name"]} {im["TWICE_vs_SPARSE_pct"]:+.2f}%，'
            f'最大退化 {reg["name"]} {reg["TWICE_vs_SPARSE_pct"]:+.2f}%。')
        report.append('  逐项耗时之和（ms）：'+'；'.join(f'{k} {v:.4f}' for k,v in s['sum_ms'].items())+'。')
    report+=['','## 版本与输入','',
        '使用 attempt03/TWICE.release.manifest.json 中已通过微基准、语义与汇编检查的原二进制，'
        '未重新编译或调整策略。输入逐字节等同 native_confirmation_20261108/attempt02 的冻结 measure 脚本，'
        '固定 N、Setup/Run 边界、校验和、首个 Run 计入、无额外预热均保持原样。'
        'CPU 2、Asia/Shanghai、LC_ALL/LANG=C；zlib 使用同一读取接口。计时不带诊断计数。','',
        '原始计时、退出码、stdout/stderr、校验及 PID 在 runs.jsonl；protocol.json 保存输入/源码/二进制哈希与顺序。'
        'comparison.csv 为 43 项可导入 Excel 的完整表，summary.json 保存 GM 与逐项和。'
        '旧对照来自 03_sparse_ctor/analysis/{octane,sunspider}.csv；A/V8 数字另与原 30 轮 statistics.csv 核对。'
        '没有额外启动旧对照、补跑慢点或自动加轮；单轮差异不作为显著性结论。','']
    (OUT/'results.md').write_text('\n'.join(report))
    print(json.dumps({s:{k:v for k,v in a.items() if k.endswith('_pct')} for s,a in summary.items()},indent=2),flush=True)
if __name__=='__main__':main()

"""Same-cohort per-case tables, original suite weighting, predeclared filter."""
import collections
import csv
import json
import math
from pathlib import Path

from build import HERE,LABELS,save

OUT=HERE/'full_bench'
WORK={
 'SPARSE':'现场重测的冻结基线',
 'M1':'同次构造复用已验证的模板，少一次模板解析',
 'M2':'原型链按层走一趟；描述符仍逐字段检查',
 'P2':'同点保留 2 个正计划，减少目标交替时重学',
 'P3':'同点保留 3 个正计划，减少目标交替时重学',
 'P4':'同点保留 4 个正计划，减少目标交替时重学',
 'D16':'可重定位函数的字段读从 5 字节缩为 3 字节，融合保留',
}


def change(rows,label,suite):
    groups=collections.defaultdict(list)
    for r in rows:
        group=r['case'].split('.')[0] if suite=='octane' else r['case']
        groups[group].append(math.log(r[label+'_ms']/r['SPARSE_ms']))
    assert len(groups)==(14 if suite=='octane' else 26)
    return 100*(math.exp(sum(sum(v)/len(v) for v in groups.values())/len(groups))-1)


def csvout(path,rows):
    with path.open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)


def main():
    complete=json.loads((OUT/'complete.json').read_text());assert complete['status']=='PASS'
    labels=complete['labels']
    samples=[r for r in map(json.loads,(OUT/'runs.jsonl').read_text().splitlines()) if r['event']=='sample']
    assert len(samples)==43*len(labels) and all(r['valid'] for r in samples)
    rows=[];summaries={}
    for suite in ['octane','sunspider']:
        baseline=[r for r in samples if r['suite']==suite and r['label']=='SPARSE']
        data=[]
        for b in baseline:
            r=dict(suite=suite,case=b['case'],name=b['name'],N=b['N'])
            for label in labels:
                s=next(s for s in samples if s['suite']==suite and s['case']==b['case'] and s['label']==label)
                assert s['N']==b['N'];r[label+'_ms']=s['ms_per_Run']
            for label in labels:r[label+'_pct']=100*(r[label+'_ms']/r['SPARSE_ms']-1)
            data.append(r)
        assert len(data)==(17 if suite=='octane' else 26)
        summaries[suite]={l:dict(GM_pct=change(data,l,suite),sum_ms=sum(r[l+'_ms'] for r in data),
            faster=sum(r[l+'_pct']<0 for r in data),slower=sum(r[l+'_pct']>0 for r in data),
            maximum_regression=max(data,key=lambda r:r[l+'_pct'])['case'],
            maximum_regression_pct=max(r[l+'_pct'] for r in data)) for l in labels}
        table=['| 表项 | '+' | '.join(labels)+' |','|---|'+'---:|'*len(labels)]
        for r in data:
            table.append('| '+r['name']+' | '+' | '.join(f'{r[l+"_ms"]:.4f}'+
                (f' ({r[l+"_pct"]:+.2f}%)' if l!='SPARSE' else '') for l in labels)+' |')
        table.append('| **整体 GM 相对 SPARSE** | '+' | '.join(f'**{summaries[suite][l]["GM_pct"]:+.2f}%**' for l in labels)+' |')
        table.append('| **逐项 ms/Run 之和** | '+' | '.join(f'**{summaries[suite][l]["sum_ms"]:.4f}**' for l in labels)+' |')
        (OUT/(suite+'.md')).write_text('\n'.join(table)+'\n')
        csvout(OUT/(suite+'.csv'),data);rows+=data
    csvout(OUT/'comparison.csv',rows)
    (OUT/'by_version').mkdir(exist_ok=True)
    for label in labels:
        csvout(OUT/'by_version'/(label+'.csv'),[
            dict(suite=r['suite'],case=r['case'],N=r['N'],SPARSE_ms=r['SPARSE_ms'],
                 candidate_ms=r[label+'_ms'],change_pct=r[label+'_pct']) for r in rows])
    summary=[];regressions=[]
    for label in labels:
        o,s=[summaries[k][label]['GM_pct'] for k in ['octane','sunspider']]
        qualifies=label!='SPARSE' and ((o<=-2 and s<=1) or (s<=-2 and o<=1))
        worst=max(rows,key=lambda r:r[label+'_pct'])
        summary.append(dict(label=label,Octane_GM_pct=o,SunSpider_GM_pct=s,
            qualifies=qualifies,work_saved=WORK[label],worst_case=worst['case'],worst_pct=worst[label+'_pct']))
        if label!='SPARSE':
            regressions.extend(dict(label=label,suite=r['suite'],case=r['case'],
                SPARSE_ms=r['SPARSE_ms'],candidate_ms=r[label+'_ms'],change_pct=r[label+'_pct'])
                for r in rows if r[label+'_pct']>5)
    csvout(OUT/'summary.csv',summary)
    if regressions:
        csvout(OUT/'regressions_over_5pct.csv',regressions)
        regtable=['# 超过 5% 的单项回退','','| 版本 | 套件 | 表项 | SPARSE ms/Run | 候选 ms/Run | 变化 |',
                  '|---|---|---|---:|---:|---:|']
        regtable += [f'| {r["label"]} | {r["suite"]} | {r["case"]} | {r["SPARSE_ms"]:.4f} | '
                     f'{r["candidate_ms"]:.4f} | {r["change_pct"]:+.2f}% |' for r in regressions]
        (OUT/'regressions_over_5pct.md').write_text('\n'.join(regtable)+'\n')
    chosen=[r['label'] for r in summary if r['qualifies']]
    # Do not combine suite scores. If none passes, identify each suite's own
    # fastest candidate explicitly as a diagnostic follow-up, not a winner.
    next_versions=[]
    for suite in ['octane','sunspider']:
        candidates=chosen or [l for l in labels if l!='SPARSE']
        if candidates:
            pick=min(candidates,key=lambda l:summaries[suite][l]['GM_pct'])
            if pick not in next_versions:next_versions.append(pick)
    save(OUT/'summary.json',dict(status='PASS',same_cohort=True,new_processes=len(samples),
        aggregates=summaries,filter='either suite <= -2%; other suite <= +1%',
        qualifying_versions=chosen,next_versions=next_versions[:2],summary=summary,
        regressions_over_5pct=regressions))
    title=['# IC 独立候选单轮筛选', '',
        '唯一底座：冻结 SPARSE（06aada4）。SPARSE 也现场新测；按表项轮换版本顺序，各版各项一个新进程。'
        '未插桩 Release，CPU 2，原输入与固定 N、原 Setup/Run 边界、首次 Run 计入，无额外热身。', '',
        '| 版本 | Octane GM | SunSpider GM | 确实省掉的工作 | 最大单项回退 | 达到保留门槛 |',
        '|---|---:|---:|---|---|---|']
    for r in summary:
        worst='—' if r['label']=='SPARSE' else f'{r["worst_case"]} {r["worst_pct"]:+.2f}%'
        title.append(f'| {r["label"]} | {r["Octane_GM_pct"]:+.2f}% | {r["SunSpider_GM_pct"]:+.2f}% | '
            f'{r["work_saved"]} | {worst} | {"是" if r["qualifies"] else "—"} |')
    title += ['', '负数表示耗时下降。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM；'
        '两套不合并计分。门槛为任一套至少快 2%，另一套最多慢 1%。', '',
        ('达到门槛：'+ '、'.join(chosen)+'。' if chosen else '没有候选达到预先规定的整体保留门槛。'),
        '这些都是单轮筛选结果；不自动替换 SPARSE，也不叠加或调参补成绩。', '',
        '完整表：[Octane](octane.md)、[SunSpider](sunspider.md)；'
        '原始进程记录 `runs.jsonl`，完整 CSV `comparison.csv`，'
        '[超过 5% 的回退清单](regressions_over_5pct.md)另附同名 CSV。', '',
        '机制验证、代码摘录和后续建议见上一层 `mechanism_report.md`、`key_code.md`；复现命令见上一层 `REPRODUCE.md`。', '']
    (OUT/'results.md').write_text('\n'.join(title))
    print(json.dumps(summary,ensure_ascii=False,indent=2),flush=True)


if __name__=='__main__':main()

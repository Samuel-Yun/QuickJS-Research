"""Reproducible paired bootstrap + independent raw/schedule audit (no engines)."""
import collections
import csv
import json
import math
from pathlib import Path
import random
import statistics as st
from prepare_sources import HERE,ROOT,save,sha
from run import SUPPORTED,SEED,MODE,read,csvout

def quartiles(a):
    a=sorted(a);n=len(a);return st.median(a[:n//2]),st.median(a[(n+1)//2:])

def stats(a):
    q1,q3=quartiles(a)
    return dict(n=len(a),median=st.median(a),mean=st.mean(a),stddev=st.stdev(a) if len(a)>1 else None,
        Q1=q1,Q3=q3,IQR=q3-q1,min=min(a),max=max(a))

def percentile(a,q):
    a=sorted(a);p=(len(a)-1)*q;i=int(p);j=min(i+1,len(a)-1)
    return a[i]+(a[j]-a[i])*(p-i)

def bootstrap(a,b,seed):
    rng=random.Random(seed);values=[]
    for _ in range(10000):
        ix=[rng.randrange(len(a)) for _ in a]
        values.append(st.median([a[i] for i in ix])/st.median([b[i] for i in ix]))
    return percentile(values,.025),percentile(values,.975)

def svg_bars(path,rows,field,title):
    # Code-native vector figure; no external plotting package or web dependency.
    import html
    width,height=940,90+len(rows)*30
    vals=[r[field] for r in rows];limit=max(1.1,max(vals)*1.1)
    x=lambda v:300+v/limit*560
    pieces=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
      '<rect width="100%" height="100%" fill="white"/>',f'<text x="20" y="25" font-family="sans-serif" font-size="17">{html.escape(title)}</text>',
      f'<path d="M{x(1)},40 V{height-30}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rows):
        y=55+i*30;v=r[field]
        pieces.extend([f'<text x="10" y="{y+13}" font-family="sans-serif" font-size="13">{html.escape(r["case"])}</text>',
          f'<rect x="300" y="{y}" width="{x(v)-300}" height="19" fill="#30516a"/>',
          f'<text x="{x(v)+6}" y="{y+14}" font-family="sans-serif" font-size="13">{v:.3f}</text>'])
    pieces+=['</svg>'];save(path,'\n'.join(pieces))

def main():
    manifest=read(HERE/'manifest.json');schedule=read(HERE/'schedule.json');frozen=read(HERE/'frozen_config.json')
    assert sha(HERE/'manifest.json')==frozen['manifest_sha256'] and sha(HERE/'schedule.json')==frozen['schedule_sha256']
    for a in manifest['artifacts'].values():assert sha(a['path'])==a['sha256']
    for p,h in manifest['inputs'].items():assert sha(ROOT/p)==h
    files=list((HERE/'raw/formal').glob('*/*.json'));records=[read(p) for p in files]
    expected={(r['case'],r['rep'],r['variant'],r['order'],r['N']) for r in schedule}
    actual=[(r['case'],r['rep'],r['variant'],r['order'],r['N']) for r in records]
    duplicate=[k for k,v in collections.Counter(actual).items() if v>1]
    missing=sorted(expected-set(actual));extra=sorted(set(actual)-expected)
    valid=[r for r in records if r['valid']]
    order_counts={}
    for u in SUPPORTED:
        seq=[''.join(r['variant'] for r in sorted((r for r in schedule if r['case']==u and r['rep']==rep),key=lambda r:r['order'])) for rep in range(30)]
        order_counts[u]=dict(collections.Counter(seq));assert order_counts[u]=={'AB':15,'BA':15} or order_counts[u]=={'BA':15,'AB':15}
    for r in records:
        artifact=manifest['artifacts'][r['variant']]
        assert r['command'][0]==artifact['path'] and len(r['command'])==2
        assert r['binary_sha256']==artifact['sha256'] and r['mode']==MODE
        assert sha(r['command'][1])==r['script_sha256']
        if r['valid']:
            assert r['exit_code']==0 and not r['stderr'] and r['elapsed_ms']>0 and r['peak_rss_kib']>0
            p=r['payload'];assert p['correctness']=='PASS' and p['N']==r['N'] and p['warmup_calls']==0
            assert r['elapsed_ms']<=r['outer_wall_ns']/1e6+5
    csvout(HERE/'analysis/raw_formal.csv',[{k:(json.dumps(v,ensure_ascii=False) if isinstance(v,(list,dict)) else v) for k,v in r.items()} for r in sorted(records,key=lambda r:(r['rep'],r['case'],r['order']))])
    detail=[];summary=[];complete=[]
    for i,u in enumerate(SUPPORTED):
        ab={v:{r['rep']:r for r in valid if r['case']==u and r['variant']==v} for v in ['A','B']}
        paired=sorted(set(ab['A'])&set(ab['B']))
        if len(paired)!=30:continue
        complete.append(u)
        row=dict(case=u,status='complete',N=ab['A'][0]['N'],A_n=len(ab['A']),B_n=len(ab['B']))
        for metric,key,factor in [('execution','elapsed_per_call_ms',1),('end_to_end','outer_wall_ns',1e-6),('rss','peak_rss_kib',1)]:
            values={v:[ab[v][rep][key]*factor for rep in paired] for v in ['A','B']}
            med={v:st.median(values[v]) for v in ['A','B']}
            low,high=bootstrap(values['A'],values['B'],SEED+i)
            for v in ['A','B']:detail.append(dict(case=u,variant=v,metric=metric,unit='KiB' if metric=='rss' else ('ms/Run' if metric=='execution' else 'ms/process'),**stats(values[v])))
            row.update({metric+'_A_median':med['A'],metric+'_B_median':med['B'],
                metric+'_A_over_B':med['A']/med['B'],metric+'_CI95_low':low,metric+'_CI95_high':high,
                metric+'_B_change_pct':(med['B']/med['A']-1)*100})
        row['direction']='B faster' if row['execution_CI95_low']>1 else ('B slower' if row['execution_CI95_high']<1 else 'direction unclear')
        summary.append(row)
    assert not duplicate and not extra
    csvout(HERE/'analysis/statistics.csv',detail);csvout(HERE/'analysis/summary.csv',summary)
    suites=collections.defaultdict(list)
    for r in summary:suites[r['case'].split('.')[0]].append(r['execution_A_over_B'])
    suitegm={s:math.exp(st.mean(math.log(v) for v in vs)) for s,vs in suites.items()}
    aggregate=dict(covered_units=len(complete),covered_suites=len(suites),complete_cases=complete,
        equal_suite_geomean_speedup=math.exp(st.mean(math.log(v) for v in suitegm.values())),
        suite_speedups=suitegm,equal_unit_geomean_speedup=math.exp(st.mean(math.log(r['execution_A_over_B']) for r in summary)),
        official_Octane_score=False,latency_scores_included=False,
        directions=dict(collections.Counter(r['direction'] for r in summary)))
    save(HERE/'analysis/aggregate.json',aggregate)
    for field,title in [('execution_A_over_B','Fixed-work execution speedup A/B (>1 means IC port faster)'),
                        ('end_to_end_A_over_B','New-process wall-time ratio A/B'),('rss_A_over_B','Peak RSS ratio A/B (KiB, wait4)')]:
        svg_bars(HERE/'analysis'/(field+'.svg'),summary,field,title)
    audit=dict(status='PASS' if len(valid)==960 and not missing and not duplicate else 'INCOMPLETE',
        target=960,actual=len(records),valid=len(valid),failed=len(records)-len(valid),missing=missing,duplicates=duplicate,unexpected=extra,
        order_counts=order_counts,hashes_verified=True,first_call_included=True,correctness_N1_N2=True,
        below_calibration_threshold=sum(r['elapsed_ms']<1000 for r in valid),outliers_removed=0,
        source_identity=manifest['source_provenance'],ci_method='10000 paired process-pair bootstrap; ratio of medians; pointwise exploratory',
        diagnostic_results_not_used_for_timing=True)
    save(HERE/'analysis/audit.json',audit)
    lines=['# Octane A/B：正式数据汇总','',
        '| 单元 | A ms/Run | B ms/Run | A/B | 95%区间 | 方向 | A/B peak KiB |',
        '|---|---:|---:|---:|---|---|---|']
    for r in summary:
        lines.append(f'| {r["case"]} | {r["execution_A_median"]:.6f} | {r["execution_B_median"]:.6f} | {r["execution_A_over_B"]:.4f} | [{r["execution_CI95_low"]:.4f}, {r["execution_CI95_high"]:.4f}] | {r["direction"]} | {r["rss_A_median"]:.0f}/{r["rss_B_median"]:.0f} |')
    lines+=['',f'正式样本 {len(valid)}/960；完整交集 {len(complete)} Run单元、{len(suites)} suites。',
        f'先子项等权GM、再suite等权GM：{aggregate["equal_suite_geomean_speedup"]:.4f}。不是官方Octane总分。',
        f'正式低于1000ms的样本：{audit["below_calibration_threshold"]}，全部保留。',
        '完整 mean / sample stddev / Q1 / Q3 / IQR / min / max 见 statistics.csv；外部墙钟和RSS见 summary.csv。']
    save(HERE/'analysis/tables.md','\n'.join(lines)+'\n')
    print(json.dumps(audit,ensure_ascii=False),flush=True)

if __name__=='__main__':main()

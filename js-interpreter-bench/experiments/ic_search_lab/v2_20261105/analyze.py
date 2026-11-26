"""Portable V2 tables, no runtime launches. Only completed campaigns aggregate."""
import csv,io,json,math,random,statistics
from functools import lru_cache
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def writecsv(name,rows):
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)
    (HERE/name).write_text(s.getvalue(),encoding='utf-8',newline='\n')
def pct(x,p):
    x=sorted(x);at=(len(x)-1)*p;i=int(at);return x[i]+(x[min(i+1,len(x)-1)]-x[i])*(at-i)
def desc(x):
    x=sorted(x);n=len(x);q1=statistics.median(x[:n//2]);q3=statistics.median(x[(n+1)//2:])
    return dict(n=n,median=statistics.median(x),mean=statistics.mean(x),sample_stddev=statistics.stdev(x),Q1=q1,Q3=q3,IQR=q3-q1,min=min(x),max=max(x))
@lru_cache(maxsize=1)
def suite_mapping():
    return {r['case']:r['suite'] for r in load(ROOT/'experiments/v8_inspired_ic/attempt03/case_catalog.json')}
def aggregate(kind,cases,ratios,scope):
    if kind=='sunspider':return math.exp(statistics.mean(math.log(x) for x in ratios))
    suites=suite_mapping()
    by={}
    for case,r in zip(cases,ratios):
        if scope=='core16_13suite' and case=='zlib.zlib':continue
        by.setdefault(suites[case],[]).append(math.log(r))
    return math.exp(statistics.mean(statistics.mean(v) for v in by.values()))
def recheck(path):
    d=load(path);cid=d['candidate'];parent=d['parent'];kind=d['kind'];g=d['groups'];R=d['rounds'];labels=['A',cid,parent]
    assert R==3 and d['count']==d['expected']==len(g)*R*3
    cases=[v['case'] for v in g];scope=['all26_case_equal'] if kind=='sunspider' else ['core16_13suite','expanded17_14suite']
    stats=[dict(case=x['case'],condition=l,N=x['N'],unit='ms/Run',**desc([v[l] for v in x['rounds']])) for x in g for l in labels]
    writecsv(f'{cid}.{kind}.statistics.csv',stats)
    rr=[];aa=[];rounds=[];rng=random.Random(20261105);draws=[[rng.randrange(R) for _ in range(R)] for _ in range(10000)]
    for other in ['A',parent]:
        point=[x['medians_ms'][cid]/x['medians_ms'][other] for x in g];bs=[[] for _ in g];bg={s:[] for s in scope}
        # With three rounds there are only27 ordered index draws. Memoize
        # arithmetic, NOT resampling: all10000 fixed RNG draws remain present.
        evaluated={}
        for idx in draws:
            key=tuple(idx)
            if key not in evaluated:
                ratios=[statistics.median(x['rounds'][j][cid] for j in idx)/statistics.median(x['rounds'][j][other] for j in idx) for x in g]
                evaluated[key]=(ratios,{s:aggregate(kind,cases,ratios,s) for s in scope})
            ratios,gms=evaluated[key]
            for i,r in enumerate(ratios):bs[i].append(r)
            for s in scope:bg[s].append(gms[s])
        for i,x in enumerate(g):rr.append(dict(case=x['case'],comparison=f'{cid}/{other}',N=x['N'],ratio=point[i],low95=pct(bs[i],.025),high95=pct(bs[i],.975),n=R))
        for s in scope:aa.append(dict(scope=s,comparison=f'{cid}/{other}',ratio=aggregate(kind,cases,point,s),low95=pct(bg[s],.025),high95=pct(bg[s],.975),rounds=R,draws=10000,seed=20261105))
        for rep in range(R):
            ratios=[x['rounds'][rep][cid]/x['rounds'][rep][other] for x in g]
            for s in scope:rounds.append(dict(rep=rep,scope=s,comparison=f'{cid}/{other}',ratio=aggregate(kind,cases,ratios,s)))
    writecsv(f'{cid}.{kind}.ratios.csv',rr);writecsv(f'{cid}.{kind}.aggregates.csv',aa);writecsv(f'{cid}.{kind}.rounds.csv',rounds)
    text=[f'# {cid}: {kind}，3轮复筛（非正式30样本）','',
          '单位ms/完整Run。首次Run计入，无额外workload预跑；N为每进程重复数。比值<1为候选耗时较低。',
          '95%为10000次共享整轮配对bootstrap、seed20261105；3轮小样本、搜索选择偏差、未作多重校正。跨1不证明等效。',
          'SunSpider原26项保留两项未固定随机种子的限制；Octane Crypto用固定输入/密文门禁；非官方Octane总分。','',
          f'|case|N|A median|M median|{cid} median|{cid}/A [95%]|{cid}/M [95%]|','|---|---:|---:|---:|---:|---|---|']
    for x in g:
        vals={r['comparison']:r for r in rr if r['case']==x['case']};show=lambda z:f"{z['ratio']:.4f} [{z['low95']:.4f},{z['high95']:.4f}]"
        m=x['medians_ms'];text.append(f"|{x['case']}|{x['N']}|{m['A']:.6g}|{m[parent]:.6g}|{m[cid]:.6g}|{show(vals[cid+'/A'])}|{show(vals[cid+'/'+parent])}|")
    (HERE/f'{cid}.{kind}.table.md').write_text('\n'.join(text)+'\n',encoding='utf-8',newline='\n')
    return aa
def main():
    rows=[];cases=[];derived=[]
    for p in sorted(HERE.glob('s*.matched.*.screen.json')):
        d=load(p);assert len(d['groups'])==(26 if d['kind']=='sunspider' else 17)
        rows.append(dict(candidate=d['candidate'],kind=d['kind'],stage='single screen, NOT final',GM=d['ratio_GM'],core=d.get('suite_GM',{}).get('core16_13suite'),expanded=d.get('suite_GM',{}).get('expanded17_14suite'),regression_gt10=';'.join(d['greater_than_10pct_regressions']),unstable=';'.join(d['unstable_cases'])))
        for g in d['groups']:cases.append(dict(candidate=d['candidate'],kind=d['kind'],case=g['case'],N=g['N'],A_before_ms_per_Run=g['A_before_ms']/g['N'],candidate_ms_per_Run=g['candidate_ms']/g['N'],A_after_ms_per_Run=g['A_after_ms']/g['N'],ratio=g['ratio'],drift=g['drift'],status=g['status']))
    writecsv('screen_summary.csv',rows);writecsv('screen_per_case.csv',cases)
    for p in sorted(HERE.glob('s*.matched.*.recheck.json')):derived.extend(recheck(p))
    print(json.dumps(dict(screens=rows,recheck=derived),ensure_ascii=False),flush=True)
if __name__=='__main__':main()

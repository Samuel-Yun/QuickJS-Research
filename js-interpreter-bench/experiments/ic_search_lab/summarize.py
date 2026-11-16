"""Portable derived tables/paired exploratory recheck bootstrap; no runtime launch."""
import argparse,csv,io,json,math,random,statistics
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def csvout(name,rows):
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)
    (HERE/name).write_text(s.getvalue(),encoding='utf-8')
def quantile(xs,p):
    xs=sorted(xs);j=(len(xs)-1)*p;i=int(j);return xs[i]+(xs[min(i+1,len(xs)-1)]-xs[i])*(j-i)
def describe(xs):
    x=sorted(xs);n=len(x);q1=statistics.median(x[:n//2]) if n>1 else x[0];q3=statistics.median(x[(n+1)//2:]) if n>1 else x[0]
    return dict(n=n,median=statistics.median(x),mean=statistics.mean(x),sample_stddev=statistics.stdev(x) if n>1 else None,
                Q1=q1,Q3=q3,IQR=q3-q1,min=min(x),max=max(x))
def recheck(cid,kind):
    p=HERE/f'{cid}.matched.{kind}.recheck.json'
    if not p.exists():return
    d=load(p);groups=d['groups'];parent=load(HERE/f'{cid}.matched.json')['parent'];labels=['A',cid,parent];R=d['rounds']
    assert R in [3,4,5] and d['count']==len(groups)*R*3 and d['expected']==d['count']
    stats=[]
    for g in groups:
        assert len(g['rounds'])==R
        for label in labels:
            x=[r[label] for r in g['rounds']];assert all(math.isfinite(v) and v>0 for v in x)
            assert statistics.median(x)==g['medians_ms'][label]
            stats.append(dict(kind=kind,case=g['case'],condition=label,N=g['N'],unit='ms/Run',**describe(x)))
    csvout(f'{cid}.{kind}.recheck_statistics.csv',stats)
    suites={r['case']:r['suite'] for r in load(HERE.parent/'v8_inspired_ic/attempt03/case_catalog.json')}
    subsets={'all26_case_equal':list(range(len(groups)))} if kind=='sunspider' else {
        'core16_13suite':[i for i,g in enumerate(groups) if g['case']!='zlib.zlib'],
        'expanded17_14suite':list(range(len(groups)))}
    def agg(ratios,idx):
        if kind=='sunspider':return math.exp(statistics.mean(math.log(ratios[i]) for i in idx))
        by={}
        for i in idx:by.setdefault(suites[groups[i]['case']],[]).append(math.log(ratios[i]))
        return math.exp(statistics.mean(statistics.mean(v) for v in by.values()))
    rng=random.Random(20261104);draws=[[rng.randrange(R) for _ in range(R)] for _ in range(10000)]
    all_summaries=[];case_summaries=[]
    for other in ['A',parent]:
        points=[g['medians_ms'][cid]/g['medians_ms'][other] for g in groups];samples=[[] for _ in groups]
        agg_samples={key:[] for key in subsets}
        for indices in draws:
            ratios=[]
            for i,g in enumerate(groups):
                ratios.append(statistics.median(g['rounds'][j][cid] for j in indices)/statistics.median(g['rounds'][j][other] for j in indices))
                samples[i].append(ratios[-1])
            for key,idx in subsets.items():agg_samples[key].append(agg(ratios,idx))
        for i,g in enumerate(groups):
            low,high=quantile(samples[i],.025),quantile(samples[i],.975)
            case_summaries.append(dict(kind=kind,case=g['case'],comparison=f'{cid}/{other}',ratio=points[i],low95=low,high95=high,
               unit='ratio of medians ms/Run',samples_per_condition=R,CI='exploratory paired bootstrap with only '+str(R)+' independent rounds; not final30'))
        for key,idx in subsets.items():
            all_summaries.append(dict(kind=kind,scope=key,comparison=f'{cid}/{other}',ratio=agg(points,idx),low95=quantile(agg_samples[key],.025),high95=quantile(agg_samples[key],.975),
                cases=len(idx),rounds=R,bootstrap_draws=10000,seed=20261104,CI='exploratory shared-round blocks; not final confirmation'))
    csvout(f'{cid}.{kind}.recheck_ratios.csv',case_summaries);csvout(f'{cid}.{kind}.recheck_aggregates.csv',all_summaries)
    round_rows=[]
    for rep in range(R):
        for other in ['A',parent]:
            ratios=[g['rounds'][rep][cid]/g['rounds'][rep][other] for g in groups]
            for key,idx in subsets.items():round_rows.append(dict(kind=kind,rep=rep,scope=key,comparison=f'{cid}/{other}',ratio=agg(ratios,idx)))
    csvout(f'{cid}.{kind}.recheck_rounds.csv',round_rows)
    text=[f'# {cid} / {kind}：完整复筛表', '',
          f'每个条件每项仅{R}个新进程，不是正式30样本。单位ms/完整Run；N是每个进程的Run次数。首次Run计入，无额外workload预跑。', '',
          '比值为候选/对照的中位数之比，<1表示候选耗时更低。95%区间是10000次整轮配对bootstrap、seed20261104，探索性、逐项未校正；跨1为方向不明确，不代表等效。', '',
          ('SunSpider两项未固定随机种子，见input_control_limitations.json；保留全部案例，不称严格随机输入逐字节相同。' if kind=='sunspider' else
           'Octane Crypto复用已验证的确定性输入及N对应密文门禁；核心16项/13suite和扩展17项/14suite不是官方总分。Box2D与官方latency既有覆盖限制保留。'), '',
          f'|case|N|A median|{parent} median|{cid} median|{cid}/A [95%]|{cid}/{parent} [95%]|',
          '|---|---:|---:|---:|---:|---|---|']
    for g in groups:
        pair={r['comparison']:r for r in case_summaries if r['case']==g['case']}
        show=lambda r:f"{r['ratio']:.4f} [{r['low95']:.4f}, {r['high95']:.4f}]"
        m=g['medians_ms']
        text.append(f"|{g['case']}|{g['N']}|{m['A']:.6g}|{m[parent]:.6g}|{m[cid]:.6g}|{show(pair[cid+'/A'])}|{show(pair[cid+'/'+parent])}|")
    text+=['','mean、样本stddev、Tukey Q1/Q3/IQR、min/max见同名前缀的recheck_statistics.csv；每一轮的整体方向见recheck_rounds.csv。','']
    (HERE/f'{cid}.{kind}.recheck_table.md').write_text('\n'.join(text),encoding='utf-8')
    print('RECHECK_BOOTSTRAP',cid,kind,json.dumps(all_summaries),flush=True)

def main(best):
    candidates=list(csv.DictReader((HERE/'candidates.csv').open(encoding='utf-8',newline='')));rows=[]
    for c in candidates:
        row={k:c[k] for k in ['id','parent','category','hypothesis','status','patch_sha256','binary_sha256','build_profile']}
        for kind in ['sunspider','octane']:
            p=HERE/f"{c['id']}.matched.{kind}.screen.json"
            if p.exists():
                d=load(p);assert d['build_profile']=='matched'
                row[kind+'_GM']=d['ratio_GM'] if kind=='sunspider' else d['suite_GM']['core16_13suite']
                row[kind+'_expanded_GM']=d.get('suite_GM',{}).get('expanded17_14suite')
                row[kind+'_regression_gt10']=';'.join(d['greater_than_10pct_regressions'])
                row[kind+'_unstable']=';'.join(d['unstable_cases'])
            else:
                row.update({kind+'_GM':None,kind+'_expanded_GM':None,kind+'_regression_gt10':'NOT_RUN',kind+'_unstable':None})
        rows.append(row)
    csvout('candidate_summary.csv',rows)
    points=[]
    for kind in ['sunspider','octane']:
        p=HERE/f'{best}.matched.{kind}.screen.json'
        if p.exists():
            for g in load(p)['groups']:
                n=g['N'];points.append(dict(candidate=best,kind=kind,case=g['case'],N=n,A_before_ms_per_Run=g['A_before_ms']/n,
                    candidate_ms_per_Run=g['candidate_ms']/n,A_after_ms_per_Run=g['A_after_ms']/n,ratio=g['ratio'],
                    A_drift=g['drift'],status=g['status'],stage='one-process exploratory screen, NOT median of30'))
        recheck(best,kind)
    csvout('best_per_case.csv',points)
    print('MATCHED_CANDIDATE_SUMMARY',json.dumps([{k:r[k] for k in ['id','sunspider_GM','octane_GM']} for r in rows]),flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--best',default='c004');a=p.parse_args();main(a.best)

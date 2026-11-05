"""Portable four-condition raw replay; intentionally no GM or live identity calls."""
import collections,html,math,random,statistics as st
from common import *
PAIRS=[('LOOKUP','ON'),('A','M'),('M','ON'),('A','ON'),('A','LOOKUP')]
def quantile(a,p):
    a=sorted(a);x=(len(a)-1)*p;i=int(x);return a[i]+(a[min(i+1,len(a)-1)]-a[i])*(x-i)
def stats(a):
    s=sorted(a);n=len(s);q1=st.median(s[:n//2]);q3=st.median(s[(n+1)//2:])
    return dict(n=n,median=st.median(s),mean=st.mean(s),sample_stddev=st.stdev(s),Q1=q1,Q3=q3,IQR=q3-q1,min=s[0],max=s[-1])
def bootstrap(vals,seed):
    rng=random.Random(seed);n=len(vals['A']);ss={a+'_'+b:[] for a,b in PAIRS}
    for _ in range(10000):
        ix=[rng.randrange(n) for _ in range(n)];med={v:st.median(vals[v][i] for i in ix) for v in VERSIONS}
        for a,b in PAIRS:ss[a+'_'+b].append(med[a]/med[b])
    return {k:(quantile(x,.025),quantile(x,.975)) for k,x in ss.items()}
def plot(rs,pair,metric):
    prefix=metric+'_'+pair;lo=min(.99,min(r[prefix+'_CI_low'] for r in rs)*.98);hi=max(1.01,max(r[prefix+'_CI_high'] for r in rs)*1.02)
    x=lambda v:280+(v-lo)/(hi-lo)*570;h=110+34*len(rs)
    out=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1040" height="{h}">','<rect width="100%" height="100%" fill="white"/>',
      f'<text x="12" y="24" font-size="16" font-family="sans-serif">{metric}: {pair.replace("_","/")} ratio of medians, paired 95% CI; &gt;1: denominator faster</text>',
      f'<path d="M{x(1)},40 V{h-45}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rs):
        y=58+i*34;out +=[f'<text x="12" y="{y+5}" font-size="13" font-family="sans-serif">{html.escape(r["case"])}</text>',
          f'<path d="M{x(r[prefix+"_CI_low"])},{y} H{x(r[prefix+"_CI_high"])}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r[prefix+"_ratio"])}" cy="{y}" r="4" fill="#24465a"/>',f'<text x="900" y="{y+5}" font-size="13">{r[prefix+"_ratio"]:.4f}</text>']
    for i in range(6):
        v=lo+(hi-lo)*i/5;out.append(f'<text x="{x(v)-15}" y="{h-22}" font-size="12">{v:.3f}</text>')
    out.append('</svg>');save(HERE/'analysis'/f'{metric}_{pair}_CI.svg','\n'.join(out)+'\n')
def main():
    m=read(HERE/'measurement_manifest.json');f=read(HERE/'frozen.json');schedule=read(HERE/'schedule.json')
    for k,p in [('protocol_sha256','protocol.json'),('manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json'),('script_hashes_sha256','script_hashes.json')]:assert sha(HERE/p)==f[k]
    for name,h in f['selected'].items():assert sha(HERE/'selected'/name)==h
    records=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')];key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N'])
    expected={key(r) for r in schedule};actual=[key(r) for r in records];dupes=[list(k) for k,n in collections.Counter(actual).items() if n>1]
    missing=[list(x) for x in sorted(expected-set(actual))];extra=[list(x) for x in sorted(set(actual)-expected)]
    for r in records:
        a=m['artifacts'][r['variant']];assert r['binary_sha256']==a['sha256'] and r['command'][0]==a['path'] and len(r['command'])==2
        assert r['mode_value']==config(r['variant']) and r['flags']==[] and r['mode']==MODE and r['campaign']==m['campaign']
        assert r['script_sha256']==read(HERE/'script_hashes.json')[r['case']]
    rows=[];detail=[];excluded=[]
    for index,c in enumerate(CASES):
        vs={v:{r['rep']:r for r in records if r['case']==c and r['variant']==v and r['valid']} for v in VERSIONS}
        reps=sorted(set.intersection(*(set(x) for x in vs.values())))
        if reps!=list(range(32)):excluded.append(dict(case=c,reason='incomplete valid quadruples',valid_reps=reps));continue
        row=dict(case=c,N=vs['A'][0]['N'],**{v+'_n':len(vs[v]) for v in VERSIONS})
        for rep in reps:
            rr=[vs[v][rep] for v in VERSIONS];assert len({r['N'] for r in rr})==len({r['script_sha256'] for r in rr})==1
            on,look=vs['ON'][rep],vs['LOOKUP'][rep];assert on['binary_sha256']==look['binary_sha256'] and on['command']==look['command'] and on['mode_value']!=look['mode_value']
        for metric,field,scale in [('execution','elapsed_per_call_ms',1),('e2e','outer_wall_ns',1e-6)]:
            vals={v:[vs[v][rep][field]*scale for rep in reps] for v in VERSIONS};ci=bootstrap(vals,SEED+index);med={v:st.median(a) for v,a in vals.items()}
            for v in VERSIONS:
                row[metric+'_'+v+'_median']=med[v];detail.append(dict(case=c,variant=v,metric=metric,unit='ms/Run' if metric=='execution' else 'ms/process',**stats(vals[v])))
            for a,b in PAIRS:
                lo,hi=ci[a+'_'+b];p=metric+'_'+a+'_'+b
                row.update({p+'_ratio':med[a]/med[b],p+'_CI_low':lo,p+'_CI_high':hi,p+'_right_time_change_pct':(med[b]/med[a]-1)*100,p+'_change_CI_low':(1/hi-1)*100,p+'_change_CI_high':(1/lo-1)*100,p+'_direction':'right_faster' if lo>1 else 'right_slower' if hi<1 else 'unclear'})
        rows.append(row)
    if rows:
        csvout(HERE/'analysis/summary.csv',rows);csvout(HERE/'analysis/statistics.csv',detail)
        for metric in ['execution','e2e']:
            for a,b in PAIRS:plot(rows,a+'_'+b,metric)
    save(HERE/'analysis/formal_audit.json',dict(status='PASS' if len(records)==1024 and not missing and not extra and not dupes and all(r['valid'] for r in records) else 'INCOMPLETE',expected=1024,actual=len(records),valid=sum(r['valid'] for r in records),missing=missing,duplicates=dupes,extra=extra,excluded=excluded,below_1000ms=sum(r['valid'] and r['elapsed_ms']<1000 for r in records),outliers_removed=0,bootstrap_samples=10000,no_GM=True,public_data_only=True))
    print('FORMAL_ANALYSIS_COMPLETE',len(records),flush=True)
if __name__=='__main__':main()

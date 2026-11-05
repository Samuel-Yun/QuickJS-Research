"""Portable data-only replay. No imports/calls requiring an installed JS runtime."""
import argparse,collections,html,math,random,statistics as st
from common import *
PAIRS=[('A','R'),('M','R'),('A','M')]
def quantile(values,p):
    a=sorted(values);x=(len(a)-1)*p;i=int(x);j=min(i+1,len(a)-1);return a[i]+(a[j]-a[i])*(x-i)
def stats(a):
    s=sorted(a);n=len(s);q1=st.median(s[:n//2]);q3=st.median(s[(n+1)//2:])
    return dict(n=n,median=st.median(a),mean=st.mean(a),sample_stddev=st.stdev(a),Q1=q1,Q3=q3,IQR=q3-q1,min=min(a),max=max(a))
def ci_triples(vals,seed):
    rng=random.Random(seed);n=len(vals['A']);samples={a+b:[] for a,b in PAIRS}
    for _ in range(10000):
        ix=[rng.randrange(n) for _ in range(n)]
        med={v:st.median(vals[v][i] for i in ix) for v in VERSIONS}
        for a,b in PAIRS:samples[a+b].append(med[a]/med[b])
    return {p:(quantile(v,.025),quantile(v,.975)) for p,v in samples.items()}
def plot(rows,path,field,low,high,title):
    maximum=max(1.1,max(float(r[high]) for r in rows)*1.08);left=270;scale=600/maximum
    body=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="{95+len(rows)*32}">',
      '<rect width="100%" height="100%" fill="white"/>',f'<text x="15" y="25" font-size="17" font-family="sans-serif">{html.escape(title)}</text>',
      f'<path d="M{left+scale},42 v{len(rows)*32}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rows):
        y=60+i*32;x=lambda n:left+scale*float(n)
        body.extend([f'<text x="10" y="{y+5}" font-size="13" font-family="sans-serif">{html.escape(r["case"])}</text>',
          f'<line x1="{x(r[low])}" x2="{x(r[high])}" y1="{y}" y2="{y}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r[field])}" cy="{y}" r="4" fill="#24465a"/>',
          f'<text x="900" y="{y+5}" font-size="13">{float(r[field]):.4f}</text>'])
    body.append('</svg>');save(path,'\n'.join(body))
def formal():
    m=read(HERE/'measurement_manifest.json');schedule=read(HERE/'schedule.json');frozen=read(HERE/'frozen.json')
    for key,p in [('protocol_sha256','protocol.json'),('measurement_manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json')]:assert sha(HERE/p)==frozen[key]
    rows=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N'])
    expected={key(r) for r in schedule};actual=[key(r) for r in rows]
    duplicates=[list(k) for k,n in collections.Counter(actual).items() if n>1]
    missing=[list(k) for k in sorted(expected-set(actual))];extra=[list(k) for k in sorted(set(actual)-expected)]
    ordering={}
    for case in CASES:
        seq=[''.join(r['variant'] for r in sorted([r for r in schedule if r['case']==case and r['rep']==rep],key=lambda r:r['order'])) for rep in range(30)]
        ordering[case]=dict(collections.Counter(seq));assert len(ordering[case])==6 and set(ordering[case].values())=={5}
    script_hashes=read(HERE/'script_hashes.json')
    assert sha(HERE/'script_hashes.json')==frozen['script_hashes_sha256']
    for name,h in frozen['selected'].items():assert sha(HERE/'selected'/name)==h
    for r in rows:
        assert r['script_sha256']==script_hashes[r['case']]
        assert r['mode']==MODE and r['campaign']==m['campaign']
        assert r['cohort']==m['cohort']
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256'] and r['flags']==[]
        assert r['command'][0]==m['artifacts'][r['variant']]['path'] and len(r['command'])==2
        if r['valid']:
            assert r['exit_code']==0 and not r['stderr'] and r['payload']['correctness']=='PASS'
            assert r['payload']['warmup_calls']==0 and r['elapsed_ms']>0 and r['elapsed_ms']<=r['outer_wall_ns']/1e6+5
    summaries=[];detail=[];included=[]
    for idx,case in enumerate(CASES):
        cases=[r for r in rows if r['case']==case and r['valid']]
        vrep={v:{r['rep']:r for r in cases if r['variant']==v} for v in VERSIONS}
        reps=sorted(set.intersection(*[set(x) for x in vrep.values()]))
        if len(reps)!=30:continue
        included.append(case);row=dict(case=case,N=vrep['A'][0]['N'],main_aggregate=case in OCTANE_CASES and not case.startswith('Crypto.'))
        for v in VERSIONS:row[v+'_n']=len(vrep[v])
        for rep in reps:
            rr=[vrep[v][rep] for v in VERSIONS];assert len({r['script_sha256'] for r in rr})==1 and len({r['N'] for r in rr})==1
        for metric,keyname,scale in [('execution','elapsed_per_call_ms',1),('e2e','outer_wall_ns',1e-6)]:
            vals={v:[vrep[v][rep][keyname]*scale for rep in reps] for v in VERSIONS};cis=ci_triples(vals,SEED+idx)
            med={v:st.median(vals[v]) for v in VERSIONS}
            for v in VERSIONS:
                row[metric+'_'+v+'_median']=med[v]
                detail.append(dict(case=case,variant=v,metric=metric,unit='ms/Run' if metric=='execution' else 'ms/process',**stats(vals[v])))
            for a,b in PAIRS:
                p=metric+'_'+a+b;low,high=cis[a+b]
                row.update({p+'_speedup':med[a]/med[b],p+'_CI_low':low,p+'_CI_high':high,p+'_right_time_change_pct':(med[b]/med[a]-1)*100,
                  p+'_change_CI_low':(1/high-1)*100,p+'_change_CI_high':(1/low-1)*100,
                  p+'_direction':'right_faster' if low>1 else ('right_slower' if high<1 else 'unclear')})
        summaries.append(row)
    csvout(HERE/'analysis/summary.csv',summaries);
    csvout(HERE/'analysis/octane_summary.csv',[r for r in summaries if r['case'] in OCTANE_CASES]);
    csvout(HERE/'analysis/micro_summary.csv',[r for r in summaries if r['case'] in MICRO_CASES]);csvout(HERE/'analysis/statistics.csv',detail)
    aggregate={}
    for include_crypto,label in [(False,'MAIN_no_Crypto'),(True,'sensitivity_with_Crypto')]:
        selected=[r for r in summaries if r['case'] in OCTANE_CASES and (include_crypto or r['main_aggregate'])];suites=collections.defaultdict(list)
        for r in selected:suites[r['case'].split('.')[0]].append(r)
        output={}
        for a,b in PAIRS:
            suitegm={s:math.exp(st.mean(math.log(r['execution_'+a+b+'_speedup']) for r in rs)) for s,rs in suites.items()}
            output[a+b]=dict(suite_geomean=math.exp(st.mean(math.log(x) for x in suitegm.values())),by_suite=suitegm)
        aggregate[label]=dict(cases=[r['case'] for r in selected],unit_count=len(selected),suite_count=len(suites),comparisons=output)
    from aggregate_ci import intervals
    intervals(aggregate,rows,PAIRS)
    aggregate['official_Octane_score']=False;save(HERE/'analysis/aggregate.json',aggregate)
    audit=dict(status='PASS' if len(rows)==2160 and all(r['valid'] for r in rows) and not missing and not duplicates and not extra else 'INCOMPLETE',
      expected=2160,actual=len(rows),valid=sum(r['valid'] for r in rows),failed=sum(not r['valid'] for r in rows),
      missing=missing,duplicates=duplicates,unexpected=extra,six_order_counts=ordering,
      valid_complete_cases=included,below_1000ms=sum(r['valid'] and r['elapsed_ms']<1000 for r in rows),
      outliers_removed=0,boot_ids=sorted({r['boot_id'] for r in rows}),
      data_only=True,runtime_files_required=False,recorded_hashes_checked=True,current_binary_identity_checked=False)
    save(HERE/'analysis/formal_audit.json',audit)
    for metric in ['execution','e2e']:
        for a,b in PAIRS:
            prefix=metric+'_'+a+b
            plot(summaries,HERE/'analysis'/f'{prefix}.svg',prefix+'_speedup',prefix+'_CI_low',prefix+'_CI_high',f'{metric}: {a}/{b} median ratio and paired 95% CI (>1: {b} faster)')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['formal']);a=p.parse_args();globals()[a.stage]()

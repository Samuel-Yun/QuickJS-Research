"""Portable raw-only replay. Standard library; never opens recorded engine paths."""
import argparse,csv,hashlib,io,json,math,random,statistics
from collections import Counter,defaultdict
from pathlib import Path
BASE=Path(__file__).resolve().parent
CASES=['M1.own_integer','M4.numeric_control','Richards.Richards']
CONDS=['QJS_A','QJS_M','V8_ON','V8_OFF']
PAIRS=[('QJS_A','QJS_M'),('V8_OFF','V8_ON'),('QJS_A','V8_ON'),('QJS_M','V8_ON')]
def read(p):return json.loads(p.read_text(encoding='utf8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,value):
    p.parent.mkdir(parents=True,exist_ok=True)
    data=(value if isinstance(value,str) else json.dumps(value,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data,'refuse overwrite '+str(p)
    else:p.write_bytes(data)
def csvwrite(p,rows):
    if not rows:return
    b=io.StringIO();w=csv.DictWriter(b,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);write(p,b.getvalue())
def percentile(x,q):
    x=sorted(x);a=(len(x)-1)*q;i=math.floor(a);return x[i]+(x[min(i+1,len(x)-1)]-x[i])*(a-i)
def stats(x):
    x=sorted(x);half=len(x)//2
    q1=statistics.median(x[:half]) if half else x[0];q3=statistics.median(x[-half:]) if half else x[0]
    return dict(n=len(x),median=statistics.median(x),mean=statistics.mean(x),sample_sd=statistics.stdev(x) if len(x)>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=min(x),max=max(x))
def main(out):
    assert out.resolve()!=BASE
    schedule=read(BASE/'schedule.json');frozen=read(BASE/'frozen.json');manifest=read(BASE/'manifest.json');protocol=read(BASE/'protocol.json')
    errors=[];records=[];index={};positions=Counter();intervals=[];short=[]
    def check(value,message):
        if not value:errors.append(message)
    check(sha(BASE/'schedule.json')==frozen['schedule_sha256'],'schedule hash')
    for rel,h in frozen['files'].items():check(sha(BASE/rel)==h,'frozen '+rel)
    for case,f in frozen['formal_scripts'].items():check(sha(BASE/f['path'])==f['sha256'],'script '+case)
    rawfiles=sorted((BASE/'raw/formal').rglob('*.json'))
    for p in rawfiles:
        r=read(p);records.append(r);key=(r['case'],r['rep'],r['condition'])
        check(key not in index,'duplicate '+str(key));index[key]=r
        check(r['mode']==protocol['mode'] and r['cohort']==manifest['cohort'],'cohort/mode '+str(key))
        check(r['binary_sha256']==manifest['artifacts'][r['condition']]['sha256'],'binary identity '+str(key))
        check(r['command']==manifest['commands'][r['condition']]+[r['command'][-1]],'command '+str(key))
        check(r['flags']==manifest['commands'][r['condition']][1:],'flags '+str(key))
        check(r['script_sha256']==frozen['formal_scripts'][r['case']]['sha256'],'common script '+str(key))
        check(r['input_manifest_sha256']==sha(BASE/'inputs.json'),'input manifest '+str(key))
        check(r['script_relative']==frozen['formal_scripts'][r['case']]['path'],'script relative '+str(key))
        check(r['exit_code']==0 and not r['stderr'] and r['valid'],'valid '+str(key))
        if r['valid']:
            d=r['payload'];e=d['elapsed_ms']
            check(e>0 and math.isfinite(e) and d['stop_ms']-d['start_ms']==e and r['elapsed_per_Run_ms']==e/r['N'],'timer '+str(key))
            check(e<=r['outer_wall_ns']/1e6+5 and d['warmup_calls']==0 and d['correctness']=='PASS','enclosure/correctness '+str(key))
            if r['case']!=CASES[2]:check(r['checksum']==r['N']*(12288 if r['case']==CASES[0] else 8386560),'checksum '+str(key))
            if e<1000:short.append(dict(case=r['case'],condition=r['condition'],rep=r['rep'],elapsed_ms=e))
        intervals.append((r['outer_start_ns'],r['outer_stop_ns'],key))
        positions[(r['case'],r['condition'],r['order'])]+=1
    intervals.sort();check(all(a[1]<=b[0] for a,b in zip(intervals,intervals[1:])),'non-overlap')
    missing=[]
    for row in schedule:
        key=(row['case'],row['rep'],row['condition']);r=index.get(key)
        if r is None:missing.append(key);continue
        check(r['order']==row['order'] and r['N']==row['N'],'schedule position '+str(key))
    for case in CASES:
        for c in CONDS:check(sorted(positions[(case,c,i)] for i in range(4))==[7,7,8,8],'position balance '+case+c)
        for c in CONDS:
            check(sum(r['case']==case and r['condition']==c and r['valid'] for r in records)==30,'30 group '+case+c)
    check(read(BASE/'correctness_gate.json')['valid']==24,'correctness N1/N2')
    check(read(BASE/'mechanism_gate.json')['status']=='PASS','mechanism gate')
    for case in frozen['eligible']:
        s=read(BASE/'selected'/f'{case}.json');check(len(s['pilot_ms'])==12 and min(s['pilot_ms'])>=1000,'three pilots '+case)
        checks=list((BASE/'raw/selected_correctness'/case).glob('*.json'));check(len(checks)==4 and all(read(p)['valid'] for p in checks),'selected N correctness '+case)
    check((BASE/'identity_after.json').exists() and read(BASE/'identity_after.json')['status']=='PASS','post identity')
    check(not missing,'missing positions')
    groupstats=[];ratios=[];table=[];rng=random.Random(20261028)
    for case in CASES:
        complete=[rep for rep in range(30) if all((case,rep,c) in index and index[(case,rep,c)]['valid'] for c in CONDS)]
        for c in CONDS:
            rr=[r for r in records if r['case']==case and r['condition']==c and r['valid']]
            if rr:
                for metric,field,unit in [('execution','elapsed_per_Run_ms','ms/complete Run'),('end_to_end','outer_wall_ns','ms/process')]:
                    values=[r[field]/1e6 if field=='outer_wall_ns' else r[field] for r in rr]
                    groupstats.append(dict(case=case,condition=c,metric=metric,unit=unit,N=rr[0]['N'],**stats(values)))
        if not complete:continue
        arrays={c:[index[(case,rep,c)]['elapsed_per_Run_ms'] for rep in complete] for c in CONDS}
        estimates=[[] for _ in PAIRS]
        for _ in range(10000):
            ix=[rng.randrange(len(complete)) for _ in complete]
            med={c:statistics.median(arrays[c][i] for i in ix) for c in CONDS}
            for k,(a,b) in enumerate(PAIRS):estimates[k].append(med[a]/med[b])
        row=dict(case=case,N=index[(case,complete[0],CONDS[0])]['N'],complete_quadruples=len(complete))
        row.update({c+'_median_ms':statistics.median(arrays[c]) for c in CONDS})
        for k,(a,b) in enumerate(PAIRS):
            ratio=statistics.median(arrays[a])/statistics.median(arrays[b]);lo=percentile(estimates[k],.025);hi=percentile(estimates[k],.975)
            key=a+'_over_'+b
            result=dict(case=case,n_quadruples=len(complete),numerator=a,denominator=b,ratio=ratio,CI95_low=lo,CI95_high=hi,denominator_time_change_pct=(1/ratio-1)*100,change_CI95_low=(1/hi-1)*100,change_CI95_high=(1/lo-1)*100,direction='unclear' if lo<=1<=hi else 'denominator_faster' if lo>1 else 'denominator_slower')
            ratios.append(result)
            for field in ['ratio','CI95_low','CI95_high','denominator_time_change_pct','direction']:row[key+'_'+field]=result[field]
        table.append(row)
    csvwrite(out/'statistics.csv',groupstats);csvwrite(out/'ratios.csv',ratios);csvwrite(out/'summary.csv',table)
    csvwrite(out/'short_samples.csv',short)
    csvwrite(out/'positions.csv',[dict(case=case,condition=c,position=i,count=positions[(case,c,i)]) for case in CASES for c in CONDS for i in range(4)])
    csvwrite(out/'raw_index.csv',[dict(case=r['case'],condition=r['condition'],rep=r['rep'],N=r['N'],order=r['order'],elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],outer_wall_ms=r['outer_wall_ns']/1e6,valid=r['valid'],exit_code=r['exit_code'],timestamp=r['timestamp'],binary_sha256=r['binary_sha256'],script_sha256=r['script_sha256']) for r in records])
    audit=dict(status='PASS' if not errors else 'INCOMPLETE_OR_FAILED',expected=360,actual=len(records),valid=sum(r['valid'] for r in records),errors=errors,missing=missing,short_samples_retained=len(short),quadruple_bootstrap_samples=10000,seed=20261028,quantiles='Tukey exclusive halves; linear percentile bootstrap',runtime_paths_opened=False,formal_raw_sha256={str(p.relative_to(BASE)):sha(p) for p in rawfiles})
    write(out/'audit.json',audit);print(json.dumps({k:v for k,v in audit.items() if k!='formal_raw_sha256'},ensure_ascii=False,indent=2))
    return audit
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--output',type=Path,required=True);args=ap.parse_args();main(args.output)

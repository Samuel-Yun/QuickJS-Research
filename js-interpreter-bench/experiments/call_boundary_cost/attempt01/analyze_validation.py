"""Portable perturbation analysis, no ELF access; whole-nine-process bootstrap."""
import argparse,csv,hashlib,io,json,math,random,statistics
from pathlib import Path
from collections import Counter
P=Path(__file__).resolve().parent;CASES=['local_function_call','number_value_read','Richards.Richards'];CONDS=['BASE','SHIM_OFF','SHIM_ON']
def read(p):return json.loads(p.read_text(encoding='utf8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,x):
    b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode();p.parent.mkdir(parents=True,exist_ok=True)
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def csvwrite(p,rr):
    if not rr:return
    s=io.StringIO();w=csv.DictWriter(s,list(rr[0]),lineterminator='\n');w.writeheader();w.writerows(rr);write(p,s.getvalue())
def percentile(x,p):
    x=sorted(x);t=(len(x)-1)*p;i=int(t);return x[i]+(x[min(i+1,len(x)-1)]-x[i])*(t-i)
def desc(x):
    x=sorted(x);half=len(x)//2;q1=statistics.median(x[:half]) if half else x[0];q3=statistics.median(x[-half:]) if half else x[0]
    return dict(n=len(x),median=statistics.median(x),Q1=q1,Q3=q3,mean=statistics.mean(x),sample_stddev=statistics.stdev(x) if len(x)>1 else None,IQR=q3-q1,min=min(x),max=max(x))
def main(period,out):
    label='validation_p'+str(period);sched=read(P/f'schedule_p{period}.json');frozen=read(P/f'frozen_p{period}.json');manifest=read(P/'manifest.json');records=[read(p) for p in sorted((P/'raw'/label).rglob('*.json'))];errors=[]
    def check(x,s):
        if not x:errors.append(s)
    for rel,h in frozen['files'].items():check(sha(P/rel)==h,'frozen '+rel)
    idx={}
    for r in records:
        key=(r['rep'],r['case'],r['condition']);check(key not in idx,'duplicate '+str(key));idx[key]=r
        check(r['binary_sha256']==manifest['artifacts'][r['condition']]['sha256'],'binary '+str(key));check(r['script_sha256']==frozen['script_hashes'][r['case']+'.'+r['condition']],'script '+str(key))
        check(sha(P/r['script_relative'])==r['script_sha256'],'script content '+str(key));check(r['period_us']==period,'period')
        if r['valid']:
            d=r['payload'];check(r['elapsed_ms']==d['stop_ms']-d['start_ms']>0 and r['elapsed_ms']<=r['outer_wall_ns']/1e6+5,'timer '+str(key));check(r['exit_code']==0 and r['stderr']=='' and d['correctness']=='PASS' and d['warmup_calls']==0,'result '+str(key))
    missing=[s for s in sched if (s['rep'],s['case'],s['condition']) not in idx]
    for case in CASES:
        orders=Counter(tuple(s['condition'] for s in sched if s['rep']==rep and s['case']==case) for rep in range(12));check(len(orders)==6 and set(orders.values())=={2},'six permutations x2 '+case)
        for c in CONDS:
            actual_pos=Counter(r['order'] for r in records if r['case']==case and r['condition']==c)
            observed_plan=Counter(s['order'] for s in sched if s['case']==case and s['condition']==c and (s['rep'],s['case'],s['condition']) in idx)
            check(actual_pos==observed_plan,'positions of observed positions '+case+c)
        check(Counter(s['case_order'] for s in sched if s['case']==case and s['order']==0)=={0:4,1:4,2:4},'case positions '+case)
    ordered=sorted(records,key=lambda r:r['outer_start_ns']);check(all(a['outer_stop_ns']<b['outer_start_ns'] for a,b in zip(ordered,ordered[1:])),'serial');check(len({r['boot_id'] for r in records})==1,'single validation boot')
    complete=[rep for rep in range(12) if all((rep,k,c) in idx and idx[(rep,k,c)]['valid'] for k in CASES for c in CONDS)]
    summ=[]
    for case in CASES:
        for c in CONDS:
            rr=[r for r in records if r['case']==case and r['condition']==c and r['valid']]
            if not rr:continue
            for metric,key,unit in [('internal','elapsed_ms','ms/window'),('per_Run','elapsed_per_Run_ms','ms/complete Run'),('end_to_end','outer_wall_ns','ms/process'),('CPU_user','child_user_seconds','s/process'),('CPU_system','child_system_seconds','s/process')]:summ.append(dict(case=case,condition=c,N=rr[0]['N'],metric=metric,unit=unit,**desc([r[key]/1e6 if key=='outer_wall_ns' else r[key] for r in rr])))
    pairs=[(k,a,b) for k in CASES for a,b in [('SHIM_OFF','BASE'),('SHIM_ON','SHIM_OFF')]];ratios=[]
    if complete:
        arrays={(k,c):[idx[(rep,k,c)]['elapsed_ms'] for rep in complete] for k in CASES for c in CONDS};rng=random.Random(20261029);samples=[[] for _ in pairs]
        for _ in range(10000):
            ix=[rng.randrange(len(complete)) for _ in complete];med={k:statistics.median(v[i] for i in ix) for k,v in arrays.items()}
            for i,(k,a,b) in enumerate(pairs):samples[i].append(med[(k,a)]/med[(k,b)])
        for i,(k,a,b) in enumerate(pairs):
            point=statistics.median(arrays[(k,a)])/statistics.median(arrays[(k,b)]);lo=percentile(samples[i],.025);hi=percentile(samples[i],.975);limit,upper=(1.05,1.10) if b=='BASE' else (1.03,1.05)
            ratios.append(dict(case=k,numerator=a,denominator=b,ratio=point,CI95_low=lo,CI95_high=hi,engineering_point_limit=limit,engineering_CI_high_limit=upper,accepted=point<=limit and hi<=upper,complete9_rounds=len(complete)))
    complete_batch=len(records)==108 and all(r['valid'] for r in records) and not errors and not missing
    explicit_interruption=(P/'recovery_protocol.json').exists() and period==7000 and len(records)==107 and len(missing)==1 and len(complete)==11
    good=complete_batch or (explicit_interruption and not errors and all(r['valid'] for r in records))
    csvwrite(out/'summary.csv',summ);csvwrite(out/'ratios.csv',ratios);csvwrite(out/'short_samples.csv',[dict(case=r['case'],condition=r['condition'],rep=r['rep'],elapsed_ms=r['elapsed_ms']) for r in records if r['valid'] and r['elapsed_ms']<3000])
    write(out/'audit.json',dict(status='PASS' if complete_batch else 'INCOMPLETE_RETAINED_11_COMPLETE_ROUNDS' if good else 'INCOMPLETE_OR_FAILED',engineering_ratios_computable=good,target=108,actual=len(records),valid=sum(r['valid'] for r in records),errors=errors,missing=missing,complete_rounds=complete,bootstrap_iterations=10000,seed=20261029,raw_only=True,short_samples_retained=sum(r['valid'] and r['elapsed_ms']<3000 for r in records)))
    selected=read(P/f'selected_p{period}.json');gate={}
    for k in CASES:
        rel=next((r for r in ratios if r['case']==k and r['denominator']=='BASE'),None);samp=next((r for r in ratios if r['case']==k and r['denominator']=='SHIM_OFF'),None)
        gate[k]=dict(N=selected[k]['N'],relink=rel,sampling=samp,accepted=bool(good and rel and samp and rel['accepted'] and samp['accepted']))
    gateobj=dict(status='ALL_ACCEPTED' if all(x['accepted'] for x in gate.values()) else 'PARTIAL_OR_FAILED',accepted_period_us=period,cases=gate,policy='pre-fixed engineering thresholds, not proof of zero perturbation; no long window for failed workload')
    write(out/'perturbation_gate.json',gateobj);print(json.dumps(gateobj,indent=2))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--period-us',type=int,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args();main(a.period_us,a.output)

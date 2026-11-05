"""Portable raw-only statistics. Does NOT import common/resource or execute runtimes.
Usage: python analyze.py --output summary (new directory, never overwrite).
"""
import argparse,csv,hashlib,json,math,random,statistics as st
from pathlib import Path
HERE=Path(__file__).resolve().parent
CS=['A','E','V8_ON'];SEED=20261031;B=10000
def read(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def quantile(xs,p):
    a=sorted(xs);k=(len(a)-1)*p;i=int(k);return a[i]+(a[min(i+1,len(a)-1)]-a[i])*(k-i)
def desc(xs):
    s=sorted(xs);n=len(s);half=n//2
    q1=st.median(s[:half]) if half else s[0];q3=st.median(s[(n+1)//2:]) if half else s[-1]
    return dict(n=n,median=st.median(s),mean=st.mean(s),sample_stddev=st.stdev(s) if n>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=s[0],max=s[-1])
def csvout(p,rows):
    if not rows:return
    with p.open('x',encoding='utf-8',newline='') as f:w=csv.DictWriter(f,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)
def dump(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def gm(ratios,cases):
    suites={}
    for k,v in zip(cases,ratios):suites.setdefault(k.split('.')[0],[]).append(math.log(v))
    return math.exp(st.mean(st.mean(a) for a in suites.values()))
def ratio_triplet(m):return [m[1]/m[0],m[1]/m[2],m[0]/m[2]]
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--output',default='summary');args=parser.parse_args();out=HERE/args.output;out.mkdir(parents=True,exist_ok=False)
    protocol=read(HERE/'protocol.json');cases=protocol['core16']+['zlib.zlib'];schedule=read(HERE/'schedule.json');runtime=read(HERE/'campaign_runtime.json')
    raw=[(p,read(p)) for p in sorted((HERE/'raw/formal').rglob('*.json'))]
    by={};dups=[];fail=[];samples=[]
    for p,r in raw:
        key=(r['case'],r['rep'],r['condition'])
        if key in by:dups.append(key)
        by[key]=r
        if not r['valid']:fail.append(dict(path=p.relative_to(HERE).as_posix(),reason=r['failed_reason']))
        samples.append({k:r.get(k) for k in ['case','condition','N','rep','order','schedule_index','elapsed_ms','elapsed_per_Run_ms','external_wall_ms','child_user_ms','child_system_ms','valid','exit_code','timestamp','binary_sha256','script_sha256']})
    csvout(out/'samples.csv',samples)
    statistics=[];comparison=[];ratios=[];arrays={};reps={}
    for case_index,case in enumerate(cases):
        values={c:[r['elapsed_per_Run_ms'] for (k,rep,cond),r in by.items() if k==case and cond==c and r['valid'] and r['elapsed_per_Run_ms']>0] for c in CS}
        row=dict(case=case,N=None)
        for c in CS:
            good=[r for (k,rep,cond),r in by.items() if k==case and cond==c and r['valid']]
            for r in good:r['derived_child_cpu_ms']=r['child_user_ms']+r['child_system_ms']
            row[c+'_n']=len(values[c]);row[c+'_median_ms']=st.median(values[c]) if values[c] else None
            if good:row['N']=good[0]['N']
            for metric,field in [('internal_ms_per_Run','elapsed_per_Run_ms'),('external_ms_per_process','external_wall_ms'),('child_user_ms_per_process','child_user_ms'),('child_system_ms_per_process','child_system_ms'),('child_cpu_ms_per_process','derived_child_cpu_ms')]:
                xs=[r[field] for r in good if r.get(field) is not None]
                if xs:statistics.append(dict(case=case,condition=c,metric=metric,**desc(xs)))
        complete=[rep for rep in range(30) if all((case,rep,c) in by and by[(case,rep,c)]['valid'] and by[(case,rep,c)]['elapsed_per_Run_ms']>0 for c in CS)]
        reps[case]=complete;row['complete_triples']=len(complete);row['status']='COMPLETE' if len(complete)==30 and all(len(values[c])==30 for c in CS) else 'INCOMPLETE'
        comparison.append(row)
        if not complete:continue
        a=[[by[(case,r,c)]['elapsed_per_Run_ms'] for c in CS] for r in complete];arrays[case]=dict(zip(complete,a))
        med=[st.median([v[i] for v in a]) for i in range(3)];points=ratio_triplet(med)
        rng=random.Random(SEED);boots=[[],[],[]]
        for _ in range(B):
            sample=[a[rng.randrange(len(a))] for j in a];m=[st.median([v[i] for v in sample]) for i in range(3)]
            for xs,value in zip(boots,ratio_triplet(m)):xs.append(value)
        for label,point,xs in zip(['E/A','E/V8_ON','A/V8_ON'],points,boots):
            lo,hi=quantile(xs,.025),quantile(xs,.975)
            ratios.append(dict(case=case,ratio=label,point=point,CI95_low=lo,CI95_high=hi,time_change_percent=100*(point-1),paired_triples=len(complete),direction='numerator_faster' if hi<1 else 'numerator_slower' if lo>1 else 'unclear'))
    csvout(out/'statistics.csv',statistics);csvout(out/'comparison.csv',comparison);csvout(out/'ratios.csv',ratios)
    aggregates=[]
    for label,subset in [('core16_13suite',protocol['core16']),('expanded17_14suite',cases)]:
        common=sorted(set.intersection(*(set(reps[k]) for k in subset)))
        primary=len(common)==30 and all(next(r for r in comparison if r['case']==k)['status']=='COMPLETE' for k in subset)
        if not common:
            aggregates.append(dict(set=label,status='UNAVAILABLE',common_reps=common,cases=subset));continue
        points={};matrix={}
        for k in subset:
            matrix[k]=[arrays[k][rep] for rep in common];m=[st.median([a[i] for a in matrix[k]]) for i in range(3)];points[k]=ratio_triplet(m)
        rng=random.Random(SEED);boots=[[],[],[]]
        for _ in range(B):
            idx=[rng.randrange(len(common)) for rep in common];per=[]
            for k in subset:
                sample=[matrix[k][i] for i in idx];m=[st.median([a[j] for a in sample]) for j in range(3)];per.append(ratio_triplet(m))
            for j in range(3):boots[j].append(gm([p[j] for p in per],subset))
        for j,ratio in enumerate(['E/A','E/V8_ON','A/V8_ON']):
            point=gm([points[k][j] for k in subset],subset)
            aggregates.append(dict(set=label,status='COMPLETE_PRIMARY' if primary else 'POST_INTERRUPTION_EXPLORATORY_COMMON_ROUNDS',ratio=ratio,point=point,CI95_low=quantile(boots[j],.025),CI95_high=quantile(boots[j],.975),common_reps=common,cases=subset))
    dump(out/'aggregate.json',aggregates)
    csvout(out/'aggregate.csv',[{k:r.get(k) for k in ['set','status','ratio','point','CI95_low','CI95_high']}|dict(common_rounds=len(r['common_reps'])) for r in aggregates])
    missing=[r for r in schedule if (r['case'],r['rep'],r['condition']) not in by];dump(out/'missing.json',missing);dump(out/'failures.json',fail)
    identity=all(r['binary_sha256']==runtime['artifacts'][r['condition']]['sha256'] and r['boot_id']==r['boot_id_after']==runtime['boot_id'] for p,r in raw)
    hash_ok=all(hashlib.sha256((HERE/r['script_relative']).read_bytes()).hexdigest()==r['script_sha256'] for p,r in raw)
    expected={(r['case'],r['rep'],r['condition']):r for r in schedule}
    order_ok=all(r['order']==expected[(r['case'],r['rep'],r['condition'])]['order'] and r['schedule_index']==expected[(r['case'],r['rep'],r['condition'])]['index'] for p,r in raw)
    six=[]
    for case in cases:
        counts={','.join(p):0 for p in __import__('itertools').permutations(CS)}
        for rep in reps[case]:counts[','.join(by[(case,rep,c)]['condition'] for c in sorted(CS,key=lambda c:by[(case,rep,c)]['order']))]+=1
        six.append(dict(case=case,complete_triples=len(reps[case]),counts=counts,each5=all(v==5 for v in counts.values())))
    audit=dict(status='COMPLETE' if len(raw)==1530 and not fail and not missing and not dups and identity and hash_ok and order_ok and all(x['each5'] for x in six) else 'PARTIAL_OR_FAILED',expected=1530,actual=len(raw),valid=sum(r['valid'] for p,r in raw),duplicates=dups,failures=len(fail),missing=len(missing),identity_and_boot=identity,script_hash=hash_ok,schedule_positions=order_ok,actual_permutations=six,below_pilot_threshold_retained=sum(r['valid'] and r['elapsed_ms']<1000 for p,r in raw),full_n30=all(all(r[c+'_n']==30 for c in CS) for r in comparison),bootstrap=B,seed=SEED,intervals='exploratory unadjusted percentile, no equivalence claim',not_official_score=True,analysis_raw_only=True)
    dump(out/'audit.json',audit)
    header='|Run|A ms|E ms|V8_ON ms|n A/E/V8|\n|---|---:|---:|---:|---|\n'
    for r in comparison:
        fmt=lambda x:'UNKNOWN' if x is None else f'{x:.6f}'
        header+='|'+r['case']+'|'+'|'.join(fmt(r[c+'_median_ms']) for c in CS)+'|'+'/'.join(str(r[c+'_n']) for c in CS)+'|\n'
    (out/'comparison.md').write_text(header,encoding='utf-8')
    print(json.dumps(audit,ensure_ascii=False,indent=2))
if __name__=='__main__':main()

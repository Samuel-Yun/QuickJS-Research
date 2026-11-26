"""Portable raw-only paired statistics. Does not import common, VM or private code."""
import argparse,csv,hashlib,html,io,json,math,random,statistics
from pathlib import Path
from collections import defaultdict,Counter
HERE=Path(__file__).resolve().parent
SEED=20261104
B=10000
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def save(p,x):
    p.parent.mkdir(parents=True,exist_ok=True);b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    with p.open('xb') as f:f.write(b)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def csvout(p,rows):
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def percentile(xs,q):
    s=sorted(xs);i=(len(s)-1)*q;k=int(i);return s[k]+(s[min(k+1,len(s)-1)]-s[k])*(i-k)
def summary(xs):
    s=sorted(xs);n=len(s);q1=statistics.median(s[:n//2]) if n>1 else s[0];q3=statistics.median(s[(n+1)//2:]) if n>1 else s[0]
    return dict(n=n,median=statistics.median(s),mean=statistics.mean(s),sample_stddev=statistics.stdev(s) if n>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=s[0],max=s[-1])
def main():
    p=argparse.ArgumentParser();p.add_argument('campaign');p.add_argument('--output',default='analysis');a=p.parse_args();root=HERE/a.campaign;out=root/a.output
    assert not out.exists(),'use a new output directory'
    protocol=load(root/'protocol.json');cs=protocol['conditions'];cases=protocol['cases'];files=sorted((root/'raw/formal').rglob('*.json'))
    hashes={str(f.relative_to(HERE)):sha(f) for f in files};raw=[load(f) for f in files];group=defaultdict(dict);errors=[];seen=set();positions=defaultdict(Counter)
    for r in raw:
        key=(r['case'],r['condition'],r['rep']);positions[key[:2]][r['order']]+=1
        if key in seen:errors.append('duplicate '+str(key))
        seen.add(key)
        if r['valid'] and r['elapsed_per_Run_ms']>0:group[key[:2]][r['rep']]=r
        else:errors.append('invalid '+str(key))
    pairs=[('M','A'),('A','M')]
    if 'OPT' in cs:pairs+=[('OPT','M'),('OPT','A'),('A','OPT')]
    if 'V8_ON' in cs:pairs += [(c,'V8_ON') for c in cs if c!='V8_ON']
    if 'C_ON' in cs:pairs += [('C_OFF','C_ON'),('C_ON','M'),('C_OFF','M')]
    stat=[];tables=[];ratios=[];boot_cache={};common={}
    for case in cases:
        row=dict(case=case,N=None)
        common[case]=sorted(set.intersection(*[set(group[(case,c)]) for c in cs]))
        for c in cs:
            rr=group[(case,c)];row[c+'_n']=len(rr)
            if rr:
                row['N']=next(iter(rr.values()))['N'];ss=summary([x['elapsed_per_Run_ms'] for x in rr.values()]);stat.append(dict(case=case,condition=c,unit='ms/complete Run',**ss));row[c+'_median_ms']=ss['median']
            else:row[c+'_median_ms']=None
        row['complete_paired_rounds']=len(common[case]);tables.append(row)
    def bs(case,reps):
        key=(case,tuple(reps))
        if key in boot_cache:return boot_cache[key]
        rng=random.Random(SEED);arr={c:[] for c in cs};vals={c:{i:group[(case,c)][i]['elapsed_per_Run_ms'] for i in reps} for c in cs}
        for k in range(B):
            indices=rng.choices(reps,k=len(reps))
            for c in cs:arr[c].append(statistics.median(vals[c][i] for i in indices))
        boot_cache[key]=arr;return arr
    for case in cases:
        reps=common[case]
        if not reps:continue
        arr=bs(case,reps)
        for nc,dc in pairs:
            point=statistics.median(group[(case,nc)][i]['elapsed_per_Run_ms'] for i in reps)/statistics.median(group[(case,dc)][i]['elapsed_per_Run_ms'] for i in reps)
            draws=[n/d for n,d in zip(arr[nc],arr[dc])];lo=percentile(draws,.025);hi=percentile(draws,.975)
            ratios.append(dict(case=case,ratio=nc+'/'+dc,point=point,CI95_low=lo,CI95_high=hi,time_change_pct=100*(point-1),paired_rounds=len(reps),direction='numerator_faster' if hi<1 else 'numerator_slower' if lo>1 else 'unclear'))
    sets={'core16_13suite':[c for c in cases if c!='zlib.zlib'],'expanded17_14suite':cases} if a.campaign=='octane' else {'all26_case_equal':cases} if a.campaign=='sunspider' else {}
    aggregate=[]
    for name,subset in sets.items():
        reps=sorted(set.intersection(*[set(common[c]) for c in subset]));suites=defaultdict(list)
        for c in subset:suites[c.split('.')[0] if a.campaign=='octane' else c].append(c)
        if not reps:continue
        calc=lambda vals:math.exp(statistics.mean(statistics.mean(math.log(vals[c]) for c in cc) for cc in suites.values()))
        for nc,dc in pairs:
            point=calc({c:statistics.median(group[(c,nc)][i]['elapsed_per_Run_ms'] for i in reps)/statistics.median(group[(c,dc)][i]['elapsed_per_Run_ms'] for i in reps) for c in subset})
            arrs={c:bs(c,reps) for c in subset};draws=[calc({c:arrs[c][nc][i]/arrs[c][dc][i] for c in subset}) for i in range(B)]
            aggregate.append(dict(set=name,ratio=nc+'/'+dc,point=point,CI95_low=percentile(draws,.025),CI95_high=percentile(draws,.975),case_count=len(subset),suite_count=len(suites),paired_rounds=len(reps),included_cases=subset))
    expected=len(cases)*len(cs)*30
    if len(raw)!=expected:errors.append(f'count {len(raw)}/{expected}')
    for case in cases:
        for c in cs:
            if len(group[(case,c)])!=30:errors.append('group count '+case+' '+c)
            cnt=[positions[(case,c)][i] for i in range(len(cs))]
            if max(cnt)-min(cnt)>1:errors.append('position imbalance '+case+' '+c)
    ordered=sorted(raw,key=lambda x:x['outer_start_ns']);boots={r['boot_id'] for r in raw}
    if len(boots)>1:errors.append('multiple boots')
    if any(x['outer_stop_ns']>y['outer_start_ns'] for x,y in zip(ordered,ordered[1:])):errors.append('overlap')
    schedule=load(root/'schedule.json')
    if {(x['case'],x['condition'],x['rep'],x['order']) for x in raw}!={(x['case'],x['condition'],x['rep'],x['order']) for x in schedule}:errors.append('schedule mismatch')
    frozen=load(root/'frozen.json')
    for r in raw:
        if r['binary_sha256']!=frozen['artifacts'][r['condition']]['sha256']:errors.append('binary mismatch')
        if r['script_sha256']!=frozen['script_hashes'][r['case']]:errors.append('script mismatch')
        if r['condition']=='V8_ON' and r['flags']!=['--jitless','--no-lazy','--use-ic']:errors.append('flags mismatch')
    csvout(out/'statistics.csv',stat);csvout(out/'comparison.csv',tables);csvout(out/'ratios.csv',ratios)
    if aggregate:save(out/'aggregate.json',aggregate)
    aux=[]
    for case in cases:
        for c in cs:
            for metric in ['external_wall_ms','child_user_ms','child_system_ms']:
                vals=[r[metric] for r in group[(case,c)].values()]
                if vals:aux.append(dict(case=case,condition=c,metric=metric,unit='ms/whole fresh process',**summary(vals)))
    csvout(out/'whole_process.csv',aux)
    md=['# '+a.campaign,'',f'有效/实际/目标：{sum(r["valid"] for r in raw)}/{len(raw)}/{expected}；内部单位 ms/完整 Run。',
      '首次 Run 计入，无额外 workload 预跑；所有偏短和异常值保留。区间探索性，未校正多重比较。','',
      '|case|repetitions|'+'|'.join(cs)+'|','|---|---:|'+'|'.join('---:' for c in cs)+'|']
    for r in tables:md.append('|'+r['case']+'|'+str(r['N'])+'|'+'|'.join('MISSING' if r[c+'_median_ms'] is None else f'{r[c+"_median_ms"]:.6f}' for c in cs)+'|')
    md+=['','|case|ratio|point|95% CI|','|---|---|---:|---|']
    for r in ratios:md.append(f'|{r["case"]}|{r["ratio"]}|{r["point"]:.6f}|[{r["CI95_low"]:.6f}, {r["CI95_high"]:.6f}]|')
    save(out/'results.md','\n'.join(md)+'\n');save(out/'raw_hashes.json',hashes)
    assert hashes=={str(f.relative_to(HERE)):sha(f) for f in files}
    save(out/'audit.json',dict(status='PASS_COMPLETE' if not errors else 'INCOMPLETE_OR_FAILED',errors=errors,actual=len(raw),expected=expected,valid=sum(r['valid'] for r in raw),
      short_samples=sum(r['elapsed_ms']<1000 for r in raw if r['valid']),bootstrap=B,seed=SEED,one_boot=len(boots)==1,raw_only=True,private_source_required=False))
    print(a.campaign,len(raw),'/',expected,'errors',errors)
if __name__=='__main__':main()

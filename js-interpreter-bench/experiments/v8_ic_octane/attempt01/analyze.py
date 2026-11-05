"""Raw-only 16-row report and paired-triple bootstrap, no runtime access."""
import argparse,collections,itertools,random,statistics
from common import *
BOOTSTRAPS=10000
def quartiles(v):
    x=sorted(v);n=len(x)
    return (statistics.median(x[:n//2]),statistics.median(x[(n+1)//2:])) if n>1 else (x[0],x[0])
def stats(v):
    q1,q3=quartiles(v)
    return dict(n=len(v),median=statistics.median(v),mean=statistics.mean(v),sample_stddev=statistics.stdev(v) if len(v)>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=min(v),max=max(v))
def percentile(v,p):
    x=sorted(v);at=(len(x)-1)*p;i=int(at);j=min(i+1,len(x)-1);return x[i]+(x[j]-x[i])*(at-i)
def bootstrap(triples,rng):
    values=[[],[],[]];n=len(triples)
    for _ in range(BOOTSTRAPS):
        sample=[triples[rng.randrange(n)] for _ in range(n)]
        q,on,off=[statistics.median(t[j] for t in sample) for j in range(3)]
        for dest,value in zip(values,[off/on,q/on,q/off]):dest.append(value)
    return [(percentile(v,.025),percentile(v,.975)) for v in values]
def records(stage):return sorted((read(p) for p in (HERE/'raw'/stage).rglob('*.json')),key=lambda r:(CASES.index(r['case']),int(r['rep']),int(r['order']),CONDITIONS.index(r['condition']),int(r['N'])))
def fmt(value):return '—' if value is None else f'{value:.6g}' if isinstance(value,float) else str(value)
def main(output=None):
    out=Path(output) if output else HERE/'summary';assert not out.exists(),'new output directory required'
    m=read(HERE/'runtime.json');gate=read(HERE/'gate.json');assert gate['status']=='PASS_WITH_OBSERVABILITY_LIMITATION' and gate['selected_OFF_no_cache_state_verified'] is None
    frozen=read(HERE/'frozen.json') if (HERE/'frozen.json').exists() else None
    if frozen:
        for p,h in frozen['files'].items():assert sha(HERE/p)==h,p
    schedule=read(HERE/'schedule.json') if (HERE/'schedule.json').exists() else []
    if schedule:
        assert len(schedule)==len(CASES)*len(CONDITIONS)*30==1440
        assert [s['index'] for s in schedule]==list(range(1440))
        for case in CASES:
            permutations=collections.Counter(tuple(s['condition'] for s in sorted([s for s in schedule if s['case']==case and s['rep']==rep],key=lambda s:s['order'])) for rep in range(30))
            assert permutations=={p:5 for p in itertools.permutations(CONDITIONS)}
            assert collections.Counter((s['condition'],s['order']) for s in schedule if s['case']==case)=={(c,p):10 for c in CONDITIONS for p in range(3)}
    planned={(s['case'],s['condition'],s['rep']):s for s in schedule};raw=records('formal');unique={};flat=[];hashes={}
    for r in raw:
        key=(r['case'],r['condition'],r['rep']);assert key not in unique,'duplicate position';unique[key]=r
        s=planned[key];assert all(r[k]==s[k] for k in ['case','condition','N','rep','order']) and r['schedule_index']==s['index']
        expected=frozen['formal_scripts'][r['case']];assert r['script_relative']==expected['path']
        path=HERE/r['script_relative']
        if str(path) not in hashes:hashes[str(path)]=sha(path)
        assert r['script_sha256']==hashes[str(path)]==expected['sha256']
        assert r['command'][:-1]==prefixes()[r['condition']] and r['command'][-1].replace('\\','/').endswith('/'+r['script_relative'])
        assert r['flags']==prefixes()[r['condition']][1:]
        assert not any(t in ' '.join(r['flags']) for t in ['trace-','log-','print-','allow-natives','max-opt'])
        artifact=m['quickjs']['binary'] if r['condition']==CONDITIONS[0] else m['v8']['binary'];assert r['binary_sha256']==artifact['sha256']
        assert r['data_dependencies']==(m['v8']['dependencies'] if r['condition']!=CONDITIONS[0] else [])
        assert r['input_manifest_sha256']==sha(HERE/'inputs.json') and r['environment_sha256']==sha(HERE/'environment.json')
        if r['valid']:
            p=r['payload'];e=p['elapsed_ms'];assert e>0 and math.isfinite(e) and p['stop_ms']-p['start_ms']==e and r['elapsed_per_Run_ms']==e/r['N']
            assert r['exit_code']==0 and not r['stderr'] and p['correctness']=='PASS' and p['warmup_calls']==0 and e<=r['outer_wall_ns']/1e6+5
            if r['case'].startswith('Crypto.'):
                check=read(HERE/'crypto'/f'{r["case"]}.N{r["N"]}.json');assert check['status']=='PASS_BOUNDED_INPUT_IDENTITY' and p['checksum']==check['final_ciphertext']
        flat.append(dict(case=r['case'],condition=r['condition'],input_protocol=r['input_protocol'],seed=r['seed'],N=r['N'],rep=r['rep'],order=r['order'],schedule_index=r['schedule_index'],valid=r['valid'],elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],outer_wall_ms=r.get('outer_wall_ns',0)/1e6 if 'outer_wall_ns' in r else None,exit_code=r['exit_code'],failed_reason=r['failed_reason'],checksum=r['checksum'],binary_sha256=r['binary_sha256'],script_sha256=r['script_sha256'],timestamp=r['timestamp'],command=json.dumps(r['command']),stdout=r['stdout'],stderr=r['stderr']))
    acquisition=sorted([r for r in raw if 'outer_start_ns' in r],key=lambda r:r['schedule_index'])
    if acquisition:
        assert len({r['boot_id'] for r in acquisition})==1
        assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(acquisition,acquisition[1:]))
    conditions=[];walls=[];comparison=[];ratio_rows=[];coverage=[];rng=random.Random(SEED)
    for case in CASES:
        selected=HERE/'selected'/f'{case}.json';n=read(selected)['N'] if selected.exists() else None;failure=blocked(case)
        rows=[r for r in raw if r['case']==case];valid=[r for r in rows if r['valid']];medians={};counts={}
        for c in CONDITIONS:
            rr=[r for r in valid if r['condition']==c];counts[c]=len(rr)
            if rr:
                st=stats([r['elapsed_per_Run_ms'] for r in rr]);medians[c]=st['median'];conditions.append(dict(case=case,condition=c,N=n,unit='ms/original complete Run',**st))
                walls.append(dict(case=case,condition=c,N=n,unit='ms/new process; diagnostic',**stats([r['outer_wall_ns']/1e6 for r in rr])))
        complete_reps=[rep for rep in range(30) if all((case,c,rep) in unique and unique[(case,c,rep)]['valid'] for c in CONDITIONS)]
        full=all(counts[c]==30 for c in CONDITIONS) and len(complete_reps)==30 and not failure
        status='COMPLETE' if full else failure['status'] if failure else 'PARTIAL_PENDING_POSITIONS'
        reason='' if full else failure['reason'] if failure else 'formal positions not yet executed'
        input_mode='BENCH_ONLY_XORSHIFT32_PRELOAD_V1 seed305419896' if case.startswith('Crypto.') else 'FROZEN_ORIGINAL_STRICT'
        result=dict(case=case,status=status,input_mode=input_mode,N=n,QJS_median_ms=medians.get(CONDITIONS[0]),V8_ON_median_ms=medians.get(CONDITIONS[1]),V8_OFF_median_ms=medians.get(CONDITIONS[2]),OFF_ON=None,OFF_change_percent=None,QJS_ON=None,QJS_OFF=None,QJS_valid_n=counts[CONDITIONS[0]],ON_valid_n=counts[CONDITIONS[1]],OFF_valid_n=counts[CONDITIONS[2]],complete_triples=len(complete_reps),reason=reason)
        if full:
            triples=[[unique[(case,c,rep)]['elapsed_per_Run_ms'] for c in CONDITIONS] for rep in complete_reps]
            q,on,off=[medians[c] for c in CONDITIONS];estimates=[off/on,q/on,q/off];intervals=bootstrap(triples,rng)
            result.update(OFF_ON=off/on,OFF_change_percent=(off/on-1)*100,QJS_ON=q/on,QJS_OFF=q/off)
            for label,value,(low,high) in zip(['OFF/ON','QJS/ON','QJS/OFF'],estimates,intervals):ratio_rows.append(dict(case=case,input_mode=input_mode,ratio=label,point_estimate=value,CI95_low=low,CI95_high=high,bootstrap_replicates=10000,seed=SEED,complete_triples=30,direction='unclear' if low<=1<=high else 'greater than 1' if low>1 else 'less than 1',OFF_change_percent=(value-1)*100 if label=='OFF/ON' else None))
        comparison.append(result);coverage.append(dict(case=case,status=status,included=full,N=n,actual_records=len(rows),valid_records=len(valid),expected_records=90,input_mode=input_mode,reason=reason))
    coverage += [dict(case=case,status='NOT_INCLUDED_EXISTING_BOUNDARY',included=False,N=None,actual_records=0,valid_records=0,expected_records=0,input_mode='not measured',reason=reason) for case,reason in [('Box2D.Box2D','no trusted existing correctness gate; no new compatibility development'),('zlib.zlib','QuickJS read() absent in existing coverage; no new shim'),('Splay.latency','official latency/adaptive metric outside this Run timing mode'),('Mandreel.latency','official latency/adaptive metric outside this Run timing mode')]]
    checks=records('correctness');selectedchecks=records('selected_correctness');pilots=records('pilot')
    complete_cases=[r['case'] for r in comparison if r['status']=='COMPLETE']
    for case in complete_cases:
        n=read(HERE/'selected'/f'{case}.json')['N'];pp=[r for r in pilots if r['case']==case and r['N']==n]
        assert len(pp)==9 and all(r['valid'] and r['elapsed_ms']>=1000 for r in pp)
    valid_count=sum(r['valid'] for r in raw);full=len(complete_cases)==16 and len(raw)==valid_count==1440
    audit=dict(status='COMPLETE' if full else 'PARTIAL_WITH_LIMITATIONS',formal_expected=1440,formal_actual=len(raw),formal_valid=valid_count,formal_failed=len(raw)-valid_count,formal_unexecuted=1440-len(raw),complete_cases=complete_cases,case_count=16,duplicate_positions=0,correctness_expected=96,correctness_actual=len(checks),correctness_valid=sum(r['valid'] for r in checks),selected_correctness_expected=48,selected_correctness_actual=len(selectedchecks),selected_correctness_valid=sum(r['valid'] for r in selectedchecks),pilot_actual=len(pilots),pilot_valid=sum(r['valid'] for r in pilots),six_permutations_each_five=bool(schedule),each_condition_each_position_ten=bool(schedule),serial_same_boot=True if acquisition else None,formal_below_1000ms=sum(r['valid'] and r['elapsed_ms']<1000 for r in raw),all_outliers_retained=True,evidence_status=gate['status'],OFF_direct_snapshot_verified=None,artifact_build_source_commit=None,bootstrap='10000 complete triples, seed20261025, exploratory percentile CI, no multiplicity correction',quartiles='Tukey halves; exclude median for odd n',GM_computed=False,official_Octane_score=False,requires_original_ELF=False,original_runtime_identity_after=read(HERE/'identity_after.json')['status'] if (HERE/'identity_after.json').exists() else None)
    csvout(out/'comparison.csv',comparison);csvout(out/'coverage.csv',coverage)
    if flat:csvout(out/'samples.csv',flat)
    if conditions:csvout(out/'per_condition.csv',conditions);csvout(out/'process_wall_diagnostic.csv',walls)
    if ratio_rows:csvout(out/'ratios.csv',ratio_rows)
    save(out/'audit.json',audit)
    headers=['Octane unit','status/input','N','QJS ms','V8 ON ms','V8 OFF ms','OFF/ON','QJS/ON','QJS/OFF','valid n Q/ON/OFF']
    lines=['# 16 Run units: same-batch three-condition results','', 'ms/original complete Run; first call included, no extra workload warmup.','', '| '+' | '.join(headers)+' |','| '+' | '.join(['---']*len(headers))+' |']
    for r in comparison:lines.append('| '+' | '.join([r['case'],r['status']+' / '+r['input_mode'],fmt(r['N']),fmt(r['QJS_median_ms']),fmt(r['V8_ON_median_ms']),fmt(r['V8_OFF_median_ms']),fmt(r['OFF_ON']),fmt(r['QJS_ON']),fmt(r['QJS_OFF']),'/'.join(str(r[k]) for k in ['QJS_valid_n','ON_valid_n','OFF_valid_n'])])+' |')
    lines += ['', 'Ratios: OFF/ON>1 means OFF takes longer; QJS/ON or QJS/OFF>1 means that V8 condition takes less time. Exploratory 95% paired-triple intervals: ratios.csv. Crypto uses a new deterministic input mode; no historical timing comparison.']
    save(out/'comparison.md','\n'.join(lines)+'\n');print('ANALYSIS',audit['status'],str(valid_count)+'/1440','complete cases',len(complete_cases),flush=True)
    return out
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output');a=p.parse_args();main(a.output)

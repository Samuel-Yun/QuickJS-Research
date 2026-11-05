"""Portable raw-only statistics and independent campaign audit; Python stdlib."""
import argparse,collections,itertools,random,statistics
from common import *
BOOTSTRAPS=10000
def quartiles(values):
    x=sorted(values);n=len(x);assert n
    if n==1:return x[0],x[0]
    return statistics.median(x[:n//2]),statistics.median(x[(n+1)//2:])
def stats(values):
    q1,q3=quartiles(values)
    return dict(n=len(values),median=statistics.median(values),mean=statistics.mean(values),sample_stddev=statistics.stdev(values) if len(values)>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=min(values),max=max(values))
def percentile(values,p):
    x=sorted(values);i=(len(x)-1)*p;j=int(i);k=min(j+1,len(x)-1)
    return x[j]+(x[k]-x[j])*(i-j)
def bootstrap(triples,rng):
    vals=[[],[],[]];n=len(triples)
    for _ in range(BOOTSTRAPS):
        sample=[triples[rng.randrange(n)] for _ in range(n)]
        q,on,off=[statistics.median(t[j] for t in sample) for j in range(3)]
        for target,value in zip(vals,[off/on,q/on,q/off]):target.append(value)
    return [(percentile(v,.025),percentile(v,.975)) for v in vals]
def raw_records(stage):
    return sorted((read(p) for p in (HERE/'raw'/stage).rglob('*.json')),key=lambda r:(CASES.index(r['case']),int(r['rep']),int(r['order']),CONDITIONS.index(r['condition']),int(r['N'])))
def main(output=None):
    out=Path(output) if output else HERE/'summary'
    assert not out.exists(),'use a new output directory; never overwrite published summaries'
    m=read(HERE/'runtime.json');gate=read(HERE/'gate.json');freeze=read(HERE/'frozen.json');schedule=read(HERE/'schedule.json')
    assert gate['status']=='PASS_WITH_OBSERVABILITY_LIMITATION' and gate['selected_OFF_no_cache_state_verified'] is None
    for p,h in freeze['files'].items():assert sha(HERE/p)==h,p
    assert len(schedule)==270 and [s['index'] for s in schedule]==list(range(270))
    planned={(s['case'],s['condition'],s['rep']):s for s in schedule};assert len(planned)==270
    for case in CASES:
        permutations=collections.Counter(tuple(s['condition'] for s in sorted([s for s in schedule if s['case']==case and s['rep']==rep],key=lambda s:s['order'])) for rep in range(30))
        assert permutations=={order:5 for order in itertools.permutations(CONDITIONS)}
        assert collections.Counter((s['condition'],s['order']) for s in schedule if s['case']==case)=={(c,p):10 for c in CONDITIONS for p in range(3)}
    records=raw_records('formal');assert records,'no formal raw data'
    unique={};diagnostics=[]
    for r in records:
        key=(r['case'],r['condition'],r['rep']);assert key not in unique,'duplicate formal position';unique[key]=r
        s=planned[key];assert all(r[k]==s[k] for k in ['case','condition','rep','order','N']) and r['schedule_index']==s['index']
        p=HERE/r['script_relative'];expected=freeze['formal_scripts'][r['case']]
        assert r['script_relative']==expected['path'] and sha(p)==r['script_sha256']==expected['sha256']
        assert r['command'][:-1]==prefixes()[r['condition']]
        assert r['command'][-1].replace('\\','/').endswith('/'+r['script_relative'])
        assert r['flags']==prefixes()[r['condition']][1:]
        assert not any(t in ' '.join(r['flags']) for t in ['trace-','log-','print-','allow-natives','max-opt'])
        a=m['quickjs']['binary'] if r['condition']==CONDITIONS[0] else m['v8']['binary']
        assert r['binary_sha256']==a['sha256']
        assert r['data_dependencies']==(m['v8']['dependencies'] if r['condition']!=CONDITIONS[0] else [])
        assert r['input_manifest_sha256']==sha(HERE/'inputs.json') and r['environment_sha256']==sha(HERE/'environment.json')
        if r['valid']:
            pld=r['payload'];t=pld['elapsed_ms'];assert r['exit_code']==0 and not r['stderr'] and pld['correctness']=='PASS' and pld['warmup_calls']==0
            assert t==pld['stop_ms']-pld['start_ms'] and t>0 and math.isfinite(t)
            assert r['elapsed_ms']==t and r['elapsed_per_Run_ms']==t/r['N']
            assert t<=r['outer_wall_ns']/1e6+5 and r['outer_wall_ns']==r['outer_stop_ns']-r['outer_start_ns']
            assert not r['parent_child_absolute_origin_verified'] and r['timer_duration_enclosed']
            if r['case']!='Richards':assert pld['checksum']==r['N']*(12288 if r['case']=='own_integer' else 8386560)
        diagnostics.append(dict(case=r['case'],condition=r['condition'],rep=r['rep'],order=r['order'],N=r['N'],valid=r['valid'],elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],outer_wall_ms=r['outer_wall_ns']/1e6,below_pilot_threshold=r['valid'] and r['elapsed_ms']<1000,exit_code=r['exit_code'],checksum=r['checksum'],script_sha256=r['script_sha256'],binary_sha256=r['binary_sha256'],timestamp=r['timestamp'],command=json.dumps(r['command'],ensure_ascii=False),stdout=r['stdout'],stderr=r['stderr']))
    valid=[r for r in records if r['valid']];completekeys=[]
    acquisition=sorted(records,key=lambda r:r['schedule_index'])
    assert len({r['boot_id'] for r in acquisition})==1
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(acquisition,acquisition[1:])),'overlapping samples'
    for case in CASES:
        for rep in range(30):
            if all((case,c,rep) in unique and unique[(case,c,rep)]['valid'] for c in CONDITIONS):completekeys.append((case,rep))
    groups=[];wall=[];mainrows=[];ratios=[];rng=random.Random(SEED)
    for case in CASES:
        med={};n=read(HERE/'selected'/f'{case}.json')['N']
        for c in CONDITIONS:
            rows=[r for r in valid if r['case']==case and r['condition']==c]
            if not rows:continue
            assert all(r['N']==n for r in rows)
            stat=stats([r['elapsed_per_Run_ms'] for r in rows]);groups.append(dict(case=case,condition=c,N=n,unit='ms/complete Run',**stat));med[c]=stat['median']
            wall.append(dict(case=case,condition=c,N=n,unit='ms/new process; diagnostic, not initialization self-time',**stats([r['outer_wall_ns']/1e6 for r in rows])))
        reps=[rep for cs,rep in completekeys if cs==case]
        if not reps:continue
        # Pair on complete triples; never draw the three conditions independently.
        triples=[[unique[(case,c,rep)]['elapsed_per_Run_ms'] for c in CONDITIONS] for rep in reps]
        q,on,off=[statistics.median(t[j] for t in triples) for j in range(3)]
        estimates=[off/on,q/on,q/off];intervals=bootstrap(triples,rng)
        for label,value,(low,high) in zip(['OFF/ON','QJS/ON','QJS/OFF'],estimates,intervals):
            ratios.append(dict(case=case,ratio=label,point_estimate=value,CI95_low=low,CI95_high=high,complete_triples=len(triples),bootstrap_replicates=BOOTSTRAPS,seed=SEED,interpretation='direction unclear' if low<=1<=high else 'ratio > 1' if low>1 else 'ratio < 1',OFF_time_change_percent=(value-1)*100 if label=='OFF/ON' else None))
        mainrows.append(dict(case=case,N=n,QJS_median_ms=q,V8_ON_median_ms=on,V8_OFF_median_ms=off,OFF_ON=off/on,OFF_change_percent=(off/on-1)*100,OFF_ON_CI95_low=intervals[0][0],OFF_ON_CI95_high=intervals[0][1],QJS_ON=q/on,QJS_ON_CI95_low=intervals[1][0],QJS_ON_CI95_high=intervals[1][1],QJS_OFF=q/off,QJS_OFF_CI95_low=intervals[2][0],QJS_OFF_CI95_high=intervals[2][1],complete_triples=len(triples)))
    correctness=raw_records('correctness');selected=raw_records('selected_correctness');pilots=raw_records('pilot')
    assert len(correctness)==18 and all(r['valid'] for r in correctness)
    assert len(selected)==9 and all(r['valid'] for r in selected)
    for case in CASES:
        sel=read(HERE/'selected'/f'{case}.json');rr=[r for r in pilots if r['case']==case and r['N']==sel['N']]
        assert len(rr)==9 and all(r['valid'] and r['elapsed_ms']>=1000 for r in rr)
    counts=[dict(case=case,condition=c,actual=sum(r['case']==case and r['condition']==c for r in records),valid=sum(r['case']==case and r['condition']==c for r in valid)) for case in CASES for c in CONDITIONS]
    allgood=len(records)==len(valid)==270 and all(r['valid']==30 for r in counts) and len(completekeys)==90
    audit=dict(status='COMPLETE' if allgood else 'PARTIAL_WITH_LIMITATIONS',evidence_status=gate['status'],formal_expected=270,formal_actual=len(records),formal_valid=len(valid),formal_failed=len(records)-len(valid),missing_positions=270-len(unique),duplicate_positions=0,group_counts=counts,complete_triples=len(completekeys),six_orders_each_five=True,each_condition_position_ten=True,formal_serial_same_boot=True,correctness_valid=18,selected_N_correctness_valid=9,pilot_actual=len(pilots),pilot_valid=sum(r['valid'] for r in pilots),formal_below_calibration_threshold=sum(r['below_pilot_threshold'] for r in diagnostics),all_outliers_retained=True,formal_diagnostics_off=True,runtime_hash_records_consistent=True,identity_after=read(HERE/'identity_after.json')['status'],OFF_direct_snapshot_verified=None,artifact_source_commit=None,reference_commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764',all_V8_caches_removed=False,GM_computed=False,bootstrap=dict(unit='complete within-case condition triple',replicates=BOOTSTRAPS,seed=SEED,CI='linear-interpolated percentile 2.5/97.5%; exploratory, not multiplicity-adjusted'),quartiles='Tukey halves; exclude median for odd n',portable_data_only=True,requires_old_ELF=False)
    csvout(out/'samples.csv',diagnostics);csvout(out/'per_condition.csv',groups);csvout(out/'process_wall_diagnostic.csv',wall);csvout(out/'comparison.csv',mainrows);csvout(out/'ratios.csv',ratios);save(out/'audit.json',audit)
    print('RAW_ONLY_ANALYSIS',audit['status'],f'{len(valid)}/270',out,flush=True)
    for r in mainrows:print(r,flush=True)
    return out
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output');a=p.parse_args();main(a.output)

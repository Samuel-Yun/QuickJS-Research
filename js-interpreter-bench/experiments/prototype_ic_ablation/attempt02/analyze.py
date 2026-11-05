"""Raw-only replay, identical median/quantile/block bootstrap definitions to attempt01."""
import argparse,collections,itertools,random,statistics
from common import *
MATH=load_old('analyze')
stats=MATH.stats;quant=MATH.quant

def main(out):
    assert not out.exists(),'new analysis directory required'
    reuse=read(HERE/'reused_evidence.json')
    for name,digest in reuse['files'].items():assert sha(OLD/name)==digest,name
    plan=read(HERE/'schedule.json');assert len(plan)==384
    for case in CASES:
        permutations=[];positions=[]
        for b in range(24):
            rows=sorted([s for s in plan if s['block']==b and s['case']==case],key=lambda s:s['position'])
            assert len(rows)==4;permutations.append(tuple(s['condition'] for s in rows));positions.append(rows[0]['case_position'])
        assert set(permutations)==set(itertools.permutations(CONDS))
        assert collections.Counter(positions)=={i:6 for i in range(4)}
    planned={(s['block'],s['case'],s['condition']):s for s in plan};actual={};raw_index=[]
    frozen=read(HERE/'formal_frozen.json') if (HERE/'formal_frozen.json').exists() else None
    if frozen:
        for name,digest in {**frozen['files'],**frozen['scripts']}.items():assert sha(HERE/name)==digest,name
    a=read(HERE/'runtime_frozen.json')['artifacts'] if (HERE/'runtime_frozen.json').exists() else {}
    allrows=[]
    for p in sorted((HERE/'raw').glob('*/*/*.json')):
        if 'started' in p.parts:continue
        r=read(p)
        if 'stage' not in r:continue
        assert r['option']==option(r['condition']) and r['flags']==[]
        assert r['command'][0]==a[r['condition']]['path'] and r['binary_sha256']==a[r['condition']]['sha256']
        assert len(r['command'])==2 and r['command'][1].replace('\\','/').endswith('/'+r['script_relative'])
        assert sha(HERE/r['script_relative'])==r['script_sha256']
        assert r['child_cpu_ms']==r['child_user_ms']+r['child_system_ms'] and r['child_cpu_ms']>=0
        assert r['external_wall_ms']==r['outer_wall_ns']/1e6
        if r['valid']:
            W=load_old('workload');d=W.valid_payload(r,r['case'],r['N'],r['stage']=='selected_correctness')
            assert d==r['payload'] and r['boot_id']==r['boot_id_after']
        allrows.append(r)
        if r['stage']!='formal':continue
        key=r['block'],r['case'],r['condition'];assert key in planned and key not in actual
        s=planned[key];assert r['position']==s['position'] and r['N']==s['N']
        assert frozen and r['boot_id']==frozen['boot_id'] and r['parent_affinity']==frozen['affinity']
        actual[key]=r
        raw_index.append(dict(block=r['block'],case=r['case'],condition=r['condition'],position=r['position'],N=r['N'],valid=r['valid'],internal_elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],external_wall_ms=r['external_wall_ms'],child_user_ms=r['child_user_ms'],child_system_ms=r['child_system_ms'],child_cpu_ms=r['child_cpu_ms'],timestamp=r['timestamp'],raw_relative=p.relative_to(HERE).as_posix(),raw_sha256=sha(p)))
    complete=[b for b in range(24) if all((b,k,c) in actual and actual[b,k,c]['valid'] for k in CASES for c in CONDS)]
    if actual:
        assert len({r['environment_excluding_option_sha256'] for r in actual.values()})==1
        assert len({r['binary_sha256'] for r in actual.values() if r['condition'] in ['ON','OFF']})==1
    summary=[]
    for case in CASES:
        selected=read(HERE/'selected'/f'{case}.json')['N'] if (HERE/'selected'/f'{case}.json').exists() else None
        for c in CONDS:
            rows=[r for (b,k,v),r in actual.items() if k==case and v==c and r['valid']]
            for metric,field in [('internal_ms_per_Run','elapsed_per_Run_ms'),('external_ms_per_process','external_wall_ms'),('child_CPU_ms_per_process','child_cpu_ms')]:
                summary.append(dict(case=case,condition=c,metric=metric,N=selected,**stats([r[field] for r in rows])))
    rng=random.Random(SEED);draws=[[rng.choice(complete) for _ in complete] for _ in range(10000)] if complete else []
    ratios=[]
    for case in CASES:
        for num,den in [('ON','OFF'),('ON','H'),('OFF','M'),('H','M')]:
            row=dict(case=case,ratio=num+'/'+den,point=None,CI95_low=None,CI95_high=None,time_change_percent=None,CI95_change_low=None,CI95_change_high=None,complete_blocks=len(complete),status='NOT_RUN' if not actual else 'INSUFFICIENT_COMPLETE_BLOCKS')
            if complete:
                def med(c,blocks):return statistics.median(actual[b,case,c]['elapsed_per_Run_ms'] for b in blocks)
                pt=med(num,complete)/med(den,complete);bs=[med(num,d)/med(den,d) for d in draws];lo,hi=quant(bs,.025),quant(bs,.975)
                row.update(point=pt,CI95_low=lo,CI95_high=hi,time_change_percent=100*(pt-1),CI95_change_low=100*(lo-1),CI95_change_high=100*(hi-1),status='numerator_faster' if hi<1 else 'numerator_slower' if lo>1 else 'unclear')
            ratios.append(row)
    csvout(out/'summary.csv',summary);csvout(out/'ratios.csv',ratios)
    if raw_index:csvout(out/'formal_raw_index.csv',raw_index)
    cpurows=[]
    for r in sorted(allrows,key=lambda r:r['outer_start_ns']):
        cpurows.append({key:r.get(key) for key in ['stage','case','condition','rep','position','block','N','internal_elapsed_ms','elapsed_per_Run_ms','external_wall_ms','child_user_ms','child_system_ms','child_cpu_ms','timestamp','boot_id','parent_affinity','valid']})
    if cpurows:csvout(out/'time_order_cpu_wall.csv',cpurows)
    diagnostics=[]
    for stage in sorted({r['stage'] for r in allrows}):
        if stage=='selected_correctness':continue
        for field in ['internal_elapsed_ms','external_wall_ms','child_cpu_ms']:
            v=[r[field] for r in allrows if r['stage']==stage and r['valid'] and r[field] is not None]
            s=stats(v)
            diagnostics.append(dict(stage=stage,metric=field,**s,IQR_over_median=s['IQR']/s['median'] if s['median'] else None,max_over_min=s['max']/s['min'] if s['min'] else None))
    if diagnostics:csvout(out/'stage_cpu_wall.csv',diagnostics)
    for p in sorted((HERE/'stability').glob('group*.json')):
        d=read(p);s=stats(d['elapsed_ms_in_time_order']);assert s['median']==d['median'] and s['Q1']==d['Q1'] and s['Q3']==d['Q3']
        assert d['passed']==(s['IQR']/s['median']<=.1 and s['max']/s['min']<=1.25)
    missing=[s for key,s in planned.items() if key not in actual]
    save(out/'missing.json',dict(count=len(missing),planned_positions=missing))
    rounds=[]
    for b in range(24):
        for case in CASES:
            row=dict(block=b,case=case)
            for c in CONDS:row[c+'_ms_per_Run']=actual[b,case,c]['elapsed_per_Run_ms'] if (b,case,c) in actual and actual[b,case,c]['valid'] else None
            rounds.append(row)
    csvout(out/'per_round.csv',rounds)
    stop=read(HERE/'performance_stop.json') if (HERE/'performance_stop.json').exists() else None
    audit=dict(status=stop['status'] if stop else 'COMPLETE' if len(actual)==384 and len(complete)==24 else 'INCOMPLETE',formal_expected=384,formal_actual=len(actual),formal_valid=sum(r['valid'] for r in actual.values()),complete_blocks=len(complete),bootstrap_draws_actual=10000 if complete else 0,
      new_processes=len(allrows),process_counts=dict(collections.Counter(r['stage'] for r in allrows)),old_evidence_reused_not_new=dict(semantic=64,workload_N1_N2=32,diagnostic=16),new_sanitizer='NOT_COMPLETED_BUILD_INTERRUPTED (inherited limitation)',raw_only=True,runtime_paths_opened=False,schedule='PASS',all_outliers_retained=True,stop=stop)
    save(out/'audit.json',audit);print(json.dumps(audit,ensure_ascii=False,indent=2))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',required=True,type=Path);args=p.parse_args();main(args.output)

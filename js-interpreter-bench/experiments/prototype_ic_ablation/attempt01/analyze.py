"""Public raw only. No runtime, build tree or historical ELF paths opened."""
import argparse,collections,itertools,json,math,random,statistics
from pathlib import Path
from common import HERE,CASES,CONDS,SEED,read,save,sha,csvout

def stats(v):
    if not v:return dict(valid_samples=0,median=None,Q1=None,Q3=None,IQR=None,mean=None,sample_stddev=None,min=None,max=None)
    a=sorted(v);half=len(a)//2
    q1=statistics.median(a[:half]) if half else a[0];q3=statistics.median(a[-half:]) if half else a[-1]
    return dict(valid_samples=len(a),median=statistics.median(a),Q1=q1,Q3=q3,IQR=q3-q1,mean=statistics.mean(a),sample_stddev=statistics.stdev(a) if len(a)>1 else None,min=a[0],max=a[-1])
def quant(v,p):
    a=sorted(v);i=(len(a)-1)*p;j=int(i);return a[j]+(a[min(j+1,len(a)-1)]-a[j])*(i-j)

def main(out):
    assert not out.exists(),'use new output directory'
    manifest=read(HERE/'manifest.json');assert manifest['switch']['sha256']
    semantic=read(HERE/'gates/semantic.json');assert semantic['actual_valid']==64
    assert read(HERE/'gates/mechanism.json')['status']=='PASS'
    dg=read(HERE/'diagnostic_manifest.json');archives=0
    for ident in sorted((HERE/'raw/diagnostic').glob('*.identity.json')):
        d=read(ident);p=ident.with_name(ident.name.replace('.identity.json','.json.gz'))
        assert sha(p)==d['compressed_sha256'] and sha(HERE/d['script_relative'])==d['script_sha256']
        raw=__import__('gzip').decompress(p.read_bytes());assert __import__('hashlib').sha256(raw).hexdigest()==d['raw_sha256']
        report=__import__('json').loads(raw);g=report['cache_lifecycle'];assert g['site_sizeof']==24 and g['final_requested_live_bytes']==0 and g['shape_retains']==g['shape_releases']
        assert report['proto_option']==int(d['option']);archives+=1
        for f in report['functions']:
            code=bytes.fromhex(f['code_before_hex']);pc=0
            for op in f['opcodes']:
                assert op['pc']==pc and code[pc]==op['before_id'];pc+=op['size']
                if op['ic_read_stats_instrumented']:assert op['ic_queries']==op['hits']+op['misses']
                if d['option']=='0':assert not op['h_proto_hits'] and not op['h_proto_fills']
            assert pc==len(code)
    assert archives==16
    frozen=read(HERE/'formal_frozen.json') if (HERE/'formal_frozen.json').exists() else None
    schedule=read(HERE/'schedule.json') if (HERE/'schedule.json').exists() else []
    if frozen:
        for name,h in frozen['files'].items():assert sha(HERE/name)==h,name
        for name,h in frozen['scripts'].items():assert sha(HERE/name)==h,name
    if schedule:
        assert len(schedule)==384
        for case in CASES:
            perms=[]
            for block in range(24):
                rr=sorted([r for r in schedule if r['case']==case and r['block']==block],key=lambda r:r['position']);assert len(rr)==4
                perms.append(tuple(r['condition'] for r in rr))
            assert set(perms)==set(itertools.permutations(CONDS)) and len(set(perms))==24
            assert collections.Counter(r['case_position'] for r in schedule if r['case']==case and r['position']==0)=={i:6 for i in range(4)}
    planned={(r['block'],r['case'],r['condition']):r for r in schedule}
    actual={};index=[]
    for p in sorted((HERE/'raw/formal').rglob('*.json')):
        r=read(p);key=r['block'],r['case'],r['condition'];assert key in planned and key not in actual
        plan=planned[key];a=read(HERE/'runtime_frozen.json')['artifacts'][r['condition']]
        assert r['N']==plan['N'] and r['position']==plan['position'] and r['flags']==[]
        assert r['command'][0]==a['path'] and r['binary_sha256']==a['sha256']
        assert len(r['command'])==2 and r['command'][1].replace('\\','/').endswith('/'+r['script_relative'])
        assert sha(HERE/r['script_relative'])==r['script_sha256'] and r['boot_id']==frozen['boot_id']
        assert r['option']==('0' if r['condition']=='OFF' else '1')
        if r['valid']:
            d=r['payload'];assert r['exit_code']==0 and not r['stderr'] and not r['timeout'] and d['correctness']=='PASS' and d['warmup_calls']==0
            assert r['elapsed_ms']>0 and r['elapsed_ms']==d['stop_ms']-d['start_ms'] and r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N']
        actual[key]=r;index.append(dict(block=r['block'],case=r['case'],condition=r['condition'],N=r['N'],valid=r['valid'],elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],outer_wall_ms=r['outer_wall_ns']/1e6,raw_relative=p.relative_to(HERE).as_posix(),raw_sha256=sha(p)))
    complete=[b for b in range(24) if all((b,k,c) in actual and actual[b,k,c]['valid'] for k in CASES for c in CONDS)]
    if actual:
        assert len({r['environment_excluding_option_sha256'] for r in actual.values()})==1
        assert len({r['binary_sha256'] for r in actual.values() if r['condition'] in ['OFF','ON']})==1
        assert len({tuple(r['parent_affinity']) for r in actual.values()})==1
    summary=[]
    for case in CASES:
        selected=read(HERE/'selected'/f'{case}.json')['N'] if (HERE/'selected'/f'{case}.json').exists() else None
        for c in CONDS:
            rr=[r for (b,k,v),r in actual.items() if k==case and v==c and r['valid']]
            for metric in ['internal_ms_per_Run','external_ms_per_process']:
                vals=[r['elapsed_per_Run_ms'] if metric.startswith('internal') else r['outer_wall_ns']/1e6 for r in rr]
                summary.append(dict(case=case,condition=c,metric=metric,N=selected,**stats(vals)))
    ratios=[];rng=random.Random(SEED);draws=[[rng.choice(complete) for _ in complete] for _ in range(10000)] if complete else []
    for case in CASES:
        for num,den in [('ON','OFF'),('ON','H'),('OFF','M'),('H','M')]:
            row=dict(case=case,ratio=num+'/'+den,point=None,CI95_low=None,CI95_high=None,time_change_percent=None,CI95_change_low=None,CI95_change_high=None,complete_blocks=len(complete),status='NOT_RUN' if not actual else 'INSUFFICIENT_COMPLETE_BLOCKS')
            if complete:
                def med(c,blocks):return statistics.median(actual[b,case,c]['elapsed_per_Run_ms'] for b in blocks)
                point=med(num,complete)/med(den,complete);bs=[med(num,d)/med(den,d) for d in draws];lo,hi=quant(bs,.025),quant(bs,.975)
                row.update(point=point,CI95_low=lo,CI95_high=hi,time_change_percent=100*(point-1),CI95_change_low=100*(lo-1),CI95_change_high=100*(hi-1),status='numerator_faster' if hi<1 else 'numerator_slower' if lo>1 else 'unclear')
            ratios.append(row)
    csvout(out/'summary.csv',summary);csvout(out/'ratios.csv',ratios)
    if index:csvout(out/'raw_index.csv',index)
    # Preserve every original-H stability point, with explicit time order.
    stability=[]
    for p in sorted((HERE/'stability').glob('group*.json')):
        d=read(p);v=d['elapsed_ms_in_time_order'];s=stats(v)
        assert s['median']==d['median_ms'] and s['Q1']==d['Q1_ms'] and s['Q3']==d['Q3_ms']
        assert ((s['Q3']-s['Q1'])/s['median'])==d['IQR_over_median'] and max(v)/min(v)==d['max_over_min']
        assert d['passed']==(d['IQR_over_median']<=.1 and d['max_over_min']<=1.25)
        for rep,value in enumerate(v):stability.append(dict(group=d['group'],rep=rep,condition='original H',case='numeric_control',N=d['N'],elapsed_ms=value,elapsed_per_Run_ms=value/d['N']))
    if stability:csvout(out/'stability_order.csv',stability)
    if complete:
        rounds=[]
        for b in range(24):
            for case in CASES:
                row=dict(block=b,case=case)
                for c in CONDS:row[c+'_ms_per_Run']=actual[b,case,c]['elapsed_per_Run_ms'] if (b,case,c) in actual and actual[b,case,c]['valid'] else None
                rounds.append(row)
        csvout(out/'per_round.csv',rounds)
    stop=read(HERE/'performance_stop.json') if (HERE/'performance_stop.json').exists() else None
    status=stop['status'] if stop else 'COMPLETE' if len(actual)==384 and len(complete)==24 else 'INCOMPLETE'
    missing=[s for key,s in planned.items() if key not in actual]
    save(out/'missing.json',dict(count=384-len(actual),planned_positions=missing))
    audit=dict(status=status,formal_expected=384,formal_actual=len(actual),formal_valid=sum(r['valid'] for r in actual.values()),complete_blocks=len(complete),
      semantic_valid=64,workload_correctness=32,mechanism_processes=16,diagnostic_archives_verified=archives,stability_processes=len(stability),
      schedule='PASS' if schedule else 'NOT_REACHED',raw_only=True,runtime_paths_opened=False,all_outliers_retained=True,bootstrap_draws_actual=10000 if complete else 0,stop=stop,
      no_formal_estimates_from_pilots=True)
    save(out/'audit.json',audit);print(json.dumps(audit,ensure_ascii=False,indent=2))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);a=p.parse_args();main(a.output)

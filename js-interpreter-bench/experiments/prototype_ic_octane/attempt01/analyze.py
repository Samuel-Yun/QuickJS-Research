"""Portable raw-only five-condition replay; no installed runtime is accessed."""
import argparse,collections,html,random,statistics
from common import *
OLD_MATH=load_source('analyze')
PAIRS=[('M','A'),('H','A'),('ON','A'),('H','M'),('ON','M'),('ON','OFF'),('ON','H'),('OFF','M')]
def stats(v):
    return OLD_MATH.stats(v) if v else dict(n=0,median=None,mean=None,sample_stddev=None,Q1=None,Q3=None,IQR=None,min=None,max=None)
quant=OLD_MATH.percentile
def records(stage):return [read(p) for p in sorted((HERE/'raw'/stage).rglob('*.json'))]
def weights(cases):
    count=collections.Counter(c.split('.')[0] for c in cases)
    return {c:1/len(count)/count[c.split('.')[0]] for c in cases}
def mdtable(headers,rows):return '\n'.join(['|'+'|'.join(headers)+'|','|'+'|'.join(['---']*len(headers))+'|']+['|'+'|'.join(map(str,r))+'|' for r in rows])
def plot(out,rows,pair):
    rr=[r for r in rows if r['ratio']==pair];top=75;step=28;left=290;width=600
    valid=[r for r in rr if r['point'] is not None];maximum=max([1.2]+[r['CI95_high']*1.05 for r in valid]);scale=width/maximum
    svg=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1050" height="{top+step*len(rr)+30}"><rect width="100%" height="100%" fill="white"/>',f'<text x="15" y="25" font-family="sans-serif" font-size="17">{html.escape(pair)} time ratio, paired exploratory 95% CI (&lt;1 numerator faster)</text>',f'<line x1="{left+scale}" x2="{left+scale}" y1="45" y2="{top+step*len(rr)}" stroke="gray" stroke-dasharray="4,4"/>']
    for i,r in enumerate(rr):
        y=top+i*step;svg.append(f'<text x="12" y="{y+4}" font-family="sans-serif" font-size="13">{html.escape(r["case"])}</text>')
        if r['point'] is None:svg.append(f'<text x="{left}" y="{y+4}" font-family="sans-serif" font-size="12">{html.escape(r["status"])}</text>');continue
        color='#237142' if r['CI95_high']<1 else '#a22e2e' if r['CI95_low']>1 else '#444'
        svg.extend([f'<line x1="{left+scale*r["CI95_low"]}" x2="{left+scale*r["CI95_high"]}" y1="{y}" y2="{y}" stroke="{color}" stroke-width="2"/>',f'<circle cx="{left+scale*r["point"]}" cy="{y}" r="4" fill="{color}"/>',f'<text x="925" y="{y+4}" font-size="12">{r["point"]:.4f}</text>'])
    svg.append('</svg>');save(out/'plots'/(pair.replace('/','_')+'.svg'),'\n'.join(svg))

def main(out):
    assert not out.exists(),'new replay output directory required'
    frozen=read(HERE/'frozen.json') if (HERE/'frozen.json').exists() else None
    if frozen:
        for p,h in frozen['files'].items():assert sha(HERE/p)==h,p
    refs=read(HERE/'reused_evidence.json')
    for p,h in refs['files'].items():assert sha(ROOT/p)==h,p
    for f in read(HERE/'inputs.json')['files']:assert sha(HERE/f['frozen'])==f['LF_sha256']
    runtime=read(HERE/'runtime.json');formal_cases=read(HERE/'formal_cases.json');coverage=read(HERE/'coverage_frozen.json')
    schedule=read(HERE/'schedule.json') if (HERE/'schedule.json').exists() else []
    if schedule:
        assert len(schedule)==len(formal_cases)*150
        assert [s['index'] for s in schedule]==list(range(len(schedule)))
        for case in formal_cases:
            counts=collections.Counter((s['condition'],s['order']) for s in schedule if s['case']==case)
            assert counts=={(c,p):6 for c in CONDITIONS for p in range(5)}
            for rep in range(30):
                group=sorted([s for s in schedule if s['case']==case and s['rep']==rep],key=lambda s:s['order'])
                assert len(group)==5 and set(s['condition'] for s in group)==set(CONDITIONS)
                assert [s['index'] for s in group]==list(range(group[0]['index'],group[0]['index']+5))
    planned={(s['case'],s['condition'],s['rep']):s for s in schedule};unique={};raw=records('formal');hashcache={};flat=[]
    for r in raw:
        key=r['case'],r['condition'],r['rep'];assert key not in unique and key in planned
        s=planned[key];assert all(r[k]==s[k] for k in ['case','condition','rep','N','order']) and r['schedule_index']==s['index']
        a=runtime['artifacts'][r['condition']];flags=['--std'] if r['case']=='zlib.zlib' else []
        assert r['binary_sha256']==a['sha256'] and r['command'][:-1]==[a['path'],*flags] and r['flags']==flags
        assert r['command'][-1].replace('\\','/').endswith('/'+r['script_relative'])
        expected=frozen['formal_scripts'][r['case']];assert r['script_relative']==expected['path']
        name=r['script_relative']
        if name not in hashcache:hashcache[name]=sha(HERE/name)
        assert r['script_sha256']==hashcache[name]==expected['sha256']
        assert r['input_manifest_sha256']==sha(HERE/'inputs.json') and r['mode']==MODE and r['cohort']==runtime['cohort']
        assert r['boot_id']==r['boot_id_after']==frozen['boot_id'] and r['affinity']==frozen['affinity']
        assert r['option']==('0' if r['condition']=='OFF' else '1')
        assert r['child_cpu_ms']==r['child_user_ms']+r['child_system_ms'] and r['external_wall_ms']==r['outer_wall_ns']/1e6
        if r['valid']:
            p=r['payload'];assert r['exit_code']==0 and not r['stderr'] and not r['timeout'] and p['correctness']=='PASS' and p['warmup_calls']==0
            assert p['phase']=='measure' and p['case']==r['case'] and p['N']==r['N'] and p['mode']==MODE
            assert 0<r['elapsed_ms']==p['stop_ms']-p['start_ms']<=r['external_wall_ms']+5
            assert r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N']
            if r['case'].startswith('Crypto.'):
                gate=read(HERE/'crypto'/f'{r["case"]}.N{r["N"]}.json');assert gate['status']=='PASS_BOUNDED_INPUT_IDENTITY' and p['checksum']==gate['final_ciphertext']
        unique[key]=r
        flat.append({k:r.get(k) for k in ['case','condition','rep','order','schedule_index','N','valid','elapsed_ms','elapsed_per_Run_ms','external_wall_ms','child_user_ms','child_system_ms','child_cpu_ms','exit_code','failed_reason','option','boot_id','affinity','timestamp','binary_sha256','script_sha256','checksum','command','stdout','stderr']})
    acquired=sorted(raw,key=lambda r:r['schedule_index'])
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(acquired,acquired[1:])),'nonserial'
    if raw:assert len({r['environment_excluding_option_sha256'] for r in raw})==1
    detail=[];comparison=[];complete={};paired={};finalcoverage=[]
    for case in CASES:
        rec=[r for r in raw if r['case']==case];v={c:[r for r in rec if r['condition']==c and r['valid']] for c in CONDITIONS}
        reps=[rep for rep in range(30) if all((case,c,rep) in unique and unique[case,c,rep]['valid'] for c in CONDITIONS)]
        failure=blocked(case);cov=next(r for r in coverage if r['case']==case)
        full=all(len(v[c])==30 for c in CONDITIONS) and len(reps)==30 and failure is None
        status='COMPLETE' if full else failure['status'] if failure else cov['status'] if not cov['formal_included'] else 'INCOMPLETE'
        selected=HERE/'selected'/f'{case}.json';n=read(selected)['N'] if selected.exists() else None
        row=dict(case=case,status=status,N=n,complete_five_condition_rounds=len(reps),reason=failure['reason'] if failure else '' if full else cov['reason'])
        for c in CONDITIONS:
            for metric,field,unit in [('internal','elapsed_per_Run_ms','ms/complete Run'),('external','external_wall_ms','ms/process'),('CPU','child_cpu_ms','CPU ms/process')]:
                st=stats([r[field] for r in v[c]]);detail.append(dict(case=case,condition=c,metric=metric,unit=unit,N=n,**st))
                if metric=='internal':row[c+'_median_ms']=st['median'];row[c+'_n']=st['n']
        comparison.append(row)
        finalcoverage.append(dict(case=case,status=status,formal_included=cov['formal_included'],actual=len(rec),valid=sum(r['valid'] for r in rec),expected=150 if case in formal_cases else 0,complete_rounds=len(reps),reason=row['reason']))
        if full:complete[case]={c:[unique[case,c,rep]['elapsed_per_Run_ms'] for rep in range(30)] for c in CONDITIONS}
        if reps and failure is None:paired[case]=(reps,{c:[unique[case,c,rep]['elapsed_per_Run_ms'] for rep in reps] for c in CONDITIONS})
    # One shared index draw per repetition across full cases; identical median/percentile estimator.
    rng=random.Random(SEED);shared=[[rng.randrange(30) for _ in range(30)] for _ in range(10000)]
    distributions={};ratios=[]
    for case in CASES:
        if case in paired:
            reps,vals=paired[case];n=len(reps)
            indices=shared if n==30 else None
            if n!=30:
                local=random.Random(SEED);indices=[[local.randrange(n) for _ in range(n)] for _ in range(10000)]
            dist={a+'/'+b:[] for a,b in PAIRS}
            for ix in indices:
                med={c:statistics.median(vals[c][i] for i in ix) for c in CONDITIONS}
                for a,b in PAIRS:dist[a+'/'+b].append(med[a]/med[b])
            distributions[case]=dist
        else:reps=[];vals={};dist={}
        status=next(r['status'] for r in comparison if r['case']==case)
        for a,b in PAIRS:
            label=a+'/'+b;point=lo=hi=None
            if case in paired:
                point=statistics.median(vals[a])/statistics.median(vals[b]);lo=quant(dist[label],.025);hi=quant(dist[label],.975)
            ratios.append(dict(case=case,ratio=label,point=point,CI95_low=lo,CI95_high=hi,time_change_percent=100*(point-1) if point else None,CI95_change_low=100*(lo-1) if lo else None,CI95_change_high=100*(hi-1) if hi else None,complete_rounds=len(reps),bootstrap_draws=10000 if point else 0,status='improvement' if hi is not None and hi<1 else 'regression' if lo is not None and lo>1 else 'unclear' if point else status))
    sets={'MAIN_FIXED16_WITH_CRYPTO':BASE_CASES,'SUPPLEMENT_NO_CRYPTO_FIXED14':[c for c in BASE_CASES if not c.startswith('Crypto.')],'EXPANDED_FULL18':CASES,'EXPLORATORY_ADMITTED_'+str(len(formal_cases)):formal_cases}
    if any(c not in complete for c in BASE_CASES):sets['EXPLORATORY_COMPLETE_INTERSECTION']=[c for c in formal_cases if c in complete]
    aggregate=[]
    for label,cases in sets.items():
        missing=[c for c in cases if c not in complete];w=weights(cases) if cases else {};suite_count=len({c.split('.')[0] for c in cases})
        for a,b in PAIRS:
            name=a+'/'+b;pt=lo=hi=None;by_suite={}
            if not missing and cases:
                points={c:statistics.median(complete[c][a])/statistics.median(complete[c][b]) for c in cases}
                pt=math.exp(sum(w[c]*math.log(points[c]) for c in cases))
                bs=[math.exp(sum(w[c]*math.log(distributions[c][name][i]) for c in cases)) for i in range(10000)];lo=quant(bs,.025);hi=quant(bs,.975)
                by_suite={s:math.exp(statistics.mean(math.log(points[c]) for c in cases if c.split('.')[0]==s)) for s in {c.split('.')[0] for c in cases}}
            aggregate.append(dict(set=label,ratio=name,case_count=len(cases),suite_count=suite_count,cases=cases,missing=missing,point=pt,CI95_low=lo,CI95_high=hi,time_change_percent=100*(pt-1) if pt else None,CI95_change_low=100*(lo-1) if lo else None,CI95_change_high=100*(hi-1) if hi else None,status='UNAVAILABLE_FIXED_SET_INCOMPLETE' if missing or not cases else 'improvement' if hi<1 else 'regression' if lo>1 else 'unclear',suite_weights=w,by_suite=by_suite,bootstrap_draws=10000 if pt else 0,official_score=False))
    checks=records('correctness');selected=records('selected_correctness');pilots=records('pilot')
    validation=[]
    for stage,rr in [('correctness',checks),('selected_correctness',selected),('pilot',pilots)]:
        for r in rr:validation.append({k:r.get(k) for k in ['stage','case','condition','N','rep','order','valid','exit_code','failed_reason','script_sha256','checksum','elapsed_ms','external_wall_ms','stdout','stderr']})
    if validation:csvout(out/'validation.csv',validation)
    failures=[{k:r.get(k) for k in ['stage','case','condition','N','rep','order','valid','exit_code','failed_reason','stdout','stderr']} for r in checks+selected+pilots+raw if not r['valid']]
    save(out/'failures.json',failures)
    crypto=[]
    for p in (HERE/'crypto').glob('*.json'):
        d=read(p);assert d['processes']==10 and d['status']=='PASS_BOUNDED_INPUT_IDENTITY'
        crypto.append(dict(case=d['case'],N=d['N'],status=d['status'],processes=d['processes'],seed=d['seed'],core_sha256=d['core_sha256'],final_ciphertext=d['final_ciphertext']))
    if crypto:csvout(out/'crypto_identity.csv',crypto)
    for case in complete:
        n=read(HERE/'selected'/f'{case}.json')['N'];pp=[r for r in pilots if r['case']==case and r['N']==n]
        assert len(pp)==10 and all(r['valid'] and r['elapsed_ms']>=1000 for r in pp)
        assert len([r for r in checks if r['case']==case and r['valid']])==10
        assert len([r for r in selected if r['case']==case and r['valid']])==5
        assert len({r['script_sha256'] for r in raw if r['case']==case})==1
    for row in coverage:
        if row['case'].endswith('.latency'):finalcoverage.append(dict(case=row['case'],status=row['status'],formal_included=False,actual=0,valid=0,expected=0,complete_rounds=0,reason=row['reason']))
    csvout(out/'comparison.csv',comparison);csvout(out/'per_condition.csv',detail);csvout(out/'ratios.csv',ratios);csvout(out/'coverage.csv',finalcoverage)
    csvout(out/'aggregate.csv',[{k:v for k,v in r.items() if k not in ['cases','missing','suite_weights','by_suite']} for r in aggregate]);save(out/'aggregate.json',aggregate)
    if flat:csvout(out/'samples.csv',sorted(flat,key=lambda r:r['schedule_index']))
    missing=[s for key,s in planned.items() if key not in unique];save(out/'missing.json',dict(count=len(missing),positions=missing))
    chronology=[{k:r.get(k) for k in ['schedule_index','case','condition','rep','order','N','timestamp','elapsed_ms','elapsed_per_Run_ms','external_wall_ms','child_cpu_ms','valid']} for r in acquired]
    if chronology:csvout(out/'time_order.csv',chronology)
    control=records('environment_control');csvout(out/'numeric_control.csv',[dict(rep=i,internal_ms=r['payload']['elapsed_ms'],external_wall_ms=r['external_wall_ms'],child_cpu_ms=r['child_cpu_ms'],gate=False) for i,r in enumerate(control)])
    for pair in ['M/A','H/A','ON/A','ON/OFF']:plot(out,ratios,pair)
    full=len(raw)==sum(r['valid'] for r in raw)==len(formal_cases)*150 and all(c in complete for c in formal_cases)
    audit=dict(status='COMPLETE_ADMITTED_CASES' if full else 'PARTIAL_WITH_LIMITATIONS',formal_expected=len(formal_cases)*150,formal_actual=len(raw),formal_valid=sum(r['valid'] for r in raw),formal_failed=sum(not r['valid'] for r in raw),base_expected=2400,base_actual=sum(r['case'] in BASE_CASES for r in raw),base_valid=sum(r['valid'] and r['case'] in BASE_CASES for r in raw),formal_missing=len(missing),complete_cases=list(complete),correctness_expected=len(formal_cases)*10,correctness_actual=len(checks),correctness_valid=sum(r['valid'] for r in checks),selected_correctness_expected=len(formal_cases)*5,selected_correctness_actual=len(selected),selected_correctness_valid=sum(r['valid'] for r in selected),pilot_actual=len(pilots),pilot_valid=sum(r['valid'] for r in pilots),formal_below_1000ms=sum(r['valid'] and r['elapsed_ms']<1000 for r in raw),each_condition_each_position_six=bool(schedule),all_120_permutations_claimed=False,serial_nonoverlap=True if acquired else None,boot_ids=sorted({r['boot_id'] for r in raw}),all_outliers_retained=True,bootstrap_replicates=10000,bootstrap_seed=SEED,raw_only=True,runtime_paths_opened=False,old_times_reused=False,official_score=False,identity_after_status=read(HERE/'identity_after.json')['status'] if (HERE/'identity_after.json').exists() else None,switch_sanitizer='NOT_COMPLETED_BUILD_INTERRUPTED (inherited limitation)')
    save(out/'audit.json',audit)
    save(out/'comparison.md',mdtable(['case','status']+[c+' ms/Run (n)' for c in CONDITIONS],[[r['case'],r['status']]+['— (0)' if r[c+'_median_ms'] is None else f'{r[c+"_median_ms"]:.6f} ({r[c+"_n"]})' for c in CONDITIONS] for r in comparison])+'\n')
    print(json.dumps(audit,ensure_ascii=False,indent=2))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);args=p.parse_args();main(args.output)

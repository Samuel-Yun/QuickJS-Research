"""Independent checks of durable raw, order, clock chain and recomputed statistics."""
import collections, csv, itertools, json, math, statistics
from pathlib import Path
import campaign as c

def close(a,b):
    return math.isfinite(float(a)) and math.isclose(float(a),float(b),rel_tol=1e-12,abs_tol=1e-12)

def audit(run):
    errors=[]
    def check(ok,message):
        if not ok:errors.append(message)
    cfg=c.read(run.path/'config.json');m=c.read(run.path/'manifest.json')
    c.verify()
    check(cfg['mode']==c.MODE and cfg['warmup_calls']==0,'mode/warmup contract')
    check(c.read(run.path/'preservation_after.json')==c.read(c.HERE/'preservation_before.json'),'old data preservation')
    for name in ('manifest.json','execution_contract.json','input_manifest.json'):
        check((run.path/name).read_bytes()==(c.HERE/name).read_bytes(),'frozen campaign '+name)
    allrecords={s:run.records(s) for s in ('correctness','calibration','selected_correctness','formal')}
    compatibility=c.read(run.path/'compatibility.json')
    units=[r['case'] for r in compatibility if r['included']]
    check(bool(units),'nonempty compatible intersection')
    check({r['case'] for r in compatibility}==set(run.units),'compatibility covers all candidates')
    selected={u:c.read(run.path/'selected_n'/f'{u}.json') for u in units}
    signatures={};good={};invalid=[]
    for stage,records in allrecords.items():
        good[stage]={}
        for r in records:
            identity=f'{stage}/{r["case"]}/{r["engine"]}/N{r["N"]}/rep{r["rep"]}/attempt{r["attempt"]}'
            e=r['engine'];u=r['case'];n=r['N'];script=Path(r['script_path'])
            check(r['cohort']==m['cohort_id'] and r['mode']==c.MODE and r['stage']==stage,'identity '+identity)
            check(r['binary_sha256']==m['engines'][e]['binary']['sha256'],'binary hash '+identity)
            check(r['flags']==m['engines'][e]['runtime_flags'],'flags '+identity)
            check(r['command']==c.command(e,script),'exact command/no trace '+identity)
            check(r['adapter_sha256']==c.sha(c.HERE/'adapters'/f'{e}.js'),'adapter hash '+identity)
            check(c.sha(script)==r['script_sha256'],'stored script hash '+identity)
            check(script.read_bytes()==run.source(u,n,stage in ('correctness','selected_correctness')),'frozen workload/driver '+identity)
            signature=(u,n,'correctness' if stage in ('correctness','selected_correctness') else 'measure')
            signatures.setdefault(signature,set()).add(r['script_sha256'])
            check(r['warmup_calls']==0 and r['diagnostic_preload'] is False,'no warmup/preload '+identity)
            if not r['valid']:
                invalid.append({'identity':identity,'status':r['status'],'error':r['error']});continue
            key=(u,e,n,r['rep'],r['order'])
            check(key not in good[stage],'duplicate valid position '+identity)
            good[stage][key]=r
            import re
            matches=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)
            check(len(matches)==1 and r['exit_code']==0 and not r['stderr'],'exit/stderr/payload '+identity)
            if len(matches)!=1:continue
            p=json.loads(matches[0])
            for k,v in {'case':u,'benchmark':run.name,'N':n,'correctness':'PASS','timer':'benchNow',
                        'warmup_calls':0,'mode':c.MODE,'phase':'correctness' if stage in ('correctness','selected_correctness') else 'measure'}.items():
                check(p.get(k)==v,'payload '+k+' '+identity)
            check(p.get('checksum')==r['checksum'],'checksum record '+identity)
            if run.name=='SunSpider':check(p['checksum'] in run.checksums[u],'frozen original checksum '+identity)
            else:check(p['suite']==run.unit_info(u)[0] and p['subbenchmark']==run.unit_info(u)[1],'Octane Run identity '+identity)
            if stage in ('calibration','formal'):
                a=p['start_ms'];z=p['stop_ms'];elapsed=p['elapsed_ms'];per=p['elapsed_per_call_ms']
                finite=all(type(v) in (int,float) and math.isfinite(v) for v in (a,z,elapsed,per))
                check(finite,'finite clock '+identity)
                if not finite:continue
                check(elapsed>=0 and (stage!='formal' or elapsed>0),'positive formal interval '+identity)
                check(elapsed==z-a and per==elapsed/n,'unrounded native difference '+identity)
                check(r['elapsed_ms']==elapsed and r['elapsed_per_call_ms']==per,'raw timing equals stdout '+identity)
                check(elapsed<=r['outer_wall_ns']/1e6+5.0 and r['clock_consistency']['pass'] is True,'inner/outer clock chain '+identity)
                check(r['clock_consistency']['inner_minus_outer_ms']==elapsed-r['outer_wall_ns']/1e6,'clock chain raw arithmetic '+identity)
    check(all(len(h)==1 for h in signatures.values()),'byte-identical scripts across all engines')
    for u in run.units:
        for n in (1,2):
            for e in c.ENGINES:
                records=[r for r in allrecords['correctness'] if r['case']==u and r['N']==n and r['engine']==e]
                check(bool(records),'missing N1/2 attempt '+u+'/'+e)
                if u in units:check(sum(r['valid'] for r in records)==1,'N1/2 pass '+u+'/'+e)
    for u in units:
        n=selected[u]['N']
        check(n>0 and n&(n-1)==0 and n<=c.MAX_N,'power-of-two selected '+u)
        x=1
        while x<=n:
            rr=[r for r in good['calibration'].values() if r['case']==u and r['N']==x]
            check(len(rr)==3 and {r['engine'] for r in rr}==set(c.ENGINES),'complete fresh pilot '+u+f'/N{x}')
            if len(rr)==3:
                pass_target=all(r['elapsed_ms']>=1000 for r in rr)
                check(pass_target==(x==n),'first common qualifying N '+u+f'/N{x}')
            x*=2
        for e in c.ENGINES:
            check(sum(r['case']==u and r['engine']==e and r['N']==n for r in good['selected_correctness'].values())==1,'independent selected-N correctness '+u+'/'+e)
    schedule=c.read(run.path/'schedule.json')
    expected={(r['case'],r['engine'],r['rep'],r['order']):r for r in schedule}
    formal=list(good['formal'].values())
    positions={(r['case'],r['engine'],r['rep'],r['order']) for r in formal}
    check(len(expected)==len(schedule)==len(units)*90,'complete nonduplicate schedule')
    check(positions==set(expected),'missing/unexpected formal positions')
    check(len(formal)==len(units)*90,'formal count')
    for r in formal:
        key=(r['case'],r['engine'],r['rep'],r['order']);s=expected.get(key)
        if s:
            for k in ('schedule_index','round_case_position','permutation'):check(r[k]==s[k],'actual schedule '+str(key)+'/'+k)
        check(r['N']==selected[r['case']]['N'],'same selected N '+str(key))
    permutations=set(itertools.permutations(c.ENGINES))
    for u in units:
        rows=[r for r in formal if r['case']==u]
        counts=collections.Counter(tuple(r['permutation']) for r in rows if r['order']==1)
        check(set(counts)==permutations and all(v==5 for v in counts.values()),'six permutations each five '+u)
        for e in c.ENGINES:
            check(collections.Counter(r['order'] for r in rows if r['engine']==e)=={1:10,2:10,3:10},'each position ten '+u+'/'+e)
            check({r['rep'] for r in rows if r['engine']==e}==set(range(1,31)),'each repetition once '+u+'/'+e)
    chronological=sorted(formal,key=lambda r:r['schedule_index'])
    check(all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(chronological,chronological[1:]) if a['boot_id']==b['boot_id']),'monotonic execution chronology; wall timestamps are metadata only')
    medians={};computed={}
    for u in units:
        for e in c.ENGINES:
            x=sorted(r['elapsed_ms']/r['N'] for r in formal if r['case']==u and r['engine']==e)
            if len(x)!=30:continue
            medians[u,e]=statistics.median(x)
            computed[u,e]={'median_ms':statistics.median(x),'mean_ms':sum(x)/len(x),
                'sample_stddev_ms':math.sqrt(sum((v-statistics.mean(x))**2 for v in x)/29),
                'IQR_ms':statistics.median(x[15:])-statistics.median(x[:15]),'min_ms':min(x),'max_ms':max(x)}
    with (run.path/'summary/per_case.csv').open(newline='') as f:
        reported=list(csv.DictReader(f))
    check(len(reported)==len(units)*3,'per-case statistics completeness')
    for r in reported:
        values=computed.get((r['case'],r['engine']),{})
        for k,v in values.items():check(close(r[k],v),'independent statistic '+r['case']+'/'+r['engine']+'/'+k)
    ratios={u:{p:medians[u,a]/medians[u,b] for p,(a,b) in c.PAIRS.items()} for u in units if all((u,e) in medians for e in c.ENGINES)}
    with (run.path/'summary/pairwise.csv').open(newline='') as f:
        pairs=list(csv.DictReader(f))
    check(len(pairs)==len(units),'pairwise completeness')
    for r in pairs:
        for p in c.PAIRS:check(close(r[p],ratios[r['case']][p]),'independent ratio '+r['case']+'/'+p)
    if run.name=='Octane':
        complete=[s for s,bs in c.BENCHMARKS.items() if all(s+'.'+b in ratios for b in bs)]
        aggregate={s:{p:math.prod(ratios[s+'.'+b][p] for b in c.BENCHMARKS[s])**(1/len(c.BENCHMARKS[s])) for p in c.PAIRS} for s in complete}
    else:complete=list(units);aggregate=ratios
    gm={p:math.exp(sum(math.log(aggregate[u][p]) for u in complete)/len(complete)) for p in c.PAIRS} if complete else None
    check(bool(complete),'nonempty complete three-engine aggregation intersection')
    overview=c.read(run.path/'summary/overview.json')
    check(overview['complete_intersection']==complete,'same complete intersection for three GMs')
    if gm:
        for p in gm:check(close(overview['GM'][p],gm[p]),'independent GM '+p)
    result={'status':'PASS' if not errors else 'FAIL','benchmark':run.name,'cohort':m['cohort_id'],'mode':c.MODE,
        'formal_valid':len(formal),'expected_compatible':len(units)*90,'expected_all_candidates':len(run.units)*90,
        'compatible_units':units,'complete_intersection':complete,'GM':gm,
        'initial_correctness_valid':len(good['correctness']),'initial_correctness_expected':len(run.units)*6,
        'selected_correctness_valid':len(good['selected_correctness']),
        'failed_attempts_retained':invalid,'formal_below_pilot_threshold_retained':sum(r['elapsed_ms']<1000 for r in formal),
        'clock_chain_pass_samples':sum(r['clock_consistency']['pass'] for r in formal),
        'max_internal_minus_outer_ms':max((r['clock_consistency']['inner_minus_outer_ms'] for r in formal),default=None),
        'old_data_preserved':c.read(run.path/'preservation_after.json')==c.read(c.HERE/'preservation_before.json'),
        'same_script_all_engines':all(len(h)==1 for h in signatures.values()),
        'statistics_recomputed_from_raw':True,'sample_stddev_dof':29,'IQR_algorithm':'Tukey median of lower15/upper15',
        'errors':errors}
    target=run.path/'summary/audit.json'
    if target.exists() and c.read(target)!=result:target=target.with_name('audit.recheck-'+c.stamp().replace(':','-')+'.json')
    c.save(target,result)
    if result['status']=='PASS':
        from report import write_report
        write_report(run,result,overview)
    return result

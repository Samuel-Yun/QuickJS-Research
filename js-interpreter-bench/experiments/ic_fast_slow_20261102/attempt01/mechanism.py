"""Seven-condition, explicit prepared-feedback mechanism campaign only."""
from common import *
import random,itertools,sys
CASES=['M1.own_integer','M2.own_reference','M4.numeric_control']
CONDS=['A','M','C100','C75','C50','C25','C0']
EXPECTED={'M1.own_integer':12288,'M2.own_reference':4096,'M4.numeric_control':8386560,'M6.poly2':6144}
TARGET={'M1.own_integer':1,'M2.own_reference':2,'M4.numeric_control':0,'M6.poly2':3}
DIR=HERE/'mechanism'
def env_for(case,c):
    return dict(os.environ,QJS_FS_QUOTA=str({'C100':4,'C75':3,'C50':2,'C25':1,'C0':0}.get(c,4)),QJS_FS_TARGET=str(TARGET[case]))
def binary(c,diagnostic=False):
    if c in ['A','M']:return runtime()['artifacts'][c]
    return read(HERE/'control_runtime.json')['C_diag' if diagnostic else 'C']
def script(case,n,phase):
    adapter=(ROOT/'experiments/read_ic_hit_ablation/attempt01/inputs/adapter.js').read_bytes()
    body=(HERE/'cases'/(case+'.js')).read_bytes()
    driver='''
;(function(){
 var N=__N__,last,checksum=0;
 microValidate(microRun());
 if(typeof __icFsBegin==='function')__icFsBegin();
 var start=benchNow();
 for(var iteration=0;iteration<N;iteration++){last=microRun();checksum+=last;}
 var stop=benchNow();
 if(typeof __icFsEnd==='function')__icFsEnd();
 microValidate(last);
 if(checksum!==N*__EXPECTED__)throw Error('checksum');
 console.log('FS_RESULT:'+JSON.stringify({case:__CASE__,N:N,last:last,checksum:checksum,
  elapsed_ms:stop-start,start_ms:start,stop_ms:stop,preparation_calls:1,
  mode:'PREPARED_FEEDBACK_ADOPTION_V1',phase:__PHASE__,correctness:'PASS'}));
})();
'''.replace('__N__',str(n)).replace('__EXPECTED__',str(EXPECTED[case])).replace('__CASE__',json.dumps(case)).replace('__PHASE__',json.dumps(phase))
    p=DIR/'scripts'/case/f'N{n}.{phase}.js';save(p,b'\n;\n'.join([adapter,body,driver.encode()]));return p
def invoke(stage,case,c,n,rep,pos,diag=False):
    path=DIR/'raw'/stage/case/f'{c}.N{n}.rep{rep:02d}.pos{pos}.json'
    if path.exists():return read(path)
    mark=DIR/'started'/stage/case/path.name;assert not mark.exists(),'started position not automatically retried'
    p=script(case,n,stage);a=binary(c,diag);cmd=[a['path'],str(p)]
    frozen=DIR/'frozen.json'
    if stage=='formal':assert boot()==read(frozen)['boot_id'],'GLOBAL_BOOT_CHANGED'
    save(mark,dict(command=cmd,boot_id=boot(),timestamp=stamp()))
    r=capture(cmd,f'{stage} {case} {c}',env=env_for(case,c))
    r.update(case=case,condition=c,N=n,rep=rep,order=pos,script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),
      binary_sha256=a['sha256'],flags=[],mode='PREPARED_FEEDBACK_ADOPTION_V1',stage=stage,
      policy_quota=env_for(case,c)['QJS_FS_QUOTA'],target_kind=TARGET[case],preparation_calls=1,
      valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,failed_reason=None)
    try:
        assert r['boot_id']==r['boot_id_after'],'GLOBAL_BOOT_CHANGED'
        assert r['exit_code']==0 and not r['timeout'],'process'
        if not diag:assert not r['stderr'],'stderr'
        matches=re.findall(r'^FS_RESULT:(.*)$',r['stdout'],re.M);assert len(matches)==1,'payload'
        d=json.loads(matches[0]);assert d['case']==case and d['N']==n and d['checksum']==EXPECTED[case]*n and d['last']==EXPECTED[case],'correctness'
        e=d['elapsed_ms'];assert math.isfinite(e) and 0<=e<=r['external_wall_ms']+5 and d['stop_ms']-d['start_ms']==e,'GLOBAL_TIMER'
        if stage in ['pilot','formal']:assert e>0,'GLOBAL_TIMER_ZERO'
        r.update(valid=True,payload=d,elapsed_ms=e,elapsed_per_Run_ms=e/n,checksum=d['checksum'])
    except (AssertionError,KeyError,ValueError,TypeError) as exc:r['failed_reason']=str(exc)
    save(path,r);print(stage,case,c,n,rep,r['valid'],r['elapsed_ms'],flush=True)
    if not r['valid'] and str(r['failed_reason']).startswith('GLOBAL_'):raise RuntimeError(r['failed_reason'])
    return r
def control_checks():
    c=read(HERE/'control_runtime.json')['C'];base=dict(os.environ,QJS_FS_QUOTA='4',QJS_FS_TARGET='0')
    results=[]
    for i,mode in enumerate(['','5','-1','100','x']):
        r=capture([c['path'],'-e','console.log("SHOULD_NOT_RUN")'],'invalid quota',env=dict(base,QJS_FS_QUOTA=mode))
        save(HERE/'correctness/control_config'/f'invalid_quota_{i}.json',r);assert r['exit_code']!=0 and 'invalid/missing' in r['stderr']
        results.append(dict(quota=mode,rejected=True))
    for mode in ['', '4','x']:
        r=capture([c['path'],'-e','console.log("SHOULD_NOT_RUN")'],'invalid target',env=dict(base,QJS_FS_TARGET=mode))
        save(HERE/'correctness/control_config'/('invalid_target_'+(mode or 'empty')+'.json'),r);assert r['exit_code']!=0
    for case in CASES:
        for n in [1,2]:
            for c in CONDS:assert invoke('correctness',case,c,n,n,CONDS.index(c))['valid']
    diagnostic=[]
    for case in CASES:
        for c in CONDS[2:]:
            r=invoke('diagnostic',case,c,2,0,0,True);assert r['valid']
            ss=re.findall(r'^FS_COUNTS:(.*)$',r['stderr'],re.M);assert len(ss)==1
            d=json.loads(ss[0]);quota=int(env_for(case,c)['QJS_FS_QUOTA']);reads=8192 if TARGET[case] else 0
            assert d['total_target_reads']==d['eligible_shape_matches']==reads
            assert d['offset_reads']==reads*quota//4 and d['forced_normal_lookups']==reads*(4-quota)//4
            assert d['actual_find_own_property_entries']==d['bucket_reads']==d['chain_matches']==d['forced_normal_lookups']
            assert d['true_shape_misses']==d['cache_updates']==d['shape_retains']==d['shape_releases']==0
            assert d['matched_instances']==int(bool(TARGET[case]))
            diagnostic.append(dict(case=case,condition=c,**d))
    # One genuinely alternating-shape diagnostic; NOT an adoption-ratio timing case.
    r=invoke('diagnostic','M6.poly2','C100',2,0,0,True);assert r['valid']
    d=json.loads(re.findall(r'^FS_COUNTS:(.*)$',r['stderr'],re.M)[0])
    assert d['total_target_reads']==d['true_shape_misses']==d['cache_updates']==d['shape_retains']==d['shape_releases']==8192
    assert d['eligible_shape_matches']==d['offset_reads']==d['forced_normal_lookups']==0
    save(DIR/'true_miss.json',d);csvout(DIR/'diagnostic_counts.csv',diagnostic)
    save(HERE/'correctness/control_gate.json',dict(status='PASS',conditions=7,cases=3,N1_N2_records=42,
        independent_diagnostics=15,true_miss_diagnostic=True,invalid_configuration_rejected=True,
        exact_target_source_PC_and_unique_instance=True,preparation_calls=1,full_test262=False))
def balanced(conditions,case,rng):
    result=[]
    while len(result)<30:
        base=conditions.copy();rng.shuffle(base);rotations=list(range(len(base)));rng.shuffle(rotations)
        for k in rotations:
            if len(result)==30:break
            result.append(base[k:]+base[:k])
    for c in conditions:
        counts=[sum(order[p]==c for order in result) for p in range(len(conditions))]
        assert max(counts)-min(counts)<=1
    return result
def campaign():
    pin();assert read(HERE/'correctness/control_gate.json')['status']=='PASS'
    validate_artifacts(list(runtime()['artifacts'].values())+[read(HERE/'control_runtime.json')['C']])
    protocol=dict(conditions=CONDS,cases=CASES,seed=SEED,repetitions=30,prepared_calls=1,
      metric='internal ms per complete 4096-iteration microRun, after one explicit preparation Run',
      quotas=[100,75,50,25,0],controller='one ELF; period4; policy read once at initialization; guard before adoption; no updates on forced lookup',
      Nmax=MAX_N,timeout=TIMEOUT,pilot_per_condition=2,threshold_ms=1000,balance='cyclic rotations, each position4or5; not 5040 permutations',
      target_scope='exact public function debug-source bytes/SHA + PC + x + one compiled instance',
      numeric_control_adoption='N/A: zero target reads',bootstrap='10000 complete same-round condition groups; seed20261102; exploratory linear percentile95')
    save(DIR/'protocol.json',protocol)
    for case in CASES:
        if (DIR/'selected'/(case+'.json')).exists():continue
        rr=[read(p) for p in (DIR/'raw/correctness'/case).glob('*.json')];times=[r['elapsed_per_Run_ms'] for r in rr if r['valid'] and r['elapsed_per_Run_ms']>0]
        n=2**max(0,math.ceil(math.log2(1400/min(times))))
        n=min(n,MAX_N)
        while n<=MAX_N:
            pilot=[invoke('pilot',case,c,n,rep,pos) for rep in range(2) for pos,c in enumerate(CONDS[rep:]+CONDS[:rep])]
            assert all(r['valid'] for r in pilot),'pilot process failed; no automatic retries'
            if min(r['elapsed_ms'] for r in pilot)>=1000:
                checks=[invoke('selected_correctness',case,c,n,0,pos) for pos,c in enumerate(CONDS)]
                assert all(r['valid'] for r in checks)
                save(DIR/'selected'/(case+'.json'),dict(case=case,N=n,pilot_count=14,min_ms=min(r['elapsed_ms'] for r in pilot)));break
            n*=2
        else:raise RuntimeError('N limit '+case)
    rng=random.Random(SEED);orders={case:balanced(CONDS,case,rng) for case in CASES};schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for cp,case in enumerate(cases):
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),rep=rep,case=case,case_position=cp,condition=c,order=pos,N=read(DIR/'selected'/(case+'.json'))['N']))
    save(DIR/'schedule.json',schedule)
    save(DIR/'frozen.json',dict(boot_id=boot(),timestamp=stamp(),target=630,artifacts={c:binary(c) for c in CONDS},
      script_hashes={case:sha(script(case,read(DIR/'selected'/(case+'.json'))['N'],'formal')) for case in CASES},
      schedule_sha256=sha(DIR/'schedule.json'),protocol_sha256=sha(DIR/'protocol.json')))
    ps=subprocess.check_output(['ps','-eo','comm'],text=True);assert not any(x.strip() in ['cc1','cc1plus','collect2','ld','perf','qjs','d8'] for x in ps.splitlines())
    for row in schedule:
        r=invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'])
        assert r['valid'],'failed position saved; no automatic retries'
        if (row['index']+1)%21==0:print('FORMAL_PROGRESS',row['index']+1,'/630',flush=True)
    save(DIR/'collected.json',dict(actual=630,boot_id=boot(),timestamp=stamp()))
    print('MECHANISM_COLLECTED 630',flush=True)
if __name__=='__main__':
    if sys.argv[1]=='checks':control_checks()
    elif sys.argv[1]=='campaign':campaign()

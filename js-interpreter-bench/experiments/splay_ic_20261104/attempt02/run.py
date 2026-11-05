"""Serial new campaigns; no old queues. Entry: checks | mechanism | octane | replication.
Build artifacts and diagnostics are independent of frozen A/M/V8.
"""
from common import *
import argparse,importlib.util,itertools,random,sys
sys.path.append(str(PREV))
spec=importlib.util.spec_from_file_location('public_prior_benchmark',PREV/'benchmark.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
base.HERE=HERE
BUILD='build04'
CASES=['Splay.Splay','M4.numeric_control']

def builds():return read(HERE/'builds'/BUILD/'manifest.json')

class Campaign(base.Campaign):
    def __init__(self,family):
        self.family=family;self.kind='octane';self.dir=HERE/family
        self.conditions=['A','M','C_ON','C_OFF'] if family=='mechanism' else ['A','M'] if family=='replication' else ['A','M','V8_ON']
        self.artifacts=runtime()['artifacts'].copy()
        if family=='mechanism':self.artifacts.update(C_ON=builds()['C'],C_OFF=builds()['C'])
        self.inputs=[];self.blocked={};self.octane_inputs()
        if family!='octane':
            self.cases=CASES.copy()
            self.inputs.append(base.freeze_input(self.dir/'inputs/M4.numeric_control.js',PREV/'cases/M4.numeric_control.js'))
        self.hashes={x['path']:x['sha256'] for x in self.inputs}
        self.identity_files=[Path(self.artifacts[c]['path']) for c in self.conditions]+[Path(x['path']) for x in runtime()['dependencies']]+[HERE/p for p in self.hashes]
        self.file_stats={str(p):(p.stat().st_size,p.stat().st_mtime_ns,p.stat().st_ino) for p in self.identity_files}
    def script(self,case,n,phase):
        old=self.kind;self.kind='micro' if case.startswith('M4.') else 'octane'
        try:p=super().script(case,n,phase)
        finally:self.kind=old
        if self.family!='mechanism':return p
        dest=self.dir/'control_scripts'/case/f'N{n}.{phase}.js'
        s=p.read_text();target='microRun' if case.startswith('M4.') else 'SplayTree.prototype.splay_';expected=0 if case.startswith('M4.') else 3
        hook='if(typeof __spControl==="function"){if(__spControl('+target+')!=='+str(expected)+'||__spControl('+target+')!=='+str(expected)+')throw Error("control/idempotence");}\n'
        anchor='var start=benchNow();' if case.startswith('M4.') else '  var started=now();'
        s=one(s,anchor,hook+anchor);save(dest,s);return dest
    def invoke(self,stage,case,c,n,rep,pos,artifact=None,diagnostic=False):
        dest=self.dir/'raw'/stage/case/f'{c}.N{n}.rep{rep:02d}.pos{pos}.json'
        if dest.exists():return read(dest)
        script=self.script(case,n,stage);art=artifact or self.artifacts[c]
        if diagnostic:
            s=script.read_text()
            if case.startswith('M4.'):
                s=one(s,'var start=benchNow();','__spStage(2);var start=benchNow();');s=one(s,'var stop=benchNow();','var stop=benchNow();__spStage(3);')
            else:
                s=one(s,"  if(suite.name!=='Crypto')",'  __spStage(1);\n  if(suite.name!==\'Crypto\')')
                s=one(s,'  var started=now();','  __spStage(2);\n  var started=now();');s=one(s,'  var stopped=now();','  var stopped=now();\n  __spStage(3);');s=one(s,'  test.TearDown();','  __spStage(4);\n  test.TearDown();')
            script=self.dir/'diagnostic_scripts'/case/f'N{n}.js';save(script,s)
        cmd=[art['path']]+(runtime()['v8_flags'] if c=='V8_ON' else ['--std','-I',str(self.dir/'inputs/zlib_read.js')] if case=='zlib.zlib' else [])+[str(script)]
        if stage=='formal':assert boot()==read(self.dir/'frozen.json')['boot_id'],'GLOBAL_BOOT_CHANGED';self.verify_metadata()
        marker=self.dir/'started'/stage/case/dest.name
        assert not marker.exists(),'orphaned position; preserve and investigate, no automatic retry'
        env=dict(os.environ,SP_DISABLE='1' if c=='C_OFF' else '0')
        report=STORE/'reports'/self.family/(stage+'.'+case+'.'+c+f'.N{n}.json')
        if diagnostic:report.parent.mkdir(parents=True,exist_ok=True);assert not report.exists();env['IC_MECHANISM_REPORT']=str(report)
        save(marker,dict(command=cmd,boot_id=boot(),timestamp=stamp(),binary_sha256=art['sha256'],script_sha256=sha(script)))
        r=capture(cmd,self.family+'/'+stage+'/'+case+'/'+c,env=env,timeout=TIMEOUT)
        r.update(case=case,condition=c,N=n,repetitions=n,rep=rep,order=pos,stage=stage,flags=cmd[1:-1],
          script_relative=script.relative_to(HERE).as_posix(),script_sha256=sha(script),binary_sha256=art['sha256'],
          environment_control=env['SP_DISABLE'] if c.startswith('C_') else None,
          mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC',performance_sample=stage=='formal',valid=False,
          elapsed_ms=None,elapsed_per_Run_ms=None,failed_reason=None,warmup_calls=0,input_sha256=self.hashes)
        try:
            assert r['exit_code']==0 and not r['stderr'] and not r['timeout'],'process/engine stderr'
            assert r['boot_id']==r['boot_id_after'],'GLOBAL_BOOT_CHANGED'
            pattern='MICRO_RESULT:' if case.startswith('M4.') else 'OCTANE_IC_RESULT:'
            lines=[s[len(pattern):] for s in r['stdout'].splitlines() if s.startswith(pattern)];assert len(lines)==1,'payload'
            d=json.loads(lines[0]);assert d['N']==n and d['case']==case and d['correctness']=='PASS' and d['warmup_calls']==0,'correctness'
            if case.startswith('M4.'):assert d['checksum']==n*8386560,'numeric checksum'
            if case.startswith('Crypto.'):
                golden=self.dir/'crypto'/f'{case}.N{n}.json';assert golden.exists(),'missing frozen Crypto oracle'
                assert d['checksum']==read(golden)['final_ciphertext'],'Crypto ciphertext'
            e=d['elapsed_ms'];assert math.isfinite(e) and 0<=e<=r['external_wall_ms']+5 and d['stop_ms']-d['start_ms']==e,'GLOBAL_TIMER'
            if stage in ['pilot','formal']:assert e>0,'GLOBAL_TIMER_ZERO'
            r.update(valid=True,payload=d,elapsed_ms=e,elapsed_per_Run_ms=e/n,checksum=d.get('checksum'))
        except (AssertionError,KeyError,ValueError,TypeError) as exc:r['failed_reason']=str(exc)
        save(dest,r)
        if diagnostic and report.exists():save(dest.with_suffix('.counters.json'),report.read_bytes())
        print(self.family,stage,case,c,n,rep,r['valid'],r['elapsed_ms'],flush=True)
        assert r['valid'],'saved failed position '+str(dest)
        return r
    def input_identity(self,case,n):
        if not case.startswith('Crypto.'):return
        import crypto_reuse
        assert crypto_reuse.validate(self,case,n)
    def run(self):
        pin()
        assert read(HERE/'mechanism/gate.json')['status']=='PASS'
        if self.family=='octane':assert read(HERE/'choice.json')['implemented'] is False
        if self.family=='replication':assert read(HERE/'octane/collected.json')['actual']==1530
        self.verify();save(self.dir/'inputs.json',dict(files=self.inputs))
        save(self.dir/'protocol.json',dict(conditions=self.conditions,cases=self.cases,seed=SEED,repetitions=30,first_Run_included=True,workload_warmup_calls=0,
            threshold_ms=1000,pilot_margin_ms=1100,pilot_per_condition=3,max_N=MAX_N,timeout=TIMEOUT,
            balance='3: all six permutations five times; 2: both orders15 times; 4: cyclic positions 7/8',
            failures='stop, preserve invalid/orphan records; no retry or cross-boot patching',
            metric='internal native monotonic ms per complete Run',bootstrap='10000 paired rounds seed20261104 exploratory',
            aggregation='core16/13suite and expanded17/14suite equal suites' if self.family=='octane' else 'none'))
        for case in self.cases:
            for n in [1,2]:
                self.input_identity(case,n)
                for pos,c in enumerate(self.conditions):self.invoke('correctness',case,c,n,n,pos)
        for case in self.cases:
            dest=self.dir/'selected'/(case+'.json')
            if dest.exists():continue
            old=PREV/('micro' if case.startswith('M4.') else 'octane')/'selected'/(case+'.json')
            n=read(old)['N'] if old.exists() else 1
            while n<=MAX_N:
                self.input_identity(case,n)
                pilots=[self.invoke('pilot',case,c,n,k,pos) for k in range(3) for pos,c in enumerate(self.conditions[k%len(self.conditions):]+self.conditions[:k%len(self.conditions)])]
                if min(r['elapsed_ms'] for r in pilots)>=1100:
                    for pos,c in enumerate(self.conditions):self.invoke('selected_correctness',case,c,n,0,pos)
                    save(dest,dict(case=case,N=n,pilot_count=len(pilots),min_pilot_ms=min(r['elapsed_ms'] for r in pilots)));break
                n*=2
            else:raise RuntimeError('N max '+case)
        rng=random.Random(SEED);orders={}
        for case in self.cases:
            cs=self.conditions
            if len(cs)==3:seq=list(itertools.permutations(cs))*5;rng.shuffle(seq)
            elif len(cs)==2:seq=[cs,cs[::-1]]*15;rng.shuffle(seq)
            else:seq=base.balanced(cs,case,rng)
            orders[case]=seq
        schedule=[]
        for rep in range(30):
            cases=self.cases.copy();rng.shuffle(cases)
            for cp,case in enumerate(cases):
                for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,case_position=cp,N=read(self.dir/'selected'/(case+'.json'))['N']))
        save(self.dir/'schedule.json',schedule);self.verify()
        save(self.dir/'frozen.json',dict(timestamp=stamp(),boot_id=boot(),target=len(schedule),artifacts={c:self.artifacts[c] for c in self.conditions},
             dependencies=runtime()['dependencies'],script_hashes={case:sha(self.script(case,read(self.dir/'selected'/(case+'.json'))['N'],'formal')) for case in self.cases},
             schedule_sha256=sha(self.dir/'schedule.json'),runner_sha256=sha(Path(__file__)),input_sha256=self.hashes))
        for row in schedule:
            self.invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'])
            if (row['index']+1)%(len(self.conditions)*len(self.cases))==0:print('FORMAL_PROGRESS',self.family,row['index']+1,'/',len(schedule),flush=True)
        self.verify();save(self.dir/'collected.json',dict(actual=len(schedule),expected=len(schedule),boot_id=boot(),timestamp=stamp()))

def checks():
    pin();c=Campaign('mechanism')
    for case in CASES:
        for n in [1,2]:
            for pos,condition in enumerate(c.conditions):c.invoke('correctness',case,condition,n,n,pos)
    rows=[]
    for n in [1,2]:
        for condition,key in [('M','M_light'),('C_ON','C_light'),('C_OFF','C_light')]:
            r=c.invoke('light_diagnostic','Splay.Splay',condition,n,0,0,artifact=builds()[key],diagnostic=True)
            p=c.dir/'raw/light_diagnostic/Splay.Splay'/f'{condition}.N{n}.rep00.pos0.counters.json';d=read(p)
            assert d['target_instances']==1 and d['shape_birth_overflow']==0
            run=d['phases'][2];ss=run['sites'];assert all(s['unknown_events']==s['overflow_events']==0 for s in d['shape_focus'])
            assert run['reads']['ic_queries']==run['reads']['hits']+run['reads']['misses']
            if n==2 and condition in ['M','C_ON']:
                assert [s['operations'] for s in ss]==[4608,2676,2356]
                assert [s['hits'] for s in ss]==[2432,1347,1209]
                assert [s['replacements'] for s in ss]==[2176,1329,1147]
                assert run['reads']['operations']==45664 and run['reads']['hits']==23001 and run['reads']['replacements']==18324
            if condition=='C_OFF':
                assert all(s['operations']>0 and s['ic_queries']==s['updates']==s['hits']==0 and s['find_normal']==s['operations'] for s in ss)
            rows.append(dict(condition=condition,N=n,**run['reads']))
    csvout(HERE/'mechanism/diagnostic_summary.csv',rows)
    save(HERE/'mechanism/gate.json',dict(status='PASS',correctness_processes=16,independent_diagnostic_processes=6,
      source_exact=True,opcode_start_and_operand_validation=True,repeated_configuration_checks_per_process=2,
      restore_sites=[43,138,147],restore_opcode='get_field; all three actual sites consume receiver; get_field2 rejected',
      OFF_actual_ordinary_find_verified=True,ON_counts_match_prior=True,controller_same_ELF=True,same_JS=True,
      formal_warmup_calls=0,first_Run_included=True,full_test262=False))
    print('CONTROL_AND_LIGHT_GATES_PASS',flush=True)

if __name__=='__main__':
    assert not (HERE/'STOP_EXECUTION').exists(), 'execution stopped: preserve this attempt and investigate with a new revision; do not restart its queues/campaign'
    parser=argparse.ArgumentParser();parser.add_argument('stage',choices=['checks','mechanism','octane','replication']);a=parser.parse_args()
    checks() if a.stage=='checks' else Campaign(a.stage).run()

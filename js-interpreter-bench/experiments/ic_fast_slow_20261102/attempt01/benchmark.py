"""Separate first-call-inclusive campaigns. Serial fresh children, immutable raw.

python3 benchmark.py sunspider|micro|octane
Requires a successful U correctness gate; never runs the controller ELF.
"""
from common import *
import ast,random,sys,shutil
from mechanism import balanced,EXPECTED,CASES as MICRO_CASES
E=ROOT/'experiments/v8_inspired_ic/attempt03'
def mapping(path,name):
    tree=ast.parse(path.read_text(encoding='utf-8'))
    for n in tree.body:
        if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id==name for t in n.targets):return ast.literal_eval(n.value)
    raise KeyError(name)
def freeze_input(dest,source,expected=None):
    if expected:assert sha(source)==expected,'input identity '+str(source)
    save(dest,source.read_bytes());return dict(path=dest.relative_to(HERE).as_posix(),sha256=sha(dest),source=source.relative_to(ROOT).as_posix())
class Campaign:
    def __init__(self,kind):
        self.kind=kind;self.dir=HERE/kind
        self.conditions=['A','M','U']+([] if kind=='micro' else ['V8_ON'])
        self.artifacts=runtime()['artifacts']|{'U':read(HERE/'U_runtime.json')['U']}
        self.inputs=[];self.blocked={}
        if kind=='sunspider':self.sun_inputs()
        elif kind=='octane':self.octane_inputs()
        else:
            self.cases=MICRO_CASES
            for c in self.cases:self.inputs.append(freeze_input(self.dir/'inputs'/(c+'.js'),HERE/'cases'/(c+'.js')))
        self.hashes={x['path']:x['sha256'] for x in self.inputs}
        self.identity_files=[Path(x['path']) for x in self.artifacts.values()]+[Path(x['path']) for x in runtime()['dependencies']]+[HERE/p for p in self.hashes]
        self.file_stats={str(p):(p.stat().st_size,p.stat().st_mtime_ns,p.stat().st_ino) for p in self.identity_files}
    def sun_inputs(self):
        source=ROOT/'scripts/run_sunspider.py';self.cases=list(mapping(source,'TESTS'))
        self.expressions=mapping(ROOT/'experiments/frontend_isolation/run_repeated_mode.py','CHECKSUM')
        manifest=ROOT/'benchmarks/sunspider/SHA256SUMS.standalone.txt'
        assert sha(manifest)=='e383efe54a39e8c18010135390ce2fc98c2618f55bc5078f43fc45c3a8ef98fd'
        hashes={line.split(maxsplit=1)[1].lstrip('*'):line.split()[0] for line in manifest.read_text().splitlines() if line.strip()}
        for c in self.cases:
            source=ROOT/'benchmarks/sunspider/standalone/sunspider-1.0.2'/(c+'.js')
            h=hashes.get(c+'.js') or hashes.get('./'+c+'.js');assert h
            self.inputs.append(freeze_input(self.dir/'inputs'/(c+'.js'),source,h))
        oracle=ROOT/'experiments/frontend_isolation/correctness/repeated.csv'
        assert sha(oracle)=='88c6f0f2725b38f7cde5b15b1b76577f2fcef18aa902eb051780414766157443'
        self.allowed={c:set() for c in self.cases}
        for r in csv.DictReader(oracle.open(encoding='utf-8',newline='')):
            if r['valid']=='True':
                assert r['stdout'].startswith('CHECKSUM=');self.allowed[r['test']].add(r['stdout'][9:].strip())
        self.allowed={c:sorted(v) for c,v in self.allowed.items()};assert all(self.allowed.values())
        save(self.dir/'checksum_contract.json',dict(expressions=self.expressions,allowed=self.allowed,oracle_sha256=sha(oracle),no_new_tolerance=True))
        self.inputs.append(freeze_input(self.dir/'inputs/driver.js',ROOT/'experiments/timer_recovery/drivers/sunspider.js'))
        self.inputs.append(freeze_input(self.dir/'inputs/adapter.js',ROOT/'experiments/read_ic_hit_ablation/attempt01/inputs/adapter.js'))
    def octane_inputs(self):
        self.catalog=read(E/'case_catalog.json');self.cases=[r['case'] for r in self.catalog if r['suite']!='Box2D']
        assert len(self.cases)==17
        save(self.dir/'case_catalog.json',self.catalog)
        for row in read(E/'inputs.json')['files']:
            src=E/row['frozen'];expected=row['LF_sha256']
            self.inputs.append(freeze_input(self.dir/row['frozen'],src,expected))
        for f in ['adapter.js','driver.js','crypto_preload.js','zlib_read.js']:
            key={'adapter.js':'adapter_sha256','driver.js':'driver_sha256','crypto_preload.js':'crypto_preload_sha256','zlib_read.js':'zlib_qjs_host_adapter_sha256'}[f]
            self.inputs.append(freeze_input(self.dir/'inputs'/f,E/'inputs'/f,read(E/'inputs.json')[key]))
    def command(self,c,case,p):
        a=self.artifacts[c];cmd=[a['path']]
        if c=='V8_ON':cmd+=runtime()['v8_flags']
        elif case=='zlib.zlib':cmd+=['--std','-I',str(self.dir/'inputs/zlib_read.js')]
        return cmd+[str(p)]
    def script(self,case,n,phase):
        config=dict(case=case,N=n,phase=phase)
        if self.kind=='sunspider':
            parts=[(self.dir/'inputs/adapter.js').read_bytes(),b'function __tebSunSpiderWorkload(){\n'+(self.dir/'inputs'/(case+'.js')).read_bytes()+('\nreturn String('+self.expressions[case]+');\n}').encode()]
            driver=(self.dir/'inputs/driver.js').read_text().replace('__CONFIG__',json.dumps(config)).replace('__CHECKSUMS__',json.dumps(self.allowed[case]));parts.append(driver.encode())
        elif self.kind=='octane':
            row=next(r for r in self.catalog if r['case']==case)
            parts=[(self.dir/'inputs/adapter.js').read_bytes()]
            if row['suite']=='Crypto':parts.append((self.dir/'inputs/crypto_preload.js').read_bytes())
            parts.extend((self.dir/'inputs/octane'/f).read_bytes() for f in row['files'])
            driver=(self.dir/'inputs/driver.js').read_text().replace('__CONFIG__',json.dumps(config)).replace('__SUITE__',json.dumps(row['suite'])).replace('__INDEX__',str(row['index'])).replace('__BENCHMARK__',json.dumps(row['benchmark']));parts.append(driver.encode())
        else:
            parts=[(ROOT/'experiments/read_ic_hit_ablation/attempt01/inputs/adapter.js').read_bytes(),(self.dir/'inputs'/(case+'.js')).read_bytes()]
            driver=''';(function(){var config=__CONFIG__,last,checksum=0;
var start=benchNow();for(var k=0;k<config.N;k++){last=microRun();checksum+=last;}var stop=benchNow();
microValidate(last);if(checksum!==config.N*__EXPECTED__)throw Error('checksum');
console.log('MICRO_RESULT:'+JSON.stringify({case:config.case,N:config.N,checksum:checksum,last:last,
mode:'FIRST_CALL_INCLUSIVE_MICRO_V1',phase:config.phase,correctness:'PASS',warmup_calls:0,start_ms:start,stop_ms:stop,elapsed_ms:stop-start}));})();'''
            parts.append(driver.replace('__CONFIG__',json.dumps(config)).replace('__EXPECTED__',str(EXPECTED[case])).encode())
        p=self.dir/'scripts'/case/f'N{n}.{phase}.js';save(p,b'\n;\n'.join(parts));return p
    def verify(self):
        validate_artifacts([self.artifacts[c] for c in self.conditions]+runtime()['dependencies'])
        for path,h in self.hashes.items():assert sha(HERE/path)==h,'GLOBAL_INPUT_CHANGED'
    def verify_metadata(self):
        for p in self.identity_files:
            assert (p.stat().st_size,p.stat().st_mtime_ns,p.stat().st_ino)==self.file_stats[str(p)],'GLOBAL_ARTIFACT_METADATA_CHANGED '+str(p)
    def invoke(self,stage,case,c,n,rep,pos):
        p=self.dir/'raw'/stage/case/f'{c}.N{n}.rep{rep:02d}.pos{pos}.json'
        if p.exists():return read(p)
        mark=self.dir/'started'/stage/case/p.name;assert not mark.exists(),'orphaned position, never automatically retried'
        script=self.script(case,n,stage);command=self.command(c,case,script)
        if stage=='formal':
            assert boot()==read(self.dir/'frozen.json')['boot_id'],'GLOBAL_BOOT_CHANGED';self.verify_metadata()
        save(mark,dict(boot_id=boot(),command=command,timestamp=stamp()))
        r=capture(command,f'{self.kind}/{stage}/{case}/{c}',cwd=ROOT)
        r.update(case=case,condition=c,N=n,rep=rep,order=pos,stage=stage,
          script_relative=script.relative_to(HERE).as_posix(),script_sha256=sha(script),binary_sha256=self.artifacts[c]['sha256'],
          flags=runtime()['v8_flags'] if c=='V8_ON' else (['--std','-I','inputs/zlib_read.js'] if case=='zlib.zlib' else []),
          mode={'sunspider':'MAIN_MONOTONIC_V1','octane':'USE_IC_OCTANE_FIRST_CALL_INCLUSIVE_V1','micro':'FIRST_CALL_INCLUSIVE_MICRO_V1'}[self.kind],
          valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,failed_reason=None,warmup_calls=0,input_sha256=self.hashes,dependency_hashes=runtime()['dependencies'] if c=='V8_ON' else [])
        try:
            assert r['boot_id']==r['boot_id_after'],'GLOBAL_BOOT_CHANGED'
            assert r['exit_code']==0 and not r['timeout'],'process'
            assert not r['stderr'],'stderr'
            pattern={'sunspider':'TEB_RESULT:','octane':'OCTANE_IC_RESULT:','micro':'MICRO_RESULT:'}[self.kind]
            lines=[s[len(pattern):] for s in r['stdout'].splitlines() if s.startswith(pattern)];assert len(lines)==1,'payload'
            d=json.loads(lines[0]);assert d['case']==case and d['N']==n and d['correctness']=='PASS' and d['warmup_calls']==0,'correctness'
            if self.kind=='sunspider':assert d['checksum'] in self.allowed[case],'checksum'
            if self.kind=='micro':assert d['checksum']==EXPECTED[case]*n,'checksum'
            if case.startswith('Crypto.'):
                golden=self.dir/'crypto'/f'{case}.N{n}.json'
                if golden.exists():assert d['checksum']==read(golden)['final_ciphertext'],'crypto ciphertext'
            e=d['elapsed_ms']
            if e is not None:
                assert math.isfinite(e) and 0<=e<=r['external_wall_ms']+5 and d['stop_ms']-d['start_ms']==e,'GLOBAL_TIMER'
                if stage in ['pilot','formal']:assert e>0,'GLOBAL_TIMER_ZERO'
            r.update(valid=True,payload=d,elapsed_ms=e,elapsed_per_Run_ms=e/n if e is not None else None,checksum=d.get('checksum'))
        except (AssertionError,KeyError,ValueError,TypeError) as exc:r['failed_reason']=str(exc)
        save(p,r);print(self.kind,stage,case,c,'N='+str(n),'rep='+str(rep),r['valid'],r['elapsed_ms'],flush=True)
        if not r['valid'] and str(r['failed_reason']).startswith('GLOBAL_'):raise RuntimeError(r['failed_reason'])
        return r
    def input_identity(self,case,n):
        if not case.startswith('Crypto.'):return
        import crypto_reuse
        assert crypto_reuse.validate(self,case,n),'crypto input identity'
    def run(self):
        pin();assert read(HERE/'correctness/U_gate.json')['status']=='PASS'
        self.verify();save(self.dir/'inputs.json',dict(files=self.inputs))
        protocol=dict(conditions=self.conditions,cases=self.cases,seed=SEED,repetitions=30,threshold_ms=1000,pilot_per_condition=2,
          max_N=MAX_N,timeout=TIMEOUT,first_Run_included=True,workload_warmup_calls=0,metric='internal native monotonic ms per complete Run',
          balance='cyclic rotations; 4conditions each position7or8, 3conditions10; not all permutations',
          failures='record once, no automatic retry, invalid case excluded with reason; global identity/timer violation stops',
          aggregate='all26 equal cases' if self.kind=='sunspider' else 'core16/13suite and expanded17/14suite, within-suite GM then equal suites, includes fixed Crypto' if self.kind=='octane' else 'none',
          bootstrap='10000 complete same-round groups; global shared complete-round blocks; seed20261102; linear percentile95; exploratory unadjusted')
        save(self.dir/'protocol.json',protocol)
        for case in self.cases:
            for n in [1,2]:
                self.input_identity(case,n)
                for pos,c in enumerate(self.conditions):
                    if not self.invoke('correctness',case,c,n,n,pos)['valid']:self.blocked[case]='N1/N2 correctness failure'
        if self.kind=='octane':
            coverage=[self.invoke('coverage','Box2D.Box2D',c,1,0,p) for p,c in enumerate(self.conditions)]
            save(self.dir/'Box2D_coverage.json',dict(status='RUNS_NO_TRUSTED_OUTPUT_GATE' if all(r['valid'] for r in coverage) else 'FAIL',formal_included=False,latency_included=False))
        for case in self.cases:
            if case in self.blocked:continue
            dest=self.dir/'selected'/(case+'.json')
            if dest.exists():continue
            if self.kind=='sunspider':
                estimates=[self.invoke('estimate',case,c,2,0,p) for p,c in enumerate(self.conditions)]
            else:
                estimates=[read(p) for p in (self.dir/'raw/correctness'/case).glob('*.json')]
            if not all(r['valid'] for r in estimates):self.blocked[case]='estimate failure';continue
            unit=[r['elapsed_per_Run_ms'] for r in estimates if r['elapsed_per_Run_ms'] and r['elapsed_per_Run_ms']>0]
            assert unit,'no estimate time'
            n=min(MAX_N,2**max(0,math.ceil(math.log2(1350/min(unit)))))
            while n<=MAX_N:
                pilot=[self.invoke('pilot',case,c,n,rep,pos) for rep in range(2) for pos,c in enumerate(self.conditions[rep:]+self.conditions[:rep])]
                if not all(r['valid'] for r in pilot):self.blocked[case]='pilot process failure';break
                if min(r['elapsed_ms'] for r in pilot)>=1000:
                    self.input_identity(case,n)
                    checks=[self.invoke('selected_correctness',case,c,n,0,pos) for pos,c in enumerate(self.conditions)]
                    if not all(r['valid'] for r in checks):self.blocked[case]='selected correctness failure';break
                    save(dest,dict(case=case,N=n,pilot_count=len(pilot),min_pilot_ms=min(r['elapsed_ms'] for r in pilot)));break
                n*=2
            else:self.blocked[case]='Nmax exceeded'
        save(self.dir/'blocked_cases.json',self.blocked)
        rng=random.Random(SEED);orders={case:balanced(self.conditions,case,rng) for case in self.cases};schedule=[]
        for rep in range(30):
            cases=self.cases.copy();rng.shuffle(cases)
            for cp,case in enumerate(cases):
                if case in self.blocked:continue
                for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,case_position=cp,N=read(self.dir/'selected'/(case+'.json'))['N']))
        save(self.dir/'schedule.json',schedule);self.verify()
        save(self.dir/'frozen.json',dict(boot_id=boot(),timestamp=stamp(),target=len(self.cases)*len(self.conditions)*30,
            schedule_count=len(schedule),artifacts={c:self.artifacts[c] for c in self.conditions},dependencies=runtime()['dependencies'],
            script_hashes={c:sha(self.script(c,read(self.dir/'selected'/(c+'.json'))['N'],'formal')) for c in self.cases if c not in self.blocked},
            input_sha256=self.hashes,protocol_sha256=sha(self.dir/'protocol.json'),schedule_sha256=sha(self.dir/'schedule.json'),runner_sha256=sha(Path(__file__)),
            identity_check='full SHA256 before/after campaign; size/mtime_ns/inode before every formal child',file_stats=self.file_stats))
        for row in schedule:
            self.invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'])
            if (row['index']+1)%(len(self.conditions)*len(self.cases))==0:print('FORMAL_PROGRESS',self.kind,row['index']+1,'/',len(schedule),flush=True)
        self.verify();save(self.dir/'collected.json',dict(actual=len(schedule),target=len(self.cases)*len(self.conditions)*30,boot_id=boot(),timestamp=stamp()))
        print('COLLECTED',self.kind,len(schedule),flush=True)
if __name__=='__main__':Campaign(sys.argv[1]).run()

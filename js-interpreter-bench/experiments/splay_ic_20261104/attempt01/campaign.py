"""Frozen public workload/driver reuse, serial paired fresh-process campaigns."""
from common import *
import importlib.util,random,itertools,sys
sys.path.append(str(PREV))
spec=importlib.util.spec_from_file_location('prior_campaign',PREV/'benchmark.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
base.HERE=HERE
def inherited_save(path,value):
    if isinstance(value,dict) and 'condition' in value and 'N' in value:value=dict(value,repetitions=value['N'])
    save(path,value)
base.save=inherited_save
class Campaign(base.Campaign):
    def __init__(self,kind):
        self.kind=kind;self.dir=HERE/kind
        choice=read(HERE/'choice.json');self.conditions=['A','M']+(['OPT'] if choice['implemented'] else [])+([] if kind in ['micro','replication'] else ['V8_ON'])
        self.artifacts=runtime()['artifacts'].copy()
        if choice['implemented']:self.artifacts['OPT']=read(HERE/'OPT_runtime.json')['OPT']
        self.inputs=[];self.blocked={}
        if kind=='sunspider':self.sun_inputs()
        elif kind=='octane':self.octane_inputs()
        else:
            self.cases=base.MICRO_CASES if kind=='micro' else ['Richards.Richards','Splay.Splay','M4.numeric_control']
            if kind=='replication':
                self.octane_inputs();self.cases=['Richards.Richards','Splay.Splay','M4.numeric_control']
            for c in base.MICRO_CASES:
                self.inputs.append(base.freeze_input(self.dir/'inputs'/(c+'.js'),PREV/'cases'/(c+'.js')))
        self.hashes={x['path']:x['sha256'] for x in self.inputs}
        self.identity_files=[Path(self.artifacts[c]['path']) for c in self.conditions]+[Path(x['path']) for x in runtime()['dependencies']]+[HERE/p for p in self.hashes]
        self.file_stats={str(p):(p.stat().st_size,p.stat().st_mtime_ns,p.stat().st_ino) for p in self.identity_files}
    def script(self,case,n,phase):
        # Replication chooses one of the unchanged Octane/micro scripts; never changes their algorithms.
        original=self.kind
        if original=='replication':self.kind='micro' if case.startswith('M4.') else 'octane'
        try:return super().script(case,n,phase)
        finally:self.kind=original
    def invoke(self,stage,case,c,n,rep,pos):
        original=self.kind
        if original=='replication':self.kind='micro' if case.startswith('M4.') else 'octane'
        try:return super().invoke(stage,case,c,n,rep,pos)
        finally:self.kind=original
    def run(self):
        pin();self.verify()
        choice=read(HERE/'choice.json')
        if choice['implemented']:assert read(HERE/'correctness/OPT_gate.json')['status']=='PASS'
        save(self.dir/'inputs.json',dict(files=self.inputs))
        protocol=dict(conditions=self.conditions,cases=self.cases,seed=SEED,repetitions=30,threshold_ms=1000,pilot_per_condition=3,
          pilot_margin_ms=1050,max_N=MAX_N,timeout=TIMEOUT,first_Run_included=True,workload_warmup_calls=0,
          metric='internal native monotonic ms per complete Run',
          balance='3 conditions: six permutations five each; 4: balanced cyclic blocks positions7/8; 2: each order15',
          failures='write once; no automatic retry; invalid samples retained; stop campaign on process/correctness/identity failure',
          aggregate='core16/13suite and expanded17/14suite' if self.kind=='octane' else 'all26 equal cases' if self.kind=='sunspider' else 'none',
          bootstrap='10000 complete paired groups, seed20261104, exploratory linear percentile95, shared global rounds',
          calibration='previous fixed N only a starting estimate; three new independent pilots per condition; double N if margin fails')
        save(self.dir/'protocol.json',protocol)
        for case in self.cases:
            for n in [1,2]:
                self.input_identity(case,n)
                for pos,c in enumerate(self.conditions):assert self.invoke('correctness',case,c,n,n,pos)['valid']
        for case in self.cases:
            dest=self.dir/'selected'/(case+'.json')
            if dest.exists():continue
            oldkind='micro' if case.startswith('M') else 'octane' if self.kind=='replication' else self.kind
            old=PREV/oldkind/'selected'/(case+'.json')
            n=read(old)['N'] if old.exists() else 1
            while n<=MAX_N:
                pilot=[self.invoke('pilot',case,c,n,rep,pos) for rep in range(3) for pos,c in enumerate(self.conditions[rep%len(self.conditions):]+self.conditions[:rep%len(self.conditions)])]
                assert all(r['valid'] for r in pilot),'pilot failure retained'
                if min(r['elapsed_ms'] for r in pilot)>=1050:
                    self.input_identity(case,n)
                    checks=[self.invoke('selected_correctness',case,c,n,0,pos) for pos,c in enumerate(self.conditions)]
                    assert all(r['valid'] for r in checks)
                    save(dest,dict(case=case,N=n,pilot_count=len(pilot),min_pilot_ms=min(r['elapsed_ms'] for r in pilot)));break
                n*=2
            else:raise RuntimeError('calibration exceeded Nmax '+case)
        rng=random.Random(SEED);orders={}
        for case in self.cases:
            if len(self.conditions)==3:
                seq=list(itertools.permutations(self.conditions))*5;rng.shuffle(seq);orders[case]=seq
            elif len(self.conditions)==2:
                seq=[self.conditions,self.conditions[::-1]]*15;rng.shuffle(seq);orders[case]=seq
            else:orders[case]=base.balanced(self.conditions,case,rng)
        schedule=[]
        for rep in range(30):
            cases=self.cases.copy();rng.shuffle(cases)
            for cp,case in enumerate(cases):
                for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,case_position=cp,N=read(self.dir/'selected'/(case+'.json'))['N']))
        save(self.dir/'schedule.json',schedule);self.verify()
        save(self.dir/'frozen.json',dict(boot_id=boot(),timestamp=stamp(),target=len(schedule),artifacts={c:self.artifacts[c] for c in self.conditions},dependencies=runtime()['dependencies'],
          script_hashes={c:sha(self.script(c,read(self.dir/'selected'/(c+'.json'))['N'],'formal')) for c in self.cases},
          input_sha256=self.hashes,schedule_sha256=sha(self.dir/'schedule.json'),protocol_sha256=sha(self.dir/'protocol.json'),runner_sha256=sha(Path(__file__)),
          inherited_runner_sha256=sha(PREV/'benchmark.py'),file_stats=self.file_stats))
        for row in schedule:
            assert self.invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'])['valid'],'formal failure retained; no automatic retry'
            if (row['index']+1)%(len(self.conditions)*len(self.cases))==0:print('FORMAL_PROGRESS',self.kind,row['index']+1,'/',len(schedule),flush=True)
        self.verify();save(self.dir/'collected.json',dict(actual=len(schedule),target=len(schedule),boot_id=boot(),timestamp=stamp()))
        print('COLLECTED',self.kind,len(schedule),flush=True)
if __name__=='__main__':Campaign(sys.argv[1]).run()

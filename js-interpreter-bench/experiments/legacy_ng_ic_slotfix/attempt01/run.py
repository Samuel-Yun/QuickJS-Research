"""Single-campaign ABC runner. All samples append-only, resume never retries failures."""
import argparse,itertools,math,random,re,signal
from common import *
TIMEOUT=300
def init():
    m=read(HERE/'manifest.json')
    for p in [HERE/'run.py',HERE/'common.py']:
        m['inputs'][p.relative_to(ROOT).as_posix()]=sha(p)
    # manifest was produced by build.py; separate immutable measurement manifest.
    save(HERE/'measurement_manifest.json',m)
    protocol=dict(campaign=m['campaign'],mode=MODE,cases=CASES,versions=VERSIONS,seed=SEED,repetitions=30,
      main_GM_excluded_suites=['Crypto'],main_GM_reason='source-load random padding not proven pairwise identical',
      GM='geomean subitems within suite, then equal-weight suites; complete ABC intersection only',
      sensitive_GM='same rules including Crypto, never official Octane total',
      warmup_calls=0,first_Run_included=True,cache_state='naturally evolves across N repetitions, not all accesses cold',
      outside='process/VM/static source compile + adapter + required Setup; validation/TearDown/output/exit',
      inside='N original Run calls, GC/helpers/builtin/regexp/dynamic compile and required assertions',
      clock='captured native performance.now -> CLOCK_MONOTONIC ms',
      calibration='previous N as start; common N doubles until all >=1000ms; 3 fresh ABC groups all nine >=1000ms; otherwise double',
      max_N=65536,timeout_seconds=TIMEOUT,failure_rule='record and continue; no automatic retry; B/C-only failure is regression; no performance-based exclusion',
      schedule='six permutations each five times per case; cases and allocation shuffled fixed seed; each triple consecutive',
      statistics='n-1 sample sd, Tukey-halves Q1/Q3/IQR, 10000 triple-paired bootstrap ratio of medians, exploratory pointwise 95% intervals',
      no_outlier_removal=True,no_GC_changes=True,official_adaptive_warmup=False,
      inputs='same script/N/plaintext/key between versions; Crypto random padding limitation retained',
      input_hashes=m['inputs'])
    save(HERE/'protocol.json',protocol);environment('before_correctness')
    csvout(HERE/'coverage.csv',[dict(case=c,status='pending',included=True,main_aggregate=not c.startswith('Crypto.'),reason='Crypto RNG limited' if c.startswith('Crypto.') else '') for c in CASES]+[
      dict(case='Box2D.Box2D',status='not_retested_previous_boundary',included=False,main_aggregate=False,reason='no trusted correctness gate'),
      dict(case='zlib.zlib',status='unsupported_previous_boundary',included=False,main_aggregate=False,reason='read() absent; no new shim')]+[
      dict(case=s+'.latency',status='unsupported_mode',included=False,main_aggregate=False,reason='official adaptive latency score not defined') for s in ['Splay','Mandreel']])
    print('MEASUREMENT_INITIALIZED',flush=True)
def verify():
    m=verify_runtime();mm=read(HERE/'measurement_manifest.json')
    for p,h in mm['inputs'].items():assert sha(ROOT/p)==h,p
    return mm
def script(case,n,correctness=False):
    suite,bench=case.split('.');ix=1 if case in ['Crypto.Decrypt','EarleyBoyer.Boyer','CodeLoad.CodeLoadJQuery'] else 0
    driver=(HERE/'inputs/driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase='correctness' if correctness else 'measure'))).replace('__SUITE__',json.dumps(suite)).replace('__INDEX__',str(ix)).replace('__BENCHMARK__',json.dumps(bench)).replace('MAIN_MONOTONIC_V1',MODE)
    parts=[(HERE/'inputs/adapter.js').read_bytes()]+[(ROOT/'benchmarks/octane/upstream'/p).read_bytes() for p in ['base.js',*FILES[suite]]]
    p=HERE/'generated'/f'{case}.N{n}.{"check" if correctness else "measure"}.js';save(p,b'\n;\n'.join(parts)+b'\n;\n'+driver.encode());return p
def invoke(stage,case,v,n,rep,pos,binary=None,env=None):
    m=read(HERE/'measurement_manifest.json');artifact=m['artifacts'][v];binary=binary or artifact['path']
    stem=HERE/'raw'/stage/case/f'rep{rep}.N{n}.{v}.pos{pos}'
    record=Path(str(stem)+'.json')
    if record.exists():return read(record)
    pth=script(case,n,stage in ['correctness','selected_correctness'])
    cmd=[str(binary),str(pth)];bh=sha(binary)
    assert binary!=artifact['path'] or bh==artifact['sha256']
    r=dict(campaign=m['campaign'],cohort=m['cohort'],mode=MODE,stage=stage,case=case,variant=v,rep=rep,order=pos,N=n,
      command=cmd,cwd=str(ROOT),flags=[],binary_sha256=bh,script_sha256=sha(pth),script_relative=pth.relative_to(HERE).as_posix(),
      timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
      input_identity='common target JS/N; Crypto padding not fixed' if case.startswith('Crypto.') else 'common target JS/N; original deterministic setup',
      valid=False,elapsed_ms=None,elapsed_per_call_ms=None)
    stem.parent.mkdir(parents=True,exist_ok=True);start=time.perf_counter_ns()
    with Path(str(stem)+'.stdout').open('xb') as out,Path(str(stem)+'.stderr').open('xb') as err:
        try:
            p=subprocess.run(cmd,cwd=ROOT,stdout=out,stderr=err,timeout=TIMEOUT,env=env)
            r.update(exit_code=p.returncode,timeout=False)
        except subprocess.TimeoutExpired:r.update(exit_code=None,timeout=True)
    r.update(outer_wall_ns=time.perf_counter_ns()-start,stdout=Path(str(stem)+'.stdout').read_text(errors='replace'),stderr=Path(str(stem)+'.stderr').read_text(errors='replace'))
    try:
        found=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)
        assert r['exit_code']==0 and not r['timeout'] and not r['stderr'] and len(found)==1
        payload=json.loads(found[0]);assert payload['case']==case and payload['N']==n and payload['mode']==MODE and payload['correctness']=='PASS' and payload['warmup_calls']==0
        r['payload']=payload
        if stage not in ['correctness','selected_correctness']:
            e=payload['elapsed_ms'];assert math.isfinite(e) and e>0 and e<=r['outer_wall_ns']/1e6+5
            r.update(elapsed_ms=e,elapsed_per_call_ms=e/n)
        r['valid']=True
    except (AssertionError,ValueError,KeyError):r['error']='TIMEOUT' if r['timeout'] else 'EXIT_STDERR_PAYLOAD_CLOCK'
    save(record,r);print(stage,case,v,'N='+str(n),'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True);return r
def correctness():
    verify();assert read(HERE/'correctness/gate.json')['status']=='PASS';rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,v in enumerate(VERSIONS):
                r=invoke('correctness',case,v,n,n,pos);rows.append(dict(case=case,variant=v,N=n,valid=r['valid'],exit_code=r['exit_code']))
    csvout(HERE/'correctness/octane.csv',rows)
    assert len(rows)==96 and all(r['valid'] for r in rows),'correctness failure blocks formal'
def calibrate():
    verify();assert (HERE/'correctness/octane.csv').exists()
    for case in CASES:
        selected=HERE/'selected'/f'{case}.json'
        if selected.exists():continue
        n=read(OLD/'selected'/f'{case}.json')['N']
        while n<=65536:
            rs=[invoke('calibration',case,v,n,0,pos) for pos,v in enumerate(VERSIONS)]
            assert all(r['valid'] for r in rs)
            if min(r['elapsed_ms'] for r in rs)>=1000:
                pilot=[]
                for rep,seq in enumerate(['ABC','BCA','CAB']):
                    pilot += [invoke('pilot',case,v,n,rep,pos) for pos,v in enumerate(seq)]
                assert all(r['valid'] for r in pilot)
                if min(r['elapsed_ms'] for r in pilot)>=1000:
                    checks=[invoke('selected_correctness',case,v,n,0,pos) for pos,v in enumerate(VERSIONS)]
                    assert all(r['valid'] for r in checks)
                    save(selected,dict(case=case,N=n,pilot_ms=[r['elapsed_ms'] for r in pilot],first_Run_included=True));break
            n*=2
        else:raise RuntimeError('CALIBRATION_MAX_N '+case)
    rng=random.Random(SEED);perms=[''.join(p) for p in itertools.permutations(VERSIONS)]
    orders={c:perms*5 for c in CASES}
    for seq in orders.values():rng.shuffle(seq)
    schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for case in cases:
            n=read(HERE/'selected'/f'{case}.json')['N']
            for pos,v in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,N=n,rep=rep,order=pos,variant=v))
    save(HERE/'schedule.json',schedule)
    save(HERE/'frozen.json',dict(protocol_sha256=sha(HERE/'protocol.json'),measurement_manifest_sha256=sha(HERE/'measurement_manifest.json'),
      schedule_sha256=sha(HERE/'schedule.json'),selected={p.name:sha(p) for p in sorted((HERE/'selected').glob('*.json'))},frozen_at=stamp()))
    environment('post_pilot');print('CALIBRATION_FROZEN',flush=True)
def formal():
    verify();f=read(HERE/'frozen.json')
    for k,p in [('protocol_sha256','protocol.json'),('measurement_manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json')]:assert sha(HERE/p)==f[k]
    assert not any(s in ['cc1','cc1plus'] for s in subprocess.run(['ps','-eo','comm'],capture_output=True,text=True).stdout.splitlines())
    environment('pre_formal')
    for r in read(HERE/'schedule.json'):invoke('formal',r['case'],r['variant'],r['N'],r['rep'],r['order'])
    verify();environment('post_formal');print('FORMAL_COMPLETE',flush=True)
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['init','correctness','calibrate','formal']);a=ap.parse_args();globals()[a.stage]()

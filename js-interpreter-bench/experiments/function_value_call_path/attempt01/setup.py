"""Reuse exact artifacts and original adapter/driver, never update/rebuild."""
from common import *
def host():
    cmd=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    outputs={k:subprocess.run(cmd+a,capture_output=True,text=True,check=True).stdout for k,a in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('status',['status','--short'])]}
    assert outputs['branch'].strip()=='myx'
    save(HERE/'host_git_initial.json',dict(timestamp=stamp(),outputs=outputs))
    save(HERE/'started.json',dict(timestamp=stamp(),budget_seconds=BUDGET,note='initial reading preceded checkpoint by approximately 6 minutes',initial_HEAD=outputs['HEAD'].strip()))
def init():
    budget();m=read(PREV/'manifest.json')
    manifest={k:v for k,v in m.items() if k not in ['cohort','mode','host_git_initial','commands','artifacts']}
    manifest.update(cohort='WSL2-'+platform.node()+'-function-value-call-20261028-attempt01',mode=MODE,commands={c:m['commands'][c] for c in CONDS},artifacts={c:m['artifacts'][c] for c in CONDS},runtime_rebuilt=False,reused_manifest_sha256=sha(PREV/'manifest.json'),host_git_initial=read(HERE/'host_git_initial.json'))
    save(HERE/'manifest.json',manifest);verify()
    inputs={}
    for name in ['adapter.js','micro_driver.js']:
        src=PREV/'inputs'/name;save(HERE/'inputs'/name,src.read_bytes());inputs[name]=dict(origin=src.relative_to(ROOT).as_posix(),sha256=sha(src))
    save(HERE/'inputs.json',inputs)
    capture('environment_before',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; uptime; ps -eo pid,stat,comm,pcpu,args; true'])
    flags=capture('V8_ON_flags',prefixes()['V8_ON']+['--print-flag-values']);assert flags['exit_code']==0 and not flags['stderr']
    parsed={}
    for line in flags['stdout'].splitlines():
        if not line.startswith('--'):continue
        v=line[2:]
        if '=' in v:k,x=v.split('=',1)
        elif v.startswith('no-'):k,x=v[3:],False
        else:k,x=v,True
        parsed[k]=x
    for f in ['jitless','use-ic','regexp-interpret-all']:assert parsed[f] is True
    for f in ['lazy','sparkplug','maglev','turbofan','turboshaft','regexp-tier-up']:assert parsed[f] is False
    save(HERE/'effective_flags.json',parsed)
    save(HERE/'protocol.json',dict(cases=CASES,conditions=CONDS,mode=MODE,seed=SEED,expected_result=EXPECTED,max_checksum=MAX_N*EXPECTED,N_start=8192,N_max=MAX_N,timeout_seconds=TIMEOUT,reps=30,formal_target=360,pilot='common N doubled until three independent pilots per condition all>=1000ms',warmup_calls=0,first_Run_included=True,outside='object/function creation, static frontend, adapter, output and driver final validation',inside='N microRun including first; identity check in valueReadLoop; loop/calls/local assignment/driver checksum, GC and helpers',schedule='30 complete12-process rounds; condition six permutations5 each, each position10; case positions7/8',statistics='all valid descriptive; bootstrap10000 whole complete12-process round blocks; percentile linear95%; seed20261028; noGM',failures='no automatic retry, retain invalid/short/outliers; semantic failure stops case; timer/identity contradiction stops campaign',clock='native performance.now durations only, parent perf_counter_ns encloses; UTC metadata after reservation; different origins never joined',budget_seconds=BUDGET))
    save(HERE/'checkpoints/01_ready.json',dict(timestamp=stamp(),status='EXACT_ARTIFACTS_REUSED'))
    print('READY_EXACT_THREE_ARTIFACTS',flush=True)
if __name__=='__main__':
    import argparse
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['host','init']);a=p.parse_args();globals()[a.stage]()

"""Verify and reuse exact runtimes, not build or download another VM."""
from common import *
def host():
    prefix=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    result={name:subprocess.run(prefix+args,capture_output=True,text=True,check=True).stdout for name,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('status',['status','--short'])]}
    assert result['branch'].strip()=='myx';save(HERE/'host_git_initial.json',dict(timestamp=stamp(),client=platform.platform(),outputs=result))
    save(HERE/'started.json',dict(timestamp=stamp(),budget_seconds=BUDGET,initial_HEAD=result['HEAD'].strip(),initial_status=result['status'],note='task first read/inspection preceded this checkpoint by a few minutes'))
def init():
    assert platform.system()=='Linux';budget()
    m=read(PREV/'manifest.json')
    expected={'QJS_A':'584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1','QJS_M':'7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef','V8_ON':'83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133','V8_OFF':'83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133'}
    assert m['host']==platform.node() and m['kernel']==platform.release() and m['architecture']==platform.machine()
    for c,h in expected.items():assert m['artifacts'][c]['sha256']==h and sha(m['artifacts'][c]['path'])==h
    for a in m['v8_dependencies']:assert sha(a['path'])==a['sha256']
    manifest={k:v for k,v in m.items() if k not in ['cohort','mode','environment']}
    manifest.update(cohort='WSL2-'+platform.node()+'-inherited-method-20261028-attempt01',mode=MODE,reused_manifest_sha256=sha(PREV/'manifest.json'),runtime_rebuilt=False,host_git_initial=read(HERE/'host_git_initial.json'))
    save(HERE/'manifest.json',manifest)
    inputs={}
    for name in ['adapter.js','micro_driver.js','base.js','richards.js','richards_driver.js']:
        src=PREV/'inputs'/name;dst=HERE/'inputs'/name;save(dst,src.read_bytes());inputs[name]=dict(origin=src.relative_to(ROOT).as_posix(),sha256=sha(src))
    save(HERE/'inputs.json',inputs)
    capture('environment_before',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /home /mnt/c; uptime; ps -eo pid,stat,comm,pcpu,args; true'])
    flags={}
    for c in ['V8_ON','V8_OFF']:
        r=capture(c+'_flags',prefixes()[c]+['--print-flag-values']);assert r['exit_code']==0 and not r['stderr']
        flags[c]={}
        for line in r['stdout'].splitlines():
            if not line.startswith('--'):continue
            value=line[2:]
            if '=' in value:k,v=value.split('=',1)
            elif value.startswith('no-'):k,v=value[3:],False
            else:k,v=value,True
            flags[c][k]=v
    on,off=flags['V8_ON'],flags['V8_OFF'];assert [k for k in on if on[k]!=off[k]]==['use-ic']
    for f in ['jitless','regexp-interpret-all']:assert on[f] is True and off[f] is True
    for f in ['lazy','sparkplug','maglev','turbofan','turboshaft','regexp-tier-up']:assert on[f] is False and off[f] is False
    csvout(HERE/'effective_flags.csv',[dict(flag=k,ON=on[k],OFF=off[k]) for k in sorted(on)])
    save(HERE/'protocol.json',dict(mode=MODE,cases=CASES,conditions=CONDS,seed=SEED,expected_result=EXPECTED,micro_inner_iterations=4096,N_start=8192,N_max=MAX_N,timeout_seconds=TIMEOUT,reps=30,formal_target=240,warmup_calls=0,first_Run_included=True,pilot='3 independent per condition at common N, all>=1000ms, powers of2',timing='native monotonic duration, duration enclosure only; UTC metadata with signed discrepancy preserved',outside='object/prototype setup, static load/compile, adapter, output, final check',inside='N microRun including first, methods/load/call/accumulation/driver/checksum,GC/helpers',balance='2 cases first15/second15; condition positions7/8; same round8 serial processes',statistics='all valid descriptive; common complete8-process round bootstrap10000, seed20261028, percentile linear95 exploratory; noGM',failures='no retries; retain invalid/short/outlier; a semantic failure stops that case; bad timer or identity stops campaign',scope='two NEW x+1 method controls; do not merge earlier x+this.bias or Windows results',budget_seconds=BUDGET))
    print('SAME_FIXED_RUNTIMES_READY',flush=True)
if __name__=='__main__':
    import argparse
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['host','init']);args=p.parse_args();globals()[args.stage]()

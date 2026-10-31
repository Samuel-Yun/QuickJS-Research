"""Five fixed workloads; shared scripts, first Run timed, balanced A/M/H blocks."""
import argparse
import itertools
import json
import math
import os
import random
import re
import subprocess
import time
from pathlib import Path
from run import HERE,ROOT,PREV,METHOD,STORE,RUNTIMES,capture,csvout,read,save,sha,stamp,verify

CASES=['prototype_method','own_method','own_integer','numeric_control','Richards.Richards']
CONDS=['A','M','H']
EXPECTED=dict(prototype_method=8390656,own_method=8390656,own_integer=12288,numeric_control=8386560)
MODE='H_FIRST_CALL_INCLUSIVE_MONOTONIC_V1'
SEED=20261029


def artifacts():
    verify();assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    h=read(HERE/'H_manifest.json');assert sha(h['binary'])==h['sha256']
    return {**{c:dict(path=x[0],sha256=x[1]) for c,x in RUNTIMES.items()},'H':dict(path=h['binary'],sha256=h['sha256'])}


def sources():
    return [METHOD/'inputs/adapter.js',METHOD/'inputs/base.js',METHOD/'inputs/richards.js',
            METHOD/'inputs/micro_driver.js',METHOD/'inputs/richards_driver.js',METHOD/'cases/method_control.js',
            PREV/'inputs/M1.own_integer.js',PREV/'inputs/M4.numeric_control.js']


def script(case,n,check=False):
    phase='correctness' if check else 'measure'
    if case=='Richards.Richards':
        d=(METHOD/'inputs/richards_driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase=phase))).replace('__SUITE__','"Richards"').replace('__INDEX__','0').replace('__BENCHMARK__','"Richards"').replace("mode: 'MAIN_MONOTONIC_V1'","mode: '"+MODE+"'")
        data=b'\n;\n'.join((METHOD/'inputs'/name).read_bytes() for name in ['adapter.js','base.js','richards.js'])+b'\n;\n'+d.encode()
    else:
        d=(METHOD/'inputs/micro_driver.js').read_text().replace('__N__',str(n)).replace('__CHECK__','true' if check else 'false').replace('__EXPECTED__',str(EXPECTED[case])).replace('__CASE__',json.dumps(case)).replace('__MODE__',json.dumps(MODE)).replace('__PHASE__',json.dumps(phase))
        if case in ['prototype_method','own_method']:
            workload=f'var CASE_KIND={json.dumps("own" if case=="own_method" else "inherited")};\n'.encode()+(METHOD/'cases/method_control.js').read_bytes()
        else:
            workload=(PREV/'inputs'/('M1.own_integer.js' if case=='own_integer' else 'M4.numeric_control.js')).read_bytes()
        data=(METHOD/'inputs/adapter.js').read_bytes()+b'\n;\n'+workload+b'\n;\n'+d.encode()
    p=HERE/'scripts/workloads'/case/f'N{n}.{phase}.js';save(p,data);return p


def valid_payload(r,case,n,check):
    assert r['exit_code']==0 and not r['stderr'] and not r['timeout']
    lines=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert len(lines)==1
    d=json.loads(lines[0]);assert d['N']==n and d['case']==case and d['mode']==MODE and d['correctness']=='PASS' and d['warmup_calls']==0
    if case!='Richards.Richards':
        assert d['last']==EXPECTED[case] and d['checksum']==n*EXPECTED[case] and n*EXPECTED[case]<2**53
    if not check:
        e=d['elapsed_ms'];assert math.isfinite(e) and e>0 and e==d['stop_ms']-d['start_ms'] and e<=r['outer_wall_ns']/1e6+5
    return d


def invoke(stage,case,c,n,rep,pos,block=None):
    path=HERE/'raw'/stage/case/f'r{rep}.{c}.p{pos}.N{n}.json'
    assert not path.exists(),'do not repeat or overwrite executed positions'
    js=script(case,n,stage in ['workload_correctness','selected_correctness'])
    a=read(HERE/'frozen_runtime.json')['artifacts'][c]
    label=stage+'.'+case+f'.r{rep}.{c}.p{pos}.N{n}'
    started=HERE/'raw/started'/stage/case/path.name
    save(started,dict(timestamp=stamp(),stage=stage,case=case,condition=c,rep=rep,position=pos,N=n,script_sha256=sha(js)))
    r=capture(label,[a['path'],js],timeout=180)
    r.update(stage=stage,cohort='WSL2_H_20261029',mode=MODE,case=case,condition=c,N=n,rep=rep,position=pos,block=block,
             binary_sha256=a['sha256'],script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),flags=[],valid=False,
             elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None)
    try:
        check=stage in ['workload_correctness','selected_correctness']
        d=valid_payload(r,case,n,check)
        r.update(valid=True,payload=d,elapsed_ms=d['elapsed_ms'],elapsed_per_Run_ms=None if check else d['elapsed_ms']/n,checksum=d.get('checksum'))
    except (AssertionError,ValueError,TypeError,KeyError) as e:
        r['failed_reason']=type(e).__name__+': '+str(e)
    save(path,r)
    print(stage,case,c,'N',n,'rep',rep,'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True)
    return r


def prepare():
    a=artifacts();save(HERE/'frozen_runtime.json',dict(timestamp=stamp(),artifacts=a,input_hashes={str(p.relative_to(ROOT)):sha(p) for p in sources()},
        input_LF_normalized_hashes={str(p.relative_to(ROOT)):__import__('hashlib').sha256(p.read_bytes().replace(b'\r\n',b'\n')).hexdigest() for p in sources()},mode=MODE))
    rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,c in enumerate(CONDS):
                r=invoke('workload_correctness',case,c,n,n,pos)
                rows.append(dict(case=case,N=n,condition=c,valid=r['valid'],exit_code=r['exit_code']))
                assert r['valid']
    csvout(HERE/'correctness/workloads.csv',rows)
    save(HERE/'correctness/workload_gate.json',dict(status='PASS',valid=len(rows),expected=30))


def timer():
    a=artifacts();p=HERE/'scripts/timer_probe.js';save(p,(PREV/'inputs/timer_probe.js').read_bytes());rows=[]
    for c in CONDS:
        r=capture('timer.'+c,[a[c]['path'],p]);assert r['exit_code']==0 and not r['stderr']
        d=json.loads(r['stdout']);assert d['changes']>0 and d['min_positive_ms']>0
        rows.append(dict(condition=c,**d))
    save(HERE/'correctness/timer_gate.json',dict(status='PASS',clocks=rows,durations_only=True,absolute_origins_not_compared=True))


def identity():
    frozen=read(HERE/'frozen_runtime.json');artifacts()
    for rel,h in frozen['input_hashes'].items():assert sha(ROOT/rel)==h


def calibration():
    identity()
    for name in ['semantic','lifecycle','sanitizer','mechanism','internal','cow_oom','workload','timer']:
        p=HERE/'correctness'/(name+'_gate.json');assert read(p)['status']=='PASS',name
    choices=[]
    for case in CASES:
        n=512 if case=='Richards.Richards' else 8192
        upper=4096 if case=='Richards.Richards' else 131072
        while n<=upper:
            pilots=[]
            for rep in range(3):
                order=CONDS[rep:]+CONDS[:rep]
                for pos,c in enumerate(order):
                    r=invoke('pilot',case,c,n,rep,pos);pilots.append(r)
                    assert r['valid'],'pilot failure; no automatic retry'
            # A large same-config excursion is disclosed and stops performance.
            for c in CONDS:
                vals=[r['elapsed_ms'] for r in pilots if r['condition']==c]
                if max(vals)/min(vals)>=3:
                    save(HERE/'performance_stop.json',dict(status='PERFORMANCE_ENV_UNSTABLE',case=case,condition=c,N=n,pilot_ms=vals,rule='max/min >= 3 among independent same-config pilots',formal_samples=0))
                    return
            if min(r['elapsed_ms'] for r in pilots)>=1000:
                for pos,c in enumerate(CONDS):
                    r=invoke('selected_correctness',case,c,n,0,pos);assert r['valid']
                choice=dict(case=case,N=n,pilot_min_ms=min(r['elapsed_ms'] for r in pilots),pilot_max_ms=max(r['elapsed_ms'] for r in pilots))
                choices.append(choice);save(HERE/'selected'/f'{case}.json',choice);break
            n*=2
        else:
            save(HERE/'performance_stop.json',dict(status='N_LIMIT',case=case,upper=upper,formal_samples=0));return
    csvout(HERE/'selected_n.csv',choices)
    save(HERE/'calibration_gate.json',dict(status='PASS',cases=5,independent_pilots_per_condition=3,minimum_internal_ms=1000,first_Run_included=True,warmup_calls=0))


def schedule():
    rng=random.Random(SEED)
    block_cases=[]
    for _ in range(6):
        base=CASES.copy();rng.shuffle(base)
        block_cases.extend(base[i:]+base[:i] for i in range(5))
    rng.shuffle(block_cases)
    orders={case:list(itertools.permutations(CONDS))*5 for case in CASES}
    for val in orders.values():rng.shuffle(val)
    rows=[]
    for block,cases in enumerate(block_cases):
        for cp,case in enumerate(cases):
            n=read(HERE/'selected'/f'{case}.json')['N']
            for pos,c in enumerate(orders[case][block]):
                rows.append(dict(index=len(rows),block=block,case_position=cp,case=case,condition=c,position=pos,N=n))
    return rows


def formal():
    identity();assert read(HERE/'calibration_gate.json')['status']=='PASS'
    assert not (HERE/'performance_stop.json').exists()
    rows=schedule();save(HERE/'schedule.json',rows)
    save(HERE/'campaign_frozen.json',dict(timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
         script_hashes={str(script(case,read(HERE/'selected'/f'{case}.json')['N']).relative_to(HERE)):sha(script(case,read(HERE/'selected'/f'{case}.json')['N'])) for case in CASES},
         files={name:sha(HERE/name) for name in ['campaign.py','run.py','protocol.json','measurement_contract.json','H_manifest.json','frozen_runtime.json','schedule.json']},
         planned_samples=450,seed=SEED))
    r=capture('formal_processes_before',['ps','-eo','pid,stat,comm,pcpu,args'])
    assert not any(len(l.split())>=3 and l.split()[2] in ['cc1','cc1plus','collect2','ld','perf'] for l in r['stdout'].splitlines())
    boot=read(HERE/'campaign_frozen.json')['boot_id']
    for row in rows:
        assert Path('/proc/sys/kernel/random/boot_id').read_text().strip()==boot
        elapsed=(__import__('datetime').datetime.now(__import__('datetime').timezone.utc)-__import__('datetime').datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds()
        if elapsed>=21600:
            save(HERE/'performance_stop.json',dict(status='TASK_BUDGET',last_unstarted=row,elapsed_seconds=elapsed));break
        r=invoke('formal',row['case'],row['condition'],row['N'],row['block'],row['position'],row['block'])
        print('FORMAL_COMPLETED',row['index']+1,'/450',flush=True)
        if not r['valid']:
            save(HERE/'performance_stop.json',dict(status='FAILED_FORMAL',row=row,reason=r.get('failed_reason')));break
    identity();save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),boot_id=boot))
    capture('formal_environment_after',['sh','-c','uname -a; uptime; ps -eo pid,stat,comm,pcpu,args'])


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['prepare','timer','calibration','formal']);a=p.parse_args();globals()[a.stage]()

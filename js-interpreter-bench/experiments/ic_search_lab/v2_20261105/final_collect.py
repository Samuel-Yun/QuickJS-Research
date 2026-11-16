"""Fresh selected-only pilot/formal campaign, serial, frozen code, resumable same boot."""
import argparse,itertools,json,os,random,sys
from contextlib import contextmanager
from pathlib import Path
import run
H=run.HERE;lab=run.lab;measure=run.measure

@contextmanager
def exclusive():
    p=H/'final_collector.lock'
    payload=json.dumps(dict(pid=os.getpid(),boot_id=lab.boot(),command=sys.argv))
    with p.open('x',encoding='utf-8') as f:f.write(payload+'\n')
    try:yield
    finally:
        assert p.read_text().strip()==payload
        p.unlink()

def context():
    d=lab.load(H/'decision.json');cid=d['candidate']
    assert d['status']=='SELECTED_PENDING_FULL_SAFETY' and cid
    safety=lab.load(H/'final_safety.json');assert safety['status']=='PASS_SELECTED_NARROW_SAFETY_AND_UPSTREAM' and safety['candidate']==cid
    assert lab.boot()==d['boot_id']==safety['boot_id'];os.sched_setaffinity(0,{2})
    assert measure.artifact(cid)['sha256']==d['frozen_candidate']['sha256']
    return cid

def runtime_gate():
    context();assert not (H/'final_runtime_gate.json').exists()
    art=measure.artifact('V8_ON');p=Path(art['path']);expected={
        'd8':'83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133',
        'snapshot_blob.bin':'5af8f6d23e18aca97e3d89b1cab0815a56235c29f37728ffe10255fdea035749',
        'icudtl.dat':'495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1'}
    actual={n:lab.sha(p.parent/n) for n in expected};assert actual==expected
    flags=['--jitless','--no-lazy','--use-ic']
    smoke=lab.capture([p,*flags,'-e','print(123)'],'final_runtime_gate','frozen_V8',15,dict(binary_sha256=actual['d8']))
    assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr'],smoke
    dump=lab.capture([p,*flags,'--print-flag-values','-e','print(123)'],'final_runtime_gate','frozen_V8_flags',15,dict(binary_sha256=actual['d8']))
    assert dump['exit_code']==0 and not dump['stderr']
    lab.save(H/'final_v8_flag_values.txt',dump['stdout'])
    # Reuse exact same artifact/flags already validated in the existing experiment.
    lab.save(H/'final_runtime_gate.json',dict(status='PASS_SAME_FROZEN_ARTIFACT',V8_flags=flags,sha256=actual,
        previous_evidence='experiments/ic_fast_slow_20261102/attempt01/runtime.json and existing jitless/use_ic validation',
        compiler='UNKNOWN',source_exact_commit='UNKNOWN',tokens=[smoke['token'],dump['token']],boot_id=lab.boot()))

def pilot():
    cid=context();assert not (H/'final_pilot.json').exists()
    if not (H/'final_runtime_gate.json').exists():runtime_gate()
    proto=H/'final_pilot_protocol.json';assert not proto.exists(),'retain interrupted pilot, no implicit replacement'
    plan={};infos={}
    for kind in ['octane','sunspider']:
        info=measure.inputs(kind);labels=['A','M',cid]+(['V8_ON'] if kind=='octane' else [])
        measure.verify(info,labels);infos[kind]=info;plan[kind]=dict(labels=labels,N=info['N'])
    lab.save(proto,dict(stage='independent_final_pilot_not_formal',plan=plan,minimum_internal_ms=1000,
        policy='existing frozen N; retain and stop for explicit recalibration if any pilot below threshold; no discarded short sample',
        seed=20261105,boot_id=lab.boot(),candidate=cid))
    samples=[]
    for kind,group in plan.items():
        cases=infos[kind]['cases'].copy();rng=random.Random(20261105);rng.shuffle(cases)
        for case in cases:
            labels=group['labels'].copy();rng.shuffle(labels)
            for pos,label in enumerate(labels):
                samples.append(measure.invoke(infos[kind],cid,case,label,group['N'][case],'final_pilot',pos,0,'v2.final.'+kind+'.pilot01'))
        measure.verify(infos[kind],group['labels'])
    short=[dict(kind=r['kind'],case=r['case'],condition=r['condition'],elapsed_ms=r['elapsed_ms']) for r in samples if r['elapsed_ms']<1000]
    lab.save(H/'final_pilot.json',dict(status='PASS_FIXED_N' if not short else 'RECALIBRATION_REQUIRED',candidate=cid,
        count=len(samples),below_1000ms=short,plan=plan,boot_id=lab.boot()))
    assert not short,'saved short pilot; no silent N change'
    print('FINAL_PILOT_PASS',len(samples),flush=True)

def collect(kind):
    cid=context();pilot_result=lab.load(H/'final_pilot.json');assert pilot_result['status']=='PASS_FIXED_N'
    info=measure.inputs(kind);group=pilot_result['plan'][kind];labels=group['labels'];assert info['N']==group['N']
    measure.verify(info,labels);bid=lab.boot();campaign='v2.final.'+kind+'.confirm01';path=H/('final.'+kind+'.protocol.json')
    rng=random.Random(20261105);perms=list(itertools.permutations(labels));orders={}
    for case in info['cases']:
        if len(labels)==3:pool=perms*5
        else:
            rotations=[tuple(labels[i:]+labels[:i]) for i in range(4)]
            pool=perms+rotations+[tuple(labels),tuple(reversed(labels))]
        assert len(pool)==30;pool=pool.copy();rng.shuffle(pool);orders[case]=pool
    schedule=[]
    for rep in range(30):
        cases=info['cases'].copy();rng.shuffle(cases)
        for case in cases:
            for pos,label in enumerate(orders[case][rep]):schedule.append(dict(case=case,condition=label,N=info['N'][case],rep=rep,order=pos))
    runner_hash={}
    for name,p in [('final_collect',Path(__file__)),('v2_run',Path(run.__file__)),('v1_capture',Path(lab.__file__)),('v1_measure',Path(measure.__file__))]:
        h=lab.sha(p);lab.save(H/'runners'/(name+'.'+h+'.py'),p.read_bytes());runner_hash[name]=h
    protocol=dict(campaign=campaign,candidate=cid,kind=kind,labels=labels,info=info,rounds=30,seed=20261105,boot_id=bid,
        schedule=schedule,runner_hashes=runner_hash,mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',warmup_calls=0,
        statistical_policy='10000 shared whole-round paired bootstrap seed20261105, median ratios and fixed hierarchical GM, unadjusted exploratory',
        failure='retain every failure/outlier/short sample, stop on invalid/hash/boot contradiction; resume only unchanged same boot with no invalid positions')
    if path.exists():assert lab.load(path)==protocol,'protocol/boot/source changed; do not merge campaigns'
    else:lab.save(path,protocol)
    rows=[json.loads(s) for s in (H/'runs.jsonl').read_text().splitlines()]
    old=[r for r in rows if r.get('event')=='measurement' and r.get('campaign')==campaign]
    key=lambda r:(r['case'],r['condition'],r['rep'],r['order'])
    assert all(r['valid'] and r['boot_id']==bid for r in old)
    assert len({key(r) for r in old})==len(old)
    done={key(r) for r in old};assert done<={key(r) for r in schedule}
    for index,item in enumerate(schedule):
        if key(item) in done:continue
        assert lab.boot()==bid
        measure.invoke(info,cid,item['case'],item['condition'],item['N'],'formal',item['order'],item['rep'],campaign)
        if (index+1)%(len(info['cases'])*len(labels))==0:print('FINAL_ROUND',kind,item['rep']+1,index+1,len(schedule),flush=True)
    measure.verify(info,labels);assert lab.boot()==bid
    lab.save(H/('final.'+kind+'.complete.json'),dict(status='COMPLETE_NEW_FORMAL',count=len(schedule),expected=len(schedule),
        campaign=campaign,candidate=cid,boot_id=bid))
    print('FINAL_COMPLETE',kind,len(schedule),flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('action',choices=['runtime','pilot','collect']);p.add_argument('kind',nargs='?',choices=['octane','sunspider']);a=p.parse_args()
    with exclusive():
        if a.action=='runtime':runtime_gate()
        elif a.action=='pilot':pilot()
        else:assert a.kind;collect(a.kind)

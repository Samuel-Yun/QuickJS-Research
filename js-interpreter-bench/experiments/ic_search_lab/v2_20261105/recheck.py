"""V2 predetermined three-round paired collection; no warmup or resampling here."""
import json,os,random
from pathlib import Path
import run
lab=run.lab;measure=run.measure;HERE=run.HERE

def collect(cid,kind):
    run.gate();os.sched_setaffinity(0,{2});parent=measure.artifact(cid)['parent'];labels=['A',cid,parent]
    assert len(set(labels))==3
    info=measure.inputs(kind);measure.verify(info,labels);bid=lab.boot();rounds=3
    campaign=f'v2.{cid}.{kind}.recheck01';prefix=f'{cid}.matched.{kind}'
    path=HERE/(prefix+'.recheck_protocol.json');assert not path.exists(),'do not overwrite completed or interrupted campaign'
    rng=random.Random(20261105);orders={}
    for case in info['cases']:
        base=labels.copy();rng.shuffle(base);orders[case]=[base[i:]+base[:i] for i in range(3)];rng.shuffle(orders[case])
    schedule=[]
    for rep in range(rounds):
        cases=info['cases'].copy();rng.shuffle(cases)
        for case in cases:
            for pos,label in enumerate(orders[case][rep]):schedule.append(dict(case=case,condition=label,rep=rep,order=pos,N=info['N'][case]))
    versions={}
    for name,p in [('v2_run',Path(run.__file__)),('v2_recheck',Path(__file__)),('v1_capture',Path(lab.__file__)),('v1_measure',Path(measure.__file__))]:
        h=lab.sha(p);lab.save(HERE/'runners'/(name+'.'+h+'.py'),p.read_bytes());versions[name]=h
    lab.save(path,dict(campaign=campaign,rounds=3,parent=parent,labels=labels,info=info,boot_id=bid,
       schedule=schedule,seed=20261105,runner_hashes=versions,warmup_calls=0,
       failure='retain all, no replacement; stop on invalid/identity/boot change',stage='recheck_not_formal'))
    samples=[]
    for index,item in enumerate(schedule):
        assert lab.boot()==bid
        samples.append(measure.invoke(info,cid,item['case'],item['condition'],item['N'],'recheck',item['order'],item['rep'],campaign))
        if (index+1)%(len(info['cases'])*3)==0:print('V2_RECHECK_ROUND',cid,kind,item['rep'],index+1,len(schedule),flush=True)
    measure.verify(info,labels);assert lab.boot()==bid
    groups=[]
    import statistics
    for case in info['cases']:
        values=[{label:next(s['elapsed_per_Run_ms'] for s in samples if s['case']==case and s['rep']==rep and s['condition']==label) for label in labels} for rep in range(3)]
        groups.append(dict(case=case,N=info['N'][case],rounds=values,medians_ms={label:statistics.median(v[label] for v in values) for label in labels}))
    lab.save(HERE/(prefix+'.recheck.json'),dict(candidate=cid,parent=parent,kind=kind,rounds=3,count=len(samples),expected=len(schedule),groups=groups,status='COMPLETE_RECHECK_NOT_FORMAL',boot_id=bid))
    lab.candidate_status(cid,status='RECHECKED',recheck=kind+'3 rounds complete; full files retain both suites',decision='await both suites, paired analysis and gate; no automatic winner')
    print('V2_RECHECK_COMPLETE',cid,kind,len(samples),flush=True)

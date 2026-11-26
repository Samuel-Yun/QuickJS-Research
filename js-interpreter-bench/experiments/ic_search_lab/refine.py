"""Small separate bounded follow-up/recheck; never substitutes initial samples."""
import argparse,hashlib,itertools,json,math,os,random,statistics
from pathlib import Path
import lab,measure
HERE=lab.HERE

def single(cid,kind,cases):
    lab.execution_gate();os.sched_setaffinity(0,{2});info=measure.inputs(kind);bid=lab.boot()
    profile=measure.artifact(cid).get('build_profile','legacy');prefix=cid+('.matched' if profile=='matched' else '')
    campaign=f'postreboot.{prefix}.{kind}.regression_check01'
    assert not (HERE/f'{prefix}.{kind}.regression_check.json').exists()
    results=[]
    for case in cases:
        assert case in info['cases']
        triple=[measure.invoke(info,cid,case,c,info['N'][case],'regression_check',p,0,campaign) for p,c in enumerate(['A',cid,'A'])]
        a,c,z=[r['elapsed_ms'] for r in triple]
        results.append(dict(case=case,ratio=c/math.sqrt(a*z),A_drift=max(a,z)/min(a,z),tokens=[r['process_token'] for r in triple]))
    measure.verify(info,['A',cid]);assert lab.boot()==bid
    lab.save(HERE/f'{prefix}.{kind}.regression_check.json',dict(status='SINGLE_FOLLOWUP_NOT_REPLACEMENT',results=results,build_profile=profile,
        meaning='Initial >10% regression retained. This is one bounded independent follow-up, not a favorable-sample retry or CI.',boot_id=bid))
    print('REGRESSION_CHECK',cid,json.dumps(results),flush=True)

def refine(cid,kind,rounds):
    assert rounds in [3,4,5]
    lab.execution_gate();os.sched_setaffinity(0,{2});info=measure.inputs(kind);parent=measure.artifact(cid)['parent']
    labels=['A',cid,parent];assert len(set(labels))==3
    profile=measure.artifact(cid).get('build_profile','legacy');assert profile=='matched'
    prefix=cid+'.matched'
    measure.verify(info,labels);bid=lab.boot();campaign=f'postreboot.{prefix}.{kind}.recheck01'
    protocol=HERE/f'{prefix}.{kind}.recheck_protocol.json';assert not protocol.exists(), 'never overwrite a prior recheck'
    script_hashes={}
    for p in [Path(__file__),Path(measure.__file__),Path(lab.__file__)]:
        h=lab.sha(p);lab.save(HERE/'runner_history'/(p.stem+'.'+h+'.py'),p.read_bytes());script_hashes[p.name]=h
    rng=random.Random(20261104);schedule=[]
    orders={c:[labels[i%3:]+labels[:i%3] for i in range(rounds)] for c in info['cases']}
    for c in info['cases']:rng.shuffle(orders[c])
    for rep in range(rounds):
        cases=info['cases'].copy();rng.shuffle(cases)
        for case in cases:
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(case=case,condition=c,N=info['N'][case],rep=rep,order=pos))
    lab.save(protocol,dict(campaign=campaign,stage='recheck_not_final',rounds=rounds,labels=labels,parent=parent,
        info=info,boot_id=bid,schedule=schedule,runner_hashes=script_hashes,seed=20261104,
        warmup_calls=0,selection='chosen from exploratory screens; no claim of confirmatory significance',
        failure='retain all, stop on invalid sample/boot/identity; no replacement samples'))
    rows=[]
    for index,item in enumerate(schedule):
        assert lab.boot()==bid,'boot changed'
        rows.append(measure.invoke(info,cid,item['case'],item['condition'],item['N'],'recheck',item['order'],item['rep'],campaign))
        if (index+1)%(len(info['cases'])*3)==0:
            print('RECHECK_ROUND_COMPLETE',cid,kind,item['rep'],index+1,len(schedule),flush=True)
    measure.verify(info,labels);assert lab.boot()==bid
    groups=[]
    for case in info['cases']:
        med={c:statistics.median(r['elapsed_per_Run_ms'] for r in rows if r['case']==case and r['condition']==c) for c in labels}
        groups.append(dict(case=case,N=info['N'][case],medians_ms=med,candidate_over_A=med[cid]/med['A'],candidate_over_parent=med[cid]/med[parent],
            rounds=[{c:next(r['elapsed_per_Run_ms'] for r in rows if r['case']==case and r['condition']==c and r['rep']==rep) for c in labels} for rep in range(rounds)]))
    def aggregate(subset,key):
        if kind=='sunspider':return math.exp(statistics.mean(math.log(g[key]) for g in subset))
        cat={r['case']:r['suite'] for r in info['catalog']};by={}
        for g in subset:by.setdefault(cat[g['case']],[]).append(math.log(g[key]))
        return math.exp(statistics.mean(statistics.mean(v) for v in by.values()))
    ranges={'all26_case_equal':groups} if kind=='sunspider' else {'core16_13suite':[g for g in groups if g['case']!='zlib.zlib'],'expanded17_14suite':groups}
    aggregates={name:{key:aggregate(sub,key) for key in ['candidate_over_A','candidate_over_parent']} for name,sub in ranges.items()}
    result=dict(status='COMPLETE_RECHECK_NOT_FINAL',candidate=cid,kind=kind,rounds=rounds,groups=groups,aggregates=aggregates,
        count=len(rows),expected=len(schedule),boot_id=bid,confidence_interval=None,
        note='point estimates and all round distributions; not new30-process final confirmation')
    lab.save(HERE/f'{prefix}.{kind}.recheck.json',result);lab.candidate_status(cid,recheck=f'{kind} {rounds} rounds: '+json.dumps(aggregates,separators=(',',':')))
    print('RECHECK_COMPLETE',cid,kind,json.dumps(aggregates),flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('action',choices=['single','refine']);p.add_argument('id');p.add_argument('kind',choices=['sunspider','octane']);p.add_argument('extra');a=p.parse_args()
    if a.action=='single':single(a.id,a.kind,a.extra.split(','))
    else:refine(a.id,a.kind,int(a.extra))

"""Predetermined key-set repeat, only if fresh formal aggregate supports the trigger."""
import csv,json,random,statistics
from pathlib import Path
import analyze,final_collect,run
H=run.HERE;lab=run.lab;measure=run.measure

def main():
    cid=final_collect.context();policy=lab.load(H/'independent_repeat_policy.json')
    assert not (H/'independent.complete.json').exists()
    for kind in ['sunspider','octane']:assert lab.load(H/f'final.{kind}.complete.json')['status']=='COMPLETE_NEW_FORMAL'
    rows=list(csv.DictReader((H/'final.octane.aggregates.csv').open(encoding='utf-8')))
    relevant=[r for r in rows if r['scope']=='core16_13suite' and r['comparison'] in [cid+'/A',cid+'/M']]
    trigger=len(relevant)==2 and all(float(r['ratio'])<1 and float(r['high95'])<1 for r in relevant)
    if not trigger:
        lab.save(H/'independent.complete.json',dict(status='NOT_TRIGGERED_BY_FROZEN_POLICY',count=0,expected=0,trigger_rows=relevant))
        print('INDEPENDENT_NOT_TRIGGERED',flush=True);return
    count=0;ratios=[];stats=[]
    for kind,keys in [('octane','Octane_cases'),('sunspider','SunSpider_cases')]:
        info=measure.inputs(kind);info['cases']=policy[keys];labels=['A','M',cid]+(['V8_ON'] if kind=='octane' else [])
        measure.verify(info,labels);R=10;rng=random.Random(20261105);orders={};n=len(labels)
        for case in info['cases']:
            rotations=[tuple(labels[i:]+labels[:i]) for i in range(n)]
            pool=(rotations*2+[tuple(labels),tuple(reversed(labels))]) if n==4 else list(__import__('itertools').permutations(labels))+rotations+[tuple(labels)]
            assert len(pool)==R;rng.shuffle(pool);orders[case]=pool
        schedule=[]
        for rep in range(R):
            cases=info['cases'].copy();rng.shuffle(cases)
            for case in cases:
                for pos,label in enumerate(orders[case][rep]):schedule.append(dict(case=case,condition=label,N=info['N'][case],rep=rep,order=pos))
        path=H/f'independent.{kind}.protocol.json';assert not path.exists(),'no implicit rerun of interrupted independent campaign'
        campaign='v2.independent.'+kind+'.repeat01';h=lab.sha(Path(__file__));lab.save(H/'runners'/('independent.'+h+'.py'),Path(__file__).read_bytes())
        lab.save(path,dict(campaign=campaign,kind=kind,candidate=cid,labels=labels,info=info,rounds=R,seed=20261105,
            boot_id=lab.boot(),schedule=schedule,runner_sha256=h,policy='independent_repeat_policy.json',no_subset_GM=True,warmup_calls=0))
        samples=[]
        for item in schedule:
            samples.append(measure.invoke(info,cid,item['case'],item['condition'],item['N'],'independent',item['order'],item['rep'],campaign))
        measure.verify(info,labels);count+=len(samples)
        rng=random.Random(20261105);draws=[[rng.randrange(R) for _ in range(R)] for _ in range(10000)]
        for case in info['cases']:
            values={label:[next(r['elapsed_per_Run_ms'] for r in samples if r['case']==case and r['condition']==label and r['rep']==rep) for rep in range(R)] for label in labels}
            stats.extend(dict(kind=kind,case=case,condition=l,N=info['N'][case],unit='ms/complete Run',**analyze.desc(v)) for l,v in values.items())
            for other in labels:
                if other==cid:continue
                point=statistics.median(values[cid])/statistics.median(values[other])
                bs=[statistics.median(values[cid][i] for i in idx)/statistics.median(values[other][i] for i in idx) for idx in draws]
                ratios.append(dict(kind=kind,case=case,comparison=cid+'/'+other,n=R,ratio=point,low95=analyze.pct(bs,.025),high95=analyze.pct(bs,.975)))
        lab.save(H/f'independent.{kind}.complete.json',dict(status='COMPLETE_SEPARATE_KEY_REPEAT',count=len(samples),expected=len(schedule),campaign=campaign))
    analyze.writecsv('independent.statistics.csv',stats);analyze.writecsv('independent.ratios.csv',ratios)
    lab.save(H/'independent.complete.json',dict(status='COMPLETE_SEPARATE_KEY_REPEAT',count=count,expected=230,merged_with_formal=False,no_subset_GM=True))
    print('INDEPENDENT_COMPLETE',count,flush=True)
if __name__=='__main__':
    with final_collect.exclusive():main()

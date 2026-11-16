"""Recompute key-repeat CSVs from public raw only; never collect or load engines."""
import json,random,statistics
import analyze,evidence
H=analyze.HERE
def main():
    raw=evidence.rows();stats=[];ratios=[]
    for kind in ['octane','sunspider']:
        p=analyze.load(H/f'independent.{kind}.protocol.json');d=analyze.load(H/f'independent.{kind}.complete.json')
        samples=[r for r in raw if r.get('event')=='measurement' and r['campaign']==p['campaign']]
        assert len(samples)==d['expected']==d['count']==len(p['schedule']) and all(r['valid'] for r in samples)
        cid=p['candidate'];R=p['rounds'];rng=random.Random(20261105);draws=[[rng.randrange(R) for _ in range(R)] for _ in range(10000)]
        for case in p['info']['cases']:
            values={l:[next(r['elapsed_per_Run_ms'] for r in samples if r['case']==case and r['condition']==l and r['rep']==rep) for rep in range(R)] for l in p['labels']}
            stats.extend(dict(kind=kind,case=case,condition=l,N=p['info']['N'][case],unit='ms/complete Run',**analyze.desc(v)) for l,v in values.items())
            for other in p['labels']:
                if other==cid:continue
                bs=[statistics.median(values[cid][i] for i in idx)/statistics.median(values[other][i] for i in idx) for idx in draws]
                ratios.append(dict(kind=kind,case=case,comparison=cid+'/'+other,n=R,
                    ratio=statistics.median(values[cid])/statistics.median(values[other]),low95=analyze.pct(bs,.025),high95=analyze.pct(bs,.975)))
    analyze.writecsv('independent.statistics.csv',stats);analyze.writecsv('independent.ratios.csv',ratios)
    print('INDEPENDENT_OFFLINE_RECOMPUTED',len(stats),'groups;',len(ratios),'ratios; no engine access')
if __name__=='__main__':main()

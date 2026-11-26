"""Offline fresh-formal statistics. Requires every scheduled position; no engine access."""
import json,math,random,statistics
from pathlib import Path
import analyze
import evidence
H=analyze.HERE

def main():
    rows=evidence.rows()
    summaries=[]
    for kind in ['octane','sunspider']:
        proto=analyze.load(H/f'final.{kind}.protocol.json');complete=analyze.load(H/f'final.{kind}.complete.json')
        cid=proto['candidate'];labels=proto['labels'];R=proto['rounds'];cases=proto['info']['cases']
        raw=[r for r in rows if r.get('event')=='measurement' and r.get('campaign')==proto['campaign']]
        key=lambda r:(r['case'],r['condition'],r['rep'],r['order'])
        assert len(raw)==len(proto['schedule'])==complete['expected'] and len({key(r) for r in raw})==len(raw)
        assert {key(r) for r in raw}=={key(r) for r in proto['schedule']} and all(r['valid'] for r in raw)
        groups={c:{l:[next(r['elapsed_per_Run_ms'] for r in raw if r['case']==c and r['condition']==l and r['rep']==rep) for rep in range(R)] for l in labels} for c in cases}
        desc=[dict(case=c,condition=l,N=proto['info']['N'][c],unit='ms/complete Run',**analyze.desc(groups[c][l])) for c in cases for l in labels]
        analyze.writecsv(f'final.{kind}.statistics.csv',desc)
        wall=[dict(case=c,condition=l,unit='external ms/process',**analyze.desc([r['external_wall_ms'] for r in raw if r['case']==c and r['condition']==l])) for c in cases for l in labels]
        analyze.writecsv(f'final.{kind}.external.csv',wall)
        scope=['all26_case_equal'] if kind=='sunspider' else ['core16_13suite','expanded17_14suite']
        comparisons=[(cid,l) for l in labels if l!=cid]+[('M','A')]
        if kind=='octane':comparisons.extend([('M','V8_ON'),('A','V8_ON')])
        rng=random.Random(20261105);draws=[[rng.randrange(R) for _ in range(R)] for _ in range(10000)]
        ratios=[];agg=[];directions=[]
        for numerator,denominator in comparisons:
            point=[statistics.median(groups[c][numerator])/statistics.median(groups[c][denominator]) for c in cases]
            bs=[[] for c in cases];bg={s:[] for s in scope}
            for idx in draws:
                values=[statistics.median(groups[c][numerator][i] for i in idx)/statistics.median(groups[c][denominator][i] for i in idx) for c in cases]
                for i,v in enumerate(values):bs[i].append(v)
                for s in scope:bg[s].append(analyze.aggregate(kind,cases,values,s))
            for i,c in enumerate(cases):
                ratios.append(dict(case=c,comparison=numerator+'/'+denominator,ratio=point[i],low95=analyze.pct(bs[i],.025),high95=analyze.pct(bs[i],.975),n=R,
                    direction='numerator lower' if analyze.pct(bs[i],.975)<1 else 'numerator higher' if analyze.pct(bs[i],.025)>1 else 'unclear'))
            for s in scope:agg.append(dict(scope=s,comparison=numerator+'/'+denominator,ratio=analyze.aggregate(kind,cases,point,s),low95=analyze.pct(bg[s],.025),high95=analyze.pct(bg[s],.975),rounds=R,draws=10000,seed=20261105))
            for rep in range(R):
                values=[groups[c][numerator][rep]/groups[c][denominator][rep] for c in cases]
                for s in scope:directions.append(dict(rep=rep,scope=s,comparison=numerator+'/'+denominator,ratio=analyze.aggregate(kind,cases,values,s)))
        analyze.writecsv(f'final.{kind}.ratios.csv',ratios);analyze.writecsv(f'final.{kind}.aggregates.csv',agg);analyze.writecsv(f'final.{kind}.rounds.csv',directions)
        head=['# 全新正式确认：'+kind,'','单位 ms/完整Run；每项每条件30个新进程，首次Run计入，无额外workload预跑。',
            '10000次共享整轮配对bootstrap，seed20261105；95%探索性区间，未作多重校正。原模式两项SunSpider随机输入限制不变。','',
            '| case | N | '+ ' | '.join(l+' median' for l in labels)+' | '+cid+'/A [95%] | '+cid+'/M [95%] |'+(' '+cid+'/V8_ON [95%] |' if kind=='octane' else ''),'|---|---:|'+'---:|'*len(labels)+'---|---|'+('---|' if kind=='octane' else '')]
        wide=[]
        for c in cases:
            value={l:statistics.median(groups[c][l]) for l in labels};rr={r['comparison']:r for r in ratios if r['case']==c}
            def show(other):
                r=rr[cid+'/'+other];return f"{r['ratio']:.4f} [{r['low95']:.4f},{r['high95']:.4f}]"
            head.append('|'+c+'|'+str(proto['info']['N'][c])+'|'+ '|'.join(f'{value[l]:.6g}' for l in labels)+'|'+show('A')+'|'+show('M')+'|'+(show('V8_ON')+'|' if kind=='octane' else ''))
            wide.append(dict(case=c,N=proto['info']['N'][c],**{l+'_median_ms_per_Run':value[l] for l in labels},
                candidate_over_A=rr[cid+'/A']['ratio'],candidate_over_M=rr[cid+'/M']['ratio']))
            if kind=='octane':wide[-1]['candidate_over_V8_ON']=rr[cid+'/V8_ON']['ratio']
        analyze.writecsv(f'final.{kind}.per_case.csv',wide)
        (H/f'final.{kind}.table.md').write_text('\n'.join(head)+'\n',encoding='utf-8',newline='\n')
        summaries.extend(dict(kind=kind,**r) for r in agg)
    analyze.writecsv('final_summary.csv',summaries);print(json.dumps(summaries),flush=True)
if __name__=='__main__':main()

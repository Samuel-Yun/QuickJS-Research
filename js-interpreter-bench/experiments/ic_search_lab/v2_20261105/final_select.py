"""Offline deterministic decision after both rechecks; no new measurements."""
import csv,json
from pathlib import Path
import run
H=run.HERE
def readcsv(n):return list(csv.DictReader((H/n).open(encoding='utf-8')))
def main():
    assert not (H/'decision.json').exists(),'decision already fixed'
    eligible=[];reasons={}
    for cid in run.lab.load(H/'shortlist.json')['selected']:
        for k in ['sunspider','octane']:assert run.lab.load(H/f'{cid}.matched.{k}.recheck.json')['status']=='COMPLETE_RECHECK_NOT_FORMAL'
        agg=readcsv(f'{cid}.octane.aggregates.csv');rounds=readcsv(f'{cid}.octane.rounds.csv');checks=[]
        for other in ['A','M']:
            a=next(x for x in agg if x['scope']=='core16_13suite' and x['comparison']==cid+'/'+other)
            directions=[float(x['ratio']) for x in rounds if x['scope']=='core16_13suite' and x['comparison']==cid+'/'+other]
            good=float(a['ratio'])<1 and float(a['high95'])<1 and sum(x<1 for x in directions)>=2
            checks.append(dict(comparison=cid+'/'+other,ratio=float(a['ratio']),low95=float(a['low95']),high95=float(a['high95']),round_ratios=directions,supported=good))
        assert run.lab.load(H/(cid+'.matched.lifecycle.json'))['status']=='PASS_NARROW_LAYOUT_LIFECYCLE'
        assert run.lab.load(H/('narrow_'+cid+'.results.json'))['status']=='PASS'
        native=run.lab.load(H/'native_manifest.json');assert native
        reasons[cid]=dict(primary_checks=checks,stage='three-round exploratory, not final confirmation')
        if all(c['supported'] for c in checks):eligible.append((checks[0]['ratio'],cid))
    chosen=min(eligible)[1] if eligible else None
    d=dict(status='SELECTED_PENDING_FULL_SAFETY' if chosen else 'COMPLETE_NO_VERIFIED_OVERALL_GAIN',
        candidate=chosen,eligible=[c for _,c in sorted(eligible)],evidence=reasons,
        policy=['recheck_policy.json','final_selection_policy.json'],
        formal_samples=0,final_safety_complete=False,V8_new_measurements=0,
        meaning='selection is not a performance claim; no candidate/source adjustment permitted',
        boot_id=run.lab.load(H/'environment.json')['boot_id'])
    if chosen:d['frozen_candidate']=run.measure.artifact(chosen)
    run.lab.save(H/'decision.json',d);print(json.dumps(d,indent=2))
if __name__=='__main__':main()

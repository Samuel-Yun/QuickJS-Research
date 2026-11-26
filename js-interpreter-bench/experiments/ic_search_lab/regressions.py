"""One pre-frozen bounded check of every >10% matched-screen regression.

Post-hoc diagnostics only: never replace primary samples or rank this subset.
"""
import json
import lab,refine
HERE=lab.HERE
if __name__=='__main__':
    lab.execution_gate()
    for kind in ['sunspider','octane']:
        assert (HERE/f'c004.matched.{kind}.recheck.json').exists(), 'do not overlap recheck timing'
    destination=HERE/'regression_followups.json'
    assert not destination.exists(),'one bounded campaign only, preserve evidence'
    plan=[]
    for path in sorted(HERE.glob('c*.matched.*.screen.json')):
        d=lab.load(path);assert d['build_profile']=='matched'
        cases=sorted(g['case'] for g in d['groups'] if g['ratio']>1.10)
        if cases:plan.append(dict(candidate=d['candidate'],kind=d['kind'],cases=cases,primary=path.name))
    lab.save(HERE/'regression_followup_plan.json',dict(plan=plan,
        selection='all matched initial point regressions >10%, not selected by new results',
        repeats='one A/candidate/A triple per selected case; no second followup; do not replace initial sample',
        aggregate=None,formal=False))
    completed=[]
    for item in plan:
        refine.single(item['candidate'],item['kind'],item['cases'])
        completed.append(item)
    lab.save(destination,dict(status='BOUNDED_FOLLOWUPS_COMPLETE',completed=completed,formal=False,
        note='Both original and followup remain. Inconsistent direction means unconfirmed; no preferred result or subset GM.'))
    print('REGRESSION_FOLLOWUPS_COMPLETE',len(completed),sum(len(r['cases']) for r in completed),flush=True)

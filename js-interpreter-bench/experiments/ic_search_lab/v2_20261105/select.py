"""Freeze the predefined shortlist and the complete coarse-regression set."""
import json
from pathlib import Path
import run
HERE=run.HERE;lab=run.lab
if __name__=='__main__':
    assert not (HERE/'shortlist.json').exists()
    candidates=[];regressions=[]
    for cid in ['s001','s002','s003','s004']:
        sun=list(HERE.glob(cid+'.matched.*sunspider.screen.json'));assert len(sun)==1
        ss=lab.load(sun[0]);oc=lab.load(HERE/(cid+'.matched.octane.screen.json'))
        assert len(ss['groups'])==26 and len(oc['groups'])==17
        candidates.append(dict(id=cid,parent='M',sunspider=ss['ratio_GM'],octane_core=oc['suite_GM']['core16_13suite'],
            octane_expanded=oc['suite_GM']['expanded17_14suite'],sunspider_source=sun[0].name,
            source_and_binary_manifest=cid+'.matched.json'))
        for kind,d in [('sunspider',ss),('octane',oc)]:
            cases=[g['case'] for g in d['groups'] if g['ratio']>1.10]
            if cases:regressions.append(dict(candidate=cid,kind=kind,cases=cases))
    ordered=sorted(candidates,key=lambda r:r['octane_core']);selected=[r['id'] for r in ordered[:2]]
    assert selected==['s001','s004']
    lab.save(HERE/'shortlist.json',dict(selected=selected,all_complete_screen_points=candidates,
        rule='recheck_policy.json, core point ordering; exploratory selection, not confirmed ranking',
        recheck_rounds=3,seed=20261105,new_candidates_allowed=False,
        frozen_artifacts={cid:run.measure.artifact(cid)['sha256'] for cid in selected},
        source_of_s003='one complete new recovery campaign only; original12 partial not merged',
        next='bounded coarse regressions + selected narrow mechanisms; then exactly3 rounds of26+17 per selected candidate'))
    lab.save(HERE/'regression_plan.json',dict(groups=regressions,rule='every complete coarse >10% point regression, exactly one new A/candidate/A triple; no preferred replacement or subset GM'))
    print(json.dumps(dict(selected=selected,regressions=regressions)))

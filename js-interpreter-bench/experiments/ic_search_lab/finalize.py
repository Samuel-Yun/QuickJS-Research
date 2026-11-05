"""Close this bounded search from existing records; NEVER launch a runtime.

Raw/protocol/build identities are immutable. Tables and the candidate status
index are derived; decision.json and manifest.json use write-once lab.save.
"""
import csv,io,json,math
from collections import Counter
from pathlib import Path
import lab

HERE=Path(__file__).resolve().parent
def load(name):return json.loads((HERE/name).read_text(encoding='utf-8'))
def csvout(name,rows):
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)
    (HERE/name).write_text(s.getvalue(),encoding='utf-8')

def main():
    rows=[json.loads(s) for s in (HERE/'runs.jsonl').read_text(encoding='utf-8').splitlines() if s]
    measurements=[r for r in rows if r['event']=='measurement']
    by_token={r['process_token']:r for r in measurements}
    complete=load('regression_followups.json');assert complete['status']=='BOUNDED_FOLLOWUPS_COMPLETE'
    followups=[]
    for item in complete['completed']:
        cid,kind=item['candidate'],item['kind'];original=load(item['primary'])
        d=load(f'{cid}.matched.{kind}.regression_check.json')
        assert set(item['cases'])=={r['case'] for r in d['results']}
        for r in d['results']:
            initial=next(g for g in original['groups'] if g['case']==r['case'])
            assert initial['ratio']>1.10
            triple=[by_token[t] for t in r['tokens']]
            assert [s['condition'] for s in triple]==['A',cid,'A'] and all(s['valid'] for s in triple)
            assert len({s['N'] for s in triple})==1
            a,c,z=[s['elapsed_ms'] for s in triple]
            assert r['ratio']==c/math.sqrt(a*z)
            followups.append(dict(candidate=cid,kind=kind,case=r['case'],N=triple[0]['N'],
                initial_ratio=initial['ratio'],followup_ratio=r['ratio'],followup_A_drift=r['A_drift'],
                followup_A_before_ms=a,followup_candidate_ms=c,followup_A_after_ms=z,
                regression_over10pct_repeated=r['ratio']>1.10,
                interpretation='one followup, not a replacement/CI or a ranking subset'))
    assert len(followups)==10
    csvout('regression_followup_comparison.csv',followups)
    aggregates=[]
    for kind in ['sunspider','octane']:
        with (HERE/f'c004.{kind}.recheck_aggregates.csv').open(encoding='utf-8',newline='') as f:
            for r in csv.DictReader(f):
                r={**r,'ratio':float(r['ratio']),'low95':float(r['low95']),'high95':float(r['high95'])}
                aggregates.append(r)
    against_A=[r for r in aggregates if r['comparison']=='c004/A']
    assert len(against_A)==3 and all(r['low95']<=1<=r['high95'] for r in against_A)
    assert len(list(HERE.glob('c*.matched.sunspider.screen.json')))==12
    assert not any(r['stage']=='formal' for r in measurements)
    counts=Counter('matched' if '.matched.' in r.get('campaign','') else
                   'environment_only' if r['stage']=='environment_stability' else 'legacy_excluded'
                   for r in measurements)
    assert counts=={'matched':1512,'legacy_excluded':471,'environment_only':4}
    decision=dict(status='BOUNDED_SEARCH_COMPLETE_NO_ACCEPTED_CANDIDATE',actual_candidates=12,
        matching_full26_screens=12,matching_full17_coarse_candidates=['c004','c006','c008'],
        provisional_shortlist=['c004'],promoted_candidate=None,
        decision_basis='Predeclared shortlist gate: all three exploratory recheck intervals versus A cross1; round directions are not consistently faster. Stop after12, not after a chosen positive sample.',
        c004_recheck_aggregates=aggregates,verified_improvement_over_A=False,
        small_effect_excluded=False,small_effect_direction='UNKNOWN',
        formal_samples=0,V8_samples=0,full_final_safety_gate='NOT_RUN_NOT_TRIGGERED',
        strict_random_input_pairing='NOT_ESTABLISHED; input_control_limitations.json',
        measurement_counts=dict(counts),all_measurements=len(measurements),
        valid_measurements=sum(r['valid'] for r in measurements),
        historical_incomplete_build='Preserved, not treated as a completed process or performance regression',
        next_candidate_allowed=False,default_implementation_changed=False,
        next_step='No automatic experiment. Discuss whether to resolve frozen random-input policy and seek a larger, mechanism-targeted effect before another separately specified campaign.')
    lab.save(HERE/'decision.json',decision)
    # This is the lab's mutable status index, not a frozen historical manifest.
    with (HERE/'candidates.csv').open(encoding='utf-8',newline='') as f:candidates=list(csv.DictReader(f))
    for r in candidates:
        r['status']='RECHECKED_NOT_PROMOTED' if r['id']=='c004' else 'SCREENED_NOT_PROMOTED'
        r['decision']='No accepted gain over A; bounded search closed. See decision.json.'
        if r['id']=='c004':
            r['recheck']='3 rounds each: SunSpider/A 0.997661, Octane core/A 0.993893, expanded/A 0.989985; all95% intervals cross1'
        if r['id']=='c005':
            r['correctness']='minimal7020 assertions + serialization/loading +192 OOM budgets +12 GC rounds/1800 cyclic instances +qjsc; not sanitizer/full test262'
    csvout('candidates.csv',candidates)
    candidate_ids=[]
    for r in candidates:
        m=load(r['id']+'.matched.json')
        candidate_ids.append(dict(id=r['id'],parent=m['parent'],manifest=r['id']+'.matched.json',
            manifest_sha256=lab.sha(HERE/(r['id']+'.matched.json')),binary_sha256=m['sha256'],
            binary_bytes=m['size'],local_artifact='artifacts/'+r['id']+'.matched.qjs',
            patch='patches/'+r['id']+'.patch',patch_sha256=m['patch_sha256']))
    frozen=load('workspace.json')['artifacts']
    manifest=dict(status=decision['status'],branch='myx',start_commit=load('search_protocol.json')['start_commit'],
        environment='environment.postreboot.json',cohort='WSL2 Ubuntu24.04.2 / x86_64 / AMD Ryzen7 5800H',
        boot_id=load('environment.postreboot.json')['boot_id'],affinity=[2],
        compiler='gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1)13.3.0',
        build='make -B -j1 qjs qjsc; unchanged Makefile; -O2 -g -fwrapv -DHAVE_CLOSEFROM; assertions retained; no LTO/PGO/new NDEBUG',
        upstream_version='2026-06-04',upstream_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',
        frozen_artifacts=frozen,seed_archive='seed_M.tar.gz',seed_archive_sha256=load('workspace.json')['seed_archive_sha256'],
        candidates=candidate_ids,mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',
        formal_mode_entered=False,V8=dict(status='NOT_RUN_THIS_SEARCH',flags_if_final=['--jitless','--no-lazy','--use-ic']),
        evidence_files={name:lab.sha(HERE/name) for name in ['runs.jsonl','host_runs.jsonl','search_protocol.json','shortlist.json',
            'input_control_limitations.json','regression_followups.json','decision.json']},
        private_JWST='Not used/read/copied/modified; excluded from all source archives',
        note='ELFs/active objects are ignored local artifacts. Public source archive plus parent patches restore code, not identical DWARF paths or old timings.')
    lab.save(HERE/'manifest.json',manifest)
    print(json.dumps(dict(status=decision['status'],measurement_counts=dict(counts),followup_cases=len(followups),formal_samples=0),ensure_ascii=False))

if __name__=='__main__':main()

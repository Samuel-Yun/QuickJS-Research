"""Offline current-search tables/audit; old audit.json is historical and unchanged.

No old /home runtime is required. Artifact checking is optional, not statistics.
"""
import argparse,csv,hashlib,io,json,math,statistics,tarfile
import lab
from collections import Counter
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def output(name,data):
    # Derived reports only. Raw, protocol, build manifest and old audit are never rewritten.
    (HERE/name).write_text(data if isinstance(data,str) else json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def csvout(name,rows):
    if not rows:return
    stream=io.StringIO(newline='');w=csv.DictWriter(stream,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(name,stream.getvalue())
def analyze(check_artifacts=False):
    rows=[json.loads(line) for line in (HERE/'runs.jsonl').read_text(encoding='utf-8').splitlines() if line]
    starts={};ends={}
    for r in rows:
        if r['event']=='process_start':assert r['token'] not in starts;starts[r['token']]=r
        if r['event']=='process_result':assert r['token'] not in ends;ends[r['token']]=r
    assert set(ends)<=set(starts)
    for token,r in ends.items():
        s=starts[token];assert r['command']==s['command'] and r['boot_id']==s['boot_id']
        assert r['outer_stop_ns']>=r['outer_start_ns']
    measures=[r for r in rows if r['event']=='measurement'];tokens=set()
    for r in measures:
        token=r['process_token'];assert token not in tokens;tokens.add(token)
        e=ends[token];assert r['exit_code']==e['exit_code']
        if r['valid']:
            assert r['boot_id']==r['boot_id_after']==e['boot_id_after']
            assert r['elapsed_ms']>0 and r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N']
            assert e['stdout'] and not e['stderr'] and not e['timeout'] and e['exit_code']==0
    # UTC labels may adjust; seriality is checked with monotonic intervals per boot.
    per_boot={}
    for r in measures:per_boot.setdefault(r['boot_id'],[]).append(ends[r['process_token']])
    for intervals in per_boot.values():
        intervals.sort(key=lambda r:r['outer_start_ns'])
        for a,b in zip(intervals,intervals[1:]):assert a['outer_stop_ns']<=b['outer_start_ns'],'overlapping performance children'
    # Builds/diagnostics must not overlap measured children, either.
    for e in ends.values():
        if e['token'] in tokens:continue
        for m in per_boot.get(e['boot_id'],[]):
            assert e['outer_stop_ns']<=m['outer_start_ns'] or m['outer_stop_ns']<=e['outer_start_ns'], 'diagnostic/build overlaps performance'
    workspace=load(HERE/'workspace.json');assert sha(HERE/'seed_M.tar.gz')==workspace['seed_archive_sha256']
    if check_artifacts:
        for label in ['A','M']:assert sha(HERE/'artifacts'/(label+'.qjs'))==workspace['artifacts'][label]['sha256']
    ref=load(HERE.parent/'ic_mechanism_audit/attempt01/raw/build/M_clean_release.json')['stdout']
    compile_lines=lambda text:sorted(line.strip() for line in text.splitlines() if line.startswith('gcc ') and ' -c -o ' in line)
    matched_builds=[r for r in ends.values() if r['stage']=='build' and r['exit_code']==0 and (r.get('identity') or {}).get('build_profile')=='matched']
    for r in matched_builds:assert compile_lines(r['stdout'])==compile_lines(ref), 'compiler invocation mismatch '+r['label']
    gcc_lines=lambda text:sorted(line.strip() for line in text.splitlines() if line.startswith('gcc '))
    for r in matched_builds:assert gcc_lines(r['stdout'])==gcc_lines(ref), 'compiler/link invocation mismatch '+r['label']
    with tarfile.open(HERE/'seed_M.tar.gz') as archive:
        for n,h in workspace['source_files'].items():assert hashlib.sha256(archive.extractfile(n).read()).hexdigest()==h
    summaries=[];percase=[]
    for path in sorted(HERE.glob('c*.screen.json')):
        d=load(path);g=d['groups'];expected=26 if d['kind']=='sunspider' else 17
        profile=d.get('build_profile','legacy')
        eligible=profile=='matched' or not (HERE/'build_configuration_issue.json').exists()
        assert len(g)==expected and len({x['case'] for x in g})==expected
        for x in g:
            triple=[next(r for r in measures if r['process_token']==t) for t in x['primary_tokens']]
            assert [r['condition'] for r in triple]==['A',d['candidate'],'A']
            assert len({r['N'] for r in triple})==1 and all(r['valid'] for r in triple)
            a,c,z=[r['elapsed_ms'] for r in triple];assert x['ratio']==c/math.sqrt(a*z)
            percase.append(dict(candidate=d['candidate'],build_profile=profile,eligible_for_IC_inference=eligible,kind=d['kind'],case=x['case'],N=x['N'],
                A_before_ms=a,candidate_ms=c,A_after_ms=z,ratio=x['ratio'],A_drift=x['drift'],status=x['status']))
        gm=math.exp(statistics.mean(math.log(x['ratio']) for x in g));assert gm==d['ratio_GM']
        summaries.append(dict(candidate=d['candidate'],build_profile=profile,eligible_for_IC_inference=eligible,kind=d['kind'],cases=expected,GM_ratio=gm,
            core_suite_GM=d.get('suite_GM',{}).get('core16_13suite'),expanded_suite_GM=d.get('suite_GM',{}).get('expanded17_14suite'),
            unstable=';'.join(d['unstable_cases']),regressions_gt10pct=';'.join(d['greater_than_10pct_regressions']),CI='NOT_APPLICABLE_SINGLE_SCREEN'))
    candidates=list(csv.DictReader((HERE/'candidates.csv').open(encoding='utf-8',newline='')))
    rechecks=[]
    for path in sorted(HERE.glob('c*.matched.*.recheck.json')):
        d=load(path);proto=load(path.with_name(path.name.replace('.recheck.json','.recheck_protocol.json')))
        samples=[r for r in measures if r['campaign']==proto['campaign']]
        assert len(samples)==len(proto['schedule'])==d['expected']==d['count']
        key=lambda r:(r['case'],r.get('condition'),r['rep'],r['order'])
        assert len({key(r) for r in samples})==len(samples)
        assert {key(r) for r in samples}=={key(r) for r in proto['schedule']}
        for g in d['groups']:
            hashes=set()
            for rep,values in enumerate(g['rounds']):
                for condition,value in values.items():
                    s=next(r for r in samples if r['case']==g['case'] and r['condition']==condition and r['rep']==rep)
                    assert s['valid'] and s['elapsed_per_Run_ms']==value and s['N']==g['N']
                    hashes.add(s['identity']['script_sha256'])
            assert len(hashes)==1,'workload script differs by engine/round'
        rechecks.append(dict(candidate=d['candidate'],kind=d['kind'],samples=len(samples),rounds=d['rounds'],valid=True))
    manifests=[]
    minimally_checked=[]
    for row in candidates:
        p=lab.candidate_metadata_path(row['id'])
        if p.exists():
            m=load(p);assert sha(HERE/'patches'/(row['id']+'.patch'))==m['patch_sha256']==row['patch_sha256']
            assert m['sha256']==row['binary_sha256'] and m['source_sha256_before_build']==m['source_sha256_after_build']
            rebuilt=lab.reconstructed_sources(row['id'])
            assert {n:hashlib.sha256(v).hexdigest() for n,v in rebuilt.items()}==m['source_sha256_before_build']
            if check_artifacts:assert sha(HERE/'artifacts'/(row['id']+('.matched' if m.get('build_profile')=='matched' else '')+'.qjs'))==m['sha256']
            for support,h in m.get('build_support_files',{}).items():
                assert support=='compat/test-closefrom.c'
                public=(HERE/'build_support/test-closefrom.c').read_bytes()
                assert hashlib.sha256(public.replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')).hexdigest()==h
            checks=[r for r in ends.values() if r['stage']=='minimal_correctness' and r['label']==row['id'] and
                    (r.get('identity') or {}).get('binary_sha256')==m['sha256']]
            assert len(checks)==1 and checks[0]['exit_code']==0 and not checks[0]['stderr'] and not checks[0]['timeout']
            assert checks[0]['stdout']=='CHECKS_PASS:7020\n' and checks[0]['identity']['input_sha256']==sha(HERE/'checks.js')
            first=min(ends[r['process_token']]['outer_start_ns'] for r in measures if r['condition']==row['id'] and r['identity']['binary_sha256']==m['sha256'])
            assert checks[0]['outer_stop_ns']<=first,'candidate measured before minimal correctness'
            minimally_checked.append(row['id'])
            manifests.append(row['id'])
    # Absolute Linux paths are provenance only: map scripts and inputs into this
    # checkout for offline hashing. Neither /home binaries nor WSL are launched.
    matched=[r for r in measures if '.matched.' in r.get('campaign','')]
    hashes={}
    def checked_hash(p):
        if p not in hashes:hashes[p]=sha(p)
        return hashes[p]
    for r in matched:
        e=ends[r['process_token']];ident=r['identity'];label=r['condition']
        assert ident==e['identity'] and ident['warmup_calls']==0 and ident['N']==r['N']
        expected=workspace['artifacts']['A']['sha256'] if label=='A' else load(HERE/(label+'.matched.json'))['sha256']
        assert ident['binary_sha256']==expected
        script=HERE/'scripts'/e['command'][-1].replace('\\','/').split('/')[-1]
        assert checked_hash(script)==ident['script_sha256']
        for rel,h in ident['input_sha256'].items():assert checked_hash(HERE.parents[1]/rel)==h, rel
        assert ident['flags']==[] or (r['case']=='zlib.zlib' and ident['flags'][0:2]==['--std','-I'])
        assert all(not v.startswith('--trace') for v in ident['flags'])
        prefix='TEB_RESULT:' if r['kind']=='sunspider' else 'OCTANE_IC_RESULT:'
        payloads=[json.loads(line[len(prefix):]) for line in e['stdout'].splitlines() if line.startswith(prefix)]
        assert len(payloads)==1 and payloads[0]==r['payload']
        payload=payloads[0]
        assert payload['case']==r['case'] and payload['N']==r['N'] and payload['correctness']=='PASS' and payload['warmup_calls']==0
        assert payload['elapsed_ms']==r['elapsed_ms']==payload['stop_ms']-payload['start_ms']
        assert payload.get('checksum')==r['checksum']
        if r['kind']=='sunspider':
            allowed=load(HERE.parent/'ic_fast_slow_20261102/attempt01/sunspider/checksum_contract.json')['allowed'][r['case']]
            assert r['checksum'] in allowed
        elif r['case'].startswith('Crypto.'):
            golden=load(HERE.parent/'ic_fast_slow_20261102/attempt01/octane/crypto'/(r['case']+'.N'+str(r['N'])+'.json'))
            assert r['checksum']==golden['final_ciphertext']
    followup_count=0
    if (HERE/'regression_followups.json').exists():
        d=load(HERE/'regression_followups.json');assert d['status']=='BOUNDED_FOLLOWUPS_COMPLETE'
        plan=load(HERE/'regression_followup_plan.json')['plan'];assert d['completed']==plan
        wanted={(i['candidate'],i['kind'],c) for i in plan for c in i['cases']}
        expected={(d['candidate'],d['kind'],g['case']) for d in (load(p) for p in HERE.glob('c*.matched.*.screen.json')) for g in d['groups'] if g['ratio']>1.10}
        assert wanted==expected
        follow=[r for r in matched if r['stage']=='regression_check'];assert len(follow)==len(wanted)*3
        for cid,kind,case in wanted:
            triple=sorted((r for r in follow if r['candidate']==cid and r['kind']==kind and r['case']==case),key=lambda r:r['order'])
            assert [r['condition'] for r in triple]==['A',cid,'A'] and all(r['valid'] for r in triple)
        followup_count=len(wanted)
    orphan=[r for t,r in starts.items() if t not in ends]
    old_orphan=[r for r in orphan if r['timestamp']<'2026-11-04T11:00:00']
    current_orphan=[r for r in orphan if r not in old_orphan]
    repaired=(HERE/'build_configuration_repair_validation.json').exists()
    status='BLOCKED_CURRENT' if (HERE/'STOP_MATCHED').exists() or ((HERE/'STOP_CURRENT').exists() and not repaired) else 'SEARCH_IN_PROGRESS'
    decision=load(HERE/'decision.json') if (HERE/'decision.json').exists() else None
    if decision is not None:
        assert status=='SEARCH_IN_PROGRESS' and not current_orphan
        assert len(manifests)==12 and len(matched_builds)==12 and len(rechecks)==2 and followup_count==10
        assert decision['all_measurements']==len(measures) and decision['formal_samples']==0
        assert len([r for r in summaries if r['build_profile']=='matched' and r['kind']=='sunspider'])==12
        assert len([r for r in summaries if r['build_profile']=='matched' and r['kind']=='octane'])==3
        for r in decision['c004_recheck_aggregates']:
            if r['comparison']=='c004/A':assert r['low95']<=1<=r['high95']
        for name,h in load(HERE/'manifest.json')['evidence_files'].items():assert sha(HERE/name)==h
        status=decision['status']
    result=dict(status=status,process_starts=len(starts),process_completions=len(ends),
       historical_uncompleted_positions=old_orphan,current_uncompleted_positions=current_orphan,
       candidates_built=manifests,candidates_attempted=sum(r['status']!='PLANNED' for r in candidates),
       measurements=len(measures),valid_measurements=sum(r['valid'] for r in measures),
       counts_by_stage=dict(Counter(r['stage'] for r in measures)),completed_screens=summaries,
       formal_samples=sum(r['stage']=='formal' and r['valid'] for r in measures),reliable_improvement=False if decision else None,rechecks=rechecks,
       matching_configuration_measurements=len(matched),legacy_excluded_measurements=len(measures)-len(matched)-sum(r['stage']=='environment_stability' for r in measures),
       matching_measurements_by_stage=dict(Counter(r['stage'] for r in matched)),
       matching_samples_below_1000ms=sum(bool(r.get('below_1000ms')) for r in matched),
       bounded_regression_followup_cases=followup_count,
       screen_eligibility_scope='build configuration only; not proof of strict random-input equality or a causal IC benefit',
       dynamic_random_input_identity='NOT_ESTABLISHED for frozen string-base64/string-validate-input; see input_control_limitations.json',
       old_audit_preserved=True,statistics_need_runtime_files=False,local_artifacts_checked=check_artifacts,
       bootstrap='none for exploratory single screens; do not manufacture CI',
       source_seed_archive_valid=True,all_candidate_patch_chains_reconstruct_compiled_source=True,
       matched_build_compile_commands_equal_frozen_M_reference=True,matched_builds_checked=len(matched_builds),
       matched_link_commands_equal_frozen_M_reference=True,inputs_and_scripts_hashed_offline=True,
       no_recorded_build_or_diagnostic_overlaps_performance=True,
       minimal_correctness_checked_candidates=minimally_checked,stdout_correctness_payloads_reparsed=True)
    csvout('screen_summary.csv',summaries);csvout('screen_per_case.csv',percase);output('search_audit.json',result)
    print(json.dumps({k:result[k] for k in ['status','candidates_built','measurements','valid_measurements','counts_by_stage','formal_samples']},ensure_ascii=False))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--check-artifacts',action='store_true');a=p.parse_args();analyze(a.check_artifacts)

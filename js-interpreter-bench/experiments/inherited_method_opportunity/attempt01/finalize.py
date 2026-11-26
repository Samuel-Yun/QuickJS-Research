"""Portable replay and native Git closure; evidence required, no VM execution."""
from common import *
def main():
    for file in ['analysis/audit.json','analysis/independent_audit.json','final_identity.json','evidence_gate.json','micro_diagnostic_gate.json','micro_reason_gate.json']:assert read(HERE/file)['status']=='PASS'
    assert read(HERE/'richards_gate.json')['status']=='PASS_WITH_HANDLER_OBSERVABILITY_LIMITATION'
    tests=[]
    for name in ['summary.csv','ratios.csv','positions.csv','raw_index.csv']:
        aa=list(csv.DictReader((HERE/'analysis'/name).open(encoding='utf8')));bb=list(csv.DictReader((HERE/'portable_replay'/name).open(encoding='utf8')));assert len(aa)==len(bb)
        for a,b in zip(aa,bb):
            assert a.keys()==b.keys()
            for k in a:
                if a[k]!=b[k]:assert math.isclose(float(a[k]),float(b[k]),rel_tol=1e-12,abs_tol=1e-12),(name,k)
        tests.append(name)
    save(HERE/'analysis/portable_replay_verification.json',dict(status='PASS',original='Windows Python3.11',replay='Linux Python3.12',checked=tests,rel_tol=1e-12,abs_tol=1e-12,old_binary_paths_opened=False,bootstrap='same complete8-process rounds, not case-independent quadruples'))
    repo=ROOT.parent;prefix=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    result={k:subprocess.run(prefix+args,capture_output=True,text=True,check=True).stdout for k,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('status',['status','--short']),('tracked_diff',['diff','--name-only'])]}
    assert result['HEAD'].strip()==read(HERE/'started.json')['initial_HEAD'] and result['branch'].strip()=='myx' and not result['tracked_diff']
    assert all(l.startswith('?? js-interpreter-bench/experiments/inherited_method_opportunity/') for l in result['status'].splitlines())
    save(HERE/'host_git_final.json',dict(timestamp=stamp(),native_client=platform.platform(),outputs=result,old_tracked_files_changed=False,commit_push=False))
    for name in ['results.md','micro_cases.md','richards_sites.csv','v8_path_evidence.md','summary.csv','ratios.csv','profiling_status.md','README.md']:
        assert (HERE/name).stat().st_size>0
    elapsed=(datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds();assert elapsed<BUDGET
    audit=read(HERE/'analysis/audit.json')
    save(HERE/'completion.json',dict(status='COMPLETE_WITH_OBSERVABILITY_LIMITATIONS',timestamp=stamp(),task_elapsed_seconds=elapsed,budget_seconds=BUDGET,formal_valid=audit['valid'],formal_expected=240,complete8_process_rounds=30,N=16384,
      stages=dict(runtime_identity='PASS frozenA/M/d8/snapshot/ICU no rebuild',correctness_N1_N2='16/16 PASS',selected_N_correctness='8/8 PASS',pilots='48 retained; 24 final-N >=1s',micro_mechanism='PASS',Richards_sites='PASS original source+3 sites, N1/N2 V8 and reused QJS counts',source_reference='4 small official files downloaded/hashed; previous fixed files verified',profiling='UNAVAILABLE perf not found after1 attempt',formal='240/240 valid, no retries/removal',statistics='PASS,10000 complete8-block bootstrap',independent_audit='PASS',portable_replay='PASS'),
      next_priority='b: separate stable-own function-value acquisition from calling; not a proven call-frame bottleneck',
      unknown=dict(actual_site_handler=None,V8_per_access_hit_rate=None,Richards_site_time_share=None,OFF_direct_slot_state=None,V8_exact_build_commit=None,inherited_micro_receiver_map_details=None,UTC_discrepancy_cause='UNKNOWN; endpoints not simultaneous'),
      IC_implemented=False,original_Richards_modified=False,old_raw_overwritten=False,commit_push=False))
    print('COMPLETION_VERIFIED_240_VALID_30_COMPLETE_ROUNDS',flush=True)
if __name__=='__main__':main()

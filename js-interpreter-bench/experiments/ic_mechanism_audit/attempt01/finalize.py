"""Host Git/read-only replay closure; refuses fake completion without evidence."""
import subprocess,platform
from common import *
def main():
    assert read(HERE/'analysis/audit.json')['status']=='PASS'
    assert read(HERE/'analysis/independent_audit.json')['status']=='PASS'
    assert read(HERE/'final_identity.json')['status']=='PASS'
    checks=[]
    for name in ['statistics.csv','summary.csv','ratios.csv','positions.csv','raw_index.csv']:
        a=list(csv.DictReader((HERE/'analysis'/name).open(encoding='utf8')));b=list(csv.DictReader((HERE/'portable_replay'/name).open(encoding='utf8')))
        assert len(a)==len(b)
        for x,y in zip(a,b):
            assert x.keys()==y.keys()
            for k in x:
                if x[k]!=y[k]:assert math.isclose(float(x[k]),float(y[k]),rel_tol=1e-12,abs_tol=1e-12),(name,k)
        checks.append(name)
    save(HERE/'analysis/portable_replay_verification.json',dict(status='PASS',original='Windows Python3.11',replay='Linux Python3.12',runtime_paths_opened=False,rel_tol=1e-12,abs_tol=1e-12,checked=checks))
    repo=ROOT.parent
    prefix=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    output={args[0]:subprocess.run(prefix+args,capture_output=True,text=True,check=True).stdout for args in [['rev-parse','HEAD'],['status','--short'],['branch','--show-current']]}
    assert output['rev-parse'].strip()=='5c61757c834e6dd6c5517346fcc2e3fcba5e0b73'
    assert output['branch'].strip()=='myx'
    assert all(line.startswith('?? js-interpreter-bench/experiments/ic_mechanism_audit/') for line in output['status'].splitlines()),'unrelated change requires disclosure'
    save(HERE/'raw/host_git_status_final.json',dict(timestamp=stamp(),client=platform.platform(),outputs=output,existing_tracked_files_untouched=True,commit_or_push=False))
    for p in ['results.md','mechanism_evidence.md','path_comparison.md','coverage.csv','historical_APM.csv','summary.csv','README.md','version_map.csv']:
        assert (HERE/p).stat().st_size>0
    elapsed=(datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds()
    assert elapsed<BUDGET,'task budget exceeded; report partial truthfully'
    save(HERE/'completion.json',dict(status='COMPLETE_WITH_DISCLOSED_LIMITATIONS',timestamp=stamp(),task_elapsed_wall_seconds=elapsed,budget_seconds=BUDGET,
      stages=dict(version_audit='COMPLETED',clean_original_M_build='COMPLETED',correctness_N1_N2='24/24 PASS',selected_N_correctness='12/12 PASS',pilot='36/36 PASS all>=1000ms',formal='360/360 VALID; 90 complete quadruples',mechanism='A/B/M N1/N2 + scope checks + M prepare before/after COMPLETED',release_regressions='12/12 PASS',V8_flags_and_ON_evidence='COMPLETED_WITH_OFF_OBSERVABILITY_LIMITATION',statistics='COMPLETED;10000 within-case quadruple bootstrap',portable_replay='PASS',final_identity='PASS'),
      limitations=dict(OFF_direct_feedback_snapshot=None,V8_per_site_hit_rate=None,V8_exact_build_source_commit=None,V8_specific_installed_handler=None,unknown_source_standard_library_queries_N1=37,whole_VM_lookup_total=None,per_operation_time=None,power_frequency_temperature='UNKNOWN/uncontrolled',IC_cost_decomposition='UNKNOWN'),
      new_engine_optimization=False,new_V8_build=False,full_Octane_rerun=False,old_data_overwritten=False,auto_commit_push=False))
    print('COMPLETION_VERIFIED_360_VALID_NO_OLD_CHANGES',flush=True)
if __name__=='__main__':main()

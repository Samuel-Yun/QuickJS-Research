"""Public-record integrity, true partial counts and workspace closure. No engine access."""
import collections
from common import *
def main():
    rows=[read(p) for p in (HERE/'raw/formal').rglob('*.json')];plan=read(HERE/'schedule.json')
    actual={(r['case'],r['condition'],r['rep']):r for r in rows};cases=read(HERE/'formal_cases.json')
    common=[rep for rep in range(30) if all((k,c,rep) in actual and actual[k,c,rep]['valid'] for k in cases for c in CONDITIONS)]
    order=collections.Counter((r['case'],r['condition'],r['order']) for r in rows)
    actual_order=[dict(case=k,condition=c,position=p,completed=order[k,c,p],planned=6) for k in cases for c in CONDITIONS for p in range(5)]
    csvout(HERE/'summary/actual_order_counts.csv',actual_order)
    stop=read(HERE/'campaign_stop.json');frozen=read(HERE/'frozen.json')
    for p,h in frozen['files'].items():assert sha(HERE/p)==h,p
    assert sha(HERE/'analyze.py')==read(HERE/'analysis_ready.json')['analyzer_sha256']
    assert len(rows)==2181 and sum(r['valid'] for r in rows)==2181 and len(common)==25
    starts=list((HERE/'raw/started/formal').rglob('*.json'));assert len(starts)==2182
    assert stop['started_without_completion']==1 and stop['completed_missing']==369
    repo=ROOT.parent;prefix=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    git={}
    for name,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('tracked_diff',['diff','--name-only']),('status',['status','--short'])]:
        p=subprocess.run(prefix+args,capture_output=True,text=True);assert p.returncode==0
        git[name]=dict(command=prefix+args,stdout=p.stdout,stderr=p.stderr,exit_code=p.returncode)
    assert git['tracked_diff']['stdout']=='' and git['branch']['stdout'].strip()=='myx'
    for p,h in read(HERE/'reused_evidence.json')['files'].items():assert sha(ROOT/p)==h
    files=[p for p in HERE.rglob('*') if p.is_file()]
    assert not any(p.name=='qjs' or p.suffix in ['.o','.pyc'] for p in files)
    assert max(p.stat().st_size for p in files)<100*1024**2
    save(HERE/'audit.json',dict(status='PARTIAL_GLOBAL_BOOT_CHANGED',timestamp=stamp(),formal_expected=2550,formal_completed=2181,formal_valid=2181,observed_completed_failures=0,started_without_completion=1,started_execution_or_exit='UNKNOWN',completion_missing=369,positions_without_start_marker=368,base_expected=2400,base_valid=sum(r['case'] in BASE_CASES and r['valid'] for r in rows),zlib_expected=150,zlib_valid=sum(r['case']=='zlib.zlib' and r['valid'] for r in rows),complete_global_rounds=common,correctness_N1_N2='170/170',selected_N_correctness='85/85',pilot='170/170',planned_each_condition_each_position_six=True,actual_full_position_balance=all(r['completed']==6 for r in actual_order),actual_order_counts='summary/actual_order_counts.csv',raw_integrity_checks_passed=True,full_30_round_protocol_completed=False,original_analyzer_unchanged=True,summary_audit_balance_flag_scope='plan only; actual balance is not achieved',primary_aggregate='UNAVAILABLE, not30 rounds',common25_aggregate='exploratory post-interruption addition, separately labeled',old_boot=frozen['boot_id'],post_interrupt_boot=read(HERE/'identity_after.json')['boot_id'],continuous_end_cohort_verified=False,post_interrupt_ELF_dependency_hashes='MATCH',interruption_cause='UNKNOWN',old_tracked_files_unchanged=True,new_engine_builds=0,new_IC_changes=0,new_performance_after_interrupt=0,switch_sanitizer='NOT_COMPLETED_BUILD_INTERRUPTED',automatic_commit=False,push=False))
    save(HERE/'workspace_closing.json',dict(timestamp=stamp(),git=git,file_count_before_closure=len(files),bytes_before_closure=sum(p.stat().st_size for p in files),max_file_bytes=max(p.stat().st_size for p in files),engine_objects_or_binaries_added=0))
    print('PARTIAL_INTEGRITY_PASS; matrix remains incomplete; no cross-boot retry; old tracked files unchanged')
if __name__=='__main__':main()

"""Local metadata closure and a wide, case-insensitive-safe CSV table."""
import ast
import csv
import gzip
import hashlib
import subprocess
from datetime import datetime,timezone
from run import HERE,read,save,sha,csvout


def table():
    with (HERE/'analysis_performance/summary.csv').open(encoding='utf-8',newline='') as f:ss=list(csv.DictReader(f))
    with (HERE/'analysis_performance/ratios.csv').open(encoding='utf-8',newline='') as f:rr=list(csv.DictReader(f))
    rows=[]
    for case in ['prototype_method','own_method','own_integer','numeric_control','Richards.Richards']:
        row=dict(case=case)
        for c in ['A','M','H']:
            r=next(x for x in ss if x['case']==case and x['condition']==c and x['metric']=='internal_ms_per_Run')
            row['outer_N']=r['N']
            for name in ['n','median','Q1','Q3','min','max']:
                row[c+'_'+('valid_samples' if name=='n' else name+'_ms_per_Run')]=r[name]
        for ratio in ['H/M','H/A','M/A']:
            r=next(x for x in rr if x['case']==case and x['ratio']==ratio and x['metric']=='internal_ms_per_Run')
            label=ratio.replace('/','_over_')
            for key in ['point','CI95_low','CI95_high','time_change_percent','CI95_change_low','CI95_change_high','direction']:
                row[label+'_'+key]=r[key]
        rows.append(row)
    csvout(HERE/'summary.csv',rows)


def main():
    assert read(HERE/'analysis_performance/audit.json')['status']=='PASS'
    assert read(HERE/'evidence_audit.json')['status']=='PASS'
    assert read(HERE/'identity_closing.json')['status']=='PASS'
    for p in HERE.glob('*.py'):ast.parse(p.read_text(encoding='utf-8'))
    for entry in read(HERE/'raw/special_archives.json'):
        p=HERE/entry['path'];assert sha(p)==entry['compressed_sha256']
        assert hashlib.sha256(gzip.decompress(p.read_bytes())).hexdigest()==entry['raw_sha256']
    table()
    repo=HERE.parents[3]
    def git(*args):
        cmd=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args]
        r=subprocess.run(cmd,capture_output=True,text=True);assert r.returncode==0,r.stderr
        return r.stdout.strip()
    state=dict(HEAD=git('rev-parse','HEAD'),branch=git('branch','--show-current'),status=git('status','--short'),
               tracked_diff=git('diff','--name-only'),staged_diff=git('diff','--cached','--name-only'))
    assert state['HEAD']=='ce6a4ac11d997e1191a31508c64198599cd38e61' and state['branch']=='myx'
    assert not state['tracked_diff'] and not state['staged_diff']
    save(HERE/'workspace_closing.json',state)
    performance=read(HERE/'analysis_performance/audit.json')
    start=read(HERE/'started.json')['timestamp'];end=datetime.now(timezone.utc).isoformat()
    files=[p for p in HERE.rglob('*') if p.is_file()]
    forbidden=[str(p.relative_to(HERE)) for p in files if p.suffix in ['.o','.exe','.so','.pyc'] or p.name in ['qjs','qjsc']]
    assert not forbidden,forbidden
    records=dict(status='H_IMPLEMENTED_VALIDATED_NO_SUPPORTED_NET_GAIN',timestamp=end,started_recorded_UTC=start,
       elapsed_recorded_UTC_seconds=(datetime.fromisoformat(end)-datetime.fromisoformat(start)).total_seconds(),
       admission='PASS_NONZERO_ALL_THREE_RICHARDS_SITES',H_sha256=read(HERE/'H_manifest.json')['sha256'],
       semantic_correctness=dict(expected=96,actual_valid=96,independent_cases=8,modes=2),
       workload_correctness_N1_N2=30,selected_N_correctness=15,admission_processes=4,
       matched_M_H_workload_mechanism_processes=20,guard_coverage_diagnostic_processes=14,
       additional_lifecycle_diagnostic_processes=1,internal_regression='PASS',COW_OOM_failures_checked=32,
       sanitizer='ASan+UBSan targeted PASS; not complete test262',formal=performance,
       source_and_binary_identity='PASS',independent_raw_audit='PASS',
       final_prepared_bytecode_M_H=dict(compiled_functions=200,identical=True),
       diagnostic_requested_array_bytes_Richards=dict(M=4976,H=7464),actual_sizeof_site=dict(M=16,H=24),
       unknown=['peak indirectly retained shape/object bytes','RSS effect','per-step time attribution','cause of numeric_control change','host power/frequency and Windows background control'],
       limitations=['one WSL2 host','visible variability and exploratory intervals','no multiple-testing correction','native layout/compiler decisions not isolated'],
       VM_optimizations_this_round='restricted H only',V8_processes=0,old_tracked_files_modified=False,
       automatic_commits=False,push=False,all_outliers_retained=True,automatic_retries=False,
       failure_records=['correctness/failure_01.md','correctness/failure_02.md','correctness/failure_03.md','correctness/failure_04.md'],
       files_before_closure=len(files),bytes_before_closure=sum(p.stat().st_size for p in files),next_phase_run=False)
    save(HERE/'completion.json',records)
    print('COMPLETE_NO_SUPPORTED_NET_GAIN',end,flush=True)


if __name__=='__main__':main()

"""Seal actual public bytes + LF-normalized hashes, without staging/committing."""
import ast,csv,hashlib,json,subprocess
from pathlib import Path
from datetime import datetime,timezone
P=Path(__file__).resolve().parent;ROOT=P.parents[2]
def j(p):return json.loads(p.read_text(encoding='utf8'))
def h(b):return hashlib.sha256(b).hexdigest()
def save(p,x):
    b=(json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def main():
    assert j(P/'independent_audit.json')['status']=='PASS' and j(P/'final_identity.json')['status']=='PASS'
    for p in P.glob('*.py'):ast.parse(p.read_text(encoding='utf8'),filename=str(p))
    cmd=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    head=subprocess.run(cmd+['rev-parse','HEAD'],capture_output=True,text=True,check=True).stdout.strip();status=subprocess.run(cmd+['status','--short'],capture_output=True,text=True,check=True).stdout
    assert head=='85857fbff949266958615991b388e44b448fef87' and status.strip()=='?? js-interpreter-bench/experiments/call_boundary_cost/'
    for args in [['diff','--quiet'],['diff','--cached','--quiet']]:assert subprocess.run(cmd+args).returncode==0
    rel=P.relative_to(ROOT.parent).as_posix();attrs=subprocess.run(cmd+['check-attr','text','eol','--',rel+'/sampler.c',rel+'/inputs/shared.js',rel+'/raw/samples/validation_p23000/local_function_call/rep0.SHIM_ON.N16384.p23000.samples.bin.gz'],capture_output=True,text=True,check=True).stdout
    assert 'sampler.c: eol: lf' in attrs and 'inputs/shared.js: text: unset' in attrs
    save(P/'host_git_final.json',dict(timestamp=datetime.now(timezone.utc).isoformat(),HEAD=head,status=status,old_tracked_files_unchanged=True,staging_or_commit=False,push=False,attributes=attrs))
    start=datetime.fromisoformat(j(P/'started.json')['timestamp']);usable=datetime.fromisoformat(j(P/'checkpoints/02_sampler_usable.json')['timestamp']);setup_seconds=(usable-start).total_seconds();assert setup_seconds<3600
    now=datetime.now(timezone.utc);resume_seconds=(now-datetime.fromisoformat(j(P/'recovery_clock.json')['timestamp'])).total_seconds();assert resume_seconds<5400
    save(P/'completion.json',dict(status='BLOCKED_PERTURBATION',execution_and_failure_report_closed=True,cost_attribution_complete=False,timestamp=now.isoformat(),first_validation=dict(target=108,actual_valid=107,complete_rounds=11,missing_unstarted=1,missing_not_retried=True),fallback_validation=dict(target=108,actual_valid=108,complete_rounds=12),total_validation_records=215,correctness_N1_N2=18,selected_correctness_total=18,compressed_archives_verified=572,validation_ON_window_PC_samples=29241,long_windows_planned=9,long_windows_actual=0,unchanged_engineering_thresholds=True,fallback_count=1,decision_rule=4,sampler_setup_seconds=setup_seconds,resume_phase_elapsed_seconds=resume_seconds,original_wall_clock_exceeded_due_interruption_disclosed=True,BASE_and_VM_objects_unchanged=True,independent_raw_only_audit='PASS',new_VM_optimization=False,old_tracked_files_untouched=True,not_run=['long_window_profiles','full_native_cost_partition','new_SHIM_full_bytecode_direct_dump'],UNKNOWN=['relative call boundary cost in original A','Richards call boundary importance','cause of host timing variability','exact source of UTC discontinuity']))
    files={}
    for p in sorted(P.rglob('*')):
        if not p.is_file() or '__pycache__' in p.parts or p.name=='public_files_sha256.json':continue
        b=p.read_bytes();assert len(b)<10000000
        try:b.decode('utf8');lf=h(b.replace(b'\r\n',b'\n'))
        except UnicodeDecodeError:lf=None
        files[p.relative_to(P).as_posix()]=dict(actual_bytes_sha256=h(b),LF_normalized_sha256=lf,bytes=len(b))
    save(P/'public_files_sha256.json',dict(policy='actual working-tree artifact bytes and separately LF-normalized UTF8 bytes; not a claim of post-commit verification; inputs/scripts/gzip use -text',files=files))
    print('SEALED_BLOCKED_PERTURBATION;215 retained;0 long windows;old files untouched')
if __name__=='__main__':main()

"""Final public replay/hash/worktree checkpoint, no benchmark subprocess."""
from common import *
def main():
    assert platform.system()=='Windows';audit=read(HERE/'analysis/audit.json');assert audit['status']=='PASS'
    assert read(HERE/'independent_audit.json')['status']=='PASS' and read(HERE/'final_identity.json')['status']=='PASS' and read(HERE/'call_gate.json')['status']=='PASS'
    expected={'QJS_A':'584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1','QJS_M':'7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef','V8_ON':'83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133'}
    assert {c:v['sha256'] for c,v in read(HERE/'manifest.json')['artifacts'].items()}==expected
    for p in (HERE/'analysis').iterdir():
        if p.is_file():assert sha(p)==sha(HERE/'replay_linux'/p.name),p.name
    cmd=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    status=subprocess.run(cmd+['status','--short'],capture_output=True,text=True,check=True).stdout
    head=subprocess.run(cmd+['rev-parse','HEAD'],capture_output=True,text=True,check=True).stdout.strip()
    assert head==read(HERE/'started.json')['initial_HEAD']
    assert status.strip()=='?? js-interpreter-bench/experiments/function_value_call_path/',status
    save(HERE/'host_git_final.json',dict(HEAD=head,status=status,tracked_old_files_changed=False,commit_or_push=False,timestamp=stamp()))
    files=[p for p in HERE.rglob('*') if p.is_file() and '__pycache__' not in p.parts]
    assert all(p.stat().st_size<10000000 for p in files)
    spent=(datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds();assert spent<BUDGET
    save(HERE/'public_files_sha256.json',{p.relative_to(HERE).as_posix():sha(p) for p in sorted(files) if p.name not in ['completion.json','public_files_sha256.json']})
    save(HERE/'completion.json',dict(status='COMPLETED',timestamp=stamp(),formal_valid=audit['valid'],formal_expected=360,complete_rounds=30,N=16384,correctness_N1_N2=24,correctness_selected_N=12,property_diagnostic_processes=16,call_diagnostic_processes=16,V8_bytecode_processes=4,independent_audit='PASS',Windows_Linux_raw_only_replay_byte_identical=True,old_tracked_files_untouched=True,formal_runtime_unchanged=True,new_VM_optimization=False,elapsed_task_checkpoint_seconds=spent,total_budget_seconds=BUDGET,limitations=['per-component native self-time UNKNOWN','exact d8 build commit UNKNOWN','V8 per-site handler/hit rate UNKNOWN','UTC metadata discrepancy retained','host frequency/power/background uncontrolled'],decision='one missing cost attribution for local bytecode-call entry/normal return, no optimization yet'))
    print('COMPLETED: 360/360, audits PASS, replay byte-identical, no old tracked edits',flush=True)
if __name__=='__main__':main()

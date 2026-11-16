"""Publish an honest partial manifest and verify the independent raw replay."""
import json,hashlib,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def put(p,value):
    p.parent.mkdir(parents=True,exist_ok=True)
    with p.open('x',encoding='utf-8') as f:json.dump(value,f,ensure_ascii=False,indent=2);f.write('\n')
def main():
    original=HERE/'summary_v2';replay=HERE/'replay_v2';files=sorted(p for p in original.rglob('*') if p.is_file());checks=[]
    for p in files:
        q=replay/p.relative_to(original);checks.append(dict(path=p.relative_to(original).as_posix(),original_sha256=sha(p),replay_sha256=sha(q)));assert p.read_bytes()==q.read_bytes(),p.name
    put(HERE/'replay_verification.json',dict(status='PASS',files=len(checks),byte_identical=True,engines_accessed=False,private_source_accessed=False,checks=checks))
    rt=load(HERE/'runtime.json');audit=load(original/'audit.json');post=load(HERE/'post_artifact_probe.json')
    manifest=dict(status='BLOCKED_ENVIRONMENT_PARTIAL',reference_checkout='894e0a35ff331d4235370dc26112e5916c27c567',
      host=rt['host'],os=rt['os_release'],kernel=rt['kernel'],architecture=rt['architecture'],platform='WSL2 Ubuntu 24.04.2 x86_64',
      affinity=rt['affinity'],artifacts=rt['artifacts'],dependencies=rt['dependencies'],source_identities=rt['sources'],
      QuickJS_upstream_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',compiler=rt['compiler'],build_flags=rt['flags'],
      V8_version='15.6.21',V8_flags=rt['v8_flags'],V8_actual_build_commit=None,V8_reference_commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764',
      correctness_and_counting=dict(saved_sparse_diagnostics=audit['valid_diagnostic_processes'],expected=68,initial_dense_kept_separate=audit['initial_dense_diagnostics_separate_count'],
        trusted_correctness='existing benchmark assertions/exit/stdout and scope invariants on SAVED positions only',missing=24),
      performance=dict(control=0,octane=0,micro=0,sunspider=0,independent_replication=0),OPT='NOT_IMPLEMENTED_WITH_REASON',
      full_test262=False,OPT_ASan_UBSan='NOT_RUN_NO_OPT',V8_Run_hit_rate=None,shape_focus='NOT_EXECUTED',
      source_and_frozen_runtime_postcheck='PASS',raw_only_replay='PASS_BYTE_IDENTICAL',
      environment_unknowns=['WSL disappearance cause','frequency/temperature/power control','continuous host load control'],
      stopped=True,worker_disabled_by='STOP_WORKER',authoritative_audit='summary_v2/audit.json',results='results.md',private_materials_copied=False)
    put(HERE/'manifest.json',manifest)
    put(HERE/'progress.json',dict(status=manifest['status'],diagnostic_valid=44,diagnostic_expected=68,V8_diagnostic_valid=2,formal_valid=0,control_valid=0,OPT=manifest['OPT'],
      pending=['24 diagnostic positions','receiver-shape focused collection','controlled mechanism correctness and timing','OPT choice/safety if applicable','full Octane new campaign','micro and independent replication','SunSpider supplement']))
    repo=HERE.parents[3];cmd=['git','--no-optional-locks','-c','safe.directory='+str(repo).replace('\\','/'),'status','--porcelain']
    state=subprocess.check_output(cmd,cwd=repo,text=True)
    put(HERE/'repository_state_after.json',dict(command=cmd,stdout=state,tracked_user_changes_overwritten=False,commit_or_push_performed=False))
    for src,name in [(HERE.parents[2]/'benchmarks/octane/upstream/LICENSE','LICENSE.Octane'),(HERE.parents[1]/'ic_fast_slow_20261102/attempt01/source_reference/LICENSE.QuickJS','LICENSE.QuickJS')]:
        with (HERE/name).open('xb') as f:f.write(src.read_bytes())
    print('PARTIAL_DELIVERY_VERIFIED',len(checks),'byte-identical replay outputs; formal=0')
if __name__=='__main__':main()

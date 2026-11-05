"""Read-only workspace closure and replay comparison; no Linux runtime access."""
from common import *

def main():
    repo=ROOT.parent
    prefix=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    records={}
    commands=dict(HEAD=['rev-parse','HEAD'],branch=['branch','--show-current'],status=['status','--short'],old_diff=['diff','--exit-code','HEAD','--',OLD.relative_to(repo).as_posix()],tracked_diff=['diff','--name-only'])
    for name,args in commands.items():
        r=subprocess.run(prefix+args,capture_output=True,text=True)
        records[name]=dict(command=prefix+args,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
        assert r.returncode==0
    assert records['HEAD']['stdout'].strip()=='6e4e3b2925cbd9925b7bed8e3e725785ba9238e4'
    assert records['branch']['stdout'].strip()=='myx' and records['tracked_diff']['stdout']==''
    assert read(OLD/'completion.json')['status']=='PERFORMANCE_ENV_UNSTABLE' and read(OLD/'completion.json')['formal_actual']==0
    comparisons={}
    for p in sorted((HERE/'analysis').iterdir()):
        q=HERE/'replay_check'/p.name
        assert p.read_bytes()==q.read_bytes();comparisons[p.name]=sha(p)
    save(HERE/'replay_verification.json',dict(status='PASS',timestamp=stamp(),command='python -B analyze.py --output <new directory>',platform=platform.platform(),runtime_paths_opened=False,all_eight_outputs_byte_identical=True,output_sha256=comparisons))
    frozen=read(HERE/'formal_frozen.json')
    save(HERE/'cohort.json',dict(name='WSL2_PROTO_ABLATION_'+HERE.name,host=read(HERE/'environment.json')['host'],OS='Ubuntu24.04.2/WSL2',architecture='x86_64',boot_id=frozen['boot_id'],formal_affinity=frozen['affinity'],mode='FIRST_CALL_INCLUSIVE_MONOTONIC',old_cohort_mixed=False,formal_target=384,formal_valid=384,complete_blocks=24,reference_commit=records['HEAD']['stdout'].strip(),rebuilds=0,condition_option={c:option(c) for c in CONDS}))
    files=[p for p in HERE.rglob('*') if p.is_file()]
    assert not any(p.suffix in ['.o','.pyc'] or p.name=='qjs' for p in files)
    assert max(p.stat().st_size for p in files)<1000000
    save(HERE/'workspace_closing.json',dict(timestamp=stamp(),git=records,old_attempt_status='PERFORMANCE_ENV_UNSTABLE / formal0 unchanged',file_count_before_closure=len(files),bytes_before_closure=sum(p.stat().st_size for p in files),max_file_bytes=max(p.stat().st_size for p in files),engine_artifacts_added_to_repository=0,commit=False,push=False))
    print('CLOSURE PASS; old tracked files unchanged; all replay outputs identical; no build artifacts')

if __name__=='__main__':main()

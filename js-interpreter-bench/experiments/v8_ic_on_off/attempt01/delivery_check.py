"""Independent delivery checks only: never executes a VM or a benchmark."""
import ast
from collections import Counter
from common import *

def main():
    audit=read(HERE/'summary/audit.json')
    assert audit['status']=='BLOCKED_IC_INTERVENTION'
    assert audit['formal_actual']==audit['formal_valid']==audit['formal_failed']==audit['pilot_actual']==0
    assert audit['formal_N'] is None and not audit['formal_authorized']
    assert audit['selected_OFF_no_cache_state_verified'] is None
    assert audit['ic_intervention_verified'] is None
    identities=read(HERE/'identity_after.json')
    assert identities['status']=='PASS' and identities['source_files_checked']==77
    m=read(HERE/'runtime.json')
    assert identities['quickjs_sha256']==m['quickjs']['binary']['sha256']
    assert identities['v8_sha256']==m['v8']['binary']['sha256']
    correct=read(HERE/'correctness/results.json')
    assert len(correct)==18 and all(r['valid'] and r['exit_code']==0 for r in correct)
    assert Counter((r['case'],r['condition'],r['N']) for r in correct)==Counter((s,c,n) for s in CASES for c in CONDITIONS for n in (1,2))
    scripts={}
    commands=prefixes()
    for r in correct:
        p=HERE/'probes/correctness'/f"{r['case']}.N{r['N']}.js"
        assert sha(p)==r['script_sha256']
        key=(r['case'],r['N']);scripts.setdefault(key,set()).add(r['script_sha256'])
        raw=read(HERE/'raw/capability'/f"correctness_{r['case']}_N{r['N']}_{r['condition']}.1.json")
        assert raw['command'][:-1]==commands[r['condition']]
        assert raw['exit_code']==0 and raw['stderr']==''
    assert all(len(v)==1 for v in scripts.values())
    replaychecks=[]
    for folder in sorted((HERE/'replays').glob('evidence_*')):
        r=read(folder/'replay_audit.json')
        assert r['status']=='PASS' and not r['performance_samples_started']
        for name in r['outputs']:
            assert sha(folder/name)==sha(HERE/'summary'/name)
        replaychecks.append(dict(directory=folder.relative_to(HERE).as_posix(),outputs_checked=len(r['outputs']),scope=r['scope']))
    assert len(replaychecks)>=2
    code=list(HERE.glob('*.py'))
    for p in code:ast.parse(p.read_text(encoding='utf-8'),filename=str(p))
    files=[p for p in HERE.rglob('*') if p.is_file() and '__pycache__' not in p.parts]
    assert all(p.suffix not in {'.o','.a','.so','.exe','.zip'} for p in files)
    assert all(p.stat().st_size<1048576 for p in files)
    repo=ROOT.parent
    git=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    def query(args):
        r=subprocess.run(git+args,capture_output=True,text=True,check=True)
        return r.stdout.strip()
    assert query(['rev-parse','HEAD'])=='20ebb34abc6f7b311b12f97a4d46553ec2074c18'
    assert query(['branch','--show-current'])=='myx'
    assert query(['diff','--name-only'])==query(['diff','--cached','--name-only'])==''
    worktree=query(['status','--short'])
    assert worktree=='?? js-interpreter-bench/experiments/v8_ic_on_off/'
    refusal=subprocess.run([os.sys.executable,str(HERE/'analyze.py')],capture_output=True,text=True)
    assert refusal.returncode!=0 and 'BLOCKED_IC_INTERVENTION' in refusal.stderr
    save(HERE/'delivery_audit.json',dict(
        status='DELIVERED_BLOCKED_IC_INTERVENTION',timestamp=stamp(),
        HEAD=query(['rev-parse','HEAD']),branch='myx',worktree_status=worktree,
        tracked_modifications=[],new_experiment_only=True,python_AST_files_checked=len(code),
        original_runtime_identity_after_check='PASS; recorded in identity_after.json, not rerun by this checker',
        correctness_valid=18,common_script_per_case_N=True,
        evidence_only_replays=replaychecks,formal_target=270,formal_actual=0,
        pilot_actual=0,performance_statistics_replayed=False,
        performance_analysis_refusal=dict(exit_code=refusal.returncode,stderr=refusal.stderr.strip()),
        no_ELF_or_build_tree_added=True,max_artifact_bytes=max(p.stat().st_size for p in files),
        IC_intervention_verified=None,mode_source_verified=None,
        unresolved=['OFF selected-site positive no-cache/install-block evidence','corresponding-version source unavailable through verified TLS'],
        no_commit_push_or_branch_change=True))
    print('DELIVERY_CHECK_PASS; experiment status remains BLOCKED_IC_INTERVENTION')

if __name__=='__main__':main()

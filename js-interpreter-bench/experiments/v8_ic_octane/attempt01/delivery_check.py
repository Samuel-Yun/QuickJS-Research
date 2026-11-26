"""Independent checks after statistics; no engine, no new performance data."""
import ast,collections
from common import *
def main():
    assert tree(PREVIOUS)==read(HERE/'previous_identity_before.json')
    audit=read(HERE/'summary/audit.json');assert audit['formal_expected']==1440 and audit['case_count']==16
    rows=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    assert len(rows)==audit['formal_actual'] and sum(r['valid'] for r in rows)==audit['formal_valid']
    assert len({(r['case'],r['condition'],r['rep']) for r in rows})==len(rows)
    if audit['status']=='COMPLETE':
        assert len(rows)==1440 and all(r['valid'] for r in rows)
        assert collections.Counter((r['case'],r['condition']) for r in rows)=={(case,c):30 for case in CASES for c in CONDITIONS}
        assert audit['correctness_valid']==96 and audit['selected_correctness_valid']==48
    for p,h in read(HERE/'pre_pilot_freeze.json')['files'].items():assert sha(HERE/p)==h
    if (HERE/'frozen.json').exists():
        for p,h in read(HERE/'frozen.json')['files'].items():assert sha(HERE/p)==h
    table=list(csv.DictReader((HERE/'summary/comparison.csv').open(encoding='utf-8',newline='')))
    assert [r['case'] for r in table]==CASES and len(table)==16
    for case in ['Crypto.Encrypt','Crypto.Decrypt']:
        row=next(r for r in table if r['case']==case)
        if row['status']=='COMPLETE':
            for n in [1,2,int(row['N'])]:assert read(HERE/'crypto'/f'{case}.N{n}.json')['status']=='PASS_BOUNDED_INPUT_IDENTITY'
    assert read(HERE/'replay_audit.json')['status']=='PASS'
    assert audit['OFF_direct_snapshot_verified'] is None and audit['artifact_build_source_commit'] is None
    for p in HERE.glob('*.py'):ast.parse(p.read_text(encoding='utf-8'))
    data=[p for p in HERE.rglob('*') if p.is_file() and '__pycache__' not in p.parts]
    assert not any(p.suffix in {'.o','.a','.so','.exe'} for p in data)
    assert max(p.stat().st_size for p in data)<100000000
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    def query(args):return subprocess.run(git+args,capture_output=True,text=True,check=True).stdout.strip()
    assert query(['diff','--name-only'])==query(['diff','--cached','--name-only'])==''
    assert query(['branch','--show-current'])=='myx'
    assert query(['rev-parse','HEAD'])==read(HERE/'raw/capability/git_HEAD.json')['stdout'].strip()
    save(HERE/'delivery_audit.json',dict(status='PASS',experiment_status=audit['status'],formal_actual=len(rows),formal_valid=sum(r['valid'] for r in rows),previous_attempt_unchanged=True,bootstrap_replays_verified=True,source_and_artifact_identities_preserved=True,OFF_direct_snapshot_verified=None,no_ELF_or_build_tree_added=True,largest_file_bytes=max(p.stat().st_size for p in data),total_files=len(data),git_HEAD=query(['rev-parse','HEAD']),branch='myx',tracked_changes=[],worktree_status=query(['status','--short']),no_automatic_commit_push=True))
    print('DELIVERY_CHECK_PASS',audit['status'],audit['formal_valid'],'/1440',flush=True)
if __name__=='__main__':main()

"""Snapshot publication/protection status without changing Git."""
from common import *
def main():
    repo=ROOT.parent
    def git(*args):return subprocess.check_output(['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args],text=True)
    head=git('rev-parse','HEAD').strip();branch=git('branch','--show-current').strip();changed=git('diff','HEAD','--name-only').splitlines();assert head=='94fd9872ab90832621b516c5e7d6de4beae5d302' and branch=='myx' and not changed
    public=git('ls-files','--others','--exclude-standard',HERE.relative_to(repo).as_posix()).splitlines();big=[n for n in public if (repo/n).stat().st_size>=50*1024*1024];assert not big
    assert len(list((HERE/'raw/diagnostic').glob('*.gz')))==28
    replay=[read(p) for p in (HERE/'replays').glob('*/audit.json')];assert sum(r['source'].endswith('read_ic_mic/attempt01') and r['status']=='PASS' for r in replay)>=2
    assert sum(r['source'].endswith('read_ic_hit_ablation/attempt01') and r['status']=='PASS' for r in replay)>=2
    assert read(HERE/'analysis/audit.json')['status']=='PASS'
    assert read(HERE/'analysis/completion.json')['formal_valid']==1024
    assert read(HERE/'analysis/post_runtime_sources.json')['status']=='PASS'
    assert all((HERE/p).is_file() for p in ['results.md','crypto/results.md','analysis/tables.md'])
    f=HERE/'analysis/delivery_audit.json';i=1
    while f.exists():i+=1;f=HERE/'analysis'/f'delivery_audit.{i}.json'
    save(f,dict(status='PASS',HEAD=head,branch=branch,historical_tracked_changes=changed,no_oversized_public_files=True,public_files_at_scan=len(public),
      previous_replays=sum(r['source'].endswith('read_ic_mic/attempt01') for r in replay),current_replays=sum(r['source'].endswith('read_ic_hit_ablation/attempt01') for r in replay),no_commit_push_branch_switch=True))
    print('DELIVERY_AUDIT_PASS',flush=True)
if __name__=='__main__':main()

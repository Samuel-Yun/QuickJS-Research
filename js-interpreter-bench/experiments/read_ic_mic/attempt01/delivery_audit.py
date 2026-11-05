"""Read-only Git protection/publication checks, run after live stages finish."""
from common import *
def main():
    repo=ROOT.parent
    def git(*args):
        return subprocess.run(['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args],capture_output=True,text=True,check=True).stdout
    head=git('rev-parse','HEAD').strip();branch=git('branch','--show-current').strip();changed=git('diff','HEAD','--name-only').splitlines()
    assert head=='1f977fd762e4308cbfe141c110ad208bdb1f10a0' and branch=='myx'
    assert not changed,changed
    available=git('ls-files','--others','--exclude-standard',HERE.relative_to(repo).as_posix()).splitlines()
    big=[dict(path=n,bytes=(repo/n).stat().st_size) for n in available if (repo/n).stat().st_size>=50*1024*1024]
    assert not big,big
    archives=list((HERE/'raw/diagnostic').glob('*.gz'));assert len(archives)==70
    assert all(p.relative_to(repo).as_posix() in available for p in archives)
    report=HERE/'analysis/delivery_audit.json';index=1
    while report.exists():
        index+=1;report=HERE/'analysis'/f'delivery_audit.{index}.json'
    save(report,dict(status='PASS',HEAD=head,branch=branch,historical_tracked_changes=changed,
      new_publishable_file_count=len(available),oversized_files=big,all_70_counter_archives_not_ignored=True,
      no_commit_push_branch_switch=True,formal_binaries_outside_Git=True))
    print('DELIVERY_AUDIT_PASS',flush=True)
if __name__=='__main__':main()

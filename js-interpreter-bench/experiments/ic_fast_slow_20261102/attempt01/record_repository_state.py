"""Read-only Git identity/counts, without exporting any private path listing."""
import json,subprocess
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;REPO=HERE.parents[3]
INITIAL='107a4e3af5361163b96289a0869800f2b3dcff9a'
def git(*args):
    return subprocess.check_output(['git','--no-optional-locks','-c','safe.directory='+REPO.as_posix(),'-C',str(REPO),*args],text=True,encoding='utf-8').strip()
def main():
    head=git('rev-parse','HEAD');path=HERE.relative_to(REPO).as_posix()
    result=dict(timestamp=datetime.now(timezone.utc).isoformat(),HEAD=head,branch=git('branch','--show-current'),
      initial_observed_HEAD=INITIAL,initial_tracked_worktree_clean=True,
      initial_state_source='read-only interactive git commands at task start; conversation evidence, not later reconstruction',
      reference_snapshot='cd1674f0f12b40b3e110ee295507b7f4fa55edcd',matches_initial_HEAD=head==INITIAL,
      tracked_unstaged_changes_count=len(git('diff','--name-only').splitlines()),staged_changes_count=len(git('diff','--cached','--name-only').splitlines()),
      untracked_public_experiment_files_count=len(git('ls-files','--others','--exclude-standard','--',path).splitlines()),
      commits_created=False,push_performed=False,branch_switch_performed=False,
      private_audit='stored only in excluded local notes, no private file listing exported')
    dest=HERE/'repository_state.json';assert not dest.exists()
    dest.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    print('REPOSITORY_RECORDED',head,'tracked changes',result['tracked_unstaged_changes_count'],'staged',result['staged_changes_count'])
if __name__=='__main__':main()

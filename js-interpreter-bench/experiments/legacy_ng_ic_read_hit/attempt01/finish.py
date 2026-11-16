"""Serialized tail; data verification and final factual tables. No new VM variant."""
import argparse
from common import *
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--wait-for-pilot-and-run',action='store_true');ap.add_argument('--wait-for-formal',action='store_true');a=ap.parse_args()
    def stage(file,*args):
        p=subprocess.run([os.sys.executable,'-B',str(HERE/file),*args]);assert p.returncode==0,(file,p.returncode)
    if a.wait_for_pilot_and_run:
        while not (HERE/'raw/environment/post_pilot.json').exists():time.sleep(5)
        stage('extra_checks.py');stage('run.py','formal')
    elif a.wait_for_formal:
        while not (HERE/'raw/environment/post_formal.json').exists():time.sleep(5)
    assert (HERE/'raw/environment/post_formal.json').exists()
    stage('analyze.py','formal');stage('diagnostic.py','octane');stage('analyze.py','diagnostics');stage('memory.py');stage('supplementary.py');stage('archives.py','verify')
    verify_runtime()
    audit=read(HERE/'analysis/formal_audit.json');assert audit['status']=='PASS'
    diag=list((HERE/'raw/diagnostic').glob('*.gz'));assert len(diag)==52
    memory=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];assert len(memory)==144 and all(r['valid'] for r in memory)
    save(HERE/'analysis/completion.json',dict(status='COMPLETE',formal_valid=audit['valid'],formal_expected=1890,
      octane_target=1440,micro_target=450,independent_selected_diagnostics=42,mechanism_diagnostics=10,memory_processes=144,
      no_outlier_removal=True,no_failure_retries=True,post_runtime_identity='PASS',finished_at=stamp()))
    print('CAMPAIGN_MEASUREMENTS_COMPLETE',flush=True)
if __name__=='__main__':main()

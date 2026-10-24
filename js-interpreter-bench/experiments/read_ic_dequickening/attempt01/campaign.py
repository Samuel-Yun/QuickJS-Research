"""Serial work/resume; never automatically repeats an existing formal position."""
import argparse
from common import *
def stage(file,*args):
    r=subprocess.run([os.sys.executable,'-B',str(HERE/file),*args]);assert r.returncode==0,(file,args,r.returncode)
def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['pilot','formal','tail','after-pilot']);a=p.parse_args()
    if a.stage=='pilot':stage('run.py','init');stage('run.py','correctness');stage('run.py','calibrate')
    if a.stage=='after-pilot':
        while not (HERE/'raw/environment/post_pilot.json').exists():time.sleep(5)
        stage('run.py','formal');a.stage='tail'
    if a.stage=='formal':stage('run.py','formal')
    if a.stage=='tail':
        bridge_rows=[read(p) for p in (HERE/'bridge_check/raw').glob('*.json')]
        if (HERE/'bridge_check/matched_environment/audit.json').exists() or (len(bridge_rows)==48 and all(r['environment'].get('QJS_READ_IC_MODE')=='1' for r in bridge_rows)):stage('bridge_analysis.py')
        stage('analyze.py','formal');stage('diagnostic.py','run');stage('diagnostic.py','summarize');stage('memory.py');stage('supplementary.py');stage('audit.py');stage('archives.py','verify');verify_runtime()
        save(HERE/'analysis/completion.json',dict(status='COMPLETE',formal_valid=read(HERE/'analysis/formal_audit.json')['valid'],expected=2160,selected_diagnostics=48,memory_processes=144,finished_at=stamp()))
        print('CAMPAIGN_COMPLETE',flush=True)
if __name__=='__main__':main()

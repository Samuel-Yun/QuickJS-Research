"""Serial stages, actual work, append-only resume; no automatic follow-on research."""
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
        stage('analyze.py');stage('diagnostic.py','run');stage('diagnostic.py','summarize');stage('memory.py');stage('supplementary.py');stage('crypto_inputs.py');stage('audit.py');stage('archives.py','verify')
        verify_runtime()
        if not (HERE/'analysis/completion.json').exists():save(HERE/'analysis/completion.json',dict(status='COMPLETE',formal_expected=1024,formal_valid=read(HERE/'analysis/formal_audit.json')['valid'],selected_diagnostics=16,memory=36,finished_at=stamp()))
        print('COMPLETE',flush=True)
if __name__=='__main__':main()

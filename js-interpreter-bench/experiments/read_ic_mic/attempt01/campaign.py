"""Serial live stages. Never silently replace existing formal positions."""
import argparse
from common import *
def stage(file,*args):
    r=subprocess.run([os.sys.executable,'-B',str(HERE/file),*args]);assert r.returncode==0,(file,args,r.returncode)
def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['pilot','formal','tail','after-pilot']);a=p.parse_args()
    if a.stage=='pilot':
        stage('run.py','init');stage('run.py','correctness');stage('run.py','calibrate')
    if a.stage=='formal':stage('run.py','formal')
    if a.stage=='after-pilot':
        while not (HERE/'raw/environment/post_pilot.json').exists():time.sleep(5)
        stage('run.py','formal');a.stage='tail'
    if a.stage=='tail':
        stage('analyze.py','formal');stage('generated_code_audit.py');stage('diagnostic.py','run');stage('diagnostic.py','summarize');stage('memory.py')
        stage('supplementary.py');stage('audit.py');stage('archives.py','verify');verify_runtime()
        a=read(HERE/'analysis/audit.json');assert a['status']=='PASS'
        if not (HERE/'analysis/completion.json').exists():
            save(HERE/'analysis/completion.json',dict(status='COMPLETE',formal=2160,octane=1440,micros=720,
              selected_diagnostics=48,memory=144,post_runtime_identity='PASS',finished_at=stamp()))
if __name__=='__main__':main()

"""Explicit entry points; no implicit change of frozen runtime or OPT selection."""
import argparse,subprocess,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['diagnostic','focus','v8','control','octane','micro','sunspider','replication','analyze']);p.add_argument('extra',nargs='?');a=p.parse_args()
    tasks={'diagnostic':[('diagnose.py','build'),('diagnose.py','collect')],
      'focus':[('focused.py','build'),('focused.py','collect')],
      'v8':[('v8_evidence.py',)],'control':[('controlled.py','build'),('controlled.py','checks'),('controlled.py','run')],
      **{k:[('campaign.py',k)] for k in ['octane','micro','sunspider','replication']},
      'analyze':[('analyze.py',a.extra or 'octane')]}
    for command in tasks[a.stage]:subprocess.run([sys.executable,str(HERE/command[0]),*command[1:]],cwd=HERE,check=True)
if __name__=='__main__':main()

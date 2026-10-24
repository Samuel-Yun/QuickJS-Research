"""Serialized post-sampling stages; optional idle wait for this campaign's completion."""
import argparse,sys
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('--wait-for-formal',action='store_true');a=p.parse_args()
    marker=HERE/'raw/environment/post_formal.json'
    if a.wait_for_formal:
        deadline=time.monotonic()+7200
        while not marker.exists():
            if time.monotonic()>deadline:raise TimeoutError('formal completion marker absent; no post-stage executed')
            time.sleep(5)
    assert marker.exists(),'formal must finish first'
    steps=[('analyze.py','formal'),('diagnostic.py','octane'),('analyze.py','diagnostics'),
      ('memory.py',),('analyze.py','extras'),('analyze.py','legacy'),('recover.py','verify'),('recover.py','old-diagnostics'),('complete.py',)]
    for step in steps:
        print('POST_STAGE_START',*step,flush=True)
        subprocess.run([sys.executable,'-B',str(HERE/step[0]),*step[1:]],check=True)
        print('POST_STAGE_DONE',*step,flush=True)
    print('ALL_REQUESTED_STAGES_COMPLETE',flush=True)
if __name__=='__main__':main()

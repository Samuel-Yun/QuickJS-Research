"""Run the actual pilot and formal acquisition serially in one WSL lifetime."""
from common import *
import run
def main():
    if not (HERE/'analysis_freeze.json').exists():
        names=['analyze.py','replay.py','test_analysis.py','launch.py']
        save(HERE/'analysis_freeze.json',dict(timestamp=stamp(),files={n:sha(HERE/n) for n in names},seed=SEED,bootstrap_replicates=10000,unit='complete within-case triple',quartiles='Tukey halves',interval='linear percentile 2.5/97.5; exploratory'))
    for p,h in read(HERE/'analysis_freeze.json')['files'].items():assert sha(HERE/p)==h
    run.calibrate()
    run.formal()
if __name__=='__main__':main()

import argparse,subprocess,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
p=argparse.ArgumentParser();p.add_argument('round');p.add_argument('mode');a=p.parse_args()
for suite in ['octane','sunspider']:
 subprocess.run([sys.executable,'-B',str(HERE/'run_bench.py'),a.round,a.mode,suite],check=True)

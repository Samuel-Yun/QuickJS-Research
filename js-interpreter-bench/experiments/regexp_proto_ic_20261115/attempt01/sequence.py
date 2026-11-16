"""Run suites serially; never overlap timing processes."""
import argparse
from pathlib import Path
import subprocess
import sys
HERE=Path(__file__).resolve().parent
def main():
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['release','counts']);a=p.parse_args()
    for benchmark in ['octane','sunspider']:
        subprocess.run([sys.executable,'-B',str(HERE/'run_bench.py'),a.mode,benchmark],check=True)
if __name__=='__main__':main()

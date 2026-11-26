"""Serial campaign stage wrapper; no concurrent benchmark processes."""
import argparse
from pathlib import Path
import subprocess
import sys

HERE=Path(__file__).resolve().parent


def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['counts','performance']);p.add_argument('labels',nargs='+');args=p.parse_args()
    for label in args.labels:
        if args.stage=='counts':
            for extra in [['--diagnostic'],['--diagnostic','--sunspider']]:
                subprocess.run([sys.executable,'-B',str(HERE/'run_bench.py'),label,*extra],check=True)
        else:
            assert (HERE/'qualification'/(label+'.san.gate.json')).exists()
            subprocess.run([sys.executable,'-B',str(HERE/'run_bench.py'),label],check=True)


if __name__=='__main__':main()

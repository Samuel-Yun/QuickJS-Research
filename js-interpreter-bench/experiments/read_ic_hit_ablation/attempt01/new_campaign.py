"""Clone reproducible tools/input sources only into a new attempt."""
import argparse,shutil
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('destination');a=p.parse_args();dest=Path(a.destination).resolve();assert not dest.exists() and dest.parent.name=='read_ic_hit_ablation';dest.mkdir(parents=True)
    for src in HERE.glob('*.py'):
        if src.name not in ['bootstrap.py','delivery_audit.py']:shutil.copy2(src,dest/src.name)
    for name in ['implementation','inputs','cases','recovery']:shutil.copytree(HERE/name,dest/name)
    (dest/'correctness').mkdir()
    for pattern in ['*.js','*.c']:
        for src in (HERE/'correctness').glob(pattern):shutil.copy2(src,dest/'correctness'/src.name)
    for name in ['design.md','.gitignore','.gitattributes']:shutil.copy2(HERE/name,dest/name)
    save(dest/'NEW_CAMPAIGN.md','NOT RUN. Set IC_ABLATION_STORE to a fresh absolute Linux directory. Old raw are not copied; rebuild all sources and rerun every gate.\n')
    print(dest)
if __name__=='__main__':main()

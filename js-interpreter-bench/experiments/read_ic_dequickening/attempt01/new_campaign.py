"""Copy implementation/tools/inputs only to a fresh attempt, never historical raw."""
import argparse,shutil
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('destination');a=p.parse_args();dst=Path(a.destination).resolve();assert not dst.exists() and dst.parent.name=='read_ic_dequickening';dst.mkdir(parents=True)
    for src in HERE.glob('*.py'):
        if src.name not in ['bootstrap.py','delivery_audit.py']:shutil.copy2(src,dst/src.name)
    for name in ['inputs','cases','implementation']:shutil.copytree(HERE/name,dst/name)
    (dst/'correctness').mkdir()
    for pattern in ['*.c','*.js']:
        for src in (HERE/'correctness').glob(pattern):shutil.copy2(src,dst/'correctness'/src.name)
    for name in ['bridge_counter.inc','design.md','.gitignore','.gitattributes']:shutil.copy2(HERE/name,dst/name)
    save(dst/'NEW_CAMPAIGN.md','NOT RUN. Set IC_DEQUICKEN_STORE to a fresh absolute Linux path, recheck host and follow README rebuild/gates. No raw, binary or historical identities were copied.\n');print(dst)
if __name__=='__main__':main()

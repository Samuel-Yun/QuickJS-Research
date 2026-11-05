"""Create new writable attempt, never overwrite evidence. No implicit run."""
import argparse,shutil
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('destination');a=p.parse_args();dest=Path(a.destination).resolve()
    assert not dest.exists() and dest.parent.name=='read_ic_mic';dest.mkdir(parents=True)
    for name in ['common.py','prepare.py','build.py','correctness_run.py','run.py','micros.py','timer.py','mechanism.py','machinecode.py','diagnostic.py',
      'analyze.py','aggregate_ci.py','memory.py','supplementary.py','audit.py','archives.py','portable_check.py','identity.py','source_audit.py','generated_code_audit.py','new_campaign.py','campaign.py','design.md','.gitignore','.gitattributes']:
        shutil.copy2(HERE/name,dest/name)
    for name in ['implementation','inputs','cases','recovery']:shutil.copytree(HERE/name,dest/name)
    (dest/'correctness').mkdir()
    for ext in ['*.js','*.c']:
        for src in (HERE/'correctness').glob(ext):shutil.copy2(src,dest/'correctness'/src.name)
    save(dest/'NEW_CAMPAIGN.md','New campaign: NOT RUN. Set IC_MIC_STORE to a NEW absolute Linux directory. Rebuild all three, rerun gates and pilot before formal. Historical raw are NOT copied.\n')
    print(dest)
if __name__=='__main__':main()

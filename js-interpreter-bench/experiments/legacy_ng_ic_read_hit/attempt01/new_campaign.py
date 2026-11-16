"""Copy tools and immutable small inputs only; never copy campaign results."""
import argparse,shutil
from common import *
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--destination',required=True);a=ap.parse_args();dst=Path(a.destination).resolve()
    assert not dst.exists() and dst!=HERE;dst.mkdir(parents=True)
    for p in HERE.glob('*.py'):
        if p.name not in ['bootstrap.py','upgrade_analysis.py','delivery_audit.py']:shutil.copy2(p,dst/p.name)
    for name in ['.gitignore','.gitattributes']:shutil.copy2(HERE/name,dst/name)
    save(dst/'README.md','# NEW CAMPAIGN — NOT YET RUN\n\nOnly tools/immutable small inputs were copied. '
      'No raw, result, manifest or completion record was copied. Completion numbers and host descriptions '
      'below are historical descriptions of the source attempt, NOT the state of this new directory. '
      'Use a fresh IC_READ_STORE and record the actual host/compiler.\n\n---\n\n'+(HERE/'README.md').read_text(encoding='utf-8'))
    for folder in ['inputs','cases'] :shutil.copytree(HERE/folder,dst/folder)
    (dst/'correctness').mkdir();(dst/'recovery').mkdir()
    for name in ['legacy_regression.js','legacy_timer.js','multislot.js','read_semantics.js','roundtrip_slots.c']:shutil.copy2(HERE/'correctness'/name,dst/'correctness'/name)
    shutil.copy2(HERE/'recovery/workload_line_endings.json',dst/'recovery/workload_line_endings.json')
    print('NEW_CAMPAIGN_CREATED',dst)
if __name__=='__main__':main()

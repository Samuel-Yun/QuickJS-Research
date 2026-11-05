"""Copy tools/materials into a fresh sibling attempt; never copies raw or results."""
import argparse,shutil
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('--destination',type=Path,required=True);a=p.parse_args();dest=a.destination.resolve()
    assert not dest.exists() and dest.parent==HERE.parent,'new sibling attempt directory required'
    dest.mkdir()
    for path in HERE.glob('*.py'):shutil.copyfile(path,dest/path.name)
    for name in ['.gitattributes','.gitignore']:shutil.copyfile(HERE/name,dest/name)
    for name in ['sources','inputs','correctness']:
        (dest/name).mkdir()
    # Copy only immutable recovery archives and index; no absolute original runtime needed.
    shutil.copytree(HERE/'recovery',dest/'recovery',ignore=shutil.ignore_patterns('*replay*','old_diagnostic*','legacy_statistics*','legacy_descriptive*'))
    for path in (HERE/'correctness').glob('*'):
        if path.suffix in ['.js','.c']:shutil.copyfile(path,dest/'correctness'/path.name)
    for path in (HERE/'inputs').glob('*.js'):shutil.copyfile(path,dest/'inputs'/path.name)
    print('NEW_CAMPAIGN_CREATED',dest)
    print('Set IC_SLOT_STORE to a NEW absolute Linux directory, then prepare.py source, build.py release/correctness, diagnostic.py build/micros, run.py init/correctness/calibrate/formal. Never rerun those steps over old raw.')
if __name__=='__main__':main()

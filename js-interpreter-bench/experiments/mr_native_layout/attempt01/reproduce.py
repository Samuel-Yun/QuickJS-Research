"""Fresh campaign scaffolding; never overwrite a completed attempt or old Linux store."""
import argparse,shutil
from common import *
def main():
 p=argparse.ArgumentParser();p.add_argument('new_attempt',type=Path);a=p.parse_args();dest=a.new_attempt.resolve();assert not dest.exists();dest.mkdir(parents=True)
 for src in list(HERE.glob('*.py'))+[HERE/'counter.inc',HERE/'design.md',HERE/'.gitignore',HERE/'.gitattributes']:
  shutil.copy2(src,dest/src.name)
 print('Fresh scripts:',dest)
 print('Set MR_LAYOUT_STORE to a NEW Linux absolute path; then restore/build/repair_padding, diagnostics build/collect, native, correctness, campaign.')
 print('Keep within experiments/mr_native_layout/attemptXX so repository-relative archives remain discoverable. New experiment/source/ELF manifest required; times are not pooled.')
if __name__=='__main__':main()

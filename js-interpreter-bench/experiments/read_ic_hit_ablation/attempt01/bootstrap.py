"""Mechanical reuse into this NEW attempt only; never edits prior tools/raw."""
import shutil
from common import *
def main():
    for folder in ['inputs','implementation','recovery']:
        if not (HERE/folder).exists():shutil.copytree(PREVIOUS/folder,HERE/folder)
    (HERE/'cases').mkdir(exist_ok=True);(HERE/'correctness').mkdir(exist_ok=True)
    for c in MICRO_CASES:shutil.copy2(PREVIOUS/'cases'/f'{c}.js',HERE/'cases'/f'{c}.js')
    for pattern in ['*.js','*.c']:
        for p in (PREVIOUS/'correctness').glob(pattern):shutil.copy2(p,HERE/'correctness'/p.name)
    s=(PREVIOUS/'micros.py').read_text();s=s.replace("dict(zip(MICRO_CASES,[12288,4096,8398848,8386560,4096,6144,10240,18432]))","{'M1.own_integer':12288,'M2.own_reference':4096,'M4.numeric_control':8386560,'M6.poly2':6144}")
    save(HERE/'micros.py',s)
    save(HERE/'.gitignore','generated/\nartifacts/\n__pycache__/\n*.partial\n')
    save(HERE/'.gitattributes','* text=auto eol=lf\n*.gz binary\n')
    print('TOOLS_REUSED_NEW_ATTEMPT',flush=True)
if __name__=='__main__':main()

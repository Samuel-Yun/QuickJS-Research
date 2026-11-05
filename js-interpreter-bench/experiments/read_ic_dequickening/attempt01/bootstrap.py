"""Mechanical reuse of frozen cases/drivers and data-only analysis, not runtime edits."""
import shutil
from common import *
def main():
    for name in ['inputs','cases']:
        if not (HERE/name).exists():shutil.copytree(PREVIOUS/name,HERE/name)
        else:assert all(sha(HERE/name/p.name)==sha(p) for p in (PREVIOUS/name).glob('*') if p.is_file())
    (HERE/'correctness').mkdir(exist_ok=True)
    for pattern in ['*.js','*.c']:
        for p in (PREVIOUS/'correctness').glob(pattern):
            if (HERE/'correctness'/p.name).exists():assert sha(p)==sha(HERE/'correctness'/p.name)
            else:shutil.copy2(p,HERE/'correctness'/p.name)
    for name in ['micros.py','aggregate_ci.py','analyze.py','run.py','memory.py','supplementary.py']:
        s=(PREVIOUS/name).read_text(encoding='utf-8')
        if name=='analyze.py':s=s.replace("PAIRS=[('A','M'),('P','M'),('A','P')]","PAIRS=[('A','R'),('M','R'),('A','M')]")
        if name=='run.py':s=s.replace("['APM','PMA','MAP']","['AMR','MRA','RAM']")
        if name=='supplementary.py':s=s.replace("'P'","'R'").replace('P/M','M/R').replace('A/P','A/R').replace('PM','MR').replace('AP','AR')
        save(HERE/name,s)
    save(HERE/'.gitignore','generated/\n__pycache__/\n*.partial\n')
    save(HERE/'.gitattributes','* text eol=lf\n*.gz binary\n')
    save(HERE/'origin.json',dict(reference_HEAD='7dca3cdc8461c5576a4d63badbcf295bf0ad4f7c',branch='myx',initial_worktree='clean',AGENTS=None,
      upstream='04be246001599f5995fa2f2d8c91a0f198d3f34c',prior_attempts=['read_ic_mic/attempt01','read_ic_hit_ablation/attempt01'],created_at=stamp()))
if __name__=='__main__':main()

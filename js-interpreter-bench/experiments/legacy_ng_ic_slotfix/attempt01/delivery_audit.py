"""Portable delivery check: no execution of qjs or dependency on Linux paths."""
import ast,sys
from common import *
def main():
    scripts=list(HERE.glob('*.py'))
    for p in scripts:ast.parse(p.read_text(encoding='utf-8'),filename=str(p))
    commands=[]
    for script,args in [('analyze.py',['formal']),('analyze.py',['legacy']),('recover.py',['verify']),('recover.py',['old-diagnostics'])]:
        r=capture('portable_'+script+'_'+args[0],[sys.executable,'-B',HERE/script,*args]);assert r['exit_code']==0
        commands.append(dict(script=script,args=args,exit_code=r['exit_code']))
    repo=ROOT.parent
    git=['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo)]
    r=capture('final_git_status',git+['status','--short','--ignore-submodules=all']);assert r['exit_code']==0
    diff=capture('preserved_old_experiment',git+['diff','--exit-code','--','js-interpreter-bench/experiments/legacy_ng_ic/attempt01']);assert diff['exit_code']==0
    r=capture('final_diff_check',git+['diff','--check']);assert r['exit_code']==0
    r=capture('final_head',git+['rev-parse','HEAD']);assert r['stdout'].strip()=='fbc008af922d416c085197903c0747314b140efa'
    # Do not scan large ignored generated/artifact outputs into ordinary Git.
    files=[p for p in HERE.rglob('*') if p.is_file() and not any(x in ['generated','artifacts','__pycache__'] for x in p.relative_to(HERE).parts)]
    large=[dict(path=p.relative_to(HERE).as_posix(),bytes=p.stat().st_size) for p in files if p.stat().st_size>50*1024*1024]
    assert not large,large
    save(HERE/'analysis/delivery_audit.json',dict(status='PASS',python=platform.python_version(),OS=platform.system(),
      syntax_checked=len(scripts),replay_commands=commands,uses_recorded_linux_executables=False,old_tracked_experiment_unchanged=True,
      git_HEAD_unchanged=True,files_above_50_MiB_outside_ignored_outputs=large,
      maximum_nonignored_file_bytes=max(p.stat().st_size for p in files)))
    print('PORTABLE_DELIVERY_AUDIT_PASS',flush=True)
if __name__=='__main__':main()

"""Run an owned serial campaign with file-backed output and an explicit exit record."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import time

H = Path(__file__).resolve().parent


def save(path, value):
    assert not path.exists(), path
    path.write_text(json.dumps(value, indent=2) + '\n', encoding='utf-8')


def launch(name, args):
    assert args[0] in ['balanced.py', 'diagnose.py', 'recovery_batch.py', 'safety.py', 'finalize.py', 'extend12.py']
    import run
    run.gate()
    for line in subprocess.check_output(['ps','-eo','comm,args'],text=True).splitlines()[1:]:
        comm = line.split(None,1)[0]
        assert comm not in ['qjs','d8','gcc','cc1','make'] and not comm.endswith('.qjs'), line
        assert 'python3 balanced.py ' not in line and 'job.py worker ' not in line, line
    log = H / (name + '.progress.log')
    assert not log.exists()
    with log.open('xb') as stream:
        p = subprocess.Popen([sys.executable,str(H/'job.py'),'worker',name,*args], cwd=H,
            stdin=subprocess.DEVNULL, stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
    save(H/(name+'.job.json'),dict(pid=p.pid, args=args, start=time.time(),
         boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(), log=str(log)))
    print('LAUNCHED', name, p.pid)


def worker(name, args):
    r = subprocess.run([sys.executable,*args],cwd=H)
    save(H/(name+'.exit.json'),dict(exit_code=r.returncode, end=time.time(),
         boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip()))
    sys.exit(r.returncode)


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('action',choices=['launch','worker'])
    p.add_argument('name')
    p.add_argument('args',nargs=argparse.REMAINDER)
    a = p.parse_args()
    (launch if a.action=='launch' else worker)(a.name,a.args)

"""New revision only. Single-child resource capture and write-once records."""
import csv, hashlib, io, json, math, os, platform, re, shutil, signal, subprocess, time
from pathlib import Path
from datetime import datetime, timezone

HERE = Path(__file__).resolve().parent
OLD = HERE.parent / 'attempt01'
ROOT = HERE.parents[2]
PREV = ROOT / 'experiments/ic_fast_slow_20261102/attempt01'
STORE = Path('/home/mzyx/splay_ic_20261104_attempt02')
SEED = 20261104
MAX_N = 131072
TIMEOUT = 300

def stamp(): return datetime.now(timezone.utc).isoformat()
def read(p): return json.loads(Path(p).read_text(encoding='utf-8'))
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for chunk in iter(lambda:f.read(1048576), b''): h.update(chunk)
    return h.hexdigest()
def save(p, x):
    p=Path(p); p.parent.mkdir(parents=True, exist_ok=True)
    data=x if isinstance(x,bytes) else (x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():
        assert p.read_bytes()==data, 'write-once conflict '+str(p)
        return
    tmp=p.with_name(p.name+'.pending')
    with tmp.open('xb') as f: f.write(data); f.flush(); os.fsync(f.fileno())
    assert not p.exists(); os.rename(tmp,p)
def csvout(p, rows):
    rows=list(rows)
    if not rows: return
    s=io.StringIO(newline=''); w=csv.DictWriter(s,list(rows[0]),lineterminator='\n'); w.writeheader();w.writerows(rows);save(p,s.getvalue())
def one(s,a,b):
    assert s.count(a)==1,(a[:100],s.count(a))
    return s.replace(a,b,1)
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def pin():os.sched_setaffinity(0,{2})
def runtime():return read(OLD/'runtime.json')
def validate_artifacts(items):
    for x in items:assert sha(x['path'])==x['sha256'],'artifact changed '+x['path']

def capture(cmd,label,cwd=None,env=None,timeout=300):
    """wait4 for THIS child, never subtract cumulative RUSAGE_CHILDREN maxrss.

    File-backed stdout/stderr avoid pipe deadlock and permit bounded child wait.
    The child is a process-group leader, allowing a timeout to stop only this task.
    """
    import tempfile
    cmd=list(map(str,cmd)); start=time.perf_counter_ns(); bid=boot(); ts=stamp()
    with tempfile.TemporaryFile() as out, tempfile.TemporaryFile() as err:
        child=subprocess.Popen(cmd,cwd=cwd or ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
        journal=os.environ.get('SP_CAPTURE_START_DIR')
        if journal:
            save(Path(journal)/(str(child.pid)+'.started.json'),dict(command=cmd,label=label,boot_id=bid,
                 timestamp=ts,parent_pid=os.getpid(),child_pid=child.pid,timeout_s=timeout,cwd=str(cwd or ROOT)))
        timed_out=False
        while True:
            pid,status,usage=os.wait4(child.pid,os.WNOHANG)
            if pid:break
            if (time.perf_counter_ns()-start)/1e9>timeout:
                timed_out=True;os.killpg(child.pid,signal.SIGKILL)
                pid,status,usage=os.wait4(child.pid,0);break
            time.sleep(.01)
        child.returncode=os.waitstatus_to_exitcode(status)
        out.seek(0);stdout=out.read().decode('utf-8',errors='replace')
        err.seek(0);stderr=err.read().decode('utf-8',errors='replace')
    stop=time.perf_counter_ns()
    return dict(command=cmd,label=label,cwd=str(cwd or ROOT),timestamp=ts,completed_at=stamp(),
                child_pid=child.pid,exit_code=child.returncode,signal=-child.returncode if child.returncode<0 else None,
                stdout=stdout,stderr=stderr,timeout=timed_out,host_timeout=False,
                outer_start_ns=start,outer_stop_ns=stop,external_wall_ms=(stop-start)/1e6,
                child_user_ms=usage.ru_utime*1000,child_system_ms=usage.ru_stime*1000,
                single_child_peak_rss_kib=usage.ru_maxrss,peak_rss_method='wait4(this child).ru_maxrss; Linux KiB',
                boot_id=bid,boot_id_after=boot(),load_average=os.getloadavg())

"""Fixed-work Octane A/B; append-only records, wait4 per-child peak RSS.

No official adaptive Octane score is claimed. Reuses existing strict driver.
"""
import argparse
import csv
from datetime import datetime,timezone
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import platform
import random
import re
import signal
import subprocess
import time
from prepare_sources import HERE,ROOT,BASE,save,sha

SEED=20261023
MODE='LEGACY_NG_IC_MONOTONIC_V1'
FILES={'Richards':['richards.js'],'DeltaBlue':['deltablue.js'],'Crypto':['crypto.js'],
 'RayTrace':['raytrace.js'],'EarleyBoyer':['earley-boyer.js'],'RegExp':['regexp.js'],
 'Splay':['splay.js'],'NavierStokes':['navier-stokes.js'],'PdfJS':['pdfjs.js'],
 'Mandreel':['mandreel.js'],'Gameboy':['gbemu-part1.js','gbemu-part2.js'],
 'CodeLoad':['code-load.js'],'Typescript':['typescript.js','typescript-input.js','typescript-compiler.js'],
 'Box2D':['box2d.js'],'zlib':['zlib.js','zlib-data.js']}
BENCH={'Richards':['Richards'],'DeltaBlue':['DeltaBlue'],'Crypto':['Encrypt','Decrypt'],
 'RayTrace':['RayTrace'],'EarleyBoyer':['Earley','Boyer'],'RegExp':['RegExp'],'Splay':['Splay'],
 'NavierStokes':['NavierStokes'],'PdfJS':['PdfJS'],'Mandreel':['Mandreel'],'Gameboy':['Gameboy'],
 'CodeLoad':['CodeLoadClosure','CodeLoadJQuery'],'Typescript':['Typescript'],
 'Box2D':['Box2D'],'zlib':['zlib']}
UNITS=[s+'.'+b for s,bs in BENCH.items() for b in bs]
SUPPORTED=UNITS[:-2]
TIMEOUT=300

def read(p):return json.loads(Path(p).read_text())
def stamp():return datetime.now(timezone.utc).isoformat()
def csvout(p,rows):
    import io
    out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]));w.writeheader();w.writerows(rows);save(p,out.getvalue())

def verify():
    m=read(HERE/'manifest.json')
    assert platform.node()==m['host'] and platform.release()==m['kernel'] and platform.machine()=='x86_64'
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for v,c in m['artifacts'].items():assert sha(c['path'])==c['sha256']
    for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
    return m

def init():
    m=read(HERE/'build_manifest.json')
    inputs={}
    for line in (ROOT/'experiments/octane/upstream_sha256.txt').read_text().splitlines():
        h,p=line.split('  ',1);f=ROOT/'benchmarks/octane/upstream'/p;assert sha(f)==h
        inputs[f.relative_to(ROOT).as_posix()]=h
    for f in [ROOT/'experiments/timer_recovery/adapters/quickjs.js',ROOT/'experiments/timer_recovery/drivers/octane.js',
              HERE/'run.py',HERE/'correctness/regression.js',HERE/'patches/legacy_ng_ic_port.v2.patch']:
        inputs[f.relative_to(ROOT).as_posix()]=sha(f)
    m.update(experiment='legacy_ng_ic/attempt01',mode=MODE,cohort='wsl2-ubuntu2404-x64-20261004',
        collection='new A/B only; previous times not pooled',created_at=stamp(),inputs=inputs,
        Octane=dict(repository='https://github.com/chromium/octane.git',version='2.0',commit='570ad1ccfe86e3eecba0636c8f932ac08edec517'),
        source_provenance=read(HERE/'source_evidence/source_identity.json'),
        power_policy='UNKNOWN',frequency_per_sample='UNKNOWN',background_control='uncontrolled; recorded snapshots',
        memory_rss='Linux os.wait4 individual child ru_maxrss, KiB (1024 bytes); uninstrumented A/B',
        timer='captured performance.now -> CLOCK_MONOTONIC, ms')
    save(HERE/'manifest.json',m)
    save(HERE/'protocol.json',dict(mode=MODE,units=UNITS,included_candidate=SUPPORTED,
        repetitions=30,pilot_pairs=3,seed=SEED,max_N=65536,timeout_seconds=TIMEOUT,
        calibration='powers of 2, first pair >=1000ms on both; confirm with 3 fresh pairs all >=1000ms; otherwise double',
        retry='no automatic retry of failed formal positions; preserve and report failures; resume skips completed positions',
        order='each unit 15 AB + 15 BA, seed shuffled; each rep shuffled unit order',
        warmup=0,setup='once outside timer; first workload invocation included',
        timer='benchNow (captured native performance.now), monotonic milliseconds',
        timed='for(i=0;i<N;i++) original Benchmark.run(); includes driver calls, GC, helpers, builtin, dynamic compilation',
        outside='new process + VM/source/compile + adapter + required Setup; validation/TearDown/output/exit',
        crypto='Decrypt input prepared using encrypt; Encrypt verified by decrypt outside timer',
        regexp='existing reviewed strict adaptation: constructor only; no Setup priming Run',
        navierstokes='if N<15, original checksum call reached outside timer and extra count recorded',
        official_harness='do not call adaptive RunSuites; fixed original run bodies; no official score or latency score',
        stats='sample sd n-1; Tukey halves Q1/Q3/IQR; paired bootstrap median(A)/median(B), 10000 resamples, seed20261023',
        CI='exploratory pointwise intervals, not adjusted multiple tests',
        no_outlier_removal=True,no_GC_changes=True))
    capture_environment('before')
    csvout(HERE/'coverage.initial.csv',[dict(suite=s,subbenchmark=b,case=s+'.'+b,status='pending',reason='not yet tested')
          for s,bs in BENCH.items() for b in bs]+[
          dict(suite=s,subbenchmark=s+'Latency',case=s+'.latency',status='unsupported',reason='official latency/rms score not defined by fixed-run timer') for s in ['Splay','Mandreel']])
    print('INITIALIZED',flush=True)

def capture_environment(label):
    p=subprocess.run(['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -25; true'],capture_output=True,text=True)
    save(HERE/'raw/environment'/f'{label}.json',dict(timestamp=stamp(),stdout=p.stdout,stderr=p.stderr,
        boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),loadavg=os.getloadavg()))

def script(unit,n,correctness):
    suite,bench=unit.split('.')
    cfg=json.dumps(dict(case=unit,N=n,phase='correctness' if correctness else 'measure'),separators=(',',':'))
    driver=(ROOT/'experiments/timer_recovery/drivers/octane.js').read_text()
    driver=driver.replace('__CONFIG__',cfg).replace('__SUITE__',json.dumps(suite)).replace('__INDEX__',str(BENCH[suite].index(bench))).replace('__BENCHMARK__',json.dumps(bench)).replace('MAIN_MONOTONIC_V1',MODE)
    parts=[(ROOT/'experiments/timer_recovery/adapters/quickjs.js').read_bytes()]
    parts.extend((ROOT/'benchmarks/octane/upstream'/f).read_bytes() for f in ['base.js',*FILES[suite]])
    path=HERE/'generated'/f'{unit}.N{n}.{"correctness" if correctness else "measure"}.js'
    save(path,b'\n;\n'.join(parts)+b'\n;\n'+driver.encode());return path

def invoke(stage,unit,v,n,rep,order,extra_flags=None,binary=None):
    m=verify()
    stem=HERE/'raw'/stage/unit/f'rep{rep}.N{n}.{v}.pos{order}'
    if stem.with_suffix(stem.suffix+'.json').exists():return read(stem.with_suffix(stem.suffix+'.json'))
    is_correctness=stage in ('correctness','selected_correctness')
    pth=script(unit,n,is_correctness)
    binary=binary or m['artifacts'][v]['path']
    cmd=[binary,*(extra_flags or []),str(pth)]
    r=dict(stage=stage,case=unit,variant=v,rep=rep,order=order,N=n,command=cmd,cwd=str(ROOT),
        mode=MODE,cohort=m['cohort'],binary_sha256=sha(binary),script_sha256=sha(pth),
        timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
        valid=False,elapsed_ms=None,elapsed_per_call_ms=None,peak_rss_kib=None)
    timedout=False
    def alarm(signum,frame):
        nonlocal timedout
        timedout=True
        try:os.killpg(p.pid,signal.SIGKILL)
        except ProcessLookupError:pass
    previous=signal.signal(signal.SIGALRM,alarm)
    outpath=Path(str(stem)+'.stdout');errpath=Path(str(stem)+'.stderr')
    outpath.parent.mkdir(parents=True,exist_ok=True)
    with outpath.open('xb') as out,errpath.open('xb') as err:
        start=time.perf_counter_ns()
        p=subprocess.Popen(cmd,cwd=ROOT,stdout=out,stderr=err,start_new_session=True)
        signal.setitimer(signal.ITIMER_REAL,TIMEOUT)
        _,status,usage=os.wait4(p.pid,0)
        stop=time.perf_counter_ns()
        signal.setitimer(signal.ITIMER_REAL,0);signal.signal(signal.SIGALRM,previous)
        p.returncode=os.waitstatus_to_exitcode(status)
    r.update(exit_code=p.returncode,timeout=timedout,outer_wall_ns=stop-start,
        peak_rss_kib=usage.ru_maxrss,user_cpu_s=usage.ru_utime,system_cpu_s=usage.ru_stime,
        stdout=outpath.read_text(errors='replace'),stderr=errpath.read_text(errors='replace'))
    matches=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)
    try:
        assert p.returncode==0 and not timedout and not r['stderr'] and len(matches)==1
        payload=json.loads(matches[0]);assert payload['case']==unit and payload['N']==n and payload['correctness']=='PASS' and payload['mode']==MODE
        r.update(payload=payload,extra_validation_calls=payload['extra_validation_calls'])
        if not is_correctness:
            e=payload['elapsed_ms'];assert math.isfinite(e) and e>0 and e<=(stop-start)/1e6+5
            r.update(elapsed_ms=e,elapsed_per_call_ms=e/n)
        r['valid']=True
    except (AssertionError,ValueError,KeyError):r['error']='TIMEOUT' if timedout else 'EXIT_STDERR_PAYLOAD_OR_CLOCK'
    save(Path(str(stem)+'.json'),r)
    print(stage,unit,v,'N='+str(n),'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True)
    return r

def correctness():
    assert (HERE/'correctness/regressions.json').exists() and (HERE/'correctness/sanitizer.json').exists()
    rows=[]
    for unit in UNITS:
        rs=[invoke('correctness',unit,v,n,rep=n,order=order) for n in [1,2] for order,v in enumerate(['A','B'])]
        a=all(r['valid'] for r in rs if r['variant']=='A');b=all(r['valid'] for r in rs if r['variant']=='B')
        reason='' if a and b else 'see raw stderr/exit/timeout; B-only failure is a regression'
        included=a and b and unit in SUPPORTED
        if unit.startswith('Box2D'):reason='execution succeeds but frozen upstream has no trusted output correctness gate'
        if unit.startswith('zlib'):reason='frozen qjs lacks read(); no new shim'
        rows.append(dict(case=unit,A_status='supported' if a else 'failed',B_status='supported' if b else 'failed',included=included,reason=reason))
        if a and not b:raise RuntimeError('PORT REGRESSION '+unit)
    csvout(HERE/'coverage.csv',rows)
    assert all(r['included'] for r in rows if r['case'] in SUPPORTED)

def calibrate():
    assert (HERE/'coverage.csv').exists()
    for unit in SUPPORTED:
        selected=HERE/'selected'/f'{unit}.json'
        if selected.exists():continue
        n=1
        while n<=65536:
            pair=[invoke('calibration',unit,v,n,0,i) for i,v in enumerate(['A','B'])]
            assert all(r['valid'] for r in pair)
            if min(r['elapsed_ms'] for r in pair)>=1000:
                pilots=[]
                for rep in range(3):
                    for order,v in enumerate(['A','B'] if rep%2==0 else ['B','A']):
                        pilots.append(invoke('pilot',unit,v,n,rep,order))
                assert all(r['valid'] for r in pilots)
                if min(r['elapsed_ms'] for r in pilots)>=1000:
                    save(selected,dict(case=unit,N=n,pilot_pairs=3,pilot_elapsed_ms=[r['elapsed_ms'] for r in pilots],
                        script_sha256=pair[0]['script_sha256']))
                    for order,v in enumerate(['A','B']):
                        r=invoke('selected_correctness',unit,v,n,0,order)
                        assert r['valid']
                    break
            n*=2
        else:raise RuntimeError('CALIBRATION_LIMIT '+unit)
    capture_environment('post_pilot')
    # Freeze a schedule *before* any formal sample. Each unit has exactly 15 AB/BA.
    rng=random.Random(SEED);orders={u:list(itertools.repeat('AB',15))+list(itertools.repeat('BA',15)) for u in SUPPORTED}
    for seq in orders.values():rng.shuffle(seq)
    schedule=[]
    for rep in range(30):
        units=SUPPORTED.copy();rng.shuffle(units)
        for unit in units:
            n=read(HERE/'selected'/f'{unit}.json')['N']
            for order,v in enumerate(orders[unit][rep]):
                schedule.append(dict(case=unit,N=n,variant=v,rep=rep,order=order,index=len(schedule)))
    save(HERE/'schedule.json',schedule)
    save(HERE/'frozen_config.json',dict(manifest_sha256=sha(HERE/'manifest.json'),protocol_sha256=sha(HERE/'protocol.json'),
        schedule_sha256=sha(HERE/'schedule.json'),selected={p.name:sha(p) for p in (HERE/'selected').glob('*.json')},
        frozen_at=stamp()))

def formal():
    frozen=read(HERE/'frozen_config.json')
    for key,p in [('manifest_sha256','manifest.json'),('protocol_sha256','protocol.json'),('schedule_sha256','schedule.json')]:assert sha(HERE/p)==frozen[key]
    assert not any('cc1' in p for p in subprocess.run(['ps','-eo','comm'],capture_output=True,text=True).stdout.splitlines()),'compiler running'
    for row in read(HERE/'schedule.json'):
        invoke('formal',row['case'],row['variant'],row['N'],row['rep'],row['order'])
    capture_environment('post_formal')
    print('FORMAL_FINISHED',flush=True)

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['init','correctness','calibrate','formal']);args=ap.parse_args()
    globals()[args.stage]()

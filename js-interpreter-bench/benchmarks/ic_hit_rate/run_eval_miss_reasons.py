"""One reason-diagnostic process for each of five low-hit Octane items."""
import argparse
import collections
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
OLD=ROOT/'experiments/octane_ic_rates_20261109/attempt01'
CASES=['RegExp.RegExp','Mandreel.Mandreel','CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','zlib.zlib']


def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True,type=Path);args=p.parse_args()
    out=args.output.resolve();(out/'raw').mkdir()
    binary=out/'diagnostic/work/EVAL_COLD_DIAG/qjs'
    manifest=json.loads((out/'diagnostic/build_manifest.json').read_text())
    assert sha(binary)==manifest['diagnostic_elf_sha256']
    gate=json.loads((out/'calibration_gate.json').read_text());assert gate['status']=='PASS'
    old=json.loads((OLD/'protocol.json').read_text())
    old_rows={(r['case'],r['label']):r for r in map(json.loads,(OLD/'runs.jsonl').read_text().splitlines())}
    frozen={str(HERE/n):sha(HERE/n) for n in ['eval_miss_reasons.h','build_eval_miss_reasons.py','run_eval_miss_reasons.py']}
    frozen[str(binary)]=sha(binary)
    for case in CASES:
        info=old['scripts'][case]['EVAL_COLD'];assert sha(Path(info['path']))==info['sha256']
        frozen[info['path']]=info['sha256']
    (out/'protocol.json').write_text(json.dumps(dict(cases=CASES,processes_per_case=1,
        scope='same Run-only non-length named reads and same N as previous IC-rate diagnostic',
        method='first failed admission guard or read-only descriptor inspection; per-live-site queries with unlink at function-bytecode free',
        diagnostic_atom_lifetime='touched atom names retained until report; no objects/functions/shapes retained by diagnostics',
        frozen_files=frozen,build_manifest_sha256=sha(out/'diagnostic/build_manifest.json')),indent=2)+'\n')
    os.sched_setaffinity(0,{2});env=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
    assert not env.get('LD_PRELOAD') and not env.get('LD_AUDIT')
    rows=[]
    for case in CASES:
        for path,h in frozen.items():assert sha(Path(path))==h
        info=old['scripts'][case]['EVAL_COLD'];cmd=[str(binary)]
        if case=='zlib.zlib':cmd+=['--std','-I',str(ROOT/'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        cmd.append(info['path'])
        t0=time.monotonic_ns();proc=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=600);t1=time.monotonic_ns()
        (out/'raw'/(case+'.stdout')).write_text(proc.stdout);(out/'raw'/(case+'.stderr')).write_text(proc.stderr)
        assert proc.returncode==0,(case,proc.stderr[-2000:])
        prefix='OCTANE_IC_COUNTS:';lines=proc.stderr.strip().splitlines();assert len(lines)==1 and lines[0].startswith(prefix)
        c=json.loads(lines[0][len(prefix):]);assert c['queries']==c['hits']+c['misses']
        assert sum(g['count'] for g in c['groups'])==c['misses']
        for g in c['groups']:g['atom']=bytes.fromhex(g['atom_hex']).decode(errors='replace')
        payload=next(json.loads(s[len('OCTANE_IC_RESULT:'):]) for s in proc.stdout.splitlines() if s.startswith('OCTANE_IC_RESULT:'))
        assert payload['correctness']=='PASS' and payload['N']==info['N']
        prior=old_rows[case,'EVAL_COLD']
        equal=all(c[k]==prior['raw_counts'][k] for k in ['queries','hits','misses','own_fills'])
        row=dict(case=case,N=info['N'],counts=c,prior_totals_identical=equal,
            started_ns=t0,stopped_ns=t1,command=cmd,correctness='PASS')
        rows.append(row)
        with (out/'runs.jsonl').open('a') as f:f.write(json.dumps(row)+'\n');f.flush();os.fsync(f.fileno())
        reason=collections.Counter()
        for g in c['groups']:reason[g['reason']]+=g['count']
        print(case,'prior_match',equal,'hit%',100*c['hits']/c['queries'],'q1_sites',c['single_read_sites'],
              'top_reasons',reason.most_common(4),flush=True)
    for path,h in frozen.items():assert sha(Path(path))==h
    (out/'results.json').write_text(json.dumps(dict(status='PASS',rows=rows),indent=2)+'\n')


if __name__=='__main__':main()

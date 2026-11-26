"""One fresh microbenchmark process per candidate and per corresponding parent."""
import csv
import importlib.util
import io
import json
import os
from pathlib import Path

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
spec=importlib.util.spec_from_file_location('execution_micro_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
OUT=HERE/'micro';OUT.mkdir(exist_ok=True);b.H=OUT
CASES=[('FIELD_RMW_I32','field',33554432),('INT_LOOP_KERNEL','integer',131072),
       ('FIELD_RMW_UPDATE','update',33554432),('INT_LOOP_BITS','bits',16777216),
       ('TRANSITION_EDGE_STRONG','edge',1048576)]


def main():
    os.sched_setaffinity(0,{2});os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
    parent=ROOT/'experiments/native_octane_20261108/attempt11/work/EVAL_COLD/qjs'
    binaries={label:b.load(HERE/(label+'.release.manifest.json'))['elf'] for label,_,_ in CASES}
    protocol=dict(script_sha256=b.sha(HERE/'micro.js'),binary_hashes={p:b.sha(p) for p in [str(parent),*binaries.values()]},
                  cases=CASES,rounds=1,CPU=2,warmup_calls=0,benchmark_algorithm_unchanged=True)
    b.save('protocol.json',protocol)
    table=[]
    for index,(label,mode,n) in enumerate(CASES):
        results={}
        order=['parent','candidate'] if index%2==0 else ['candidate','parent']
        for condition in order:
            binary=str(parent) if condition=='parent' else binaries[label]
            assert b.sha(binary)==protocol['binary_hashes'][binary]
            r=b.capture([binary,HERE/'micro.js',mode,str(n)],'micro',label+'/'+condition,timeout=180)
            assert r['exit_code']==0 and not r['stderr']
            prefix='EXECUTION_MICRO:';lines=[s[len(prefix):] for s in r['stdout'].splitlines() if s.startswith(prefix)]
            assert len(lines)==1
            p=json.loads(lines[0]);assert p['correctness']=='PASS' and p['N']==n and p['mode']==mode and p['elapsed_ms']>0
            results[condition]=p['elapsed_ms']
            b.append(dict(event='measurement',label=label,condition=condition,payload=p))
            print('MICRO',label,condition,p['elapsed_ms'],flush=True)
        table.append(dict(label=label,mode=mode,N=n,EVAL_ms=results['parent'],candidate_ms=results['candidate'],change_pct=100*(results['candidate']/results['parent']-1)))
    stream=io.StringIO(newline='');w=csv.DictWriter(stream,list(table[0]),lineterminator='\n');w.writeheader();w.writerows(table)
    b.save('comparison.csv',stream.getvalue());b.save('results.json',table)


if __name__=='__main__':main()

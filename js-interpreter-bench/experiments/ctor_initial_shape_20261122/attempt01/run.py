"""Fresh-process paired Tree measurements; existing uninstrumented parents."""
import argparse
import csv
import importlib.util
import json
import os
from pathlib import Path
import statistics

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'


def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m


b=load('shape_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
v=load('shape_validator',PACKAGE/'tests/run.py')
catalog=json.loads((PACKAGE/'tests/benchmarks.json').read_text())
TREE=next(c for c in catalog['cases']['sunspider'] if c['case']=='access-binary-trees')


def sha(p):
    import hashlib
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,d):Path(p).write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')


def capture(label,mode,case='tree',pattern='all',n=16777216,rep=0,phase='initial'):
    m=json.loads((HERE/(label+'.'+mode+'.manifest.json')).read_text())
    assert sha(m['binary'])==m['binary_sha256']
    for name,digest in m['sources'].items():assert sha(Path(m['binary']).parent/name)==digest,name
    command=[m['binary'],str(PACKAGE/'tests'/TREE['path'])] if case=='tree' else [m['binary'],str(HERE/'micro.js'),pattern,str(n)]
    name=f'{case}.{pattern}.{label}.{mode}.r{rep}'
    r=b.capture(command,phase,name,timeout=600,identity=dict(label=label,mode=mode,case=case,
        pattern=pattern,rep=rep,binary_sha256=m['binary_sha256']))
    row=dict(event='sample',label=label,mode=mode,case=case,pattern=pattern,rep=rep,valid=False)
    assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
    if case=='tree':
        prefix='TEB_RESULT:';data=[json.loads(s[len(prefix):]) for s in r['stdout'].splitlines() if s.startswith(prefix)]
        assert len(data)==1;value=v.validate(data[0],'sunspider',TREE)
    else:
        data=[json.loads(r['stdout'])];assert data[0]['iterations']==n and data[0]['checksum']==10*n
        value=data[0]['elapsed_ms']
    if mode=='release':assert not r['stderr'],r['stderr'][-2000:]
    row.update(valid=True,value_ms=value,payload=data[0]);b.append(row)
    print('PASS',phase,label,case,pattern,rep,round(value,5),flush=True)
    return row


def main():
    p=argparse.ArgumentParser();p.add_argument('phase',choices=['initial','candidates'])
    p.add_argument('--labels',nargs='+');args=p.parse_args()
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    labels=args.labels or ['SPARSE','P2','P2_COLD'];out=HERE/args.phase;out.mkdir(exist_ok=False);b.H=out
    save(out/'environment.before.json',b.environment())
    rows=[]
    for rep in range(7):
        shift=rep%len(labels);order=labels[shift:]+labels[:shift]
        for label in order:rows.append(capture(label,'release',rep=rep+1,phase=args.phase))
        if args.phase=='candidates':
            for label in order[::-1]:rows.append(capture(label,'release',case='micro',rep=rep+1,phase=args.phase))
    summary=[]
    for case in (['tree'] if args.phase=='initial' else ['tree','micro']):
        for label in labels:
            values=[r['value_ms'] for r in rows if r['case']==case and r['label']==label]
            summary.append(dict(case=case,label=label,median_ms=statistics.median(values),
                min_ms=min(values),max_ms=max(values),raw_ms=values))
    save(out/'summary.json',summary);save(out/'complete.json',dict(status='PASS',labels=labels,processes=len(rows)))
    with (out/'summary.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(summary[0]));w.writeheader();w.writerows(summary)
    save(out/'environment.after.json',b.environment());print(json.dumps(summary,ensure_ascii=False,indent=2),flush=True)


if __name__=='__main__':main()

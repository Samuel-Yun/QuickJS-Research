"""Separate counters: identical micro inputs and selected real workloads."""
import csv
import importlib.util
import json
import os
from pathlib import Path

from build import HERE,ROOT,PACKAGE,LABELS,sha,save

spec=importlib.util.spec_from_file_location('mechanism_capture',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
OUT=HERE/'mechanisms'


def capture(label,script,args,name,suite=None,case=None):
    m=json.loads((HERE/(label+'.counts.manifest.json')).read_text())
    assert m['instrumented'] and sha(m['binary'])==m['binary_sha256']
    command=[m['binary']]
    if case and case['case']=='zlib.zlib':command+=['--std','-I',str(PACKAGE/'tests/support/zlib_read.js')]
    command+=[str(script),*[str(x) for x in args]]
    r=b.capture(command,'counts',name,timeout=600,identity=dict(label=label,suite=suite,
        case=case['case'] if case else name,binary_sha256=m['binary_sha256']))
    assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
    lines=[s for s in r['stderr'].splitlines() if s.startswith('SCREEN_COUNTS:')]
    assert len(lines)==1 and len(r['stderr'].splitlines())==1,r['stderr'][-2000:]
    counts=json.loads(lines[0].removeprefix('SCREEN_COUNTS:'))
    row=dict(event='counts',label=label,name=name,suite=suite,case=case['case'] if case else None,counts=counts)
    if suite:
        prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
        data=[json.loads(s[len(prefix):]) for s in r['stdout'].splitlines() if s.startswith(prefix)]
        assert len(data)==1 and data[0]['correctness']=='PASS' and data[0]['N']==case['N']
    elif name.startswith('micro.'):
        data=json.loads(r['stdout']);assert data['checksum']==655360 and data['iterations']==65536
        row['checksum']=data['checksum']
    b.append(row)
    return row


def main():
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    OUT.mkdir(exist_ok=False);b.H=OUT
    rows=[]
    for label in LABELS:
        for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
            row=capture(label,HERE/'ctor_micro.js',[pattern,65536],'micro.'+pattern+'.'+label)
            rows.append(row);print('MICRO_COUNTS',label,pattern,row['counts']['positive_hits'],row['counts']['plan_publications'],flush=True)
    def micro(label,pattern):return next(r['counts'] for r in rows if r['label']==label and r['name']=='micro.'+pattern+'.'+label)
    comparisons={}
    for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
        base,m1,m2=[micro(l,pattern) for l in ['SPARSE','M1','M2']]
        assert m1['plan_publications']==base['plan_publications']
        assert m1['recipe_calls']<=base['recipe_calls'] and m1['recipe_reused']>0
        assert m2['descriptor_queries']==base['descriptor_queries'] and m2['chain_layers']<base['chain_layers']
        comparisons[pattern]=dict(M1_recipe_calls_saved=base['recipe_calls']-m1['recipe_calls'],
            publications_unchanged=True,M2_layers_saved=base['chain_layers']-m2['chain_layers'],descriptor_queries_unchanged=True)
    for label in ['P2','P3','P4']:
        capacity=int(label[1:])
        assert micro(label,'all')['extra_allocations']==0
        for width in range(2,6):
            c=micro(label,'rotate'+str(width))
            assert c['ctor_calls']==65536 and c['extra_allocations']==1
            if width<=capacity:
                assert c['positive_hits']>=65536-width-1 and c['plan_publications']<=width+1,c
            else:assert c['normal_constructs']>65536//2,c
    save(OUT/'micro.json',rows);save(OUT/'micro_checks.json',dict(status='PASS',comparisons=comparisons))
    # Correctness of the counter builds, independently of their timings.
    for label in LABELS:
        for script in [HERE/'semantics.js',HERE/'d16_cases.js',PACKAGE/'tests/property_reads.js']:
            capture(label,script,[],'gate.'+script.stem+'.'+label)
    catalog=json.loads((PACKAGE/'tests/benchmarks.json').read_text())
    real=[]
    for suite in ['octane','sunspider']:
        for case in catalog['cases'][suite]:
            for label in LABELS:
                selected=(label in ['SPARSE','D16'] or case['case'] in
                    ['RayTrace.RayTrace','EarleyBoyer.Boyer','access-binary-trees'])
                if not selected:continue
                name=suite+'.'+case['case']+'.'+label
                print('REAL_COUNTS',name,flush=True)
                row=capture(label,PACKAGE/'tests'/case['path'],[],name,suite,case)
                real.append(row)
    save(OUT/'real.json',real)
    with (OUT/'micro.csv').open('w',newline='') as f:
        data=[dict(label=r['label'],pattern=r['name'].split('.')[1],**r['counts']) for r in rows]
        w=csv.DictWriter(f,fieldnames=list(data[0]));w.writeheader();w.writerows(data)
    save(OUT/'complete.json',dict(status='PASS',micro_processes=42,real_processes=len(real),
        timing_used_for_conclusions=False,baseline_and_D16_all_43_profiled=True))
    print('MECHANISMS_PASS',flush=True)


if __name__=='__main__':main()

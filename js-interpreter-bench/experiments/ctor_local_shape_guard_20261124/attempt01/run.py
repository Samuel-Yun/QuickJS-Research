"""Semantic differential, independent counters, and paired Release timing."""
import argparse
import csv
import importlib.util
import json
import math
import os
from pathlib import Path
import statistics
import subprocess
import time

from build import HERE,ROOT,PACKAGE,LABELS,save,sha

ENV=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
TESTS=PACKAGE/'tests'
CATALOG=json.loads((TESTS/'benchmarks.json').read_text())
spec=importlib.util.spec_from_file_location('local_guard_validator',TESTS/'run.py')
validator=importlib.util.module_from_spec(spec);spec.loader.exec_module(validator)
OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01'


def binary(label,mode):
    if label=='A':return str(PACKAGE/'build/A/qjs')
    m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
    assert sha(m['binary'])==m['binary_sha256']
    return m['binary']


def capture(label,mode,script,args,phase,case,rep=0,extra_env=None,command_override=None):
    folder=HERE/phase;folder.mkdir(parents=True,exist_ok=True)
    stem=f'{case}.{label}.{mode}.{rep}'
    record=folder/(stem+'.run.json');assert not record.exists(),record
    env=dict(ENV)
    if mode=='counts':env['LSG_OUTPUT']=str(folder/(stem+'.counts.json'))
    if extra_env:env.update(extra_env)
    command=command_override or [binary(label,mode),str(script),*map(str,args)]
    start=time.monotonic();p=subprocess.run(command,env=env,capture_output=True,text=True,timeout=900)
    row=dict(label=label,mode=mode,phase=phase,case=case,rep=rep,command=command,
        exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,external_wall_ms=1000*(time.monotonic()-start))
    save(record,row);assert p.returncode==0,row
    assert not p.stderr,row
    return row


def counts_of(case,label,phase='counts',rep=0):
    return json.loads((HERE/phase/f'{case}.{label}.counts.{rep}.counts.json').read_text())


def gate():
    scripts=[HERE/'semantics.js',HERE/'guard_cases.js',TESTS/'safety.js',TESTS/'property_reads.js',OLD/'02_proto_ticket/safety.js']
    rows=[]
    for i,script in enumerate(scripts):
        case=f'{i}.{script.stem}';ref=capture('A','release',script,[],'gate',case)
        for label in LABELS:
            for mode in ['release','counts']:
                r=capture(label,mode,script,[],'gate',case)
                assert r['stdout']==ref['stdout'],r
                rows.append(dict(script=str(script),label=label,mode=mode,equal_to_A=True))
    local=counts_of('1.guard_cases','CTOR_LOCAL_SHAPE_GUARD','gate')
    # Class bytecode has check_ctor / class-fields initialization, outside R3.
    assert local['positive_hits']==local['plan_publications']==0,local
    fixture=json.loads((HERE/'fixture.json').read_text());assert fixture['status']=='PASS'
    c=fixture['allocation_failure'];verified=fixture['counts']
    save(HERE/'gate.json',dict(status='PASS',differentials=rows,class_template_not_supported=local,
        internal_guard_fixture=verified,optional_record_OOM=c,
        failed_guard_uses_original_checks=True,optional_allocation_failure_preserves_positive_plan=True))
    print('GATE_PASS',len(rows),'internal fixture local success/failure',verified['local_successes'],verified['local_failures'],flush=True)


def micro(label,mode,case,n,phase,rep=0):
    if case=='whitebox':script,args=HERE/'ctor.js',['positive',100,n]
    else:script,args=HERE/'class_micro.js',[n]
    row=capture(label,mode,script,args,phase,case,rep)
    p=json.loads(row['stdout']);assert p['checksum']==3*n and p['iterations']==n,p
    row['ms']=p['elapsed_ms'];return row


def bench(label,mode,suite,c,phase,rep=0):
    assert sha(TESTS/c['path'])==c['sha256']
    cmd=None
    if c['case']=='zlib.zlib':cmd=[binary(label,mode),'--std','-I',str(TESTS/'support/zlib_read.js'),str(TESTS/c['path'])]
    r=capture(label,mode,TESTS/c['path'],[],phase,c['case'],rep,command_override=cmd)
    prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
    ps=[json.loads(s[len(prefix):]) for s in r['stdout'].splitlines() if s.startswith(prefix)];assert len(ps)==1
    r['ms']=validator.validate(ps[0],suite,c);r.update(suite=suite,name=c['name'],group=c['group'],N=c['N'])
    return r


def mechanism():
    rows=[]
    for case in ['whitebox','class_fixture']:
        for label in LABELS:
            micro(label,'counts',case,65536,'counts')
            c=counts_of(case,label);rows.append(dict(case=case,label=label,counts=c))
            print('COUNTS',case,label,json.dumps(c),flush=True)
    for suite,name in [('octane','EarleyBoyer.Boyer'),('sunspider','access-binary-trees')]:
        c=next(c for c in CATALOG['cases'][suite] if c['case']==name)
        for label in LABELS:
            bench(label,'counts',suite,c,'counts')
            d=counts_of(name,label);rows.append(dict(case=name,label=label,counts=d))
            print('COUNTS',name,label,json.dumps(d),flush=True)
    save(HERE/'mechanism.json',rows)


def summarize(rows):
    out=[]
    for case in dict.fromkeys(r['case'] for r in rows):
        baseline=None
        for label in LABELS:
            values=[r['ms'] for r in rows if r['case']==case and r['label']==label]
            med=statistics.median(values)
            if baseline is None:baseline=med
            out.append(dict(case=case,label=label,values_ms=values,median_ms=med,min_ms=min(values),max_ms=max(values),
                change_percent=100*(med/baseline-1)))
    return out


def timing():
    assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
    assert json.loads((HERE/'lifetime.json').read_text())['status']=='PASS'
    assert json.loads((HERE/'sanitize.json').read_text())['status']=='PASS'
    boyer=next(c for c in CATALOG['cases']['octane'] if c['case']=='EarleyBoyer.Boyer')
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    ref=native['scripts']['octane'][boyer['case']]['measure']
    assert boyer['N']==ref['N'] and boyer['sha256']==ref['sha256']
    rows=[]
    save(HERE/'timing_protocol.json',dict(CPU=2,TZ='Asia/Shanghai',locale='C',processes_per_version=5,
        whitebox_N=67108864,boyer_N=boyer['N'],extra_warmup=0,first_Run_included=True,
        whitebox_input_sha256=sha(HERE/'ctor.js'),whitebox_source='sparse_whitebox_20261116/attempt01/ctor.js exact copy',
        counters_not_in_Release=True,engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS}))
    for rep in range(1,6):
        for i,case in enumerate(['whitebox','Boyer']):
            for label in (LABELS if (rep+i)%2 else LABELS[::-1]):
                if case=='Boyer':r=bench(label,'release','octane',boyer,'timing',rep)
                else:r=micro(label,'release',case,67108864 if case=='whitebox' else 16777216,'timing',rep)
                rows.append(r);save(HERE/'timing_samples.json',rows)
                print('TIME',rep,case,label,r['ms'],flush=True)
    summary=summarize(rows);save(HERE/'timing.json',summary)
    with (HERE/'timing.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(summary[0]));w.writeheader();w.writerows(summary)


def decide():
    m=json.loads((HERE/'mechanism.json').read_text())
    c=next(r['counts'] for r in m if r['case']=='EarleyBoyer.Boyer' and r['label']!= 'SPARSE')
    t=json.loads((HERE/'timing.json').read_text())
    b,v=[next(r for r in t if r['case']=='EarleyBoyer.Boyer' and r['label']==l) for l in LABELS]
    pairs=[100*(y/x-1) for x,y in zip(b['values_ms'],v['values_ms'])]
    proceed=c['positive_hits_local']>0 and sum(x<0 for x in pairs)>=4 and v['change_percent']<0
    reason=('Boyer 有局部守卫正命中，至少 4/5 对进程更快，继续全集。' if proceed else
            'Boyer 没有局部守卫覆盖或定向计时未显示可复现收益，停在定向实验，不跑全集。')
    save(HERE/'decision.json',dict(run_full=proceed,reason=reason,positive_hits_local=c['positive_hits_local'],
        paired_boyer_change_percent=pairs,median_boyer_change_percent=v['change_percent']))
    print('DECISION',proceed,reason,flush=True)


def full():
    assert json.loads((HERE/'decision.json').read_text())['run_full']
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    rows=[];index=0
    for i in range(26):
        for suite in ['octane','sunspider']:
            if i>=len(CATALOG['cases'][suite]):continue
            c=CATALOG['cases'][suite][i];ref=native['scripts'][suite][c['case']]['measure']
            assert c['N']==ref['N'] and c['sha256']==ref['sha256']
            for label in (LABELS if index%2==0 else LABELS[::-1]):
                r=bench(label,'release',suite,c,'full',1);rows.append(r);save(HERE/'full_samples.json',rows)
                print('FULL',len(rows),'/86',suite,c['name'],label,r['ms'],flush=True)
            index+=1
    save(HERE/'full_complete.json',dict(status='PASS',fresh_processes=86))


if __name__=='__main__':
    os.sched_setaffinity(0,{2})
    ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['gate','mechanism','timing','decide','full'])
    globals()[ap.parse_args().phase]()

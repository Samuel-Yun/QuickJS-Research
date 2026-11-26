"""Separate mechanism counting and paired Release timing."""
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

from build import HERE,ROOT,PACKAGE,LABELS,EVENTS,save,sha
ENV=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C',ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
TESTS=PACKAGE/'tests';CATALOG=json.loads((TESTS/'benchmarks.json').read_text())
CASES=['stable','same_slot','different_slot','multi']
TARGETS=[c for c in CATALOG['cases']['octane'] if c['name'] in ['Splay','PdfJS','RayTrace']]
spec=importlib.util.spec_from_file_location('go_frozen_validator',TESTS/'run.py')
validator=importlib.util.module_from_spec(spec);spec.loader.exec_module(validator)


def binary(label,mode):
    if label=='A':return str(PACKAGE/'build/A/qjs')
    m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
    assert sha(m['binary'])==m['binary_sha256'];return m['binary']


def capture(label,mode,script,args,phase,case,rep=0,snapshot=False,extra=None):
    folder=HERE/phase;folder.mkdir(parents=True,exist_ok=True)
    stem=f'{case}.{label}.{mode}.{rep}';path=folder/(stem+'.run.json');assert not path.exists(),path
    env=dict(ENV)
    if mode=='counts':env['GO_OUTPUT']=str(folder/(stem+'.counts.json'))
    if snapshot:env.update(QJS_INSPECT_FILE=str(script),QJS_INSPECT_OUTPUT=str(folder/(stem+'.snapshot.jsonl')))
    command=[binary(label,mode)]
    if case=='zlib.zlib':command+=['--std','-I',str(TESTS/'support/zlib_read.js')]
    command += [str(script),*map(str,args)]
    start=time.monotonic();r=subprocess.run(command,capture_output=True,text=True,env=env,timeout=900)
    row=dict(label=label,mode=mode,case=case,phase=phase,rep=rep,command=command,binary_sha256=sha(command[0]),
        exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,external_wall_ms=1000*(time.monotonic()-start))
    save(path,row);assert r.returncode==0,row
    if mode=='counts':assert all(s.startswith('GO_LAYOUT ') for s in r.stderr.splitlines()),row
    else:assert not r.stderr,row
    return row


def micro(label,mode,case,n,phase,rep=0,snapshot=False):
    r=capture(label,mode,HERE/'micro.js',[case,n],phase,case,rep,snapshot)
    p=json.loads(r['stdout']);assert p['iterations']==n and p['checksum']==n*({'stable':3,'same_slot':4,'different_slot':4,'multi':6}[case])
    r.update(ms=p['elapsed_ms'],iterations=n);return r


def diagnostics(path):
    d=json.loads(Path(path).read_text());c=d['totals']
    assert c['logical_named']==c['primary_hits']+c['secondary_hits']+c['normal_lookups'],c
    assert c['logical_named']==c['rdi0_named']+c['rdi1_named']+c['legacy_named'],c
    assert c['normal_lookups']==c['rdi_normal_lookups']+c['legacy_named'],c
    assert c['primary_hits']==c['fused_hits']+c['field_primary_hits']+c['prototype_primary_hits'],c
    c['secondary_probe_hit_percent']=100*c['secondary_hits']/c['secondary_probes'] if c['secondary_probes'] else None
    c['secondary_all_named_percent']=100*c['secondary_hits']/c['logical_named'] if c['logical_named'] else None
    return d


def gate():
    assert json.loads((HERE/'weak_gate.json').read_text())['status']=='PASS'
    rows=[]
    for script in [HERE/'semantics.js',TESTS/'property_reads.js',TESTS/'safety.js']:
        ref=capture('A','release',script,[],'gate',script.stem)
        for label in LABELS:
            for mode in (['release','counts','sanitize'] if label!='SPARSE' else ['release','counts']):
                r=capture(label,mode,script,[],'gate',script.stem);assert r['stdout']==ref['stdout'],r
                rows.append(dict(script=str(script),label=label,mode=mode,equal_to_A=True))
    for case in CASES:
        for label in ['A']+LABELS:micro(label,'release',case,128,'gate')
    save(HERE/'gate.json',dict(status='PASS',comparisons=rows,weak_lifetime_and_native_reentry_gate='weak_gate.json'))
    print('GATE_PASS',len(rows),flush=True)


def micro_counts():
    n=65536;rows=[]
    spec=importlib.util.spec_from_file_location('go_display',PACKAGE/'tools/bytecode.py')
    tool=importlib.util.module_from_spec(spec);spec.loader.exec_module(tool)
    for case in CASES:
        for label in LABELS:
            micro(label,'counts',case,n,'micro_counts',snapshot=True)
            stem=f'{case}.{label}.counts.0';d=diagnostics(HERE/'micro_counts'/(stem+'.counts.json'))
            sites=[s for s in d['sites'] if s['function']=='readX'];assert len(sites)==1
            c=sites[0]['counts'];assert c['logical_named']==n,c
            if case=='stable':assert c['primary_hits']==n-1 and c['secondary_probes']==0 and c['primary_updates']==1,c
            elif label=='SPARSE':assert c['primary_hits']==c['secondary_hits']==0 and c['primary_updates']==n,c
            elif d['totals']['conflict_replacements']==0:
                layouts=4 if case=='multi' else 2
                assert c['primary_updates']==c['normal_lookups']==layouts,c
                assert c['primary_hits']==n//layouts-1,c
                assert c['secondary_hits']==(n//layouts-1)*(layouts-1),c
            if label!='SPARSE':assert c['primary_updates']<n and c['secondary_hits']>0 if case!='stable' else True
            snapshots=[json.loads(s) for s in (HERE/'micro_counts'/(stem+'.snapshot.jsonl')).read_text().splitlines()]
            selected=[s for s in snapshots if s['function']=='readX'];assert len(selected)==1
            assert [o['name'] for o in selected[0]['opcodes']]==['v6_get_arg0','get_field_rdi','return']
            (HERE/'micro_counts'/(stem+'.bytecode.txt')).write_text(tool.disassemble(selected))
            rows.append(dict(case=case,label=label,site=sites[0],totals=d['totals'],layout=d['layout']))
            print('MICRO_COUNTS',case,label,c,flush=True)
    save(HERE/'micro_counts.json',rows)


def pilot():
    rows=[];n=1048576
    for case in CASES:
        for label in ['A']+LABELS:
            r=micro(label,'release',case,n,'pilot');rows.append(r)
            print('PILOT',case,label,r['ms'],flush=True)
    fastest=min(r['ms'] for r in rows);n=2**math.ceil(math.log2(n*3000/max(1,fastest)))
    assert n*6<2147483647
    save(HERE/'micro_protocol.json',dict(iterations=n,repeats=5,labels=['A']+LABELS,CPU=2,
        locale='C',TZ='Asia/Shanghai',timer='performance.now around run(sequence,n); setup excluded',
        first_call_included=True,extra_warmup=0,pilot=rows))
    print('COMMON_N',n,flush=True)


def summarize(rows,labels):
    out=[]
    for case in dict.fromkeys(r['case'] for r in rows):
        base=statistics.median(r['ms'] for r in rows if r['case']==case and r['label']=='SPARSE')
        for label in labels:
            values=[r['ms'] for r in rows if r['case']==case and r['label']==label]
            med=statistics.median(values)
            out.append(dict(case=case,label=label,values_ms=values,median_ms=med,min_ms=min(values),max_ms=max(values),
                change_vs_SPARSE_percent=100*(med/base-1)))
    return out


def micro_time():
    assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
    n=json.loads((HERE/'micro_protocol.json').read_text())['iterations'];rows=[];labels=['A']+LABELS
    for rep in range(1,6):
        for i,case in enumerate(CASES):
            shift=(rep+i-1)%len(labels);order=labels[shift:]+labels[:shift]
            for label in order:
                r=micro(label,'release',case,n,'micro_time',rep);rows.append(r)
                save(HERE/'micro_samples.json',rows);print('MICRO_TIME',rep,case,label,r['ms'],flush=True)
    save(HERE/'micro_timing.json',summarize(rows,labels))


def bench(label,mode,suite,c,phase,rep=0):
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    ref=native['scripts'][suite][c['case']]['measure'];assert c['N']==ref['N'] and c['sha256']==ref['sha256']==sha(TESTS/c['path'])
    r=capture(label,mode,TESTS/c['path'],[],phase,c['case'],rep)
    prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
    ps=[json.loads(s[len(prefix):]) for s in r['stdout'].splitlines() if s.startswith(prefix)];assert len(ps)==1
    r['ms']=validator.validate(ps[0],suite,c);r.update(suite=suite,name=c['name'],group=c['group'],N=c['N'])
    return r


def target_counts():
    rows=[]
    for c in TARGETS:
        for label in LABELS:
            bench(label,'counts','octane',c,'target_counts')
            d=diagnostics(HERE/'target_counts'/f'{c["case"]}.{label}.counts.0.counts.json')
            rows.append(dict(case=c['case'],label=label,totals=d['totals'],top=sorted(d['sites'],key=lambda s:s['counts']['secondary_hits'],reverse=True)[:10]))
            print('TARGET_COUNTS',c['name'],label,d['totals'],flush=True)
    save(HERE/'target_counts.json',rows)


def target_time():
    rows=[]
    for rep in range(1,4):
        for i,c in enumerate(TARGETS):
            for label in (LABELS if (rep+i)%2 else LABELS[::-1]):
                r=bench(label,'release','octane',c,'target_time',rep);rows.append(r);save(HERE/'target_samples.json',rows)
                print('TARGET_TIME',rep,c['name'],label,r['ms'],flush=True)
    save(HERE/'target_timing.json',summarize(rows,LABELS))


def decide():
    times=json.loads((HERE/'target_timing.json').read_text());counts=json.loads((HERE/'target_counts.json').read_text())
    evidence=[]
    for c in TARGETS:
        b,v=[next(r for r in times if r['case']==c['case'] and r['label']==l) for l in LABELS]
        pairs=[100*(y/x-1) for x,y in zip(b['values_ms'],v['values_ms'])]
        d=next(r['totals'] for r in counts if r['case']==c['case'] and r['label']!= 'SPARSE')
        proceed=d['secondary_hits']>0 and all(x<0 for x in pairs) and v['change_vs_SPARSE_percent']<0
        evidence.append(dict(case=c['case'],paired_change_percent=pairs,median_change_percent=v['change_vs_SPARSE_percent'],secondary_hits=d['secondary_hits'],repeatable_direction=proceed))
    go=any(r['repeatable_direction'] for r in evidence)
    save(HERE/'decision.json',dict(run_full=go,evidence=evidence,
        reason='至少一个真实用例有二级命中且三对进程均更快，继续全集。' if go else '没有真实用例同时满足二级覆盖和三对同向改善，停在定向实验。'))
    print('DECISION',go,json.dumps(evidence),flush=True)


def full_time():
    assert json.loads((HERE/'decision.json').read_text())['run_full'];rows=[]
    for i in range(26):
        for suite in ['octane','sunspider']:
            if i>=len(CATALOG['cases'][suite]):continue
            c=CATALOG['cases'][suite][i]
            order=LABELS if (i+(suite=='sunspider'))%2 else LABELS[::-1]
            for label in order:
                r=bench(label,'release',suite,c,'full_time',1);rows.append(r);save(HERE/'full_samples.json',rows)
                print('FULL_TIME',len(rows),'/86',suite,c['name'],label,r['ms'],flush=True)
    save(HERE/'full_complete.json',dict(status='PASS',fresh_release_processes=86,octane=17,sunspider=26))


def full_counts():
    assert json.loads((HERE/'decision.json').read_text())['run_full'];rows=[]
    for suite in ['octane','sunspider']:
        for c in CATALOG['cases'][suite]:
            bench('GLOBAL_OWN_OFFSET_CACHE','counts',suite,c,'full_counts')
            d=diagnostics(HERE/'full_counts'/f'{c["case"]}.GLOBAL_OWN_OFFSET_CACHE.counts.0.counts.json')
            rows.append(dict(suite=suite,case=c['case'],totals=d['totals'],top=sorted(d['sites'],key=lambda s:s['counts']['secondary_hits'],reverse=True)[:5]))
            save(HERE/'full_counts.json',rows);print('FULL_COUNTS',len(rows),'/43',c['name'],d['totals']['secondary_all_named_percent'],flush=True)


if __name__=='__main__':
    os.sched_setaffinity(0,{2})
    ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['gate','micro_counts','pilot','micro_time','target_counts','target_time','decide','full_time','full_counts'])
    globals()[ap.parse_args().phase]()

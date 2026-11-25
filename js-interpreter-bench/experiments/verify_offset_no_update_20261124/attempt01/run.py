"""Separate mechanism evidence and paired uninstrumented timing."""
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

ENV=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
CASES=['stable','same_slot','different_slot']
TESTS=PACKAGE/'tests'
CATALOG=json.loads((TESTS/'benchmarks.json').read_text())
TARGETS=[c for c in CATALOG['cases']['octane'] if c['name'] in ['Splay','PdfJS','RayTrace']]


def load_module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);return mod


validator=load_module('frozen_validator',TESTS/'run.py')


def binary(label,mode):
    if label=='A': return str(PACKAGE/'build/A/qjs')
    m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
    assert sha(m['binary'])==m['binary_sha256']
    return m['binary']


def capture(label,mode,script,args,phase,case,rep=0,snapshot=False):
    folder=HERE/phase;folder.mkdir(exist_ok=True)
    stem=f'{case}.{label}.{mode}.{rep}'
    env=dict(ENV)
    if mode=='counts':env['VON_OUTPUT']=str(folder/(stem+'.counts.jsonl'))
    if snapshot:
        env.update(QJS_INSPECT_FILE=str(script),QJS_INSPECT_OUTPUT=str(folder/(stem+'.snapshot.jsonl')))
    command=[binary(label,mode)]
    if case=='zlib.zlib':command+=['--std','-I',str(TESTS/'support/zlib_read.js')]
    command += [str(script),*map(str,args)]
    start=time.monotonic()
    result=subprocess.run(command,capture_output=True,text=True,env=env,timeout=600)
    row=dict(label=label,mode=mode,phase=phase,case=case,rep=rep,command=command,
        binary_sha256=sha(command[0]),exit_code=result.returncode,stdout=result.stdout,
        stderr=result.stderr,external_wall_ms=1000*(time.monotonic()-start))
    save(folder/(stem+'.run.json'),row)
    assert result.returncode==0,row
    if mode=='release':assert not result.stderr,row
    return row


def micro(label,mode,case,n,phase,rep=0,plain=False,snapshot=False):
    row=capture(label,mode,HERE/'micro.js',[case,n,'plain' if plain else 'fused'],phase,
                case+('.plain' if plain else ''),rep,snapshot)
    payload=json.loads(row['stdout']);row['payload']=payload
    expected=3*n if case=='stable' else 3*math.ceil(n/2)+5*math.floor(n/2)
    assert payload['iterations']==n and payload['checksum']==expected
    return row


def aggregate_counts(path):
    rows=[json.loads(s) for s in Path(path).read_text().splitlines()]
    total={k:sum(r[k] for r in rows) for k in EVENTS}
    assert total['logical_reads']==total['fused_hits']+total['field_entries'],total
    assert total['field_entries']==total['shape_hits']+total['verify_successes']+total['normal_lookups'],total
    total['verification_success_percent']=100*total['verify_successes']/total['verify_attempts'] if total['verify_attempts'] else None
    return rows,total


def summarize(rows,key):
    summaries=[]
    for case in dict.fromkeys(r['case'] for r in rows):
        baseline=None
        for label in LABELS:
            values=[r[key] for r in rows if r['case']==case and r['label']==label]
            if not values:continue
            med=statistics.median(values)
            if baseline is None:baseline=med
            summaries.append(dict(case=case,label=label,values_ms=values,median_ms=med,
                min_ms=min(values),max_ms=max(values),change_percent=100*(med/baseline-1)))
    return summaries


def gate():
    rows=[]
    scripts=[HERE/'semantics.js',TESTS/'property_reads.js',TESTS/'safety.js']
    for script in scripts:
        reference=capture('A','release',script,[],'gate',script.stem)
        for label in LABELS:
            for mode in ['release','counts']:
                r=capture(label,mode,script,[],'gate',script.stem)
                assert r['stdout']==reference['stdout'],r
                rows.append(dict(script=str(script),label=label,mode=mode,equal_to_A=True))
    for case in CASES:
        for plain in [False,True]:
            for label in ['A']+LABELS:micro(label,'release',case,128,'gate',plain=plain)
    save(HERE/'gate.json',dict(status='PASS',comparisons=rows))
    print('GATE_PASS',len(rows),flush=True)


def pilot():
    rows=[];n=1048576
    for case in CASES:
        for label in LABELS:
            r=micro(label,'release',case,n,'pilot');rows.append(r)
            print('PILOT',case,label,r['payload']['elapsed_ms'],flush=True)
    fastest=min(r['payload']['elapsed_ms'] for r in rows)
    n=2**math.ceil(math.log2(n*3000/max(1,fastest)))
    assert n*5<2147483647
    save(HERE/'protocol.json',dict(iterations=n,repeats=5,CPU=2,timezone='Asia/Shanghai',locale='C',
        timer='Date.now around run(sequence,n,plain); same scaffold as read_shape_miss',
        input_setup_timed=False,warmup_calls=0,first_Run_included=True,pilot=rows))
    print('COMMON_N',n,flush=True)


def micro_counts():
    n=65536;summary=[]
    tool=load_module('bytecode_display',PACKAGE/'tools/bytecode.py')
    for plain in [False,True]:
        fn='readPlain' if plain else 'readX'
        for case in CASES:
            for label in LABELS:
                micro(label,'counts',case,n,'micro_counts',plain=plain,snapshot=True)
                stem=f'{case}{".plain" if plain else ""}.{label}.counts.0'
                folder=HERE/'micro_counts'
                records,total=aggregate_counts(folder/(stem+'.counts.jsonl'))
                selected=[r for r in records if r['function']==fn]
                assert len(selected)==1,(fn,selected)
                c=selected[0];assert c['logical_reads']==n,c
                if case=='stable':
                    assert c['normal_lookups']==c['updates']==1 and c['verify_attempts']==0,c
                elif case=='same_slot' and label!= 'SPARSE':
                    assert c['normal_lookups']==c['updates']==1,c
                    assert c['verify_attempts']==c['verify_successes']==n//2,c
                    assert c['fused_hits']+c['shape_hits']==n//2-1,c
                else:
                    assert c['normal_lookups']==c['updates']==n,c
                    assert c['verify_successes']==0,c
                if not plain:assert c['shape_hits']==0,c
                if plain:assert c['fused_entries']==c['fused_hits']==0,c
                snapshots=[json.loads(s) for s in (folder/(stem+'.snapshot.jsonl')).read_text().splitlines()]
                snapshots=[s for s in snapshots if s['function']==fn]
                assert len(snapshots)==1
                ops=[o['name'] for o in snapshots[0]['opcodes']]
                assert 'get_field_rdi' in ops and (('v6_get_arg0' in ops)==(not plain)),ops
                (folder/(stem+'.bytecode.txt')).write_text(tool.disassemble(snapshots))
                c.update(case=case,label=label,plain=plain,verification_success_percent=
                         100*c['verify_successes']/c['verify_attempts'] if c['verify_attempts'] else None)
                summary.append(c);print('COUNTS_PASS',case,label,'plain',plain,c,flush=True)
    save(HERE/'micro_counts.json',summary)


def micro_time():
    assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
    p=json.loads((HERE/'protocol.json').read_text());rows=[]
    for rep in range(1,6):
        for j,case in enumerate(CASES):
            order=LABELS if (rep+j)%2 else LABELS[::-1]
            for label in order:
                row=micro(label,'release',case,p['iterations'],'micro_time',rep)
                row['ms']=row['payload']['elapsed_ms'];rows.append(row)
                print('MICRO',rep,case,label,row['ms'],flush=True)
    save(HERE/'micro_timing.json',summarize(rows,'ms'))


def bench(label,mode,suite,c,phase,rep=0):
    assert sha(TESTS/c['path'])==c['sha256']
    row=capture(label,mode,TESTS/c['path'],[],phase,c['case'],rep)
    prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
    payloads=[json.loads(s[len(prefix):]) for s in row['stdout'].splitlines() if s.startswith(prefix)]
    assert len(payloads)==1
    row['ms']=validator.validate(payloads[0],suite,c)
    row.update(suite=suite,group=c['group'],name=c['name'],N=c['N'])
    return row


def target_counts():
    summary=[]
    for c in TARGETS:
        for label in LABELS:
            bench(label,'counts','octane',c,'target_counts')
            path=HERE/'target_counts'/f'{c["case"]}.{label}.counts.0.counts.jsonl'
            records,total=aggregate_counts(path)
            top=sorted(records,key=lambda r:r['verify_successes'],reverse=True)[:10]
            summary.append(dict(case=c['case'],label=label,total=total,top=top))
            print('TARGET_COUNTS',c['name'],label,total,flush=True)
    save(HERE/'target_counts.json',summary)


def target_time():
    rows=[]
    for rep in range(1,4):
        for j,c in enumerate(TARGETS):
            for label in (LABELS if (rep+j)%2 else LABELS[::-1]):
                r=bench(label,'release','octane',c,'target_time',rep);rows.append(r)
                print('TARGET',rep,c['name'],label,r['ms'],flush=True)
    save(HERE/'target_timing.json',summarize(rows,'ms'))


def decide():
    targets=json.loads((HERE/'target_timing.json').read_text())
    counts=json.loads((HERE/'target_counts.json').read_text())
    evidence=[]
    for b in [r for r in targets if r['label']=='SPARSE']:
        v=next(r for r in targets if r['case']==b['case'] and r['label']!= 'SPARSE')
        paired=[100*(y/x-1) for x,y in zip(b['values_ms'],v['values_ms'])]
        c=next(r for r in counts if r['case']==b['case'] and r['label']!= 'SPARSE')['total']
        evidence.append(dict(case=b['case'],paired_change_percent=paired,
            median_change_percent=v['change_percent'],rescued_reads=c['verify_successes'],
            repeatable_direction=all(x<0 for x in paired) and v['change_percent']<0 and c['verify_successes']>0))
    run_full=any(r['repeatable_direction'] for r in evidence)
    reason=('至少一个真实用例有第二层成功，且 3 对 Release 新进程中新版均更快，继续同批单轮全集。'
            if run_full else '真实用例未出现 3 对新进程方向一致的收益，停止于定向筛选，不跑全集。')
    save(HERE/'decision.json',dict(run_full=run_full,reason=reason,evidence=evidence,
        criterion='at least one real case: verify_successes>0, all 3 paired changes<0, median change<0; direction screening, not significance'))
    print('DECISION',run_full,reason,json.dumps(evidence),flush=True)


def full():
    assert json.loads((HERE/'decision.json').read_text())['run_full']
    rows=[];index=0
    native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
    for i in range(26):
        for suite in ['octane','sunspider']:
            if i>=len(CATALOG['cases'][suite]):continue
            c=CATALOG['cases'][suite][i]
            old=native['scripts'][suite][c['case']]['measure']
            assert old['N']==c['N'] and old['sha256']==c['sha256']
            for label in (LABELS if index%2==0 else LABELS[::-1]):
                r=bench(label,'release',suite,c,'full',1);rows.append(r)
                save(HERE/'full_samples.json',rows)
                print('FULL',len(rows),'/86',suite,c['name'],label,r['ms'],flush=True)
            index+=1
    save(HERE/'full_timing.json',summarize(rows,'ms'))
    save(HERE/'full_complete.json',dict(status='PASS',processes=86,octane=17,sunspider=26))


if __name__=='__main__':
    os.sched_setaffinity(0,{2})
    parser=argparse.ArgumentParser();parser.add_argument('phase',choices=['gate','pilot','micro_counts','micro_time','target_counts','target_time','decide','full'])
    globals()[parser.parse_args().phase]()

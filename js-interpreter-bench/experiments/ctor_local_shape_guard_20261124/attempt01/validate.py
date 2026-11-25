"""C fixtures, existing GC tests, and targeted ASan/UBSan checks."""
import argparse
import json
import os
from pathlib import Path
import subprocess

from build import HERE,PACKAGE,LABELS,save,sha

ENV=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C',LANG='C',
    ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')


def directory(label,mode):
    if label=='A':return PACKAGE/'build/A'
    m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
    assert sha(m['binary'])==m['binary_sha256'];return Path(m['binary']).parent


def compile_run(label,mode,source,include_vm=False,fault=False):
    d=directory(label,mode);sanitize=mode=='sanitize'
    output=HERE/'validation';output.mkdir(exist_ok=True)
    name=f'{label}.{mode}.{source.stem}'+('.fault' if fault else '')
    exe=output/name
    flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if sanitize else []
    objects=list((d/'.obj').rglob('quickjs.o'));assert len(objects)==1,objects
    obj=objects[0].parent
    names=['dtoa','libregexp','libunicode','cutils']
    if not include_vm:names.insert(0,'quickjs')
    cmd=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"',
        *flags,'-I'+str(d)]
    if label=='CTOR_LOCAL_SHAPE_GUARD':cmd+=['-DLSG_TEST_LOCAL=1']
    if label!='A':cmd+=['-DLSG_TEST_SPARSE=1']
    cmd += [str(source),*[str(obj/(n+'.o')) for n in names],'-lm','-ldl','-lpthread','-o',str(exe)]
    built=subprocess.run(cmd,capture_output=True,text=True)
    save(output/(name+'.compile.json'),dict(command=cmd,exit_code=built.returncode,stdout=built.stdout,stderr=built.stderr))
    assert built.returncode==0,built.stderr
    env=dict(ENV)
    if mode=='counts':env['LSG_OUTPUT']=str(output/(name+'.counts.json'))
    if fault:env['LSG_FAIL_RECORD_ALLOC']='1'
    result=subprocess.run([str(exe)],capture_output=True,text=True,env=env,timeout=180)
    row=dict(label=label,mode=mode,source=source.name,command=[str(exe)],exit_code=result.returncode,
        stdout=result.stdout,stderr=result.stderr,binary_sha256=sha(exe),fixture_only=include_vm)
    save(output/(name+'.run.json'),row)
    assert result.returncode==0 and not result.stderr,row
    assert 'PASS' in result.stdout,row
    return row


def fixture():
    rows=[]
    for label,mode in [('A','release'),('SPARSE','counts'),('CTOR_LOCAL_SHAPE_GUARD','counts')]:
        r=compile_run(label,mode,HERE/'shape_guard_fixture.c',True);rows.append(r)
        print('FIXTURE_PASS',label,mode,r['stdout'].strip(),flush=True)
    r=compile_run('CTOR_LOCAL_SHAPE_GUARD','counts',HERE/'shape_guard_fixture.c',True,True);rows.append(r)
    counts=json.loads((HERE/'validation/CTOR_LOCAL_SHAPE_GUARD.counts.shape_guard_fixture.counts.json').read_text())
    fault=json.loads((HERE/'validation/CTOR_LOCAL_SHAPE_GUARD.counts.shape_guard_fixture.fault.counts.json').read_text())
    assert counts['local_successes']>0 and counts['local_failures']>0 and counts['full_check_accepts']>0
    assert counts['records_built']==counts['records_freed'] and counts['shape_refs_held']==counts['shape_refs_released']
    assert fault['record_allocation_failures']>0 and fault['positive_hits']>0 and fault['records_built']==0
    save(HERE/'fixture.json',dict(status='PASS',counts=counts,allocation_failure=fault,runs=rows,
        nature='INTERNAL C FIXTURE: hashes materialized layouts before learning; not a real-workload measurement'))


def lifetime():
    rows=[]
    for label in LABELS:
        for source in ['lifetime.c','ownership_realms.c','class_lifetime.c']:
            rows.append(compile_run(label,'release',HERE/source))
            print('LIFETIME_PASS',label,source,flush=True)
    save(HERE/'lifetime.json',dict(status='PASS',runs=rows))


def sanitize():
    label='CTOR_LOCAL_SHAPE_GUARD';d=directory(label,'sanitize');rows=[]
    for source in ['semantics.js','guard_cases.js']:
        r=subprocess.run([str(d/'qjs'),str(HERE/source)],capture_output=True,text=True,env=ENV,timeout=120)
        row=dict(source=source,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
        save(HERE/f'sanitize.{source}.json',row);assert r.returncode==0 and not r.stderr,row;rows.append(row)
    for source in ['lifetime.c','ownership_realms.c','class_lifetime.c']:
        rows.append(compile_run(label,'sanitize',HERE/source))
    rows.append(compile_run(label,'sanitize',HERE/'shape_guard_fixture.c',True))
    save(HERE/'sanitize.json',dict(status='PASS',ASan=True,UBSan=True,LSan=False,
        LSan_reason='ptrace environment; detect_leaks=0; QuickJS FreeRuntime assertions remain enabled',runs=rows))
    print('SANITIZE_PASS',flush=True)


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['fixture','lifetime','sanitize'])
    globals()[ap.parse_args().phase]()

"""Finish weak-lifetime validation before any formal Release measurement."""
import argparse
import json
import os
from pathlib import Path
import subprocess

from build import HERE,PACKAGE,LABELS,save,sha

ENV=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C',
    ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')


def directory(label,mode):
    if label=='A':return PACKAGE/'build/A'
    m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text());assert sha(m['binary'])==m['binary_sha256']
    return Path(m['binary']).parent


def fixture(label,mode):
    d=directory(label,mode);out=HERE/'validation';out.mkdir(exist_ok=True)
    name=f'{label}.{mode}.weak_fixture';exe=out/name
    objects=list((d/'.obj').rglob('quickjs.o'));assert len(objects)==1;obj=objects[0].parent
    flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='sanitize' else []
    cmd=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"',
        *flags,'-I'+str(d)]
    if label!='A':cmd+=['-DTEST_SPARSE=1']
    cmd += [str(HERE/'weak_fixture.c'),*[str(obj/(n+'.o')) for n in ['dtoa','libregexp','libunicode','cutils']],
        '-lm','-ldl','-lpthread','-o',str(exe)]
    r=subprocess.run(cmd,capture_output=True,text=True)
    save(out/(name+'.compile.json'),dict(command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert r.returncode==0,r.stderr
    env=dict(ENV)
    if mode=='counts':env['GO_OUTPUT']=str(out/(name+'.counts.json'))
    r=subprocess.run([str(exe)],capture_output=True,text=True,env=env,timeout=180)
    record=dict(label=label,mode=mode,command=[str(exe)],binary_sha256=sha(exe),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
    save(out/(name+'.run.json'),record)
    assert r.returncode==0 and 'WEAK_CACHE_FIXTURE_PASS' in r.stdout,record
    assert all(s.startswith('GO_LAYOUT ') for s in r.stderr.splitlines()),record
    print('FIXTURE_PASS',label,mode,r.stdout.strip(),flush=True)
    return record


def main():
    ap=argparse.ArgumentParser();ap.add_argument('--sanitize-only',action='store_true');a=ap.parse_args()
    rows=[]
    targets=[('GLOBAL_OWN_OFFSET_CACHE','sanitize')] if a.sanitize_only else [
        ('A','release'),('SPARSE','release'),('GLOBAL_OWN_OFFSET_CACHE','counts'),('GLOBAL_OWN_OFFSET_CACHE','sanitize')]
    for label,mode in targets:rows.append(fixture(label,mode))
    if not a.sanitize_only:
        data=json.loads((HERE/'validation/GLOBAL_OWN_OFFSET_CACHE.counts.weak_fixture.counts.json').read_text())
        assert data['totals']['conflict_replacements']>=2
        assert data['totals']['cleared_entries']>=12 and data['totals']['shutdown_entries']>=2
        save(HERE/'weak_gate.json',dict(status='PASS',runs=rows,counts=data['totals'],layout=data['layout'],
            multiple_atoms_per_shape=True,full_keys_on_collisions=True,clone_links_reset=True,
            deletion_getter_resize_compaction_free_GC_runtime=True,native_reentry_checked=True,
            no_shape_or_atom_strong_references_from_cache=True,ASan=True,UBSan=True,LSan=False,
            LSan_note='detect_leaks=0 under ptrace; QuickJS FreeRuntime assertions enabled'))


if __name__=='__main__':main()

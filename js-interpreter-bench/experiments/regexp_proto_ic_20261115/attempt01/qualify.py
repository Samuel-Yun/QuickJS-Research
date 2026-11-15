"""Targeted C-vs-3B semantics, native two-realm calls, and counter gates."""
import importlib.util
import json
import os
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PARENT=ROOT/'experiments/execution_paths_20261114/attempt01'
spec=importlib.util.spec_from_file_location('b3_qualification_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
OUT=HERE/'qualification';b.H=OUT


def capture(name,cmd,env=None):
    r=b.capture(cmd,'qualification',name,timeout=120)
    assert r['exit_code']==0 and not r['timeout'],r['stderr']
    return r


def main():
    OUT.mkdir(exist_ok=False)
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    os.environ.update(ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    manifests={mode:b.load(HERE/(mode+'.manifest.json')) for mode in ['release','counts','san']}
    parent=b.load(PARENT/'TRANSITION_EDGE_STRONG.release.manifest.json')
    outputs={};realms={}
    for label,m in [('C',parent),*manifests.items()]:
        assert b.sha(m['elf'])==m['elf_sha256']
        r=capture(label+'.safety',[m['elf'],HERE/'safety.js']);assert not r['stderr']
        assert r['stdout'].strip()=='B3_SAFETY_PASS 194';outputs[label]=r['stdout']
        w=Path(m['elf']).parent;core=w/('.obj/asan/ubsan' if label=='san' else '.obj')
        flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if label=='san' else []
        target=OUT/(label+'.realms')
        command=['gcc','-O2','-g',*flags,'-I'+str(w),HERE/'realms.c',*[core/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target]
        capture(label+'.realms.build',command)
        r=capture(label+'.realms',[target]);assert not r['stderr'] and r['stdout'].strip()=='REALMS_PASS 96';realms[label]=r['stdout']
    # A fresh process proves a different property name uses the exact same path.
    gate="function f(re,s){return re.ping(s);}RegExp.prototype.ping=function(s){return s;};var re=/a/;__b3_begin();for(var i=0;i<32;i++)if(f(re,i)!==i)throw Error(i);__b3_end();\n"
    b.save('arbitrary_name.js',gate)
    r=capture('counts.arbitrary_name',[manifests['counts']['elf'],OUT/'arbitrary_name.js'])
    prefix='B3_COUNTS:';assert r['stderr'].startswith(prefix)
    c=json.loads(r['stderr'][len(prefix):]);assert c['regexp_named_queries']==32 and c['new_hits']==31 and c['fallbacks']==1 and c['exec_queries']==0,c
    b.save('arbitrary_name_counts.json',c)
    # Exercise invalidation cases while instrumented; no extra JS getter read.
    text=(HERE/'safety.js').read_text().replace("'use strict';","'use strict';\n__b3_begin();",1)+'\n__b3_end();\n'
    b.save('instrumented_safety.js',text)
    r=capture('counts.invalidation',[manifests['counts']['elf'],OUT/'instrumented_safety.js'])
    assert r['stdout'].strip()=='B3_SAFETY_PASS 194'
    c=json.loads(r['stderr'][len(prefix):]);assert c['new_hits']>0 and c['fallbacks']>0
    b.save('invalidation_counts.json',c)
    gate=dict(status='PASS',safety_assertions=194,all_outputs_equal=len(set(outputs.values()))==1,
        two_realm_calls_per_build=96,realms_outputs_equal=len(set(realms.values()))==1,
        builds=['C','release','counts','san'],counter_probe='16 exec reads: 14 hits / 2 fallbacks',
        arbitrary_name='32 ping reads: 31 hits / 1 fallback',invalidation_fast_hits=c['new_hits'],
        invalidation_fallbacks=c['fallbacks'],bytecode_representation_changed=False,
        qjsc_roundtrip_not_added=True,sanitizer_leak_detection=False,
        frozen_files={str(p):b.sha(p) for p in [HERE/'safety.js',HERE/'realms.c',Path(__file__)]})
    b.save('gate.json',gate)
    print('QUALIFICATION_PASS',json.dumps(gate),flush=True)


if __name__=='__main__':main()

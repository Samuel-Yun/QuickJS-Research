"""Semantic/native interrupt and serialization checks; separate from timing."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]


def capture(name,command,env=None):
    result=subprocess.run(list(map(str,command)),capture_output=True,text=True,env=env,timeout=120)
    row=dict(command=list(map(str,command)),returncode=result.returncode,stdout=result.stdout,stderr=result.stderr)
    path=HERE/'qualification'/name
    path.parent.mkdir(parents=True,exist_ok=True)
    assert not path.exists(),name
    path.write_text(json.dumps(row,indent=2)+'\n')
    assert result.returncode==0,row
    return row


def main():
    parser=argparse.ArgumentParser();parser.add_argument('label');parser.add_argument('--kind',default='release');args=parser.parse_args()
    name=args.label+'.'+args.kind
    m=json.loads((HERE/(name+'.manifest.json')).read_text());w=Path(m['elf']).parent
    env=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    if args.kind=='san':env.update(ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    r=capture(name+'.safety.json',[m['elf'],HERE/'safety.js'],env)
    assert r['stdout'].strip()=='EXECUTION_SAFETY_PASS 116' and not r['stderr']
    r=capture(name+'.parent_targeted.json',[m['elf'],'--std',ROOT/'ports/eval_cold/targeted.js'],env)
    assert not r['stderr']
    extra={'FIELD_RMW_UPDATE':'update_safety.js','INT_LOOP_BITS':'bits_safety.js','TRANSITION_EDGE':'edge_safety.js','TRANSITION_EDGE_STRONG':'edge_safety.js'}.get(args.label)
    if extra:
        r=capture(name+'.extra_safety.json',[m['elf'],HERE/extra],env);assert not r['stderr'] and 'SAFETY_PASS' in r['stdout']
    core=w/('.obj/asan/ubsan' if args.kind=='san' else '.obj')
    objects=[core/(f+'.o') for f in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if args.kind=='san' else []
    outputs={}
    for test in ['interrupt','serialization']+(['edge_gc'] if args.label.startswith('TRANSITION_EDGE') else []):
        binary=w/test
        cfile='bits_interrupt.c' if test=='interrupt' and args.label=='INT_LOOP_BITS' else test+'.c'
        capture(name+'.'+test+'.build.json',['gcc','-O2','-g',*flags,'-I'+str(w),HERE/cfile,*objects,'-lm','-lpthread','-ldl','-o',binary],env)
        r=capture(name+'.'+test+'.json',[binary],env);outputs[test]=r['stdout']
        assert not r['stderr']
        if test=='interrupt':
            r=capture(name+'.interrupt_abort.json',[binary,'abort'],env);outputs['interrupt_abort']=r['stdout'];assert not r['stderr']
    if args.kind=='diag':
        script=HERE/'qualification'/(name+'.gate.js')
        if args.label=='FIELD_RMW_UPDATE':
            body="function f(o){o.x++;}var o={x:0};f(o);__ex_begin();for(var i=0;i<32;i++)f(o);__ex_end();if(o.x!==33)throw Error(o.x);"
            key='rmw_hits';expected=32
        elif args.label.startswith('FIELD_RMW'):
            body="function f(o){o.x=o.x+1;}var o={x:0};f(o);__ex_begin();for(var i=0;i<32;i++)f(o);__ex_end();if(o.x!==33)throw Error(o.x);"
            key='rmw_hits';expected=32
        elif args.label=='INT_LOOP_BITS':
            body="function f(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}__ex_begin();var result=f(255);__ex_end();if(result!==8)throw Error(result);"
            key='loop_iters';expected=8
        elif args.label.startswith('TRANSITION_EDGE'):
            body="var keep=[];__ex_begin();for(var i=0;i<100;i++){var o={};o.a=1;o.b=2;keep.push(o);}__ex_end();if(keep.length!==100)throw Error('bad');"
            key='edge_hits';expected=None
        else:
            body="function f(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}__ex_begin();var result=f(1000);__ex_end();if(result!==499500)throw Error(result);"
            key='loop_iters';expected=1000
        script.write_text(body+'\n')
        r=capture(name+'.counter_gate.json',[m['elf'],script],env)
        prefix='EXECUTION_COUNTS:';assert r['stderr'].startswith(prefix)
        counts=json.loads(r['stderr'][len(prefix):]);assert (counts[key]==expected if expected is not None else counts[key]>0),counts
        outputs['counter_gate']=counts
    # Compare interrupt counts with original interpreter on identical C harness.
    baseline=ROOT/'experiments/native_octane_20261108/attempt11/work/EVAL_COLD'
    if args.kind=='release':
        executable=w/'interrupt_parent'
        objects=[baseline/'.obj'/(f+'.o') for f in ['quickjs','dtoa','libregexp','libunicode','cutils']]
        cfile='bits_interrupt.c' if args.label=='INT_LOOP_BITS' else 'interrupt.c'
        capture(name+'.parent_interrupt.build.json',['gcc','-O2','-g','-I'+str(baseline),HERE/cfile,*objects,'-lm','-lpthread','-ldl','-o',executable])
        for suffix,extra in [('interrupt',[]),('interrupt_abort',['abort'])]:
            r=capture(name+'.parent_'+suffix+'.json',[executable,*extra]);assert r['stdout']==outputs[suffix],(outputs,r)
    row=dict(status='PASS',label=args.label,kind=args.kind,outputs=outputs,
             elf_sha256=hashlib.sha256(Path(m['elf']).read_bytes()).hexdigest())
    (HERE/'qualification'/(name+'.gate.json')).write_text(json.dumps(row,indent=2)+'\n')
    print('QUALIFICATION_PASS',name,outputs,flush=True)


if __name__=='__main__':main()

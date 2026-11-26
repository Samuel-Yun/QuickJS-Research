"""Keep the first learned positive target; leave same-target paths unchanged."""
import argparse
import difflib
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PREV=HERE.parent/'attempt01'
spec=importlib.util.spec_from_file_location('previous_build',PREV/'build.py')
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
sha,save,once=previous.sha,previous.save,previous.once
LABELS=['NORMAL','BYPASS','KEEP_PLAN']

def keep_plan(q,counts=False):
    a='                int fast=four_ctor_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);'
    guard='''                int different=s->plan && s->plan->final &&
                    JS_VALUE_GET_TAG(s->plan->callee)==JS_TAG_OBJECT &&
                    (JS_VALUE_GET_TAG(call_argv[-2])!=JS_TAG_OBJECT ||
                     JS_VALUE_GET_OBJ(s->plan->callee)!=JS_VALUE_GET_OBJ(call_argv[-2]));
'''
    if counts:guard+='                if(mc_active && different){mc_skips++;mc_phase_skips[mc_phase]++;}\n'
    q=once(q,a,guard+a.replace('int fast=four_ctor_try','int fast=different?0:four_ctor_try'))
    a='int eligible=four_ctor_slow_eligible(ctx,s,call_argv[-2],call_argv[-1],call_argc);'
    q=once(q,a,a.replace('int eligible=','int eligible=different?0:'))
    if counts:
        a='''                    if(eligible && !JS_IsException(ret_val)){
                        mc_stage=2;four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                    }else if(!JS_IsException(ret_val)){
                        mc_stage=3;sparse_remember(ctx,s,call_argv[-2]);
                    }'''
    else:
        a='''                    if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                    else if(!JS_IsException(ret_val))sparse_remember(ctx,s,call_argv[-2]);'''
    q=once(q,a,'                    if(!different){\n'+''.join('    '+line+'\n' for line in a.splitlines())+'                    }')
    return q

def probes():
    d=(PREV/'probe.inc').read_text()
    d=once(d,'static int mc_active,mc_stage;',
        'static uint64_t mc_calls,mc_skips,mc_phase_calls[2],mc_phase_skips[2],mc_phase_normal[2],mc_phase_four[2][MC_COUNT];\nstatic void *mc_first_target;\nstatic int mc_phase;\nstatic int mc_active,mc_stage;')
    d=once(d,'#define FOUR_COUNT(s,k) do{if(mc_active)mc_four[MC_##k]++;}while(0)',
        '#define FOUR_COUNT(s,k) do{if(mc_active){mc_four[MC_##k]++;mc_phase_four[mc_phase][MC_##k]++;}}while(0)')
    a='    mc_array("four",mc_four,MC_COUNT);'
    d=once(d,a,r'''    fprintf(stderr,",\"total_calls\":%llu,\"identity_bypasses\":%llu",(unsigned long long)mc_calls,(unsigned long long)mc_skips);
    mc_array("phase_calls",mc_phase_calls,2);mc_array("phase_skips",mc_phase_skips,2);
    mc_array("phase_normal",mc_phase_normal,2);mc_array("phase_C_four",mc_phase_four[0],MC_COUNT);
    mc_array("phase_D_four",mc_phase_four[1],MC_COUNT);
'''+a)
    s=(PREV/'probe_site.inc').read_text()
    s=once(s,'FourSite*s)','FourSite*s,JSValueConst callee)')
    s=once(s,'    mc_stage=0;','''    mc_stage=0;
    if(mc_active){
        assert(JS_VALUE_GET_TAG(callee)==JS_TAG_OBJECT);
        if(!mc_first_target)mc_first_target=JS_VALUE_GET_OBJ(callee);
        mc_phase=mc_first_target!=JS_VALUE_GET_OBJ(callee);
        mc_calls++;mc_phase_calls[mc_phase]++;
    }''')
    return d.encode(),s.encode()

def source(label,mode):
    original,_,archive=previous.source('NORMAL')
    if mode=='release':
        _,d,_=previous.source('BYPASS' if label=='BYPASS' else 'NORMAL')
        if label=='KEEP_PLAN':d['quickjs.c']=keep_plan(d['quickjs.c'].decode()).encode()
    else:
        if label=='BYPASS':
            _,d,_=previous.source('BYPASS')
            d['four_diag.inc']=b'#include "probe.inc"\n'
            q=d['quickjs.c'].decode()
            q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "probe_site.inc"')
            a='                ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);'
            q=once(q,a,'''                mc_enter(ctx,b,s,call_argv[-2]);
                if(mc_active){mc_normal++;mc_phase_normal[mc_phase]++;}
'''+a)
            a='                sp-=call_argc+2;*sp++=ret_val;'
            q=once(q,a,a+'\n                mc_active=0;')
        else:
            _,d,_=previous.source('COUNTS')
            q=d['quickjs.c'].decode()
            q=once(q,'mc_enter(ctx,b,s);','mc_enter(ctx,b,s,call_argv[-2]);')
            q=once(q,'mc_stage=4;if(mc_active)mc_normal++;',
                'mc_stage=4;if(mc_active){mc_normal++;mc_phase_normal[mc_phase]++;}')
            if label=='KEEP_PLAN':q=keep_plan(q,True)
        d['quickjs.c']=q.encode()
        d['probe.inc'],d['probe_site.inc']=probes()
    return original,d,archive

def main():
    parser=argparse.ArgumentParser();parser.add_argument('label',choices=LABELS);parser.add_argument('mode',choices=['release','counts']);a=parser.parse_args()
    original,d,archive=source(a.label,a.mode)
    name=a.label+'.'+a.mode
    if a.mode=='release' and a.label in ['NORMAL','BYPASS']:
        old=json.loads((PREV/(a.label+'.manifest.json')).read_text())
        assert old['sources']=={n:hashlib.sha256(v).hexdigest() for n,v in d.items()}
        if Path(old['elf']).is_file():
            assert sha(old['elf'])==old['elf_sha256']
            save(HERE/(name+'.manifest.json'),dict(old,reused_from=str(PREV),instrumented=False))
            print('REUSE_VERIFIED',name,flush=True);return
    w=HERE/'work'/name;w.mkdir(parents=True,exist_ok=False)
    for n,v in d.items():
        p=w/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(v)
    patch=''.join(''.join(difflib.unified_diff(original.get(n,b'').decode().splitlines(True),v.decode().splitlines(True),fromfile='a/'+n if n in original else '/dev/null',tofile='b/'+n)) for n,v in d.items() if v!=original.get(n))
    (HERE/(name+'.patch')).write_text(patch)
    command=['make','-j2','-o','repl.c','qjs']
    with (HERE/(name+'.build.log')).open('w') as log:
        subprocess.run(command,cwd=w,stdout=log,stderr=subprocess.STDOUT,check=True)
    save(HERE/(name+'.manifest.json'),dict(label=a.label,mode=a.mode,parent_archive_sha256=archive,
        sources={n:sha(w/n) for n in d},elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),command=command,instrumented=a.mode=='counts'))
    print('BUILD_PASS',name,flush=True)
if __name__=='__main__':main()

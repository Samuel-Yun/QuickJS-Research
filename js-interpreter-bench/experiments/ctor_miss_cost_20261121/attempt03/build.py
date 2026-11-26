"""Allow relearning on the second consecutive constructor-identity miss."""
import argparse
import difflib
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PREV=HERE.parent/'attempt02'
spec=importlib.util.spec_from_file_location('keep_build',PREV/'build.py')
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
sha,save,once=previous.sha,previous.save,previous.once
LABELS=['NORMAL','KEEP_PLAN','TWICE']

def twice(q,f,counts=False):
    a='    uint16_t argc;\n#ifdef FOUR_DIAG'
    assert f.count(a)==2
    f=f.replace(a,'    uint16_t argc;\n    uint8_t identity_misses; /* existing tail padding: offset 30, still 32 B */\n#ifdef FOUR_DIAG',1)
    a='struct FullPlan {'
    f=once(f,a,'_Static_assert(sizeof(FourSite)==32 && offsetof(FourSite,identity_misses)==30,"site layout unchanged");\n'+a)
    a='s->final=js_dup_shape(o->shape);s->recipe=r;'
    extra='if(slot->identity_misses){slot->identity_misses=0;'
    if counts:extra+='if(mc_active)mc_learning_reset_writes++;'
    extra+='}'
    f=once(f,a,a+'\n    '+extra)
    a='''                if(!fast){
'''
    hitreset='if(s->identity_misses){s->identity_misses=0;'
    samereset='if(s->identity_misses){s->identity_misses=0;'
    increment='if(s->identity_misses<2){s->identity_misses++;'
    if counts:
        hitreset+='if(mc_active)mc_hit_reset_writes++;'
        samereset+='if(mc_active)mc_other_reset_writes++;'
        increment+='if(mc_active)mc_increment_writes++;'
    hitreset+='}';samereset+='}';increment+='}'
    b='''                if(fast){
                    '''+hitreset+'''
                }else{
                    int skip_learning=0;
                    if(s->plan && s->plan->final && JS_VALUE_GET_TAG(s->plan->callee)==JS_TAG_OBJECT &&
                       (JS_VALUE_GET_TAG(call_argv[-2])!=JS_TAG_OBJECT ||
                        JS_VALUE_GET_OBJ(s->plan->callee)!=JS_VALUE_GET_OBJ(call_argv[-2]))){
                        '''+increment+'''
                        skip_learning=s->identity_misses<2;
'''
    if counts:
        b+='''                        if(mc_active){
                            if(skip_learning){mc_skips++;mc_phase_skips[mc_phase]++;MC_TRACE(8);}
                            else {mc_threshold_allows++;MC_TRACE(16);}
                        }
'''
    b+='''                    }else '''+samereset+'\n'
    q=once(q,a,b)
    a='int eligible=four_ctor_slow_eligible(ctx,s,call_argv[-2],call_argv[-1],call_argc);'
    q=once(q,a,a.replace('int eligible=','int eligible=skip_learning?0:'))
    if counts:
        a='''                    if(eligible && !JS_IsException(ret_val)){
                        mc_stage=2;four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                    }else if(!JS_IsException(ret_val)){
                        mc_stage=3;sparse_remember(ctx,s,call_argv[-2]);
                    }'''
    else:
        a='''                    if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                    else if(!JS_IsException(ret_val))sparse_remember(ctx,s,call_argv[-2]);'''
    q=once(q,a,'                    if(!skip_learning){\n'+''.join('    '+s+'\n' for s in a.splitlines())+'                    }')
    return q,f

def trace_probes(d):
    p=d['probe.inc'].decode()
    a='static int mc_active,mc_stage;'
    p=once(p,a,'''static uint64_t mc_first_hit[2],mc_first_update[2];
static uint64_t mc_hit_reset_writes,mc_other_reset_writes,mc_learning_reset_writes,mc_increment_writes,mc_threshold_allows;
static uint64_t mc_trace_flags[2][8],mc_trace_before[2][8],mc_trace_after[2][8];
#define MC_TRACE(flag) do{if(mc_active && mc_phase_calls[mc_phase]<=8)mc_trace_flags[mc_phase][mc_phase_calls[mc_phase]-1]|=(flag);}while(0)
'''+a)
    a='#define FOUR_COUNT(s,k) do{if(mc_active){mc_four[MC_##k]++;mc_phase_four[mc_phase][MC_##k]++;}}while(0)'
    b='''#define FOUR_COUNT(s,k) do{if(mc_active){ \
    mc_four[MC_##k]++;mc_phase_four[mc_phase][MC_##k]++; \
    if(MC_##k==MC_h){if(!mc_first_hit[mc_phase])mc_first_hit[mc_phase]=mc_phase_calls[mc_phase];MC_TRACE(1);} \
    if(MC_##k==MC_fill){if(!mc_first_update[mc_phase])mc_first_update[mc_phase]=mc_phase_calls[mc_phase];MC_TRACE(4);} \
}}while(0)'''
    p=once(p,a,b)
    a='    mc_array("four",mc_four,MC_COUNT);'
    extra=r'''    mc_array("first_hit",mc_first_hit,2);mc_array("first_update",mc_first_update,2);
    mc_array("trace_C_flags",mc_trace_flags[0],8);mc_array("trace_D_flags",mc_trace_flags[1],8);
    mc_array("trace_C_before",mc_trace_before[0],8);mc_array("trace_D_before",mc_trace_before[1],8);
    mc_array("trace_C_after",mc_trace_after[0],8);mc_array("trace_D_after",mc_trace_after[1],8);
    fprintf(stderr,",\"hit_reset_writes\":%llu,\"other_reset_writes\":%llu,\"learning_reset_writes\":%llu,\"increment_writes\":%llu,\"threshold_allows\":%llu",
        (unsigned long long)mc_hit_reset_writes,(unsigned long long)mc_other_reset_writes,
        (unsigned long long)mc_learning_reset_writes,(unsigned long long)mc_increment_writes,(unsigned long long)mc_threshold_allows);
'''
    p=once(p,a,extra+a)
    s=d['probe_site.inc'].decode()
    a='        mc_calls++;mc_phase_calls[mc_phase]++;'
    s=once(s,a,a+'''
#ifdef TWICE_POLICY
        if(mc_phase_calls[mc_phase]<=8)mc_trace_before[mc_phase][mc_phase_calls[mc_phase]-1]=s->identity_misses;
#endif''')
    s+='''
static void mc_finish(FourSite*s)
{
#ifdef TWICE_POLICY
    if(mc_active && mc_phase_calls[mc_phase]<=8)mc_trace_after[mc_phase][mc_phase_calls[mc_phase]-1]=s->identity_misses;
#endif
}
'''
    d['probe.inc']=p.encode();d['probe_site.inc']=s.encode()
    return d

def source(label,mode):
    original,d,archive=previous.source('NORMAL' if label=='TWICE' else label,mode)
    if mode=='counts':
        d=trace_probes(d)
        q=d['quickjs.c'].decode()
        q=once(q,'mc_stage=4;if(mc_active){mc_normal++;mc_phase_normal[mc_phase]++;}',
            'mc_stage=4;if(mc_active){mc_normal++;mc_phase_normal[mc_phase]++;MC_TRACE(2);}')
        q=once(q,'                mc_active=0;','                mc_finish(s);mc_active=0;')
        if label=='KEEP_PLAN':
            q=once(q,'mc_skips++;mc_phase_skips[mc_phase]++;','mc_skips++;mc_phase_skips[mc_phase]++;MC_TRACE(8);')
        d['quickjs.c']=q.encode()
    if label=='TWICE':
        q,f=twice(d['quickjs.c'].decode(),d['four_runtime.inc'].decode(),mode=='counts')
        if mode=='counts':q='#define TWICE_POLICY 1\n'+q
        d['quickjs.c']=q.encode();d['four_runtime.inc']=f.encode()
    return original,d,archive

def main():
    parser=argparse.ArgumentParser();parser.add_argument('label',choices=LABELS);parser.add_argument('mode',choices=['release','counts']);a=parser.parse_args()
    original,d,archive=source(a.label,a.mode);name=a.label+'.'+a.mode
    if a.mode=='release' and a.label!='TWICE':
        old=json.loads((PREV/(name+'.manifest.json')).read_text())
        assert old['sources']=={n:hashlib.sha256(v).hexdigest() for n,v in d.items()}
        if Path(old['elf']).is_file():
            assert sha(old['elf'])==old['elf_sha256']
            save(HERE/(name+'.manifest.json'),dict(old,reused_from=str(PREV)))
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

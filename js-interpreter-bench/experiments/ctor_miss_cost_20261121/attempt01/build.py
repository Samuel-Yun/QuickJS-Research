"""Frozen SPARSE, one-handler bypass, and independent normal-path counters."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import tarfile

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PARENT=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):
    assert s.count(a)==1,repr(a)
    return s.replace(a,b,1)
def save(p,v):Path(p).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
def source(label):
    m=json.loads((PARENT/'release.manifest.json').read_text())
    archive=PARENT/'source.tar.gz'
    assert sha(archive)==(PARENT/'source.sha256').read_text().split()[0]
    with tarfile.open(archive) as t:
        original={x.name.split('/',1)[1]:t.extractfile(x).read() for x in t.getmembers() if x.isfile()}
    assert set(original)==set(m['sources'])
    assert all(hashlib.sha256(original[n]).hexdigest()==h for n,h in m['sources'].items())
    d=original.copy()
    if label=='BYPASS':
        q=d['quickjs.c'].decode()
        begin=q.index('        CASE(OP_four_ctor):')
        end=q.index('        CASE(OP_call_constructor):',begin)
        replacement='''        CASE(OP_four_ctor):
            {
                FourSite*s=&b->four_sites[get_u16(pc)];call_argc=s->argc;pc+=2;
                call_argv=sp-call_argc;sf->cur_pc=pc;
                ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);
                if(unlikely(JS_IsException(ret_val)))goto exception;
                for(i=-2;i<call_argc;i++)JS_FreeValue(ctx,call_argv[i]);
                sp-=call_argc+2;*sp++=ret_val;
            }
            BREAK;
'''
        d['quickjs.c']=(q[:begin]+replacement+q[end:]).encode()
    elif label=='COUNTS':
        d['probe.inc']=(HERE/'probe.inc').read_bytes()
        d['probe_site.inc']=(HERE/'probe_site.inc').read_bytes()
        d['four_diag.inc']=b'#include "probe.inc"\n'
        q=d['quickjs.c'].decode()
        q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "probe_site.inc"')
        q=once(q,'                int fast=four_ctor_try(ctx,s,',
            '                mc_enter(ctx,b,s);\n                int fast=four_ctor_try(ctx,s,')
        q=once(q,'                    int eligible=four_ctor_slow_eligible(ctx,s,',
            '                    mc_stage=1;\n                    int eligible=four_ctor_slow_eligible(ctx,s,')
        a='                    ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);'
        q=once(q,a,'                    mc_stage=4;if(mc_active)mc_normal++;\n'+a)
        a='                    if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);\n                    else if(!JS_IsException(ret_val))sparse_remember(ctx,s,call_argv[-2]);'
        b='''                    if(eligible && !JS_IsException(ret_val)){
                        mc_stage=2;four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                    }else if(!JS_IsException(ret_val)){
                        mc_stage=3;sparse_remember(ctx,s,call_argv[-2]);
                    }'''
        q=once(q,a,b)
        a='                sp-=call_argc+2;*sp++=ret_val;'
        q=once(q,a,a+'\n                mc_active=0;')
        d['quickjs.c']=q.encode()
        f=d['four_runtime.inc'].decode()
        for signature,key in [('static int plan_base','base'),('static JSObject*plan_proto','proto'),('static int plan_chain','chain')]:
            start=f.index(signature);pos=f.index('{\n',start)+2
            f=f[:pos]+f'    MC_STAGE({key});\n'+f[pos:]
        a='            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);'
        f=once(f,a,'            MC_STAGE(descriptors);\n'+a)
        f=f.replace('find_hashed_shape_proto(ctx->rt,proto)','mc_find_empty(ctx->rt,proto)')
        a='    JSValue old=s->callee;JSShape*oldinitial=s->initial,*oldfinal=s->final;'
        f=once(f,a,'''    if(mc_active){mc_initial_unchanged+=s->initial==initial;mc_final_unchanged+=s->final==o->shape;}
'''+a)
        d['four_runtime.inc']=f.encode()
        s=d['sparse_runtime.inc'].decode()
        a='    if(!s->plan){FOUR_COUNT(s,q);FOUR_COUNT(s,guard);return 0;}'
        s=once(s,a,'''    if(mc_active){
        if(!s->plan)mc_no_plan++;
        else if(JS_VALUE_GET_TAG(c)==JS_TAG_OBJECT && JS_VALUE_GET_TAG(s->plan->callee)==JS_TAG_OBJECT &&
                JS_VALUE_GET_OBJ(c)!=JS_VALUE_GET_OBJ(s->plan->callee))mc_identity_mismatch++;
    }
'''+a)
        a='    if(sparse_same(s,c)){FOLLOW(2);return 0;}'
        s=once(s,a,'    if(mc_active)mc_negative_queries++;\n'+a)
        d['sparse_runtime.inc']=s.encode()
    else:assert label=='NORMAL'
    return original,d,sha(archive)
def main():
    p=argparse.ArgumentParser();p.add_argument('label',choices=['NORMAL','BYPASS','COUNTS']);a=p.parse_args()
    original,d,digest=source(a.label)
    w=HERE/'work'/a.label;w.mkdir(parents=True,exist_ok=False)
    for name,data in d.items():
        target=w/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
    patch=''.join(''.join(difflib.unified_diff(original.get(n,b'').decode().splitlines(True),data.decode().splitlines(True),fromfile='a/'+n if n in original else '/dev/null',tofile='b/'+n)) for n,data in d.items() if data!=original.get(n))
    (HERE/(a.label+'.patch')).write_text(patch)
    command=['make','-j2','-o','repl.c','qjs']
    with (HERE/(a.label+'.build.log')).open('w') as log:
        subprocess.run(command,cwd=w,stdout=log,stderr=subprocess.STDOUT,check=True)
    save(HERE/(a.label+'.manifest.json'),dict(label=a.label,parent_archive_sha256=digest,
        sources={n:sha(w/n) for n in d},elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),
        command=command,instrumented=a.label=='COUNTS'))
    print('BUILD_PASS',a.label,flush=True)
if __name__=='__main__':main()

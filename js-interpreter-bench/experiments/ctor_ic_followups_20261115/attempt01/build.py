"""Every new round is independently reconstructed from the measured R3 archive."""
import argparse,difflib,hashlib,json,subprocess,tarfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
R3=ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan'
ROUNDS=['01_forward_ctor','02_proto_ticket','03_sparse_ctor','04_construct_consume']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):assert s.count(a)==1,repr(a);return s.replace(a,b,1)
def parent():
 m=json.loads((R3/'release.manifest.json').read_text());a=R3/'source.tar.gz'
 assert sha(a)==(R3/'source.sha256').read_text().split()[0]
 with tarfile.open(a) as t:d={x.name.removeprefix('quickjs-03_constructor_plan/'):t.extractfile(x).read().decode() for x in t.getmembers() if x.isfile()}
 assert set(d)==set(m['sources'])
 for n,h in m['sources'].items():assert hashlib.sha256(d[n].encode()).hexdigest()==h
 return d,sha(a)
def diagnostics(d):
 d=d.copy();s=d['four_diag.inc'];s=once(s,'static int four_active;','static int four_active;\nstatic uint64_t follow_stats[24];\n#define FOLLOW(i) do{if(four_active)follow_stats[i]++;}while(0)\n#define FOLLOW_ADD(i,n) do{if(four_active)follow_stats[i]+=(n);}while(0)')
 s=once(s,'}fprintf(stderr,"]}\\n");','}fprintf(stderr,"],\\\"follow\\\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)follow_stats[i]);fprintf(stderr,"]}\\n");')
 s=once(s,'#define FOUR_COUNT(s,k) ((void)0)','#define FOLLOW(i) ((void)0)\n#define FOLLOW_ADD(i,n) ((void)0)\n#define FOUR_COUNT(s,k) ((void)0)')
 d['four_diag.inc']=s;return d
def source(label,mode):
 original,digest=parent();d=diagnostics(original);q=d['quickjs.c']
 if mode in ['probe','counts']:q='#define FOUR_DIAG 1\n'+('#define FOLLOW_PROBE 1\n' if mode=='probe' else '')+q
 if label==ROUNDS[0]:
  q=once(q,'struct JSRuntime {','typedef struct FwdCall FwdCall;\nstruct JSRuntime {')
  q=once(q,'    JSShape **shape_hash;\n    void *user_opaque;','    JSShape **shape_hash;\n    void *user_opaque;\n    FwdCall *forward_call;')
  q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct FwdSite FwdSite;')
  q=once(q,'    uint32_t four_count;','    uint32_t four_count;\n    FwdSite *forward_site;')
  d['follow_runtime.inc']=(HERE/'forward_runtime.inc').read_text();d['follow_prepare.inc']=(HERE/'forward_prepare.inc').read_text()
  q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "follow_runtime.inc"')
  q=once(q,'#include "four_prepare.inc"','#include "four_prepare.inc"\n#include "follow_prepare.inc"')
  p=d['read_ic_prepare.inc'];p=once(p,'    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b) + follow_extra_size(b);')
  p=once(p,'    four_prepare(ctx,b);','    four_prepare(ctx,b);\n    follow_prepare(ctx,b);');d['read_ic_prepare.inc']=p
  a='            if (b->realm)\n                mark_func(rt, &b->realm->header);'
  q=once(q,a,'            if(b->forward_site){JS_MarkValue(rt,b->forward_site->target,mark_func);JS_MarkValue(rt,b->forward_site->apply,mark_func);}\n'+a)
  q=once(q,'    rdi_free(rt, b);','    if(b->forward_site){JS_FreeValueRT(rt,b->forward_site->target);JS_FreeValueRT(rt,b->forward_site->apply);}\n    rdi_free(rt, b);')
  a='        CASE(OP_special_object):\n            {\n                int arg = *pc++;'
  q=once(q,a,'''        CASE(OP_forward_ctor):
            {
                FwdSite*s=b->forward_site;JSValue target,apply;
                if(fwd_resolve(ctx,s,var_buf[0],flags&JS_CALL_FLAG_CONSTRUCTOR,&target,&apply)){
                    FwdCall call={.target=target,.receiver=var_buf[0],.apply=apply,.argc=argc,.argv=argv,.previous=rt->forward_call};
                    JSValue args[2]={var_buf[0],JS_UNDEFINED};
                    pc=b->byte_code_buf+s->call_end;sf->cur_pc=pc;rt->forward_call=&call;
                    JSValue result=JS_CallInternal(ctx,apply,target,JS_UNDEFINED,2,args,0);
                    rt->forward_call=call.previous;JS_FreeValue(ctx,target);JS_FreeValue(ctx,apply);
                    if(JS_IsException(result))goto exception;
                    JS_FreeValue(ctx,result);ret_val=JS_UNDEFINED;goto done;
                }
                goto follow_original_arguments;
            }
        CASE(OP_special_object):
            {
            follow_original_arguments:
                int arg = *pc++;''')
  a='    this_arg = argv[0];\n    array_arg = argv[1];'
  q=once(q,a,'''    FwdCall*fwd=ctx->rt->forward_call;
    if(fwd && !fwd->consumed && argc==2 && JS_IsUndefined(argv[1]) &&
       JS_VALUE_GET_TAG(this_val)==JS_TAG_OBJECT && JS_VALUE_GET_OBJ(this_val)==JS_VALUE_GET_OBJ(fwd->target) &&
       JS_VALUE_GET_TAG(argv[0])==JS_TAG_OBJECT && JS_VALUE_GET_OBJ(argv[0])==JS_VALUE_GET_OBJ(fwd->receiver) &&
       JS_VALUE_GET_TAG(ctx->rt->current_stack_frame->cur_func)==JS_TAG_OBJECT &&
       JS_VALUE_GET_OBJ(ctx->rt->current_stack_frame->cur_func)==JS_VALUE_GET_OBJ(fwd->apply)){
        fwd->consumed=1;FOLLOW(4);FOLLOW(5);FOLLOW_ADD(6,fwd->argc);FOLLOW_ADD(7,2*(uint64_t)fwd->argc);
        return JS_Call(ctx,this_val,argv[0],fwd->argc,(JSValueConst*)fwd->argv);
    }
'''+a)
  a='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
  q=once(q,a,'        if(op==OP_forward_ctor){op=OP_special_object;bc_buf[pos]=op;}\n'+a)
  a='        if (op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||'
  q=once(q,a,a.replace('if (','if (op == OP_forward_ctor || ',1))
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(forward_ctor,2,0,1,u8)\n#undef DEF\n#undef def\n#endif  /* DEF */')
 elif label==ROUNDS[1]:
  import ticket
  q=ticket.apply(d,q,once)
 elif label==ROUNDS[2]:
  import sparse
  q=sparse.apply(d,q,once,mode)
 elif label==ROUNDS[3]:
  import consume
  q=consume.apply(d,q,once)
 else:raise NotImplementedError(label)
 d['quickjs.c']=q
 if mode in ['probe','counts']:
  c=d['quickjs-libc.c'];a='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
  c=once(c,a,'''extern void four_begin(void);extern void four_end(void);
static JSValue js_four_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_begin();return JS_UNDEFINED;}
static JSValue js_four_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_end();return JS_UNDEFINED;}
'''+a)
  a='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
  d['quickjs-libc.c']=once(c,a,a+'''\n    JS_SetPropertyStr(ctx,global_obj,"__four_begin",JS_NewCFunction(ctx,js_four_begin,"__four_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__four_end",JS_NewCFunction(ctx,js_four_end,"__four_end",0));''')
 return original,d,digest
def main():
 p=argparse.ArgumentParser();p.add_argument('round',choices=ROUNDS);p.add_argument('mode',choices=['probe','counts','release','san']);a=p.parse_args()
 original,d,digest=source(a.round,a.mode);out=HERE/a.round;w=out/'work'/a.mode;w.mkdir(parents=True,exist_ok=False)
 for n,s in d.items():f=w/n;f.parent.mkdir(exist_ok=True,parents=True);f.write_text(s)
 patch=''.join(line for n,s in d.items() if original.get(n)!=s for line in difflib.unified_diff(original.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (out/(a.mode+'.patch')).write_text(patch)
 cmd=['make','-j2','-o','repl.c',*(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if a.mode=='san' else []),'qjs','qjsc']
 with (out/(a.mode+'.build.log')).open('w') as log:r=subprocess.run(cmd,cwd=w,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 assert r.returncode==0,'see '+str(out/(a.mode+'.build.log'))
 m=dict(round=a.round,mode=a.mode,R3_archive_sha256=digest,sources={n:sha(w/n) for n in d},elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),command=cmd)
 (out/(a.mode+'.manifest.json')).write_text(json.dumps(m,indent=2)+'\n');print('BUILD_PASS',a.round,a.mode,flush=True)
if __name__=='__main__':main()

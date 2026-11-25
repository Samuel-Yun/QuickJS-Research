import argparse,sys
from common import *
NUMDIR=HERE/'01_forward_numeric'

def old_forward(d):
 q=d['quickjs.c'];d['follow_runtime.inc']=(OLD/'follow_runtime.inc').read_text();d['follow_prepare.inc']=(OLD/'follow_prepare.inc').read_text()
 q=once(q,'struct JSRuntime {','typedef struct FwdCall FwdCall;\nstruct JSRuntime {')
 q=once(q,'    void *user_opaque;\n    ExEdge','    void *user_opaque;\n    FwdCall *forward_call;\n    ExEdge')
 q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct FwdSite FwdSite;')
 q=once(q,'    uint32_t four_count;','    uint32_t four_count;\n    FwdSite *forward_site;')
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "follow_runtime.inc"')
 q=once(q,'            if (b->realm)\n                mark_func(rt, &b->realm->header);','            if(b->forward_site){JS_MarkValue(rt,b->forward_site->target,mark_func);JS_MarkValue(rt,b->forward_site->apply,mark_func);}\n            if (b->realm)\n                mark_func(rt, &b->realm->header);')
 # Reuse the previous implementation as an increment over SPARSE, not its R3.
 old=(OLD/'quickjs.c').read_text();start=old.index('        CASE(OP_forward_ctor):');end=old.index('                int arg = *pc++;',start)
 anchor='        CASE(OP_special_object):\n            {\n'
 q=once(q,anchor,old[start:end])
 q=once(q,'#include "four_prepare.inc"','#include "four_prepare.inc"\n#include "follow_prepare.inc"')
 q=once(q,'    rdi_free(rt, b);','    if(b->forward_site){JS_FreeValueRT(rt,b->forward_site->target);JS_FreeValueRT(rt,b->forward_site->apply);}\n    rdi_free(rt, b);')
 anchor='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
 q=once(q,anchor,'        if(op==OP_forward_ctor){op=OP_special_object;bc_buf[pos]=op;}\n'+anchor)
 q=once(q,'if (op == OP_four_ctor || op == OP_get_field_rdi', 'if (op == OP_forward_ctor || op == OP_four_ctor || op == OP_get_field_rdi')
 a=old.index('    FwdCall*fwd=ctx->rt->forward_call;');z=old.index('    this_arg = argv[0];',a)
 q=once(q,'    this_arg = argv[0];',old[a:z]+'    this_arg = argv[0];')
 d['quickjs.c']=q;d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'DEF(four_ctor,3,0,0,u16)','DEF(four_ctor,3,0,0,u16)\nDEF(forward_ctor,2,0,1,u8)')
 d['read_ic_prepare.inc']=once(d['read_ic_prepare.inc'],'+ four_extra_size(b);','+ four_extra_size(b) + follow_extra_size(b);').replace('    four_prepare(ctx,b);','    four_prepare(ctx,b);\n    follow_prepare(ctx,b);')
 return d

def numeric(d,off=False):
 d['numeric_runtime.inc']=(NUMDIR/'numeric_runtime.inc').read_text()
 d['four_runtime.inc']=once(d['four_runtime.inc'],'struct FourSite {','typedef struct NumericPlan NumericPlan;\nstruct FourSite {\n    NumericPlan *numeric;')
 q=d['quickjs.c'];q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n'+('#define NUMERIC_ENTRY_OFF 1\n' if off else '')+'#include "numeric_runtime.inc"')
 marker='            for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_MarkValue(rt,ss->negative,mark_func);'
 q=once(q,marker,'            for(uint32_t fi=0;fi<b->four_count;fi++){NumericPlan*n=b->four_sites[fi].numeric;if(n){JS_MarkValue(rt,n->wrapper,mark_func);JS_MarkValue(rt,n->initializer,mark_func);JS_MarkValue(rt,n->apply,mark_func);if(n->final)mark_func(rt,&n->final->header);}}\n'+marker)
 marker='    for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_FreeValueRT(rt,ss->negative);'
 q=once(q,marker,'    for(uint32_t fi=0;fi<b->four_count;fi++)np_release(rt,b->four_sites[fi].numeric);\n'+marker)
 q=once(q,'int fast=four_ctor_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);','int fast=np_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);\n                if(!fast)fast=four_ctor_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);')
 q=once(q,'                    int eligible=four_ctor_slow_eligible', '                    NumericSeed seed={0};\n                    if(!s->numeric || JS_VALUE_GET_TAG(call_argv[-2])!=JS_TAG_OBJECT || JS_VALUE_GET_OBJ(call_argv[-2])!=JS_VALUE_GET_OBJ(s->numeric->wrapper))\n                        np_seed(ctx,s,call_argv[-2],call_argv[-1],call_argv,&seed);\n                    int eligible=four_ctor_slow_eligible')
 a='                    if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);'
 q=once(q,a,'                    if(!JS_IsException(ret_val))np_learn(ctx,s,call_argv[-2],ret_val,&seed);\n                    np_seed_free(ctx,&seed);\n'+a)
 d['quickjs.c']=q
 d['qjs.c']=once(d['qjs.c'],'#include "quickjs-libc.h"','#include "quickjs-libc.h"\nextern void numeric_entry_mode(int);')
 d['qjs.c']=once(d['qjs.c'],'    js_std_add_helpers(ctx, argc - optind, argv + optind);','    numeric_entry_mode(getenv("QJS_NUMERIC_ENTRY_OFF")!=NULL);\n    js_std_add_helpers(ctx, argc - optind, argv + optind);')
 return d

def numeric_diagnostics(d,label):
 if 'numeric_runtime.inc' not in d:
  d['numeric_runtime.inc']=(NUMDIR/'numeric_runtime.inc').read_text()
  d['quickjs.c']=once(d['quickjs.c'],'#include "four_runtime.inc"','#include "four_runtime.inc"\n#define NUMERIC_OBSERVE_ONLY 1\n'+('#define NP_OLD_FORWARD 1\n' if label=='OLD_FORWARD' else '')+'#include "numeric_runtime.inc"')
 # Actual interpreted frame/arguments/field write entries, not inferred commits.
 q=d['quickjs.c'];anchor='    b = p->u.func.function_bytecode;\n\n    if (unlikely(argc < b->arg_count'
 q=once(q,anchor,'    b = p->u.func.function_bytecode;\n    np_frame(b);\n\n    if (unlikely(argc < b->arg_count')
 q=once(q,'                case OP_SPECIAL_OBJECT_ARGUMENTS:\n','                case OP_SPECIAL_OBJECT_ARGUMENTS:\n                    np_arguments(b);\n')
 q=once(q,'                case OP_SPECIAL_OBJECT_MAPPED_ARGUMENTS:\n','                case OP_SPECIAL_OBJECT_MAPPED_ARGUMENTS:\n                    np_arguments(b);\n')
 q=once(q,'        CASE(OP_put_field):\n            {','        CASE(OP_put_field):\n            {\n                np_write(b);')
 start=q.index('static JSValue js_function_apply(JSContext *ctx, JSValueConst this_val,',q.index('static JSValue js_function_apply(JSContext *ctx, JSValueConst this_val,')+1)
 end=q.index('static JSValue js_function_call(',start);chunk=q[start:end]
 # Count native apply entry before the old forward shortcut, and actual list
 # materialization after that shortcut. Both are independent VM work counters.
 anchor='    if (check_function(ctx, this_val))\n        return JS_EXCEPTION;'
 chunk=once(chunk,anchor,anchor+'\n    np_apply(this_val,0);')
 chunk=once(chunk,'    tab = build_arg_list(ctx, &len, array_arg);','    np_apply(this_val,1);\n    tab = build_arg_list(ctx, &len, array_arg);')
 q=q[:start]+chunk+q[end:]
 d['quickjs.c']=q
 x=d['four_diag.inc'];x=once(x,'    unsigned pc;','    uint64_t np[32];\n    unsigned pc;');x=once(x,'void four_end(void)','static void np_report(void);\nvoid four_end(void)')
 x=once(x,'    four_active=0;uint64_t','    four_active=0;np_report();uint64_t')
 x=once(x,'\\"bytecode_hex\\":\\"%s\\"}', '\\"bytecode_hex\\":\\"%s\\",\\"numeric\\":[')
 x=once(x,'d->overflow,d->bytes);','d->overflow,d->bytes);\n        for(unsigned ni=0;ni<32;ni++)fprintf(stderr,"%s%"PRIu64,ni?",":"",d->np[ni]);fprintf(stderr,"]}");')
 d['four_diag.inc']=x
 return d

def main():
 ap=argparse.ArgumentParser();ap.add_argument('labels',nargs='*',default=['NUMERIC_PLAN']);ap.add_argument('--modes',nargs='+',default=['release']);a=ap.parse_args()
 for label in a.labels:
  for mode in a.modes:
   d=base()
   if label=='OLD_FORWARD':old_forward(d)
   elif label in ['NUMERIC_PLAN','NUMERIC_OFF']:numeric(d,label=='NUMERIC_OFF')
   elif label!='SPARSE':
    from extra_candidates import transform
    transform(d,label)
   folder=NUMDIR if label in ['SPARSE','OLD_FORWARD','NUMERIC_PLAN','NUMERIC_OFF'] else HERE/('02_compare_branch' if 'COMPARE' in label else '03_ctor_coalloc')
   if mode=='counts':
    if label in ['SPARSE','OLD_FORWARD','NUMERIC_PLAN','NUMERIC_OFF']:numeric_diagnostics(d,label)
    else:
     from extra_candidates import diagnostics
     diagnostics(d,label)
    instrument(d)
   else:patch(label,d,folder)
   build(label,d,mode,folder)
if __name__=='__main__':main()

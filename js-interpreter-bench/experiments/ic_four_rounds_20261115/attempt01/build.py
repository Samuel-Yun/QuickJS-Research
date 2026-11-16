"""Independent builds exclusively from frozen C. No benchmark transformations."""
import argparse,difflib,hashlib,json,subprocess,tarfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PARENT=ROOT/'experiments/execution_paths_20261114/attempt01/candidates'
ROUNDS=['01_group_load','02_call_recipe','03_constructor_plan','04_index_consume']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):assert s.count(a)==1,repr(a);return s.replace(a,b,1)
def parent():
 m=json.loads((PARENT/'manifest.json').read_text());a=PARENT/'TRANSITION_EDGE_STRONG-source.tar.gz';assert sha(a)==m['source_archive_sha256']
 with tarfile.open(a) as t:d={x.name.removeprefix('quickjs-transition-edge/'):t.extractfile(x).read().decode() for x in t.getmembers() if x.isfile()}
 assert set(d)==set(m['sources'])
 for n,h in m['sources'].items():assert hashlib.sha256(d[n].encode()).hexdigest()==h
 return d,m
def source(round,mode):
 original,m=parent();d=original.copy();q=d['quickjs.c']
 defines=('#define FOUR_DIAG 1\n' if mode in ['probe','probe_selected','counts'] else '')+('#define FOUR_PROBE 1\n' if mode.startswith('probe') else '')
 q=once(q,'typedef struct JSFunctionBytecode {','typedef struct FourSite FourSite;\ntypedef struct JSFunctionBytecode {')
 q=once(q,'    uint8_t read_ic_ready;','    uint8_t read_ic_ready;\n    FourSite *four_sites;\n    uint32_t four_count;')
 if round==ROUNDS[0]:
  d['four_runtime.inc']=(HERE/'group_runtime.inc').read_text();d['four_prepare.inc']=(HERE/'group_prepare.inc').read_text()
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n'+defines+'#include "four_diag.inc"\n#include "four_runtime.inc"')
  q=once(q,'            if (b->realm)\n                mark_func(rt, &b->realm->header);','            for(uint32_t fi=0;fi<b->four_count;fi++)\n                if(b->four_sites[fi].shape)mark_func(rt,&b->four_sites[fi].shape->header);\n            if (b->realm)\n                mark_func(rt, &b->realm->header);')
  q=once(q,'    rdi_free(rt, b);','    for(uint32_t fi=0;fi<b->four_count;fi++)js_free_shape_null(rt,b->four_sites[fi].shape);\n    rdi_free(rt, b);')
  q=once(q,'#include "read_ic_prepare.inc"','#include "four_prepare.inc"\n#include "read_ic_prepare.inc"')
  prep=d['read_ic_prepare.inc'];prep=once(prep,'    total = code_size + count * sizeof(ReadICSite);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);')
  prep=once(prep,'    assert(index == count);','    assert(index == count);\n    four_prepare(ctx,b);');d['read_ic_prepare.inc']=prep
  op=d['read_ic_opcodes.inc'];op=once(op,'#define GET_READ_IC(name, keep)', '#define GET_READ_IC(name, keep, group)')
  op=once(op,'ReadICSite *site = (ReadICSite *)(pc + delta);','ReadICSite *site = group ? ((FourSite*)(pc+delta))->one : (ReadICSite *)(pc + delta);')
  op=op.replace('GET_READ_IC(get_field_rdi, 0);','GET_READ_IC(get_field_rdi, 0, 0);').replace('GET_READ_IC(get_field2_rdi, 1);','GET_READ_IC(get_field2_rdi, 1, 0);')
  op=once(op,'#undef GET_READ_IC','''        CASE(OP_four_group):
            {
                FourSite *s=(FourSite*)(pc+get_u32(pc));JSValue a,c;
                if(four_group_try(ctx,s,sp[-1],&a,&c)){
                    JS_FreeValue(ctx,sp[-1]);sp[-1]=a;*sp++=c;
                    pc=b->byte_code_buf+s->end;BREAK;
                }
            }
            GET_READ_IC(four_group_fallback,0,1);
            BREAK;
#undef GET_READ_IC''');d['read_ic_opcodes.inc']=op
  q=once(q,'        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }','''        if(op==OP_four_group){
            FourSite *fs=(FourSite*)(b->byte_code_buf+pos+1+get_u32(bc_buf+pos+1));
            op=OP_get_field;bc_buf[pos]=op;put_u32(bc_buf+pos+1,fs->one->atom);
        }
        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }''')
  q=once(q,'        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {','        if (op == OP_four_group || op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {')
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(four_group,5,1,1,u32)\n#undef DEF\n#undef def\n#endif  /* DEF */')
 elif round==ROUNDS[1] and mode=='probe':
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text();d['four_probe.inc']=(HERE/'call_probe.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n'+defines+'#include "four_diag.inc"\n#include "four_probe.inc"')
  a='                ret_val = JS_CallInternal(ctx, call_argv[-1], JS_UNDEFINED,'
  assert q.count(a)==2
  q=q.replace(a,'                four_observe_call(ctx,b,pc-(opcode>=OP_call0 && opcode<=OP_call3?1:3),call_argv[-1],0);\n'+a,1)
  a='                ret_val = JS_CallInternal(ctx, call_argv[-1], call_argv[-2],'
  q=once(q,a,'                four_observe_call(ctx,b,pc-3,call_argv[-1],0);\n'+a)
  a='                ret_val = JS_CallConstructorInternal(ctx, call_argv[-2],'
  q=once(q,a,'                four_observe_call(ctx,b,pc-3,call_argv[-2],1);\n'+a)
 elif round==ROUNDS[1]:
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text();d['four_runtime.inc']=(HERE/'call_runtime.inc').read_text();d['four_prepare.inc']=(HERE/'call_prepare.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n'+defines+'#include "four_diag.inc"\n#include "four_runtime.inc"')
  q=once(q,'#include "read_ic_prepare.inc"','#include "four_prepare.inc"\n#include "read_ic_prepare.inc"')
  a='            if (b->realm)\n                mark_func(rt, &b->realm->header);'
  q=once(q,a,'            for(uint32_t fi=0;fi<b->four_count;fi++){JS_MarkValue(rt,b->four_sites[fi].callee,mark_func);if(b->four_sites[fi].shape)mark_func(rt,&b->four_sites[fi].shape->header);}\n'+a)
  q=once(q,'    rdi_free(rt, b);','    for(uint32_t fi=0;fi<b->four_count;fi++){JS_FreeValueRT(rt,b->four_sites[fi].callee);js_free_shape_null(rt,b->four_sites[fi].shape);}\n    rdi_free(rt, b);')
  prep=d['read_ic_prepare.inc'];prep=once(prep,'    if (!count) return 0;','    if (!count && !four_extra_size(b)) return 0;')
  prep=once(prep,'    total = code_size + count * sizeof(ReadICSite);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);')
  prep=once(prep,'    assert(index == count);','    assert(index == count);\n    four_prepare(ctx,b);');d['read_ic_prepare.inc']=prep
  a='        CASE(OP_call_method):\n        CASE(OP_tail_call_method):'
  q=once(q,a,'''        CASE(OP_four_call):
            {
                FourSite*s=&b->four_sites[get_u16(pc)];call_argc=s->argc;pc+=2;
                call_argv=sp-call_argc;sf->cur_pc=pc;
                if(four_call_try(ctx,s,call_argv[-1],call_argv[-2],&ret_val))goto four_method_result;
                goto four_method_fallback;
            }
'''+a)
  a='                ret_val = JS_CallInternal(ctx, call_argv[-1], call_argv[-2],'
  q=once(q,a,'            four_method_fallback:\n'+a)
  a='                                          JS_UNDEFINED, call_argc, call_argv, 0);\n                if (unlikely(JS_IsException(ret_val)))'
  # The ordinary-call path has the same continuation; restrict to method block.
  start=q.index('            four_method_fallback:');head=q[:start];tail=q[start:]
  tail=once(tail,a,a.replace('                if (unlikely','            four_method_result:\n                if (unlikely',1));q=head+tail
  a='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
  q=once(q,a,'        if(op==OP_four_call){FourSite*fs=&b->four_sites[get_u16(bc_buf+pos+1)];op=OP_call_method;bc_buf[pos]=op;put_u16(bc_buf+pos+1,fs->argc);}\n'+a)
  a='        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {'
  q=once(q,a,a.replace('if (','if (op == OP_four_call || ',1))
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(four_call,3,0,0,u16)\n#undef DEF\n#undef def\n#endif  /* DEF */')
 elif round==ROUNDS[2]:
  q=defines+q
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text();d['four_runtime.inc']=(HERE/'ctor_runtime.inc').read_text();d['four_prepare.inc']=(HERE/'ctor_prepare.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n#include "four_diag.inc"\n#include "four_runtime.inc"')
  q=once(q,'#include "read_ic_prepare.inc"','#include "four_prepare.inc"\n#include "read_ic_prepare.inc"')
  a='            if (b->realm)\n                mark_func(rt, &b->realm->header);'
  q=once(q,a,'            for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*fs=&b->four_sites[fi];JS_MarkValue(rt,fs->callee,mark_func);if(fs->initial)mark_func(rt,&fs->initial->header);if(fs->final)mark_func(rt,&fs->final->header);}\n'+a)
  q=once(q,'    rdi_free(rt, b);','    for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*fs=&b->four_sites[fi];JS_FreeValueRT(rt,fs->callee);js_free_shape_null(rt,fs->initial);js_free_shape_null(rt,fs->final);}\n    rdi_free(rt, b);')
  prep=d['read_ic_prepare.inc'];prep=once(prep,'    if (!count) return 0;','    if (!count && !four_extra_size(b)) return 0;')
  prep=once(prep,'    total = code_size + count * sizeof(ReadICSite);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);')
  prep=once(prep,'    assert(index == count);','    assert(index == count);\n    four_prepare(ctx,b);');d['read_ic_prepare.inc']=prep
  a='        CASE(OP_call_constructor):'
  q=once(q,a,'''        CASE(OP_four_ctor):
            {
                FourSite*s=&b->four_sites[get_u16(pc)];call_argc=s->argc;pc+=2;
                call_argv=sp-call_argc;sf->cur_pc=pc;
                int fast=four_ctor_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);
                if(!fast){
                    int eligible=four_ctor_slow_eligible(ctx,call_argv[-2],call_argv[-1],call_argc);
#ifdef FOUR_DIAG
                    FourSite*oldscope=four_ctor_observer;four_ctor_observer=eligible?s:NULL;
#endif
                    ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);
#ifdef FOUR_DIAG
                    four_ctor_observer=oldscope;
#endif
                    if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);
                }
                if(unlikely(JS_IsException(ret_val))){
                    if(fast){
                        /* Own the original OOM value while formatting a trace:
                         * formatting may itself replace current_exception. */
                        JSValue error=JS_GetException(ctx);
                        if(is_backtrace_needed(ctx,error))build_backtrace(ctx,error,NULL,0,0,0);
                        JS_Throw(ctx,error);
                        goto four_ctor_exception_cleanup;
                    }
                    goto exception;
                }
                for(i=-2;i<call_argc;i++)JS_FreeValue(ctx,call_argv[i]);
                sp-=call_argc+2;*sp++=ret_val;
            }
            BREAK;
'''+a)
  a='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
  q=once(q,a,'        if(op==OP_four_ctor){FourSite*fs=&b->four_sites[get_u16(bc_buf+pos+1)];op=OP_call_constructor;bc_buf[pos]=op;put_u16(bc_buf+pos+1,fs->argc);}\n'+a)
  a='        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {'
  q=once(q,a,a.replace('if (','if (op == OP_four_ctor || ',1))
  a='    if (!rt->current_exception_is_uncatchable) {\n        while (sp > stack_buf) {'
  q=once(q,a,'four_ctor_exception_cleanup:\n'+a)
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(four_ctor,3,0,0,u16)\n#undef DEF\n#undef def\n#endif  /* DEF */')
  a='static int init_shape_hash(JSRuntime *rt);'
  q=once(q,a,a+'\n#ifdef FOUR_DIAG\nstatic void four_ctor_alloc(void);static void four_ctor_resize(void);static void four_ctor_search(void);static void four_ctor_switch(void);\n#endif')
  for anchor,fn in [
   ('    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);','four_ctor_alloc'),
   ('        new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','four_ctor_resize'),
   ('                new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *','four_ctor_resize'),
   ('            new_sh = find_hashed_shape_prop(ctx->rt, sh, prop, prop_flags);','four_ctor_search'),
   ('            p->shape = js_dup_shape(new_sh);','four_ctor_switch'),
   ('            p->shape = new_sh;','four_ctor_switch'),
   ('    *psh = sh;','four_ctor_switch')]:
   q=once(q,anchor,'#ifdef FOUR_DIAG\n    '+fn+'();\n#endif\n'+anchor)
 elif round==ROUNDS[3] and mode.startswith('probe'):
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text();d['four_probe.inc']=(HERE/'index_probe.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n'+defines+'#include "four_diag.inc"\n#include "four_probe.inc"')
  a='        CASE(OP_get_array_el):\n            GET_ARRAY_EL_INLINE(get_array_el, 0);'
  q=once(q,a,'        CASE(OP_get_array_el):\n            four_index_observe(ctx,b,pc-1,sp,var_buf);\n            GET_ARRAY_EL_INLINE(get_array_el, 0);')
 elif round==ROUNDS[3]:
  d['four_diag.inc']=(HERE/'common_diag.inc').read_text();d['four_runtime.inc']=(HERE/'index_runtime.inc').read_text()
  shared=(HERE/'group_prepare.inc').read_text();shared=shared[shared.index('static int four_interior_target'):shared.index('static int four_group_match')]
  d['four_prepare.inc']=shared+'\n'+(HERE/'index_prepare.inc').read_text()
  q=once(q,'#include "read_ic_runtime.inc"','#include "read_ic_runtime.inc"\n'+defines+'#include "four_diag.inc"\n#include "four_runtime.inc"')
  q=once(q,'#include "read_ic_prepare.inc"','#include "four_prepare.inc"\n#include "read_ic_prepare.inc"')
  prep=d['read_ic_prepare.inc'];prep=once(prep,'    if (!count) return 0;','    if (!count && !four_extra_size(b)) return 0;')
  prep=once(prep,'    total = code_size + count * sizeof(ReadICSite);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);')
  prep=once(prep,'    assert(index == count);','    assert(index == count);\n    four_prepare(ctx,b);');d['read_ic_prepare.inc']=prep
  a='        CASE(OP_get_array_el):\n            GET_ARRAY_EL_INLINE(get_array_el, 0);'
  q=once(q,a,'''        CASE(OP_four_index):
            {
                FourSite*s=four_index_site(b,pc-b->byte_code_buf-1);JSValue result;
                if(four_index_try(ctx,s,sp,var_buf,&result)){
                    /* ref_count>1 excludes finalization on this release. */
                    JS_FreeValue(ctx,sp[-2]);sp-=3;var_buf[s->local]=result;
                    pc=b->byte_code_buf+s->end;BREAK;
                }
            }
            GET_ARRAY_EL_INLINE(four_index_fallback,0);
            BREAK;
'''+a)
  a='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
  q=once(q,a,'        if(op==OP_four_index){op=OP_get_array_el;bc_buf[pos]=op;}\n'+a)
  a='        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {'
  q=once(q,a,a.replace('if (','if (op == OP_four_index || ',1))
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(four_index,1,2,1,none)\n#undef DEF\n#undef def\n#endif  /* DEF */')
 else:
  raise NotImplementedError(round)
 d['quickjs.c']=q
 if mode in ['probe','probe_selected','counts']:
  c=d['quickjs-libc.c'];a='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
  c=once(c,a,'''extern void four_begin(void);extern void four_end(void);
static JSValue js_four_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_begin();return JS_UNDEFINED;}
static JSValue js_four_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_end();return JS_UNDEFINED;}
'''+a)
  a='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
  c=once(c,a,a+'''
    JS_SetPropertyStr(ctx,global_obj,"__four_begin",JS_NewCFunction(ctx,js_four_begin,"__four_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__four_end",JS_NewCFunction(ctx,js_four_end,"__four_end",0));''');d['quickjs-libc.c']=c
 return original,d,m
def main():
 p=argparse.ArgumentParser();p.add_argument('round',choices=ROUNDS);p.add_argument('mode',choices=['probe','probe_selected','release','counts','san']);a=p.parse_args()
 original,d,m=source(a.round,a.mode);out=HERE/a.round;dest=out/'work'/a.mode;dest.mkdir(parents=True,exist_ok=False)
 for n,v in d.items():f=dest/n;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(v)
 patch=''.join(line for n,v in d.items() if original.get(n)!=v for line in difflib.unified_diff(original.get(n,'').splitlines(True),v.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (out/(a.mode+'.patch')).write_text(patch)
 command=['make','-j2','-o','repl.c',*(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if a.mode=='san' else []),'qjs','qjsc']
 with (out/(a.mode+'.build.log')).open('w') as log:r=subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 assert not r.returncode,'see '+str(out/(a.mode+'.build.log'))
 manifest=dict(round=a.round,mode=a.mode,parent_archive_sha256=m['source_archive_sha256'],sources={n:sha(dest/n) for n in d},elf=str(dest/'qjs'),elf_sha256=sha(dest/'qjs'),command=command)
 (out/(a.mode+'.manifest.json')).write_text(json.dumps(manifest,indent=2)+'\n');print('BUILD_PASS',a.round,a.mode,flush=True)
if __name__=='__main__':main()

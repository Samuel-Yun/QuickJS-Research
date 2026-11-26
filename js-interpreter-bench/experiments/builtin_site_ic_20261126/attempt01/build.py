import argparse
from common import *

def site(d):
 q=d['quickjs.c']
 q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct BuiltinTable BuiltinTable;')
 q=once(q,'    uint32_t four_count;','    uint32_t four_count;\n    BuiltinTable *builtin_sites;')
 q=once(q,'    uint8_t transition_edges_disabled;','    uint8_t transition_edges_disabled;\n    uint8_t builtin_sham;')
 q=once(q,'    rt->malloc_gc_threshold = 256 * 1024;','    rt->builtin_sham=getenv("QJS_BUILTIN_MODE")&&!strcmp(getenv("QJS_BUILTIN_MODE"),"sham");\n    rt->malloc_gc_threshold = 256 * 1024;')
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#define BIC_SITE 1\n#include "builtin_site.inc"')
 q=once(q,'        CASE(OP_call_method):\n        CASE(OP_tail_call_method):','#include "builtin_opcode.inc"\n        CASE(OP_call_method):\n        CASE(OP_tail_call_method):')
 q=once(q,'    rdi_free(rt, b);','    bic_free(rt,b->builtin_sites);\n    rdi_free(rt, b);')
 q=once(q,'            if (b->realm)\n                mark_func(rt, &b->realm->header);','            bic_mark(rt,b->builtin_sites,mark_func);\n            if (b->realm)\n                mark_func(rt, &b->realm->header);')
 q=once(q,'        if(op==OP_four_ctor){FourSite*fs=', '        if(op==OP_builtin_method1){op=OP_call_method;bc_buf[pos]=op;put_u16(bc_buf+pos+1,1);}\n        if(op==OP_four_ctor){FourSite*fs=')
 q=once(q,'if (op == OP_four_ctor || op == OP_get_field_rdi', 'if (op == OP_builtin_method1 || op == OP_four_ctor || op == OP_get_field_rdi')
 q=once(q,'   the execution image is not rewritten after prepare.', '   this paired read is not rewritten after prepare (call sites may patch).')
 d['quickjs.c']=q;d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'DEF(four_ctor,3,0,0,u16)','DEF(four_ctor,3,0,0,u16)\nDEF(builtin_method1,3,3,1,u16)')
 d['builtin_site.inc']=(HERE/'builtin_site.inc').read_text();d['builtin_opcode.inc']=(HERE/'builtin_opcode.inc').read_text()

def transform(d,label,mode):
 if label=='SITE':site(d)
 if label=='BODY' or mode=='counts':
  if label!='SITE':d['builtin_site.inc']=(HERE/'builtin_site.inc').read_text();d['quickjs.c']=once(d['quickjs.c'],'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "builtin_site.inc"')
 if label in ['SITE','BODY']or mode=='counts':
  d['builtin_decode.inc']=(HERE/'builtin_decode.inc').read_text();d['quickjs.c']=once(d['quickjs.c'],'#include "four_prepare.inc"','#include "four_prepare.inc"\n#include "builtin_decode.inc"')
  q=d['quickjs.c'];start=q.index('static JSValue js_string_charCodeAt(JSContext *ctx, JSValueConst this_val,');end=q.index('static JSValue js_string_charAt(',start);chunk=q[start:end]
  prefix='''    BIC_G(0);
    if(JS_VALUE_GET_TAG(this_val)==JS_TAG_STRING && JS_VALUE_GET_TAG(argv[0])==JS_TAG_INT){
        JSString *flat=JS_VALUE_GET_STRING(this_val);int index=JS_VALUE_GET_INT(argv[0]);
        if((uint32_t)index<flat->len){
            BIC_G(1);
            bic_learn(ctx,this_val,argc,argv);
'''
  if label=='BODY':prefix+='            BIC_G(7);return JS_NewInt32(ctx,string_get(flat,index));\n'
  prefix+='        }else BIC_G(2);\n    }else{if(JS_VALUE_GET_TAG(this_val)!=JS_TAG_STRING)BIC_G(3);else BIC_G(4);}\n'
  chunk=once(chunk,'    val = JS_ToStringCheckObject(ctx, this_val);',prefix+'\n    val = JS_ToStringCheckObject(ctx, this_val);');d['quickjs.c']=q[:start]+chunk+q[end:]
 if label in ['BODY','SITE'] and mode!='counts':d['builtin_site.inc']=(HERE/'builtin_site_release.inc').read_text()
 if mode=='counts':
  d['quickjs.c']='#define BIC_DIAG 1\n'+once(d['quickjs.c'],'    rdi_free(rt, b);','    bic_diag_retire(b);\n    rdi_free(rt, b);')
  x=d['four_diag.inc'];x=once(x,'void four_end(void)','static void bic_report(void);\nvoid four_end(void)');x=once(x,'    four_active=0;','    bic_report();four_active=0;');d['four_diag.inc']=x;instrument(d)
 return d

def main():
 ap=argparse.ArgumentParser();ap.add_argument('labels',nargs='*',default=['SPARSE','BODY','SITE']);ap.add_argument('--modes',nargs='+',default=['release']);a=ap.parse_args()
 for l in a.labels:
  for mode in a.modes:
   d=transform(base(),l,mode)
   if mode!='counts':patch(l,d,HERE/'candidate')
   build(l,d,mode,HERE/'candidate')
if __name__=='__main__':main()

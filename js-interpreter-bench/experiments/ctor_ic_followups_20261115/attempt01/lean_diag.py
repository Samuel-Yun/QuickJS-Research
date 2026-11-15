"""Diagnostic only: keep Release structure sizes and allocation layout, no per-site heap log."""
import argparse,json,subprocess,hashlib
from pathlib import Path
HERE=Path(__file__).resolve().parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('round');a=p.parse_args();h=HERE/a.round;m=json.loads((h/'release.manifest.json').read_text());r=Path(m['elf']).parent;w=h/'work/lean_counts';w.mkdir(exist_ok=False)
 for n,s in m['sources'].items():
  assert sha(r/n)==s;(w/n).parent.mkdir(parents=True,exist_ok=True);(w/n).write_bytes((r/n).read_bytes())
 keys=['q','h','eligible','fill','guard','overflow','work1','work2','work3','work4','work5','work6']
 (w/'four_diag.inc').write_text('''static int four_active;
static uint64_t follow_stats[24],lean_stats[12];
#define FOLLOW(i) do{if(four_active)follow_stats[i]++;}while(0)
#define FOLLOW_ADD(i,n) do{if(four_active)follow_stats[i]+=(n);}while(0)
'''+''.join('#define LEAN_'+k+' '+str(i)+'\n' for i,k in enumerate(keys))+'''#define FOUR_COUNT(s,k) do{if(four_active)lean_stats[LEAN_##k]++;}while(0)
#define FOUR_ADD(s,k,n) do{if(four_active)lean_stats[LEAN_##k]+=(n);}while(0)
void four_begin(void){four_active=1;}
void four_end(void){four_active=0;fprintf(stderr,"LEAN_COUNTS:{\\\"follow\\\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)follow_stats[i]);fprintf(stderr,"],\\\"ctor\\\":[");for(int i=0;i<12;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)lean_stats[i]);fprintf(stderr,"]}\\n");}
''')
 f=w/'four_runtime.inc';s=f.read_text().replace('    return ctx->rt->malloc_ctx.malloc_state.malloc_size<=SIZE_MAX-sizeof(JSObject) &&','    if(ctx->rt->malloc_ctx.malloc_state.malloc_size+sizeof(JSObject)>ctx->rt->malloc_gc_threshold)FOLLOW(12);\n    return ctx->rt->malloc_ctx.malloc_state.malloc_size<=SIZE_MAX-sizeof(JSObject) &&');f.write_text(s)
 f=w/'quickjs-libc.c';s=f.read_text();i=s.index('void js_std_add_helpers(JSContext *ctx, int argc, char **argv)');s=s[:i]+'''extern void four_begin(void);extern void four_end(void);
static JSValue js_four_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_begin();return JS_UNDEFINED;}
static JSValue js_four_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_end();return JS_UNDEFINED;}
'''+s[i:];s=s.replace('    JS_SetPropertyStr(ctx, global_obj, "performance", performance);','''    JS_SetPropertyStr(ctx, global_obj, "performance", performance);
    JS_SetPropertyStr(ctx,global_obj,"__four_begin",JS_NewCFunction(ctx,js_four_begin,"__four_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__four_end",JS_NewCFunction(ctx,js_four_end,"__four_end",0));''');f.write_text(s)
 with (h/'lean_counts.build.log').open('w') as log:subprocess.run(['make','-j2','-o','repl.c','qjs'],cwd=w,stdout=log,stderr=subprocess.STDOUT,check=True)
 (h/'lean_counts.manifest.json').write_text(json.dumps(dict(diagnostic_only=True,elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),sources={n:sha(w/n) for n in m['sources']},Release_parent=m['elf_sha256']),indent=2))
 print('LEAN_BUILD_PASS',flush=True)
if __name__=='__main__':main()

import argparse,importlib.util,json,hashlib,subprocess,tarfile,difflib
from pathlib import Path
H=Path(__file__).resolve().parent;ROOT=H.parents[2];OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01';R3=ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):assert s.count(a)==1,repr(a);return s.replace(a,b,1)
def parent():
 a=R3/'source.tar.gz';assert sha(a)==(R3/'source.sha256').read_text().split()[0];m=json.loads((R3/'release.manifest.json').read_text())
 with tarfile.open(a) as t:d={x.name.split('/',1)[1]:t.extractfile(x).read().decode() for x in t.getmembers() if x.isfile()}
 assert {n:hashlib.sha256(s.encode()).hexdigest() for n,s in d.items()}==m['sources'];return d,sha(a)
def diag_header():
 keys=['q','h','eligible','fill','guard','overflow','work1','work2','work3','work4','work5','work6']
 return '''static int negative_active;
static uint64_t negative_stats[24],sparse_stats[24],ctor_stats[12];
#define NEGSTAT(i) do{if(negative_active)negative_stats[i]++;}while(0)
#define FOLLOW(i) do{if(negative_active)sparse_stats[i]++;}while(0)
#define FOLLOW_ADD(i,n) do{if(negative_active)sparse_stats[i]+=(n);}while(0)
'''+''.join('#define CTOR_'+k+' '+str(i)+'\n' for i,k in enumerate(keys))+'''#define FOUR_COUNT(s,k) do{if(negative_active)ctor_stats[CTOR_##k]++;}while(0)
#define FOUR_ADD(s,k,n) do{if(negative_active)ctor_stats[CTOR_##k]+=(n);}while(0)
void four_begin(void){negative_active=1;}
void four_end(void){negative_active=0;fprintf(stderr,"NEG_COUNTS:{\\\"ctor\\\":[");for(int i=0;i<12;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)ctor_stats[i]);fprintf(stderr,"],\\\"negative\\\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)negative_stats[i]);fprintf(stderr,"],\\\"sparse\\\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)sparse_stats[i]);fprintf(stderr,"]}\\n");}
'''
def source(label,mode):
 original,digest=parent();d=original.copy();q=d['quickjs.c']
 if label!='R3':d['four_diag.inc']+='\n#define NEGSTAT(i) ((void)0)\n'
 if label=='SPARSE':
  spec=importlib.util.spec_from_file_location('old_sparse',OLD/'sparse.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
  d['four_diag.inc']+='\n#define FOLLOW(i) ((void)0)\n#define FOLLOW_ADD(i,n) ((void)0)\n';q=m.apply(d,q,once,'release')
 if label in ['NEGATIVE_ONLY','LAYOUT_OFF']:
  q=once(q,'struct JSRuntime {','typedef struct R3NegativeEntry {struct JSObject*object;uint32_t next;} R3NegativeEntry;\nstatic void negative_destroy(JSRuntime*rt);\nstruct JSRuntime {')
  q=once(q,'    JSShape **shape_hash;\n    void *user_opaque;','    JSShape **shape_hash;\n    void *user_opaque;\n    R3NegativeEntry *negative_entries;\n    uint32_t negative_used,negative_capacity,negative_free,negative_live;')
  q=once(q,'    js_free_rt(rt, rt->atom_hash);\n    js_free_rt(rt, rt->shape_hash);','    js_free_rt(rt, rt->atom_hash);\n    js_free_rt(rt, rt->shape_hash);\n    negative_destroy(rt);')
  s=d['four_runtime.inc'];s=once(s,'    uint16_t argc;','    uint16_t argc;\n    uint32_t negative_index; /* old padding at +92, sizeof stays 96 */')
  a=s.index('static int four_ctor_slow_eligible(');b=s.index('static void four_ctor_learn(',a)
  s=s[:a]+'''#include "negative_runtime.inc"
static int four_ctor_slow_eligible(JSContext*ctx,FourSite*s,JSValueConst callee,JSValueConst target,unsigned argc,int*template_reject)
{
    *template_reject=0;
    if(negative_match(ctx,s,callee)){NEGSTAT(1);return 0;}
    JSObject*f,*proto;FourRecipe r;
    if(!four_ctor_base(ctx,callee,target,argc,&f)){NEGSTAT(3);return 0;}
    if(!four_ctor_recipe(f->u.func.function_bytecode,&r)){*template_reject=1;NEGSTAT(4);return 0;}
    if(!(proto=four_ctor_proto(f))){NEGSTAT(5);return 0;}
    if(!find_hashed_shape_proto(ctx->rt,proto)){NEGSTAT(6);return 0;}
    if(!four_ctor_chain(proto,&r)){NEGSTAT(7);return 0;}
    NEGSTAT(8);return 1;
}
'''+s[b:];d['four_runtime.inc']=s;d['negative_runtime.inc']=(H/'negative_runtime.inc').read_text()
  q=once(q,'int eligible=four_ctor_slow_eligible(ctx,call_argv[-2],call_argv[-1],call_argc);','int template_reject=0;\n                    int eligible=four_ctor_slow_eligible(ctx,s,call_argv[-2],call_argv[-1],call_argc,&template_reject);')
  q=once(q,'if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);','if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);\n                    else if(template_reject && !JS_IsException(ret_val))negative_remember(ctx,s,call_argv[-2]);')
  q=once(q,'JS_MarkValue(rt,fs->callee,mark_func);','JS_MarkValue(rt,negative_value(rt,fs),mark_func);JS_MarkValue(rt,fs->callee,mark_func);')
  q=once(q,'JS_FreeValueRT(rt,fs->callee);','negative_release(rt,fs);JS_FreeValueRT(rt,fs->callee);')
  if label=='LAYOUT_OFF':q='#define NEGATIVE_DISABLED 1\n'+q
 if mode=='counts':
  # No FOUR_DIAG: all structure sizes match Release, no per-site logging allocations.
  d['four_diag.inc']=diag_header();s=d['four_runtime.inc']
  if label!='SPARSE':s=once(s,'    const uint8_t*p=b->byte_code_buf,','    NEGSTAT(0);\n    const uint8_t*p=b->byte_code_buf,')
  if label in ['R3','SPARSE']:
   name='plan' if label=='SPARSE' else 'four_ctor';a=s.index('static int '+name+'_slow_eligible(');b=s.index('static void '+name+'_learn(',a)
   s=s[:a]+f'''static int {name}_slow_eligible(JSContext*ctx,JSValueConst callee,JSValueConst target,unsigned argc)
{{
    JSObject*f,*proto;FourRecipe r;
    if(!{name}_base(ctx,callee,target,argc,&f)){{NEGSTAT(3);return 0;}}
    if(!{name}_recipe(f->u.func.function_bytecode,&r)){{NEGSTAT(4);return 0;}}
    if(!(proto={name}_proto(f))){{NEGSTAT(5);return 0;}}
    if(!find_hashed_shape_proto(ctx->rt,proto)){{NEGSTAT(6);return 0;}}
    if(!{name}_chain(proto,&r)){{NEGSTAT(7);return 0;}}
    NEGSTAT(8);return 1;
}}
'''+s[b:]
  d['four_runtime.inc']=s
  c=d['quickjs-libc.c'];a='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)';c=once(c,a,'''extern void four_begin(void);extern void four_end(void);
static JSValue js_neg_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_begin();return JS_UNDEFINED;}
static JSValue js_neg_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_end();return JS_UNDEFINED;}
'''+a);a='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);';d['quickjs-libc.c']=once(c,a,a+'''\n    JS_SetPropertyStr(ctx,global_obj,"__four_begin",JS_NewCFunction(ctx,js_neg_begin,"__four_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__four_end",JS_NewCFunction(ctx,js_neg_end,"__four_end",0));''')
 d['quickjs.c']=q
 # An unchanged positive try is an explicit invariant, not a comment.
 if label!='SPARSE':
  def hot(s):return s[s.index('static int four_ctor_try('):s.index('static size_t four_extra_size')]
  assert hot(d['four_runtime.inc'])==hot(original['four_runtime.inc'])
 return original,d,digest

def main():
 p=argparse.ArgumentParser();p.add_argument('label',choices=['R3','NEGATIVE_ONLY','LAYOUT_OFF','SPARSE']);p.add_argument('mode',choices=['release','counts','san']);a=p.parse_args();original,d,digest=source(a.label,a.mode);h=H/a.label;w=h/'work'/a.mode;w.mkdir(parents=True,exist_ok=False)
 for n,s in d.items():f=w/n;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(s)
 patch=''.join(l for n,s in d.items() if original.get(n)!=s for l in difflib.unified_diff(original.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n));(h/(a.mode+'.patch')).write_text(patch)
 cmd=['make','-j2','-o','repl.c',*(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if a.mode=='san' else []),'qjs','qjsc']
 with (h/(a.mode+'.build.log')).open('w') as f:z=subprocess.run(cmd,cwd=w,stdout=f,stderr=subprocess.STDOUT,timeout=300)
 assert z.returncode==0,h
 (h/(a.mode+'.manifest.json')).write_text(json.dumps(dict(label=a.label,mode=a.mode,R3_archive_sha256=digest,commit='06aada464',elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),sources={n:sha(w/n) for n in d},command=cmd),indent=2)+'\n');print('BUILD_PASS',a.label,a.mode,flush=True)
if __name__=='__main__':main()

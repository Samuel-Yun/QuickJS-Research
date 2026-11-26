import hashlib,json,os,subprocess,difflib,importlib.util
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'
FROZEN=PACKAGE/'modified'
OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/01_forward_ctor/work/release'
ENV=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C',ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def once(s,a,b):
 assert s.count(a)==1,(a[:90],s.count(a));return s.replace(a,b)
def base():
 m=json.loads((PACKAGE/'manifest.json').read_text());d={}
 for n,h in m['modified'].items():assert sha(FROZEN/n)==h,n;d[n]=(FROZEN/n).read_text()
 return d
def snapshot(d):
 spec=importlib.util.spec_from_file_location('ep_bc',PACKAGE/'tools/bytecode.py');v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
 _,src=v.inspection_sources('method');sq=src['quickjs.c'].decode();q=d['quickjs.c']
 q=once(q,'static JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,','static int bc_after_script(JSContext *ctx, JSValueConst root);\nstatic JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,')
 a='        ret_val = JS_EvalFunctionInternal(ctx, fun_obj, this_obj, var_refs, sf);'
 i=sq.index('        const char *bc_file = getenv("QJS_INSPECT_FILE");');j=sq.index('        JS_FreeValue(ctx, bc_root);',i)+len('        JS_FreeValue(ctx, bc_root);')
 q=once(q,a,sq[i:j]);d['quickjs.c']=q+'\n#define BC_METHOD 1\n#include "bytecode_snapshot.inc"\n';d['bytecode_snapshot.inc']=(PACKAGE/'tools/bytecode_snapshot.inc').read_text()
def instrument(d):
 # Existing Run-scoped counters; registration occurs only in this build.
 d['quickjs.c']='#define FOUR_DIAG 1\n'+once(d['quickjs.c'],'#include "four_diag.inc"','static int find_line_num(JSContext*,JSFunctionBytecode*,uint32_t,int*);\n#include "four_diag.inc"')
 diag=d['four_diag.inc'];diag=once(diag,'    unsigned pc;','    int ep_line,ep_col;char ep_file[256];\n    unsigned pc;')
 diag=once(diag,'    unsigned count=min_int(128,b->byte_code_len-pc);','    d->ep_line=find_line_num(ctx,b,pc,&d->ep_col);\n    if(b->has_debug){char tmp[256];snprintf(d->ep_file,sizeof(d->ep_file),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->debug.filename));}\n    unsigned count=min_int(128,b->byte_code_len-pc);')
 diag=once(diag,'        if(d->target){','        fprintf(stderr,",\\"source_line\\":%d,\\"source_column\\":%d,\\"source_file\\":",d->ep_line,d->ep_col);four_json_string(d->ep_file);\n        if(d->target){')
 d['four_diag.inc']=diag
 q=d['qjs.c'];q=once(q,'#include "quickjs-libc.h"','#include "quickjs-libc.h"\nextern void four_begin(void);\nextern void four_end(void);\nstatic JSValue ep_begin(JSContext*c,JSValueConst t,int n,JSValueConst*a){four_begin();return JS_UNDEFINED;}\nstatic JSValue ep_end(JSContext*c,JSValueConst t,int n,JSValueConst*a){four_end();return JS_UNDEFINED;}')
 # Install on every evaluation context, including modules/realm tests.
 anchor='    js_std_add_helpers(ctx, argc - optind, argv + optind);'
 q=once(q,anchor,anchor+'\n    { JSValue g=JS_GetGlobalObject(ctx);JS_SetPropertyStr(ctx,g,"__ep_begin",JS_NewCFunction(ctx,ep_begin,"__ep_begin",0));JS_SetPropertyStr(ctx,g,"__ep_end",JS_NewCFunction(ctx,ep_end,"__ep_end",0));JS_FreeValue(ctx,g); }')
 d['qjs.c']=q
 snapshot(d)
def build(label,d,mode='release',folder=None):
 folder=folder or HERE;work=folder/'work'/f'{label}.{mode}';stamp=folder/f'{label}.{mode}.manifest.json'
 if stamp.exists():
  m=json.loads(stamp.read_text());assert sha(m['binary'])==m['binary_sha256']
  if set(d)==set(m['sources']) and all((Path(m['binary']).parent/n).read_text()==t for n,t in d.items()):print('BUILD_EXISTS',label,mode,flush=True);return m
  archive=folder/'development_revisions'/Path(m['binary']).parent.name;archive.mkdir(parents=True,exist_ok=False)
  stamp.rename(archive/stamp.name)
  log=folder/f'{label}.{mode}.build.log'
  if log.exists():log.rename(archive/log.name)
 if work.exists():
  i=2
  while (work.parent/(work.name+f'.rev{i:02d}')).exists():i+=1
  work=work.parent/(work.name+f'.rev{i:02d}')
 work.mkdir(parents=True)
 for n,t in d.items():p=work/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
 cmd=['make','-j2','-o','repl.c']+(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if mode=='sanitize' else [])+['qjs','qjsc']
 with (folder/f'{label}.{mode}.build.log').open('w') as f:r=subprocess.run(cmd,cwd=work,stdout=f,stderr=subprocess.STDOUT)
 assert r.returncode==0,(label,mode,folder/f'{label}.{mode}.build.log')
 m=dict(label=label,mode=mode,binary=str(work/'qjs'),binary_sha256=sha(work/'qjs'),command=cmd,sources={n:sha(work/n) for n in d},parent='frozen SPARSE 06aada4',instrumented=mode=='counts',sanitized=mode=='sanitize')
 save(stamp,m);print('BUILD_PASS',label,mode,flush=True);return m
def patch(label,d,folder):
 b=base();(folder/f'SPARSE-to-{label}.patch').write_text(''.join(''.join(difflib.unified_diff(b.get(n,'').splitlines(True),t.splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n,t in d.items() if t!=b.get(n)))

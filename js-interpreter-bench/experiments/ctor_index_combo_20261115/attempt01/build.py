"""Combine only the two measured/frozen candidates, keeping their guards intact."""
import argparse,difflib,hashlib,json,subprocess,tarfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
FOUR=ROOT/'experiments/ic_four_rounds_20261115/attempt01'
PARENT=ROOT/'experiments/execution_paths_20261114/attempt01/candidates'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):assert s.count(a)==1,repr(a);return s.replace(a,b,1)
def unpack(archive,prefix,digests):
 with tarfile.open(archive) as t:
  data={m.name.removeprefix(prefix):t.extractfile(m).read().decode() for m in t.getmembers() if m.isfile()}
 assert set(data)==set(digests)
 for n,s in data.items():assert hashlib.sha256(s.encode()).hexdigest()==digests[n],n
 return data
def source(mode):
 pm=json.loads((PARENT/'manifest.json').read_text());archive=PARENT/'TRANSITION_EDGE_STRONG-source.tar.gz'
 assert sha(archive)==pm['source_archive_sha256'];original=unpack(archive,'quickjs-transition-edge/',pm['sources'])
 frozen={};inputs={};audit=json.loads((FOUR/'audit.json').read_text())
 for name in ['03_constructor_plan','04_index_consume']:
  folder=FOUR/name;archive=folder/'source.tar.gz';m=json.loads((folder/'release.manifest.json').read_text())
  assert sha(archive)==audit['rounds'][name]['source_archive_sha256']
  frozen[name]=unpack(archive,'quickjs-'+name+'/',m['sources']);inputs[name]=dict(archive=str(archive),sha256=sha(archive),sources=m['sources'])
 ctor=frozen['03_constructor_plan'];index=frozen['04_index_consume'];d=ctor.copy();q=d['quickjs.c']
 q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct IndexSite IndexSite;')
 q=once(q,'    uint32_t four_count;','    uint32_t four_count;\n    IndexSite *index_sites;\n    uint32_t index_count;')
 runtime=index['four_runtime.inc'].replace('FourSite','IndexSite').replace('b->four_sites','b->index_sites').replace('b->four_count','b->index_count').replace('four_extra_size','index_extra_size').replace('four_prepare','index_prepare')
 prep=index['four_prepare.inc'].replace('FourSite','IndexSite').replace('b->four_sites','b->index_sites').replace('b->four_count','b->index_count').replace('four_extra_size','index_extra_size').replace('four_prepare','index_prepare')
 prep=once(prep,'b->index_sites=(IndexSite*)(b->read_ic_sites+b->read_ic_count);','b->index_sites=(IndexSite*)((uint8_t*)(b->read_ic_sites+b->read_ic_count)+b->four_count*sizeof(FourSite));')
 d['index_runtime.inc']=runtime;d['index_prepare.inc']=prep
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "index_runtime.inc"')
 q=once(q,'#include "four_prepare.inc"','#include "four_prepare.inc"\n#include "index_prepare.inc"')
 rdi=d['read_ic_prepare.inc'];rdi=once(rdi,'    if (!count && !four_extra_size(b)) return 0;','    if (!count && !four_extra_size(b) && !index_extra_size(b)) return 0;')
 rdi=once(rdi,'    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);','    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b) + index_extra_size(b);')
 rdi=once(rdi,'    four_prepare(ctx,b);','    four_prepare(ctx,b);\n    index_prepare(ctx,b);');d['read_ic_prepare.inc']=rdi
 start=index['quickjs.c'].index('        CASE(OP_four_index):');end=index['quickjs.c'].index('        CASE(OP_get_array_el):',start)
 handler=index['quickjs.c'][start:end].replace('FourSite','IndexSite')
 q=once(q,'        CASE(OP_get_array_el):',handler+'        CASE(OP_get_array_el):')
 anchor='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
 q=once(q,anchor,'        if(op==OP_four_index){op=OP_get_array_el;bc_buf[pos]=op;}\n'+anchor)
 q=once(q,'        if (op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||','        if (op == OP_four_index || op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||')
 d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'#undef DEF\n#undef def\n#endif  /* DEF */','DEF(four_index,1,2,1,none)\n#undef DEF\n#undef def\n#endif  /* DEF */')
 if mode=='counts':
  q='#define FOUR_DIAG 1\n'+q
  c=d['quickjs-libc.c'];a='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
  c=once(c,a,'''extern void four_begin(void);extern void four_end(void);
static JSValue js_four_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_begin();return JS_UNDEFINED;}
static JSValue js_four_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){four_end();return JS_UNDEFINED;}
'''+a)
  a='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
  c=once(c,a,a+'''
    JS_SetPropertyStr(ctx,global_obj,"__four_begin",JS_NewCFunction(ctx,js_four_begin,"__four_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__four_end",JS_NewCFunction(ctx,js_four_end,"__four_end",0));''');d['quickjs-libc.c']=c
 d['quickjs.c']=q
 return original,d,pm,inputs
def main():
 p=argparse.ArgumentParser();p.add_argument('mode',choices=['release','counts','san']);a=p.parse_args()
 original,d,pm,inputs=source(a.mode);dest=HERE/'work'/a.mode;dest.mkdir(parents=True,exist_ok=False)
 for n,s in d.items():f=dest/n;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(s)
 patch=''.join(line for n,s in d.items() if original.get(n)!=s for line in difflib.unified_diff(original.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (HERE/(a.mode+'.patch')).write_text(patch)
 command=['make','-j2','-o','repl.c',*(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if a.mode=='san' else []),'qjs','qjsc']
 with (HERE/(a.mode+'.build.log')).open('w') as log:r=subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 assert r.returncode==0,'see build log'
 m=dict(mode=a.mode,parent_archive_sha256=pm['source_archive_sha256'],frozen_candidates=inputs,sources={n:sha(dest/n) for n in d},elf=str(dest/'qjs'),elf_sha256=sha(dest/'qjs'),command=command)
 (HERE/(a.mode+'.manifest.json')).write_text(json.dumps(m,indent=2)+'\n');print('BUILD_PASS',a.mode,flush=True)
if __name__=='__main__':main()

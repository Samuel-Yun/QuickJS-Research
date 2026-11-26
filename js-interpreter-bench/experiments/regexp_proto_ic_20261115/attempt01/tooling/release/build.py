"""Reproducible 3B derivative of candidate C; no timing of rebuilt controls."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import tarfile

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PARENT=ROOT/'experiments/execution_paths_20261114/attempt01/candidates'


def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):
    assert s.count(a)==1,repr(a);return s.replace(a,b,1)


def load_parent():
    m=json.loads((PARENT/'manifest.json').read_text());archive=PARENT/'TRANSITION_EDGE_STRONG-source.tar.gz'
    assert sha(archive)==m['source_archive_sha256']
    with tarfile.open(archive) as t:
        data={x.name.removeprefix('quickjs-transition-edge/'):t.extractfile(x).read() for x in t.getmembers() if x.isfile()}
    assert set(data)==set(m['sources'])
    for name,digest in m['sources'].items():assert hashlib.sha256(data[name]).hexdigest()==digest,name
    return data,m


def instrument(files):
    files=files.copy();q=files['quickjs.c']
    q=once(q,'#include "read_ic_runtime.inc"','#include "b3_diag.h"\n#include "read_ic_runtime.inc"')
    q+='\n#define SNAPSHOT_EVAL_COLD 1\n#include "snapshot.inc"\n'
    files['quickjs.c']=q
    o=files['read_ic_opcodes.inc']
    o=once(o,'        RDI_QUERY();','        RDI_QUERY(); \\\n        B3Site *b3_d=b3_query(ctx,b,site,obj,keep);')
    o=once(o,'        RDI_COUNT(fallback);','        RDI_COUNT(fallback); \\\n        b3_fallback(b3_d);')
    o=once(o,'                prs = find_own_property(&pr, p, atom);','                b3_lookup(b3_d,p==origin); \\\n                prs = find_own_property(&pr, p, atom);')
    o=once(o,'                if (prs) {','                if (prs) { \\\n                    b3_found(b3_d,origin,p,pr,prs);')
    if '/* B3_NEW_HIT */' in o:
        o=once(o,'/* B3_NEW_HIT */','b3_hit(b3_d); /* B3_NEW_HIT */')
    files['read_ic_opcodes.inc']=o
    r=files['read_ic_runtime.inc']
    r=once(r,'static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)\n{','static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)\n{\n    b3_forget(b);')
    if '/* B3_PROMOTED */' in r:r=once(r,'/* B3_PROMOTED */','b3_promote(); /* B3_PROMOTED */')
    files['read_ic_runtime.inc']=r
    files['b3_diag.h']=(HERE/'b3_diag.h').read_text()
    files['snapshot.inc']=(ROOT/'experiments/bytecode_eval_cold_20261110/attempt01/snapshot.inc').read_text()
    c=files['quickjs-libc.c'];anchor='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
    c=once(c,anchor,'''extern void b3_begin(void);extern void b3_end(void);
extern JSValue qjs_snapshot(JSContext *,JSValueConst,int,JSValueConst *);
static JSValue js_b3_begin(JSContext *ctx,JSValueConst t,int n,JSValueConst *v){b3_begin();return JS_UNDEFINED;}
static JSValue js_b3_end(JSContext *ctx,JSValueConst t,int n,JSValueConst *v){b3_end();return JS_UNDEFINED;}
'''+anchor)
    anchor='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    c=once(c,anchor,anchor+'''
    JS_SetPropertyStr(ctx,global_obj,"__b3_begin",JS_NewCFunction(ctx,js_b3_begin,"__b3_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__b3_end",JS_NewCFunction(ctx,js_b3_end,"__b3_end",0));
    JS_SetPropertyStr(ctx,global_obj,"__snapshot",JS_NewCFunction(ctx,qjs_snapshot,"__snapshot",3));''')
    files['quickjs-libc.c']=c
    return files


def main():
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['inspect','release','counts','san']);args=p.parse_args()
    data,parent=load_parent();original={n:v.decode() for n,v in data.items()};files=original.copy()
    if args.mode!='inspect':
        for name in ['read_ic_opcodes.inc','read_ic_runtime.inc']:
            files[name]=(HERE/'implementation'/name).read_text()
    feature=files.copy()
    if args.mode in ['inspect','counts']:files=instrument(files)
    dest=HERE/'work'/args.mode;dest.mkdir(parents=True,exist_ok=False)
    for name,content in files.items():
        path=dest/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content)
    patch=''.join(line for name in feature if feature[name]!=original.get(name) for line in difflib.unified_diff(original.get(name,'').splitlines(True),feature[name].splitlines(True),fromfile='a/'+name,tofile='b/'+name))
    (HERE/(args.mode+'.feature.patch')).write_text(patch)
    tool=HERE/'tooling'/args.mode;tool.mkdir(parents=True)
    for name in ['build.py','b3_diag.h']:(tool/name).write_bytes((HERE/name).read_bytes())
    flags=['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if args.mode=='san' else []
    command=['make','-j2','-o','repl.c',*flags,'qjs']
    with (HERE/(args.mode+'.build.log')).open('w') as log:
        r=subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,timeout=300)
    assert r.returncode==0,'see '+args.mode+'.build.log'
    manifest=dict(mode=args.mode,parent_archive_sha256=parent['source_archive_sha256'],
        parent_sources=parent['sources'],sources={name:sha(dest/name) for name in files},elf=str(dest/'qjs'),
        elf_sha256=sha(dest/'qjs'),command=command,builder_sha256=sha(Path(__file__)),
        diagnostic_only=args.mode in ['inspect','counts'],bytecode_representation_changed=False,record_size_bytes=24)
    (HERE/(args.mode+'.manifest.json')).write_text(json.dumps(manifest,indent=2)+'\n')
    print('BUILD_PASS',args.mode,flush=True)


if __name__=='__main__':main()

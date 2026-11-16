"""Build independent candidates from the exact archived EVAL_COLD source."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import tarfile

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PORT=ROOT/'ports/eval_cold'


def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def once(text,old,new):
    assert text.count(old)==1,repr(old)
    return text.replace(old,new,1)


def edge_source(original,diagnostic):
    changed=original.copy();q=changed['quickjs.c']
    q=once(q,'typedef struct JSShape JSShape;','typedef struct JSShape JSShape;\ntypedef struct ExEdge { JSShape *from,*to; JSAtom atom; int flags; } ExEdge;')
    q=once(q,'struct JSRuntime {','struct JSRuntime {\n    ExEdge transition_edges[32];')
    q=once(q,'    uint8_t is_hashed;','    uint8_t is_hashed;\n    uint8_t has_transition_edge;')
    helper=(HERE/'execution_helpers.inc').read_text();start=helper.index('#ifdef EX_DIAGNOSTIC');end=helper.index('\n#ifdef EX_RMW',start)
    counters=helper[start:end]
    if diagnostic:counters='#define EX_DIAGNOSTIC 1\n'+counters
    anchor='static void js_shape_hash_link(JSRuntime *rt, JSShape *sh)'
    q=once(q,anchor,counters+'\n#include "edge_helpers.inc"\n\n'+anchor)
    q=once(q,'static void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)\n{','static void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)\n{\n    ex_edge_invalidate(rt,sh);')
    q=q.replace('    sh->is_hashed = FALSE;','    sh->is_hashed = FALSE;\n    sh->has_transition_edge = FALSE;')
    anchor='        new_sh = find_hashed_shape_prop(ctx->rt, sh, prop, prop_flags);'
    q=once(q,anchor,'''        new_sh = ex_edge_lookup(ctx->rt,sh,prop,prop_flags);
        if (!new_sh) {
            new_sh = find_hashed_shape_prop(ctx->rt, sh, prop, prop_flags);
            if (new_sh) ex_edge_fill(ctx->rt,sh,prop,prop_flags,new_sh);
        }''')
    changed['quickjs.c']=q;changed['edge_helpers.inc']=(HERE/'edge_helpers.inc').read_text()
    if diagnostic:
        c=changed['quickjs-libc.c'];anchor='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
        c=once(c,anchor,'''extern void ex_begin(void);extern void ex_end(void);
static JSValue js_ex_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v) { ex_begin();return JS_UNDEFINED; }
static JSValue js_ex_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v) { ex_end();return JS_UNDEFINED; }
'''+anchor)
        anchor='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
        c=once(c,anchor,anchor+'''
    JS_SetPropertyStr(ctx,global_obj,"__ex_begin",JS_NewCFunction(ctx,js_ex_begin,"__ex_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__ex_end",JS_NewCFunction(ctx,js_ex_end,"__ex_end",0));''')
        changed['quickjs-libc.c']=c
    return original,changed


def source(label,diagnostic):
    manifest=json.loads((PORT/'manifest.json').read_text())
    assert sha(PORT/'quickjs-eval-cold-source.tar.gz')==manifest['source_archive_sha256']
    with tarfile.open(PORT/'quickjs-eval-cold-source.tar.gz') as archive:
        data={Path(m.name).name:archive.extractfile(m).read() for m in archive.getmembers() if m.isfile()}
    for name,digest in manifest['target_raw'].items():
        assert hashlib.sha256(data[name]).hexdigest()==digest,name
    original={n:v.decode() for n,v in data.items()}
    if label=='TRANSITION_EDGE':return edge_source(original,diagnostic)
    changed=original.copy()
    rmw=label in ['FIELD_RMW_I32','FIELD_RMW_CONST','FIELD_RMW_UPDATE']
    loop=label=='INT_LOOP_KERNEL'
    bits=label=='INT_LOOP_BITS'
    assert rmw or loop or bits,label
    defines=('#define EX_RMW 1\n' if rmw else '#define EX_LOOP 1\n' if loop else '#define EX_BITS 1\n')
    if label=='FIELD_RMW_CONST': defines+='#define EX_RMW_CONST 1\n'
    if label=='FIELD_RMW_UPDATE': defines+='#define EX_RMW_UPDATE 1\n'
    if diagnostic: defines+='#define EX_DIAGNOSTIC 1\n'
    q=changed['quickjs.c']
    # Inline helpers after opcode metadata, where all shape and opcode helpers
    # exist. New macros are visible to runtime handler and prepare includes.
    anchor='static __exception int next_token(JSParseState *s);'
    q=once(q,anchor,defines+'#include "execution_helpers.inc"\n\n'+anchor)
    # Handlers occur BEFORE opcode_info in upstream, so function declarations
    # and types live earlier; definitions are placed after opcode_info.
    declarations=defines+'''\nstatic int ex_load(const uint8_t *, int *, int *);
static int ex_integer(const uint8_t *, int32_t *);
static int ex_plain_load(const uint8_t *);
static int ex_has_candidates(JSFunctionBytecode *);
static void ex_prepare(JSFunctionBytecode *);
'''
    if loop:
        declarations+='''typedef struct ExLoop { int i,s,barg,bi,bsize; int32_t bound; const uint8_t *body,*end; } ExLoop;
static int ex_loop_match(JSFunctionBytecode *, const uint8_t *, ExLoop *);
'''
    if bits:declarations+=(HERE/'loop_bits_helpers.inc').read_text()+'\n'
    # Counter declarations/macros must be visible in JS_CallInternal as well.
    helpers=(HERE/'execution_helpers.inc').read_text()
    counter_start=helpers.index('#ifdef EX_DIAGNOSTIC')
    counter_end=helpers.index('\n#ifdef EX_RMW',counter_start)
    declarations+=helpers[counter_start:counter_end]+'\n'
    helpers=helpers[:counter_start]+helpers[counter_end:]
    helpers=helpers.replace('typedef struct ExLoop { int i,s,barg,bi,bsize; int32_t bound; const uint8_t *body,*end; } ExLoop;\n','')
    anchor='/* argv[] is modified if (flags & JS_CALL_FLAG_COPY_ARGV) = 0. */\nstatic JSValue JS_CallInternal'
    q=once(q,anchor,declarations+'\n'+anchor)
    q=once(q,'        CASE(OP_get_field):\n            GET_FIELD_INLINE(get_field, 0, 0);',
        '#include "execution_handlers.inc"\n\n        CASE(OP_get_field):\n            GET_FIELD_INLINE(get_field, 0, 0);')
    # Serialization reverses only the optional entry opcode. Interior sequence
    # and original slot operands are retained verbatim in the execution image.
    anchor='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
    normalization=''
    if rmw:
        normalization='''        if (op == OP_field_rmw_i32 || op == OP_field_rmw_i32_wide) {
            int n=op==OP_field_rmw_i32?1:3;
            op=ex_plain_load(bc_buf+pos+n);bc_buf[pos]=op;
        }
'''
        if label=='FIELD_RMW_UPDATE':
            normalization+='        if (op == OP_field_rmw_update) { op=OP_get_field2_rdi;bc_buf[pos]=op; }\n'
    if loop:
        normalization='''        if (op == OP_int_loop_kernel) {
            ExLoop loop;assert(ex_loop_match(b,b->byte_code_buf+pos,&loop));
            op=OP_get_loc0+loop.i;bc_buf[pos]=op;
        }
'''
    if bits:
        normalization='''        if (op == OP_int_loop_bits) {
            ExBits bits;assert(ex_bits_match(b,b->byte_code_buf+pos,&bits));
            op=OP_get_loc0+bits.m;bc_buf[pos]=op;
        }
'''
    q=once(q,anchor,normalization+anchor)
    reject='op == OP_field_rmw_i32 || op == OP_field_rmw_i32_wide || ' if rmw else 'op == OP_int_loop_kernel || '
    if label=='FIELD_RMW_UPDATE':reject+='op == OP_field_rmw_update || '
    if bits:reject='op == OP_int_loop_bits || '
    anchor='        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {'
    q=once(q,anchor,anchor.replace('if (','if ('+reject,1))
    changed['quickjs.c']=q
    prep=changed['read_ic_prepare.inc']
    prep=once(prep,'    if (!count) return 0;','    if (!count && !ex_has_candidates(b)) return 0;')
    prep=once(prep,'    assert(index == count);','    assert(index == count);\n    ex_prepare(b);')
    changed['read_ic_prepare.inc']=prep
    if label=='FIELD_RMW_UPDATE':
        changed['read_ic_opcodes.inc']=once(changed['read_ic_opcodes.inc'],'        CASE(OP_get_field2_rdi):','        CASE(OP_get_field2_rdi):\n        ex_rmw_field2_fallback:')
    ops=changed['quickjs-opcode.h']
    additions=('DEF(field_rmw_i32, 1, 0, 1, none)\nDEF(field_rmw_i32_wide, 3, 0, 1, u16)\n' if rmw else 'DEF(int_loop_kernel, 1, 0, 1, none)\n')
    if label=='FIELD_RMW_UPDATE':additions+='DEF(field_rmw_update, 5, 1, 2, u32)\n'
    if bits:additions='DEF(int_loop_bits, 1, 0, 1, none)\n'
    ops=once(ops,'#undef DEF\n#undef def\n#endif  /* DEF */',additions+'#undef DEF\n#undef def\n#endif  /* DEF */')
    changed['quickjs-opcode.h']=ops
    changed['execution_helpers.inc']=helpers
    changed['execution_handlers.inc']=(HERE/'execution_handlers.inc').read_text()+'\n#ifdef EX_BITS\n'+(HERE/'loop_bits_handlers.inc').read_text()+'\n#endif\n'
    if diagnostic:
        c=changed['quickjs-libc.c']
        anchor='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
        c=once(c,anchor,'''extern void ex_begin(void);extern void ex_end(void);
static JSValue js_ex_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v) { ex_begin();return JS_UNDEFINED; }
static JSValue js_ex_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v) { ex_end();return JS_UNDEFINED; }
'''+anchor)
        anchor='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
        c=once(c,anchor,anchor+'''
    JS_SetPropertyStr(ctx,global_obj,"__ex_begin",JS_NewCFunction(ctx,js_ex_begin,"__ex_begin",0));
    JS_SetPropertyStr(ctx,global_obj,"__ex_end",JS_NewCFunction(ctx,js_ex_end,"__ex_end",0));''')
        changed['quickjs-libc.c']=c
    return original,changed


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('label',choices=['FIELD_RMW_I32','FIELD_RMW_CONST','FIELD_RMW_UPDATE','INT_LOOP_KERNEL','INT_LOOP_BITS','TRANSITION_EDGE'])
    parser.add_argument('--diagnostic',action='store_true')
    parser.add_argument('--sanitize',action='store_true')
    parser.add_argument('--refresh',action='store_true',help='only before this label is frozen')
    args=parser.parse_args()
    kind='diag' if args.diagnostic else 'san' if args.sanitize else 'release'
    name=args.label+'.'+kind
    tooling=HERE/'tooling'/name
    tooling.mkdir(parents=True,exist_ok=True)
    for filename in ['build.py','execution_helpers.inc','execution_handlers.inc','loop_bits_helpers.inc','loop_bits_handlers.inc','edge_helpers.inc']:
        if (HERE/filename).exists() and not (tooling/filename).exists():(tooling/filename).write_bytes((HERE/filename).read_bytes())
    dest=HERE/'work'/name
    original,changed=source(args.label,args.diagnostic)
    assert not (HERE/'frozen'/(name+'.json')).exists(),'frozen build cannot be changed'
    if args.refresh:
        assert dest.is_dir()
        for suffix in ['build.log','manifest.json']:
            old=HERE/(name+'.'+suffix)
            if old.exists(): old.rename(HERE/(name+'.initial.'+suffix))
    else:
        dest.mkdir(parents=True,exist_ok=False)
    patch=[]
    for filename,content in changed.items():
        target=dest/('compat/test-closefrom.c' if filename=='test-closefrom.c' else filename)
        target.parent.mkdir(exist_ok=True,parents=True)
        if not target.exists() or target.read_text()!=content: target.write_text(content)
        if original.get(filename)!=content:
            patch.extend(difflib.unified_diff(original.get(filename,'').splitlines(True),content.splitlines(True),fromfile='a/'+filename,tofile='b/'+filename))
    (HERE/'patches').mkdir(exist_ok=True)
    (HERE/'patches'/(name+'.patch')).write_text(''.join(patch))
    flags=['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if args.sanitize else []
    command=['make','-j2','-o','repl.c',*flags,'qjs','qjsc']
    with (HERE/(name+'.build.log')).open('w') as log:
        result=subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,timeout=300)
    assert result.returncode==0,'see '+name+'.build.log'
    manifest=dict(label=args.label,kind=kind,elf=str(dest/'qjs'),elf_sha256=sha(dest/'qjs'),
        source_archive_sha256=sha(PORT/'quickjs-eval-cold-source.tar.gz'),
        sources={n:sha(dest/('compat/test-closefrom.c' if n=='test-closefrom.c' else n)) for n in changed},
        builder_sha256=sha(Path(__file__)),command=command)
    (HERE/(name+'.manifest.json')).write_text(json.dumps(manifest,indent=2)+'\n')
    print('BUILD_PASS',name,flush=True)


if __name__=='__main__':main()

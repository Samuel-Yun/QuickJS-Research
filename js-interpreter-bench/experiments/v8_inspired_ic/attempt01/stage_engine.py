"""Deterministic mechanical integration into a fresh copy of fixed A, never A itself.
Run in WSL. Files/lines are assertions, not permissive regex substitutions.
"""
import argparse, difflib, hashlib, json, os, shutil, subprocess, time
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
BUILD=Path('/home/mzyx/v8_inspired_ic_attempt01')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    if not isinstance(x,str):x=json.dumps(x,ensure_ascii=False,indent=2)+'\n'
    assert not p.exists(),str(p)
    p.write_text(x,encoding='utf-8')
def integrate(text):
    def sub(a,b):
        nonlocal text
        assert text.count(a)==1,(a[:90],text.count(a))
        text=text.replace(a,b)
    sub('typedef struct JSFunctionBytecode {','#include "eic_types.h"\n\ntypedef struct JSFunctionBytecode {')
    sub('    int closure_var_count;\n    struct {','    int closure_var_count;\n    EICMeta *eic_meta;\n    EICSite *eic_sites;\n    uint32_t eic_count;\n    uint8_t eic_heat;\n    struct {')
    sub('static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b);','static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b);\nstatic int eic_prepare(JSContext *ctx, JSFunctionBytecode *b);')
    sub('/* indicate that the object may be part of a function prototype cycle */','#include "eic_runtime.inc"\n\n/* indicate that the object may be part of a function prototype cycle */')
    sub('            if (b->realm)\n                mark_func(rt, &b->realm->header);','            eic_mark(rt,b,mark_func);\n            if (b->realm)\n                mark_func(rt, &b->realm->header);')
    sub('        CASE(OP_get_field):\n            GET_FIELD_INLINE', '#include "eic_opcodes.inc"\n\n        CASE(OP_get_field):\n            GET_FIELD_INLINE')
    sub('static void free_bytecode_atoms(JSRuntime *rt,','#include "eic_prepare.inc"\n\nstatic void free_bytecode_atoms(JSRuntime *rt,')
    sub('    js_free(ctx, fd);\n    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);','    js_free(ctx, fd);\n    if(eic_prepare(ctx,b)<0) {\n        JS_FreeValue(ctx,JS_MKPTR(JS_TAG_FUNCTION_BYTECODE,b));\n        return JS_EXCEPTION;\n    }\n    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);')
    sub('    if (b->byte_code_buf)\n        free_bytecode_atoms','    eic_free(rt,b);\n    if (b->byte_code_buf)\n        free_bytecode_atoms')
    sub('const uint8_t *bc_buf1, int bc_len)','const uint8_t *bc_buf1, int bc_len, JSFunctionBytecode *b)')
    sub('if (JS_WriteFunctionBytecode(s, b->byte_code_buf, b->byte_code_len))','if (JS_WriteFunctionBytecode(s, b->byte_code_buf, b->byte_code_len,b))')
    start=text.index('static int JS_WriteFunctionBytecode(');end=text.index('\nstatic ',start+10)
    segment=text[start:end]
    a='        op = bc_buf[pos];\n        len = short_opcode_info(op).size;'
    assert segment.count(a)==1
    segment=segment.replace(a,'''        op = bc_buf[pos];
        if(op==OP_get_field_eic || op==OP_get_field2_eic || op==OP_put_field_eic) {
            uint32_t index=get_u32(bc_buf+pos+1);
            assert(index<b->eic_count);
            op=op==OP_get_field_eic?OP_get_field:op==OP_get_field2_eic?OP_get_field2:OP_put_field;
            bc_buf[pos]=op;
            put_u32(bc_buf+pos+1,b->eic_meta[index].atom);
        }
        len = short_opcode_info(op).size;''')
    text=text[:start]+segment+text[end:]
    start=text.index('    if (s->is_rom_data) {',text.index('static int JS_ReadFunctionBytecode('))
    end=text.index('    b->byte_code_buf = bc_buf;',start)
    text=text[:start]+'''    /* Runtime operands are writable even when the caller supplies ROM input. */
    bc_buf=(uint8_t*)b+byte_code_offset;
    if(bc_get_buf(s,bc_buf,bc_len)) return -1;
'''+text[end:]
    start=text.index('static int JS_ReadFunctionBytecode(');end=text.index('\nstatic ',start+10)
    segment=text[start:end]
    assert segment.count(a)==1
    segment=segment.replace(a,'''        op = bc_buf[pos];
        if(op==OP_get_field_eic || op==OP_get_field2_eic || op==OP_put_field_eic) {
            b->byte_code_len=pos;
            JS_ThrowSyntaxError(s->ctx,"runtime IC opcode in serialized bytecode");
            return -1;
        }
        len = short_opcode_info(op).size;''')
    text=text[:start]+segment+text[end:]
    sub('    bc.read_only_bytecode = s->is_rom_data;','    bc.read_only_bytecode = FALSE; /* own mutable copy */')
    sub('    b->realm = JS_DupContext(ctx);\n    return obj;','    b->realm = JS_DupContext(ctx);\n    if(eic_prepare(ctx,b)<0) goto fail;\n    return obj;')
    # Diagnostic category counters only, physically absent in formal release.
    for opname,field in [('get_array_el','keyed_read'),('get_array_el2','keyed_read'),('put_array_el','keyed_store'),('get_var','global_read'),('get_var_undef','global_read'),('put_var','global_store'),('put_var_strict','global_store')]:
        a='        CASE(OP_'+opname+'):'
        if a in text:sub(a,a+'\n            EIC_COUNT('+field+');')
    text+='\n#include "eic_diag.inc"\n'
    return text
def main():
    p=argparse.ArgumentParser();p.add_argument('kind',choices=['release','diagnostic','sanitizer']);a=p.parse_args()
    name={'release':'E','diagnostic':'E_diag','sanitizer':'E_san'}[a.kind];dest=BUILD/name
    manifest=json.loads((ROOT/'experiments/v8_ic_octane/attempt01/runtime.json').read_text())
    base=Path(manifest['quickjs']['source']);expected=manifest['quickjs']['source_files']
    assert sha(base/'qjs')==manifest['quickjs']['binary']['sha256']
    assert not dest.exists(),'separate build directory already exists; do not overwrite'
    dest.mkdir(parents=True)
    sources={}
    for f,h in expected.items():
        src=base/f;assert sha(src)==h,(f,'base identity')
        out=dest/f;out.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,out)
        sources[f]=h
    old=(dest/'quickjs.c').read_text();new=integrate(old);(dest/'quickjs.c').write_text(new)
    op=dest/'quickjs-opcode.h';s=op.read_text();a0='#undef DEF\n#undef def'
    assert s.count(a0)==1
    s=s.replace(a0,'/* E runtime-only opcodes. Disk writer restores original atoms/opcodes. */\nDEF(get_field_eic,5,1,1,u32)\nDEF(get_field2_eic,5,1,2,u32)\nDEF(put_field_eic,5,2,0,u32)\n\n'+a0);op.write_text(s)
    for f in (HERE/'engine').glob('eic_*'):shutil.copyfile(f,dest/f.name)
    if a.kind=='diagnostic':
        q=dest/'qjs.c';s=q.read_text();s=s.replace('    JS_FreeRuntime(rt);','    JS_FreeRuntime(rt);\n    extern void JS_EICDumpStats(void); JS_EICDumpStats();');q.write_text(s)
    changes={f:sha(dest/f) for f in ['quickjs.c','quickjs-opcode.h','qjs.c','Makefile',*[p.name for p in (HERE/'engine').glob('eic_*')]]}
    diff=''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c'))
    original=(base/'quickjs-opcode.h').read_text()
    diff+=''.join(difflib.unified_diff(original.splitlines(True),s0.splitlines(True),fromfile='a/quickjs-opcode.h',tofile='b/quickjs-opcode.h')) if False else ''.join(difflib.unified_diff(original.splitlines(True),op.read_text().splitlines(True),fromfile='a/quickjs-opcode.h',tofile='b/quickjs-opcode.h'))
    if a.kind=='release':save(HERE/'engine/A_to_E_integration.patch',diff)
    env=os.environ.copy();cmd=['make','-j2','qjs','qjsc','libquickjs.a']
    if a.kind=='diagnostic':cmd+=['DEFINES=-D_GNU_SOURCE -DCONFIG_VERSION=\\"2026-06-04\\" -DHAVE_CLOSEFROM -DEIC_DIAGNOSTIC']
    if a.kind=='sanitizer':cmd+=['CFLAGS=-g -O1 -Wall -fwrapv -D_GNU_SOURCE -DCONFIG_VERSION=\\"2026-06-04\\" -DHAVE_CLOSEFROM -fsanitize=address,undefined -fno-omit-frame-pointer','LDFLAGS=-g -fsanitize=address,undefined']
    started=time.time();r=subprocess.run(cmd,cwd=dest,env=env,capture_output=True,text=True)
    save(HERE/f'raw/build/{name}.log',r.stdout+r.stderr)
    save(HERE/f'raw/build/{name}.json',dict(command=cmd,cwd=str(dest),exit_code=r.returncode,seconds=time.time()-started,base_files=sources,modified_source_hashes=changes,binary_sha256=sha(dest/'qjs') if (dest/'qjs').exists() else None,compiler=subprocess.check_output(['gcc','--version'],text=True),kind=a.kind))
    print(name,'exit',r.returncode,'seconds',time.time()-started,flush=True)
    if r.returncode:print(r.stderr[-10000:])
    raise SystemExit(r.returncode)
if __name__=='__main__':main()

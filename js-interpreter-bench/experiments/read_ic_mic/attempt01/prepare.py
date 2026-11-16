"""Exact upstream restore and deterministic public-framework generation."""
import difflib,shutil,tarfile
from common import *
def one(s,a,b):assert s.count(a)==1,(a[:70],s.count(a));return s.replace(a,b,1)
def main():
    assert not STORE.exists(),'fresh IC_MIC_STORE required';STORE.mkdir(parents=True)
    archive=BASE_MATERIALS/'recovery/sources/base.tar.gz'
    index=read(BASE_MATERIALS/'recovery/archives.json');assert any(r.get('compressed_sha256')==sha(archive) for r in index)
    with tarfile.open(archive,'r:gz') as t:
        for x in t.getmembers():assert (STORE/'A'/x.name).resolve().is_relative_to((STORE/'A').resolve()) and not x.issym() and not x.islnk()
        t.extractall(STORE/'A')
    old=read(BASE_MATERIALS/'sources/identities.json')['files']['A']
    assert all(sha(STORE/'A'/f)==h for f,h in old.items())
    shutil.copytree(STORE/'A',STORE/'M')
    src=(STORE/'A/quickjs.c').read_text();s=src
    s=one(s,'typedef struct JSFunctionBytecode {','#include "read_ic_types.h"\n\ntypedef struct JSFunctionBytecode {')
    s=one(s,'    struct {\n        /* debug info, move to separate structure to save memory? */',
      '    ReadICSite *read_ic_sites;\n    uint32_t read_ic_count;\n    uint8_t read_ic_ready;\n#ifdef READ_IC_DIAGNOSTIC\n    RDIFunctionDiag *read_ic_diag;\n#endif\n    struct {\n        /* debug info, move to separate structure to save memory? */')
    s=one(s,'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b);',
      'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b);\nstatic int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b);')
    s=one(s,'/* indicate that the object may be part of a function prototype cycle */','#include "read_ic_runtime.inc"\n\n/* indicate that the object may be part of a function prototype cycle */')
    s=one(s,'            if (b->realm)\n                mark_func(rt, &b->realm->header);', '''            for (uint32_t ri = 0; ri < b->read_ic_count; ri++) {
#if RDI_CAPACITY == 1
                if (b->read_ic_sites[ri].shape)
                    mark_func(rt, &b->read_ic_sites[ri].shape->header);
#else
                for (unsigned rj = 0; rj < 4; rj++)
                    if (b->read_ic_sites[ri].shape[rj])
                        mark_func(rt, &b->read_ic_sites[ri].shape[rj]->header);
#endif
            }
            if (b->realm)
                mark_func(rt, &b->realm->header);''')
    s=one(s,'        CASE(OP_get_field):\n            GET_FIELD_INLINE', '#include "read_ic_opcodes.inc"\n\n        CASE(OP_get_field):\n            GET_FIELD_INLINE')
    s=one(s,'static void free_bytecode_atoms(JSRuntime *rt,','#include "read_ic_prepare.inc"\n\nstatic void free_bytecode_atoms(JSRuntime *rt,')
    s=one(s,'    js_free(ctx, fd);\n    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);',
      '    js_free(ctx, fd);\n    if (rdi_prepare(ctx, b) < 0) {\n        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b));\n        return JS_EXCEPTION;\n    }\n    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);')
    s=one(s,'    if (b->byte_code_buf)\n        free_bytecode_atoms(rt, b->byte_code_buf, b->byte_code_len, TRUE);',
      '    rdi_free(rt, b);\n    if (b->byte_code_buf)\n        free_bytecode_atoms(rt, b->byte_code_buf, b->byte_code_len, TRUE);')
    s=one(s,'                                    const uint8_t *bc_buf1, int bc_len)',
      '                                    const uint8_t *bc_buf1, int bc_len, JSFunctionBytecode *b)')
    a=s.index('static int JS_WriteFunctionBytecode(');z=s.index('static void JS_WriteString',a);f=s[a:z]
    f=one(f,'        op = bc_buf[pos];\n        len = short_opcode_info(op).size;', '''        op = bc_buf[pos];
        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {
            uint32_t ri = get_u32(bc_buf + pos + 1);
            assert(ri < b->read_ic_count);
            op = (op == OP_get_field_rdi) ? OP_get_field : OP_get_field2;
            bc_buf[pos] = op;
            put_u32(bc_buf + pos + 1, b->read_ic_sites[ri].atom);
        }
        len = short_opcode_info(op).size;''');s=s[:a]+f+s[z:]
    s=one(s,'JS_WriteFunctionBytecode(s, b->byte_code_buf, b->byte_code_len)','JS_WriteFunctionBytecode(s, b->byte_code_buf, b->byte_code_len, b)')
    s=one(s,'    bc.read_only_bytecode = s->is_rom_data;','    bc.read_only_bytecode = FALSE; /* IC: own writable copy even for ROM input */')
    a=s.index('static int JS_ReadFunctionBytecode(');z=s.index('static JSValue JS_ReadBigInt',a);f=s[a:z]
    start=f.index('    if (s->is_rom_data) {');end=f.index('    b->byte_code_buf = bc_buf;',start)
    f=f[:start]+'''    bc_buf = (void *)((uint8_t*)b + byte_code_offset);
    if (bc_get_buf(s, bc_buf, bc_len)) return -1;
'''+f[end:]
    f=one(f,'        op = bc_buf[pos];\n        len = short_opcode_info(op).size;', '''        op = bc_buf[pos];
        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {
            b->byte_code_len = pos;
            JS_ThrowSyntaxError(s->ctx, "runtime read IC opcode in serialized bytecode");
            return -1;
        }
        len = short_opcode_info(op).size;''');s=s[:a]+f+s[z:]
    s=one(s,'    b->realm = JS_DupContext(ctx);\n    return obj;', '    b->realm = JS_DupContext(ctx);\n    if (rdi_prepare(ctx, b) < 0) goto fail;\n    return obj;')
    (STORE/'M/quickjs.c').write_text(s)
    op=(STORE/'A/quickjs-opcode.h').read_text();op=one(op,'#undef DEF\n#undef def','/* Post-finalization runtime opcodes; prior opcode values unchanged. */\nDEF(get_field_rdi, 5, 1, 1, u32)\nDEF(get_field2_rdi, 5, 1, 2, u32)\n\n#undef DEF\n#undef def')
    (STORE/'M/quickjs-opcode.h').write_text(op)
    for f in (HERE/'implementation').glob('*'):
        if f.is_file() and f.name in ['read_ic_types.h','read_ic_runtime.inc','read_ic_prepare.inc','read_ic_opcodes.inc']:
            shutil.copy2(f,STORE/'M'/f.name)
    (STORE/'M/read_ic_config.h').write_text('#define RDI_CAPACITY 1\n')
    # M prototype first; P is generated from exactly this shared source, one config change.
    shutil.copytree(STORE/'M',STORE/'P');(STORE/'P/read_ic_config.h').write_text('#define RDI_CAPACITY 4\n')
    patch=[]
    for p in sorted((STORE/'M').iterdir()):
        if not p.is_file():continue
        base=STORE/'A'/p.name
        oldtxt=base.read_text() if base.exists() else ''
        try:newtxt=p.read_text()
        except UnicodeError:continue
        if oldtxt!=newtxt:patch.extend(difflib.unified_diff(oldtxt.splitlines(True),newtxt.splitlines(True),fromfile='a/'+p.name if base.exists() else '/dev/null',tofile='b/'+p.name))
    save(HERE/'patches/A_to_common_M.patch',''.join(patch))
    save(HERE/'patches/M_to_P.patch','--- a/read_ic_config.h\n+++ b/read_ic_config.h\n@@ -1 +1 @@\n-#define RDI_CAPACITY 1\n+#define RDI_CAPACITY 4\n')
    ids={v:{p.relative_to(STORE/v).as_posix():sha(p) for p in sorted((STORE/v).rglob('*')) if p.is_file()} for v in VERSIONS}
    assert [f for f in ids['P'] if ids['P'][f]!=ids['M'][f]]==['read_ic_config.h']
    # No old write IC admitted, upstream write opcode's source unchanged.
    def writebody(txt):return txt[txt.index('        CASE(OP_put_field):'):txt.index('        CASE(OP_private_symbol):')]
    assert writebody(src)==writebody(s)
    save(HERE/'sources/identities.json',dict(base='04be246001599f5995fa2f2d8c91a0f198d3f34c',source='https://github.com/bellard/quickjs',files=ids,
      P_M_differences=['read_ic_config.h'],write_opcode_source_identical=True,legacy_NG_runtime_imported=False,
      archive_sha256=sha(archive),A_raw_quickjs_sha256=sha(STORE/'A/quickjs.c'),A_LF_quickjs_sha256=digest(src.encode())))
    print('SOURCE_FRAMEWORK_GENERATED',flush=True)
if __name__=='__main__':main()

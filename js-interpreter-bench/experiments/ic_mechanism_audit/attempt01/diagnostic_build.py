"""Small aggregate A/B/M diagnostic builds; formal source is untouched."""
import difflib,shutil
from common import *
def one(s,a,b):assert s.count(a)==1,(a[:100],s.count(a));return s.replace(a,b,1)
def instrument(label,dst):
    p=dst/'quickjs.c';original=p.read_text();s=original
    # Names in opcode metadata only; DUMP_BYTECODE bits=0 prints no compile dump.
    s='#define DUMP_BYTECODE 0\n#define AUDIT_VARIANT '+str(dict(A=0,M=1,B=2)[label])+'\n'+s
    anchor='static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,'
    s=one(s,anchor,'#include "audit_hooks.h"\n\n'+anchor)
    for name,kind in [('find_own_property',0)]+([('find_own_property_ic',1)] if label=='B' else []):
        a=s.index('static force_inline JSShapeProperty'+(' *' if name=='find_own_property' else '* ')+name+'(')
        z=s.index('\n}',a)+2;body=s[a:z]
        body=one(body,'    sh = p->shape;','    audit_lookup('+str(kind)+');\n    sh = p->shape;')
        body=one(body,'    h = sh->hash_table[h];','    audit_bucket();\n    h = sh->hash_table[h];')
        body=one(body,'    while (h) {','    while (h) {\n        audit_chain();')
        s=s[:a]+body+s[z:]
    a=s.index('#define GET_FIELD_INLINE(');z=s.index('        CASE(OP_get_field):',a);body=s[a:z]
    body=one(body,'                JSValue val, obj;', '                AUDIT_SCOPE(b,pc-1);                                    \\\n                JSValue val, obj;')
    body=one(body,'                if (keep) {','                audit_value(val);                                       \\\n                if (keep) {')
    s=s[:a]+body+s[z:]
    s=one(s,'        CASE(OP_put_field):\n            {','        CASE(OP_put_field):\n            {\n                AUDIT_SCOPE(b,pc-1);')
    # Clear caller property context at every nested JS frame; cleanup restores it
    # across normal return, goto/exception and getter re-entry.
    pattern=r'(static JSValue JS_CallInternal\(JSContext \*caller_ctx,[^{}]+\)\n\{)'
    s,n=re.subn(pattern,r'\1\n    AuditScope audit_frame __attribute__((cleanup(audit_end)))=audit_pause();',s);assert n==1,n
    s=one(s,'    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);','    audit_register(ctx,b);\n    return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);')
    s=one(s,'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{','static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{\n    audit_free(b);')
    helper='JS_GetPropertyInternalIC' if label=='B' else 'JS_GetPropertyInternal'
    pattern=r'((?:static )?JSValue '+helper+r'\([^{};]+\)\n\{)'
    s,n=re.subn(pattern,r'\1\n    audit_generic();',s);assert n==1,(helper,n)
    if label=='B':
        s=one(s,'static uint32_t get_ic_prop_offset(', 'static void audit_probe(void);\nstatic uint32_t get_ic_prop_offset(')
        s=one(s,'        shape_slot = *(cr->shape + i);','        audit_probe();\n        shape_slot = *(cr->shape + i);')
        a=s.index('static JSValue JS_GetPropertyInternalWithIC(');z=s.index('static JSValue JS_ThrowTypeErrorPrivateNotFound',a);body=s[a:z]
        body=one(body,'    if (likely(offset != INLINE_CACHE_MISS))\n        return JS_DupValue(ctx, p->prop[offset].u.value);','    if (likely(offset != INLINE_CACHE_MISS)) { audit_hit();\n        return JS_DupValue(ctx, p->prop[offset].u.value); }')
        body=one(body,'slow_path:\n    return JS_GetPropertyInternalIC','slow_path:\n    audit_miss();\n    return JS_GetPropertyInternalIC');s=s[:a]+body+s[z:]
        for name in ['get_field_ic','get_field2_ic','put_field_ic']:
            s=one(s,'        CASE(OP_'+name+'):\n            {','        CASE(OP_'+name+'):\n            {\n                AUDIT_SCOPE(b,pc-1);')
        # Accepted values after each legacy read wrapper, not a getter/IC guess.
        needle='                val = JS_GetPropertyInternalWithIC(ctx, sp[-1], atom, sp[-1], &icu, FALSE);'
        assert s.count(needle)==2;s=s.replace(needle,needle+'\n                audit_value(val);')
        a=s.rindex('static void add_ic_slot(');z=s.index('\n}',a)+2;body=s[a:z]
        body=one(body,'{','{\n    audit_change(0);') if body.count('{')==1 else body.replace('{','{\n    audit_change(0);',1)
        body=one(body,'            cr->prop_offset[i] = prop_offset;','            audit_change(3);\n            cr->prop_offset[i] = prop_offset;')
        body=one(body,'    js_free_shape_null(ctx->rt, cr->shape[i]);','    audit_change(cr->shape[i] ? 2 : 1);\n    js_free_shape_null(ctx->rt, cr->shape[i]);')
        s=s[:a]+body+s[z:]
    s+='\n#include "audit_tail.inc"\n';p.write_text(s)
    if label=='M':
        p=dst/'read_ic_opcodes.inc';old=p.read_text();t=old
        t=one(t,'        uint32_t index = get_u32(pc), offset;', '        AUDIT_SCOPE(b,pc-1);                                          \\\n        uint32_t index = get_u32(pc), offset;')
        t=one(t,'                    RDI_COUNT(hits);','                    audit_hit(); RDI_COUNT(hits);')
        t=one(t,'        RDI_COUNT(fallback);','        audit_miss(); RDI_COUNT(fallback);')
        t=one(t,'    name ## _done:', '    name ## _done:                                                      \\\n        audit_value(val);')
        p.write_text(t)
        p=dst/'read_ic_runtime.inc';t=p.read_text()
        t=one(t,'    RDI_COUNT(comparisons);','    audit_probe(); RDI_COUNT(comparisons);') if t.count('    RDI_COUNT(comparisons);')==1 else t.replace('    RDI_COUNT(comparisons);','    audit_probe(); RDI_COUNT(comparisons);')
        t=one(t,'    RDI_COUNT(updates);','    audit_change(0); RDI_COUNT(updates);')
        t=one(t,'        s->prop_offset = offset;','        audit_change(3);\n        s->prop_offset = offset;')
        t=one(t,'    if (s->shape) { RDI_REPLACE(); } else { RDI_OCCUPY(); }','    audit_change(s->shape ? 2 : 1);\n    if (s->shape) { RDI_REPLACE(); } else { RDI_OCCUPY(); }');p.write_text(t)
    q=dst/'qjs.c';t=q.read_text();t=one(t,'int main(int argc, char **argv)','extern void audit_report(void);\nint main(int argc, char **argv)');t=one(t,'    return 0;\n fail:','    audit_report();\n    return 0;\n fail:');t=one(t,'    JS_FreeRuntime(rt);\n    return 1;','    JS_FreeRuntime(rt);\n    audit_report();\n    return 1;');q.write_text(t)
def main():
    m=verify_runtime();base=read(V8/'runtime.json')['quickjs']['source_files'];srcs=dict(A=Path(m['A_source']),M=Path(m['M_source']),B=Path(read(OLD/'build_manifest.json')['artifacts']['B']['source']))
    b=read(OLD/'build_manifest.json')['artifacts']['B'];assert sha(b['path'])==b['sha256']
    for name in ['quickjs.c','quickjs-opcode.h']:
        assert sha(srcs['B']/name)==sha(OLD/'artifacts/B'/name),name
    manifest={}
    for label in ['M','A','B']:
        dst=STORE/(label+'_diagnostic');attempt=1
        while dst.exists():attempt+=1;dst=STORE/(label+'_diagnostic'+str(attempt))
        names=read(HERE/'sources.json')['M_source_files'] if label=='M' else base
        for name in names:
            target=dst/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(srcs[label]/name,target)
        for name in ['audit_hooks.h','audit_tail.inc']:shutil.copy2(HERE/'diagnostic'/name,dst/name)
        originals={p.name:p.read_text() for p in dst.iterdir() if p.is_file() and p.name in ['quickjs.c','qjs.c','read_ic_opcodes.inc','read_ic_runtime.inc']}
        instrument(label,dst)
        patch=''.join(''.join(difflib.unified_diff(old.splitlines(True),(dst/name).read_text().splitlines(True),fromfile='a/'+name,tofile='b/'+name)) for name,old in originals.items())
        save(HERE/'diagnostic'/f'{label}_diagnostic_only{attempt}.patch',patch)
        r=capture(dst.name+'_build',['make','-j2','qjs'],dst);assert r['exit_code']==0
        manifest[label]=dict(binary=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),source_hashes={name:sha(dst/name) for name in [*originals,'audit_hooks.h','audit_tail.inc']},formal=False)
    save(HERE/'diagnostic_manifest.json',dict(artifacts=manifest,scope='whole process; aggregate by compiled instance and final opcode offset',lookup='actual logical entries and bucket/chain work inside original find_own_property and legacy find_own_property_ic; not native call count',contexts='GCC cleanup restores scopes; nested JS_CallInternal clears caller property context',per_access_clocks=False,performance_use=False))
    print('THREE_DIAGNOSTIC_BUILDS_READY',flush=True)
if __name__=='__main__':main()

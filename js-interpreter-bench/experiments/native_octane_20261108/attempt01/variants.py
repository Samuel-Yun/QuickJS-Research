"""Two single-factor transformations of the exact frozen P1+B2 parent."""
from pathlib import Path
import hashlib
import importlib.util
import json

H=Path(__file__).resolve().parent
ROOT=H.parents[2]
LAB=ROOT/'experiments/ic_search_lab'
PARENT=ROOT/'experiments/native_octane_20261107/attempt02'


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m


def once(text,old,new):
    assert text.count(old)==1,(text.count(old),old[:120])
    return text.replace(old,new,1)


def parent():
    g=module('frozen_seed',LAB/'v3_mass_search/generate.py')
    v=module('frozen_p1_b2',LAB/'v6_targeted_ic/variants.py')
    files=v.b2(v.prototype_method(g.seed('s001')))
    expected=json.loads((PARENT/'source_manifest.json').read_text())['files']
    assert {n:hashlib.sha256(t.encode()).hexdigest() for n,t in files.items()}==expected
    return files


def prep2(files):
    files=files.copy();p=files['read_ic_prepare.inc']
    start=p.index('    /* Walk actual final instruction boundaries')
    end=p.index('    assert(index == count);',start)
    p=p[:start]+p[end:]
    p=once(p,'''        op = *pc;
        if (op == OP_get_field || op == OP_get_field2) {''','''        op = *pc;
        /* The following instruction is still ordinary, not rewritten yet.
           Both replacements preserve instruction lengths and branch entries. */
        if ((op == OP_get_loc0 || op == OP_get_arg0) &&
            pos + 1 < b->byte_code_len && pc[1] == OP_get_field) {
            *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;
        }
        if (op == OP_get_field || op == OP_get_field2) {''')
    files['read_ic_prepare.inc']=p
    return files


def split16(files):
    files=files.copy()
    files['read_ic_types.h']='''/* Single allocation: layout header, own records, keep-receiver records. */
#include "read_ic_config.h"
#if RDI_CAPACITY != 1
#error split layout requires the frozen monomorphic configuration
#endif
typedef struct ReadICSite {
    JSShape *shape;
    uint32_t prop_offset;
    JSAtom atom;
} ReadICSite;
typedef struct ReadICMethodSite {
    ReadICSite base;
    JSShape *holder_shape;
} ReadICMethodSite;
typedef struct RDILayoutHeader {
    uint32_t own_count, keep_count;
} RDILayoutHeader;
typedef struct RDIFunctionDiag RDIFunctionDiag;
#define RDI_DPARAM
#define RDI_DARG(x)
#define RDI_COUNT(field) ((void)0)
#define RDI_REASON(field) ((void)0)
#define RDI_DLOCAL(index)
#define RDI_QUERY() ((void)0)
#define RDI_OCCUPY() ((void)0)
#define RDI_REPLACE() ((void)0)
'''
    q=files['quickjs.c']
    q=once(q,'} JSFunctionBytecode;','''} JSFunctionBytecode;

static inline RDILayoutHeader *rdi_layout(const JSFunctionBytecode *b)
{
    return b->read_ic_sites ? (RDILayoutHeader *)((uint8_t *)b->read_ic_sites - sizeof(RDILayoutHeader)) : NULL;
}
static inline uint32_t rdi_own_count(const JSFunctionBytecode *b)
{
    RDILayoutHeader *h = rdi_layout(b);
    return h ? h->own_count : 0;
}
static inline uint32_t rdi_keep_count(const JSFunctionBytecode *b)
{
    RDILayoutHeader *h = rdi_layout(b);
    return h ? h->keep_count : 0;
}
static inline ReadICMethodSite *rdi_method_sites(const JSFunctionBytecode *b)
{
    return b->read_ic_sites ? (ReadICMethodSite *)(b->read_ic_sites + rdi_own_count(b)) : NULL;
}''')
    start=q.index('            for (uint32_t ri = 0; ri < b->read_ic_count; ri++) {')
    end=q.index('            if (b->realm)',start)
    q=q[:start]+'''            for (uint32_t ri = 0; ri < rdi_own_count(b); ri++) {
                JSShape *shape = b->read_ic_sites[ri].shape;
                if (shape) mark_func(rt, &shape->header);
            }
            ReadICMethodSite *methods = rdi_method_sites(b);
            for (uint32_t ri = 0; ri < rdi_keep_count(b); ri++) {
                if (methods[ri].base.shape)
                    mark_func(rt, &methods[ri].base.shape->header);
                if (methods[ri].holder_shape)
                    mark_func(rt, &methods[ri].holder_shape->header);
            }
'''+q[end:]
    q=once(q,'            assert(site >= b->read_ic_sites && site < b->read_ic_sites + b->read_ic_count);','''            if (op == OP_get_field_rdi) {
                assert(site >= b->read_ic_sites && site < b->read_ic_sites + rdi_own_count(b));
            } else {
                ReadICMethodSite *m = (ReadICMethodSite *)site;
                assert(m >= rdi_method_sites(b) && m < rdi_method_sites(b) + rdi_keep_count(b));
            }''')
    files['quickjs.c']=q
    # Keep the parent's three preparation scans; this variant changes layout only.
    p=files['read_ic_prepare.inc']
    p=p.replace('uint32_t count = 0, index = 0;', 'uint32_t count = 0, index = 0, own_count = 0, keep_count = 0, own_index = 0, keep_index = 0;')
    p=p.replace('size_t code_size, total;', 'size_t code_size, total, metadata;\n    RDILayoutHeader *layout;\n    ReadICMethodSite *methods;')
    p=once(p,'        if (op == OP_get_field || op == OP_get_field2) count++;','''        if (op == OP_get_field) { count++; own_count++; }
        else if (op == OP_get_field2) { count++; keep_count++; }''')
    start=p.index('    if (count > (SIZE_MAX')
    end=p.index('    linked = js_mallocz(ctx, total);',start)
    p=p[:start]+'''    metadata = sizeof(RDILayoutHeader);
    if (own_count > (SIZE_MAX - metadata) / sizeof(ReadICSite)) goto overflow;
    metadata += (size_t)own_count * sizeof(ReadICSite);
    if (keep_count > (SIZE_MAX - metadata) / sizeof(ReadICMethodSite)) goto overflow;
    metadata += (size_t)keep_count * sizeof(ReadICMethodSite);
    if (code_size > SIZE_MAX - metadata) goto overflow;
    total = code_size + metadata;
    if (total > UINT32_MAX) goto overflow;
'''+p[end:]
    p=once(p,'    b->read_ic_sites = (ReadICSite *)(linked + code_size);','''    layout = (RDILayoutHeader *)(linked + code_size);
    layout->own_count = own_count;
    layout->keep_count = keep_count;
    b->read_ic_sites = (ReadICSite *)(layout + 1);
    methods = (ReadICMethodSite *)(b->read_ic_sites + own_count);''')
    p=once(p,'''            b->read_ic_sites[index].atom = get_u32(pc + 1);
            *pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;
            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));''','''            ReadICSite *site = (op == OP_get_field)
                ? &b->read_ic_sites[own_index++] : &methods[keep_index++].base;
            site->atom = get_u32(pc + 1);
            *pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;
            put_u32(pc + 1, (uint8_t *)site - (pc + 1));
            index++;''')
    p=once(p,'    assert(index == count);\n    return 0;', '''    assert(index == count && own_index == own_count && keep_index == keep_count);
    return 0;
overflow:
    JS_ThrowOutOfMemory(ctx);
    return -1;''')
    files['read_ic_prepare.inc']=p
    files['read_ic_runtime.inc']='''/* Ordinary hits retain a 16-byte record and direct PC-relative lookup. */
static force_inline uint32_t rdi_probe(ReadICSite *s, JSShape *shape)
{
    return s->shape == shape ? s->prop_offset : UINT32_MAX;
}
static force_inline void rdi_update(JSContext *ctx, ReadICSite *s,
                                    JSShape *shape, uint32_t offset)
{
    JSShape *old = s->shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old);
}
static force_inline void rdi_method_own_update(JSContext *ctx, ReadICSite *s,
                                    JSShape *shape, uint32_t offset)
{
    ReadICMethodSite *m = (ReadICMethodSite *)s;
    JSShape *old = s->shape, *old_holder = m->holder_shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->prop_offset = offset;
    m->holder_shape = NULL;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}
static void v6_proto_update(JSContext *ctx, ReadICSite *s, JSShape *receiver,
                            JSShape *holder, uint32_t offset)
{
    ReadICMethodSite *m = (ReadICMethodSite *)s;
    JSShape *old = s->shape, *old_holder = m->holder_shape;
    js_dup_shape(receiver);
    js_dup_shape(holder);
    s->shape = receiver;
    s->prop_offset = offset;
    m->holder_shape = holder;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}
static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)
{
    ReadICMethodSite *methods = rdi_method_sites(b);
    for (uint32_t i = 0; i < rdi_own_count(b); i++) {
        ReadICSite *s = &b->read_ic_sites[i];
        JS_FreeAtomRT(rt, s->atom);
        js_free_shape_null(rt, s->shape);
    }
    for (uint32_t i = 0; i < rdi_keep_count(b); i++) {
        ReadICMethodSite *m = &methods[i];
        JS_FreeAtomRT(rt, m->base.atom);
        js_free_shape_null(rt, m->holder_shape);
        js_free_shape_null(rt, m->base.shape);
    }
    if (b->read_ic_sites) {
        js_free_rt(rt, b->byte_code_buf);
        b->byte_code_buf = NULL;
    }
    b->read_ic_sites = NULL;
    b->read_ic_count = 0;
}
'''
    op=files['read_ic_opcodes.inc']
    op=once(op,'        ReadICSite *site = (ReadICSite *)(pc + delta);',
               '        ReadICSite *site = (ReadICSite *)(pc + delta);                   \\\n        ReadICMethodSite *method = (ReadICMethodSite *)site;')
    op=op.replace('site->holder_shape','method->holder_shape')
    op=once(op,'                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
      '''                        if (keep)                                     \\
                            rdi_method_own_update(ctx, site, p->shape, pr - p->prop); \\
                        else rdi_update(ctx, site, p->shape, pr - p->prop);''')
    files['read_ic_opcodes.inc']=op
    return files


def render(label):
    source=parent()
    return prep2(source) if label=='PREP2' else split16(source) if label=='SPLIT16' else source if label=='PARENT' else (_ for _ in ()).throw(KeyError(label))

"""Explicit, assertion-guarded mechanical port from pinned historical sources.

Only isolated output trees are written. This is not a new IC policy.
Generated unified diff is the reviewable/rebuildable patch.
"""
import argparse
import difflib
import hashlib
from pathlib import Path
import shutil
from prepare_sources import HERE, save

def one(s, old, new):
    assert s.count(old) == 1, (old[:150], s.count(old))
    return s.replace(old,new,1)

def between(s,a,b): return s[s.index(a):s.index(b,s.index(a))]

def transform():
    base=(HERE/'sources/base/quickjs.c').read_text()
    old=(HERE/'sources/ng_parent/quickjs.c').read_text()
    s=base
    structs=between(old,'#define IC_CACHE_ITEM_CAPACITY 4','typedef struct JSFunctionBytecode {')
    structs=structs.replace('endof(*shapes)','(*shapes + IC_CACHE_ITEM_CAPACITY)')
    s=one(s,'typedef struct JSFunctionBytecode {',structs+'typedef struct JSFunctionBytecode {')
    # The pointer must precede the optional debug tail (including stripped files).
    anchor='    int closure_var_count;\n'
    start=s.index('typedef struct JSFunctionBytecode {'); end=s.index('} JSFunctionBytecode;',start)
    chunk=s[start:end]; chunk=one(chunk,anchor,anchor+'    JSInlineCache *ic; /* NG legacy, per-function / atom */\n')
    s=s[:start]+chunk+s[end:]
    f=between(old,'static force_inline JSShapeProperty* find_own_property_ic','/* indicate that the object')
    f=f.replace('prop_hash_end(sh)[-h - 1]', 'sh->hash_table[h]')
    s=one(s,'/* indicate that the object may be part of a function prototype cycle */',f+'/* indicate that the object may be part of a function prototype cycle */')
    s=one(s,'            if (b->realm)\n                mark_func(rt, &b->realm->header);',
        '            if (b->realm)\n                mark_func(rt, &b->realm->header);\n'
        '            if (b->ic && b->ic->cache) {\n'
        '                uint32_t j, k;\n'
        '                for (j = 0; j < b->ic->count; j++)\n'
        '                    for (k = 0; k < IC_CACHE_ITEM_CAPACITY; k++)\n'
        '                        if (b->ic->cache[j].shape[k])\n'
        '                            mark_func(rt, &b->ic->cache[j].shape[k]->header);\n'
        '            }')
    # Generic read keeps the *current upstream* primitive/exotic/getter semantics.
    a=s.index('JSValue JS_GetPropertyInternal(JSContext *ctx, JSValueConst obj,')
    z=s.index('static JSValue JS_ThrowTypeErrorPrivateNotFound',a)
    f=s[a:z]
    f=one(f,'JSValue JS_GetPropertyInternal(', 'static JSValue JS_GetPropertyInternalIC(')
    f=one(f,'BOOL throw_ref_error)','BOOL throw_ref_error, JSInlineCacheUpdate *icu)')
    f=one(f,'    uint32_t tag;','    uint32_t tag, offset = 0, proto_depth = 0;')
    f=one(f,'prs = find_own_property(&pr, p, prop);','prs = find_own_property_ic(&pr, p, prop, &offset);')
    f=one(f,'            } else {\n                return JS_DupValue(ctx, pr->u.value);',
        '            } else {\n                if (proto_depth == 0)\n                    add_ic_slot(ctx, icu, prop, p, offset);\n                return JS_DupValue(ctx, pr->u.value);')
    f=one(f,'        p = p->shape->proto;','        proto_depth++;\n        p = p->shape->proto;')
    f+='''JSValue JS_GetPropertyInternal(JSContext *ctx, JSValueConst obj,
                               JSAtom prop, JSValueConst this_obj,
                               BOOL throw_ref_error)
{
    return JS_GetPropertyInternalIC(ctx, obj, prop, this_obj, throw_ref_error, NULL);
}

'''
    hit=between(old,'static JSValue JS_GetPropertyInternalWithIC','static JSValue JS_ThrowTypeErrorPrivateNotFound')
    hit=hit.replace('bool throw_ref_error','BOOL throw_ref_error')
    hit=hit.replace('JS_GetPropertyInternal2(ctx, obj, prop, this_obj, icu, throw_ref_error)',
                    'JS_GetPropertyInternalIC(ctx, obj, prop, this_obj, throw_ref_error, icu)')
    hit=hit.replace('return js_dup(p->prop[offset].u.value);','return JS_DupValue(ctx, p->prop[offset].u.value);')
    s=s[:a]+f+hit+s[z:]
    # Generic write API is retained; only the internal helper receives IC state.
    a=s.index('int JS_SetPropertyInternal(JSContext *ctx, JSValueConst obj,')
    z=s.index('\n/* flags can be JS_PROP_THROW',a)
    f=s[a:z]
    f=one(f,'int JS_SetPropertyInternal(', 'static int JS_SetPropertyInternalIC(')
    f=one(f,'JSValueConst this_obj, int flags)','JSValueConst this_obj, int flags, JSInlineCacheUpdate *icu)')
    f=one(f,'    uint32_t tag;','    uint32_t tag, offset = 0;')
    f=one(f,' retry:\n    prs = find_own_property(&pr, p1, prop);',' retry:\n    prs = find_own_property_ic(&pr, p1, prop, &offset);')
    f=one(f,'            /* fast case */\n            set_value',
        '            /* fast case */\n            add_ic_slot(ctx, icu, prop, p, offset);\n            set_value')
    f+='''
int JS_SetPropertyInternal(JSContext *ctx, JSValueConst obj, JSAtom prop,
                           JSValue val, JSValueConst this_obj, int flags)
{
    return JS_SetPropertyInternalIC(ctx, obj, prop, val, this_obj, flags, NULL);
}

static int JS_SetPropertyInternalWithIC(JSContext *ctx, JSValueConst obj,
                                      JSAtom prop, JSValue val, int flags,
                                      JSInlineCacheUpdate *icu)
{
    if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {
        JSObject *p = JS_VALUE_GET_OBJ(obj);
        uint32_t offset = get_ic_prop_offset(icu, p->shape);
        if (likely(offset != INLINE_CACHE_MISS)) {
            /* Minimal semantic fix: shared read/write atoms can insert a
               readonly data shape via a read. Do not bypass its descriptor. */
            JSShapeProperty *prs = &get_shape_prop(p->shape)[offset];
            if (likely((prs->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE |
                                      JS_PROP_LENGTH)) == JS_PROP_WRITABLE)) {
                set_value(ctx, &p->prop[offset].u.value, val);
                return TRUE;
            }
        }
    }
    return JS_SetPropertyInternalIC(ctx, obj, prop, val, obj, flags, icu);
}

static void rewrite_ic(JSContext *ctx, const uint8_t *pc,
                       const JSInlineCacheUpdate *icu, int opcode, JSAtom atom)
{
    if (icu->offset != INLINE_CACHE_MISS) {
        *((uint8_t *)pc - 5) = opcode;
        put_u32((uint8_t *)pc - 4, icu->offset);
        JS_FreeAtom(ctx, atom);
    }
}
'''
    s=s[:a]+f+s[z:]
    # Preserve the upstream inlined normal path, register only eligible own hits.
    a=s.index('#define GET_FIELD_INLINE(');z=s.index('        CASE(OP_private_symbol):',a)
    f=s[a:z]
    a2=f.index('        CASE(OP_put_field):');q=f[a2:];f=f[:a2]
    f=one(f,'                JSShapeProperty *prs;',
        '                uint32_t prop_offset = 0, proto_depth = 0;            \\\n'
        '                JSInlineCacheUpdate icu = { is_length ? NULL : b->ic, INLINE_CACHE_MISS }; \\\n'
        '                JSShapeProperty *prs;')
    f=one(f,'prs = find_own_property(&pr, p, atom);',
        'prs = is_length ? find_own_property(&pr, p, atom) :    \\\n'
        '                            find_own_property_ic(&pr, p, atom, &prop_offset);')
    f=one(f,'                            val = JS_DupValue(ctx, pr->u.value);',
        '                            if (!is_length && proto_depth == 0)         \\\n'
        '                                add_ic_slot(ctx, &icu, atom, p, prop_offset); \\\n'
        '                            val = JS_DupValue(ctx, pr->u.value);')
    f=one(f,'                        p = p->shape->proto;',
        '                        proto_depth++;                                 \\\n'
        '                        p = p->shape->proto;')
    f=one(f,'val = JS_GetPropertyInternal(ctx, obj, atom, sp[-1], 0);',
        'val = JS_GetPropertyInternalIC(ctx, obj, atom, sp[-1], 0, proto_depth ? NULL : &icu);')
    f=one(f,'                if (keep) {',
        '                if (!is_length)                                        \\\n'
        '                    rewrite_ic(ctx, pc, &icu, keep ? OP_get_field2_ic : OP_get_field_ic, atom); \\\n'
        '                if (keep) {')
    # Put path is not part of the macro above.
    q=one(q,'                JSShapeProperty *prs;',
        '                uint32_t prop_offset;\n'
        '                JSInlineCacheUpdate icu = { b->ic, INLINE_CACHE_MISS };\n'
        '                JSShapeProperty *prs;')
    q=one(q,'prs = find_own_property(&pr, p, atom);','prs = find_own_property_ic(&pr, p, atom, &prop_offset);')
    q=one(q,'                        /* fast path */\n                        set_value',
        '                        /* fast path */\n                        add_ic_slot(ctx, &icu, atom, p, prop_offset);\n                        set_value')
    q=one(q,'ret = JS_SetPropertyInternal(ctx, obj, atom, sp[-1], obj,\n                                                 JS_PROP_THROW_STRICT);',
        'ret = JS_SetPropertyInternalIC(ctx, obj, atom, sp[-1], obj,\n                                                 JS_PROP_THROW_STRICT, &icu);')
    q=one(q,'                \n            }','                rewrite_ic(ctx, pc, &icu, OP_put_field_ic, atom);\n            }')
    f+=q
    for op, keep in [('get_field_ic',False),('get_field2_ic',True)]:
        f+=f'''        CASE(OP_{op}):
            {{
                uint32_t index = get_u32(pc);
                JSInlineCacheUpdate icu = {{ b->ic, index }};
                JSAtom atom = get_ic_atom(b->ic, index);
                JSValue val;
                pc += 4;
                sf->cur_pc = pc;
                val = JS_GetPropertyInternalWithIC(ctx, sp[-1], atom, sp[-1], &icu, FALSE);
                if (unlikely(JS_IsException(val))) goto exception;
                assert(icu.offset == index);
'''+('                *sp++ = val;\n' if keep else '                JS_FreeValue(ctx, sp[-1]);\n                sp[-1] = val;\n')+'''            }
            BREAK;

'''
    f+='''        CASE(OP_put_field_ic):
            {
                uint32_t index = get_u32(pc);
                JSInlineCacheUpdate icu = { b->ic, index };
                JSAtom atom = get_ic_atom(b->ic, index);
                int ret;
                pc += 4;
                sf->cur_pc = pc;
                ret = JS_SetPropertyInternalWithIC(ctx, sp[-2], atom, sp[-1],
                                                   JS_PROP_THROW_STRICT, &icu);
                JS_FreeValue(ctx, sp[-2]);
                sp -= 2;
                if (unlikely(ret < 0)) goto exception;
                assert(icu.offset == index);
            }
            BREAK;

'''
    s=s[:a]+f+s[z:]
    # Per-function parse-time allocation / atom registry. Both emit APIs are used.
    a=s.index('typedef struct JSFunctionDef {');z=s.index('} JSFunctionDef;',a)
    s=s[:z]+'    JSInlineCache *ic; /* legacy parse-time registry */\n'+s[z:]
    emit=between(old,'static force_inline uint32_t get_index_hash','static int update_label')
    emit=emit.replace('    ic = s->cur_func->ic;', '    ic = s->cur_func->ic;\n    if (!ic) return;')
    emit=emit.replace('    if (ic->count + 1 >= ic->capacity && resize_ic_hash(ctx, ic))\n        return;',
        '    if (ic->count + 1 >= ic->capacity && resize_ic_hash(ctx, ic)) {\n        s->cur_func->byte_code.error = 1;\n        return;\n    }')
    emit=emit.replace('    if (unlikely(!ch))\n        return;',
        '    if (unlikely(!ch)) { s->cur_func->byte_code.error = 1; return; }')
    registry='''static void register_ic_operand(JSParseState *s, uint32_t atom)
{
    JSFunctionDef *fd = s->cur_func;
    if (fd->last_opcode_pos >= 0 &&
        fd->byte_code.size == fd->last_opcode_pos + 1) {
        int op = fd->byte_code.buf[fd->last_opcode_pos];
        if (op == OP_get_field || op == OP_get_field2 || op == OP_put_field ||
            op == OP_get_field_opt_chain)
            emit_ic(s, atom);
    }
}

'''
    s=one(s,'static void emit_u32(JSParseState *s, uint32_t val)',emit+registry+'static void emit_u32(JSParseState *s, uint32_t val)')
    s=one(s,'    dbuf_put_u32(&s->cur_func->byte_code, val);',
        '    register_ic_operand(s, val);\n    dbuf_put_u32(&s->cur_func->byte_code, val);')
    s=one(s,'    put_u32(bc->buf + bc->size, JS_DupAtom(s->ctx, name));',
        '    register_ic_operand(s, name);\n    put_u32(bc->buf + bc->size, JS_DupAtom(s->ctx, name));')
    # Prototype for cleanup is needed before the actual allocator.
    anchor='static JSFunctionDef *js_new_function_def(JSContext *ctx,'
    idx=s.index(anchor)
    s=s[:idx]+'static void js_free_function_def(JSContext *ctx, JSFunctionDef *fd);\n\n'+s[idx:]
    s=one(s,'    fd->last_opcode_source_ptr = source_ptr;\n    return fd;',
        '    fd->last_opcode_source_ptr = source_ptr;\n'
        '    fd->ic = init_ic(ctx);\n'
        '    if (!fd->ic) { js_free_function_def(ctx, fd); return NULL; }\n'
        '    return fd;')
    s=one(s,'    js_free(ctx, fd->line_number_slots);',
        '    js_free(ctx, fd->line_number_slots);\n    if (fd->ic) free_ic(ctx->rt, fd->ic);')
    s=one(s,'    if (fd->strip_debug) {\n        function_size = offsetof(JSFunctionBytecode, debug);',
        '    if (rebuild_ic(ctx, fd->ic)) goto fail;\n\n'
        '    if (fd->strip_debug) {\n        function_size = offsetof(JSFunctionBytecode, debug);')
    a=s.index('static JSValue js_create_function(JSContext *ctx, JSFunctionDef *fd)');z=s.index('static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{',a)
    f=one(s[a:z],'    b->realm = JS_DupContext(ctx);',
        '    b->realm = JS_DupContext(ctx);\n'
        '    b->ic = fd->ic;\n    fd->ic = NULL;\n'
        '    if (!b->ic->count) { free_ic(ctx->rt, b->ic); b->ic = NULL; }')
    s=s[:a]+f+s[z:]
    s=one(s,'    if (b->vardefs) {\n        for(i = 0; i < b->arg_count + b->var_count; i++) {',
        '    if (b->ic) free_ic(rt, b->ic);\n\n'
        '    if (b->vardefs) {\n        for(i = 0; i < b->arg_count + b->var_count; i++) {')
    # Serialization uses the same legacy de-IC mapping but upstream writer API.
    s=one(s,'const uint8_t *bc_buf1, int bc_len)\n{\n    int pos, len, op;',
        'const JSFunctionBytecode *b)\n{\n'
        '    const uint8_t *bc_buf1 = b->byte_code_buf;\n'
        '    int bc_len = b->byte_code_len;\n    int pos, len, op;')
    s=one(s,'JS_WriteFunctionBytecode(s, b->byte_code_buf, b->byte_code_len)',
        'JS_WriteFunctionBytecode(s, b)')
    a=s.index('static int JS_WriteFunctionBytecode(');z=s.index('static void JS_WriteString',a)
    f=s[a:z]
    f=one(f,'        default:\n            break;', '''        default:
            if (op >= OP_get_field_ic && op <= OP_put_field_ic) {
                atom = get_ic_atom(b->ic, get_u32(bc_buf + pos + 1));
                if (bc_atom_to_idx(s, &val, atom)) goto fail;
                put_u32(bc_buf + pos + 1, val);
                bc_buf[pos] = op - OP_get_field_ic + OP_get_field;
            }
            break;''')
    s=s[:a]+f+s[z:]
    # Preserve the exact core allocation/probe/update/free functions.
    impl=between(old,'/* Poly IC */','/* CallSite */')
    impl=impl.replace('endof(*shapes)','(*shapes + IC_CACHE_ITEM_CAPACITY)')
    # Minimal OOM fix: a partially allocated ring has no valid entries to free.
    impl=impl.replace('ic = js_malloc(ctx, sizeof(JSInlineCache));','ic = js_mallocz(ctx, sizeof(JSInlineCache));')
    impl=impl.replace('    if (ic->cache) {','    if (ic->cache) {')
    s+='\n/* Ported from quickjs-ng e1b5978775f75f9637c624fc45e69b92d2c15f42.\n'
    s+=' * Copyright (c) 2023-2025 QuickJS-NG contributors; MIT license: see LICENSE.NG. */\n'+impl
    h=(HERE/'sources/base/quickjs-opcode.h').read_text()
    h=one(h,'\n#undef DEF\n#undef def',
        '\n/* Legacy NG IC opcodes, same-size runtime rewrites. */\n'
        'DEF(      get_field_ic, 5, 1, 1, none)\n'
        'DEF(     get_field2_ic, 5, 1, 2, none)\n'
        'DEF(      put_field_ic, 5, 2, 0, none)\n\n#undef DEF\n#undef def')
    return {'quickjs.c':s,'quickjs-opcode.h':h}

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--destination',type=Path,required=True)
    args=ap.parse_args();dest=args.destination.resolve()
    assert not dest.exists(), 'fresh tree required'
    modified=transform()
    shutil.copytree(HERE/'sources/base',dest)
    patch=''
    for name,new in modified.items():
        original=(HERE/'sources/base'/name).read_text()
        # Explicit bulk mechanical rewrite of only the isolated port output.
        (dest/name).write_text(new)
        patch+=''.join(difflib.unified_diff(original.splitlines(True),new.splitlines(True),
                        fromfile='a/'+name,tofile='b/'+name))
    shutil.copyfile(HERE/'sources/ng_parent/LICENSE',dest/'LICENSE.NG')
    save(HERE/'patches/legacy_ng_ic_port.v2.patch',patch)
    save(HERE/'source_evidence/port_source_hashes.v2.json',{
        p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in dest.glob('*') if p.is_file()})
    print('PORT_GENERATED',dest)

if __name__ == '__main__': main()

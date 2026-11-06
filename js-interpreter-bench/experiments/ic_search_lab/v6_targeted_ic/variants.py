"""Small independent source transformations from the frozen s001 seed."""
from pathlib import Path

H=Path(__file__).resolve().parent


def once(text, old, new):
    assert text.count(old)==1, (old[:120],text.count(old))
    return text.replace(old,new)


def patch_apply(files, patch):
    import re
    files=dict(files);lines=patch.splitlines(True);i=0
    while i<len(lines):
        assert lines[i].startswith('--- a/')
        name=lines[i][6:].strip();i+=1
        assert lines[i].startswith('+++ b/'+name);i+=1
        old=files.get(name,'').splitlines(True);out=[];cursor=0
        while i<len(lines) and not lines[i].startswith('--- a/'):
            m=re.match(r'@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@',lines[i]);assert m,lines[i]
            start=max(0,int(m[1])-1);assert start>=cursor
            out.extend(old[cursor:start]);cursor=start;i+=1;removed=added=0
            while i<len(lines) and lines[i][:1] in [' ','+','-'] and not lines[i].startswith('--- a/'):
                mark,value=lines[i][0],lines[i][1:]
                if mark in ' -':assert old[cursor]==value,(name,cursor);cursor+=1;removed+=1
                if mark in ' +':out.append(value);added+=1
                i+=1
            assert removed==int(m[2] or 1) and added==int(m[4] or 1)
        out.extend(old[cursor:]);files[name]=''.join(out)
    return files


def b2(files):
    # Same-length preparation. Only arg0/loc0+get_field_rdi pairs are selected.
    # The following field instruction remains a legal, original entry point.
    q=files['quickjs.c']
    macro='''/* Prepared-only borrowed load. Preparation proved the next instruction;
   the execution image is not rewritten after prepare. The original owning
   argument/local slot is untouched and no callback/allocation occurs here. */
#define V6_PREPARED_BORROW(slot) do {                                    \\
    JSValueConst receiver = (slot);                                    \\
    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {                   \\
        JSObject *object = JS_VALUE_GET_OBJ(receiver);                  \\
        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));      \\
        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && \\
            site->shape == object->shape) {                            \\
            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value); \\
            pc += 5;                                                   \\
            break;                                                     \\
        }                                                              \\
    }                                                                  \\
    *sp++ = JS_DupValue(ctx, receiver);                                 \\
} while (0)

'''
    q=once(q,'#if !DIRECT_DISPATCH\n#define SWITCH',macro+'#if !DIRECT_DISPATCH\n#define SWITCH')
    for kind,buf in [('loc','var'),('arg','arg')]:
        anchor=f'        CASE(OP_get_{kind}0): *sp++ = JS_DupValue(ctx, {buf}_buf[0]); BREAK;'
        q=once(q,anchor,anchor+f'\n        CASE(OP_v6_get_{kind}0): V6_PREPARED_BORROW({buf}_buf[0]); BREAK;')
    # Only write a copy, never alter a live image during serialization.
    anchor='''        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {
            uint32_t delta = get_u32(bc_buf + pos + 1);'''
    q=once(q,anchor,'''        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }
        if (op == OP_v6_get_arg0) { op = OP_get_arg0; bc_buf[pos] = op; }
'''+anchor)
    q=once(q,'''        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {
            b->byte_code_len = pos;''','''        if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||
            op == OP_v6_get_loc0 || op == OP_v6_get_arg0) {
            b->byte_code_len = pos;''')
    files['quickjs.c']=q
    files['quickjs-opcode.h']=once(files['quickjs-opcode.h'],'\n#undef DEF\n#undef def',
        '\nDEF(v6_get_loc0, 1, 0, 1, none)\nDEF(v6_get_arg0, 1, 0, 1, none)\n#undef DEF\n#undef def')
    files['read_ic_prepare.inc']=once(files['read_ic_prepare.inc'],'    assert(index == count);',
'''    /* Walk actual final instruction boundaries, never search operand bytes. */
    for (pos = 0; pos < b->byte_code_len; ) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        int size = short_opcode_info(op).size;
        if (size == 1 && pos + 1 < b->byte_code_len && pc[1] == OP_get_field_rdi) {
            if (op == OP_get_loc0) *pc = OP_v6_get_loc0;
            if (op == OP_get_arg0) *pc = OP_v6_get_arg0;
        }
        pos += size;
    }
    assert(index == count);''')
    return files


def id_control(files):
    # This control never changes the existing strong pointer IC guards/edges.
    q=files['quickjs.c']
    q=once(q,'struct JSShape {\n    JSGCObjectHeader header;',
           'struct JSShape {\n    JSGCObjectHeader header;\n    uint64_t v6_layout_id;')
    q=once(q,'    JSShape *sh = *psh;\n    JSShapeProperty *pr, *prop;',
           '    JSShape *sh = *psh;\n    JSShapeProperty *pr, *prop;')
    # A runtime-local counter, with zero permanently representing uncacheable.
    q=once(q,'    JSShape **shape_hash;', '    uint64_t v6_next_layout_id;\n    JSShape **shape_hash;')
    marker='/* create a new empty shape with prototype \'proto\'. It is not hashed */'
    helper='''static uint64_t v6_fresh_layout_id(JSRuntime *rt)
{
    if (rt->v6_next_layout_id == UINT64_MAX) return 0;
    return ++rt->v6_next_layout_id;
}

'''
    q=once(q,marker,helper+marker)
    q=once(q,'    sh->prop_count = 0;\n    sh->deleted_prop_count = 0;',
           '    sh->v6_layout_id = 0;\n    sh->prop_count = 0;\n    sh->deleted_prop_count = 0;')
    q=once(q,'    js_shape_hash_link(ctx->rt, sh);\n    return sh;',
           '    js_shape_hash_link(ctx->rt, sh);\n    sh->v6_layout_id = v6_fresh_layout_id(rt);\n    return sh;')
    q=once(q,'    sh->is_hashed = FALSE;\n    if (sh->proto)',
           '    sh->is_hashed = FALSE;\n    sh->v6_layout_id = 0;\n    if (sh->proto)')
    q=once(q,'    /* update the shape hash */\n    if (sh->is_hashed)',
           '    sh->v6_layout_id = 0; /* invalidate before allocation/mutation */\n    /* update the shape hash */\n    if (sh->is_hashed)')
    # Leave a changed shape at zero until an actual validated normal-data fill.
    # add_property's caller has not yet initialized the new JSProperty value.
    q=once(q,'    sh = *psh;\n    new_size = max_int(count, sh->prop_size * 3 / 2);',
           '    sh = *psh;\n    sh->v6_layout_id = 0;\n    new_size = max_int(count, sh->prop_size * 3 / 2);')
    q=once(q,'    sh = p->shape;\n    if (sh->is_hashed) {\n        if (js_rc(sh)->ref_count != 1)',
           '    sh = p->shape;\n    sh->v6_layout_id = 0;\n    if (sh->is_hashed) {\n        if (js_rc(sh)->ref_count != 1)')
    files['quickjs.c']=q
    files['read_ic_runtime.inc']=once(files['read_ic_runtime.inc'],'    RDI_COUNT(updates);',
        '    RDI_COUNT(updates);\n    if (!shape->v6_layout_id && shape->is_hashed)\n        shape->v6_layout_id = v6_fresh_layout_id(ctx->rt);')
    return files


def id_read(files):
    files=id_control(files)
    files['read_ic_types.h']=once(files['read_ic_types.h'], '    JSShape *shape;\n    uint32_t prop_offset;',
                                '    uint64_t layout_id;\n    uint32_t prop_offset;')
    r=files['read_ic_runtime.inc']
    r=once(r,'    if (s->shape == shape)\n        return s->prop_offset;',
           '    if (s->layout_id && shape->is_hashed && s->layout_id == shape->v6_layout_id)\n        return s->prop_offset;')
    start=r.index('#if RDI_CAPACITY == 1',r.index('static force_inline void rdi_update'))
    end=r.index('#else',start)
    r=r[:start]+'''#if RDI_CAPACITY == 1
    if (!shape->is_hashed || !shape->v6_layout_id) return;
    s->layout_id = shape->v6_layout_id;
    s->prop_offset = offset;
'''+r[end:]
    r=once(r,'        js_free_shape_null(rt, s->shape);','        /* Numeric runtime-local ID has no shape GC edge. */')
    files['read_ic_runtime.inc']=r
    q=files['quickjs.c']
    q=once(q,'''                if (b->read_ic_sites[ri].shape)
                    mark_func(rt, &b->read_ic_sites[ri].shape->header);''',
        '                /* Numeric layout ID is not a GC root. */')
    files['quickjs.c']=q
    return files


def lazy_three(files):
    q=files['quickjs.c']
    q=once(q,'    ReadICSite *read_ic_sites;', '    uint32_t v6_entry_count;\n    ReadICSite *read_ic_sites;')
    q=once(q,'''    if (rdi_prepare(ctx, b) < 0) {
        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b));
        return JS_EXCEPTION;
    }
''','')
    q=once(q,'    if (rdi_prepare(ctx, b) < 0) goto fail;\n','')
    anchor='    b = p->u.func.function_bytecode;\n\n    if (unlikely(argc < b->arg_count'
    entry='''    b = p->u.func.function_bytecode;
    /* Ordinary synchronous entry only. No live frame may retain the old PC.
       Generator/async suspended images never participate. */
    if (!b->read_ic_ready && b->func_kind == JS_FUNC_NORMAL) {
        if (b->v6_entry_count < 3) b->v6_entry_count++;
        if (b->v6_entry_count == 3) {
            JSStackFrame *active;
            for (active = rt->current_stack_frame; active; active = active->prev_frame) {
                JSValueConst f = active->cur_func;
                if (JS_VALUE_GET_TAG(f) == JS_TAG_OBJECT) {
                    JSObject *fo = JS_VALUE_GET_OBJ(f);
                    if (fo->class_id == JS_CLASS_BYTECODE_FUNCTION && fo->u.func.function_bytecode == b)
                        break;
                }
            }
            if (!active) rdi_prepare(caller_ctx, b);
        }
    }

    if (unlikely(argc < b->arg_count'''
    q=once(q,anchor,entry)
    files['quickjs.c']=q
    prep=files['read_ic_prepare.inc']
    prep=prep.replace('        JS_ThrowOutOfMemory(ctx);\n        return -1;', '        return 0; /* optional, ordinary image retained */')
    prep=once(prep,'    linked = js_mallocz(ctx, total);\n    if (!linked) return -1;',
              '    linked = js_mallocz_rt(ctx->rt, total);\n    if (!linked) return 0; /* no exception-state modification */')
    files['read_ic_prepare.inc']=prep
    return files


def extra_field_opcode(files, name, ordinary):
    files['quickjs-opcode.h']=once(files['quickjs-opcode.h'],'\n#undef DEF\n#undef def',
        f'\nDEF({name}, 5, 2, 0, u32)\n#undef DEF\n#undef def')
    p=files['read_ic_prepare.inc']
    p=p.replace('op == OP_get_field || op == OP_get_field2',
                f'op == OP_get_field || op == OP_get_field2 || op == OP_{ordinary}')
    p=once(p,'*pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;',
           f'*pc = (op == OP_{ordinary}) ? OP_{name} : ((op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi);')
    files['read_ic_prepare.inc']=p
    q=files['quickjs.c']
    q=once(q,'if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {\n            uint32_t delta',
           f'if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op == OP_{name}) {{\n            uint32_t delta')
    q=once(q,'op = (op == OP_get_field_rdi) ? OP_get_field : OP_get_field2;',
           f'op = (op == OP_{name}) ? OP_{ordinary} : ((op == OP_get_field_rdi) ? OP_get_field : OP_get_field2);')
    q=once(q,'if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {\n            b->byte_code_len = pos;',
           f'if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op == OP_{name}) {{\n            b->byte_code_len = pos;')
    files['quickjs.c']=q
    return files


def store_own(files):
    files=extra_field_opcode(files,'v6_put_field','put_field')
    code='''        CASE(OP_v6_put_field):
            {
                uint32_t delta = get_u32(pc), offset;
                ReadICSite *site = (ReadICSite *)(pc + delta);
                JSValue obj = sp[-2];
                JSAtom atom = site->atom;
                JSObject *p;
                JSProperty *pr;
                JSShapeProperty *prs;
                int ret;
                pc += 4;
                if (JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT) {
                    p = JS_VALUE_GET_OBJ(obj);
                    if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic) {
                        offset = rdi_probe(site, p->shape);
                        if (offset != UINT32_MAX) {
                            /* Publish before freeing the old value. No prop,
                               descriptor or shape pointer is reused below. */
                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);
                            goto v6_store_done;
                        }
                        prs = find_own_property(&pr, p, atom);
                        if (prs && (prs->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE |
                                                JS_PROP_LENGTH)) == JS_PROP_WRITABLE) {
                            set_value(ctx, &pr->u.value, sp[-1]);
                            /* A C finalizer may have changed/moved the target.
                               Refresh only this eligible active store site. */
                            p = JS_VALUE_GET_OBJ(obj);
                            if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic && p->shape->is_hashed) {
                                prs = find_own_property(&pr, p, atom);
                                if (prs && (prs->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE |
                                                        JS_PROP_LENGTH)) == JS_PROP_WRITABLE)
                                    rdi_update(ctx, site, p->shape, pr - p->prop);
                            }
                            goto v6_store_done;
                        }
                    }
                }
                sf->cur_pc = pc;
                ret = JS_SetPropertyInternal(ctx, obj, atom, sp[-1], obj, JS_PROP_THROW_STRICT);
                JS_FreeValue(ctx, obj);
                sp -= 2;
                if (unlikely(ret < 0)) goto exception;
                break;
            v6_store_done:
                JS_FreeValue(ctx, obj);
                sp -= 2;
            }
            BREAK;

'''
    # switch builds also require BREAK after the slow successful path.
    code=code.replace('                break;\n            v6_store_done:',
                      '                goto v6_store_finished;\n            v6_store_done:')
    code=code.replace('                sp -= 2;\n            }\n            BREAK;',
                      '                sp -= 2;\n            v6_store_finished:;\n            }\n            BREAK;')
    files['quickjs.c']=once(files['quickjs.c'],'        CASE(OP_put_field):',code+'        CASE(OP_put_field):')
    return files


def prototype_method(files):
    t=files['read_ic_types.h']
    t=once(t,'    JSShape *shape;\n    uint32_t prop_offset;',
           '    JSShape *shape;\n    JSShape *holder_shape;\n    uint32_t prop_offset;')
    files['read_ic_types.h']=t
    runtime=files['read_ic_runtime.inc']
    start=runtime.index('    RDI_COUNT(updates);')
    stop=runtime.index('\nstatic void rdi_free',start)
    runtime=runtime[:start]+'''    RDI_COUNT(updates);
    JSShape *old = s->shape, *old_holder = s->holder_shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->holder_shape = NULL;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}
static void v6_proto_update(JSContext *ctx, ReadICSite *s, JSShape *receiver,
                            JSShape *holder, uint32_t offset)
{
    JSShape *old = s->shape, *old_holder = s->holder_shape;
    js_dup_shape(receiver);
    js_dup_shape(holder);
    /* Publish before releases that can enter native finalizers. */
    s->shape = receiver;
    s->holder_shape = holder;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}
'''+runtime[stop:]
    runtime=once(runtime,'        js_free_shape_null(rt, s->shape);',
                 '        js_free_shape_null(rt, s->holder_shape);\n        js_free_shape_null(rt, s->shape);')
    files['read_ic_runtime.inc']=runtime
    q=files['quickjs.c']
    q=once(q,'''                if (b->read_ic_sites[ri].shape)
                    mark_func(rt, &b->read_ic_sites[ri].shape->header);''',
'''                if (b->read_ic_sites[ri].shape)
                    mark_func(rt, &b->read_ic_sites[ri].shape->header);
                if (b->read_ic_sites[ri].holder_shape)
                    mark_func(rt, &b->read_ic_sites[ri].holder_shape->header);''')
    files['quickjs.c']=q
    op=files['read_ic_opcodes.inc']
    anchor='                offset = rdi_probe(site, p->shape RDI_DARG(d));           \\\n'
    new='''                if (keep && site->holder_shape) {                       \\
                    JSObject *holder = p->shape->proto;                 \\
                    if (site->shape == p->shape && holder &&            \\
                        holder->class_id == JS_CLASS_OBJECT && !holder->is_exotic && \\
                        site->holder_shape == holder->shape) {          \\
                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value); \\
                        goto name ## _done;                            \\
                    }                                                  \\
                    offset = UINT32_MAX;                               \\
                } else {                                               \\
                    offset = rdi_probe(site, p->shape RDI_DARG(d));      \\
                }                                                      \\
'''
    op=once(op,anchor,new)
    anchor='                    if (p != origin) { RDI_REASON(inherited); }         \\\n'
    new='''                    if (p != origin) {                                 \\
                        RDI_REASON(inherited);                         \\
                        if (keep && p == origin->shape->proto &&       \\
                            origin->class_id == JS_CLASS_OBJECT && !origin->is_exotic && \\
                            p->class_id == JS_CLASS_OBJECT && !p->is_exotic && \\
                            origin->shape->is_hashed && p->shape->is_hashed) \\
                            v6_proto_update(ctx, site, origin->shape, p->shape, pr - p->prop); \\
                    }                                                  \\
'''
    op=once(op,anchor,new)
    files['read_ic_opcodes.inc']=op
    return files


def render(cid, files):
    files=dict(files)
    if cid=='B2':return b2(files)
    if cid=='ID_CTRL':return id_control(files)
    if cid=='ID_READ':return id_read(files)
    if cid=='L1':return lazy_three(files)
    if cid=='W1':return store_own(files)
    if cid=='P1':return prototype_method(files)
    if cid=='C1':
        files=prototype_method(files)
        q=files['quickjs.c']
        q=once(q,'        CASE(OP_call_method):\n        CASE(OP_tail_call_method):\n',
                 '        CASE(OP_call_method):\n        CASE(OP_tail_call_method):\n        v6_call_method_entry:\n')
        files['quickjs.c']=q
        op=files['read_ic_opcodes.inc']
        op=once(op,'        JSAtom atom;', '        int v6_prototype_hit = 0;                                      \\\n        JSAtom atom;')
        op=once(op,'                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);',
                    '                        v6_prototype_hit = 1;                           \\\n                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);')
        anchor='        else { JS_FreeValue(ctx, sp[-1]); sp[-1] = val; }                \\\n'
        op=once(op,anchor,anchor+'''        if (keep && v6_prototype_hit && pc[0] == OP_call_method &&       \\
            get_u16(pc + 1) == 0) {                                    \\
            /* Stack already owns receiver and the current callee. */   \\
            opcode = OP_call_method; pc++;                             \\
            goto v6_call_method_entry;                                 \\
        }                                                              \\
''')
        files['read_ic_opcodes.inc']=op
        return files
    if cid=='K1':
        files['read_ic_runtime.inc']=once(files['read_ic_runtime.inc'],
          'static force_inline void rdi_update(', 'static no_inline void rdi_update(')
        return files
    raise KeyError(cid)

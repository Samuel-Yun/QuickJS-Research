"""Additional public-source prototypes, loaded only after the initial build batch."""
DESIGNS = [
    dict(id='b01', route='B', parent='s001', title='Four guarded shapes share one field action',
         before='A conventional PIC stores a separate offset with each shape.',
         change='Keep16B primary and three cold strong shape guards with one shared verified offset; clear the group when the action changes.',
         cost='Linear secondary shape probes and conservative group clearing on a different offset.'),
    dict(id='b02', route='B', parent='s001', title='Eight guarded shapes share one field action',
         before='A four-shape action group can still replace frequently at wider sites.',
         change='Extend only the shared-action cold guard set to seven secondaries.',
         cost='More retained shapes and worst-case comparisons, no per-secondary offset.'),
    dict(id='e01', route='E', parent='s001', title='Own integer-result read opcode',
         before='An exact own-data hit rejoins a handler accepting all value types and misses.',
         change='Quicken after a proven exact hit to a guarded integer-result opcode; one failure restores the generic read IC before executing it.',
         cost='One result-tag guard and another handler; an alternating result can repeatedly specialize/deopt.'),
    dict(id='e02', route='E', parent='s001', title='Own immediate-result read opcode',
         before='Reference-free primitive results still pass through the generic value duplication form.',
         change='Specialize non-reference-counted values while retaining object, class, shape and current-value guards.',
         cost='A result-tag range check and handler layout; all owned result/reference semantics remain.'),
    dict(id='f01', route='F', parent='s001', title='Predecoded ordinary bytecode frame size',
         before='Each ordinary bytecode call adds/multiplies immutable var/stack/var-ref counts.',
         change='Prepare the immutable base frame byte size once per function; retain callee class, argument, interrupt and stack-overflow checks.',
         cost='One size_t per bytecode function and an extra cached metadata load; no cached closure/function value.'),
]


def render(cid, base):
    f = base.seed_module.seed('s001')
    if cid in ['b01', 'b02']:
        base.auxiliary(f, 3 if cid == 'b01' else 7, True)
        # A new shared action must invalidate every old guard before the primary offset can change.
        source = f['read_ic_runtime.inc']
        old = 'if (offset != s->prop_offset) { rdi_update(ctx, s, shape, offset); return; }'
        new = '''if (offset != s->prop_offset) {
        if (b->read_ic_side) {
            ReadICSide *side = &b->read_ic_side[s - b->read_ic_sites];
            for (unsigned k = 0; k < SIDE_COUNT; k++) {
                JSShape *old = side->shape[k];
                side->shape[k] = NULL;
                js_free_shape_null(ctx->rt, old);
            }
            side->victim = 0;
        }
        rdi_update(ctx, s, shape, offset);
        return;
    }'''
        f['read_ic_runtime.inc'] = base.once(source, old, new)
    elif cid in ['e01', 'e02']:
        name = 'rdi_integer' if cid == 'e01' else 'rdi_immediate'
        condition = 'JS_VALUE_GET_TAG(value) == JS_TAG_INT' if cid == 'e01' else '!JS_VALUE_HAS_REF_COUNT(value)'
        f['quickjs-opcode.h'] = base.once(f['quickjs-opcode.h'], '\n#undef DEF',
                '\nDEF(%s, 5, 1, 1, u32)\n#undef DEF' % name)
        source = f['read_ic_opcodes.inc']
        original = '                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\\n                    goto name ## _done;'
        replacement = '''                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    if (!(keep)) {                                     \\
                        JSValue value = val;                            \\
                        if (CONDITION) ((uint8_t *)pc)[-5] = OP_SPECIAL; \\
                    }                                                   \\
                    goto name ## _done;'''.replace('CONDITION', condition).replace('OP_SPECIAL', 'OP_' + name)
        source = base.once(source, original, replacement)
        specialized = '''        CASE(OP_SPECIAL):
            {
                ReadICSite *site = (ReadICSite *)(pc + get_u32(pc));
                JSValue receiver = sp[-1];
                if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {
                    JSObject *object = JS_VALUE_GET_OBJ(receiver);
                    if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic &&
                        site->shape == object->shape) {
                        JSValue value = object->prop[site->prop_offset].u.value;
                        if (CONDITION) {
                            pc += 4;
                            JS_FreeValue(ctx, receiver);
                            sp[-1] = value;
                            BREAK;
                        }
                    }
                }
                /* No operands consumed; preserve the original exception/ownership path. */
                ((uint8_t *)pc)[-1] = OP_get_field_rdi;
            }
            /* Intentional fall-through to the full original read IC. */
'''.replace('OP_SPECIAL', 'OP_' + name).replace('CONDITION', condition)
        f['read_ic_opcodes.inc'] = base.once(source, '        CASE(OP_get_field_rdi):', specialized + '        CASE(OP_get_field_rdi):')
        q = f['quickjs.c']
        anchor = 'if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {'
        # Runtime writer decodes the operand from this opcode just like get_field_rdi.
        assert q.count(anchor) == 2
        q = q.replace(anchor, 'if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op == OP_%s) {' % name)
        q = base.once(q, 'op = (op == OP_get_field_rdi) ? OP_get_field : OP_get_field2;',
                         'op = (op == OP_get_field2_rdi) ? OP_get_field2 : OP_get_field;')
        f['quickjs.c'] = q
    elif cid == 'f01':
        q = base.once(f['quickjs.c'], '    ReadICSite *read_ic_sites;',
                     '    size_t rdi_call_frame_bytes;\n    ReadICSite *read_ic_sites;')
        old = '''    alloca_size = sizeof(JSValue) * (arg_allocated_size + b->var_count +
                                     b->stack_size) +
        sizeof(JSVarRef *) * b->var_ref_count;'''
        q = base.once(q, old, '    alloca_size = sizeof(JSValue) * arg_allocated_size + b->rdi_call_frame_bytes;')
        f['quickjs.c'] = q
        f['read_ic_prepare.inc'] = base.once(f['read_ic_prepare.inc'], '    b->read_ic_ready = 1;',
            '''    b->rdi_call_frame_bytes = sizeof(JSValue) * ((size_t)b->var_count + b->stack_size) +
        sizeof(JSVarRef *) * b->var_ref_count;
    b->read_ic_ready = 1;''')
    else:
        raise KeyError(cid)
    return f

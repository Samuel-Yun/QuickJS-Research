"""Two independent run-time work reductions from frozen PREP2."""
from pathlib import Path
import hashlib
import importlib.util
import json

H = Path(__file__).resolve().parent
PREVIOUS = H.parent / 'attempt01'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    obj = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(obj)
    return obj


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:100])
    return text.replace(old, new, 1)


def parent():
    files = module('frozen_prep2', PREVIOUS / 'variants.py').render('PREP2')
    assert {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()} == json.loads((PREVIOUS / 'source_manifest.json').read_text())['PREP2']['files']
    return files


def chain2(files):
    files = files.copy()
    p = files['read_ic_prepare.inc']
    p = once(p, '''            *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;''', '''            if (pos + 6 < b->byte_code_len && pc[6] == OP_get_field)
                *pc = op == OP_get_loc0 ? OP_chain_get_loc0 : OP_chain_get_arg0;
            else
                *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;''')
    files['read_ic_prepare.inc'] = p
    q = files['quickjs.c']
    macro = '''/* Two own reads: the argument/local slot keeps the root alive.
   The root's ordinary property keeps the intermediate alive; no callback,
   allocation or interrupt point occurs before the final value is duplicated. */
#define EXP_BORROWED_CHAIN(slot) do {                                   \\
    JSValueConst receiver = (slot);                                    \\
    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {                   \\
        JSObject *object = JS_VALUE_GET_OBJ(receiver);                  \\
        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));      \\
        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && \\
            site->shape == object->shape) {                            \\
            JSValueConst middle = object->prop[site->prop_offset].u.value; \\
            if (JS_VALUE_GET_TAG(middle) == JS_TAG_OBJECT) {             \\
                JSObject *inner = JS_VALUE_GET_OBJ(middle);             \\
                ReadICSite *next = (ReadICSite *)(pc + 6 + get_u32(pc + 6)); \\
                if (inner->class_id == JS_CLASS_OBJECT && !inner->is_exotic && \\
                    next->shape == inner->shape) {                     \\
                    *sp++ = JS_DupValue(ctx, inner->prop[next->prop_offset].u.value); \\
                    pc += 10;                                         \\
                    break;                                            \\
                }                                                     \\
            }                                                         \\
            /* First hit only: retain the original B2 single-read path. */ \\
            *sp++ = JS_DupValue(ctx, middle);                           \\
            pc += 5;                                                  \\
            break;                                                    \\
        }                                                             \\
    }                                                                 \\
    *sp++ = JS_DupValue(ctx, receiver);                                 \\
} while (0)

'''
    q = once(q, '#if !DIRECT_DISPATCH\n#define SWITCH(pc)', macro + '#if !DIRECT_DISPATCH\n#define SWITCH(pc)')
    for kind, buf in [('arg', 'arg_buf'), ('loc', 'var_buf')]:
        anchor = f'        CASE(OP_v6_get_{kind}0): V6_PREPARED_BORROW({buf}[0]); BREAK;'
        q = once(q, anchor, anchor + f'\n        CASE(OP_chain_get_{kind}0): EXP_BORROWED_CHAIN({buf}[0]); BREAK;')
        anchor = f'        if (op == OP_v6_get_{kind}0) {{ op = OP_get_{kind}0; bc_buf[pos] = op; }}'
        q = once(q, anchor, anchor + f'\n        if (op == OP_chain_get_{kind}0) {{ op = OP_get_{kind}0; bc_buf[pos] = op; }}')
    files['quickjs.c'] = q
    files['quickjs-opcode.h'] = once(files['quickjs-opcode.h'], 'DEF(v6_get_arg0, 1, 0, 1, none)',
        'DEF(v6_get_arg0, 1, 0, 1, none)\nDEF(chain_get_loc0, 1, 0, 1, none)\nDEF(chain_get_arg0, 1, 0, 1, none)')
    return files


def read_store(files):
    files = files.copy()
    p = files['read_ic_prepare.inc']
    p = once(p, '    int pos, op;', '    int pos, op;\n    ReadICSite *last_read = NULL;')
    anchor = '''            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));
        }'''
    p = once(p, anchor, '''            last_read = &b->read_ic_sites[index];
            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));
        } else if (op == OP_put_field && last_read &&
                   get_u32(pc + 1) == last_read->atom) {
            /* The read site retains this atom. The rewritten write no longer does. */
            JS_FreeAtom(ctx, get_u32(pc + 1));
            *pc = OP_put_field_shared;
            put_u32(pc + 1, (uint8_t *)last_read - (pc + 1));
        }''')
    files['read_ic_prepare.inc'] = p
    q = files['quickjs.c']
    handler = '''        CASE(OP_put_field_shared):
            {
                ReadICSite *site = (ReadICSite *)(pc + get_u32(pc));
                JSValue obj = sp[-2];
                pc += 4;
                if (JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT) {
                    JSObject *p = JS_VALUE_GET_OBJ(obj);
                    if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic &&
                        site->shape == p->shape && !site->holder_shape) {
                        uint32_t offset = site->prop_offset;
                        JSShapeProperty *prs = &get_shape_prop(p->shape)[offset];
                        if ((prs->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE | JS_PROP_LENGTH)) == JS_PROP_WRITABLE) {
                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);
                            JS_FreeValue(ctx, obj);
                            sp -= 2;
                            BREAK;
                        }
                    }
                }
                sf->cur_pc = pc;
                int ret = JS_SetPropertyInternal(ctx, obj, site->atom, sp[-1], obj,
                                                JS_PROP_THROW_STRICT);
                JS_FreeValue(ctx, obj);
                sp -= 2;
                if (unlikely(ret < 0)) goto exception;
            }
            BREAK;

'''
    q = once(q, '        CASE(OP_put_field):\n', handler + '        CASE(OP_put_field):\n')
    q = once(q, '        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {',
                '        if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op == OP_put_field_shared) {')
    q = once(q, '            op = (op == OP_get_field_rdi) ? OP_get_field : OP_get_field2;',
                '            op = op == OP_put_field_shared ? OP_put_field : (op == OP_get_field_rdi ? OP_get_field : OP_get_field2);')
    files['quickjs.c'] = q
    files['quickjs-opcode.h'] = once(files['quickjs-opcode.h'], 'DEF(v6_get_arg0, 1, 0, 1, none)',
        'DEF(v6_get_arg0, 1, 0, 1, none)\nDEF(put_field_shared, 5, 2, 0, u32)')
    return files


def render(label):
    return {'CHAIN2': chain2, 'READ_STORE': read_store}[label](parent())

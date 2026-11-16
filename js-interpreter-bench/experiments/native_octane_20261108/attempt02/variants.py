"""Independent candidates from frozen PREP2; no runtime counters in release."""
from pathlib import Path
import hashlib
import importlib.util
import json

H = Path(__file__).resolve().parent
PREVIOUS = H.parent / 'attempt01'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:100])
    return text.replace(old, new, 1)


def parent():
    v = module('frozen_prep2_generator', PREVIOUS / 'variants.py')
    files = v.render('PREP2')
    actual = {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()}
    assert actual == json.loads((PREVIOUS / 'source_manifest.json').read_text())['PREP2']['files']
    return files


def coalloc(files):
    files = files.copy()
    p = files['read_ic_prepare.inc']
    p = '''/* Final source-compiled code is counted before the owning function allocation. */
static uint32_t rdi_count_fields(const uint8_t *code, int length)
{
    uint32_t count = 0;
    for (int pos = 0, op; pos < length; pos += short_opcode_info(op).size) {
        op = code[pos];
        if (op == OP_get_field || op == OP_get_field2) count++;
    }
    return count;
}
''' + p
    start = p.index('    assert(!b->read_ic_ready')
    end = p.index('    if (!count) return 0;', start)
    p = p[:start] + '''    int in_function = (b->read_ic_ready == 2);
    assert(!b->read_ic_ready || in_function);
    assert(in_function || !b->read_ic_sites);
    /* bit0=prepared; bit1=records owned by the function allocation. */
    b->read_ic_ready = in_function ? 3 : 1;
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_header_init();
#endif
    count = in_function ? b->read_ic_count : rdi_count_fields(b->byte_code_buf, b->byte_code_len);
''' + p[end:]
    start = p.index('    code_size = ')
    end = p.index('#ifdef READ_IC_DIAGNOSTIC\n    rdi_diag_prepare', start)
    block = p[start:end]
    p = p[:start] + '    if (!in_function) {\n' + ''.join('    ' + line if line.strip() else line for line in block.splitlines(True)) + '    }\n' + p[end:]
    files['read_ic_prepare.inc'] = p
    q = files['quickjs.c']
    q = once(q, '    uint8_t read_ic_ready;', '    uint8_t read_ic_ready; /* bit0 prepared, bit1 function-owned records */')
    q = once(q, '''    int function_size, byte_code_offset, cpool_offset;
    int closure_var_offset, vardefs_offset;
    BOOL strip_var_debug;''', '''    size_t function_size, byte_code_offset, cpool_offset;
    size_t closure_var_offset, vardefs_offset, sites_offset = 0;
    uint32_t field_count;
    BOOL strip_var_debug;''')
    q = once(q, '''    function_size += fd->byte_code.size;

    b = js_mallocz(ctx, function_size);''', '''    function_size += fd->byte_code.size;
    field_count = rdi_count_fields(fd->byte_code.buf, fd->byte_code.size);
    if (function_size > INT32_MAX - 7) {
        JS_ThrowOutOfMemory(ctx);
        goto fail;
    }
    if (field_count) {
        sites_offset = (function_size + 7) & ~(size_t)7;
        if (field_count > (INT32_MAX - sites_offset) / sizeof(ReadICSite)) {
            JS_ThrowOutOfMemory(ctx);
            goto fail;
        }
        function_size = sites_offset + (size_t)field_count * sizeof(ReadICSite);
    }

    b = js_mallocz(ctx, function_size);''')
    anchor = '''    b->byte_code_len = fd->byte_code.size;
    memcpy(b->byte_code_buf, fd->byte_code.buf, fd->byte_code.size);'''
    q = once(q, anchor, '''    b->byte_code_len = fd->byte_code.size;
    b->read_ic_ready = 2; /* count already known, final storage already owned */
    b->read_ic_count = field_count;
    if (field_count)
        b->read_ic_sites = (ReadICSite *)((uint8_t *)b + sites_offset);
    memcpy(b->byte_code_buf, fd->byte_code.buf, fd->byte_code.size);''')
    files['quickjs.c'] = q
    r = files['read_ic_runtime.inc']
    r = once(r, '    if (b->read_ic_sites) {\n        js_free_rt(rt, b->byte_code_buf);',
                '    if (b->read_ic_sites && !(b->read_ic_ready & 2)) {\n        js_free_rt(rt, b->byte_code_buf);')
    files['read_ic_runtime.inc'] = r
    return files


def fuse_a1l1(files):
    files = files.copy()
    p = files['read_ic_prepare.inc']
    anchor = '''            *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;
        }
        if (op == OP_get_field || op == OP_get_field2) {'''
    p = once(p, anchor, '''            *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;
        }
        if ((op == OP_get_loc1 || op == OP_get_arg1) &&
            pos + 1 < b->byte_code_len && pc[1] == OP_get_field) {
            *pc = (op == OP_get_loc1) ? OP_exp_get_loc1 : OP_exp_get_arg1;
        }
        if (op == OP_get_field || op == OP_get_field2) {''')
    files['read_ic_prepare.inc'] = p
    q = files['quickjs.c']
    for kind, buf in [('arg', 'arg_buf'), ('loc', 'var_buf')]:
        anchor = f'        CASE(OP_get_{kind}1): *sp++ = JS_DupValue(ctx, {buf}[1]); BREAK;'
        q = once(q, anchor, anchor + f'\n        CASE(OP_exp_get_{kind}1): V6_PREPARED_BORROW({buf}[1]); BREAK;')
        anchor = f'        if (op == OP_v6_get_{kind}0) {{ op = OP_get_{kind}0; bc_buf[pos] = op; }}'
        q = once(q, anchor, anchor + f'\n        if (op == OP_exp_get_{kind}1) {{ op = OP_get_{kind}1; bc_buf[pos] = op; }}')
    files['quickjs.c'] = q
    files['quickjs-opcode.h'] = once(files['quickjs-opcode.h'], 'DEF(v6_get_arg0, 1, 0, 1, none)',
        'DEF(v6_get_arg0, 1, 0, 1, none)\nDEF(exp_get_loc1, 1, 0, 1, none)\nDEF(exp_get_arg1, 1, 0, 1, none)')
    return files


def call02(files):
    files = files.copy()
    q = files['quickjs.c']
    for low in [-1, -2]:
        tail = 'OP_tail_call' if low == -1 else 'OP_tail_call_method'
        prefix = f'''                if (opcode == {tail})
                    goto done;
'''
        old = prefix + f'''                for(i = {low}; i < call_argc; i++)
                    JS_FreeValue(ctx, call_argv[i]);'''
        releases = '\n'.join(f'                    JS_FreeValue(ctx, call_argv[{i}]);' for i in range(low, 0))
        new = prefix + f'''                if ((unsigned)call_argc <= 2) {{
{releases}
                    if (call_argc >= 1) JS_FreeValue(ctx, call_argv[0]);
                    if (call_argc == 2) JS_FreeValue(ctx, call_argv[1]);
                }} else {{
                    for(i = {low}; i < call_argc; i++)
                        JS_FreeValue(ctx, call_argv[i]);
                }}'''
        q = once(q, old, new)
    files['quickjs.c'] = q
    return files


def render(label):
    return {'COALLOC': coalloc, 'FUSE_A1L1': fuse_a1l1, 'CALL02': call02}[label](parent())

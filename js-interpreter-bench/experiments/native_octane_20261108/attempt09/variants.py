"""One-time cold-call trampoline; restore the parent's warm interpreter source."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
PARENT = HERE.parent / 'attempt04'
ENTRY = HERE.parent / 'attempt08'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:120])
    return text.replace(old, new, 1)


def parent(label=None):
    files = module('cold_parent', PARENT / 'variants.py').render('READ_STORE')
    expected = json.loads((PARENT / 'source_manifest.json').read_text())['READ_STORE']['files']
    assert {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()} == expected
    return files


def interpreter(text):
    start = text.index('static JSValue JS_CallInternal(JSContext *caller_ctx,')
    end = text.index('\n}\n', start) + 2
    return text[start:end]


def render(label):
    assert label == 'COLD_ENTRY'
    files = module('cold_entry1_source', ENTRY / 'variants.py').render('ENTRY1')
    expected = json.loads((ENTRY / 'source_manifest.json').read_text())['ENTRY1']['files']
    assert {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()} == expected
    files = files.copy()
    q = files['quickjs.c']
    q = once(q, '''    /* First ordinary entry: no previous frame of this b has an old PC.
       rdi_prepare publishes ready before its optional allocation, so any
       synchronous re-entry during allocation uses the ordinary image. */
    if (unlikely(!b->read_ic_ready))
        rdi_prepare(caller_ctx, b);

''', '')
    q = once(q, '    JS_CLASS_INIT_COUNT, /* last entry for predefined classes */',
                '''    JS_CLASS_COLD_BYTECODE_FUNCTION, /* same u.func, one-time entry trampoline */
    JS_CLASS_INIT_COUNT, /* last entry for predefined classes */''')
    anchor = 'static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b);'
    q = once(q, anchor, anchor + '''
static JSValue js_cold_entry_call(JSContext *ctx, JSValueConst func_obj,
                                  JSValueConst this_obj, int argc,
                                  JSValueConst *argv, int flags);''')
    anchor = 'static int init_class_range(JSRuntime *rt, JSClassShortDef const *tab,'
    q = once(q, anchor, '''static JSClassShortDef const cold_bytecode_class = {
    JS_ATOM_Function, js_bytecode_function_finalizer, js_bytecode_function_mark
};

''' + anchor)
    anchor = '    rt->class_array[JS_CLASS_C_FUNCTION].call = js_call_c_function;'
    q = once(q, anchor, '''    if (init_class_range(rt, &cold_bytecode_class, JS_CLASS_COLD_BYTECODE_FUNCTION, 1) < 0)
        goto fail;
    rt->class_array[JS_CLASS_COLD_BYTECODE_FUNCTION].call = js_cold_entry_call;
''' + anchor)
    q = once(q, '    return (class_id == JS_CLASS_BYTECODE_FUNCTION ||',
                '    return (class_id == JS_CLASS_BYTECODE_FUNCTION ||\n            class_id == JS_CLASS_COLD_BYTECODE_FUNCTION ||')
    q = once(q, '        case JS_CLASS_BYTECODE_FUNCTION: /* u.func */',
                '        case JS_CLASS_COLD_BYTECODE_FUNCTION:\n        case JS_CLASS_BYTECODE_FUNCTION: /* u.func */')
    # Explicit function/realm switches; the warm call and constructor guards
    # deliberately keep their original BASE-only test and route cold calls
    # through the existing class-call path.
    q = q.replace('    case JS_CLASS_BYTECODE_FUNCTION:\n',
                  '    case JS_CLASS_COLD_BYTECODE_FUNCTION:\n    case JS_CLASS_BYTECODE_FUNCTION:\n')
    anchor = '    ctx->class_proto[JS_CLASS_BYTECODE_FUNCTION] = JS_DupValue(ctx, ctx->function_proto);'
    q = once(q, anchor, anchor + '\n    ctx->class_proto[JS_CLASS_COLD_BYTECODE_FUNCTION] = JS_DupValue(ctx, ctx->function_proto);')
    start = q.index('static JSValue js_closure2(JSContext *ctx, JSValue func_obj,')
    end = q.index('\n}\n', start) + 2
    closure = q[start:end]
    closure = once(closure, '    return func_obj;', '''    if (b->func_kind == JS_FUNC_NORMAL && !b->read_ic_ready)
        p->class_id = JS_CLASS_COLD_BYTECODE_FUNCTION;
    return func_obj;''')
    q = q[:start] + closure + q[end:]
    helper = '''
/* This class is used only before a function object's first call. Once the
   shared bytecode has been prepared (or declined), the object rejoins BASE.
   Normal warm calls therefore retain the parent's interpreter entry. */
static JSValue js_cold_entry_call(JSContext *ctx, JSValueConst func_obj,
                                  JSValueConst this_obj, int argc,
                                  JSValueConst *argv, int flags)
{
    JSObject *p = JS_VALUE_GET_OBJ(func_obj);
    JSFunctionBytecode *b = p->u.func.function_bytecode;
    if (js_check_stack_overflow(ctx->rt, 0))
        return JS_ThrowStackOverflow(ctx);
    if (!b->read_ic_ready)
        rdi_prepare(ctx, b);
    p->class_id = JS_CLASS_BYTECODE_FUNCTION;
    /* The existing class-call dispatchers supply writable argv whenever
       COPY_ARGV is clear. Preserve that ownership contract exactly. */
    if (flags & JS_CALL_FLAG_CONSTRUCTOR)
        return JS_CallConstructorInternal(ctx, func_obj, this_obj, argc,
                                          (JSValue *)argv, flags);
    return JS_CallInternal(ctx, func_obj, this_obj, JS_UNDEFINED, argc,
                           (JSValue *)argv, flags);
}
'''
    anchor = '\nJSValue JS_Call(JSContext *ctx, JSValueConst func_obj,'
    q = once(q, anchor, helper + anchor)
    files['quickjs.c'] = q
    assert interpreter(q) == interpreter(parent()['quickjs.c'])
    return files

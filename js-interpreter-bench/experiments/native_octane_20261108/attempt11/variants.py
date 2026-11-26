"""Defer only eval-origin ordinary functions, preserving eager static preparation."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
COLD = HERE.parent / 'attempt10'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def parent(label=None):
    return module('eval_cold_parent', COLD / 'variants.py').parent()


def render(label):
    assert label == 'EVAL_COLD'
    base = module('eval_cold_source', COLD / 'variants.py')
    files = base.render('COLD_ENTRY')
    expected = json.loads((COLD / 'source_manifest.json').read_text())['COLD_ENTRY']['files']
    assert {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()} == expected
    files = files.copy()
    q = files['quickjs.c']
    # js_create_function recursively builds children while all ancestor defs
    # are still live; do not persist a new flag or grow any runtime structure.
    old = '''    js_free(ctx, fd);
    /* Suspended generator/async images keep eager preparation. */
    if (b->func_kind != JS_FUNC_NORMAL && rdi_prepare(ctx, b) < 0) {'''
    new = '''    BOOL from_eval = FALSE;
    for (JSFunctionDef *origin = fd; origin; origin = origin->parent) {
        if (origin->is_eval &&
            (origin->eval_type == JS_EVAL_TYPE_DIRECT ||
             origin->eval_type == JS_EVAL_TYPE_INDIRECT)) {
            from_eval = TRUE;
            break;
        }
    }
    js_free(ctx, fd);
    /* Static/module code keeps eager preparation. Only ordinary eval-origin
       functions use the cold trampoline; suspended images remain eager. */
    if ((b->func_kind != JS_FUNC_NORMAL || !from_eval) && rdi_prepare(ctx, b) < 0) {'''
    q = base.once(q, old, new)
    q = base.once(q, '    if (b->func_kind != JS_FUNC_NORMAL && rdi_prepare(ctx, b) < 0) goto fail;',
                     '    if (rdi_prepare(ctx, b) < 0) goto fail;')
    files['quickjs.c'] = q
    assert base.interpreter(q) == base.interpreter(parent()['quickjs.c'])
    return files

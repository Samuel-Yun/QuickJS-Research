"""Transplant S002's lookup branch into two exact, independently frozen parents."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
PARENTS = {'PREP2_S002': ('attempt01', 'PREP2'),
           'READ_STORE_S002': ('attempt04', 'READ_STORE')}


def parent(label):
    directory, condition = PARENTS[label]
    path = HERE.parent / directory
    spec = importlib.util.spec_from_file_location('migration_parent_' + condition, path / 'variants.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    files = module.render(condition)
    expected = json.loads((path / 'source_manifest.json').read_text())[condition]['files']
    assert {name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()} == expected
    return files


def render(label):
    files = parent(label).copy()
    q = files['quickjs.c']
    start = q.index('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,')
    end = q.index('\n}', start) + 2
    lookup = q[start:end]
    anchor = '    sh = p->shape;\n'
    assert lookup.count(anchor) == 1
    # S002's constants are folded here; its unused IC configuration macros are
    # not copied over the parent's read_ic_config.h.
    branch = '''    if (sh->is_hashed && sh->deleted_prop_count == 0 && atom != JS_ATOM_NULL &&
        sh->prop_count <= 2 && p->class_id == JS_CLASS_OBJECT && !p->is_exotic) {
        prop = get_shape_prop(sh);
        for (uint32_t k = 0; k < (uint32_t)sh->prop_count; k++) {
            pr = &prop[k];
            if (pr->atom == atom) { *ppr = &p->prop[k]; return pr; }
        }
        *ppr = NULL; return NULL;
    }
'''
    lookup = lookup.replace(anchor, anchor + branch, 1)
    files['quickjs.c'] = q[:start] + lookup + q[end:]
    original = parent(label)
    assert [name for name in files if files[name] != original[name]] == ['quickjs.c']
    return files

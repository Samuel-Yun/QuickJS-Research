"""Build a separate EVAL_COLD descendant; never alter the frozen parent."""
import difflib
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PARENT = ROOT / 'experiments/native_octane_20261108/attempt11'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def once(text, old, new):
    assert text.count(old) == 1, repr(old)
    return text.replace(old, new, 1)


def main():
    original = PARENT / 'work/EVAL_COLD'
    expected = json.loads((PARENT / 'source_manifest.json').read_text())['EVAL_COLD']['files']
    sources = {name: (original / name).read_bytes() for name in expected}
    assert all(sha(original / name) == digest for name, digest in expected.items())
    assert sha(original / 'qjs') == 'bc0afe62ae3a4270dfc087db23042ca41c7502dd08f7b16c7863fea9cc2d4e74'
    changed = {name: value.decode() for name, value in sources.items()}
    runtime = changed['read_ic_runtime.inc']
    runtime += '\n' + (HERE / 'guarded_offset.inc').read_text()
    changed['read_ic_runtime.inc'] = runtime
    opcodes = changed['read_ic_opcodes.inc']
    anchor = '            p = origin = JS_VALUE_GET_OBJ(obj);                         \\\n'
    opcodes = once(opcodes, anchor, anchor +
        '            if (rdi_guarded_offset_probe(ctx, site, p, &val)) {           \\\n'
        '                goto name ## _done;                                    \\\n'
        '            }                                                          \\\n')
    anchor = '                    else if (!p->shape->is_hashed) { RDI_REASON(unhashed); }'
    opcodes = once(opcodes, anchor,
        '                    else if (!p->shape->is_hashed) {                     \\\n'
        '                        RDI_REASON(unhashed);                           \\\n'
        '                        rdi_guarded_offset_update(ctx, site, pr - p->prop); \\\n'
        '                    }')
    changed['read_ic_opcodes.inc'] = opcodes
    dest = HERE / 'work/GUARDED_OFFSET'
    dest.mkdir(parents=True, exist_ok=False)
    patch = []
    for name, content in changed.items():
        (dest / name).write_text(content)
        if content.encode() != sources[name]:
            patch.extend(difflib.unified_diff(sources[name].decode().splitlines(True),
                content.splitlines(True), fromfile='a/' + name, tofile='b/' + name))
    (dest / 'compat').mkdir()
    (dest / 'compat/test-closefrom.c').write_bytes((original / 'compat/test-closefrom.c').read_bytes())
    (HERE / 'implementation.patch').write_text(''.join(patch))
    manifest = dict(parent=str(original), parent_elf_sha256=sha(original / 'qjs'),
        parent_sources=expected, sources={name: sha(dest / name) for name in changed},
        changed_files=[name for name in changed if changed[name].encode() != sources[name]],
        builder_sha256=sha(Path(__file__)), helper_sha256=sha(HERE / 'guarded_offset.inc'),
        build_command=['make', '-j2', '-o', 'repl.c', 'qjs'], label='GUARDED_OFFSET')
    (HERE / 'build_manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    with (HERE / 'build.log').open('w') as log:
        result = subprocess.run(manifest['build_command'], cwd=dest, stdout=log,
                                stderr=subprocess.STDOUT, timeout=300)
    assert result.returncode == 0, 'See build.log'
    manifest['elf_sha256'] = sha(dest / 'qjs')
    manifest['elf'] = str(dest / 'qjs')
    assert all(sha(original / name) == digest for name, digest in expected.items())
    assert sha(original / 'qjs') == manifest['parent_elf_sha256']
    (HERE / 'build_manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print('BUILD_PASS', dest / 'qjs', flush=True)


if __name__ == '__main__':
    main()

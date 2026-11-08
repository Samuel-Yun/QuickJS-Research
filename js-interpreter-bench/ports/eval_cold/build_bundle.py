"""Export the frozen EVAL_COLD engine as a complete baseline patch and source archive."""
import difflib
import gzip
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import tarfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
EXPERIMENT = ROOT / 'experiments/native_octane_20261108/attempt11'
LAB = ROOT / 'experiments/ic_search_lab/v3_mass_search'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def digest(data):
    return hashlib.sha256(data).hexdigest()


def normalized(data):
    return data.replace(b'\r\n', b'\n')


def main():
    original = module('portable_baseline', LAB / 'generate.py').seed('A')
    original = {name: text.encode() for name, text in original.items()}
    baseline_manifest = json.loads((ROOT / 'experiments/native_octane_20261107/attempt01/source_manifest.json').read_text())['A']['files']
    assert {n: digest(data) for n, data in original.items()} == baseline_manifest
    final = module('portable_eval_cold', EXPERIMENT / 'variants.py').render('EVAL_COLD')
    final = {name: text.encode() for name, text in final.items()}
    expected = json.loads((EXPERIMENT / 'source_manifest.json').read_text())['EVAL_COLD']['files']
    assert {n: digest(data) for n, data in final.items()} == expected
    changed = sorted(n for n in original if normalized(original[n]) != normalized(final[n]))
    added = sorted(set(final) - set(original))
    assert changed == ['quickjs-opcode.h', 'quickjs.c'] and len(added) == 5
    patch = ''.join(''.join(difflib.unified_diff(
        normalized(original.get(name, b'')).decode().splitlines(True),
        normalized(final[name]).decode().splitlines(True),
        fromfile='a/' + name if name in original else '/dev/null',
        tofile='b/' + name)) for name in sorted(changed + added)).encode()
    (HERE / 'A_to_EVAL_COLD.patch').write_bytes(patch)
    with tarfile.open(LAB / 'build_support.tar.gz') as archive:
        support = archive.extractfile('compat/test-closefrom.c').read()
    (HERE / 'compat').mkdir(exist_ok=True)
    (HERE / 'compat/test-closefrom.c').write_bytes(support)
    files = dict(final, **{'compat/test-closefrom.c': support})
    output = io.BytesIO()
    with tarfile.open(fileobj=output, mode='w') as archive:
        for name, data in sorted(files.items()):
            entry = tarfile.TarInfo('quickjs-eval-cold/' + name)
            entry.size, entry.mode, entry.mtime = len(data), 0o644, 0
            archive.addfile(entry, io.BytesIO(data))
    packed = gzip.compress(output.getvalue(), mtime=0)
    (HERE / 'quickjs-eval-cold-source.tar.gz').write_bytes(packed)
    (HERE / 'targeted.js').write_bytes((EXPERIMENT / 'targeted.js').read_bytes())
    manifest = dict(
        baseline_version='2026-06-04',
        baseline_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',
        baseline_repository='https://github.com/bellard/quickjs.git',
        baseline_normalized={n: digest(normalized(v)) for n, v in original.items()},
        target_raw={n: digest(v) for n, v in final.items()},
        target_normalized={n: digest(normalized(v)) for n, v in final.items()},
        changed_files=changed, added_files=added,
        patch_sha256=digest(patch), source_archive_sha256=digest(packed),
        build_support_sha256=digest(support), targeted_js_sha256=digest((HERE / 'targeted.js').read_bytes()),
        source_archive_contains='32 exact frozen engine files plus compat/test-closefrom.c; no objects or executable',
        apply_policy='strict normalized C/H/JS and VERSION match except generated repl.c; copy to new output, normalize only changed files, then patch; caller Makefile retained',
        performance_claim='existing cross-batch 5-process medians; complete 17-case/14-suite including zlib: -5.697982923205657% vs A; no port timing measured')
    (HERE / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print('EXPORTED_COMPLETE_PATCH_AND_EXACT_SOURCE', len(final), changed, added)


if __name__ == '__main__':
    main()

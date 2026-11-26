"""Apply the complete frozen optimization to a matching source tree in a NEW directory."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

HERE = Path(__file__).resolve().parent


def digest(data):
    return hashlib.sha256(data).hexdigest()


def normalized(path):
    return path.read_bytes().replace(b'\r\n', b'\n')


def fail(message):
    raise SystemExit(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', required=True, type=Path)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--check', action='store_true', help='check compatibility only; create no files')
    args = parser.parse_args()
    manifest = json.loads((HERE / 'manifest.json').read_text())
    source = args.source.resolve()
    patch = HERE / 'A_to_EVAL_COLD.patch'
    if digest(patch.read_bytes()) != manifest['patch_sha256']:
        fail('Bundle patch SHA mismatch.')
    mismatches = []
    for name, expected in manifest['baseline_normalized'].items():
        # repl.c is qjsc-generated data, not an engine source anchor. Its source
        # repl.js is checked instead; upstream archives may carry another build.
        if name == 'repl.c' or not (name.endswith(('.c', '.h', '.js')) or name == 'VERSION'):
            continue
        path = source / name
        if not path.is_file() or digest(normalized(path)) != expected:
            mismatches.append(name)
    occupied = [name for name in manifest['added_files'] if (source / name).exists()]
    if mismatches or occupied:
        fail('BASELINE_MISMATCH; source unchanged. Expected upstream commit ' + manifest['baseline_commit']
             + '\nDifferent/missing files: ' + ', '.join(mismatches)
             + '\nExisting optimization files: ' + ', '.join(occupied)
             + '\nUse a clean matching tree, or port the implementation manually; no force mode.')
    print('BASELINE_MATCH', manifest['baseline_commit'], flush=True)
    if args.check:
        return
    if args.output is None:
        parser.error('--output is required unless --check is set')
    target = args.output.resolve()
    if target.exists() or target.is_relative_to(source):
        fail('Output must be a new directory outside the source tree; source unchanged.')
    patch_program = shutil.which('patch')
    if not patch_program:
        fail('GNU patch is required; source unchanged.')
    support = HERE / 'compat/test-closefrom.c'
    if digest(support.read_bytes()) != manifest['build_support_sha256']:
        fail('Bundle build-support SHA mismatch; source unchanged.')
    shutil.copytree(source, target, ignore=shutil.ignore_patterns(
        '.git', '.obj', '__pycache__', 'qjs', 'qjsc', 'libquickjs.a'))
    for name in manifest['changed_files']:
        path = target / name
        path.write_bytes(normalized(path))
    command = [patch_program, '--batch', '--forward', '--fuzz=0', '-p1', '-i', str(patch)]
    subprocess.run(command + ['--dry-run'], cwd=target, check=True)
    subprocess.run(command, cwd=target, check=True)
    for name, expected in manifest['target_normalized'].items():
        if name != 'repl.c' and (name.endswith(('.c', '.h', '.inc', '.js')) or name == 'VERSION'):
            if digest(normalized(target / name)) != expected:
                fail('POST_PATCH_MISMATCH: ' + name + '; inspect new output; source unchanged.')
    if not (target / 'compat/test-closefrom.c').exists():
        (target / 'compat').mkdir(exist_ok=True)
        shutil.copyfile(support, target / 'compat/test-closefrom.c')
    print('APPLIED_AND_SOURCE_HASHES_VERIFIED', target, flush=True)


if __name__ == '__main__':
    main()

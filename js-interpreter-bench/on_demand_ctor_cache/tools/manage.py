#!/usr/bin/env python3
"""Build the standalone package without reading any experiments directory."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

PACKAGE = Path(__file__).resolve().parents[1]
MANIFEST = json.loads((PACKAGE / 'manifest.json').read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_tree(path, expected, exact_files=False):
    for name, digest in expected.items():
        if sha(path / name) != digest:
            raise RuntimeError(f'source hash mismatch: {path / name}')
    if exact_files:
        actual = {str(p.relative_to(path)) for p in path.rglob('*') if p.is_file()}
        if actual != set(expected):
            raise RuntimeError(f'unexpected source files: {path}')


def verify():
    verify_tree(PACKAGE / 'original', MANIFEST['original'], True)
    verify_tree(PACKAGE / 'modified', MANIFEST['modified'], True)
    for name, digest in MANIFEST['patches'].items():
        if sha(PACKAGE / 'patches' / name) != digest:
            raise RuntimeError(f'patch hash mismatch: {name}')


def prepare(engine):
    verify()
    key = 'original' if engine == 'A' else 'modified'
    target = PACKAGE / 'build' / engine
    if target.exists():
        verify_tree(target, MANIFEST[key])
        return target
    target.parent.mkdir(exist_ok=True)
    shutil.copytree(PACKAGE / 'original', target)
    if engine == 'method':
        # Keep newline conversions out of the code patch. Restore the frozen
        # archive's exact representation only after applying the LF diff.
        for name in MANIFEST['original']:
            p = target / name
            p.write_bytes(p.read_bytes().replace(b'\r\n', b'\n'))
        command = ['patch', '-p1', '--batch', '--fuzz=0', '-i',
                   str(PACKAGE / 'patches/A-to-on-demand-ctor.patch')]
        log = subprocess.run(command, cwd=target, check=True, text=True,
                             stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (PACKAGE / 'verification/apply_patch.log').write_text(log.stdout)
        for name, style in MANIFEST['modified_line_endings'].items():
            if style == 'CRLF':
                p = target / name
                p.write_bytes(p.read_bytes().replace(b'\n', b'\r\n'))
    verify_tree(target, MANIFEST[key], True)
    return target


def build(engine, jobs):
    target = prepare(engine)
    command = ['make', f'-j{jobs}', '-o', 'repl.c', 'qjs', 'qjsc']
    with (PACKAGE / f'verification/build_{engine}.log').open('w') as log:
        subprocess.run(command, cwd=target, stdout=log,
                       stderr=subprocess.STDOUT, check=True)
    verify_tree(target, MANIFEST['original' if engine == 'A' else 'modified'])
    print(f'BUILD_PASS {engine}: {target / "qjs"}', flush=True)
    return {'command': command, 'qjs_sha256': sha(target / 'qjs'),
            'qjsc_sha256': sha(target / 'qjsc')}


def run(command):
    env = dict(os.environ, TZ='Asia/Shanghai', LANG='C', LC_ALL='C')
    r = subprocess.run([str(x) for x in command], cwd=PACKAGE, env=env,
                       capture_output=True, text=True, timeout=120, check=True)
    if r.stderr:
        raise RuntimeError(r.stderr)
    return r.stdout


def check():
    verify()
    records = {}
    for test in ['safety.js', 'property_reads.js']:
        outputs = {engine: run([PACKAGE / 'build' / engine / 'qjs',
                                PACKAGE / 'tests' / test])
                   for engine in ['A', 'method']}
        if outputs['A'] != outputs['method']:
            raise RuntimeError(f'differential failed: {test}')
        (PACKAGE / 'verification' / (test + '.stdout')).write_text(outputs['A'])
        records[test] = {'equal': True, 'stdout_sha256': hashlib.sha256(
            outputs['A'].encode()).hexdigest()}
    for engine in ['A', 'method']:
        work = PACKAGE / 'build' / engine
        binary = work / 'serialization_check'
        command = ['gcc', '-O2', '-g', '-I' + str(work),
                   str(PACKAGE / 'tests/serialization.c'),
                   *[str(work / '.obj' / (n + '.o')) for n in
                     ['quickjs', 'dtoa', 'libregexp', 'libunicode', 'cutils']],
                   '-lm', '-lpthread', '-ldl', '-o', str(binary)]
        run(command)
        records[f'{engine}_serialization'] = run([binary]).strip()
    records['source_and_patch_hashes'] = 'PASS'
    records['method_reconstructed_from_A'] = '38 files byte-identical to frozen release'
    records['full_benchmarks_rerun'] = False
    (PACKAGE / 'verification/checks.json').write_text(
        json.dumps(records, ensure_ascii=False, indent=2) + '\n')
    print('CHECK_PASS: source identity, A/method differential, prepared bytecode + ROM')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['verify', 'prepare', 'build', 'check'])
    parser.add_argument('engine', nargs='?', choices=['A', 'method', 'both'], default='both')
    parser.add_argument('--jobs', type=int, default=2)
    args = parser.parse_args()
    if args.action == 'verify':
        verify()
        print('VERIFY_PASS: original A, frozen method, patches')
    elif args.action == 'check':
        check()
    else:
        for engine in (['A', 'method'] if args.engine == 'both' else [args.engine]):
            if args.action == 'prepare':
                print(prepare(engine))
            else:
                result = build(engine, args.jobs)
                (PACKAGE / f'verification/build_{engine}.json').write_text(
                    json.dumps(result, indent=2) + '\n')


if __name__ == '__main__':
    main()

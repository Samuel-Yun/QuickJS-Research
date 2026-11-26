"""Recover exact source using the source-hashed generator of the measured ELF."""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import tarfile
import types

H = Path(__file__).resolve().parent


def load(name):
    return json.loads((H / name).read_text(encoding='utf-8'))


def frozen_module(name, digest):
    source = H / 'runners' / (name + '.' + digest + '.py')
    data = source.read_bytes()
    assert hashlib.sha256(data).hexdigest() == digest
    module = types.ModuleType(name)
    # A snapshot uses the original lab root to locate its relative public seeds.
    module.__file__ = str(H / (name + '.py'))
    sys.modules[name] = module
    exec(compile(data, str(source), 'exec'), module.__dict__)
    return module


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('candidate')
    parser.add_argument('destination', nargs='?')
    parser.add_argument('--verify-only', action='store_true')
    args = parser.parse_args()
    cid = args.candidate
    meta = load('identities/' + cid + '.json')
    versions = meta['controller_sha256']
    generator = frozen_module('variants', versions['variants.py'])
    if cid.startswith('mx'):
        generator = frozen_module('combinations', versions['combinations.py'])
    files = generator.render(cid)
    assert {name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()} == meta['source_sha256']
    with tarfile.open(H.parent / 'v3_mass_search/build_support.tar.gz') as archive:
        support = archive.extractfile('compat/test-closefrom.c').read()
    assert hashlib.sha256(support).hexdigest() == meta['support_sha256']
    if args.verify_only:
        print('EXACT_FROZEN_SOURCE_PASS', cid, len(files))
        return
    assert args.destination, 'Provide a new destination'
    target = Path(args.destination).resolve()
    assert not target.exists(), 'Existing files are protected'
    target.mkdir(parents=True)
    for name, text in files.items():
        (target / name).write_bytes(text.encode())
    (target / 'compat').mkdir()
    (target / 'compat/test-closefrom.c').write_bytes(support)
    print('RECOVERED_EXACT_SOURCE', cid, target)


if __name__ == '__main__':
    main()

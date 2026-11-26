"""Recover a measured candidate's exact source into a new directory, offline."""
import hashlib
import argparse
import importlib.util
import json
import sys
import tarfile
from pathlib import Path

H = Path(__file__).resolve().parent


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('candidate')
    parser.add_argument('destination', nargs='?')
    parser.add_argument('--verify-only', action='store_true')
    args = parser.parse_args()
    cid = args.candidate
    if not args.verify_only:
        assert args.destination is not None, 'Provide a new destination'
        target = Path(args.destination).resolve()
        assert not target.exists(), 'Destination must not exist; existing files are protected'
    stem = 'candidate_S001' if cid == 'S001' else cid
    metadata = json.loads((H / 'identities' / (stem + '.json')).read_text())
    state = next(r for r in json.loads((H / 'state.json').read_text()) if r['id'] == cid)
    digest = metadata['generator_sha256']
    source = H / 'generate.py'
    if hashlib.sha256(source.read_bytes()).hexdigest() != digest:
        source = H / 'runners' / ('generate.' + digest + '.py')
    assert hashlib.sha256(source.read_bytes()).hexdigest() == digest
    spec = importlib.util.spec_from_file_location('frozen_generator', source)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    module.HERE = H
    for name, value in metadata['templates_sha256'].items():
        assert hashlib.sha256((H / 'templates' / name).read_bytes()).hexdigest() == value, 'Template revision unavailable: ' + name
    files, config, parent, reason = module.render(state)
    assert reason is None
    assert {name: hashlib.sha256(text.encode()).hexdigest() for name, text in files.items()} == metadata['source_sha256_after_build']
    with tarfile.open(H / 'build_support.tar.gz') as archive:
        support = archive.extractfile('compat/test-closefrom.c').read()
    assert hashlib.sha256(support).hexdigest() == metadata['build_support_files']['compat/test-closefrom.c']
    if args.verify_only:
        print('EXACT_SOURCE_AND_SUPPORT_MATCH', cid, len(files))
        return
    target.mkdir()
    for name, text in files.items(): (target / name).write_bytes(text.encode())
    (target / 'compat').mkdir(); (target / 'compat/test-closefrom.c').write_bytes(support)
    print('RECOVERED_EXACT_SOURCE', cid, target, parent)


if __name__ == '__main__':
    main()

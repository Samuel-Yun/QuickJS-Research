"""Restore candidate source from the public s001 seed and its exact saved patch."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

H = Path(__file__).resolve().parent
sys.path.insert(0, str(H))
import designs


def apply(original, patch):
    # Strict context/count checking, not an offset-fuzzy patch operation.
    files = dict(original)
    lines = patch.splitlines(True)
    i = 0
    while i < len(lines):
        assert lines[i].startswith('--- a/')
        name = lines[i][6:].strip()
        i += 1
        assert lines[i].startswith('+++ b/' + name)
        i += 1
        old = files.get(name, '').splitlines(True)
        new, cursor = [], 0
        while i < len(lines) and not lines[i].startswith('--- a/'):
            match = re.match(r'@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@', lines[i])
            assert match, lines[i]
            start = int(match[1])-1
            # unified-diff empty-file offset0 is the position before its first line.
            if int(match[1]) == 0:
                start = 0
            assert start >= cursor
            new.extend(old[cursor:start])
            cursor = start
            i += 1
            removed = inserted = 0
            while i < len(lines) and lines[i][0] in ' +-':
                if lines[i].startswith('--- a/'):
                    break
                mark, text = lines[i][0], lines[i][1:]
                if mark in ' -':
                    assert cursor < len(old) and old[cursor] == text, (name, cursor)
                    cursor += 1
                    removed += 1
                if mark in ' +':
                    new.append(text)
                    inserted += 1
                i += 1
            assert removed == int(match[2] or 1)
            assert inserted == int(match[4] or 1)
        new.extend(old[cursor:])
        files[name] = ''.join(new)
    return files


def restore(cid, destination=None):
    identity = json.loads((H / 'identities' / (cid + '.json')).read_text(encoding='utf-8'))
    patch = (H / 'patches' / (cid + '.patch')).read_bytes()
    assert hashlib.sha256(patch).hexdigest() == identity['patch_sha256']
    files = apply(designs.seed_module.seed('s001'), patch.decode())
    hashes = {n: hashlib.sha256(v.encode()).hexdigest() for n,v in files.items()}
    assert hashes == identity['source_sha256'], 'source mismatch'
    if destination:
        destination = Path(destination)
        assert not destination.exists(), 'restore into a new directory'
        destination.mkdir(parents=True)
        for n,v in files.items():
            (destination/n).write_bytes(v.encode())
    print('RESTORE_SOURCE_PASS', cid, len(files))
    return files


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('id')
    p.add_argument('--destination')
    args = p.parse_args()
    restore(args.id, args.destination)

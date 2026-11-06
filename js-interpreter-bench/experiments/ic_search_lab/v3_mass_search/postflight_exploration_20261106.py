"""Read-only artifact checks with an explicit WSL-to-Windows path mapping."""
import hashlib
import json
from pathlib import Path
import sys

H = Path(__file__).resolve().parent


def load(path):
    return json.loads(path.read_text(encoding='utf-8'))


def sha(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        while chunk := stream.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def local(path):
    if sys.platform == 'win32' and path.startswith('/mnt/c/'):
        return Path('C:/' + path[len('/mnt/c/'):])
    return Path(path)


def main():
    workspace = load(H / 'workspace.json')
    checked = []
    for label, artifact in workspace['artifacts'].items():
        actual = sha(local(artifact['path']))
        assert actual == artifact['sha256'], label
        checked.append(dict(id=label, kind='frozen_baseline', sha256=actual, size=local(artifact['path']).stat().st_size))
    for state in load(H / 'state.json'):
        if not state.get('binary_sha256'):
            continue
        cid = state['id']
        stem = 'candidate_S001' if cid == 'S001' else cid
        artifact = load(H / 'identities' / (stem + '.json'))
        actual = sha(local(artifact['path']))
        assert actual == state['binary_sha256'] == artifact['sha256'], cid
        assert sha(H / 'patches' / (cid + '.patch')) == artifact['patch_sha256'], cid
        generator = H / 'generate.py'
        if sha(generator) != artifact['generator_sha256']:
            generator = H / 'runners' / ('generate.' + artifact['generator_sha256'] + '.py')
        assert sha(generator) == artifact['generator_sha256'], cid
        assert all(sha(H / 'templates' / name) == digest for name, digest in artifact['templates_sha256'].items()), cid
        checked.append(dict(id=cid, kind='template_control' if state['family'] == 'CONTROL' else 'candidate',
                            sha256=actual, size=local(artifact['path']).stat().st_size))
    unique = {}
    for row in checked:
        if row['kind'] == 'candidate':
            unique.setdefault(row['sha256'], []).append(row['id'])
    duplicates = [ids for ids in unique.values() if len(ids) > 1]
    assert not duplicates, 'Report identical actual artifacts explicitly'
    archive = load(H / 'current_raw_archive.json')
    assert sha(H / 'runs.jsonl') == archive['uncompressed_sha256']
    assert sha(H / archive['file']) == archive['compressed_sha256']
    status = dict(status='PASS_ARTIFACTS_PATCHES_AND_ARCHIVE', platform=sys.platform,
                  explicit_path_mapping='/mnt/c/ -> C:/ for read-only identity checks' if sys.platform == 'win32' else 'none',
                  binaries=len(checked), initial_candidate_binaries=248, template_controls=2, frozen_baselines=3,
                  duplicate_candidate_artifact_groups=duplicates, rows=checked,
                  measurements_after_archive=False, VM_executed=False,
                  total_local_binary_bytes=sum(row['size'] for row in checked))
    target = H / 'postflight_exploration_20261106.json'
    assert not target.exists()
    target.write_text(json.dumps(status, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print('POSTFLIGHT_PASS', len(checked), 'unique candidates', len(unique))


if __name__ == '__main__':
    main()

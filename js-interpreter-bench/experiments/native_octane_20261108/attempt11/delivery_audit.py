"""Offline final check of this optimization turn, including failed qualification."""
import gzip
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def archive(path):
    manifest = read(path / 'raw/archive.json')
    packed = (path / 'raw/runs.jsonl.gz').read_bytes()
    raw = gzip.decompress(packed)
    assert hashlib.sha256(packed).hexdigest() == manifest['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest() == manifest['uncompressed_sha256']
    return [json.loads(line) for line in raw.splitlines()]


def main():
    outcomes = []
    for number in [8, 9, 10, 11]:
        h = HERE.parent / f'attempt{number:02d}'
        protocol = read(h / 'protocol.json')
        for name, expected in protocol['frozen_files'].items():
            assert sha(ROOT / name) == expected, (h.name, name)
        for label, manifest in read(h / 'source_manifest.json').items():
            for name, expected in manifest['files'].items():
                assert sha(h / 'work' / label / name) == expected
        runtime_path = h / 'runtime_manifest.json'
        if runtime_path.exists():
            for label, runtime in read(runtime_path).items():
                assert sha(Path(runtime['path'])) == runtime['sha256']
                assert sha(h / 'work' / label / 'qjsc') == runtime['qjsc_sha256']
        rows = archive(h)
        samples = [r for r in rows if r['event'] == 'measurement']
        correct = [r for r in rows if r['event'] == 'correctness']
        if number == 9:
            assert not samples and not correct
            assert read(h / 'qualification_failure.json')['status'] == 'STOPPED_PROBE_API_SIGNATURE'
            assert read(h / 'diagnostics/result.json')['status'] == 'PASS_TARGETED'
        else:
            assert read(h / 'audit.json')['status'] == 'PASS_COMPLETE'
            assert read(h / 'independent_statistics_check.json')['status'] == 'PASS_OFFLINE'
            assert len(samples) == 85 * len(protocol['labels'])
            assert len(correct) == 17 * len(protocol['labels'])
            assert all(r['valid'] for r in samples + correct)
            assert {r['condition'] for r in samples} == set(protocol['labels'])
            diag = h / 'post_counts'
            diag_rows = archive(diag)
            assert not any(r['event'] == 'measurement' for r in diag_rows)
            manifest = read(diag / 'manifest.json')
            assert manifest['performance_samples'] == 0
            assert sha(h / 'post_counts.py') == manifest['script_sha256']
            for name, expected in manifest['input_scripts'].items():
                assert sha(diag / 'scripts' / name) == expected
            for label, identity in manifest['identities'].items():
                source = h / 'work' / ('POST_' + label)
                assert sha(source / 'qjs') == identity['binary_sha256']
                for name, expected in identity['sources'].items():
                    assert sha(source / name) == expected
        outcomes.append(dict(attempt=h.name, performance_samples=len(samples),
                             workload_correctness=len(correct), hashes='PASS'))
    assert sum(r['performance_samples'] for r in outcomes) == 340
    assert sum(r['workload_correctness'] for r in outcomes) == 68
    result = dict(status='PASS_OFFLINE_DELIVERY', outcomes=outcomes,
                  new_control_performance_samples=0,
                  diagnostic_and_performance_samples_separate=True,
                  frozen_sources_runner_tests_inputs=True,
                  archived_logs_and_current_binaries=True,
                  no_runtime_executed=True)
    (HERE / 'delivery_audit.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()

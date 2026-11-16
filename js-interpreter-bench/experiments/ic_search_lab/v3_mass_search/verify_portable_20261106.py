"""Verify reconstruction and archive-only statistics without executable access."""
import csv
import json
import math
import os
from pathlib import Path
import subprocess
import sys

import study_stats_20261106 as stats

H = Path(__file__).resolve().parent


def csvrows(path):
    with path.open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))


def main():
    states = json.loads((H / 'state.json').read_text())
    selected = [row['id'] for row in states if row['family'] != 'CONTROL' and row['status'] == 'SCREENED']
    assert len(selected) == 248
    restored = []
    for cid in selected:
        completed = subprocess.run([sys.executable, str(H / 'recover.py'), cid, '--verify-only'],
                                   capture_output=True, text=True)
        restored.append(dict(id=cid, exit_code=completed.returncode, stdout=completed.stdout, stderr=completed.stderr))
        assert completed.returncode == 0, restored[-1]
    os.environ['IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY'] = '1'
    outputs = []
    original_save = stats.savecsv

    def save(name, values):
        alternate = 'offline_windows.' + name
        original_save(alternate, values)
        outputs.append((name, alternate))

    stats.savecsv = save
    stats.recheck()
    max_error = 0.0
    for original, alternate in outputs:
        expected = csvrows(H / original)
        actual = csvrows(H / alternate)
        assert len(expected) == len(actual)
        for left, right in zip(expected, actual):
            assert left.keys() == right.keys()
            for key in left:
                if left[key] == right[key]:
                    continue
                if key == 'round_ratios':
                    pairs = zip(json.loads(left[key]), json.loads(right[key]))
                else:
                    pairs = [(float(left[key]), float(right[key]))]
                for a, b in pairs:
                    error = abs(a - b)
                    max_error = max(error, max_error)
                    assert math.isclose(a, b, rel_tol=1e-12, abs_tol=1e-12), (original, key, a, b)
    result = dict(status='PASS_PORTABLE_SOURCE_AND_ARCHIVE_STATISTICS', platform=sys.platform,
                  python=sys.version, exact_source_reconstructions=restored,
                  reconstructed_candidates=len(restored), binary_paths_read=False, VM_executed=False,
                  archive_only=True, outputs=[alternate for original, alternate in outputs],
                  maximum_float_difference=max_error, tolerance=1e-12,
                  original_statistics_preserved=True)
    path = H / 'portable_verification_20261106.json'
    assert not path.exists()
    path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print('PORTABLE_VERIFICATION_PASS', len(restored), max_error)


if __name__ == '__main__':
    main()

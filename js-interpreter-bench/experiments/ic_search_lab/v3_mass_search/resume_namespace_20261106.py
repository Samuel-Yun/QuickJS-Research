"""Resume after a guarded S001/s001 filename collision on NTFS."""
import json
import os
from pathlib import Path

import explore_20261106 as exploration
import search as s

H = s.HERE
lab = s.lab


def main():
    protocol = lab.load(H / 'exploration.protocol.json')
    env = lab.load(H / ('exploration.environment.' + protocol['tag'] + '.json'))
    assert lab.boot() == env['boot_id'], 'Cannot silently resume this cohort after a boot change'
    workspace = lab.load(H / 'workspace.json')
    for label, artifact in workspace['artifacts'].items():
        assert lab.sha(artifact['path']) == artifact['sha256'], label
    baseline = H / 'identities/s001.json'
    frozen = lab.load(baseline)
    assert frozen['sha256'] == workspace['artifacts']['s001']['sha256']
    assert s.candidate_stem('S001').casefold() != s.candidate_stem('s001').casefold()
    assert not lab.candidate_metadata_path('S001').exists()
    evidence = dict(status='RESUME_AFTER_CONTROLLER_NAMESPACE_FAILURE', pid=os.getpid(),
                    boot_id=lab.boot(), timestamp=lab.stamp(), completed_blocks=16,
                    complete_configurations=96, stopped_before_measurement_of_block=16,
                    reason='NTFS case-insensitive identities/S001.json resolved to frozen identities/s001.json; status guard stopped before writes',
                    correction='Candidate S001 uses candidate_S001 stem for binary and metadata; public candidate ID stays S001',
                    frozen_s001_binary_sha256=lab.sha(frozen['path']), baseline_metadata_sha256=lab.sha(baseline),
                    controller_sha256={name: lab.sha(H / name) for name in ['search.py', 'stages.py', 'recover.py', 'resume_namespace_20261106.py']},
                    source_generator_changed=False, benchmark_changed=False,
                    old_data_and_failure_preserved=True, old_times_used_as_new_denominators=False)
    lab.save(H / 'namespace_recovery_20261106.json', evidence)
    lab.append(dict(event='controller_namespace_recovery', **evidence))
    print('NAMESPACE_FIX_BASELINES_VERIFIED_RESUMING', os.getpid(), lab.boot(), flush=True)
    exploration.collect()


if __name__ == '__main__':
    main()

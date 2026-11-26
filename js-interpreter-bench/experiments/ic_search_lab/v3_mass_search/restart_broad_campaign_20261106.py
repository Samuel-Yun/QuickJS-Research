"""New boot, new timing campaign. Earlier measurements stay immutable."""
import os
from pathlib import Path
import time

import explore_20261106 as exploration
import search as s

H = s.HERE
lab = s.lab


def main():
    assert not (H / 'exploration.active_campaign.json').exists(), 'A new campaign is already allocated'
    original = lab.load(H / 'exploration.protocol.json')
    old_environment = lab.load(H / ('exploration.environment.' + original['tag'] + '.json'))
    new_boot = lab.boot()
    assert new_boot != old_environment['boot_id']
    assert not (H / 'exploration.complete.json').exists()
    workspace = lab.load(H / 'workspace.json')
    for label, artifact in workspace['artifacts'].items():
        assert lab.sha(artifact['path']) == artifact['sha256'], label
    baseline = lab.load(H / 'identities/s001.json')
    assert baseline['sha256'] == workspace['artifacts']['s001']['sha256']
    assert s.candidate_stem('S001').casefold() != s.candidate_stem('s001').casefold()
    assert not lab.candidate_metadata_path('S001').exists()
    protocol = dict(original, tag=str(time.time_ns()), file_prefix='exploration02',
                    supersedes_timing_campaign=original['tag'], expected_boot=new_boot,
                    old_measurements_used_as_denominator=False, cached_artifacts_reused_after_sha_check=True)
    amendment = dict(status='FROZEN_BEFORE_RESTART', timestamp=lab.stamp(), old_boot=old_environment['boot_id'],
                     new_boot=new_boot, old_campaign=original['tag'], new_campaign=protocol['tag'],
                     old_status='STOPPED_CONTROLLER_FILENAME_COLLISION_THEN_BOOT_CHANGED',
                     preserved_old_complete_configurations=96, old_raw_retained=True,
                     cause='Candidate S001 metadata collided with frozen s001 on case-insensitive NTFS. Guard stopped before writes. Later explicit resume rejected changed WSL boot.',
                     fix='Separate candidate_S001 artifact/metadata stem. Candidate ID and source implementation unchanged.',
                     new_sampling='All248 supported configurations receive fresh within-campaign block controls; old96 are not used as new denominators.',
                     baseline_sha256={label: artifact['sha256'] for label, artifact in workspace['artifacts'].items()},
                     old_stop_and_protocol_kept=True, controller_changed=True,
                     generator_changed=False, templates_changed=False, benchmark_changed=False)
    lab.save(H / 'protocol_amendment03_new_boot.json', amendment)
    lab.save(H / 'exploration02.protocol.json', protocol)
    lab.save(H / 'exploration.active_campaign.json', dict(protocol='exploration02.protocol.json',
             file_prefix='exploration02', tag=protocol['tag'], boot_id=new_boot))
    lab.save(H / 'exploration02.worker.json', dict(pid=os.getpid(), boot_id=new_boot, timestamp=lab.stamp()))
    lab.append(dict(event='new_boot_campaign_recovery', **amendment))
    exploration.install_gate(protocol)
    for label, artifact in workspace['artifacts'].items():
        result = lab.capture([artifact['path'], '-e', 'print(123456)'], 'new_boot_bounded_smoke', label, 15, artifact)
        assert result['exit_code'] == 0 and result['stdout'] == '123456\n' and not result['stderr']
    print('NEW_CAMPAIGN_BASELINES_VERIFIED', os.getpid(), new_boot, protocol['tag'], flush=True)
    exploration.collect()


if __name__ == '__main__':
    main()

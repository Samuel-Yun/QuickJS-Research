"""Explicit recovery campaigns. Historical STOP, blocks and raw stay intact."""
import json
import os
import random
import sys
import time
from pathlib import Path

import search as s
import stages as st
import generate

H = s.HERE
lab = s.lab


def install_gate(certificate=None):
    boot = lab.boot()
    artifacts = lab.load(H / 'workspace.json')['artifacts']
    for artifact in artifacts.values(): assert lab.sha(artifact['path']) == artifact['sha256']
    if certificate is not None:
        assert certificate['status'] == 'PASS_BOUNDED_NEW_CAMPAIGN_GATE'
        assert certificate['boot_id'] == boot
        assert time.time() - certificate['finished_unix'] <= 3600, 'Recovery certificate expired; check the environment again'

    def gate():
        assert lab.boot() == boot, 'BOOT_CHANGED during recovery campaign'
        if certificate is not None and (H / ('STOP_RECOVERY.' + certificate['tag'])).exists():
            raise RuntimeError('This recovery campaign stopped; a new explicit check is required')

    s.gate = gate
    lab.execution_gate = gate


def check():
    """Run only on a later explicit resume, after addressing host conditions."""
    assert (H / 'STOP').exists(), 'Original blocked evidence required'
    os.sched_setaffinity(0, {2})
    install_gate()
    tag = str(time.time_ns())
    campaign = 'recovery_check.' + tag
    nmap = lab.load(H / 'short_n_override.json')['N']
    groups = {}
    for rep in range(3):
        jobs = list(s.SHORT); random.Random(s.SEED + rep).shuffle(jobs)
        for kind, case in jobs:
            labels = ['A', 's001'] if rep % 2 == 0 else ['s001', 'A']
            for pos, label in enumerate(labels):
                row = st.invoke(kind, case, label, nmap[kind + '/' + case], 'environment_recovery', campaign, pos, rep)
                groups.setdefault(kind + '/' + case + '/' + label, []).append(row['elapsed_ms'])
    drift = {key: max(values) / min(values) for key, values in groups.items()}
    data = dict(status='PASS_BOUNDED_NEW_CAMPAIGN_GATE' if max(drift.values()) <= 1.15 else 'BLOCKED_RECOVERY_DRIFT',
                tag=tag, boot_id=lab.boot(), finished_unix=time.time(), campaign=campaign, N=nmap, max_over_min=drift,
                old_blocks_eligible=False, original_STOP_preserved=True,
                interpretation='A bounded gate only; future blocks still require endpoint drift checks')
    lab.save(H / ('recovery.' + tag + '.json'), data)
    st.atomic_json(H / 'recovery.current.json', data)
    print(json.dumps(data), flush=True)


def collect():
    certificate = lab.load(H / 'recovery.current.json')
    install_gate(certificate)
    os.sched_setaffinity(0, {2})
    tag = certificate['tag']
    schedule = H / ('recovery.' + tag + '.schedule.json')
    if schedule.exists():
        ids = lab.load(schedule)['candidates']
    else:
        states = st.all_rows()
        lab.save(H / ('state.before_recovery.' + tag + '.json'), states)
        ids = [r['id'] for r in states if generate.resolve(r)[2] is None and r['status'] not in ['INVALID', 'BUILD_FAILED', 'DUPLICATE']]
        random.Random(s.SEED).shuffle(ids)
        lab.save(schedule, dict(candidates=ids, boot_id=lab.boot(), tag=tag, seed=s.SEED,
                                old_elapsed_data_used=False, batch_size=6, block_retry_limit=1))
    for number, start in enumerate(range(0, len(ids), 6)):
        block = 'recovery.' + tag + '.block' + str(number)
        completed = H / (block + '.accepted.json')
        if completed.exists(): continue
        eligible = []
        for cid in ids[start:start + 6]:
            artifact = st.build(cid)
            if artifact is not None: eligible.append(cid)
        if eligible:
            original = st.quick_block(eligible, block, 'screen1_recovery')
            accepted = original
            if original['endpoint_drift']:
                accepted = st.quick_block(eligible, block + '.retry1', 'screen1_recovery_retry')
            if accepted['endpoint_drift']:
                lab.save(H / ('STOP_RECOVERY.' + tag), 'Repeated drift in explicit recovery; original/retry retained.\n')
                raise RuntimeError('Recovery endpoint drift persisted')
            lab.save(completed, dict(block=accepted['block'], candidates=eligible, boot_id=lab.boot(), old_cohort_used=False))
        print('RECOVERY_CHECKPOINT', number + 1, '/', (len(ids) + 5) // 6, flush=True)
    lab.save(H / 'screen.complete.json', dict(status='COMPLETE_SUPPORTED_INITIAL_LAYER1', recovery_tag=tag,
                                             candidates=ids, old_cohort_used=False))


if __name__ == '__main__':
    assert sys.platform == 'linux', 'Use the existing WSL distro for engine commands'
    globals()[sys.argv[1]]()

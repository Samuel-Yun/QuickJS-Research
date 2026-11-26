"""Explicitly resumed session. Preserve the sealed checkpoint before new data."""
import hashlib
import json
import os
import subprocess
import tarfile
import time
import traceback
from pathlib import Path

import resume
import analysis

H = resume.H
lab = resume.lab


def main():
    checkpoint = H / 'checkpoint_20261105_public.tar.gz'
    if not checkpoint.exists():
        evidence = lab.load(H / 'evidence_manifest.json')
        for name, metadata in evidence['files'].items():
            assert lab.sha(H / name) == metadata['sha256'], 'Sealed file changed: ' + name
        with tarfile.open(checkpoint, 'w:gz') as archive:
            for name in evidence['files']:
                archive.add(H / name, arcname=name, recursive=False)
            archive.add(H / 'evidence_manifest.json', arcname='evidence_manifest.json', recursive=False)
        lab.save(H / 'checkpoint_20261105_public.json', dict(sha256=lab.sha(checkpoint),
                  purpose='Exact public checkpoint before explicitly resumed data; historical raw gzip included'))
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    busy = []
    for line in inventory.splitlines()[1:]:
        fields = line.split(None, 2)
        if len(fields) >= 2 and (fields[1] in ['qjs', 'd8', 'gcc', 'cc1', 'cc1plus', 'make'] or fields[1].endswith('.qjs')):
            busy.append(line)
    assert not busy, 'Existing compiler/runtime must finish: ' + repr(busy)
    token = str(time.time_ns())
    baseline = analysis.rows()
    starts_before = {r['token'] for r in baseline if r.get('event') == 'process_start'}
    measured_before = sum(r.get('event') == 'measurement' for r in baseline)
    lab.append(dict(event='explicit_resume', timestamp=lab.stamp(), token=token, boot_id=lab.boot(),
                    reason='User queried stopped progress; existing authorization continues',
                    controller_sha256=lab.sha(Path(__file__)), old_STOP_preserved=True))
    status = 'CHECKING'
    error = None
    try:
        resume.check()
        certificate = lab.load(H / 'recovery.current.json')
        if certificate['status'] == 'PASS_BOUNDED_NEW_CAMPAIGN_GATE':
            print('RECOVERY_GATE_PASS_CONTINUING_INITIAL_CONFIGURATIONS', flush=True)
            resume.collect()
            status = 'COMPLETE_SUPPORTED_INITIAL_LAYER1'
        else:
            status = certificate['status']
            print('RECOVERY_GATE_STILL_BLOCKED', json.dumps(certificate['max_over_min']), flush=True)
    except Exception:
        status = 'RESUME_EXCEPTION'
        error = traceback.format_exc()
        print(error, flush=True)
    latest = analysis.rows()
    starts = {r['token'] for r in latest if r.get('event') == 'process_start'} - starts_before
    results = {r['token'] for r in latest if r.get('event') == 'process_result'}
    report = dict(status=status, timestamp=lab.stamp(), boot_id=lab.boot(), exception=error,
                  new_measurements=sum(r.get('event') == 'measurement' for r in latest) - measured_before,
                  new_processes=len(starts), unmatched_processes=sorted(starts - results),
                  original_checkpoint_sha256=lab.sha(checkpoint), old_elapsed_used_as_denominator=False)
    lab.save(H / ('recovery_session.' + token + '.json'), report)
    # Keep each raw checkpoint distinct. The original gzip and its hashes stay
    # available to reconstruct the preceding stopped session.
    import gzip
    target = H / ('runs.recovery.' + token + '.jsonl.gz')
    with target.open('xb') as stream:
        with gzip.GzipFile(filename='', mode='wb', fileobj=stream, mtime=0) as compressed:
            compressed.write((H / 'runs.jsonl').read_bytes())
    lab.save(H / ('raw_archive.recovery.' + token + '.json'), dict(path=target.name,
              compressed_sha256=lab.sha(target), uncompressed_sha256=lab.sha(H / 'runs.jsonl'),
              original_archive='runs.jsonl.gz', report=report))
    print('RECOVERY_SESSION_SAVED', json.dumps(report), flush=True)


if __name__ == '__main__':
    main()

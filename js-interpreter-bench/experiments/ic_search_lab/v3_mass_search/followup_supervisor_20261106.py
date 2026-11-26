"""Wait for the serial short screen, then run the frozen full-suite stages."""
import argparse
import gzip
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

H = Path(__file__).resolve().parent
RUN_NAME = 'followup'


def read(name):
    return json.loads((H / name).read_text(encoding='utf-8'))


def write(name, data):
    path = H / name
    pending = path.with_name(path.name + '.pending')
    pending.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    os.replace(pending, path)


def boot():
    return Path('/proc/sys/kernel/random/boot_id').read_text().strip()


def worker_is_running(pid):
    path = Path('/proc') / str(pid) / 'cmdline'
    try:
        command = path.read_bytes().replace(b'\0', b' ').decode()
    except FileNotFoundError:
        return False
    if not command:
        return False
    assert 'explore_20261106.py collect' in command or 'restart_broad_campaign_20261106.py' in command, 'Waiting PID was reused by a different process'
    return True


def no_engines_or_compilers():
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    for line in inventory.splitlines()[1:]:
        fields = line.split(None, 2)
        if len(fields) < 2:
            continue
        name = fields[1]
        assert name not in ['qjs', 'd8', 'gcc', 'cc1', 'make'] and not name.endswith('.qjs'), line


def run_stage(stage, arguments, cohort):
    assert boot() == cohort
    assert not (H / 'STOP_EXPLORATION').exists()
    no_engines_or_compilers()
    command = [sys.executable] + arguments
    log = H / (RUN_NAME + '.' + stage + '.progress.log')
    assert not log.exists(), 'Existing phase log needs explicit resume review'
    write('exploration.followup.progress.json', dict(stage=stage, status='RUNNING',
          boot_id=cohort, command=command, log=log.name, started_utc=time.time()))
    print('FOLLOWUP_STAGE_START', stage, flush=True)
    with log.open('xb') as stream:
        completed = subprocess.run(command, cwd=H, stdout=stream, stderr=subprocess.STDOUT)
    assert completed.returncode == 0, 'Phase failed; inspect ' + log.name
    assert boot() == cohort
    print('FOLLOWUP_STAGE_COMPLETE', stage, flush=True)


def archive_current():
    source = H / 'runs.jsonl'
    before = source.stat()
    tag = str(time.time_ns())
    target = H / ('runs.exploration.' + tag + '.jsonl.gz')
    digest = hashlib.sha256()
    size = 0
    with source.open('rb') as incoming, target.open('xb') as outgoing:
        with gzip.GzipFile(filename='', fileobj=outgoing, mode='wb', mtime=0) as compressed:
            while chunk := incoming.read(1024 * 1024):
                digest.update(chunk)
                size += len(chunk)
                compressed.write(chunk)
    after = source.stat()
    assert before.st_size == after.st_size == size and before.st_mtime_ns == after.st_mtime_ns
    meta = dict(file=target.name, compressed_sha256=hashlib.sha256(target.read_bytes()).hexdigest(),
                uncompressed_sha256=digest.hexdigest(), uncompressed_size=size,
                compressed_size=target.stat().st_size, created_utc=time.time(),
                includes='Historical records plus new exploration; campaign fields separate analyses',
                license='Project research records; embedded benchmark output retains upstream licenses',
                restore='python3 -c "import gzip,pathlib; pathlib.Path(\'runs.restored.jsonl\').write_bytes(gzip.decompress(pathlib.Path(\'' + target.name + '\').read_bytes()))"')
    write('raw_archive.exploration.' + tag + '.json', meta)
    assert not (H / 'current_raw_archive.json').exists(), 'Preserve the old current pointer before a new snapshot'
    write('current_raw_archive.json', meta)
    return meta


def main(pid):
    pointer = H / 'exploration.active_campaign.json'
    protocol = read(read(pointer.name)['protocol'] if pointer.exists() else 'exploration.protocol.json')
    environment = read('exploration.environment.' + protocol['tag'] + '.json')
    cohort = environment['boot_id']
    assert boot() == cohort
    lock = H / (RUN_NAME + '.lock.json')
    with lock.open('x', encoding='utf-8') as stream:
        json.dump(dict(pid=os.getpid(), boot_id=cohort, waiting_for_pid=pid,
                       script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()), stream)
    write('exploration.followup.progress.json', dict(stage='wait_for_initial_screen', status='WAITING',
          boot_id=cohort, waiting_for_pid=pid))
    print('FOLLOWUP_WAITING_FOR_INITIAL_SCREEN', pid, flush=True)
    while worker_is_running(pid):
        assert boot() == cohort
        time.sleep(30)
    assert (H / (protocol.get('file_prefix', 'exploration') + '.complete.json')).exists(), 'Initial search stopped early; do not launch later measurements'
    run_stage('full', ['promote_20261106.py', 'full'], cohort)
    run_stage('recheck', ['promote_20261106.py', 'recheck'], cohort)
    run_stage('statistics', ['study_stats_20261106.py', 'recheck'], cohort)
    run_stage('audit', ['study_stats_20261106.py', 'audit'], cohort)
    metadata = archive_current()
    check_env = dict(os.environ, IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY='1')
    verified = subprocess.run([sys.executable, 'study_stats_20261106.py', 'audit'], cwd=H, env=check_env,
                              capture_output=True, text=True)
    write('exploration.archive_only_audit.json', dict(exit_code=verified.returncode,
          stdout=verified.stdout, stderr=verified.stderr, archive=metadata['file']))
    assert verified.returncode == 0
    audit = read('exploration.audit.json')
    assert audit['record_integrity'] == 'PASS' and not audit['unmatched_process_starts']
    write('exploration.followup.complete.json', dict(status='FULL_SUITE_AND_INDEPENDENT_RECHECK_COMPLETE',
          boot_id=cohort, archive=metadata['file'], formal_confirmation='NOT_RUN',
          next_action='Review independent results and mechanism before choosing any formal candidate'))
    write('exploration.followup.progress.json', dict(stage='review', status='COMPLETE_PENDING_RESEARCH_REVIEW', boot_id=cohort))
    print('FOLLOWUP_COMPLETE_PENDING_RESEARCH_REVIEW', flush=True)
    # Retain the cohort during the short hand-off to the supervising agent.
    time.sleep(600)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--wait-for-pid', required=True, type=int)
    parser.add_argument('--name', default='followup')
    args = parser.parse_args()
    assert args.name.replace('_', '').isalnum(), 'Use a simple new supervisor name'
    RUN_NAME = args.name
    try:
        main(args.wait_for_pid)
    except Exception as exc:
        write(RUN_NAME + '.error.json', dict(type=type(exc).__name__, error=str(exc), boot_id=boot()))
        raise

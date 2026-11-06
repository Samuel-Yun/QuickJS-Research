"""Resume frozen v6 artifacts; no build, implementation or mechanism reruns."""
import argparse
import datetime
import json
import os
from pathlib import Path
import time
import random

import experiment as e


def verify_frozen():
    manifest = e.lab.load(e.H / 'manifest.json')
    checked = []
    for item in manifest['artifacts']:
        path = Path(item['path'])
        assert path.read_bytes()[:4] == b'\x7fELF', item['id']
        assert e.lab.sha(path) == item['sha256'], item['id']
        checked.append(dict(id=item['id'], path=str(path), sha256=item['sha256']))
    for kind in ['octane', 'sunspider']:
        e.measure.verify(e.lab.load(e.H / (kind + '.inputs.json')), [])
    return checked


def load_precheck():
    """Real frozen workloads, separate fresh processes, no ranking/promotion."""
    assert e.EPOCH != 'initial' and not e.DIAGNOSTIC_ONLY
    result_file = 'load_precheck.' + e.EPOCH + '.json'
    assert not (e.H / result_file).exists(), 'Preserve prior attempt'
    started = e.lab.stamp()
    rows = []
    clocks = []
    verified = []
    try:
        e.gate()
        os.sched_setaffinity(0, {2})
        inventory = e.subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
        suspicious = []
        for line in inventory.splitlines()[1:]:
            fields = line.split(None, 2)
            if len(fields) > 1 and (fields[1] in ['qjs', 'd8', 'gcc', 'cc1', 'make'] or fields[1].endswith('.qjs')):
                suspicious.append(line)
        assert not suspicious, suspicious
        verified = verify_frozen()
        e.preflight()
        info = e.lab.load(e.H / 'octane.inputs.json')
        for case in ['Richards.Richards', 'Splay.Splay', 'Typescript.Typescript']:
            n = max(1, info['N'][case] // 4)
            for label in ['A', 's001']:
                script = e.measure.script(info, case, n, 'load_precheck_' + e.EPOCH)
                art = e.measure.artifact(label)
                clocks.append(dict(realtime_ns=time.time_ns(), monotonic_ns=time.monotonic_ns(),
                                   raw_ns=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW), boot=e.lab.boot()))
                r = e.capture([art['path'], script], 'performance_load_precheck', case + '/' + label,
                              timeout=90, identity=dict(binary_sha256=art['sha256'], script_sha256=e.lab.sha(script),
                                                       case=case, N=n, not_a_formal_sample=True))
                assert r['exit_code'] == 0 and not r['timeout'] and not r['stderr'], r
                lines = [s[len('OCTANE_IC_RESULT:'):] for s in r['stdout'].splitlines()
                         if s.startswith('OCTANE_IC_RESULT:')]
                assert len(lines) == 1, r['stdout']
                payload = json.loads(lines[0])
                assert payload['case'] == case and payload['N'] == n
                assert payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
                elapsed = payload['elapsed_ms']
                assert 0 < elapsed <= r['wall_time_ms'] + 5
                assert payload['stop_ms'] - payload['start_ms'] == elapsed
                utc = (datetime.datetime.fromisoformat(r['completed_at']) -
                       datetime.datetime.fromisoformat(r['timestamp'])).total_seconds()
                rows.append(dict(case=case, condition=label, N=n, elapsed_ms=elapsed,
                                 external_ms=r['wall_time_ms'], utc_seconds=utc,
                                 clock_difference_seconds=utc-r['wall_time_ms']/1000,
                                 checksum=payload.get('checksum'), token=r['token']))
                print('LOAD_PREFLIGHT', case, label, round(elapsed, 3), 'PASS', flush=True)
        clocks.append(dict(realtime_ns=time.time_ns(), monotonic_ns=time.monotonic_ns(),
                           raw_ns=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW), boot=e.lab.boot()))
        drift = max(abs((v['realtime_ns'] - clocks[0]['realtime_ns']) -
                        (v['monotonic_ns'] - clocks[0]['monotonic_ns'])) / 1e9 for v in clocks)
        assert drift <= 1, 'LOAD_CLOCK_SPAN_DISCONTINUITY ' + str(drift)
        assert len({v['boot'] for v in clocks}) == 1
        assert verified == verify_frozen()
        e.save(result_file, dict(status='PASS_REAL_WORKLOAD_LOAD_PRECHECK', epoch=e.EPOCH,
                                started=started, completed=e.lab.stamp(), workloads=rows,
                                clocks=clocks, max_span_difference_seconds=drift,
                                identities=verified, no_build=True, no_diagnostic_rerun=True))
        print('REAL_LOAD_PREFLIGHT_PASS', e.EPOCH, len(rows), drift, flush=True)
    except Exception as exc:
        e.save(result_file, dict(status='BLOCKED_PRECHECK', epoch=e.EPOCH, started=started,
                                completed=e.lab.stamp(), workloads=rows, clocks=clocks,
                                identities=verified, error=repr(exc)))
        if not (e.H / e.epoch_name('STOP')).exists():
            e.save(e.epoch_name('STOP'), dict(status='BLOCKED_PRECHECK', reason=repr(exc),
                                            precheck=result_file, boot_id=e.lab.boot()))
        raise


def short(name):
    assert e.lab.load(e.H / ('load_precheck.' + e.EPOCH + '.json'))['status'] == 'PASS_REAL_WORKLOAD_LOAD_PRECHECK'
    labels = e.lab.load(e.H / 'short_plan.json')['conditions']
    checked = verify_frozen()
    original = e.measure.invoke
    count = 0

    def progress(*args, **kwargs):
        nonlocal count
        row = original(*args, **kwargs)
        count += 1
        if count % len(labels) == 0:
            print('SHORT_GROUP_COMPLETE', count // len(labels), 'of12', row['case'],
                  'valid_records', count, 'of144', flush=True)
        return row

    e.measure.invoke = progress
    e.campaign(name, labels, 'short')
    assert checked == verify_frozen()
    e.save(name + '.identity_after.json', dict(status='PASS', artifacts=checked, boot_id=e.lab.boot()))


def full(name, kind, labels):
    """Three complete independent rounds, original full N, no extra warmup."""
    e.gate()
    assert e.lab.load(e.H / ('load_precheck.' + e.EPOCH + '.json'))['status'] == 'PASS_REAL_WORKLOAD_LOAD_PRECHECK'
    assert len(labels) == len(set(labels)) and 'A' in labels and 's001' in labels
    assert kind in ['octane', 'sunspider']
    os.sched_setaffinity(0, {2})
    checked = verify_frozen()
    info = e.lab.load(e.H / (kind + '.inputs.json'))
    controller_sha = e.lab.sha(Path(__file__))
    e.save('controllers/accept_performance.' + controller_sha + '.py', Path(__file__).read_bytes())
    rounds = e.lab.load(e.H / 'protocol.json')['recheck_rounds']
    assert rounds == 3
    selection_name='selection.' + e.EPOCH + '.json'
    if not (e.H/selection_name).exists():
        selection_name='selection.accept01.json'
    assert labels==e.lab.load(e.H/selection_name)['full_labels'], 'Frozen shortlist only'
    rng = random.Random(e.SEED)
    balanced = labels[:]
    rng.shuffle(balanced)
    order = []
    for rep in range(rounds):
        cases = info['cases'][:]
        rng.shuffle(cases)
        for case in cases:
            offset = (info['cases'].index(case) + rep) % len(balanced)
            conditions = balanced[offset:] + balanced[:offset]
            if info['cases'].index(case) % 2:
                conditions = conditions[::-1]
            order.append(dict(kind=kind, case=case, rep=rep, conditions=conditions, N=info['N'][case]))
    e.save(name + '.protocol.json', dict(name=name, labels=labels, stage=kind, rounds=rounds,
            order=order, boot_id=e.lab.boot(), mode=e.lab.load(e.H / 'protocol.json')['mode'],
            seed=e.SEED, full_collection=True, N={kind+'/'+c:info['N'][c] for c in info['cases']},
            epoch=e.EPOCH, environment_sha256=e.lab.sha(e.H / e.epoch_name('environment')),
            selection=selection_name, extra_warmup=0,
            wrapper_sha256=controller_sha, experiment_sha256=e.lab.sha(Path(e.__file__)),
            measure_sha256=e.lab.sha(Path(e.measure.__file__))))
    rows = []
    for group in order:
        e.measure.verify(info, labels)
        for pos, label in enumerate(group['conditions']):
            rows.append(e.measure.invoke(info, 'targeted', group['case'], label, group['N'],
                                         'v6_full_recheck', pos, group['rep'], name))
        print('FULL_GROUP_COMPLETE', kind, group['rep'], group['case'], len(rows), 'of',
              len(order)*len(labels), flush=True)
    assert checked == verify_frozen()
    e.save(name + '.completed.json', dict(status='COMPLETE', valid=len(rows),
                                         expected=len(order)*len(labels), boot_id=e.lab.boot()))
    e.save(name + '.identity_after.json', dict(status='PASS', artifacts=checked, boot_id=e.lab.boot()))
    e.summarize(name)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['precheck', 'short', 'full'])
    parser.add_argument('--name')
    parser.add_argument('--kind', choices=['octane', 'sunspider'])
    parser.add_argument('--labels', nargs='+')
    args = parser.parse_args()
    if args.action == 'precheck':
        load_precheck()
    elif args.action == 'short':
        assert args.name
        short(args.name)
    else:
        assert args.name and args.kind and args.labels
        full(args.name, args.kind, args.labels)

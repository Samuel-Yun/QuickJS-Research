"""Serial v7 experiments using the frozen v6 workload and native timer."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import random
import sys
import time

H = Path(__file__).resolve().parent
V6 = H.parent / 'v6_targeted_ic'
sys.path.insert(0, str(V6))
import experiment as e

e.H = H
e.lab.HERE = e.measure.HERE = H
e.lab.candidate_metadata_path = lambda label: H / 'identities' / (label + '.json')
e.EPOCH = os.environ.get('V7_EPOCH','initial')
assert e.EPOCH.replace('_','').isalnum()
SEED = 2026110707
CAPTURE_WITH_OLD_GATE = e.capture
WARN_CLOCK=os.environ.get('V7_WARN_CLOCK')=='1'


def limited_gate():
    assert e.EPOCH!='initial'
    assert (H/'protocol_clock_warning.md').exists()
    assert not (H/e.epoch_name('STOP')).exists(),'Preserve and review hard failure'
    env=e.lab.load(H/e.epoch_name('environment'))
    assert env['timing_quality']=='EXPLORATORY_CLOCK_LIMITED'
    assert env['boot_id']==e.lab.boot(),'BOOT_CHANGED'


def limited_capture(command,stage,label,timeout=60,identity=None,cwd=None):
    limited_gate()
    identity=dict(identity or {},cohort_epoch=e.EPOCH,timing_quality='EXPLORATORY_CLOCK_LIMITED')
    raw0=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW)
    mono0=time.monotonic_ns()
    result=e.ORIGINAL_CAPTURE(command,stage,label,timeout,identity,cwd)
    mono1=time.monotonic_ns()
    raw1=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW)
    utc=(datetime.datetime.fromisoformat(result['completed_at'])-datetime.datetime.fromisoformat(result['timestamp'])).total_seconds()
    elapsed=result['wall_time_ms']/1000
    disagreement=abs((raw1-raw0)-(mono1-mono0))/1e9
    e.lab.append(dict(event='limited_clock_observation',token=result['token'],epoch=e.EPOCH,
        raw_seconds=(raw1-raw0)/1e9,monotonic_seconds=(mono1-mono0)/1e9,utc_seconds=utc,
        raw_disagreement_seconds=disagreement,utc_disagreement_seconds=abs(utc-elapsed),
        warning=disagreement>0.005+0.002*elapsed or abs(utc-elapsed)>1,
        timing_quality='EXPLORATORY_CLOCK_LIMITED'))
    if result['boot_id']!=result['boot_id_after']:
        save(e.epoch_name('STOP'),dict(reason='BOOT_CHANGED',token=result['token']))
        raise RuntimeError('BOOT_CHANGED')
    return result


def capture_with_raw_check(*args, **kwargs):
    before_raw=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW)
    before_mono=time.monotonic_ns()
    result=CAPTURE_WITH_OLD_GATE(*args, **kwargs)
    after_mono=time.monotonic_ns()
    after_raw=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW)
    elapsed=(after_mono-before_mono)/1e9
    disagreement=abs(elapsed-(after_raw-before_raw)/1e9)
    e.lab.append(dict(event='raw_clock_check',token=result['token'],epoch=e.EPOCH,
           raw_ns=after_raw-before_raw,monotonic_ns=after_mono-before_mono,
           disagreement_seconds=disagreement,limit_seconds=0.005+0.002*elapsed))
    if disagreement>0.005+0.002*elapsed:
        save(e.epoch_name('STOP'),dict(status='BLOCKED_CLOCK_CROSSCHECK',token=result['token'],
             disagreement_seconds=disagreement,monotonic_seconds=elapsed))
        raise RuntimeError('Saved RAW/MONOTONIC contradiction; do not retry silently')
    return result


if e.EPOCH!='initial':
    e.capture=e.lab.capture=capture_with_raw_check
if WARN_CLOCK:
    e.gate=e.lab.execution_gate=limited_gate
    e.capture=e.lab.capture=limited_capture


def save(name, value):
    e.lab.save(H / name, value)


def records():
    path = H / 'runs.jsonl'
    if not path.exists():
        return []
    return [json.loads(line) for line in path.read_text(encoding='utf-8').splitlines()]


def inventory():
    output = e.subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    active = []
    for line in output.splitlines()[1:]:
        fields = line.split(None, 2)
        if len(fields) > 1 and (fields[1] in ['qjs', 'd8', 'gcc', 'cc1', 'make'] or fields[1].endswith('.qjs')):
            active.append(line)
        elif len(fields)>2 and int(fields[0])!=os.getpid() and fields[1].startswith('python'):
            tokens=fields[2].split()
            if '-c' not in tokens[:2] and any(str(H/'run.py')+' '+action in fields[2] for action in
                    ['sample','pipeline','finish','build','safety','explore','recover']):
                active.append(line)
    return output, active


def initialize():
    assert not (H / 'workspace.json').exists(), 'Existing v7 workspace must be resumed'
    output, active = inventory()
    assert not active, active
    for folder in ['identities', 'patches', 'scripts', 'raw', 'artifacts']:
        (H / folder).mkdir(exist_ok=True)
    identities = {}
    for label in ['A', 's001', 'P1']:
        identity = e.lab.load(V6 / 'identities' / (label + '.json'))
        assert e.lab.sha(identity['path']) == identity['sha256'], label
        assert Path(identity['path']).read_bytes()[:4] == b'\x7fELF'
        identities[label] = identity
        save('identities/' + label + '.json', identity)
    save('workspace.json', dict(artifacts=identities, active=str(H / 'active'),
                               source_revision='04be246001599f5995fa2f2d8c91a0f198d3f34c',
                               reference_commit='35c6b80445ca95e1b052574900625fd0a4cbc09c'))
    for kind in ['octane', 'sunspider']:
        info = e.lab.load(V6 / (kind + '.inputs.json'))
        e.measure.verify(info, ['A', 's001', 'P1'])
        save(kind + '.inputs.json', info)
    save('protocol.json', dict(seed=SEED, mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',
         compiler='GCC13.3', flags='-O2 -g -fwrapv -DHAVE_CLOSEFROM',
         warmup_calls=0, repeats='frozen complete N', serial=True,
         p1_rounds=5, screen_rounds=1, recheck_rounds=3,
         signal_rule='any case <=0.95 of actual parent, or suite GM <=0.98',
         maximum_representatives=4, bootstrap_draws=10000,
         timing_gate='same boot; UTC/outer monotonic disagreement <=1s; internal enclosed by external',
         failures='preserve every result and stop on actual semantic/timer failures'))
    save('initial_inventory.json', dict(timestamp=e.lab.stamp(), boot_id=e.lab.boot(), processes=output))
    print('V7_INITIALIZED', e.lab.boot(), flush=True)


def hold():
    save(e.epoch_name('keeper'), dict(pid=os.getpid(), boot_id=e.lab.boot()))
    print('KEEPER_READY', os.getpid(), e.lab.boot(), flush=True)
    while not (H / e.epoch_name('RELEASE_KEEPER')).exists():
        time.sleep(1)
    print('KEEPER_RELEASED', flush=True)


def explore():
    assert WARN_CLOCK and e.EPOCH!='initial'
    assert not (H/e.epoch_name('environment')).exists()
    output,active=inventory();assert not active,active
    os.sched_setaffinity(0,{2})
    for kind in ['octane','sunspider']:
        e.measure.verify(e.lab.load(H/(kind+'.inputs.json')),['A','s001','P1'])
    save(e.epoch_name('environment'),dict(timestamp=e.lab.stamp(),boot_id=e.lab.boot(),
        timing_quality='EXPLORATORY_CLOCK_LIMITED',prior_STOP_sha256=e.lab.sha(H/'STOP.json'),
        compiler=e.subprocess.check_output(['gcc','--version'],text=True),
        os_release=Path('/etc/os-release').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),
        memory=Path('/proc/meminfo').read_text(),processes=output,affinity=[2],
        protocol_amendment_sha256=e.lab.sha(H/'protocol_clock_warning.md')))
    info=e.lab.load(H/'octane.inputs.json')
    for label in ['A','s001']:
        e.measure.invoke(info,'limited_smoke','Richards.Richards',label,64,'v7_precheck',0,0,'precheck_'+e.EPOCH)
    save('precheck.'+e.EPOCH+'.json',dict(status='EXPLORATORY_CLOCK_LIMITED',boot_id=e.lab.boot()))
    print('LIMITED_EXPLORATION_READY',e.EPOCH,flush=True)


def precheck(attempt):
    output_name=('precheck.'+str(attempt) if e.EPOCH=='initial' else 'precheck.'+e.EPOCH+'.'+str(attempt))+'.json'
    assert not (H/output_name).exists(),'Preserve earlier finite prechecks'
    start = time.monotonic()
    observations = []
    for index in range(31):
        observations.append(dict(realtime_ns=time.time_ns(), monotonic_ns=time.monotonic_ns(),
                                 raw_ns=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW), boot=e.lab.boot()))
        if index < 30:
            time.sleep(1)
    first = observations[0]
    drift = max(abs((row['realtime_ns'] - first['realtime_ns']) -
                    (row['monotonic_ns'] - first['monotonic_ns'])) / 1e9 for row in observations)
    assert len({row['boot'] for row in observations}) == 1 and drift <= 1
    raw_drift=max(abs((row['raw_ns']-first['raw_ns'])-
                    (row['monotonic_ns']-first['monotonic_ns']))/1e9 for row in observations)
    if e.EPOCH!='initial':
        assert raw_drift<=0.05, ('RAW_MONOTONIC_DRIFT',raw_drift)
        save(e.epoch_name('clock_check'),dict(status='PASS_BOUNDED_CLOCK_CHECK',clock=observations,
                                           raw_monotonic_drift_seconds=raw_drift))
    output, active = inventory()
    assert not active, active
    compiler = e.subprocess.check_output(['gcc', '--version'], text=True)
    assert '13.3.0' in compiler.splitlines()[0]
    environment = dict(timestamp=e.lab.stamp(), boot_id=e.lab.boot(), uname=os.uname(),
                       os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
                       memory=Path('/proc/meminfo').read_text(), processes=output, compiler=compiler,
                       flags='-O2 -g -fwrapv -DHAVE_CLOSEFROM', affinity=[2],
                       power='UNKNOWN', temperature='UNKNOWN', background_isolation='UNKNOWN')
    if e.EPOCH!='initial':
        environment.update(prior_STOP_sha256=e.lab.sha(H/'STOP.json'),
                           clock_check=e.epoch_name('clock_check'),prior_data_pooled=False)
    if not (H / e.epoch_name('environment')).exists():
        save(e.epoch_name('environment'), environment)
    e.gate()
    os.sched_setaffinity(0, {2})
    info = e.lab.load(H / 'octane.inputs.json')
    checked = []
    for case in ['Richards.Richards', 'Splay.Splay', 'Typescript.Typescript']:
        n = max(1, info['N'][case] // 4)
        for label in ['A', 's001']:
            row = e.measure.invoke(info, 'precheck', case, label, n, 'v7_precheck', 0, 0, 'precheck' + str(attempt))
            checked.append(row['process_token'])
    save(('precheck.'+str(attempt) if e.EPOCH=='initial' else 'precheck.'+e.EPOCH+'.'+str(attempt))+'.json', dict(status='PASS', clock=observations,
         max_drift_seconds=drift, processes=checked, elapsed_seconds=time.monotonic() - start))
    print('PRECHECK_PASS', attempt, drift, flush=True)


def recover():
    assert e.EPOCH!='initial','Use a new V7_EPOCH, never remove STOP'
    assert not (H/e.epoch_name('environment')).exists(),'Recovery is finite; preserve failed attempts'
    assert e.lab.boot()!=e.lab.load(H/'environment.json')['boot_id'],'Restore WSL first; no third retry on the old boot'
    assert (H/'STOP.json').exists()
    assert not (H/('recovery.'+e.EPOCH+'.requested.json')).exists(),'Use a new epoch; preserve failed recovery records'
    save('recovery.'+e.EPOCH+'.requested.json',dict(boot_id=e.lab.boot(),prior_STOP_sha256=e.lab.sha(H/'STOP.json')))
    precheck(1)


def plan(name, labels, rounds):
    assert len(set(labels)) == len(labels) and 'A' in labels and 's001' in labels
    rng = random.Random(SEED)
    ordered_labels = labels[:]
    rng.shuffle(ordered_labels)
    order = []
    cases = [(kind, case) for kind in ['octane', 'sunspider']
             for case in e.lab.load(H / (kind + '.inputs.json'))['cases']]
    for rep in range(rounds):
        shuffled = cases[:]
        rng.shuffle(shuffled)
        for kind, case in shuffled:
            index = cases.index((kind, case))
            offset = (index + rep) % len(labels)
            conditions = ordered_labels[offset:] + ordered_labels[:offset]
            if index % 2:
                conditions.reverse()
            n = e.lab.load(H / (kind + '.inputs.json'))['N'][case]
            order.append(dict(kind=kind, case=case, N=n, rep=rep, conditions=conditions))
    value = dict(name=name, labels=labels, rounds=rounds, order=order, seed=SEED,
                 boot_id=e.lab.boot(), mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',
                 artifacts={label: e.measure.artifact(label) for label in labels},
                 runner_sha256=e.lab.sha(Path(__file__)), warmup_calls=0)
    value['epoch']=e.EPOCH
    value['timing_quality']='EXPLORATORY_CLOCK_LIMITED' if WARN_CLOCK else 'STRICT_GATE'
    save('protocol.' + name + '.json', value)
    return value


def sample(name, labels, rounds, round_limit):
    e.gate()
    assert any(e.lab.load(path).get('status') in (['EXPLORATORY_CLOCK_LIMITED'] if WARN_CLOCK else ['PASS']) for path in H.glob('precheck.*.json'))
    _, active = inventory()
    assert not active, active
    for label in labels:
        if label not in ['A','s001','P1','a02']:
            assert e.lab.load(H / ('correctness.'+label+'.json'))['status']=='PASS'
            assert e.lab.load(H / ('sanitizer.'+label+'.json'))['status']=='PASS'
    os.sched_setaffinity(0, {2})
    path = H / ('protocol.' + name + '.json')
    protocol = e.lab.load(path) if path.exists() else plan(name, labels, rounds)
    assert protocol['labels'] == labels and protocol['rounds'] == rounds
    assert protocol['boot_id'] == e.lab.boot()
    prior = [row for row in records() if row['event'] == 'measurement' and row['campaign'] == name]
    assert all(row['valid'] for row in prior), 'Review preserved failed samples before resume'
    seen = {(row['kind'], row['case'], row['condition'], row['rep']) for row in prior}
    assert len(seen) == len(prior)
    limit = rounds if round_limit is None else round_limit
    for group in protocol['order']:
        if group['rep'] >= limit:
            continue
        info = e.lab.load(H / (group['kind'] + '.inputs.json'))
        e.measure.verify(info, labels)
        for position, label in enumerate(group['conditions']):
            key = group['kind'], group['case'], label, group['rep']
            if key in seen:
                continue
            row = e.measure.invoke(info, name, group['case'], label, group['N'], 'v7_execution',
                                   position, group['rep'], name)
            seen.add(key)
        print('GROUP_COMPLETE', name, group['rep'], group['kind'], group['case'], len(seen), flush=True)
    for kind in ['octane', 'sunspider']:
        e.measure.verify(e.lab.load(H / (kind + '.inputs.json')), labels)
    save(name + '.rounds' + str(limit) + '.completed.json', dict(status='COMPLETE_REQUESTED_ROUNDS',
         valid=len(seen), rounds_completed=limit, rounds_planned=rounds, boot_id=e.lab.boot()))
    print('COMPLETED_ROUNDS', name, limit, len(seen), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['init', 'hold', 'precheck', 'sample', 'build', 'safety','recover','explore','pipeline','finish'])
    parser.add_argument('--label')
    parser.add_argument('--attempt', type=int, default=1)
    parser.add_argument('--name')
    parser.add_argument('--labels', nargs='+')
    parser.add_argument('--rounds', type=int, default=1)
    parser.add_argument('--round-limit', type=int)
    args = parser.parse_args()
    if args.action == 'init':
        initialize()
    elif args.action == 'hold':
        hold()
    elif args.action == 'explore':
        explore()
    elif args.action == 'pipeline':
        import pipeline
        pipeline.run(args.labels)
    elif args.action == 'finish':
        import finish
        finish.run()
    elif args.action == 'recover':
        recover()
    elif args.action == 'precheck':
        try:
            precheck(args.attempt)
        except Exception as error:
            save('precheck.' + str(args.attempt) + '.json', dict(status='FAIL', error=str(error), boot_id=e.lab.boot()))
            raise
    elif args.action in ['build','safety']:
        import builder
        getattr(builder,args.action)(args.label)
    else:
        sample(args.name, args.labels, args.rounds, args.round_limit)

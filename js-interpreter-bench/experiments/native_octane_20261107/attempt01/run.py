"""Native Linux replication of frozen IC implementations, Octane only.

Independent cohort. Historical sources/inputs/evidence remain read-only.
Build and measure serially; each sample is a fresh process, first Run included.
"""
import argparse
import collections
import csv
import datetime
import gzip
import hashlib
import importlib.util
import io
import itertools
import json
import math
import os
from pathlib import Path
import platform
import random
import shutil
import signal
import statistics as st
import subprocess
import sys
import tarfile
import time
import zipfile

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
LAB = ROOT / 'experiments/ic_search_lab'
LABELS = ['A', 's001', 'mx019', 'd03', 'B2', 'P1', 'ID_CTRL', 'V8_ON']
REPEATS, SEED, CPU = 5, 2026110701, 2
INFO = LAB / 'v7_adaptive_layout/octane.inputs.json'
GOLD = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto'


def load(p):
    return json.loads(Path(p).read_text())


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def stamp():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def boot():
    return Path('/proc/sys/kernel/random/boot_id').read_text().strip()


def save(name, value):
    p = H / name
    p.parent.mkdir(parents=True, exist_ok=True)
    data = value if isinstance(value, bytes) else (value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2) + '\n').encode()
    if p.exists():
        assert p.read_bytes() == data, 'preserve existing evidence: ' + str(p)
    else:
        with p.open('xb') as f:
            f.write(data)


def append(row):
    with (H / 'runs.jsonl').open('a', encoding='utf-8') as f:
        f.write(json.dumps(row, ensure_ascii=False) + '\n')
        f.flush()
        os.fsync(f.fileno())


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def records():
    if (H / 'runs.jsonl').exists():
        data = (H / 'runs.jsonl').read_bytes()
    elif (H / 'raw/runs.jsonl.gz').exists():
        data = gzip.decompress((H / 'raw/runs.jsonl.gz').read_bytes())
    else:
        return []
    return [json.loads(s) for s in data.splitlines()]


def capture(command, stage, name, timeout=180, cwd=None, identity=None):
    command = list(map(str, command))
    token = stage + '/' + name
    old = [r for r in records() if r.get('token') == token]
    assert not old, 'prior invocation exists; no implicit retry: ' + token
    bid = boot()
    utc0 = stamp()
    raw0, begin = time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW), time.monotonic_ns()
    with open(os.devnull, 'rb') as null, __import__('tempfile').TemporaryFile() as out, __import__('tempfile').TemporaryFile() as err:
        p = subprocess.Popen(command, cwd=cwd or ROOT, stdin=null, stdout=out, stderr=err, start_new_session=True)
        append(dict(event='process_start', token=token, timestamp=utc0, command=command,
                    cwd=str(cwd or ROOT), child_pid=p.pid, boot_id=bid, identity=identity))
        timed = False
        while True:
            pid, status, usage = os.wait4(p.pid, os.WNOHANG)
            if pid:
                break
            if (time.monotonic_ns() - begin) / 1e9 > timeout:
                timed = True
                os.killpg(p.pid, signal.SIGKILL)
                pid, status, usage = os.wait4(p.pid, 0)
                break
            time.sleep(.01)
        p.returncode = os.waitstatus_to_exitcode(status)
        end, raw1 = time.monotonic_ns(), time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW)
        out.seek(0)
        err.seek(0)
        row = dict(event='process_result', token=token, timestamp=utc0, completed_at=stamp(),
                   command=command, cwd=str(cwd or ROOT), child_pid=p.pid, boot_id=bid, boot_id_after=boot(),
                   exit_code=p.returncode, timeout=timed, stdout=out.read().decode('utf-8', errors='replace'),
                   stderr=err.read().decode('utf-8', errors='replace'), outer_start_ns=begin, outer_stop_ns=end,
                   external_wall_ms=(end-begin)/1e6, child_user_ms=usage.ru_utime*1000,
                   child_system_ms=usage.ru_stime*1000, peak_rss_kib=usage.ru_maxrss,
                   raw_minus_monotonic_ms=((raw1-raw0)-(end-begin))/1e6, identity=identity)
    row['utc_minus_monotonic_ms'] = (datetime.datetime.fromisoformat(row['completed_at']) - datetime.datetime.fromisoformat(utc0)).total_seconds()*1000 - row['external_wall_ms']
    append(row)
    return row


def environment():
    commands = dict(cpu=['lscpu', '-J'], compiler=['gcc', '--version'], python=['python3', '--version'],
                    glibc=['ldd', '--version'], processes=['ps', '-eo', 'pid,comm,pcpu,pmem'],
                    memory=['free', '-b'])
    result = {k: subprocess.check_output(v, text=True) for k,v in commands.items()}
    topology = {}
    for rel in ['topology/thread_siblings_list', 'topology/core_id', 'topology/core_type',
                'cpufreq/cpuinfo_max_freq', 'cpufreq/scaling_governor']:
        p = Path('/sys/devices/system/cpu') / ('cpu'+str(CPU)) / rel
        topology[rel] = p.read_text().strip() if p.exists() else 'UNKNOWN'
    result.update(timestamp=stamp(), boot_id=boot(), uname=platform.uname()._asdict(),
                  os_release=Path('/etc/os-release').read_text(), affinity=[CPU], topology=topology,
                  temperature_frequency_power_control='UNKNOWN', background_isolation='UNKNOWN',
                  existing_user_settings_changed=False)
    return result


def materialize():
    assert platform.system() == 'Linux' and platform.machine() == 'x86_64'
    assert CPU in os.sched_getaffinity(0)
    os.sched_setaffinity(0, {CPU})
    if (H / 'protocol.json').exists():
        verify()
        return
    assert not (H / 'work').exists(), 'use an empty attempt'
    work = H / 'work'
    work.mkdir()
    save('environment.before.json', environment())
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    info = load(INFO)
    assert len(info['cases']) == 17
    for p, h in info['files'].items():
        assert sha(ROOT/p) == h, p
    save('inputs.json', info)
    seed = module('native_seed', LAB/'v3_mass_search/generate.py')
    v6 = module('native_v6', LAB/'v6_targeted_ic/variants.py')
    original_s001 = seed.seed('s001')
    support_archive = LAB/'v3_mass_search/build_support.tar.gz'
    with tarfile.open(support_archive) as t:
        support = t.extractfile('compat/test-closefrom.c').read()
    source_info = {}
    for label in LABELS[:-1]:
        dest = work/label
        identity = None
        if label in ['A', 's001']:
            files = seed.seed(label)
        elif label == 'mx019':
            p = subprocess.run([sys.executable, '-B', str(LAB/'v4_refine_s001/recover.py'), label, str(dest)], capture_output=True, text=True)
            save('source_recovery.mx019.json', dict(exit_code=p.returncode, stdout=p.stdout, stderr=p.stderr))
            assert p.returncode == 0, p.stderr
            files = {p.name:p.read_bytes().decode() for p in dest.iterdir() if p.is_file()}
            identity = load(LAB/'v4_refine_s001/identities/mx019.json')
        elif label == 'd03':
            identity = load(LAB/'v5_structural/identities/d03.json')
            patch = LAB/'v5_structural/patches/d03.patch'
            assert sha(patch) == identity['patch_sha256']
            files = v6.patch_apply(original_s001, patch.read_text())
        else:
            identity = load(LAB/'v6_targeted_ic/identities'/(label+'.json'))
            files = v6.render(label, original_s001.copy())
        hashes = {n:hashlib.sha256(s.encode()).hexdigest() for n,s in files.items()}
        if identity:
            assert hashes == identity['source_sha256'], 'historical source mismatch: '+label
        if label == 'A':
            with tarfile.open(ROOT/'experiments/three_engine_baseline/quickjs-04be246-source.tar') as t:
                for name, text in files.items():
                    if name.endswith(('.c','.h')) and name != 'repl.c':
                        assert t.extractfile(name).read().decode().replace('\r\n','\n') == text
        dest.mkdir(exist_ok=label == 'mx019')
        for n,s in files.items():
            p = dest/n
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(s.encode())
        (dest/'compat').mkdir(exist_ok=True)
        (dest/'compat/test-closefrom.c').write_bytes(support)
        source_info[label] = dict(files=hashes, support_sha256=hashlib.sha256(support).hexdigest(),
                                  historical_source_hash_match=bool(identity), normalized_upstream_verified=label=='A')
    archive = ROOT/'engines/v8-official-linux64-15.6.21/v8-linux64-rel-15.6.21.zip'
    old_v8 = load(ROOT/'experiments/three_engine_baseline/manifest.json')['engines']['v8']
    assert sha(archive) == old_v8['archive']['sha256']
    with zipfile.ZipFile(archive) as z:
        z.extractall(work/'V8_ON')
    (work/'V8_ON/d8').chmod(0o755)
    for a in [old_v8['binary'], *old_v8['dependencies']]:
        assert sha(work/'V8_ON'/Path(a['path']).name) == a['sha256']
    sys.path.insert(0, str(LAB))
    import measure
    measure.HERE = H
    scripts = {}
    for case in info['cases']:
        scripts[case] = {}
        for phase,n in [('correctness',1),('measure',info['N'][case])]:
            p = measure.script(info, case, n, phase)
            scripts[case][phase] = dict(path=str(p), sha256=sha(p), N=n)
    protocol = dict(cohort_id='native-ubuntu2604-i9-14900-gcc15-20261107-attempt01',
                    labels=LABELS, candidate_labels=['s001','mx019','d03','B2','P1'],
                    additional_control='ID_CTRL (layout-version maintenance; not an independent IC optimization winner)',
                    repetitions=REPEATS, seed=SEED, affinity=[CPU], benchmark='Octane',
                    cases=info['cases'], N=info['N'], N_policy='frozen common repetitions, unchanged across all native conditions',
                    metric='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1, ms per complete Run',
                    process_policy='one fresh process per sample; serial builds and runs', warmup_calls=0,
                    flags=dict(V8_ON=['--jitless','--no-lazy','--use-ic']), V8_OFF_requested=False,
                    sunspider_requested=False, formal_30_process_confirmation=False,
                    compiler='local GCC15.2; all QuickJS conditions rebuilt with identical defaults',
                    build_flags='-O2 -g -fwrapv -DHAVE_CLOSEFROM, no added LTO/PGO/NDEBUG/march=native',
                    aggregate='suite-equal GM of within-suite GM of per-case median ratios; core16/13 plus expanded17/14',
                    ci='10000 paired whole-round bootstrap draws, fixed seed; exploratory; no multiple-testing correction',
                    preserve_all_outliers=True, no_automatic_failure_retry=True,
                    cross_platform_comparison='within-cohort candidate/A ratios and descriptive per-Run times; no pooled samples',
                    scripts=scripts, runner_sha256=sha(Path(__file__)))
    save('source_manifest.json', source_info)
    save('protocol.json', protocol)
    print('PREPARED', protocol['cohort_id'], flush=True)


def verify():
    p = load(H/'protocol.json')
    assert sha(Path(__file__)) == p['runner_sha256'], 'runner changed after protocol freeze'
    assert boot() == load(H/'environment.before.json')['boot_id'], 'new boot requires a new attempt'
    for name,h in load(H/'inputs.json')['files'].items():
        assert sha(ROOT/name) == h, name
    for scripts in p['scripts'].values():
        for script in scripts.values():
            assert sha(script['path']) == script['sha256']
    if (H/'runtime_manifest.json').exists():
        for label,identity in load(H/'runtime_manifest.json').items():
            assert sha(identity['path']) == identity['sha256'], label
            for dep in identity.get('dependencies',[]):
                assert sha(dep['path']) == dep['sha256']
    return p


def build():
    verify()
    os.sched_setaffinity(0, {CPU})
    identities = {}
    for label in LABELS[:-1]:
        dest = H/'work'/label
        name = 'build/'+label+'.json'
        if not (H/name).exists():
            result = capture(['make','-j1','qjs','qjsc'], 'build', label, 240, cwd=dest)
            save(name, result)
        result = load(H/name)
        assert result['exit_code'] == 0 and not result['timeout'], result['stderr'][-2000:]
        line = next(s for s in result['stdout'].splitlines() if ' -c -o .obj/quickjs.o ' in s)
        assert all(f in line for f in ['-O2','-g','-fwrapv','-DHAVE_CLOSEFROM'])
        assert not any(f in line for f in ['-O3','-DNDEBUG','-flto','-fprofile','-march=native'])
        identities[label] = dict(path=str(dest/'qjs'), sha256=sha(dest/'qjs'), qjsc_sha256=sha(dest/'qjsc'), compile_line=line)
        print('BUILT', label, identities[label]['sha256'], flush=True)
    dest = H/'work/V8_ON'
    identities['V8_ON'] = dict(path=str(dest/'d8'), sha256=sha(dest/'d8'), dependencies=[dict(path=str(dest/n), sha256=sha(dest/n)) for n in ['snapshot_blob.bin','icudtl.dat']])
    save('runtime_manifest.json', identities)


def invocation(label, case, phase):
    info = load(H/'protocol.json')['scripts'][case][phase]
    runtime = load(H/'runtime_manifest.json')[label]
    cmd = [runtime['path']]
    if label == 'V8_ON':
        cmd += ['--snapshot_blob='+str(H/'work/V8_ON/snapshot_blob.bin'), '--jitless','--no-lazy','--use-ic']
    elif case == 'zlib.zlib':
        cmd += ['--std','-I',str(ROOT/'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
    return cmd + [info['path']], info


def execute(label, case, phase, rep, order):
    command, script = invocation(label, case, phase)
    identity = dict(condition=label, case=case, N=script['N'], phase=phase, rep=rep, order=order,
                    binary_sha256=load(H/'runtime_manifest.json')[label]['sha256'], script_sha256=script['sha256'])
    result = capture(command, phase, f'{rep}/{case}/{label}', 240, identity=identity)
    payload, reason = {}, None
    try:
        assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr'], 'exit/timeout/stderr'
        lines = [s[len('OCTANE_IC_RESULT:'):] for s in result['stdout'].splitlines() if s.startswith('OCTANE_IC_RESULT:')]
        assert len(lines) == 1, 'payload count'
        payload = json.loads(lines[0])
        assert payload['case'] == case and payload['N'] == script['N'] and payload['phase'] == phase
        assert payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
        if case.startswith('Crypto.'):
            assert payload['checksum'] == load(GOLD/(case+'.N'+str(script['N'])+'.json'))['final_ciphertext'], 'Crypto input/ciphertext identity'
        elapsed = payload['elapsed_ms']
        assert math.isfinite(elapsed) and 0 < elapsed <= result['external_wall_ms']+5, 'clock enclosure'
        assert elapsed == payload['stop_ms']-payload['start_ms']
        assert result['boot_id'] == result['boot_id_after'] == load(H/'environment.before.json')['boot_id']
        assert abs(result['raw_minus_monotonic_ms']) <= 5 + .002*result['external_wall_ms'], 'RAW/monotonic divergence'
        assert abs(result['utc_minus_monotonic_ms']) <= 1000, 'UTC/monotonic divergence'
        assert sha(command[0]) == identity['binary_sha256']
    except (AssertionError,KeyError,ValueError,TypeError) as exc:
        reason = str(exc)
    row = dict(event='measurement' if phase=='measure' else 'correctness', token=result['token'],
               valid=reason is None, failed_reason=reason, performance_sample=phase=='measure',
               **identity, payload=payload, elapsed_ms=payload.get('elapsed_ms'),
               elapsed_per_Run_ms=payload.get('elapsed_ms',0)/script['N'],
               external_wall_ms=result['external_wall_ms'], below_1000ms=payload.get('elapsed_ms',0)<1000)
    append(row)
    assert row['valid'], 'preserved failure, no retry: '+str(reason)
    return row


def correctness():
    verify()
    os.sched_setaffinity(0,{CPU})
    old = {r['token']:r for r in records() if r['event']=='correctness'}
    for label in LABELS:
        for case in load(H/'inputs.json')['cases']:
            token=f'correctness/0/{case}/{label}'
            if token in old:
                assert old[token]['valid']
            else:
                execute(label,case,'correctness',0,LABELS.index(label))
        print('CORRECTNESS_PASS',label,'17/17',flush=True)
    save('correctness_gate.json',dict(status='PASS',records=17*len(LABELS),N=1,all_Crypto_ciphertext_checked=True))


def schedule():
    cases=load(H/'inputs.json')['cases']
    orders={}
    for case in cases:
        labels=LABELS.copy()
        random.Random(str(SEED)+case).shuffle(labels)
        orders[case]=labels
    plan=[]
    for rep in range(REPEATS):
        order=cases.copy()
        random.Random(SEED+rep).shuffle(order)
        for case in order:
            labels=orders[case]
            shift=(3*rep)%len(labels)
            for position,label in enumerate(labels[shift:]+labels[:shift]):
                plan.append(dict(rep=rep,case=case,condition=label,order=position))
    return plan


def measure():
    verify()
    assert load(H/'correctness_gate.json')['status']=='PASS'
    os.sched_setaffinity(0,{CPU})
    plan=schedule()
    save('schedule.json',plan)
    old={r['token']:r for r in records() if r['event']=='measurement'}
    for i,row in enumerate(plan):
        label,case,rep,pos=row['condition'],row['case'],row['rep'],row['order']
        token=f'measure/{rep}/{case}/{label}'
        if token in old:
            assert old[token]['valid']
            continue
        sample=execute(label,case,'measure',rep,pos)
        print('SAMPLE',i+1,len(plan),'round',rep+1,case,label,round(sample['elapsed_per_Run_ms'],6),'ms/Run',flush=True)
    verify()
    save('environment.after.json',environment())
    print('MEASURE_COMPLETE',len(plan),flush=True)


def csvout(name,rows):
    stream=io.StringIO(newline='')
    writer=csv.DictWriter(stream,list(dict.fromkeys(k for r in rows for k in r)),lineterminator='\n')
    writer.writeheader();writer.writerows(rows)
    (H/name).write_text(stream.getvalue())


def gm(values):
    return math.exp(st.mean(math.log(v) for v in values))


def suite_gm(ratios):
    suites=collections.defaultdict(list)
    for case,value in ratios.items():
        suites[case.split('.')[0]].append(value)
    return gm(gm(v) for v in suites.values())


def analyze():
    data=[r for r in records() if r['event']=='measurement']
    assert len(data)==17*len(LABELS)*REPEATS and all(r['valid'] for r in data)
    values=collections.defaultdict(dict)
    for r in data:
        key=r['case'],r['condition']
        assert r['rep'] not in values[key]
        values[key][r['rep']]=r['elapsed_per_Run_ms']
    assert all(set(v)==set(range(REPEATS)) for v in values.values())
    med={k:st.median(v.values()) for k,v in values.items()}
    statistics=[]
    for (case,label),rs in sorted(values.items()):
        nums=sorted(rs.values());half=len(nums)//2;q1=st.median(nums[:half]);q3=st.median(nums[-half:])
        statistics.append(dict(case=case,condition=label,N=load(H/'inputs.json')['N'][case],n=len(nums),
              median_ms=med[case,label],mean_ms=st.mean(nums),sample_stddev=st.stdev(nums),q1=q1,q3=q3,IQR=q3-q1,
              min=min(nums),max=max(nums),over_A=med[case,label]/med[case,'A'],over_V8_ON=med[case,label]/med[case,'V8_ON']))
    csvout('statistics.csv',statistics)
    rng=random.Random(SEED)
    draws=[tuple(sorted(rng.choices(range(REPEATS),k=REPEATS))) for _ in range(10000)]
    unique=set(draws)
    sampled={(key,indices):st.median(rounds[i] for i in indices) for key,rounds in values.items() for indices in unique}
    cases=load(H/'inputs.json')['cases'];aggregates=[];pairs=[]
    for label in LABELS:
        for denominator in ['A','V8_ON','s001']:
            if label==denominator:
                continue
            for case in cases:
                dist=sorted(sampled[((case,label),i)]/sampled[((case,denominator),i)] for i in draws)
                pairs.append(dict(case=case,condition=label,denominator=denominator,ratio=med[case,label]/med[case,denominator],low95=dist[249],high95=dist[9749]))
            for subset in ['core16_13suite','expanded17_14suite']:
                selected=[c for c in cases if subset.startswith('expanded') or c!='zlib.zlib']
                ratio=suite_gm({c:med[c,label]/med[c,denominator] for c in selected})
                cache={i:suite_gm({c:sampled[((c,label),i)]/sampled[((c,denominator),i)] for c in selected}) for i in unique}
                dist=sorted(cache[i] for i in draws)
                rounds=[suite_gm({c:values[c,label][i]/values[c,denominator][i] for c in selected}) for i in range(REPEATS)]
                aggregates.append(dict(subset=subset,condition=label,denominator=denominator,ratio=ratio,
                       change_pct=100*(ratio-1),low95=dist[249],high95=dist[9749],rounds=REPEATS,per_round_ratios=json.dumps(rounds)))
    csvout('paired_ratios.csv',pairs);csvout('aggregate.csv',aggregates)
    print('ANALYSIS_COMPLETE',len(statistics),len(aggregates),flush=True)


def audit():
    protocol=load(H/'protocol.json');allrows=records()
    starts={};ends={}
    for r in allrows:
        if r['event']=='process_start':assert r['token'] not in starts;starts[r['token']]=r
        elif r['event']=='process_result':assert r['token'] not in ends;ends[r['token']]=r
    assert starts.keys()==ends.keys()
    for token,r in ends.items():
        assert starts[token]['command']==r['command']
        assert r['boot_id']==r['boot_id_after']==load(H/'environment.before.json')['boot_id']
        assert r['exit_code']==0 and not r['timeout']
    intervals=sorted(ends.values(),key=lambda r:r['outer_start_ns'])
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(intervals,intervals[1:]))
    measures=[r for r in allrows if r['event']=='measurement']
    actual=[dict(rep=r['rep'],case=r['case'],condition=r['condition'],order=r['order']) for r in measures]
    assert actual==load(H/'schedule.json')==schedule()
    assert len(measures)==680 and all(r['valid'] for r in measures)
    for r in measures:
        result=ends[r['token']]
        assert result['identity']['binary_sha256']==load(H/'runtime_manifest.json')[r['condition']]['sha256']
        assert result['identity']['script_sha256']==protocol['scripts'][r['case']]['measure']['sha256']
        assert r['payload']['elapsed_ms']==r['elapsed_ms']
        assert not result['stderr'] and r['payload']['warmup_calls']==0
        assert r['payload']['N']==protocol['N'][r['case']]
        command,_=invocation(r['condition'],r['case'],'measure')
        assert command==result['command']
    report=dict(status='PASS_COMPLETE',performance_samples=len(measures),correctness_records=sum(r['event']=='correctness' for r in allrows),
                samples_per_cell=REPEATS,cases=17,conditions=LABELS,all_fresh_processes=True,serial_intervals_verified=True,
                all_expected_positions_verified=True,all_inputs_flags_scripts_and_binary_identity_verified=True,
                below_1000ms_retained=sum(r['below_1000ms'] for r in measures),
                maximum_raw_clock_disagreement_ms=max(abs(r['raw_minus_monotonic_ms']) for r in ends.values()),
                maximum_utc_clock_disagreement_ms=max(abs(r['utc_minus_monotonic_ms']) for r in ends.values()),
                sunspider_samples=0,V8_OFF_samples=0,formal_30_process_confirmation=False)
    save('audit.json',report)
    raw=(H/'runs.jsonl').read_bytes();packed=gzip.compress(raw,mtime=0)
    save('raw/runs.jsonl.gz',packed)
    save('raw/archive.json',dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),uncompressed_sha256=hashlib.sha256(raw).hexdigest(),
                                compressed_bytes=len(packed),uncompressed_bytes=len(raw)))
    print(json.dumps(report),flush=True)


def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['prepare','build','correctness','measure','analyze','audit','all']);args=p.parse_args()
    stages=[materialize,build,correctness,measure,analyze,audit] if args.stage=='all' else [dict(prepare=materialize,build=build,correctness=correctness,measure=measure,analyze=analyze,audit=audit)[args.stage]]
    for stage in stages:
        stage()


if __name__=='__main__':
    main()

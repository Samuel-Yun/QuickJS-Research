"""Bounded Richards timing supplement. Run under the existing Ubuntu WSL2.

No VM modifications. Every command record/generated input is write-once.
Formal A/B use only the frozen release binaries; diagnostics stay separate.
"""
import argparse
from collections import Counter, defaultdict
import csv
from datetime import datetime, timezone
import difflib
import hashlib
import io
import json
import math
import os
from pathlib import Path
import platform
import random
import re
import shutil
import statistics
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OLD = ROOT / 'experiments/richards_site_attribution/attempt01'
FOLLOW = ROOT / 'experiments/call_path_followup/attempt01'
UP = ROOT / 'benchmarks/octane/upstream'
ENGINES = ('quickjs', 'v8')
CASES = ('richards_run', 'left_true', 'left_false_right_true', 'left_false_right_false')
SEED = 20261018
MODE = 'FIRST_CALL_INCLUSIVE_INTERNAL_MONOTONIC_BATCH_NO_WARMUP'
TARGET = b'TaskControlBlock.prototype.isHeldOrSuspended = function () {'


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def save(p, v):
    p = Path(p)
    data = v if isinstance(v, bytes) else (v if isinstance(v, str) else json.dumps(v, ensure_ascii=False, indent=2)+'\n').encode()
    if p.exists():
        if p.read_bytes() != data:
            raise RuntimeError('Write-once conflict: '+str(p))
    else:
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(data)


def export(p, rows):
    out = io.StringIO(newline='')
    w = csv.DictWriter(out, fieldnames=list(rows[0]))
    w.writeheader()
    for row in rows:
        w.writerow({k: json.dumps(v, separators=(',', ':')) if isinstance(v, (list, dict)) else v for k, v in row.items()})
    save(p, out.getvalue())


def capture(p, cmd, timeout=30, env=None, cwd=None):
    p = Path(p)
    if p.exists():
        r = read(p)
        assert r['command'] == list(map(str, cmd)), 'cached command mismatch'
        return r
    start = time.perf_counter_ns()
    stamp = datetime.now(timezone.utc).isoformat()
    try:
        done = subprocess.run(list(map(str, cmd)), cwd=cwd or ROOT, env=env,
                              capture_output=True, timeout=timeout)
        r = dict(exit_code=done.returncode, stdout=done.stdout.decode(errors='replace'),
                 stderr=done.stderr.decode(errors='replace'), timeout=False)
    except subprocess.TimeoutExpired as exc:
        r = dict(exit_code=None, stdout=(exc.stdout or b'').decode(errors='replace'),
                 stderr=(exc.stderr or b'').decode(errors='replace'), timeout=True)
    r.update(command=list(map(str, cmd)), cwd=str(cwd or ROOT), timestamp_utc=stamp,
             outer_wall_ns=time.perf_counter_ns()-start, load_average=os.getloadavg(),
             boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
             LD_PRELOAD=(env or os.environ).get('LD_PRELOAD'))
    save(p, r)
    return r


def manifest():
    return read(HERE/'manifest.json')


def verify():
    m = manifest()
    assert sys.platform == 'linux' and platform.machine() == 'x86_64'
    assert (platform.node(), platform.release()) == (m['host'], m['kernel'])
    assert not os.environ.get('LD_PRELOAD')
    assert not any(k.startswith(('SA_', 'ML_', 'CF_SAMPLE')) for k in os.environ), 'diagnostic env leaked'
    for engine in ENGINES:
        r = m['engines'][engine]
        for item in [r['binary']] + r['dependencies'] + r['dynamic_libraries'] + m['adapters'][engine]:
            assert sha(item['path']) == item['sha256'], 'artifact changed: '+item['path']
    for rel, digest in m['inputs'].items():
        assert sha(ROOT/rel) == digest, rel
    return m


def command(engine, script, extra=(), diagnostic_qjs=False):
    m = manifest()
    cmd = list(m['engines'][engine]['command_prefix'])
    if diagnostic_qjs:
        cmd[0] = m['diagnostic_quickjs']['binary']
    cmd += list(extra)
    for a in m['adapters'][engine]:
        cmd += ['-I', a['path']] if engine == 'quickjs' else [a['path']]
    return cmd + [str(script)]


def target_bytes():
    raw = (UP/'richards.js').read_bytes()
    assert raw.count(TARGET) == 1
    lo = raw.index(TARGET)
    hi = raw.index(b'\n};', lo)+3
    return raw[lo:hi]


def prepare():
    if (HERE/'manifest.json').exists():
        verify()
        print('PREPARE_RESUME_IDENTITY_PASS', flush=True)
        return
    assert sys.platform == 'linux', 'Run inside the existing Ubuntu WSL2, not Windows/Node'
    prior = read(OLD/'manifest.json')
    checks = []
    for e in ENGINES:
        r = prior['engines'][e]
        for f in [r['binary']] + r['dependencies'] + r['dynamic_libraries'] + prior['adapters'][e]:
            exists = Path(f['path']).is_file()
            actual = sha(f['path']) if exists else None
            checks.append(dict(path=f['path'], expected=f['sha256'], actual=actual, valid=actual==f['sha256']))
    host_match = (platform.node(), platform.release(), platform.machine()) == (prior['host'], prior['kernel'], prior['architecture'])
    save(HERE/'raw/artifact_preflight.json', dict(checks=checks, host_match=host_match,
         actual_host=platform.node(), actual_kernel=platform.release(), architecture=platform.machine()))
    if not all(x['valid'] for x in checks) or not host_match:
        raise RuntimeError('BLOCKED_RUNTIME_IDENTITY: inspect raw/artifact_preflight.json; no silent cohort change')
    source = (UP/'richards.js').read_text()
    constants = {k: int(re.search(r'var '+k+r'\s*=\s*(\d+)\s*;', source)[1])
                 for k in ('STATE_HELD', 'STATE_SUSPENDED', 'STATE_RUNNING', 'COUNT', 'EXPECTED_QUEUE_COUNT', 'EXPECTED_HOLD_COUNT')}
    cases = {'left_true': ('STATE_HELD', True), 'left_false_right_true': ('STATE_SUSPENDED', True),
             'left_false_right_false': ('STATE_RUNNING', False)}
    case_info = {}
    for key, (name, expected) in cases.items():
        state = constants[name]
        left = bool(state & constants['STATE_HELD'])
        right = state == constants['STATE_SUSPENDED']
        assert (left or right) is expected
        case_info[key] = dict(state_constant=name, state=state, expected=expected, left=left, right=right,
                              expected_state_reads=1 if left else 2)
    driver = (FOLLOW/'richards/original.N1.js').read_bytes()
    assert driver.count((UP/'richards.js').read_bytes()) == 1
    assert driver.count(b'__cfRep<1;') == driver.count(b'N:1,') == 1
    tier = read(ROOT/'experiments/three_engine_baseline/probes/tier/summary.json')
    assert tier['v8']['pass'] and tier['quickjs']['pass']
    assert prior['engines']['v8']['runtime_flags'] == ['--max-opt=0', '--no-lazy']
    tracked = [UP/'base.js', UP/'richards.js', FOLLOW/'richards/original.N1.js', OLD/'manifest.json',
               OLD/'summary/site_samples.csv', OLD/'summary/perturbation.json',
               ROOT/'experiments/three_engine_baseline/probes/tier/summary.json',
               ROOT/'experiments/bytecode_whitebox_simple/attempt01/source_evidence/qjs_monotonic_clock.txt']
    tracked += list((OLD/'bytecode/quickjs').glob('*isHeldOrSuspended*')) + list((OLD/'bytecode/v8').glob('*isHeldOrSuspended*'))
    for e in ENGINES:
        tracked += [Path(a['path']) for a in prior['adapters'][e]]
    inputs = {str(p.relative_to(ROOT)): sha(p) for p in tracked}
    assert all(inputs[k] == v for k, v in prior['inputs'].items())
    m = dict(experiment='richards_function_timing/'+HERE.name, collection_date='2026-10-18',
        cohort=prior['cohort'], host=platform.node(), kernel=platform.release(), architecture=platform.machine(),
        engines=prior['engines'], adapters=prior['adapters'], inputs=inputs, constants=constants, cases=case_info,
        original_function_sha256=hashlib.sha256(target_bytes()).hexdigest(),
        diagnostic_quickjs=read(OLD/'source_evidence/diagnostic_identity.json'),
        seed=SEED, repetitions=30, expected_formal=240, mode=MODE,
        pilot=dict(start=1, growth=2, min_pair_ms=300, confirmation_processes_per_engine=2,
                   confirmation_min_ms=200, timeout_s=30, A_max_N=65536, B_max_M=268435456),
        bootstrap=dict(resamples=10000, seed=SEED+1000, confidence=0.95,
                       unit='independent process batch average; engines resampled independently',
                       estimator='ratio of process medians, V8/QuickJS', interval='percentile, linear (n-1)*p'),
        timer=dict(adapter='unchanged native performance.now captured as benchNow', reads_per_batch=2,
                   outside='process/VM startup, static loading/compilation, ResetRNG, Setup and B object/state creation',
                   inside_A='N complete original suite.benchmarks[0].run() incl initialization, scheduling and original assertions',
                   inside_B='M receiver.isHeldOrSuspended() calls, loop, method read/call, branch result accumulation; GC/helper as encountered',
                   first_call_included=True, workload_warmup_calls=0),
        known_limits=dict(power_frequency_background_control='UNKNOWN; WSL2 host uncontrolled',
                          v8_exact_source_attestation=None, static_frontend='QJS eager; d8 frozen --no-lazy; no new frontend claim'))
    save(HERE/'manifest.json', m)
    save(HERE/'diagnostics/original_function.js', target_bytes()+b'\n')
    save(HERE/'diagnostics/reused_tier_evidence.json', tier)
    save(HERE/'diagnostics/source_identity.json', dict(inputs=inputs, original_function_sha256=m['original_function_sha256'],
         A_driver='exact prior original.N1.js bytes except N substitutions; no method replacement',
         B_source='exact base.js and richards.js bytes, not hand-rewritten target or constructor'))
    env = capture(HERE/'raw/environment.json', ['sh', '-c',
        'uname -a; cat /etc/os-release; lscpu; free -b; df -h / /mnt/c; python3 --version; gcc --version; uptime; cat /proc/sys/kernel/random/boot_id; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null; true'])
    save(HERE/'environment.txt', env['stdout']+'\nWSL2 power/frequency/background isolation UNKNOWN/uncontrolled; no settings changed.\n')
    verify()
    print('PREPARED_FROZEN_COHORT', m['cohort'], flush=True)


def common():
    return (UP/'base.js').read_bytes()+b'\n;\n'+(UP/'richards.js').read_bytes()+b'\n;\n'


def script(case, n):
    if case == 'richards_run':
        data = (FOLLOW/'richards/original.N1.js').read_bytes().replace(b'__cfRep<1;', f'__cfRep<{n};'.encode()).replace(b'N:1,', f'N:{n},'.encode())
    else:
        c = manifest()['cases'][case]
        # Original constructor, real IdleTask/Scheduler types; all creation/state
        # assignment outside the timed region. Original prototype method retained.
        driver = '''
;(function(){
 var __rftReceiver = new TaskControlBlock(null, ID_IDLE, 0, null,
                         new IdleTask(new Scheduler(), 1, COUNT));
 __rftReceiver.state = STATE_VALUE;
 var __rftN = N_VALUE, __rftChecksum = 0, __rftLast;
 var __rftStart = benchNow();
 for(var __rftI=0; __rftI<__rftN; __rftI++) {
   __rftLast = __rftReceiver.isHeldOrSuspended();
   __rftChecksum += __rftLast ? 1 : 0;
 }
 var __rftStop = benchNow();
 if(__rftLast !== EXPECTED_VALUE || __rftChecksum !== CHECKSUM_VALUE) throw Error('checksum');
 console.log('RFT '+JSON.stringify({N:__rftN,start_ms:__rftStart,stop_ms:__rftStop,
   elapsed_ms:__rftStop-__rftStart,checksum:__rftChecksum,last:__rftLast,
   state:__rftReceiver.state,correctness:'PASS',warmup_calls:0}));
})();
'''.replace('STATE_VALUE', c['state_constant']).replace('N_VALUE', str(n)).replace('EXPECTED_VALUE', str(c['expected']).lower()).replace('CHECKSUM_VALUE', str(n*int(c['expected'])))
        data = common()+driver.encode()
    p = HERE/'generated'/f'{case}.N{n}.js'
    assert data.count((UP/'richards.js').read_bytes()) == 1
    save(p, data)
    return p


def payload(case, rec, n, phase):
    prefix = 'RICHARDS' if case == 'richards_run' else 'RFT'
    matches = re.findall(r'^'+prefix+r' (.+)$', rec['stdout'], re.M)
    v = json.loads(matches[0]) if len(matches) == 1 else {}
    valid = (rec['exit_code'] == 0 and v.get('N') == n and v.get('correctness') == 'PASS' and v.get('warmup_calls') == 0)
    t = v.get('elapsed_ms')
    valid = valid and isinstance(t, (int, float)) and math.isfinite(t) and t >= 0
    if valid:
        valid = math.isclose(v['stop_ms']-v['start_ms'], t, rel_tol=1e-10, abs_tol=1e-6)
        valid = valid and t <= rec['outer_wall_ns']/1e6+5
    if case != 'richards_run':
        c = manifest()['cases'][case]
        valid = valid and v.get('last') is c['expected'] and v.get('checksum') == n*int(c['expected']) and v.get('state') == c['state']
    if phase == 'formal':
        valid = valid and t > 0
    return v, bool(valid)


def sample(case, e, n, phase, label, extra=(), diagnostic_qjs=False, env=None):
    p = script(case, n)
    recpath = HERE/'raw'/phase/f'{label}_{e}_{case}.json'
    rec = capture(recpath, command(e, p, extra, diagnostic_qjs), env=env)
    v, valid = payload(case, rec, n, phase)
    elapsed = v.get('elapsed_ms')
    unit = 'ms/Run' if case == 'richards_run' else 'ns/target invocation'
    scale = 1 if case == 'richards_run' else 1e6
    return dict(case=case, engine=e, phase=phase, label=label, N_or_M=n,
        batch_elapsed_ms=elapsed, batch_average=elapsed*scale/n if elapsed is not None else None,
        unit=unit, checksum=v.get('checksum'), correctness=v.get('correctness'), valid=valid,
        exit_code=rec['exit_code'], timeout=rec['timeout'], start_ms=v.get('start_ms'), stop_ms=v.get('stop_ms'),
        outer_wall_ns=rec['outer_wall_ns'], below_pilot_ms=bool(elapsed is not None and elapsed<200),
        command=rec['command'], flags=manifest()['engines'][e]['runtime_flags'],
        binary_sha256=manifest()['diagnostic_quickjs']['sha256'] if diagnostic_qjs else manifest()['engines'][e]['binary']['sha256'],
        script_sha256=sha(p), original_source_sha256=sha(UP/'richards.js'),
        stdout=rec['stdout'], stderr=rec['stderr'], timestamp_utc=rec['timestamp_utc'],
        record=str(recpath.relative_to(HERE)), cohort=manifest()['cohort'], mode=MODE,
        diagnostic=bool(extra or diagnostic_qjs or env))


def correctness():
    verify()
    m = manifest()
    capture(HERE/'raw/correctness/v8_help.json', m['engines']['v8']['command_prefix']+['--help'])
    flags = capture(HERE/'raw/correctness/v8_flags.json', m['engines']['v8']['command_prefix']+['--print-flag-values','-e',"print('FLAGS_OK')"])
    for flag in ('--max-opt=0', '--no-sparkplug', '--no-maglev', '--no-turbofan', '--no-lazy'):
        assert flag in flags['stdout'], flag
    clock = '''var __rftPrev=benchNow(),__rftBack=0,__rftPositive=[];
for(var __rftJ=0;__rftJ<20000;__rftJ++){var __rftT=benchNow(),__rftD=__rftT-__rftPrev;if(__rftD<0)__rftBack++;if(__rftD>0)__rftPositive.push(__rftD);__rftPrev=__rftT;}
__rftPositive.sort(function(a,b){return a-b;});
console.log('CLOCK '+JSON.stringify({backward:__rftBack,positive:__rftPositive.length,min_ms:__rftPositive[0],median_ms:__rftPositive[(__rftPositive.length/2)|0]}));
'''
    p = HERE/'diagnostics/clock.js'; save(p, clock)
    for e in ENGINES:
        r = capture(HERE/'raw/correctness'/f'clock_{e}.json', command(e,p))
        v = json.loads(re.search(r'^CLOCK (.+)$',r['stdout'],re.M)[1])
        assert r['exit_code']==0 and v['backward']==0 and v['positive']>0 and v['min_ms']>0
    shape = common()+b'''
var __rftR=new TaskControlBlock(null,ID_IDLE,0,null,new IdleTask(new Scheduler(),1,COUNT));
if(Object.getPrototypeOf(__rftR)!==TaskControlBlock.prototype || Object.keys(__rftR).join(',')!=='link,id,priority,queue,task,state' || Object.prototype.hasOwnProperty.call(__rftR,'isHeldOrSuspended')) throw Error('receiver');
console.log('SHAPE_OK');
'''
    p = HERE/'diagnostics/receiver_shape.js'; save(p, shape)
    for e in ENGINES:
        r = capture(HERE/'raw/correctness'/f'shape_{e}.json',command(e,p))
        assert r['exit_code']==0 and 'SHAPE_OK' in r['stdout']
    rows=[]
    for case in CASES:
        for n in ((1,2,16) if case=='richards_run' else (1,2,64)):
            for e in ENGINES:
                row=sample(case,e,n,'correctness',f'N{n}')
                rows.append(row); print('CORRECTNESS',case,e,n,row['valid'],flush=True)
    export(HERE/'correctness.csv',rows)
    assert len(rows)==24 and all(r['valid'] for r in rows)
    counts()
    dumps()
    save(HERE/'correctness_gate.json',dict(status='PASS',cases=4,samples=24,clock=True,shape=True,bytecode=True,counts=True))


def counts():
    # A labelled JS diagnostic copy only; formal A/B retain untouched upstream.
    raw=(UP/'richards.js').read_bytes()
    insert=b' __rftCalls++; var __rftS=this.state; __rftStates[__rftS]=(__rftStates[__rftS]||0)+1;'
    changed=raw.replace(TARGET,TARGET+insert)
    patch=''.join(difflib.unified_diff(raw.decode().splitlines(True),changed.decode().splitlines(True),fromfile='original/richards.js',tofile='DIAGNOSTIC_FUNCTION_COUNTS/richards.js'))
    save(HERE/'diagnostics/function_counts.patch',patch)
    values=[]
    for n in (1,2):
        original=script('richards_run',n).read_bytes()
        prefix=b'var __rftCalls=0,__rftStates=Object.create(null);\n'
        data=prefix+original.replace(raw,changed)+b"\nconsole.log('COUNTS '+JSON.stringify({calls:__rftCalls,states:__rftStates}));\n"
        p=HERE/'diagnostics'/f'DIAGNOSTIC_FUNCTION_COUNTS.N{n}.js';save(p,data)
        for e in ENGINES:
            rec=capture(HERE/'raw/diagnostics'/f'counts_{e}_N{n}.json',command(e,p))
            assert rec['exit_code']==0 and "\"correctness\":\"PASS\"" in rec['stdout']
            v=json.loads(re.search(r'^COUNTS (.+)$',rec['stdout'],re.M)[1])
            assert sum(v['states'].values())==v['calls']
            values.append(dict(engine=e,N=n,calls=v['calls'],calls_per_Run=v['calls']/n,states=v['states'],script_sha256=sha(p),diagnostic_only=True))
    for e in ENGINES:
        x,y=[r for r in values if r['engine']==e]
        assert y['calls']==2*x['calls'] and y['states']=={k:2*v for k,v in x['states'].items()}
    assert values[0]['calls']==values[1]['calls']
    export(HERE/'diagnostics/function_frequency.csv',values)
    save(HERE/'diagnostics/function_frequency.json',dict(records=values,
       scope='independent JS entry counter, extra state read; modified diagnostic bytecode, never formal time',
       prior_10671_confirmation=all(x['calls_per_Run']==10671 for x in values)))


def dumps():
    m=manifest(); diag=m['diagnostic_quickjs']
    assert sha(diag['binary'])==diag['sha256']
    p=script('left_true',1)
    env=dict(os.environ,SA_DUMP='1',SA_OUT=str(HERE/'raw/diagnostics/qjs_dump'),SA_CONTEXT='0',SA_COUNT='0',SA_INTERVAL_US='0')
    rec=capture(HERE/'raw/diagnostics/qjs_dump.json',command('quickjs',p,diagnostic_qjs=True),env=env)
    assert rec['exit_code']==0
    text=rec['stdout']; line=p.read_bytes()[:p.read_bytes().index(TARGET)].count(b'\n')+1
    heads=list(re.finditer(r'(?m)^.*?:(\d+):(\d+): function: (.*)$',text))
    blocks=[text[x.start():heads[i+1].start() if i+1<len(heads) else len(text)] for i,x in enumerate(heads) if int(x[1])==line]
    assert len(blocks)==1, (line,len(blocks))
    block=blocks[0];save(HERE/'diagnostics/quickjs_target_bytecode.txt',block)
    widths={x[0]:int(x[1]) for x in re.findall(r'^DEF\(\s*(\w+),\s*(\d+),', (ROOT/'engines/quickjs-upstream/quickjs-opcode.h').read_text(),re.M)}
    instructions=[];pc=0
    for ln in block.splitlines():
        x=re.match(r'^\s*(?:(\d+):\s+)?(\w+)(?:\s+(.*))?$',ln)
        if x and x[2] in widths:
            if x[1] is not None: assert int(x[1])==pc
            instructions.append(dict(offset=pc,opcode=x[2],operands=x[3] or '',size=widths[x[2]]));pc+=widths[x[2]]
    previous=read(OLD/'bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.decoded.json')
    assert instructions==previous, 'QJS bytecode changed: investigate before timing'
    save(HERE/'diagnostics/quickjs_target_bytecode.json',instructions)
    rec=capture(HERE/'raw/diagnostics/v8_dump.json',command('v8',p,extra=('--print-bytecode','--print-bytecode-filter=TaskControlBlock.isHeldOrSuspended')))
    assert rec['exit_code']==0
    save(HERE/'diagnostics/v8_target_bytecode.txt',rec['stdout'])
    if 'Bytecode length:' not in rec['stdout']:
        # Keep the unsuccessful exact-name selection. Runtime-inferred names can
        # differ with source context; wildcard selects the actual unmodified fn.
        rec=capture(HERE/'raw/diagnostics/v8_dump_wildcard.json',command('v8',p,extra=('--print-bytecode','--print-bytecode-filter=*isHeldOrSuspended*')))
        assert rec['exit_code']==0
        save(HERE/'diagnostics/v8_target_bytecode.wildcard.txt',rec['stdout'])
    full=rec['stdout']
    begin=re.search(r'(?m)^\[generated bytecode for function: TaskControlBlock.isHeldOrSuspended \(',full)
    assert begin, 'actual target function not found in diagnostic output'
    end=re.search(r'(?m)^\[generated bytecode for function:',full[begin.end():])
    selected=full[begin.start():begin.end()+end.start()] if end else full[begin.start():]
    save(HERE/'diagnostics/v8_target_bytecode.selected.txt',selected)
    vi=[]
    for ln in selected.splitlines():
        x=re.search(r'@\s*(\d+)\s*:\s*((?:[0-9a-f]{2}\s+)+)([A-Z]\w*)(.*)$',ln)
        if x: vi.append(dict(offset=int(x[1]),size=len(x[2].split()),opcode=x[3],operands=x[4].strip()))
    previous=read(OLD/'bytecode/v8/TaskControlBlock.isHeldOrSuspended.decoded.json')
    clean=lambda z:[dict(offset=x['offset'],size=x['size'],opcode=x['opcode'],operands=re.sub(r'0x[0-9a-f]+','<address>',x['operands'])) for x in z]
    assert clean(vi)==clean(previous), 'V8 bytecode changed: investigate before timing'
    save(HERE/'diagnostics/v8_target_bytecode.json',vi)
    save(HERE/'diagnostics/bytecode_check.json',dict(status='PASS',qjs_instructions=len(instructions),qjs_bytes=pc,v8_instructions=len(vi),v8_bytes=sum(x['size'] for x in vi),
         original_function_sha256=hashlib.sha256(target_bytes()).hexdigest(),B_script_sha256=sha(p),
         identical_to_prior_final_bytecode_except_ASLR=True,diagnostic_times_used_in_formal=False))


def pilot():
    verify(); assert read(HERE/'correctness_gate.json')['status']=='PASS'
    for case in CASES:
        selected=HERE/'pilot'/f'{case}.json'
        if selected.exists(): continue
        rows=[];n=1;cap=manifest()['pilot']['A_max_N' if case=='richards_run' else 'B_max_M']
        while n<=cap:
            pair=[sample(case,e,n,'pilot',f'pilot_N{n}') for e in ENGINES]
            rows+=pair
            assert all(x['valid'] for x in pair)
            print('PILOT',case,n,[round(x['batch_elapsed_ms'],3) for x in pair],flush=True)
            if min(x['batch_elapsed_ms'] for x in pair)>=300:
                confirmations=[]
                for rep in range(2):
                    for e in (ENGINES if rep==0 else tuple(reversed(ENGINES))):
                        x=sample(case,e,n,'pilot',f'confirm{rep}_N{n}')
                        assert x['valid']; confirmations.append(x);rows.append(x)
                if min(x['batch_elapsed_ms'] for x in confirmations)>=200:
                    save(selected,dict(case=case,N_or_M=n,pilot_pair=pair,confirmations=confirmations))
                    break
            n*=2
        else: raise RuntimeError('BLOCKED_CALIBRATION_CAP '+case)
        export(HERE/'pilot'/f'{case}.csv',rows)
        if case!='richards_run':
            scaling=[]
            for factor,amount in [('half',n//2),('selected',n),('double',n*2)]:
                for rep in range(3):
                    for e in (ENGINES if rep%2==0 else tuple(reversed(ENGINES))):
                        x=sample(case,e,amount,'pilot',f'scale_{factor}_rep{rep}_N{amount}')
                        assert x['valid'];scaling.append(dict(x,factor=factor))
            export(HERE/'pilot'/f'{case}_scaling.csv',scaling)
    save(HERE/'selected_n.json',{c:read(HERE/'pilot'/f'{c}.json')['N_or_M'] for c in CASES})
    schedule=[];rng=random.Random(SEED)
    orders={}
    for c in CASES:
        pairs=[ENGINES]*15+[tuple(reversed(ENGINES))]*15;rng.shuffle(pairs);orders[c]=pairs
    for rep in range(30):
        cases=list(CASES);rng.shuffle(cases)
        for c in cases:
            for order,e in enumerate(orders[c][rep],1):
                schedule.append(dict(sequence=len(schedule),rep=rep,case=c,order=order,engine=e,N_or_M=read(HERE/'selected_n.json')[c]))
    save(HERE/'schedule.json',schedule)
    print('PILOT_FROZEN',read(HERE/'selected_n.json'),flush=True)


def formal():
    verify(); assert read(HERE/'correctness_gate.json')['status']=='PASS'
    schedule=read(HERE/'schedule.json')
    for pos in schedule:
        label=f"rep{pos['rep']:02d}_order{pos['order']}"
        result=sample(pos['case'],pos['engine'],pos['N_or_M'],'formal',label)
        # Preserve a failed slot and its stdout/stderr; never silently overwrite.
        if not result['valid']:
            raise RuntimeError('BLOCKED_FORMAL_SAMPLE '+result['record'])
        print('FORMAL',pos['sequence']+1,'/240',pos['case'],pos['engine'],round(result['batch_elapsed_ms'],3),flush=True)
    verify()


def quantile(v,p):
    x=sorted(v);i=(len(x)-1)*p;a=math.floor(i);b=math.ceil(i)
    return x[a]+(x[b]-x[a])*(i-a)


def formal_rows():
    out=[]
    for pos in read(HERE/'schedule.json'):
        label=f"rep{pos['rep']:02d}_order{pos['order']}"
        p=HERE/'raw/formal'/f"{label}_{pos['engine']}_{pos['case']}.json"
        assert p.exists(), 'missing '+str(p)
        out.append(dict(sample(pos['case'],pos['engine'],pos['N_or_M'],'formal',label),rep=pos['rep'],order=pos['order'],sequence=pos['sequence']))
    return out


def analyze():
    verify(); raw=formal_rows()
    assert len(raw)==240 and all(x['valid'] for x in raw)
    export(HERE/'raw/formal.csv',raw)
    summaries=[];ratios={}
    for index,c in enumerate(CASES):
        groups={e:[r for r in raw if r['case']==c and r['engine']==e] for e in ENGINES}
        vals={e:[r['batch_average'] for r in groups[e]] for e in ENGINES}
        ratio=statistics.median(vals['v8'])/statistics.median(vals['quickjs'])
        rng=random.Random(SEED+1000+index);bs=[]
        for _ in range(10000):
            q=statistics.median(rng.choices(vals['quickjs'],k=30))
            v=statistics.median(rng.choices(vals['v8'],k=30))
            bs.append(v/q)
        low,high=quantile(bs,.025),quantile(bs,.975)
        ratios[c]=dict(point=ratio,low=low,high=high,method=manifest()['bootstrap'])
        for e in ENGINES:
            g=groups[e];v=vals[e];assert len(v)==30
            q1,q3=quantile(v,.25),quantile(v,.75)
            summaries.append(dict(case=c,engine=e,valid=30,expected=30,N_or_M=g[0]['N_or_M'],
               median=statistics.median(v),mean=statistics.mean(v),sample_stddev=statistics.stdev(v),
               q1=q1,q3=q3,IQR=q3-q1,min=min(v),max=max(v),unit=g[0]['unit'],
               median_batch_ms=statistics.median(r['batch_elapsed_ms'] for r in g),
               v8_over_quickjs=ratio,ratio_bootstrap95_low=low,ratio_bootstrap95_high=high,
               below_200ms=sum(r['batch_elapsed_ms']<200 for r in g),failures=0,timeouts=0))
    export(HERE/'summary.csv',summaries);save(HERE/'bootstrap.json',ratios)
    scales=[]
    for c in CASES[1:]:
        with (HERE/'pilot'/f'{c}_scaling.csv').open(newline='') as f: rows=list(csv.DictReader(f))
        for e in ENGINES:
            points={}
            for factor in ('half','selected','double'):
                g=[r for r in rows if r['engine']==e and r['factor']==factor]
                med=statistics.median(float(r['batch_average']) for r in g);points[factor]=med
                scales.append(dict(case=c,engine=e,factor=factor,N_or_M=int(g[0]['N_or_M']),independent_processes=3,median_ns_per_invocation=med))
            print('SCALING',c,e,points,'max/min',max(points.values())/min(points.values()),flush=True)
    export(HERE/'scaling_summary.csv',scales)
    print('ANALYZED_240_FORMAL_PROCESSES',flush=True)


def check():
    verify();raw=formal_rows();schedule=read(HERE/'schedule.json')
    assert len(raw)==240 and len({(r['case'],r['engine'],r['rep']) for r in raw})==240
    assert all(r['valid'] and not r['diagnostic'] and r['exit_code']==0 and not r['LD_PRELOAD'] if 'LD_PRELOAD' in r else r['valid'] and not r['diagnostic'] for r in raw)
    for c in CASES:
        pair={}
        for e in ENGINES:
            g=[r for r in raw if r['case']==c and r['engine']==e]
            assert len(g)==30 and sum(r['order']==1 for r in g)==15
            assert {r['rep'] for r in g}==set(range(30))
            assert len({r['N_or_M'] for r in g})==1 and len({r['script_sha256'] for r in g})==1
            assert all('--prof' not in ' '.join(r['command']) and '--print-bytecode' not in ' '.join(r['command']) and '--trace' not in ' '.join(r['command']) for r in g)
            if e=='v8': assert all(r['flags']==['--max-opt=0','--no-lazy'] for r in g)
            pair[e]=g[0]['script_sha256']
        assert pair['quickjs']==pair['v8']
    # Independent reconstruction directly from subprocess stdout/JSON, not the CSV.
    for r in raw:
        rec=read(HERE/r['record']); prefix='RICHARDS' if r['case']=='richards_run' else 'RFT'
        v=json.loads(re.search(r'^'+prefix+r' (.+)$',rec['stdout'],re.M)[1])
        assert rec['exit_code']==0 and rec['LD_PRELOAD'] is None and v['warmup_calls']==0
        scale=1 if r['case']=='richards_run' else 1e6
        assert math.isclose(v['elapsed_ms']*scale/v['N'],r['batch_average'],rel_tol=1e-12)
        if r['case']!='richards_run': assert v['checksum']==v['N']*int(manifest()['cases'][r['case']]['expected'])
        else: assert v['assertions_per_Run']==1
        assert v['elapsed_ms']>0 and v['elapsed_ms']<=rec['outer_wall_ns']/1e6+5
    save(HERE/'audit.json',dict(status='A_B_FORMAL_PASS',formal_valid=240,formal_expected=240,
       unit_of_replication='independent fresh process; inner iterations NOT statistical samples',
       groups=8,repetitions_per_group=30,first_position_per_group=15,
       same_JS_per_engine_pair=True,trace_sampling_in_formal=False,warmup_calls=0,
       timer_reads_per_batch=2,old_input_and_runtime_hashes_unchanged=True,
       boot_ids=sorted({read(HERE/r['record'])['boot_id'] for r in raw}),
       below_200ms=sum(r['batch_elapsed_ms']<200 for r in raw),outliers_deleted=0,
       bootstrap_unit='independent process averages; independent engine resampling',
       C_not_in_A_B_table=True))
    print('CHECK_PASS_240_OF_240',flush=True)


def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['prepare','correctness','pilot','formal','analyze','check','all']);a=p.parse_args()
    stages=[prepare,correctness,pilot,formal,analyze,check]
    if a.stage=='all':
        for stage in stages:stage()
    else: globals()[a.stage]()


if __name__=='__main__': main()

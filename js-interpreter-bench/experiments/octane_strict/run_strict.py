#!/usr/bin/env python3
"""Frozen Octane strict execution; append-only raw files, durable resume."""
from __future__ import annotations

import argparse
import csv
from datetime import datetime, timezone
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import random
import re
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
import run_sunspider as baseline

spec = importlib.util.spec_from_file_location('octane_prepare_readonly', ROOT / 'experiments/octane/prepare.py')
prepare = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prepare)
UPSTREAM = prepare.UPSTREAM
FLAGS = ('--max-opt=0', '--no-lazy')
ENGINES = ('quickjs', 'v8_ignition')
SEED = 20260928
REPETITIONS = 30
TARGET_MS = 1000
TIMEOUT = 300
BENCHMARKS = {
    'Richards': ('Richards',), 'DeltaBlue': ('DeltaBlue',),
    'Crypto': ('Encrypt', 'Decrypt'), 'RayTrace': ('RayTrace',),
    'EarleyBoyer': ('Earley', 'Boyer'), 'RegExp': ('RegExp',),
    'Splay': ('Splay',), 'NavierStokes': ('NavierStokes',), 'PdfJS': ('PdfJS',),
    'Mandreel': ('Mandreel',), 'Gameboy': ('Gameboy',),
    'CodeLoad': ('CodeLoadClosure', 'CodeLoadJQuery'), 'Typescript': ('Typescript',),
}
SENSITIVITY_NARROW = ('RegExp', 'CodeLoad')
SENSITIVITY_BROAD = ('RegExp', 'CodeLoad', 'Mandreel', 'Typescript')
RUN_NAMES = {
    'Richards':'runRichards','DeltaBlue':'deltaBlue','Encrypt':'encrypt','Decrypt':'decrypt',
    'RayTrace':'renderScene','Earley':'','Boyer':'','RegExp':'RegExpRun','Splay':'SplayRun',
    'NavierStokes':'runNavierStokes','PdfJS':'runPdfJS','Mandreel':'runMandreel',
    'Gameboy':'runGameboy','CodeLoadClosure':'runCodeLoadClosure',
    'CodeLoadJQuery':'runCodeLoadJQuery','Typescript':'runTypescript',
}
PROTECTED = {
    'experiments/octane/summary.csv': '217eb77131c88960ac15b4accc3ed370536eeb2d45e316a0c75a85ef0e629596',
    'experiments/octane/compatibility.csv': '3442ef1351cf5da8f47bd322c373b2cbf8c03aa8ec78696c8fccc2e9f4c28ac4',
    'experiments/octane/upstream_sha256.txt': '226ae24b505ce3190584173b7ecd25bb473d7899294fb7f87bddccbb37b969f6',
    'experiments/octane/prepare.py': 'f0d831b054a0737942a4d83ea02f75264a1ccffb0fbdc6367a966595159a861a',
    'experiments/interpreter_mode_execution/summary/audit.json': '045d89fe574811775871b539909dd650427f24c967280cae72e60cc5bb48bec8',
}
MEASUREMENT_FIELDS = ('engine','suite','benchmark','iteration','execution_order','N','elapsed_ms',
    'elapsed_per_call_ms','exit_code','valid','timestamp','flags','timer','wall_time_ns',
    'extra_validation_calls','script_sha256','command','stdout','stderr','reason')
CORRECTNESS_FIELDS = ('suite','benchmark','engine','N','validation_method','status','reason',
    'extra_validation_calls','timestamp','script_sha256','command','stdout','stderr','exit_code')
FAILURE_FIELDS = ('stage','suite','benchmark','engine','N','iteration','status','reason',
    'timestamp','command','stdout','stderr','exit_code')
CALIBRATION_FIELDS = ('suite','benchmark','N','quickjs_elapsed_ms','v8_elapsed_ms',
    'quickjs_per_call_ms','v8_per_call_ms','status','timestamp')

def stamp():
    return datetime.now(timezone.utc).isoformat()

def digest(data):
    return hashlib.sha256(data).hexdigest()

def frozen_write(path, data):
    """Generated artifacts cannot silently change on resume."""
    if isinstance(data, str): data = data.encode('utf-8')
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists():
        if path.read_bytes() != data: raise RuntimeError(f'artifact differs: {path}')
    else:
        with path.open('xb') as f: f.write(data)

def save_json(path, data):
    frozen_write(path, json.dumps(data, ensure_ascii=False, indent=2) + '\n')

def read_csv(path):
    if not path.exists(): return []
    with path.open(encoding='utf-8', newline='') as f: return list(csv.DictReader(f))

def append_csv(path, fields, row):
    path.parent.mkdir(parents=True, exist_ok=True)
    existing = path.exists() and path.stat().st_size > 0
    if existing:
        with path.open(encoding='utf-8', newline='') as f:
            if tuple(next(csv.reader(f))) != tuple(fields): raise RuntimeError('CSV schema changed')
    with path.open('a', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fields, extrasaction='ignore')
        if not existing: writer.writeheader()
        writer.writerow({key: row.get(key, '') for key in fields})
        f.flush()
        os.fsync(f.fileno())

def verify():
    baseline.verify_frozen_inputs()
    prepare.verify_upstream()
    for name, expected in PROTECTED.items(): baseline.require_hash(ROOT / name, expected, name)
    for line in (ROOT / 'experiments/octane/upstream_sha256.txt').read_text().splitlines():
        expected, name = line.split('  ', 1)
        baseline.require_hash(UPSTREAM / name, expected, name)

def config():
    return json.loads((HERE / 'config.json').read_text(encoding='utf-8'))

def command(engine, args, diagnostic=()):
    if engine == 'quickjs': return [str(baseline.QUICKJS_BINARY), *args]
    return [str(baseline.V8_BINARY), f'--snapshot_blob={baseline.V8_SNAPSHOT}',
            *FLAGS, *diagnostic, *args]

def capture(cmd, engine, timeout=TIMEOUT):
    start = time.perf_counter_ns()
    try:
        p = subprocess.run(cmd, cwd=ROOT, env=baseline.environments()[engine],
                           capture_output=True, timeout=timeout, check=False)
        code, stdout, stderr = p.returncode, p.stdout, p.stderr
    except subprocess.TimeoutExpired as error:
        code, stdout, stderr = -999, error.stdout or b'', error.stderr or b''
    return dict(exit_code=code, stdout=baseline.normalize_output(stdout),
        stderr=baseline.normalize_output(stderr), wall_time_ns=time.perf_counter_ns()-start,
        timestamp=stamp(), command=json.dumps(cmd, ensure_ascii=False))

def evidence(label, engine, args, diagnostic=()):
    directory = HERE / 'probes' / label
    directory.mkdir(parents=True, exist_ok=True)
    metadata = directory / 'command.json'
    if metadata.exists():
        result = json.loads(metadata.read_text(encoding='utf-8'))
        result['stdout'] = (directory / 'stdout.txt').read_text(encoding='utf-8')
        result['stderr'] = (directory / 'stderr.txt').read_text(encoding='utf-8')
        return result
    result = capture(command(engine,args,diagnostic), engine)
    frozen_write(directory / 'stdout.txt', result['stdout'])
    frozen_write(directory / 'stderr.txt', result['stderr'])
    save_json(metadata, {k:v for k,v in result.items() if k not in ('stdout','stderr')})
    if result['exit_code'] != 0: raise RuntimeError(f'evidence failed: {directory}: {result["stderr"][:500]}')
    return result

def generated(suite, benchmark, frontend=False):
    index = BENCHMARKS[suite].index(benchmark)
    body = b'\n;\n'.join((UPSTREAM / name).read_bytes() for name in ('base.js', *prepare.CASES[suite]))
    # Snapshot d8 arguments at global scope, where d8 defines them.
    shim = b'\n;var argumentsForD8 = typeof arguments !== "undefined" ? arguments : [];\n'
    driver = (HERE / 'driver.js').read_text(encoding='utf-8')
    driver = driver.replace('__SUITE__', json.dumps(suite)).replace('__INDEX__', str(index))
    driver = driver.replace('__BENCHMARK__', json.dumps(benchmark))
    path = HERE / 'generated' / f'{suite}.{benchmark}{".frontend" if frontend else ""}.js'
    frozen_write(path, body + shim + driver.encode('utf-8'))
    return path

def invocation(suite, benchmark, engine, n, mode, diagnostic=()):
    script = generated(suite, benchmark, mode == 'frontend')
    args = ['STRICT_CONFIG=' + json.dumps(dict(N=n,mode=mode,timer=config()['timer']),separators=(',',':'))]
    tail = [str(script), *(['--'] if engine == 'v8_ignition' else []), *args]
    row = capture(command(engine,tail,diagnostic),engine)
    row.update(engine=engine,suite=suite,benchmark=benchmark,N=n,
        flags=' '.join(FLAGS) if engine == 'v8_ignition' else '',timer=config()['timer'],
        script_sha256=baseline.sha256(script),valid='false',reason='')
    matches = re.findall(r'^OCTANE_STRICT_RESULT:(.+)$', row['stdout'], re.M)
    try:
        if row['exit_code'] != 0: raise ValueError('TIMEOUT' if row['exit_code']==-999 else 'nonzero exit')
        diagnostic_warning='V8 is running with developer-only features enabled. Stability and security will suffer.'
        if row['stderr'] and not (diagnostic and row['stderr'].strip()==diagnostic_warning):
            raise ValueError('unexpected stderr')
        if len(matches) != 1: raise ValueError('missing/duplicate result')
        result = json.loads(matches[0])
        if any(result.get(k) != v for k,v in dict(suite=suite,benchmark=benchmark,N=n,mode=mode,timer=config()['timer'],correctness='PASS').items()):
            raise ValueError('result identity/correctness mismatch')
        elapsed = result['elapsed_ms']
        if not math.isfinite(elapsed) or elapsed < 0: raise ValueError('invalid elapsed')
        if result['elapsed_per_call_ms'] != elapsed/n: raise ValueError('per-call arithmetic differs')
        row.update(result)
        row['valid'] = 'true'
    except (ValueError,KeyError,TypeError) as error:
        row['reason'] = str(error)
    return row

def fail(stage,row):
    row = dict(row, stage=stage,status='TIMEOUT' if row.get('exit_code')==-999 else 'FAIL')
    append_csv(HERE / 'raw/failures.csv',FAILURE_FIELDS,row)

def initialize():
    verify()
    timer_source = """var hp=typeof performance!=='undefined' && typeof performance.now==='function';
function probe(f){var prev=f(),min=Infinity,back=0,changes=0;var until=Date.now()+80;
while(Date.now()<until){var cur=f();if(cur<prev)back++;if(cur>prev){min=Math.min(min,cur-prev);changes++;}prev=cur;}
return {min_positive_delta_ms:isFinite(min)?min:null,backwards:back,changes:changes};}
console.log('TIMER_PROBE:'+JSON.stringify({native_performance_now:hp,date:probe(Date.now),
performance:hp?probe(function(){return performance.now();}):null}));
"""
    path = HERE / 'probes/timer_probe.js'
    frozen_write(path,timer_source)
    timers = {}
    for engine in ENGINES:
        result = evidence(f'timer/{engine}',engine,[str(path)])
        timers[engine] = json.loads(re.search(r'TIMER_PROBE:(.*)',result['stdout']).group(1))
    use_hp = all(t['native_performance_now'] and t['performance']['backwards']==0 and
                 t['performance']['changes']>0 for t in timers.values())
    # quickjs-libc.c:2131-2165: Windows performance.now uses gettimeofday,
    # explicitly not robust to clock updates. Do not infer monotonic semantics
    # from an 80-ms smoke. Choose common Date.now like SunSpider strict.
    if os.name == 'nt': use_hp = False
    timer = 'performance.now' if use_hp else 'Date.now'
    if any(t['date']['backwards'] or not t['date']['changes'] for t in timers.values()):
        raise RuntimeError('Date.now timer smoke failed')
    data = dict(schema=1,seed=SEED,repetitions=REPETITIONS,target_ms=TARGET_MS,timer=timer,
        v8_flags=list(FLAGS),quickjs_sha256=baseline.QUICKJS_SHA256,
        d8_sha256=baseline.V8_BINARY_SHA256,snapshot_sha256=baseline.V8_SNAPSHOT_SHA256,
        octane_commit=prepare.COMMIT,benchmarks=BENCHMARKS,
        narrow_exclusions=SENSITIVITY_NARROW,broad_exclusions=SENSITIVITY_BROAD,
        driver_sha256=baseline.sha256(HERE/'driver.js'),
        runner_sha256=baseline.sha256(Path(__file__)),timers=timers)
    save_json(HERE / 'config.json',data)
    envfile = HERE / 'environment.txt'
    if not envfile.exists():
        hostcmd = ['powershell','-NoProfile','-Command',
            '$os=Get-CimInstance Win32_OperatingSystem; $cpu=Get-CimInstance Win32_Processor; '
            '$sys=Get-CimInstance Win32_ComputerSystem; '
            '[pscustomobject]@{OS=$os.Caption;Version=$os.Version;Build=$os.BuildNumber;'
            'CPU=$cpu.Name;PhysicalCores=$cpu.NumberOfCores;LogicalCores=$cpu.NumberOfLogicalProcessors;'
            'RAMBytes=$sys.TotalPhysicalMemory;Architecture=[System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()} | ConvertTo-Json; '
            'powercfg /getactivescheme; Get-PSDrive -PSProvider FileSystem | Select-Object Name,Used,Free | ConvertTo-Json']
        host = capture(hostcmd,'quickjs')['stdout']
        frozen_write(envfile,f'timestamp={stamp()}\n{host}\nPython={sys.version}\n'
            f'QuickJS={baseline.QUICKJS_BINARY}\nQuickJS SHA256={baseline.QUICKJS_SHA256}\n'
            f'V8/d8={baseline.V8_BINARY}\nd8 SHA256={baseline.V8_BINARY_SHA256}\n'
            f'V8 flags={FLAGS}\nQuickJS flags=none\nQuickJS GCC=13.1.0; -O2; not rebuilt\n'
            f'snapshot={baseline.V8_SNAPSHOT}; SHA256={baseline.V8_SNAPSHOT_SHA256}\n'
            f'ICU SHA256={baseline.V8_ICU_DATA_SHA256}\nMinGW pthread SHA256={baseline.QUICKJS_RUNTIME_DLL_SHA256}\n'
            f'Octane commit={prepare.COMMIT}\nSeed={SEED}\nTimer={timer}\n'
            f'Timer probe={json.dumps(timers)}\nAffinity unchanged; CPU temperature/frequency/background load UNKNOWN.\n')
    for suite,names in BENCHMARKS.items():
        for name in names: generated(suite,name)
    print('INIT PASS timer='+timer,flush=True)

def smoke():
    initialize()
    if (HERE/'probes/smoke_validated.json').exists():
        rows=json.loads((HERE/'probes/smoke_validated.json').read_text(encoding='utf-8'))
        if not all(r['valid']=='true' for r in rows):raise RuntimeError('previous smoke failed')
        print('SMOKE PASS (saved same-artifact gate)',flush=True)
        return
    rows=[]
    for engine in ENGINES:
        row=invocation('Richards','Richards',engine,1,'measure')
        rows.append(row)
        if row['valid']!='true': fail('smoke',row); raise RuntimeError('smoke failed')
    save_json(HERE/'probes/smoke_validated.json',rows)
    print('SMOKE PASS',flush=True)

def frontend():
    helpout=evidence('v8_tier/help','v8_ignition',['--help'])['stdout']
    for flag in ('print-bytecode','print-bytecode-filter','lazy'):
        if not re.search(r'(?m)^\s*--'+re.escape(flag)+r'(?:\s|$)',helpout):
            raise RuntimeError('diagnostic flag unsupported: '+flag)
    results=[]
    for suite,names in BENCHMARKS.items():
        for name in names:
            directory=HERE/'probes/frontend_order'/f'{suite}.{name}.final'
            summary=directory/'summary.json'
            if summary.exists(): results.append(json.loads(summary.read_text()));continue
            traceflags=('--print-bytecode','--print-bytecode-filter='+RUN_NAMES[name])
            row=invocation(suite,name,'v8_ignition',1,'frontend',traceflags)
            directory.mkdir(parents=True,exist_ok=True)
            frozen_write(directory/'stdout.txt',row['stdout'])
            frozen_write(directory/'stderr.txt',row['stderr'])
            save_json(directory/'command.json',{k:v for k,v in row.items() if k not in ('stdout','stderr')})
            marker_match=re.search(r'^TIMER_START_MARKER:',row['stdout'],re.M)
            marker=marker_match.start() if marker_match else -1
            prefix=row['stdout'][:marker] if marker>=0 else ''
            # For anonymous Earley/Boyer, identify the actual wrapper by its unique
            # constant-pool reference to the registered target, not its empty name.
            blocks=re.split(r'(?=\[generated bytecode for function:)',prefix)
            if name in ('Earley','Boyer'):
                target='BgL_earleyzd2benchmarkzd2' if name=='Earley' else 'BgL_nboyerzd2benchmarkzd2'
                matching=[b for b in blocks if '[generated bytecode for function:  (' in b and
                          re.search(r'LdaGlobal.*"'+re.escape(target)+r'"',b)]
            else:
                matching=[b for b in blocks if 'generated bytecode for function: '+RUN_NAMES[name]+' (' in b]
            name_marker=':function='+RUN_NAMES[name]+'\n'
            passed=row['valid']=='true' and len(matching)>=1 and name_marker in prefix
            info=dict(suite=suite,benchmark=name,status='PASS' if passed else 'UNKNOWN',
                bytecode_before_timer=passed,script_sha256=row['script_sha256'],
                evidence=str(directory.relative_to(HERE)),diagnostic_flags=list(traceflags),
                matching_bytecode_blocks=len(matching),actual_run_name=RUN_NAMES[name])
            save_json(summary,info)
            results.append(info)
            print(f'FRONTEND {suite}/{name}: {info["status"]}',flush=True)
            if not passed: raise RuntimeError('actual static Run bytecode ordering UNKNOWN; no formal measurements')
    qsource=ROOT/'engines/quickjs-upstream/quickjs.c'
    qjs=ROOT/'engines/quickjs-upstream/qjs.c'
    text=qsource.read_text(encoding='utf-8').splitlines()
    excerpts=[]
    for start,end in ((36068,36100),(37265,37310)):
        excerpts.extend(f'{i+1}: {text[i]}' for i in range(start-1,min(end,len(text))))
    qtext=qjs.read_text(encoding='utf-8').splitlines()
    excerpts.extend(f'qjs.c:{i+1}: {qtext[i]}' for i in range(45,69))
    excerpt='\n'.join(excerpts)
    if 'child_list' not in excerpt or 'js_create_function' not in excerpt or 'JS_Eval' not in excerpt:
        raise RuntimeError('QuickJS source evidence did not match audited positions')
    frozen_write(HERE/'probes/frontend_order/quickjs_source.txt',excerpt+'\n')
    save_json(HERE/'probes/frontend_order/summary.json',dict(status='PASS',v8=results,
        quickjs_source_sha256=baseline.sha256(qsource),qjs_source_sha256=baseline.sha256(qjs),
        quickjs_rule='recursive js_create_function before global execution; dynamic eval excluded from this claim'))

def tier():
    helpout=evidence('v8_tier/help','v8_ignition',['--help'])['stdout']
    traces=('--trace-baseline','--trace-opt','--trace-opt-status','--trace-deopt','--trace-osr')
    for flag in traces:
        if not re.search(r'(?m)^\s*'+re.escape(flag)+r'(?:\s|$)',helpout):raise RuntimeError('missing trace '+flag)
    version=evidence('v8_tier/version','v8_ignition',['--version'])['stdout']
    if 'V8 version 15.6.21' not in version: raise RuntimeError('wrong V8 version')
    values=evidence('v8_tier/flag_values','v8_ignition',['--print-flag-values','-e','0'])['stdout']
    required=('--max-opt=0','--no-lazy','--no-sparkplug','--no-maglev','--no-turbofan')
    for flag in required:
        if not re.search(r'(?m)^'+re.escape(flag)+r'\s*$',values):raise RuntimeError('effective flag missing: '+flag)
    probe=ROOT/'benchmarks/probes/v8_tier_probe.js'
    out=evidence('v8_tier/hot_trace','v8_ignition',[str(probe),'--','500000'],traces)
    output=out['stdout']+'\n'+out['stderr']
    patterns=dict(sparkplug_compile=r'\[Baseline batch compilation\]|\[Concurrent Sparkplug',
        maglev_compile=r'target MAGLEV',turbofan_compile=r'target TURBOFAN',osr_entry=r'\[OSR - entry',
        baseline_status=r'\bBASELINE\b',maglev_status=r'\^MAGLEV',turbofan_status=r'\^TURBOFAN',
        interpreted_status=r'INTERPRETED_FUNCTION')
    counts={k:len(re.findall(p,output)) for k,p in patterns.items()}
    passed=counts['interpreted_status']>0 and not any(v for k,v in counts.items() if k!='interpreted_status')
    passed=passed and 'V8_TIER_PROBE iterations=500000 checksum=1301262660' in output
    bytecode=evidence('v8_tier/hot_bytecode','v8_ignition',[str(probe),'--','500000'],
        ('--print-bytecode','--print-bytecode-filter=tierProbeTarget'))['stdout']
    passed=passed and 'generated bytecode for function: tierProbeTarget' in bytecode
    save_json(HERE/'probes/v8_tier/summary.json',dict(status='PASS' if passed else 'BLOCKED',
        counts=counts,flags=list(FLAGS),calls=500000,required_effective_values=required,
        probe_sha256=baseline.sha256(probe),d8_sha256=baseline.V8_BINARY_SHA256,
        snapshot_sha256=baseline.V8_SNAPSHOT_SHA256,lazy_eval_enabled='--lazy-eval\n' in values))
    if not passed:raise RuntimeError('tier gate failed; formal measurements forbidden')
    print('TIER PASS '+json.dumps(counts),flush=True)

def require_gates():
    verify()
    cfg=config()
    if cfg['driver_sha256']!=baseline.sha256(HERE/'driver.js') or cfg['runner_sha256']!=baseline.sha256(Path(__file__)):
        raise RuntimeError('experiment code differs from frozen config')
    for path in ('probes/smoke_validated.json','probes/frontend_order/summary.json','probes/v8_tier/summary.json'):
        data=json.loads((HERE/path).read_text(encoding='utf-8'))
        if isinstance(data,dict) and data['status']!='PASS':raise RuntimeError('gate failed '+path)

def validation_method(suite,benchmark):
    if suite=='Crypto' and benchmark=='Encrypt':return 'independent per-call upstream decrypt(TEXT); formal final ciphertext decrypt after timer'
    if suite=='NavierStokes':return 'upstream frame15 checksum=77; N<15 post-region continuation to frame15'
    if suite=='PdfJS':return 'upstream TearDown validates every retained render log after all N calls'
    if suite=='Splay':return 'upstream TearDown sorted tree and size after complete sequence'
    return 'unchanged upstream Run assertions; upstream TearDown once after sequence'

def correctness(n_selected=False):
    require_gates()
    done={(r['suite'],r['benchmark'],r['engine'],int(r['N'])) for r in read_csv(HERE/'correctness.csv') if r['status']=='PASS'}
    selections=selected()
    for suite,names in BENCHMARKS.items():
        for name in names:
            ns=[selections[(suite,name)]] if n_selected and (suite,name) in selections else ([] if n_selected else [1,2])
            for n in ns:
                for engine in ENGINES:
                    if (suite,name,engine,n) in done:continue
                    row=invocation(suite,name,engine,n,'correctness')
                    row.update(validation_method=validation_method(suite,name),status='PASS' if row['valid']=='true' else 'FAIL')
                    append_csv(HERE/'correctness.csv',CORRECTNESS_FIELDS,row)
                    print(f'CORRECTNESS {suite}/{name} {engine} N={n} {row["status"]}',flush=True)
                    if row['valid']!='true':fail('correctness',row)
    # Initial correctness is a critical pre-performance gate.
    if not n_selected:
        good={(r['suite'],r['benchmark'],r['engine'],int(r['N'])) for r in read_csv(HERE/'correctness.csv') if r['status']=='PASS'}
        expected={(s,b,e,n) for s,bs in BENCHMARKS.items() for b in bs for e in ENGINES for n in (1,2)}
        if good!=expected:raise RuntimeError('initial correctness gate incomplete/failed; stopping before calibration')

def selected():
    return {(r['suite'],r['benchmark']):int(r['N']) for r in read_csv(HERE/'raw/calibration.csv') if r['status']=='SELECTED'}

def calibration():
    require_gates()
    correctness_rows=read_csv(HERE/'correctness.csv')
    good={(r['suite'],r['benchmark'],r['engine'],int(r['N'])) for r in correctness_rows if r['status']=='PASS'}
    if any((s,b,e,n) not in good for s,bs in BENCHMARKS.items() for b in bs for e in ENGINES for n in (1,2)):
        raise RuntimeError('N1/N2 gate incomplete')
    existing=read_csv(HERE/'raw/calibration.csv')
    for suite,names in BENCHMARKS.items():
        for name in names:
            prior=[r for r in existing if r['suite']==suite and r['benchmark']==name]
            if any(r['status']=='SELECTED' for r in prior):continue
            n=1
            for p in prior:
                if p['status']=='BELOW_TARGET':n=max(n,int(p['N'])*2)
            while n<=65536:
                outputs=[]
                # Vary calibration engine order by N; always compare identical N.
                order=ENGINES if (n.bit_length()%2) else ENGINES[::-1]
                for engine in order:
                    row=invocation(suite,name,engine,n,'measure')
                    row['iteration']=n
                    append_csv(HERE/'raw/calibration_runs.csv',MEASUREMENT_FIELDS,row)
                    outputs.append(row)
                    if row['valid']!='true':fail('calibration',row)
                by={r['engine']:r for r in outputs}
                okay=all(r['valid']=='true' for r in outputs)
                ready=okay and all(r['elapsed_ms']>=TARGET_MS for r in outputs)
                record=dict(suite=suite,benchmark=name,N=n,status='SELECTED' if ready else 'BELOW_TARGET' if okay else 'FAIL',timestamp=stamp())
                for engine,prefix in (('quickjs','quickjs'),('v8_ignition','v8')):
                    record[prefix+'_elapsed_ms']=by[engine].get('elapsed_ms','')
                    record[prefix+'_per_call_ms']=by[engine].get('elapsed_per_call_ms','')
                append_csv(HERE/'raw/calibration.csv',CALIBRATION_FIELDS,record)
                print('CALIBRATION '+json.dumps(record),flush=True)
                if ready or not okay:break
                n*=2
            if n>65536:
                fail('calibration',dict(suite=suite,benchmark=name,N=n,reason='safety cap reached; NOT_COMPARABLE',timestamp=stamp()))

def eligible():
    selections=selected()
    good={(r['suite'],r['benchmark'],r['engine'],int(r['N'])) for r in read_csv(HERE/'correctness.csv') if r['status']=='PASS'}
    # Include a whole suite only when all subbenchmarks have complete gates.
    return {s:bs for s,bs in BENCHMARKS.items() if all((s,b) in selections and
        all((s,b,e,selections[(s,b)]) in good for e in ENGINES) for b in bs)}

def pilot():
    require_gates()
    selections=selected()
    done={(r['suite'],r['benchmark'],r['engine']) for r in read_csv(HERE/'raw/pilot.csv') if r['valid']=='true'}
    for suite,names in eligible().items():
        for name in names:
            for engine in ENGINES:
                if (suite,name,engine) in done:continue
                row=invocation(suite,name,engine,selections[(suite,name)],'measure')
                row.update(iteration=0,execution_order=0)
                append_csv(HERE/'raw/pilot.csv',MEASUREMENT_FIELDS,row)
                if row['valid']!='true':fail('pilot',row)
                print(f'PILOT {suite}/{name} {engine}: {row["valid"]} {row.get("elapsed_ms")}ms',flush=True)

def formal():
    require_gates()
    selections=selected()
    suites=eligible()
    pilotgood={(r['suite'],r['benchmark'],r['engine']) for r in read_csv(HERE/'raw/pilot.csv') if r['valid']=='true'}
    suites={s:bs for s,bs in suites.items() if all((s,b,e) in pilotgood for b in bs for e in ENGINES)}
    if not suites:raise RuntimeError('no suites have complete correctness/calibration/pilot gates')
    schedule=[]
    rng=random.Random(SEED)
    units=[(s,b) for s,bs in suites.items() for b in bs]
    for iteration in range(1,REPETITIONS+1):
        shuffled=units.copy();rng.shuffle(shuffled)
        for suite,name in shuffled:
            # Exactly 15 QJS-first and 15 V8-first for each unit, shuffled within blocks.
            index=units.index((suite,name))
            first=(iteration+index)%2
            for engine in (ENGINES[first],ENGINES[1-first]):
                schedule.append(dict(suite=suite,benchmark=name,engine=engine,iteration=iteration,
                    execution_order=len(schedule)+1,N=selections[(suite,name)]))
    save_json(HERE/'schedule.json',dict(seed=SEED,samples=schedule))
    key=lambda r:(r['suite'],r['benchmark'],r['engine'],int(r['iteration']),int(r['N']))
    done={key(r) for r in read_csv(HERE/'raw/measurements.csv') if r['valid']=='true'}
    print(f'FORMAL schedule={len(schedule)} resume_valid={len(done)}',flush=True)
    for item in schedule:
        if key(item) in done:continue
        row=invocation(item['suite'],item['benchmark'],item['engine'],item['N'],'measure')
        row.update(item)
        if row.get('elapsed_ms',0)<=0:row.update(valid='false',reason='nonpositive formal duration')
        append_csv(HERE/'raw/measurements.csv',MEASUREMENT_FIELDS,row)
        if row['valid']!='true':fail('formal',row)
        else:done.add(key(item))
        print(f'FORMAL {len(done)}/{len(schedule)} order={item["execution_order"]} '
            f'{item["suite"]}/{item["benchmark"]} {item["engine"]} '
            f'{row.get("elapsed_ms")}ms valid={row["valid"]}',flush=True)
    verify()

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('stage',choices=('init','smoke','frontend','tier','correctness','calibrate','selected-correctness','pilot','formal','all'))
    stage=parser.parse_args().stage
    actions={'init':initialize,'smoke':smoke,'frontend':frontend,'tier':tier,
        'correctness':correctness,'calibrate':calibration,'selected-correctness':lambda:correctness(True),
        'pilot':pilot,'formal':formal}
    if stage=='all':
        for step in ('smoke','frontend','tier','correctness','calibrate','selected-correctness','pilot','formal'):
            print('STAGE '+step,flush=True);actions[step]()
    else:actions[stage]()

if __name__=='__main__':main()

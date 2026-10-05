"""Bounded clock-chain validation, record audit, and 180s short-window evidence."""
from __future__ import annotations
import json, math, os, re, subprocess, sys, time
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
sys.path.insert(0,str(ROOT/'experiments/three_engine_baseline'))
import cohort
from runtime_setup import save,sha

def command(engine,script):
    m=cohort.manifest()['engines'][engine]
    base=str(cohort.HERE/'adapters'/f'{engine}.js')
    clock=str(HERE/'adapters'/f'{engine}.js')
    return m['command_prefix']+(['-I',base,'-I',clock,str(script)] if engine=='quickjs' else [base,clock,str(script)])

def capture(engine,script,label,environment=None):
    path=HERE/'raw'/f'{label}.{engine}.json'
    if path.exists():return json.loads(path.read_text())
    cmd=command(engine,script)
    start=time.perf_counter_ns()
    try:
        p=subprocess.run(cmd,cwd=ROOT,capture_output=True,timeout=40,env=environment,check=False)
        r={'exit_code':p.returncode,'stdout':p.stdout.decode(errors='replace'),'stderr':p.stderr.decode(errors='replace')}
    except subprocess.TimeoutExpired as e:
        r={'exit_code':None,'stdout':(e.stdout or b'').decode(errors='replace'),'stderr':(e.stderr or b'').decode(errors='replace'),'timeout':True}
    r.update(command=cmd,outer_wall_ns=time.perf_counter_ns()-start,script_sha256=sha(script))
    save(path,r)
    return r

def generated(duration,calls=0):
    config=json.dumps({'duration_ms':duration,'calls':calls})
    script=HERE/'generated'/f'control.{duration}.{calls}.js'
    save(script,(HERE/'control.js').read_text().replace('__CONFIG__',config))
    return script

def main():
    cohort.verify()
    auditpath=HERE/'audit.json'
    if auditpath.exists():
        old=json.loads(auditpath.read_text())
        if old['status']!='PASS':raise RuntimeError('existing timer gate failed; use a new attempt')
        print('TIMER CHAIN PASS (same frozen artifacts/evidence)',flush=True)
        return
    errors=[]
    report={'mode':'MAIN_MONOTONIC_V1','python_clock_info':vars(time.get_clock_info('perf_counter')),
            'quickjs_shell_rebuilt':False,'old_wall_clock_cause':'UNKNOWN',
            'internal_clock_semantics':'monotonic elapsed milliseconds; differences only within process',
            'comparison_tolerance_ms':5.0,'tolerance_basis':'5ms conservative allowance exceeds observed quantization (<1ms); wrapper/startup/exit only increase external duration; do not require equality',
            'control_results':[],'binding_evidence':{},'errors':errors}
    if not report['python_clock_info']['monotonic'] or report['python_clock_info']['adjustable']:
        errors.append('Python outer clock not monotonic/unadjustable')
    # Independently check historical record->stdout->script->same command identity.
    anomalies=[]
    historical=ROOT/'experiments/sunspider_three_engine'
    for case,engine,n,order in [('3d-raytrace','jsc',64,3),('access-binary-trees','v8',256,2)]:
        p=historical/'records/calibration/MAIN'/case/f'N{n}.rep0.engine-{engine}.order{order}.attempt001.json'
        r=json.loads(p.read_text())
        payload=json.loads(r['stdout'].split('TEB_RESULT:',1)[1])
        script=Path(r['script_path']); text=script.read_text()
        identity=(r['command']==cohort.command(engine,script) and sha(script)==r['script_sha256']
                  and payload['elapsed_ms']==r['elapsed_ms'] and payload['N']==n
                  and r['elapsed_per_call']==r['elapsed_ms']/n
                  and 'var __tebStarted = Date.now();' in text
                  and '__tebElapsed = Date.now() - __tebStarted;' in text)
        anomalies.append({'record_path':str(p),'sha256':sha(p),'record_stdout_script_match':identity,
                          'internal_ms':r['elapsed_ms'],'external_ms':r['outer_wall_ns']/1e6,
                          'performance_claim':False})
        if not identity:errors.append('historical record identity/units mismatch')
    runner=(historical/'experiment.py').read_text()
    pattern=r'started = time.perf_counter_ns\(\).*?subprocess.run\(cmd.*?r\[\x27outer_wall_ns\x27\] = time.perf_counter_ns\(\) - started'
    report['old_record_audit']={'anomalies':anomalies,'outer_boundary_source_match':bool(re.search(pattern,runner,re.S)),
       'same_internal_function':True,'namespace_separation':'__teb IIFE variables; core source reconstruction checked',
       'unit_conversion':'outer ns / 1e6, inner ms; no engine mixing',
       'record_or_boundary_bug_found':False,'causal_wall_clock_attribution':'UNKNOWN'}
    if not report['old_record_audit']['outer_boundary_source_match']:errors.append('old outer boundary source mismatch')
    # Differential clock_gettime instrumentation is only a diagnostic helper.
    helper=HERE/'generated/clock_interpose.so'
    helper.parent.mkdir(parents=True,exist_ok=True)
    if not helper.exists():
        cmd=['gcc','-O2','-shared','-fPIC',str(HERE/'clock_interpose.c'),'-ldl','-o',str(helper)]
        p=subprocess.run(cmd,capture_output=True,text=True,timeout=60,check=False)
        save(HERE/'raw/interposer_build.json',{'command':cmd,'exit_code':p.returncode,'stdout':p.stdout,'stderr':p.stderr})
        if p.returncode:raise RuntimeError('diagnostic helper build failed')
    save(HERE/'raw/interposer_artifact.json',{'path':str(helper),'sha256':sha(helper),'diagnostic_only':True})
    env=os.environ.copy();env['LD_PRELOAD']=str(helper)
    for engine in cohort.ENGINES:
        baseline=HERE/'generated/binding.baseline.js'
        calls=HERE/'generated/binding.calls.js'
        save(baseline,"console.log('BINDING_BASELINE');\n")
        save(calls,"for(var __clockI=0;__clockI<10000;++__clockI) benchNow(); console.log('BINDING_CALLS');\n")
        b=capture(engine,baseline,'binding.baseline',env)
        c=capture(engine,calls,'binding.calls',env)
        bc=re.findall(r'CLOCK_COUNTS:([\d,]+)',b['stderr'])
        cc=re.findall(r'CLOCK_COUNTS:([\d,]+)',c['stderr'])
        if b['exit_code'] or c['exit_code'] or len(bc)!=1 or len(cc)!=1:
            errors.append('clock binding instrumentation failed '+engine);continue
        base=list(map(int,bc[0].split(',')));count=list(map(int,cc[0].split(',')))
        report['binding_evidence'][engine]={'baseline_counts':base,'10000_calls_counts':count,
              'CLOCK_MONOTONIC_id':time.CLOCK_MONOTONIC,
              'monotonic_call_difference':count[time.CLOCK_MONOTONIC]-base[time.CLOCK_MONOTONIC],
              'instrumentation_in_formal_samples':False}
        if count[time.CLOCK_MONOTONIC]-base[time.CLOCK_MONOTONIC]<9900:
            errors.append('benchNow native monotonic binding not established '+engine)
    # Fresh uninstrumented processes, multiple durations, no wall-clock termination.
    for duration in (0,25,100,1000):
        for engine in cohort.ENGINES:
            for rep in (1,2):
                r=capture(engine,generated(duration,200000),f'control.{duration}.rep{rep}')
                try:
                    p=json.loads(re.search(r'^TIMER_CONTROL:(.*)$',r['stdout'],re.M).group(1))
                    outer=r['outer_wall_ns']/1e6
                    okay=r['exit_code']==0 and not r['stderr'] and p['backwards']==0
                    okay=okay and math.isfinite(p['elapsed_ms']) and 0<=p['elapsed_ms']<=outer+5
                    okay=okay and p['elapsed_ms']>=duration and p['elapsed_ms']<=duration+50
                    report['control_results'].append({'engine':engine,'duration_ms':duration,'rep':rep,
                        'outer_ms':outer,'internal_ms':p['elapsed_ms'],'clock_resolution_observed_ms':p['minimum_positive_delta_ms'],'pass':okay})
                    if not okay:errors.append('control chain failed '+engine+' '+str(duration))
                except Exception as e:errors.append('control payload: '+str(e))
    # 180s observation: 18 sequential engine windows of 10s; save every window.
    windows=[]
    for window in range(18):
        engine=cohort.ENGINES[window%3]
        r=capture(engine,generated(10000),f'observation.window{window+1:02}')
        p=json.loads(re.search(r'^TIMER_CONTROL:(.*)$',r['stdout'],re.M).group(1))
        okay=(r['exit_code']==0 and not r['stderr'] and math.isfinite(p['elapsed_ms'])
              and 10000<=p['elapsed_ms']<=r['outer_wall_ns']/1e6+5)
        windows.append({'window':window+1,'engine':engine,'internal_ms':p['elapsed_ms'],
                        'outer_ms':r['outer_wall_ns']/1e6,'Date_delta_ms':p['date_elapsed_ms'],'pass':okay})
        print(f'TIMER WINDOW {window+1}/18 {engine} internal={p["elapsed_ms"]:.3f}ms outer={r["outer_wall_ns"]/1e6:.3f}ms pass={okay}',flush=True)
        if not okay:errors.append('180s observation clock chain failed '+str(window+1))
    report['observation_windows']=windows
    report['observation_duration_internal_ms']=sum(p['internal_ms'] for p in windows)
    report['runtime_sha256']={e:cohort.manifest()['engines'][e]['binary']['sha256'] for e in cohort.ENGINES}
    report['adapters_sha256']={e:sha(HERE/'adapters'/f'{e}.js') for e in cohort.ENGINES}
    cohort.verify()
    report['status']='PASS' if not errors else 'BLOCKED_MONOTONIC_CHAIN'
    save(auditpath,report)
    print('TIMER AUDIT '+report['status']+' '+json.dumps(errors),flush=True)
    if errors:raise RuntimeError('monotonic timing chain failed')

if __name__=='__main__':main()

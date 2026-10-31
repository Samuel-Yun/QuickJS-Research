"""Bounded C feasibility investigation. Diagnostics only, after A/B audit."""
import argparse
import json
import os
from pathlib import Path
import shutil
import run as r

HERE=r.HERE


def capabilities():
    r.verify();assert r.read(HERE/'independent_audit.json')['status']=='INDEPENDENT_A_B_AUDIT_PASS'
    m=r.manifest()
    r.capture(HERE/'raw/C/qjs_help.json',m['engines']['quickjs']['command_prefix']+['--help'])
    r.capture(HERE/'raw/C/platform_capabilities.json',['sh','-c','command -v perf; cat /proc/sys/kernel/perf_event_paranoid; true'])
    js="""console.log('CAPABILITIES '+JSON.stringify({
console:Object.getOwnPropertyNames(console),
d8:typeof d8==='object'?Object.getOwnPropertyNames(d8):[],
profiler:typeof d8==='object' &amp;&amp; d8.profiler?Object.getOwnPropertyNames(d8.profiler):[]}));
""".replace('&amp;&amp;','&&')
    p=HERE/'diagnostics/profiler_capabilities.js';r.save(p,js)
    rec=r.capture(HERE/'raw/C/v8_api_capabilities.json',r.command('v8',p))
    assert rec['exit_code']==0
    r.save(HERE/'diagnostics/C_source_notes.json',dict(
        qjs_signal_record='SASample={uintptr_t pc; uint64_t ns; int site;}; property-site context only, no full current JS function identity',
        qjs_existing_source='experiments/richards_site_attribution/attempt01/probes/site_hooks.h',
        qjs_existing_source_sha256=r.sha(r.OLD/'probes/site_hooks.h'),
        source_scope='no claim that native-PC/lookup-region samples equal whole JS function time',
        official_references=['https://v8.dev/docs/profile','https://v8.dev/docs/benchmarks','https://man7.org/linux/man-pages/man1/perf-record.1.html'],
        no_sysctl_power_root_or_engine_rebuild=True))
    print(rec['stdout'],flush=True)


def cli_samples():
    r.verify();assert r.read(HERE/'independent_audit.json')['status']=='INDEPENDENT_A_B_AUDIT_PASS'
    helptext=r.read(HERE/'raw/correctness/v8_help.json')['stdout']
    for flag in ('--prof (','--prof-sampling-interval','--logfile','--logfile-per-isolate'):
        assert flag in helptext
    # A longer unchanged original workload for sufficient diagnostic samples.
    # None of these results are formal performance samples.
    p=r.script('richards_run',1024)
    perf=shutil.which('perf')
    if perf:
        r.capture(HERE/'raw/C/perf_version.json',[perf,'--version'])
        r.capture(HERE/'raw/C/perf_attempt.json',[perf,'record','-e','cpu-clock','-F','99','-o',str(HERE/'raw/C/perf.data'),'--']+r.command('quickjs',p),timeout=30)
    for rep in (1,2,3):
        # Adjacent control/profile are only perturbation checks, not causal data.
        for on in ([False,True] if rep!=2 else [True,False]):
            extra=()
            if on:
                logfile=HERE/'raw/C'/f'v8.rep{rep}.log'
                extra=('--prof','--prof-sampling-interval=1000','--no-logfile-per-isolate','--logfile='+str(logfile))
            rec=r.capture(HERE/'raw/C'/f'v8_{"on" if on else "off"}_rep{rep}.json',r.command('v8',p,extra),timeout=30)
            _,valid=r.payload('richards_run',rec,1024,'diagnostic');assert valid
    logfile=HERE/'raw/C/v8.interval2000.log'
    rec=r.capture(HERE/'raw/C/v8_on_interval2000.json',r.command('v8',p,('--prof','--prof-sampling-interval=2000','--no-logfile-per-isolate','--logfile='+str(logfile))),timeout=30)
    _,valid=r.payload('richards_run',rec,1024,'diagnostic');assert valid
    print('C_DIAGNOSTIC_CLI_PROFILES_COMPLETE',flush=True)


def api_test():
    r.verify()
    js="""d8.profiler.setOnProfileEndListener(function(p){
 console.log('PROFILE_TYPE '+JSON.stringify({type:typeof p,keys:typeof p==='object'?Object.keys(p):null}));
 console.log('CPU_PROFILE '+(typeof p==='string'?p:JSON.stringify(p)));
});
console.profile('rft-capability');
function rftDiagnosticSum(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}
console.log('TEST_SUM '+rftDiagnosticSum(1000000));
console.profileEnd('rft-capability');
"""
    p=HERE/'diagnostics/profiler_api_test.js';r.save(p,js)
    rec=r.capture(HERE/'raw/C/v8_api_test.json',r.command('v8',p),timeout=30)
    print(json.dumps({k:rec[k] for k in ('exit_code','stderr','timeout')}),flush=True)
    print(rec['stdout'][:180],flush=True)


def api_profiles():
    r.verify()
    helptext=r.read(HERE/'raw/correctness/v8_help.json')['stdout']
    assert '--cpu-profiler-sampling-interval' in helptext
    original=r.script('richards_run',2048)
    source=original.read_bytes().decode()
    assert source.count('var __cfStart=benchNow();')==1
    assert source.count('var __cfStop=benchNow();')==1
    source=source.replace('var __cfStart=benchNow();', '''var __rftBeforeProfile=benchNow(), __rftCallbackTime;
 d8.profiler.setOnProfileEndListener(function(p){
   __rftCallbackTime=benchNow();
   console.log('CPU_PROFILE '+(typeof p==='string'?p:JSON.stringify(p)));
 });
 console.profile('rft-original-richards');
 var __cfStart=benchNow();''').replace('var __cfStop=benchNow();', '''var __cfStop=benchNow();
 console.profileEnd('rft-original-richards');
 console.log('C_WINDOW '+JSON.stringify({before_profile_ms:__rftBeforeProfile,
   workload_start_ms:__cfStart,workload_stop_ms:__cfStop,
   callback_ms:__rftCallbackTime,N:2048}));''')
    p=HERE/'diagnostics/original.cpu_profile.N2048.v2.js';r.save(p,source)
    assert source.count(r.target_bytes().decode())==1
    r.save(HERE/'diagnostics/C_profile_source_identity.json',dict(
        original_script=str(original),original_script_sha256=r.sha(original),
        diagnostic_script=str(p),diagnostic_script_sha256=r.sha(p),
        target_function_sha256=r.manifest()['original_function_sha256'],
        target_line_zero_based=source[:source.index(r.TARGET.decode())].count('\n'),
        change='only standalone driver brackets profiler and prints profile after clock stop; upstream base/richards bytes unchanged',
        diagnostic_only=True))
    for rep in (1,2,3):
        for on in ([False,True] if rep!=2 else [True,False]):
            rec=r.capture(HERE/'raw/C'/f'api_{"on" if on else "off"}_rep{rep}.json',
                r.command('v8',p if on else original,('--cpu-profiler-sampling-interval=1000',) if on else ()),timeout=40)
            _,valid=r.payload('richards_run',rec,2048,'diagnostic');assert valid
            print('API_PROFILE',rep,on,rec['exit_code'],flush=True)
    rec=r.capture(HERE/'raw/C/api_on_interval2000.json',
        r.command('v8',p,('--cpu-profiler-sampling-interval=2000',)),timeout=40)
    _,valid=r.payload('richards_run',rec,2048,'diagnostic');assert valid
    print('C_STRUCTURED_PROFILES_COMPLETE',flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['capabilities','cli_samples','api_test','api_profiles'])
    globals()[p.parse_args().stage]()

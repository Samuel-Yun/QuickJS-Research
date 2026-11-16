"""Bounded OOM controls; independent diagnostic builds, never performance binaries."""
import importlib
import json
import hashlib
import re
from pathlib import Path
import shutil

import run as r
import builder

e,H=r.e,r.H


def control(label,parent):
    original=builder.files
    def material(name):
        if name in [label,parent]: return e.seed_module.seed(parent)
        return original(name)
    builder.files=material
    builder.variants.PARENTS[label]=parent
    if not (H/'identities'/(label+'.json')).exists(): builder.build(label)
    else:
        identity=e.lab.load(H/'identities'/(label+'.json'))
        assert e.lab.load(H/'active.identity.json')['label']==label
        assert all(e.lab.sha(H/'active'/n)==sha for n,sha in identity['source_sha256'].items())
    target=H/'artifacts'/(label+'.asan.qjs')
    if not target.exists():
        out=e.capture(['make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs'],
            'oom_control_build',label,300,cwd=H/'active')
        assert out['exit_code']==0,out['stderr'][-2000:]
        shutil.copyfile(H/'active/qjs',target);target.chmod(0o755)
        r.save('oom_control.'+label+'.json',dict(parent=parent,path=str(target),
            sha256=e.lab.sha(target),source_sha256=e.lab.load(H/'identities'/(label+'.json'))['source_sha256'],
            diagnostic_only=True,performance_binary_replaced=False))
    builder.files=original
    return target


def main():
    e.gate();_,active=r.inventory();assert not active,active
    e.os.sched_setaffinity(0,{2})
    checks=[]
    for label,parent in [('A_OOM_STATS','A'),('S001_OOM_STATS','s001')]:
        identity=H/('oom_control.'+label+'.json')
        binary=Path(e.lab.load(identity)['path']) if identity.exists() else control(label,parent)
        assert e.lab.sha(binary)==e.lab.load(identity)['sha256']
        for limit in [524288,1048576]:
            out=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
                'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',binary,'--std',
                '--memory-limit',str(limit),H/'oom_pressure.js'],
                'oom_baseline_control',label+'/'+str(limit),30,
                dict(binary_sha256=e.lab.sha(binary),script_sha256=e.lab.sha(H/'oom_pressure.js')))
            checks.append(dict(parent=parent,label=label,limit_bytes=limit,token=out['token'],
                exit_code=out['exit_code'],null_catch_error="cannot read property 'name' of null" in out['stderr'],
                asan_error='ERROR: AddressSanitizer:' in out['stderr'],
                backtrace_region='in build_backtrace' in out['stderr']))
    r.save('oom_baseline_controls.'+e.EPOCH+'.json',checks)
    print('OOM_BASELINE_CONTROLS_SAVED',json.dumps(checks),flush=True)


def handled():
    """New probe version and records; do not overwrite the original failed campaign."""
    import finish
    sources={'A':e.seed_module.seed('A'),'s001':e.seed_module.seed('s001')}
    sources.update({label:builder.files(label) for label in finish.LABELS})
    equivalence={}
    for name in ['build_backtrace','JS_ThrowError2']:
        hashes={}
        for label,files in sources.items():
            match=re.search(r'^static (?:void|JSValue) '+name+r'\([^;]*?\n\{.*?^\}',files['quickjs.c'],re.M|re.S)
            assert match,name
            hashes[label]=hashlib.sha256(match.group().encode()).hexdigest()
        equivalence[name]=dict(sha256=hashes,all_identical=len(set(hashes.values()))==1)
    checks=[]
    controls=[(name,Path(e.lab.load(H/('oom_control.'+name+'.json'))['path']))
        for name in ['A_OOM_STATS','S001_OOM_STATS']]
    binaries=controls+[(label,H/'artifacts'/(label+'.sanitized.qjs')) for label in finish.LABELS]
    script=H/'oom_pressure_handled.js'
    for label,binary in binaries:
        for limit in [524288,1048576]:
            out=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
                'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',binary,'--std',
                '--memory-limit',str(limit),script],
                'oom_handled_probe',label+'/'+str(limit),30,
                dict(binary_sha256=e.lab.sha(binary),script_sha256=e.lab.sha(script)))
            checks.append(dict(label=label,limit_bytes=limit,token=out['token'],exit_code=out['exit_code'],
                pass_=out['exit_code']==0 and not out['stderr'] and out['stdout']=='V7_OOM_PRESSURE_PASS\n',
                asan_error='ERROR: AddressSanitizer:' in out['stderr'],
                backtrace_region='in build_backtrace' in out['stderr']))
    result=dict(status='PASS_BOUNDED_REVISED_PROBE' if all(x['pass_'] for x in checks) else 'LIMITED_OOM_FAILURES',
        original_failures_preserved=True,checks=checks,helper_source_equivalence=equivalence,
        original_baseline_controls=e.lab.load(H/('oom_baseline_controls.'+e.EPOCH+'.json')),
        performance_remeasured=False,complete_oom_safety_proven=False)
    r.save('oom_followup.'+e.EPOCH+'.json',result)
    print('OOM_FOLLOWUP_SAVED',json.dumps(result),flush=True)


def bounded_a_control():
    """Eight fixed intermediate budgets; not an unbounded search for a crash."""
    ident=e.lab.load(H/'oom_control.A_OOM_STATS.json')
    rows=[]
    for limit in [589824,655360,720896,786432,851968,917504,983040,1114112]:
        out=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
            'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',ident['path'],'--std',
            '--memory-limit',str(limit),H/'oom_pressure.js'],
            'oom_bounded_a_control','A/'+str(limit),30,
            dict(binary_sha256=ident['sha256'],script_sha256=e.lab.sha(H/'oom_pressure.js')))
        rows.append(dict(limit_bytes=limit,token=out['token'],exit_code=out['exit_code'],
            asan_error='ERROR: AddressSanitizer:' in out['stderr'],
            backtrace_region='in build_backtrace' in out['stderr']))
    r.save('oom_bounded_a_control.'+e.EPOCH+'.json',rows)
    print('BOUNDED_A_CONTROLS_SAVED',json.dumps(rows),flush=True)


if __name__=='__main__': main()

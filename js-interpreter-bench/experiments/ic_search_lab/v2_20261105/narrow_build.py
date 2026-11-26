"""Selected designs only, one active tree, separate diagnostic executables."""
import argparse,difflib,hashlib,json,os
from pathlib import Path
import run
lab=run.lab;HERE=run.HERE
def restore(label,to):
    run.gate();m=lab.load(HERE/('narrow_'+label+'.json'));active=HERE/'active'
    for n,h in m['source_sha256'].items():assert lab.sha(active/n)==h,'unrecorded active edit '+n
    for n,data in lab.reconstructed_sources(to).items():(active/n).write_bytes(data)
    lab.append(dict(event='diagnostic_restore',from_label=label,to=to,timestamp=lab.stamp(),boot_id=lab.boot()))
    print('DIAGNOSTIC_ACTIVE_RESTORED',label,to,flush=True)
def build(label):
    run.gate();assert label in ['M','s001','s004'];assert not (HERE/('narrow_'+label+'.json')).exists()
    os.sched_setaffinity(0,{2});active=HERE/'active';base=lab.reconstructed_sources(label);patch=[];hashes={}
    for n,data in base.items():
        actual=(active/n).read_bytes();hashes[n]=hashlib.sha256(actual).hexdigest()
        if actual!=data:patch.extend(difflib.unified_diff(data.decode().splitlines(True),actual.decode().splitlines(True),fromfile='a/'+n,tofile='b/'+n))
    assert patch;lab.save(HERE/('diagnostic_'+label+'.patch'),''.join(patch))
    common=[active/'.obj'/(n+'.o') for n in ['dtoa','libregexp','libunicode','cutils']]
    # Common libraries/public header did not change in any design; current objects
    # are from the recorded s004 Release build, not an untracked old-home runtime.
    origin=run.measure.artifact('s004')
    for n in ['dtoa.c','libregexp.c','libunicode.c','cutils.c','quickjs.h']:
        assert lab.sha(active/n)==origin['source_sha256_after_build'][n]==hashlib.sha256(base[n]).hexdigest()
    out=HERE/'artifacts'/('narrow_'+label)
    command=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-DHAVE_CLOSEFROM',
       '-DV2_NARROW','-I'+str(active),'-I'+str(HERE)]
    if label=='s001':command+=['-DV2_PC_RELATIVE']
    command+=[HERE/'narrow_controller.c',*common,'-lm','-lpthread','-ldl','-o',out]
    identity=dict(label=label,source_sha256=hashes,controller_sha256=lab.sha(HERE/'narrow_controller.c'),
        counter_header_sha256=lab.sha(HERE/'narrow_counts.h'),common_object_sha256={p.name:lab.sha(p) for p in common},
        scope='only JS_Call(work,items,8192); setup, value/layout mutation and printing outside enabled counters; NOT timing')
    r=lab.capture(command,'narrow_build',label,180,identity,active);assert r['exit_code']==0,r['stderr']
    manifest=dict(**identity,binary_sha256=lab.sha(out),path=str(out),command=list(map(str,command)),boot_id=lab.boot())
    lab.save(HERE/('narrow_'+label+'.json'),manifest)
    results=[]
    for mode in ['mono','poly2']:
        r=lab.capture([out,mode],'narrow_run',label+'.'+mode,30,manifest)
        results.append(dict(mode=mode,exit_code=r['exit_code'],stdout=r['stdout'],stderr=r['stderr'],token=r['token']))
        assert r['exit_code']==0 and not r['stderr'] and r['stdout'].endswith('NARROW_PASS\n'),r
    lab.save(HERE/('narrow_'+label+'.results.json'),dict(status='PASS',results=results,
        no_performance_claim=True,scope=identity['scope'],first_phase_no_target_prerun=True,
        later_phases='same diagnostic process, explicit value then layout change; not formal warmup'))
    print('NARROW_BUILD_AND_COUNTS_PASS',label,flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('action',choices=['build','restore']);p.add_argument('label');p.add_argument('to',nargs='?');a=p.parse_args()
    if a.action=='build':build(a.label)
    else:restore(a.label,a.to)

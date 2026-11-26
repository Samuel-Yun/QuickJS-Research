"""One final identity check and optional cleanup of this lab's own idle helper.

No benchmark/build is launched; no WSL shutdown, global process kill or deletion.
Never append to the already frozen measurement stream.
"""
import argparse,os,signal,subprocess
from pathlib import Path
import lab

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--release-owned-idle',action='store_true');a=p.parse_args()
    out=lab.HERE/'completion_check.json';assert not out.exists(),'completion record is write-once'
    expected=lab.load(lab.HERE/'environment.postreboot.json')['boot_id'];current=lab.boot()
    assert current==expected,'boot changed after sampling; preserve evidence and inspect, do not recategorize'
    seed=lab.load(lab.HERE/'seed_identity.json');workspace=lab.load(lab.HERE/'workspace.json')
    hashes={}
    for label in ['A','M']:
        original=seed['artifacts'][label];copy=workspace['artifacts'][label]
        hashes[label]=dict(original_path=original['path'],original_sha256=lab.sha(original['path']),
                          copied_path=copy['path'],copied_sha256=lab.sha(copy['path']))
        assert hashes[label]['original_sha256']==hashes[label]['copied_sha256']==original['sha256']==copy['sha256']
    final=lab.load(lab.HERE/'c012.matched.json')
    active={n:lab.sha(lab.HERE/'active'/n) for n in final['source_sha256_after_build']}
    assert active==final['source_sha256_after_build']
    for n,h in final['build_support_files'].items():assert lab.sha(lab.HERE/'active'/n)==h
    tasks=subprocess.check_output(['ps','-eo','pid=,comm=,args='],text=True)
    busy=[line for line in tasks.splitlines() if len(line.split())>1 and
          (line.split()[1] in ['qjs','d8','gcc','g++','cc1','cc1plus','make','perf'] or
           (line.split()[1].startswith('python') and any(s in line for s in ['/measure.py ','/refine.py ','/regressions.py ','/lab.py build ']))) ]
    assert not busy,'other engine/compiler/collector active; do not stop it'
    pid=4149;proc=Path('/proc')/str(pid);marker='IC_SEARCH_IDLE_EXTENSION';helper=dict(pid=pid,action='not requested')
    if a.release_owned_idle:
        if not proc.exists():helper['action']='already exited, no signal sent'
        else:
            cmd=(proc/'cmdline').read_bytes().replace(b'\0',b' ').decode()
            assert marker in cmd and 'time.sleep(14400)' in cmd,'PID no longer identifies our exact idle helper'
            assert proc.stat().st_uid==os.getuid(),'helper ownership changed; no signal'
            helper.update(command=cmd,action='SIGTERM sent only to verified own idle helper')
            os.kill(pid,signal.SIGTERM)
    result=dict(status='FINAL_IDENTITIES_MATCH_NO_ENGINE_OR_COMPILER_ACTIVE',timestamp=lab.stamp(),boot_id=current,
        frozen_original_and_copy_hashes=hashes,active_version='c012, not promoted; ignored active source only',
        active32_source_and_compat_hashes_match=True,busy_processes=busy,idle_helper=helper,
        meaning='Cleanup happens AFTER all measurements. No runtime or user application terminated; WSL not shut down.')
    lab.save(out,result);print(result['status'],helper['action'],flush=True)

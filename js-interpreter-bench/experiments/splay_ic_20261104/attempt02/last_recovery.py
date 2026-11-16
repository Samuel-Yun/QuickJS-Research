"""Last bounded environment recovery: make concurrency 2 -> 1, no flag change.
Never repeats old queue; preserves incomplete build03/C.
"""
from common import *
import build

def main():
    pin();out=HERE/'last_recovery';assert not out.exists()
    os.environ['SP_CAPTURE_START_DIR']=str(out/'child_starts')
    save(out/'started.json',dict(timestamp=stamp(),boot_id=boot(),hypothesis='Lower build concurrency; retain exact source/options and no background queues',changed_factor='make -j2 to make -j1',recovery_budget_remaining_after_this=0))
    prior=read(HERE/'builds/build03/M_light.verified.json');p=Path(prior['path'])
    artifact=dict(path=str(p),size=p.stat().st_size,actual_sha256=sha(p),expected_sha256=prior['sha256'],ELF=p.open('rb').read(4)==b'\x7fELF')
    save(out/'M_light.actual.json',artifact);assert artifact['actual_sha256']==artifact['expected_sha256'] and artifact['ELF']
    r=capture([p,'-e','console.log(123)'],'actual lightweight diagnostic smoke',timeout=10);save(out/'M_light.smoke.json',r)
    assert r['exit_code']==0 and r['stdout']=='123\n' and not r['stderr']
    # Obtain bounded shape evidence before another compiler step. Never fake full
    # mechanism gate; C and C_light still need their own build/identity checks.
    for n in [1,2]:
        script=OLD/'diagnostic/scripts'/f'Splay.Splay.N{n}.js';report=STORE/f'last_recovery.Splay.M.N{n}.json';assert not report.exists()
        r=capture([p,script],'light Splay N'+str(n),env=dict(os.environ,IC_MECHANISM_REPORT=str(report)),timeout=15)
        save(out/f'Splay.M.N{n}.process.json',r)
        assert r['exit_code']==0 and not r['stderr'], 'light diagnostic failed; preserve and stop'
        save(out/f'Splay.M.N{n}.counters.json',report.read_bytes())
        d=read(report);assert d['target_instances']==1 and d['shape_birth_overflow']==0
        assert all(s['unknown_events']==s['overflow_events']==0 for s in d['shape_focus'])
        if n==2:
            ss=d['phases'][2]['sites'];assert [s['operations'] for s in ss]==[4608,2676,2356]
            assert [s['hits'] for s in ss]==[2432,1347,1209]
            assert [s['replacements'] for s in ss]==[2176,1329,1147]
            assert d['phases'][2]['reads']['operations']==45664
        print('LIGHT_SPLAY_VALID',n,[len(s['layouts']) for s in d['shape_focus']],flush=True)
    dst=STORE/'build04/C';build.copy_source(Path(runtime()['sources']['M']['path']),dst);build.add_control(dst)
    r=capture(['make','-j1','qjs','qjsc'],'serial C control build',cwd=dst,timeout=90);save(out/'C.build.json',r)
    assert r['exit_code']==0,r['stderr'][-3000:]
    exe=dst/'qjs';assert exe.open('rb').read(4)==b'\x7fELF'
    smoke=capture([exe,'-e','console.log(123)'],'C serial smoke',env=dict(os.environ,SP_DISABLE='0'),timeout=10);save(out/'C.smoke.json',smoke)
    assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr']
    save(out/'C.verified.json',dict(path=str(exe),sha256=sha(exe),size=exe.stat().st_size,source=str(dst),formal=True,purpose='mechanism controller only; not OPT'))
    save(out/'gate.json',dict(status='BOUNDED_TASKS_COMPLETE_NOT_FULL_CAMPAIGN_PROOF',boot_id=boot()))

if __name__=='__main__':main()

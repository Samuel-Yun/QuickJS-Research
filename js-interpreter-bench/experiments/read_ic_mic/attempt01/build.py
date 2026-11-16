"""Independent official optimized builds, M first, matched P and clean A."""
import argparse,shutil
from common import *
def release():
    compiler=capture('compiler',['gcc','--version']);capture('linker',['ld','--version']);environment('build')
    ids=read(HERE/'sources/identities.json')['files']
    for v in ['M','P','A']:
        src=STORE/v;assert all(sha(src/p)==h for p,h in ids[v].items())
        assert not (src/'qjs').exists(),'new clean source tree required'
        r=capture(v+'_release',['make','-j2','qjs','qjsc'],src);assert not r['exit_code']
        r=capture(v+'_initial_smoke',[src/'qjs','-e','let o={x:3};function f(o){return o.x;}for(let i=0;i<10;i++)if(f(o)!==3)throw Error();console.log("PASS")']);assert not r['exit_code']
        capture(v+'_ldd',['ldd',src/'qjs'])
    m=dict(campaign=HERE.relative_to(ROOT/'experiments').as_posix(),cohort=os.environ.get('IC_MIC_COHORT','wsl2-'+platform.node()+'-'+platform.machine()),
      mode=MODE,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),created_at=stamp(),
      base=read(HERE/'sources/identities.json')['base'],compiler=compiler['stdout'].splitlines()[0],build_command=['make','-j2','qjs','qjsc'],
      optimization='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,formal_instrumentation=False,flags=[],power=None,frequency=None,background='uncontrolled, snapshots retained',
      artifacts={v:dict(path=str(STORE/v/'qjs'),source=str(STORE/v),sha256=sha(STORE/v/'qjs'),size=(STORE/v/'qjs').stat().st_size,qjsc_sha256=sha(STORE/v/'qjsc')) for v in VERSIONS},
      inputs={p.relative_to(ROOT).as_posix():sha(p) for p in [HERE/'inputs/adapter.js',HERE/'inputs/driver.js',HERE/'design.md',HERE/'patches/A_to_common_M.patch',HERE/'patches/M_to_P.patch']})
    old=read(PREVIOUS/'manifest.json')['inputs'];index=read(HERE/'recovery/workload_line_endings.json')
    for name,h in old.items():
        if name.startswith('benchmarks/octane/upstream/'):
            p=ROOT/name;raw=p.read_bytes();assert sha(p)==h or digest(raw.replace(b'\r\n',b'\n'))==index[name]['LF_normalized_sha256'];m['inputs'][name]=sha(p)
    save(HERE/'manifest.json',m);print('RELEASE_BUILDS_PASS',flush=True)
def correctness():
    import correctness_run
    correctness_run.main()
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['release','correctness']);a=p.parse_args();globals()[a.stage]()

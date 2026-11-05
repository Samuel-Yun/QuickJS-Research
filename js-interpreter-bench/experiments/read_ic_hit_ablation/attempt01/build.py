"""Clean exact A/M and one shared switch binary; all make options matched."""
import argparse
from common import *
def release():
    ids=read(HERE/'sources/identities.json')['files'];compiler=capture('compiler',['gcc','--version']);environment('build')
    for v in SOURCES:
        src=STORE/v;assert not (src/'qjs').exists();assert all(sha(src/p)==h for p,h in ids[v].items())
        r=capture(v+'_release',['make','-j2','qjs','qjsc'],src,env=mode_env('ON'));assert r['exit_code']==0
        r=capture(v+'_smoke',[src/'qjs','-e','let o={x:3};function f(o){return o.x;}for(let i=0;i<20;i++)if(f(o)!==3)throw Error();console.log("PASS")'],env=mode_env('ON'));assert not r['exit_code'] and not r['stderr']
        capture(v+'_ldd',['ldd',src/'qjs'])
    artifacts={}
    for v in VERSIONS:
        src=STORE/('SW' if v in ['ON','LOOKUP'] else v)
        artifacts[v]=dict(path=str(src/'qjs'),source=str(src),sha256=sha(src/'qjs'),size=(src/'qjs').stat().st_size,qjsc_sha256=sha(src/'qjsc'),mode_value=config(v),mode_key=MODE_KEY)
    inputs={p.relative_to(ROOT).as_posix():sha(p) for p in [HERE/'inputs/adapter.js',HERE/'inputs/driver.js',HERE/'design.md',HERE/'patches/A_to_M.patch',HERE/'patches/M_to_SW.patch']}
    index=read(PREVIOUS/'recovery/workload_line_endings.json');old=read(PREVIOUS/'manifest.json')['inputs']
    for name,h in old.items():
        if name.startswith('benchmarks/octane/upstream/'):
            p=ROOT/name;assert sha(p)==h or digest(p.read_bytes().replace(b'\r\n',b'\n'))==index[name]['LF_normalized_sha256'];inputs[name]=sha(p)
    save(HERE/'manifest.json',dict(campaign=HERE.relative_to(ROOT/'experiments').as_posix(),cohort='wsl2-'+platform.node()+'-x86_64',mode=MODE,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),base=read(HERE/'sources/identities.json')['base'],compiler=compiler['stdout'].splitlines()[0],build_command=['make','-j2','qjs','qjsc'],optimization='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,formal_instrumentation=False,flags=[],artifacts=artifacts,inputs=inputs,power=None,frequency=None,background='uncontrolled snapshots'))
    print('RELEASE_BUILD_PASS',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['release']);a=p.parse_args();release()

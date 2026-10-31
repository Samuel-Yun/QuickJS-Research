"""Verify fixed sources and clean-build the original M, without tuning."""
import shutil
from common import *
def main():
    assert platform.system()=='Linux' and platform.machine()=='x86_64'
    started=dict(timestamp=stamp(),monotonic_start_ns=time.perf_counter_ns(),boot_id=boot(),budget_seconds=BUDGET)
    if not (HERE/'started.json').exists():save(HERE/'started.json',started)
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    for label,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current'])]:
        if not (HERE/'raw/build'/('git_'+label+'.json')).exists():capture('git_'+label,git+args,timeout=30)
    assert (HERE/'raw/host_git_status.json').exists(),'record Git with the native Windows client; Linux cross-DrvFS status blocked'
    capture('environment',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /home /mnt/c; uptime; ps -eo pid,comm,pcpu --sort=-pcpu | head -16; true'])
    compiler=capture('compiler',['gcc','--version']);capture('linker',['ld','--version']);capture('python',['python3','--version'])
    ids=read(MIC/'sources/identities.json');old=read(MIC/'manifest.json');v=read(V8/'runtime.json')
    assert ids['base']=='04be246001599f5995fa2f2d8c91a0f198d3f34c'
    assert compiler['stdout'].splitlines()[0]==old['compiler'],'toolchain change: explicitly establish new configuration before building'
    files=ids['files']['M'];src=Path(old['artifacts']['M']['source']);dst=STORE/'M'
    assert not dst.exists(),'new clean build directory required'
    for name,h in files.items():assert sha(src/name)==h,name
    for name,h in files.items():
        target=dst/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,target)
    assert all(sha(dst/name)==h for name,h in files.items())
    save(HERE/'sources.json',dict(base=ids['base'],M_origin=str(src),M_source_files=files,clean_source_copy=str(dst),historical_M_binary=old['artifacts']['M'],no_R_or_mode_changes=True))
    r=capture('M_clean_release',['make','-j2','qjs','qjsc'],dst);assert r['exit_code']==0
    arts={'QJS_A':v['quickjs']['binary'],'QJS_M':dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),size_bytes=(dst/'qjs').stat().st_size),'V8_ON':v['v8']['binary'],'V8_OFF':v['v8']['binary']}
    for a in [*arts.values(),*v['v8']['dependencies']]:assert sha(a['path'])==a['sha256']
    for name,h in v['quickjs']['source_files'].items():assert sha(Path(v['quickjs']['source'])/name)==h
    commands={'QJS_A':[arts['QJS_A']['path']],'QJS_M':[arts['QJS_M']['path']]}
    d8=[v['v8']['binary']['path'],'--snapshot_blob='+v['v8']['dependencies'][0]['path'],'--jitless','--no-lazy']
    commands.update(V8_ON=d8+['--use-ic'],V8_OFF=d8+['--no-use-ic'])
    manifest=dict(cohort='WSL2-'+platform.node()+'-ic-mechanism-20261028-attempt01',mode=MODE,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),artifacts=arts,v8_dependencies=v['v8']['dependencies'],commands=commands,compiler=compiler['stdout'].splitlines()[0],M_flags='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,M_source_files=files,M_source=str(dst),A_source=v['quickjs']['source'],A_source_files=v['quickjs']['source_files'],v8_version='15.6.21',v8_build_source_commit=None,v8_reference_commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764',power=None,frequency=None,temperature=None,background='uncontrolled; snapshots retained',environment=environment())
    save(HERE/'manifest.json',manifest)
    for cond,cmd in commands.items():
        r=capture(cond+'_smoke',cmd+['-e','var o={x:3};function f(p){return p.x}if(f(o)!==3)throw Error();console.log("PASS")']);assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
        capture(cond+'_ldd',['ldd',cmd[0]])
    for cond in ['V8_ON','V8_OFF']:
        r=capture(cond+'_flags',commands[cond]+['--print-flag-values']);assert r['exit_code']==0
    capture('d8_help',commands['V8_ON']+['--help'])
    print('CLEAN_M_AND_RUNTIME_IDENTITIES_READY',flush=True)
if __name__=='__main__':main()

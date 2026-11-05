"""R clean release build; A/M were freshly built for the preceding bounded bridge."""
from common import *
def main():
    ids=read(HERE/'sources/identities.json')['files'];br=read(HERE/'bridge_check/manifest.json')
    for v in VERSIONS:assert all(sha(STORE/v/p)==h for p,h in ids[v].items()),v
    assert not (STORE/'R/qjs').exists()
    r=capture('R_clean_release',['make','-j2','qjs','qjsc'],STORE/'R');assert not r['exit_code'];capture('R_ldd',['ldd',STORE/'R/qjs'])
    artifacts={v:dict(path=str(STORE/v/'qjs'),source=str(STORE/v),sha256=sha(STORE/v/'qjs'),size=(STORE/v/'qjs').stat().st_size,qjsc_sha256=sha(STORE/v/'qjsc')) for v in VERSIONS}
    for v in ['A','M']:assert artifacts[v]['sha256']==br['artifacts'][v]['sha256']
    inputs={p.relative_to(ROOT).as_posix():sha(p) for p in [HERE/'inputs/adapter.js',HERE/'inputs/driver.js',HERE/'design.md',HERE/'patches/A_to_M.patch',HERE/'patches/M_to_R.patch']}
    old=read(PREVIOUS/'manifest.json')['inputs'];lf=read(PREVIOUS/'recovery/workload_line_endings.json')
    for name,h in old.items():
        if name.startswith('benchmarks/octane/upstream/'):
            p=ROOT/name;assert sha(p)==h or digest(p.read_bytes().replace(b'\r\n',b'\n'))==lf[name]['LF_normalized_sha256'];inputs[name]=sha(p)
    save(HERE/'manifest.json',dict(campaign=HERE.relative_to(ROOT/'experiments').as_posix(),cohort='wsl2-'+platform.node()+'-x86_64',mode=MODE,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),base=read(HERE/'sources/identities.json')['base'],compiler=br['compiler'],build_command=['make','-j2','qjs','qjsc'],optimization='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,formal_instrumentation=False,flags=[],artifacts=artifacts,inputs=inputs,
      K=32,R_counter='uint8_t per site; padding included in measured size',mode_switch=False,mode_variable_present=False,
      source_identity_sha256={v:digest(json.dumps(ids[v],sort_keys=True).encode()) for v in VERSIONS},power=None,frequency=None,background='uncontrolled WSL host; snapshots retained'))
    print('AMR_RELEASE_BUILD_PASS',flush=True)
if __name__=='__main__':main()

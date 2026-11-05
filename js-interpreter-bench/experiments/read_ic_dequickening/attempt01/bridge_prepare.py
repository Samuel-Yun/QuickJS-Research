"""Exact archive restore, clean A/M/SW builds before the bounded bridge check."""
import shutil,tarfile
from common import *
def extract(path,dest):
    with tarfile.open(path) as t:
        for p in t.getmembers():assert not p.issym() and not p.islnk() and (dest/p.name).resolve().is_relative_to(dest.resolve())
        t.extractall(dest)
def main():
    assert not STORE.exists();STORE.mkdir(parents=True)
    archive=ABLATION/'recovery/baseline_M.tar.gz';assert sha(archive)==read(ABLATION/'recovery/baseline_M.json')['sha256']
    base=BASE_MATERIALS/'recovery/sources/base.tar.gz'
    extract(base,STORE/'A');extract(archive,STORE/'M');shutil.copytree(STORE/'M',STORE/'SW')
    r=capture('restore_exact_SW',['patch','-p1','-i',ABLATION/'patches/M_to_SW.patch'],STORE/'SW');assert not r['exit_code']
    ids=read(ABLATION/'sources/identities.json')['files']
    for v in ['A','M','SW']:assert all(sha(STORE/v/p)==h for p,h in ids[v].items()),v
    save(HERE/'bridge_check/source_identity.json',dict(status='PASS',files=ids,archive_sha256=sha(archive),upstream_archive_sha256=sha(base),old_source_bytes_exact=True))
    compiler=capture('compiler',['gcc','--version']);assert '13.3.0' in compiler['stdout'];environment('build_before_bridge')
    artifacts={}
    for v in ['A','M','SW']:
        e=clean_env()
        if v=='SW':e['QJS_READ_IC_MODE']='1'
        r=capture('bridge_'+v+'_clean_build',['make','-j2','qjs','qjsc'],STORE/v,env=e);assert not r['exit_code']
        capture('bridge_'+v+'_ldd',['ldd',STORE/v/'qjs'])
        artifacts[v]=dict(path=str(STORE/v/'qjs'),source=str(STORE/v),sha256=sha(STORE/v/'qjs'),qjsc_sha256=sha(STORE/v/'qjsc'),size=(STORE/v/'qjs').stat().st_size)
    save(HERE/'bridge_check/manifest.json',dict(artifacts=artifacts,compiler=compiler['stdout'].splitlines()[0],command=['make','-j2','qjs','qjsc'],optimization='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,created_at=stamp(),host=platform.node(),kernel=platform.release(),architecture=platform.machine()))
    print('BRIDGE_CLEAN_BUILDS_PASS',flush=True)
if __name__=='__main__':main()

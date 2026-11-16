"""Publish build04 only after actual ELF/hash/smoke; no rebuild of A/M/d8."""
from common import *
import build

def main():
    pin();out=HERE/'builds/build04';assert not out.exists()
    os.environ['SP_CAPTURE_START_DIR']=str(out/'child_starts')
    m=read(HERE/'builds/build03/M_light.verified.json');c=read(HERE/'last_recovery/C.verified.json')
    ids={'M_light':m,'C':c}
    for name,art in ids.items():
        assert Path(art['path']).stat().st_size==art['size'] and sha(art['path'])==art['sha256']
        assert Path(art['path']).open('rb').read(4)==b'\x7fELF'
        r=capture([art['path'],'-e','console.log(123)'],name+' publish-time smoke',env=dict(os.environ,SP_DISABLE='0'),timeout=10)
        save(out/(name+'.smoke.json'),r);assert r['exit_code']==0 and r['stdout']=='123\n' and not r['stderr']
    dst=STORE/'build04/C_light';build.copy_source(Path(m['source']),dst);build.add_control(dst,light=True)
    save(out/'C_light.source.json',dict(path=str(dst),source_sha256={p.name:sha(p) for p in dst.iterdir() if p.suffix in ['.c','.h','.inc']}))
    r=capture(['make','-j1','qjs','qjsc'],'C lightweight diagnostic build',cwd=dst,timeout=90);save(out/'C_light.build.json',r)
    assert r['exit_code']==0,r['stderr'][-3000:]
    exe=dst/'qjs';assert exe.open('rb').read(4)==b'\x7fELF'
    with exe.open('rb') as f:os.fsync(f.fileno())
    smoke=capture([exe,'-e','console.log(123)'],'C_light smoke',env=dict(os.environ,SP_DISABLE='0'),timeout=10);save(out/'C_light.smoke.json',smoke)
    assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr']
    ids['C_light']=dict(path=str(exe),sha256=sha(exe),size=exe.stat().st_size,source=str(dst),formal=False,purpose='diagnostic only')
    for art in ids.values():art['source_sha256']={p.name:sha(p) for p in Path(art['source']).iterdir() if p.suffix in ['.c','.h','.inc']}
    save(out/'manifest.json',ids);print('ALL_THREE_DERIVATIVES_VERIFIED',flush=True)

if __name__=='__main__':main()

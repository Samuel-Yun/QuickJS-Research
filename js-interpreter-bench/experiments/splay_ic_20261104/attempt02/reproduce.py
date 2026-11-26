"""Bounded minimal reproduction, NOT executed automatically after final stop.
Each label is new, so failures and wx diagnostic outputs are never overwritten.
"""
from common import *
import argparse

def main():
    p=argparse.ArgumentParser();p.add_argument('label');p.add_argument('--off',action='store_true');a=p.parse_args()
    assert re.fullmatch(r'[A-Za-z0-9_-]+',a.label)
    out=HERE/'reproductions'/a.label;assert not out.exists()
    pin();os.environ['SP_CAPTURE_START_DIR']=str(out/'children')
    art=read(HERE/'builds/build04/manifest.json')['C_light']
    script=HERE/'mechanism/diagnostic_scripts/Splay.Splay/N1.js'
    actual=dict(path=art['path'],size=Path(art['path']).stat().st_size,sha256=sha(art['path']),
        ELF=Path(art['path']).open('rb').read(4)==b'\x7fELF',script_sha256=sha(script))
    save(out/'actual_artifact.json',actual)
    assert actual['sha256']==art['sha256'] and actual['ELF'] and actual['size']==art['size']
    assert actual['script_sha256']=='cb1b90aee2fdcee348d3b272a9c1a7ced3d2c730e5cf57dc34ceaa24a78b6f7a'
    report=STORE/'reproductions'/a.label/'counters.json';assert not report.exists();report.parent.mkdir(parents=True)
    r=capture([art['path'],script],'minimal C_ON diagnostic reproduction',
       env=dict(os.environ,SP_DISABLE='1' if a.off else '0',IC_MECHANISM_REPORT=str(report)),timeout=15)
    save(out/'process.json',r)
    if report.exists():save(out/'counters.json',report.read_bytes())
    print(json.dumps(dict(exit_code=r['exit_code'],signal=r['signal'],timeout=r['timeout'],boot=r['boot_id'],peak_rss_kib=r['single_child_peak_rss_kib'])),flush=True)
    assert r['exit_code']==0 and not r['stderr'] and r['boot_id']==r['boot_id_after']

if __name__=='__main__':main()

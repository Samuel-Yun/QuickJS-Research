"""Four bounded Splay validation processes, not the old 17-case queue."""
from common import *
import gzip

def main():
    pin(); assert read(HERE/'preflight/check02/gate.json')['status']=='PASS'
    manifest=read(OLD/'diagnostic_v3_manifest.json')
    for n in [1,2]:
        for label in ['A','M']:
            art=manifest[label];assert sha(art['path'])==art['sha256']
            script=OLD/'diagnostic/scripts'/f'Splay.Splay.N{n}.js'
            name=f'Splay.{label}.N{n}'
            report=STORE/'recovery_reports'/(name+'.json');report.parent.mkdir(parents=True,exist_ok=True)
            assert not report.exists()
            r=capture([art['path'],script],name,env=dict(os.environ,IC_MECHANISM_REPORT=str(report)),timeout=35)
            r.update(script_sha256=sha(script),binary_sha256=art['sha256'],performance_sample=False,repetitions=n)
            save(HERE/'splay_recovery'/(name+'.process.json'),r)
            assert r['exit_code']==0 and not r['stderr'] and r['boot_id']==r['boot_id_after'],name
            data=report.read_bytes();d=json.loads(data)
            target=[f for f in d['functions'] if bytes.fromhex(f['source_hex']).find(b'dummy = left = right')>=0]
            assert len(target)==1
            assert hashlib.sha256(bytes.fromhex(target[0]['source_hex'])).hexdigest()=='138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43'
            save(HERE/'splay_recovery'/(name+'.json.gz'),gzip.compress(data,mtime=0))
            print('SPLAY_RECOVERY',name,r['external_wall_ms'],r['single_child_peak_rss_kib'],flush=True)
    save(HERE/'splay_recovery/gate.json',dict(status='PASS',processes=4,scope='Splay repetitions 1 and 2 only; no long diagnostic queue',performance_inference=False))

if __name__=='__main__':main()

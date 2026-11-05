from common import *
import sys

def main():
    pin()
    out=HERE/'preflight'/(sys.argv[1] if len(sys.argv)>1 else 'check01')
    assert not out.exists(), 'preserve prior attempt; use a new check label'
    processes=capture(['ps','-eo','pid,ppid,etime,comm,args'],'inventory; never terminate unrelated processes')
    save(out/'processes.json',processes)
    # Explicitly search for legacy executable/worker invocations, excluding ourselves,
    # ps itself and this host's wsl client. No blanket process termination.
    suspicious=[]
    for line in processes['stdout'].splitlines()[1:]:
        if re.search(r'(?:python\S* .*attempt01/(?:worker|controlled|campaign|diagnose)\.py|/home/mzyx/splay_ic_20261104_attempt01/\S+/qjs(?:\s|$))',line): suspicious.append(line)
    assert not suspicious, 'known legacy experiment process overlap: '+str(suspicious)
    env=dict(timestamp=stamp(),boot_id=boot(),uname=platform.uname()._asdict(),
             os_release=Path('/etc/os-release').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),
             meminfo=Path('/proc/meminfo').read_text(),affinity=sorted(os.sched_getaffinity(0)),
             disk={p:shutil.disk_usage(p)._asdict() for p in ['/','/mnt/c','/mnt/f'] if Path(p).exists()},
             load=os.getloadavg(),temperature='UNKNOWN',frequency_control='UNKNOWN',power_policy='UNKNOWN',
             background_load_control='UNKNOWN',legacy_experiment_processes=suspicious)
    for name,args in [('kernel_errors',['dmesg','--level=err,warn']),('toolchain',['gcc','--version'])]:
        env[name]=capture(args,name,timeout=10)
    save(out/'environment.json',env)
    arts={name:dict(x) for name,x in runtime()['artifacts'].items() if name in ['A','M','V8_ON']}
    arts.update({name+'_diagnostic_v3':dict(x) for name,x in read(OLD/'diagnostic_v3_manifest.json').items()})
    arts['A_diag5_known_invalid']=dict(path='/home/mzyx/splay_ic_20261104_attempt01/A_diag5/qjs',sha256=None)
    rows={}
    for name,info in arts.items():
        path=Path(info['path']);r=dict(path=str(path),expected_sha256=info.get('sha256'),exists=path.exists())
        if path.exists():
            with path.open('rb') as f:magic=f.read(4)
            r.update(size=path.stat().st_size,magic_hex=magic.hex(),ELF=magic==b'\x7fELF',sha256=sha(path))
            r['identity_matches']=r['sha256']==r['expected_sha256'] if r['expected_sha256'] else None
            if r['ELF'] and (r['identity_matches'] or name=='A_diag5_known_invalid'):
                flags=['--jitless','--no-lazy','--use-ic'] if name=='V8_ON' else []
                smoke=capture([path,*flags,'-e','console.log(123)'],name+' bounded smoke',timeout=15)
                r['smoke']=smoke;r['smoke_valid']=smoke['exit_code']==0 and smoke['stdout']=='123\n'
        rows[name]=r
        print('ARTIFACT',name,r.get('size'),r.get('identity_matches'),r.get('smoke_valid'),flush=True)
    deps=[]
    for d in runtime()['dependencies']:
        deps.append({**d,'actual_sha256':sha(d['path']),'matches':sha(d['path'])==d['sha256']})
    save(out/'artifacts.json',dict(artifacts=rows,dependencies=deps))
    assert all(rows[c].get('identity_matches') and rows[c].get('smoke_valid') for c in ['A','M','V8_ON'])
    assert all(d['matches'] for d in deps)
    save(out/'gate.json',dict(status='PASS',boot_id=boot(),frozen_artifacts_verified=True,
       diagnostic_valid={c:rows[c].get('identity_matches',False) and rows[c].get('smoke_valid',False) for c in rows if 'diagnostic_v3' in c},
       operational_reliability='NOT_ESTABLISHED_BY_SMOKE_ALONE'))
    print('PREFLIGHT_PASS',boot(),flush=True)

if __name__=='__main__':main()

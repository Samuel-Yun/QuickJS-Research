"""Final public artifact revalidation after serial campaigns, never timed."""
from common import *
def main():
    audit=read(HERE/'independent_audit_v2.json');assert all(v['status']=='PASS' for v in audit.values())
    m=runtime();u=read(HERE/'U_runtime.json')['U'];validate_artifacts([*m['artifacts'].values(),*m['dependencies'],u])
    for c in ['A','M']:
        for f,h in m['sources'][c]['files'].items():assert sha(Path(m['sources'][c]['path'])/f)==h
    for f,h in u['source_hashes'].items():assert sha(Path(u['source'])/f)==h
    symbols=subprocess.check_output(['nm',u['path']],text=True)
    assert not any(name in symbols for name in ['fs_adopt','fs_scope','fs_register','rdi_diag_query'])
    records=[]
    for c,a in (m['artifacts']|{'U':u}).items():
        r=capture(['ldd',a['path']],c+' final dependencies');save(HERE/'raw/final'/(c+'_ldd.json'),r)
        libs=[]
        for line in r['stdout'].splitlines():
            match=re.search(r'(/[^\s]+)',line)
            if match:
                p=Path(match[1]);libs.append(dict(path=str(p),sha256=sha(p),size_bytes=p.stat().st_size))
        records.append(dict(condition=c,ELF_sha256=sha(a['path']),dynamic_libraries=libs))
    save(HERE/'post_identity.json',dict(status='PASS',timestamp=stamp(),boot_id=boot(),artifacts=records,
      old_sources_unchanged=True,U_sources_unchanged=True,formal_U_has_no_controller_or_counter_symbols=True,
      dependency_observation='ldd/SHA256 at final; dependencies named here were not all prehashed in initial runtime.json; no claim of continuous library monitoring'))
    save(HERE/'completion.json',dict(status='COMPLETE_PUBLIC_EXPERIMENT',actual=sum(v['actual'] for v in audit.values()),
      valid=sum(v['valid'] for v in audit.values()),target=6060,independent_audit=True,correctness_U=True,
      private_reference_postcheck=read(HERE/'privacy_gate.json')['status'],timestamp=stamp(),boot_id=boot()))
    save(HERE/'STOP_WORKER','Completed public serial campaigns and local-only privacy postcheck.\n')
    print('PUBLIC_EXPERIMENT_COMPLETE',sum(v['valid'] for v in audit.values()),flush=True)
if __name__=='__main__':main()

"""Read-only closing verification after the mandatory performance stop."""
from common import *
if __name__=='__main__':
    a=artifacts();m=read(HERE/'manifest.json');src=Path(m['switch']['source'])
    for name,digest in m['source_files'].items():assert sha(src/name)==digest,name
    dg=read(HERE/'diagnostic_manifest.json');assert sha(dg['path'])==dg['sha256']
    for name,digest in dg['source_files'].items():assert sha(Path(dg['source'])/name)==digest,name
    raw=Path(STORE/'ON.hot.bytecode').read_bytes();assert hashlib.sha256(raw).hexdigest()==read(HERE/'gates/serialization.json')['bytecode_sha256']
    save(HERE/'raw/hot_archive_identity.json',dict(path='raw/ON.hot.bytecode.gz',compressed_sha256=sha(HERE/'raw/ON.hot.bytecode.gz'),raw_sha256=hashlib.sha256(raw).hexdigest(),raw_bytes=len(raw)))
    save(HERE/'identity_closing.json',dict(status='PASS',timestamp=stamp(),boot_id=boot(),artifacts=a,
      frozen_M_H_unchanged=True,switch_ELF_and_source_unchanged=True,diagnostic_ELF_and_source_unchanged=True,ON_OFF_same_ELF=True,
      performance_status=read(HERE/'performance_stop.json')['status'],formal_processes=0,more_sampling_permitted=False))
    print('IDENTITY_CLOSING_PASS',flush=True)

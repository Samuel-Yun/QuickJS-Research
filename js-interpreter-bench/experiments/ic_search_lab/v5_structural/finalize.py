"""Non-performance identity gate and restoration of the owned active baseline."""
import hashlib
from pathlib import Path
import struct
import run
import diagnose

H=run.H


def section_hash(path, wanted):
    data=Path(path).read_bytes()
    assert data[:6]==b'\x7fELF\x02\x01'
    start=struct.unpack_from('<Q',data,40)[0]
    size,count,names=struct.unpack_from('<HHH',data,58)
    headers=[struct.unpack_from('<IIQQQQIIQQ',data,start+i*size) for i in range(count)]
    strings=data[headers[names][4]:headers[names][4]+headers[names][5]]
    for header in headers:
        if strings[header[0]:].split(b'\0',1)[0].decode()==wanted:
            return hashlib.sha256(data[header[4]:header[4]+header[5]]).hexdigest()
    raise KeyError(wanted)


run.gate()
verified=[]
for path in sorted((H/'identities').glob('*.json')):
    art=run.lab.load(path)
    assert run.lab.sha(art['path'])==art['sha256']
    data=Path(art['path']).read_bytes()
    assert b'FUSION_COUNTS:' not in data and b'MECHANISM_PASS' not in data
    verified.append(dict(id=path.stem,sha256=art['sha256'],size=len(data),path=art['path'],formal_counter_strings_absent=True))
for kind in ['octane','sunspider']:
    run.measure.verify(run.measure.inputs(kind),['A','s001','mx019','d03','d04','d05'])
run.lab.save(H/'final_identity_audit.json',dict(status='PASS',artifacts=verified,boot_id=run.lab.boot(),frozen_inputs='PASS'))
files=run.designs.seed_module.seed('s001')
diagnose.restore_active(files)
active=H/'active'
for name in ['quickjs','qjs','qjsc']:
    p=active/'.obj'/(name+'.o')
    if p.exists():p.unlink()
build=run.capture(['make','-j1','qjs','qjsc'],'narrow_restore_build','s001',300,
                  dict(source_sha256=run.lab.load(H/'active_inventory.json')),active)
assert build['exit_code']==0,build['stderr']
frozen=run.measure.artifact('s001')
same_text=section_hash(active/'qjs','.text')==section_hash(frozen['path'],'.text')
smoke=run.capture([active/'qjs','-e','print(123456)'],'narrow_restore_smoke','s001',30)
assert smoke['exit_code']==0 and smoke['stdout']=='123456\n' and not smoke['stderr']
run.write_json('active_status.json',dict(source_candidate='s001',source_sha256=run.lab.load(H/'active_inventory.json'),
    rebuilt_sha256=run.lab.sha(active/'qjs'),frozen_s001_sha256=frozen['sha256'],same_native_text=same_text,
    active_qjs_not_rebuilt=False,performance_sample=False,
    interpretation='Owned working tree restored to s001; frozen campaign artifacts are identified independently'))
assert same_text,'Restored source has different native text, retained for review'
print('FINAL_IDENTITIES_AND_ACTIVE_S001_PASS',flush=True)

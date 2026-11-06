"""Read the formal interpreter dispatch-table entries, without running the ELF."""
import json
import re
import struct
import run


def file_offset(data, address):
    offset=struct.unpack_from('<Q',data,32)[0]
    size,count=struct.unpack_from('<HH',data,54)
    for i in range(count):
        kind,flags,start,virtual,physical,file_size,memory_size,align=struct.unpack_from('<IIQQQQQQ',data,offset+i*size)
        if kind==1 and virtual<=address<virtual+file_size:
            return start+address-virtual
    raise ValueError('unmapped virtual address')


def inspect(cid, opcodes):
    artifact=run.measure.artifact(cid)
    assert run.lab.sha(artifact['path'])==artifact['sha256']
    r=run.capture(['nm','-S','--defined-only',artifact['path']],'native_symbols',cid,30)
    candidates=[]
    for line in r['stdout'].splitlines():
        parts=line.split()
        if len(parts)==4 and 'dispatch_table' in parts[3] and int(parts[1],16)==256*8:
            candidates.append(parts)
    assert len(candidates)==1,candidates
    table=int(candidates[0][0],16)
    data=__import__('pathlib').Path(artifact['path']).read_bytes()
    assert data[:6]==b'\x7fELF\x02\x01'
    result=[]
    for name,opcode in opcodes.items():
        address=struct.unpack_from('<Q',data,file_offset(data,table+opcode*8))[0]
        # GNU ld writes the addend in these PIE .data.rel.ro entries; require a mapped target.
        file_offset(data,address)
        dump=run.capture(['objdump','-d','--start-address='+hex(address),'--stop-address='+hex(address+192),artifact['path']],
             'native_entry',cid+'/'+name,30,dict(binary_sha256=artifact['sha256'],opcode=opcode,
             dispatch_table_address=table,handler_entry=address,scope='First192 bytes from entry, may include neighboring blocks'))
        result.append(dict(opcode_name=name,opcode=opcode,entry=hex(address),disassembly=dump['stdout']))
    run.lab.save(run.H/('native.'+cid+'.json'),dict(binary_sha256=artifact['sha256'],table_symbol=candidates[0],
        entries=result,observed_execution_path='UNKNOWN from static disassembly alone'))


if __name__=='__main__':
    probe=run.lab.load(run.H/'probe.d03.json')['stdout']
    match=re.search(r'OPCODES get_arg0=(\d+) get_loc0=(\d+)',probe)
    assert match
    ops=dict(get_arg0=int(match[1]),get_loc0=int(match[2]))
    inspect('s001',ops)
    inspect('d03',ops)

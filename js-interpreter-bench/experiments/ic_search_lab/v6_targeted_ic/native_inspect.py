"""Read matching frozen ELF/DWARF. Static windows do not prove dynamic paths."""
import re
import struct
from pathlib import Path
import experiment as e


def offset(data,address):
    pos=struct.unpack_from('<Q',data,32)[0];size,count=struct.unpack_from('<HH',data,54)
    for i in range(count):
        kind,flags,start,virtual,physical,filesz,memsz,align=struct.unpack_from('<IIQQQQQQ',data,pos+i*size)
        if kind==1 and virtual<=address<virtual+filesz:return start+address-virtual
    raise ValueError(address)


def run():
    rows=[]
    for cid in ['A','s001','d03','d05','B2','ID_CTRL','ID_READ','W1','P1','L1','K1','C1']:
        a=e.measure.artifact(cid);assert e.lab.sha(a['path'])==a['sha256']
        expressions=['sizeof(JSValue)','sizeof(JSShape)','sizeof(JSFunctionBytecode)','sizeof(JSRuntime)']
        if cid!='A':expressions+=['sizeof(ReadICSite)']
        expressions+=['(int)OP_add','(int)OP_shl']
        command=['gdb','-nx','-batch','-ex','set auto-load off','-ex','file '+a['path']]
        for expression in expressions:command+=['-ex','p/d '+expression]
        r=e.capture(command,'native_inspection',cid+'/types',30,dict(binary_sha256=a['sha256']))
        assert r['exit_code']==0,r['stderr']
        numbers=re.findall(r'\$\d+ = (\d+)',r['stdout']);assert len(numbers)==len(expressions),r['stdout']
        sizes=dict(zip(expressions,map(int,numbers)))
        symbols=e.capture(['nm','-S','--defined-only',a['path']],'native_inspection',cid+'/symbols',30)
        parsed=[line.split() for line in symbols['stdout'].splitlines()]
        tables=[p for p in parsed if len(p)==4 and 'dispatch_table' in p[3] and int(p[1],16)==2048]
        assert len(tables)==1
        table=int(tables[0][0],16);data=Path(a['path']).read_bytes()
        ops=dict(get_arg0=207,get_loc0=195,get_field_rdi=244,add=sizes['(int)OP_add'],shl=sizes['(int)OP_shl'])
        if cid=='A':ops.pop('get_field_rdi')
        windows=[]
        for name,op in ops.items():
            address=struct.unpack_from('<Q',data,offset(data,table+op*8))[0]
            offset(data,address)
            d=e.capture(['objdump','-d','--start-address='+hex(address),'--stop-address='+hex(address+384),a['path']],
                        'native_inspection',cid+'/'+name,30,dict(binary_sha256=a['sha256'],entry=address,opcode=op))
            windows.append(dict(name=name,opcode=op,address=hex(address),disassembly=d['stdout']))
        update=[p for p in parsed if len(p)==4 and p[3].startswith('rdi_update')]
        entry=[p for p in parsed if len(p)==4 and p[3]=='JS_CallInternal']
        result=dict(id=cid,binary_sha256=a['sha256'],sizes=sizes,dispatch_table=tables[0],
                    interpreter_symbol=entry,update_symbols=update,windows=windows,
                    dynamic_hit_path='UNKNOWN from disassembly alone',window_limit='384 bytes may include neighboring handlers')
        e.save('diagnostics/native.'+cid+'.json',result);rows.append(dict(id=cid,**sizes))
        print('NATIVE_LAYOUT',cid,sizes,flush=True)
    e.csvout('native_layout.csv',rows)


if __name__=='__main__':run()

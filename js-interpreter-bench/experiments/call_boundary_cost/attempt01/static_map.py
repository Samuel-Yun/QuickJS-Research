"""Post-validation only: exact ELF, DWARF and mutually exclusive instruction map.
Initial candidates require later manual CFG review; never classify by symbol alone.
"""
import bisect,struct
from common import *
CATEGORIES=['CALL_ENTRY','CALLER_CALL','CALLEE_EXIT','PROPERTY','LOOP_VALUE','HELPER_OTHER','SHIM_UNKNOWN']
def elf_segments(path):
    with Path(path).open('rb') as f:
        header=f.read(64);assert header[:6]==b'\x7fELF\x02\x01';phoff=struct.unpack_from('<Q',header,32)[0];size,num=struct.unpack_from('<HH',header,54);segments=[]
        for i in range(num):
            f.seek(phoff+i*size);typ,flags,offset,vaddr,paddr,filesz,memsz,align=struct.unpack('<IIQQQQQQ',f.read(56))
            if typ==1:segments.append(dict(offset=offset,vaddr=vaddr,filesz=filesz,memsz=memsz,flags=flags,align=align))
        return dict(type=struct.unpack_from('<H',header,16)[0],segments=segments)
def parse_instructions(text):
    result=[]
    for line in text.splitlines():
        # A wrapped machine-byte continuation has no instruction tab field.
        fields=line.split('\t');m=re.match(r'\s*([0-9a-f]+):$',fields[0])
        if m and len(fields)>=3 and fields[2].strip():result.append(dict(pc=int(m[1],16),instruction=fields[2].strip()))
    return result
def parse_lines(text):
    out={};address=None;parts=[]
    for line in text.splitlines():
        if re.fullmatch(r'0x[0-9a-f]+',line):
            if address is not None:out[address]=parts
            address=int(line,16);parts=[]
        else:parts.append(line)
    if address is not None:out[address]=parts
    return out
def main():
    assert (HERE/'validation_p7000_done.json').exists(),'no symbolization parallel to validation'
    assert not any(p.name.endswith('_clock.json') and not (HERE/p.name.replace('_clock','_done')).exists() for p in HERE.glob('validation_p*_clock.json'))
    m=verify();binary=m['artifacts']['SHIM_ON']['path'];base=m['artifacts']['BASE']['path']
    save(HERE/'mapping/elf_segments.json',dict(SHIM_ON=elf_segments(binary),BASE=elf_segments(base)))
    r=capture('shim_symbols',['nm','-n','-S','--defined-only',binary]);assert r['exit_code']==0
    symbols=[]
    for line in r['stdout'].splitlines():
        p=line.split()
        if len(p)>=4 and p[2] in ['t','T']:symbols.append(dict(start=int(p[0],16),end=int(p[0],16)+int(p[1],16),symbol=p[3]))
    csvout(HERE/'mapping/symbols.csv',symbols)
    asm=read(HERE/'raw/commands/shim_call_disasm.json')['stdout'];ins=parse_instructions(asm);assert len(ins)>100
    pcs=''.join(hex(i['pc'])+'\n' for i in ins);r=capture('call_dwarf',['addr2line','-a','-f','-i','-e',binary],input=pcs);assert r['exit_code']==0
    data=r['stdout'].encode();save(HERE/'mapping/call_dwarf.txt.gz',gzip.compress(data,mtime=0));dwarf=parse_lines(r['stdout']);assert len(dwarf)==len(ins)
    quick=Path(m['A_source'])/'quickjs.c';source=quick.read_text().splitlines();assert sha(quick)==m['A_source_files']['quickjs.c']
    # Determine handler source ranges from this exact revision, not stale numbers.
    anchors={}
    for i,line in enumerate(source):
        mm=re.match(r'\s*CASE\((OP_\w+)\)',line)
        if mm:anchors.setdefault(mm[1],[]).append(i+1)
    begin=17746;end=20711;cases=sorted((line,op) for op,ll in anchors.items() for line in ll if begin<line<end)
    def case_at(line):
        before=[(n,op) for n,op in cases if n<=line];return before[-1][1] if before else None
    rows=[]
    for i,op in enumerate(ins):
        frames=dwarf[op['pc']];locations=[]
        for f in frames:
            mm=re.search(r'(?:^|/)(quickjs\.c|quickjs\.h):(\d+)',f)
            if mm:locations.append((mm[1],int(mm[2])))
        qlines=[n for file,n in locations if file=='quickjs.c'];ln=qlines[-1] if qlines else None;category='SHIM_UNKNOWN';reason='unresolved or shared source attribution';handler=None
        if ln:
            handler=case_at(ln)
            if 17746<=ln<=17876:category='CALL_ENTRY';reason='entry/frame region, candidate pending CFG review'
            elif 18175<=ln<=18239:category='CALLER_CALL';reason='plain/method call dispatch and return handling, candidate pending CFG review'
            elif 20699<=ln<=20710 or handler in ['OP_return','OP_return_undef']:category='CALLEE_EXIT';reason='return/done cleanup, candidate pending CFG review'
            elif 19107<=ln<=19196 or 6135<=ln<=6184 or handler in ['OP_get_field','OP_get_field2','OP_get_length','OP_get_array_el','OP_put_field']:category='PROPERTY';reason='property handler/inline source plus opcode context, candidate pending CFG review'
            elif handler and (any(k in handler for k in ['get_loc','put_loc','get_arg','push_','inc_loc','add_loc','goto','if_','lt','add','strict_neq','nop']) or (20000<=ln<=20500)):
                category='LOOP_VALUE';reason='value/arithmetic/control/dispatch candidate, pending CFG review'
        rows.append(dict(start=hex(op['pc']),end=hex(ins[i+1]['pc'] if i+1<len(ins) else op['pc']+1),category=category,instruction=op['instruction'],source_line=ln,source_opcode=handler,inline_chain=json.dumps(frames),basis=reason))
    csvout(HERE/'mapping/candidates.csv',rows)
    save(HERE/'mapping/identity.json',dict(binary_sha256=m['artifacts']['SHIM_ON']['sha256'],source_sha256=sha(quick),source_commit=m['A_source_commit'],dwarf_sha256=sha(HERE/'mapping/call_dwarf.txt.gz'),disasm_raw_sha256=sha(HERE/'raw/commands/shim_call_disasm.json'),status='CANDIDATES_ONLY_REQUIRES_REVIEW',no_frame_pointer_added=True))
    # Existing GDB only, no installation; read-only breakpoints outside region.
    gdb=__import__('shutil').which('gdb');save(HERE/'mapping/gdb_availability.json',dict(path=gdb,install_attempted=False))
    print('MAPPING_CANDIDATES',len(rows),'gdb',gdb,flush=True)
if __name__=='__main__':main()

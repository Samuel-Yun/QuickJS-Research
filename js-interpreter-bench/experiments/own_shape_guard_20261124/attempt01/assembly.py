"""Read the real Release computed-goto table; no label/instrumentation rebuild."""
import json,struct,subprocess
from pathlib import Path
from build import HERE,LABELS,save,sha

def main():
 snaps=[json.loads(s) for s in (HERE/'micro_counts/object.fused.SPARSE.counts.0.snapshot.jsonl').read_text().splitlines()]
 op={o['name']:int(o['raw'][:2],16) for f in snaps for o in f['opcodes']}
 rows=[];out=HERE/'assembly';out.mkdir(exist_ok=True)
 for l in LABELS:
  m=json.loads((HERE/f'{l}.release.manifest.json').read_text());p=Path(m['binary']);data=p.read_bytes();assert data[:6]==b'\x7fELF\x02\x01'
  symbols=subprocess.check_output(['nm','-S',str(p)],text=True).splitlines();tables=[s.split() for s in symbols if ' dispatch_table.' in s and int(s.split()[1],16)==2048];assert len(tables)==1,tables
  table=int(tables[0][0],16);phoff=struct.unpack_from('<Q',data,32)[0];ents,num=struct.unpack_from('<HH',data,54)
  def offset(addr):
   for i in range(num):
    kind,flags,off,vma,_,filesz,_,_=struct.unpack_from('<IIQQQQQQ',data,phoff+i*ents)
    if kind==1 and vma<=addr<vma+filesz:return off+addr-vma
   raise AssertionError(hex(addr))
  for name in ['v6_get_arg0','get_field_rdi','get_field2_rdi']:
   index=op[name];address=struct.unpack_from('<Q',data,offset(table)+index*8)[0]
   text=subprocess.check_output(['objdump','-d','--no-show-raw-insn',f'--start-address={address}',f'--stop-address={address+280}',str(p)],text=True)
   (out/f'{l}.{name}.asm').write_text(text)
   rows.append(dict(label=l,opcode=name,index=index,dispatch_table=tables[0][-1],table_address=table,handler_address=address,binary_sha256=sha(p),extraction='ELF PT_LOAD -> actual 256-entry computed-goto table -> Release objdump'))
 save(HERE/'assembly.json',dict(status='PASS',rows=rows))
 print('ASSEMBLY_PASS',len(rows))
if __name__=='__main__':main()

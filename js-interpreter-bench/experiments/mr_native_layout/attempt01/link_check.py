"""Offline relocation-aware JS_CallInternal comparison, not digit-stripping asm."""
import re
from common import *
from explain import instructions
def code(c):
 _,ins=instructions(c);return {addr+i:b for addr,hex_,asm,line in ins for i,b in enumerate(bytes.fromhex(hex_))}
def main():
 result=[];details=[]
 for v in 'MR':
  base=v+'_base';data=code(base);syms=(HERE/'native/final'/base/'symbols.txt').read_text();fn=re.search(r'^([0-9a-f]+) ([0-9a-f]+) t JS_CallInternal$',syms,re.M);start,size=[int(s,16) for s in fn.groups()]
  map_=(HERE/'links'/(base+'.map')).read_text();object_start=int(re.search(r'^ \.text\s+(0x[0-9a-f]+)\s+0x[0-9a-f]+ \.obj/quickjs.o$',map_,re.M)[1],16)
  reloc=gzip.open(HERE/'native/final'/base/'quickjs_object_relocations.txt.gz','rt').read();chunk=reloc.split('RELOCATION RECORDS FOR [.text]:\n',1)[1].split('\n\n',1)[0];fields=[]
  for line in chunk.splitlines():
   m=re.match(r'([0-9a-f]+)\s+(R_X86_64_\w+)\s+(.+)',line)
   if not m:continue
   offset=int(m[1],16)+object_start-start;kind=m[2];width=4 if kind in ['R_X86_64_PC32','R_X86_64_PLT32','R_X86_64_REX_GOTPCRELX','R_X86_64_GOTPCRELX','R_X86_64_GOTPCREL'] else 8 if kind=='R_X86_64_64' else None
   if 0<=offset<size:fields.append(dict(offset=offset,width=width,kind=kind,expression=m[3]))
  assert all(f['width'] for f in fields)
  for pad in [0,16,32,48]:
   c=v+'_p'+f'{pad:03}';target=code(c);addr=start+pad
   actual=next(int(x.split()[0],16) for x in (HERE/'native/final'/c/'symbols.txt').read_text().splitlines() if x.endswith(' t JS_CallInternal'))
   assert actual==addr
   original=bytes(data[start+i] for i in range(size));new=bytes(target[actual+i] for i in range(size));changed={i for i in range(size) if original[i]!=new[i]}
   covered=set()
   for f in fields:
    off,width=f['offset'],f['width'];rr=set(range(off,off+width));cc=changed&rr
    if not cc:continue
    covered |= cc
    a,b=original[off:off+width],new[off:off+width]
    details.append(dict(condition=c,offset=hex(off),base_address=hex(start+off),new_address=hex(addr+off),relocation=f['kind'],original_expression=f['expression'],base_operand_hex=a.hex(),new_operand_hex=b.hex(),base_resolved_PC32_target=hex(start+off+4+int.from_bytes(a,'little',signed=True)) if width==4 else '',new_resolved_PC32_target=hex(addr+off+4+int.from_bytes(b,'little',signed=True)) if width==4 else ''))
   assert changed<=covered,(c,sorted(changed-covered)[:20])
   t0=read(HERE/'native/final'/base/'dispatch_table.json');tn=read(HERE/'native/final'/c/'dispatch_table.json');assert all(b['address']-a['address']==pad for a,b in zip(t0,tn))
   result.append(dict(condition=c,JS_CallInternal_bytes=size,changed_bytes=len(changed),covered_by_original_relocation_fields=len(covered),unexplained_changes=0,all_256_dispatch_entries_shift_by=pad,meaning='same compiled body; operand changes covered by exact original object relocation fields; not pure I-cache or measured native path'))
 csvout(HERE/'layout/relocation_comparison.csv',result);csvout(HERE/'layout/relocation_details.csv',details)
 save(HERE/'layout/relocation_gate.json',dict(status='PASS',checks=result,note='Uses original quickjs.o relocation offsets, retains numeric operands and targets. Other helper whole-body equivalence not asserted. No native dynamic branch trace.'))
 print('RELOCATION_AWARE_BODY_CHECK_PASS',len(result))
if __name__=='__main__':main()

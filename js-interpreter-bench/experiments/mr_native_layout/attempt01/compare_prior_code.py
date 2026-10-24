"""Compare actual opcode bytes/addresses with prior public full disassembly."""
import re
from common import *
from explain import instructions
def main():
 rows=[]
 for v in 'MR':
  old=OLD/'machinecode'/v/'JS_CallInternal.asm';prior=[]
  for line in old.read_text().splitlines():
   m=re.match(r'^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2}\s+)+)\s*(.*)$',line)
   if m:prior.append((int(m[1],16),bytes.fromhex(m[2])))
  _,new=instructions(v+'_base');now=[(a,bytes.fromhex(b)) for a,b,asm,line in new]
  rows.append(dict(variant=v,prior_disassembly=old.relative_to(ROOT).as_posix(),prior_file_sha256=sha(old),same_addresses_and_encoded_bytes=prior==now,prior_bytes=sum(len(b) for a,b in prior),current_bytes=sum(len(b) for a,b in now),claim='full JS_CallInternal only; no timing pooling, not whole ELF or dynamic path identity'))
 save(HERE/'native/prior_body_comparison.json',rows);print(json.dumps(rows,indent=2))
if __name__=='__main__':main()

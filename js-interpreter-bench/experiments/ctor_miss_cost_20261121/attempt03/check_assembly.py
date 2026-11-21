"""Confirm the Release hit path branches around an already-zero store."""
import re
import subprocess
from build import HERE,sha,save
import json

def main():
    m=json.loads((HERE/'TWICE.release.manifest.json').read_text())
    assert sha(m['elf'])==m['elf_sha256']
    command=['objdump','-d','-S','--disassemble=JS_CallInternal',m['elf']]
    lines=subprocess.check_output(command,text=True).splitlines()
    blocks=[]
    for i,line in enumerate(lines):
        if line.strip()!='if(s->identity_misses){s->identity_misses=0;}':continue
        block='\n'.join(lines[i:i+12])+'\n'
        if (re.search(r'cmpb\s+\$0x0,0x1e\(',block) and
            re.search(r'\bje\s+',block) and re.search(r'movb\s+\$0x0,0x1e\(',block)):
            blocks.append(block)
    assert blocks,'expected conditional counter store in native x86-64 Release'
    out=HERE/'assembly';out.mkdir(exist_ok=True)
    (out/'hit_reset.txt').write_text('\n'.join(blocks))
    save(out/'verification.json',dict(binary_sha256=m['elf_sha256'],command=command,
        field_offset=30,conditional_store=True,matching_blocks=len(blocks),
        explanation='cmpb zero; je skips the movb store when the byte is already zero'))
    print('ASSEMBLY_PASS',flush=True)
if __name__=='__main__':main()

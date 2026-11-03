"""Small actual public ELF windows; no full disassembly or private inputs."""
from common import *
def inspect(label,artifact):
    exe=artifact['path'];text=subprocess.check_output(['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe],text=True)
    lines=text.splitlines();keep=set()
    for i,l in enumerate(lines):
        if any(x in l for x in ['read_ic_opcodes.inc:','read_ic_runtime.inc:']):
            keep.update(range(max(0,i-3),min(len(lines),i+18)))
        if label=='A' and re.search(r'quickjs\.c:(191[0-8][0-9]|614[0-9]|615[0-6])\b',l):
            keep.update(range(max(0,i-2),min(len(lines),i+14)))
    excerpt=[];previous=-2
    for i in sorted(keep):
        if i!=previous+1:excerpt.append('\n... non-contiguous window ...\n')
        excerpt.append(lines[i]);previous=i
    assert excerpt
    save(HERE/'machinecode'/(label+'_read_paths.asm'),'\n'.join(excerpt)+'\n')
    r=capture(['size',exe],label+' size');save(HERE/'machinecode'/(label+'_size.json'),r)
    r=capture(['gdb','-q','-batch','-ex','p sizeof(JSProperty)','-ex','p sizeof(JSFunctionBytecode)',exe],label+' struct sizes')
    save(HERE/'machinecode'/(label+'_layouts.json'),r)
    return dict(condition=label,binary_sha256=sha(exe),excerpt_bytes=len('\n'.join(excerpt).encode()),
                full_function_asm_sha256=hashlib.sha256(text.encode()).hexdigest(),
                full_function_bytes_not_archived=True)
def main():
    m=runtime();artifacts=m['artifacts'].copy()
    if (HERE/'control_runtime.json').exists():artifacts['C']=read(HERE/'control_runtime.json')['C']
    rows=[inspect(c,artifacts[c]) for c in ['A','M','C'] if c in artifacts]
    save(HERE/'machinecode/identity.json',rows)
    print('NATIVE_WINDOWS_SAVED',flush=True)
if __name__=='__main__':main()

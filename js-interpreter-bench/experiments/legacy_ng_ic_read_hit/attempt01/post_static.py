"""Post-sampling source/code-byte identity audit; no performance measurement."""
import re,struct
from common import *
def instruction_bytes(binary,symbol):
    result=subprocess.run(['objdump','-d','--disassemble='+symbol,binary],capture_output=True,text=True,check=True)
    parts=[]
    for line in result.stdout.splitlines():
        match=re.match(r'^\s*[0-9a-f]+:\s*((?:[0-9a-f]{2}(?:\s+|$))+)',line)
        if match:parts.append(bytes.fromhex(match[1]))
    return b''.join(parts)
def main():
    verify_runtime();src={v:(STORE/v/'quickjs.c').read_bytes() for v in ['C','D']}
    assert src['D']==src['C'].replace(b'static JSValue JS_GetPropertyInternalWithIC(',b'static force_inline JSValue JS_GetPropertyInternalWithIC(',1)
    probe={v:instruction_bytes(str(STORE/v/'qjs'),'get_ic_prop_offset.isra.0') for v in ['C','D']}
    assert probe['C']==probe['D'] and len(probe['C'])==96
    # Name the source-level read and write bodies separately, not a whole interpreter diff.
    s=src['C'].decode();read_body=s[s.index('static JSValue JS_GetPropertyInternalWithIC('):s.index('static JSValue JS_ThrowTypeErrorPrivateNotFound')]
    write_body=s[s.index('static int JS_SetPropertyInternalWithIC('):s.index('static void rewrite_ic(')]
    save(HERE/'machinecode/read_wrapper_source.c',read_body)
    save(HERE/'machinecode/write_wrapper_source.c',write_body)
    clock=(STORE/'C/quickjs-libc.c').read_text().splitlines();ix=next(i for i,l in enumerate(clock) if 'CLOCK_MONOTONIC' in l)
    save(HERE/'machinecode/clock_source.txt','\n'.join(f'{j+1}: {clock[j]}' for j in range(max(0,ix-18),min(len(clock),ix+12)))+'\n')
    syms={};sections=[]
    for v in VERSIONS:
        result=subprocess.run(['objdump','-h',str(STORE/v/'qjs')],capture_output=True,text=True,check=True)
        save(HERE/'machinecode'/v/'ELF_sections.txt',result.stdout)
        text=next(l.split() for l in result.stdout.splitlines() if re.match(r'^\s*\d+\s+\.text\s',l))
        sections.append(dict(variant=v,ELF_text_section_bytes=int(text[2],16),ELF_text_VMA=text[3]))
        lines=read(HERE/'raw/build'/f'{v}_nm.1.json')['stdout'].splitlines()
        syms[v]={p[3]:(int(p[0],16),int(p[1],16)) for l in lines if len(p:=l.split())==4 and p[2] in ['t','T']}
    differences=[]
    for name in sorted(set(syms['C'])|set(syms['D'])):
        c,d=syms['C'].get(name),syms['D'].get(name)
        if c!=d:differences.append(dict(symbol=name,C_address=hex(c[0]) if c else None,D_address=hex(d[0]) if d else None,
          C_bytes=c[1] if c else 0,D_bytes=d[1] if d else 0,size_delta=(d[1] if d else 0)-(c[1] if c else 0)))
    csvout(HERE/'machinecode/symbol_layout_changes.csv',differences);csvout(HERE/'machinecode/ELF_text_sizes.csv',sections)
    save(HERE/'machinecode/post_static_audit.json',dict(status='PASS',formal_engine_change='one force_inline on read wrapper only',
      source_C_sha256=digest(src['C']),source_D_sha256=digest(src['D']),probe_machine_bytes_identical=True,probe_machine_bytes=96,
      probe_machine_bytes_sha256=digest(probe['C']),read_source_body_SHA256=digest(read_body.encode()),write_source_body_SHA256=digest(write_body.encode()),
      manual_review='machinecode/notes.md: tag/MISS/refcount/cur_pc/exception and receiver operations preserved in both read opcodes',
      native_dynamic_branch_counts=None,call_self_time=None))
    print('POST_STATIC_AUDIT_PASS',flush=True)
if __name__=='__main__':main()

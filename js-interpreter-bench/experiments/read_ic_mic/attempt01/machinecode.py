"""Formal code paths and actual compiler layouts, no timing run."""
import re,shutil
from common import *
def main():
    m=verify_runtime();identities={};sizes=[];layouts={}
    assert shutil.which('gdb'),'gdb needed for read-only DWARF layout check; no VM run'
    for v in VERSIONS:
        exe=m['artifacts'][v]['path'];source=STORE/v
        nm=capture(v+'_nm',['nm','-S','--defined-only',exe]);size=capture(v+'_size',['size',exe]);assert not nm['exit_code'] and not size['exit_code']
        p=size['stdout'].splitlines()[1].split();sizes.append(dict(variant=v,GNU_size_text=int(p[0]),data=int(p[1]),bss=int(p[2]),file_bytes=Path(exe).stat().st_size))
        cmd=['gdb','--batch','--nx','--nh','-ex','file '+exe,'-ex','p sizeof(JSFunctionBytecode)']
        if v!='A':cmd+=['-ex','p sizeof(ReadICSite)','-ex','p (long)&((JSFunctionBytecode*)0)->debug']
        r=capture(v+'_layout',cmd);assert not r['exit_code'];nums=[int(x) for x in re.findall(r'\$\d+ = (\d+)',r['stdout'])];layouts[v]=nums
        if v!='A':assert nums[1]==(16 if v=='M' else 56)
        syms=[]
        for l in nm['stdout'].splitlines():
            p=l.split()
            if len(p)==4 and any(k in p[3] for k in ['JS_CallInternal','rdi_probe','rdi_update','rdi_prepare','rdi_free']):syms.append(dict(address=p[0],bytes=int(p[1],16),symbol=p[3]))
        assert not any('rdi_probe' in s['symbol'] or 'rdi_update' in s['symbol'] for s in syms),'inline entry unexpectedly not realized'
        result=subprocess.run(['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe],capture_output=True,text=True,check=True)
        lines=result.stdout.splitlines();wanted=set()
        for i,l in enumerate(lines):
            if ('read_ic_opcodes.inc:' in l or 'read_ic_runtime.inc:' in l):wanted.update(range(max(0,i-3),min(len(lines),i+18)))
        snippets=[];last=-2
        for i in sorted(wanted):
            if i!=last+1:snippets.append('\n... disjoint excerpt ...\n')
            snippets.append(lines[i]);last=i
        if v!='A':save(HERE/'machinecode'/v/'read_paths.asm','\n'.join(snippets)+'\n')
        sections=subprocess.run(['objdump','-h',exe],capture_output=True,text=True,check=True).stdout
        line=next(l.split() for l in sections.splitlines() if re.match(r'^\s*\d+\s+\.text\s',l));sizes[-1]['ELF_text_bytes']=int(line[2],16)
        identities[v]=dict(binary_sha256=sha(exe),symbols=syms,asm_command=['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe])
    assert layouts['M'][0]-layouts['A'][0]==layouts['P'][0]-layouts['A'][0]==16
    csvout(HERE/'machinecode/sizes.csv',sizes);save(HERE/'machinecode/identities.json',identities);save(HERE/'machinecode/layouts.json',layouts)
    src={v:(STORE/v/'quickjs.c').read_text() for v in VERSIONS}
    def writebody(s):return s[s.index('        CASE(OP_put_field):'):s.index('        CASE(OP_private_symbol):')]
    assert writebody(src['A'])==writebody(src['M'])==writebody(src['P'])
    assert src['M']==src['P']
    save(HERE/'machinecode/gate.json',dict(status='EFFECTIVE_INTERVENTION',M_bytes=16,P_bytes=56,function_header_extra_bytes=16,
      shared_integration=True,probe_and_update_explicit_inline_both=True,write_source_upstream_identical=True,
      required_runtime_comparison_counts='correctness/mechanism_gate.json',native_branch_taken_sampled=None))
    print('MACHINECODE_GATE_PASS',flush=True)
if __name__=='__main__':main()

"""Actual optimized layouts and formal code, without diagnostic tracing/timing."""
import re
from common import *
def main():
    m=verify_runtime();layouts={};sizes=[];symbols={}
    for v in VERSIONS:
        exe=m['artifacts'][v]['path'];nm=capture(v+'_nm',['nm','-S','--defined-only',exe]);assert not nm['exit_code']
        assert not any(k in nm['stdout'] for k in ['rdi_diag_','read_ic_report','rdi_process_mode','rdi_mode_init','rdi_counted_find'])
        r=capture(v+'_size',['size',exe]);cols=r['stdout'].splitlines()[1].split();secs=subprocess.check_output(['objdump','-h',exe],text=True)
        section=next(l.split() for l in secs.splitlines() if re.match(r'^\s*\d+\s+\.text\s',l));sizes.append(dict(variant=v,GNU_size_text=int(cols[0]),ELF_text_bytes=int(section[2],16),file_bytes=Path(exe).stat().st_size))
        cmd=['gdb','--batch','--nx','--nh','-ex','file '+exe,'-ex','p sizeof(JSRuntime)','-ex','p sizeof(JSFunctionBytecode)']
        if v!='A':cmd+=['-ex','p sizeof(ReadICSite)','-ex','p (long)&((ReadICSite*)0)->atom']
        if v=='R':cmd+=['-ex','p (long)&((ReadICSite*)0)->miss_streak']
        r=capture(v+'_layout',cmd);assert not r['exit_code'];layouts[v]=[int(x) for x in re.findall(r'\$\d+ = (\d+)',r['stdout'])]
        syms=[]
        for line in nm['stdout'].splitlines():
            a=line.split()
            if len(a)==4 and any(k in a[3] for k in ['JS_CallInternal','rdi_exit','rdi_probe','rdi_update','rdi_prepare']):syms.append(dict(address=a[0],size=int(a[1],16),symbol=a[3]))
        symbols[v]=syms
        asm=subprocess.check_output(['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe],text=True)
        save(HERE/'machinecode'/v/'JS_CallInternal.asm',asm)
    assert layouts['M'][0]==layouts['R'][0]==layouts['A'][0] and layouts['M'][1]==layouts['R'][1]==layouts['A'][1]+16
    assert layouts['M'][2]==16 and layouts['R'][2]==24 and layouts['R'][-1]==16
    src={v:(STORE/v/'quickjs.c').read_text() for v in VERSIONS}
    body=lambda s:s[s.index('        CASE(OP_put_field):'):s.index('        CASE(OP_private_symbol):')]
    assert body(src['A'])==body(src['M'])==body(src['R']) and src['M']==src['R']
    csvout(HERE/'machinecode/sizes.csv',sizes);save(HERE/'machinecode/layouts.json',layouts);save(HERE/'machinecode/symbols.json',symbols)
    save(HERE/'machinecode/gate.json',dict(status='EFFECTIVE_INTERVENTION',M_site_bytes=16,R_site_bytes=24,R_streak_offset=16,
      runtime_size_unchanged=True,function_header_component_bytes=16,ordinary_handler_and_write_source_unchanged=True,no_SW_mode=True,formal_diagnostic_symbols=False,
      real_exit_evidence='correctness/exit_state_checks.csv, target_sites.json and private_state.json; static code alone not branch proof',ASLR=Path('/proc/sys/kernel/randomize_va_space').read_text().strip()))
    print('MACHINECODE_GATE_PASS',flush=True)
if __name__=='__main__':main()

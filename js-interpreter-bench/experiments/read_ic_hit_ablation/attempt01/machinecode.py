"""Read-only actual formal ELF/layout/ASLR and runtime-mode evidence."""
import re
from common import *
def main():
    m=verify_runtime();rows=[];layouts={}
    for v in ['A','M','ON']:
        exe=m['artifacts'][v]['path'];nm=capture(v+'_nm',['nm','-S','--defined-only',exe]);assert not nm['exit_code']
        assert not any(x in nm['stdout'] for x in ['rdi_diag_','rdi_all_hash','read_ic_report','rdi_counted_find'])
        r=capture(v+'_size',['size',exe]);parts=r['stdout'].splitlines()[1].split()
        sections=subprocess.check_output(['objdump','-h',exe],text=True);t=next(l.split() for l in sections.splitlines() if re.match(r'^\s*\d+\s+\.text\s',l))
        rows.append(dict(variant=v,GNU_size_text=int(parts[0]),ELF_text_bytes=int(t[2],16),file_bytes=Path(exe).stat().st_size))
        cmd=['gdb','--batch','--nx','--nh','-ex','file '+exe,'-ex','p sizeof(JSRuntime)','-ex','p sizeof(JSFunctionBytecode)']
        if v!='A':cmd+=['-ex','p sizeof(ReadICSite)']
        if v=='ON':cmd+=['-ex','p (long)&((JSRuntime*)0)->read_ic_direct_mode']
        r=capture(v+'_layouts',cmd);assert not r['exit_code'];layouts[v]=[int(x) for x in re.findall(r'\$\d+ = (\d+)',r['stdout'])]
        asm=subprocess.check_output(['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe],text=True)
        assert 'getenv@' not in asm
        if v!='A':
            assert 'rdi_probe' in asm and 'find_own_property' in asm
            lines=asm.splitlines();keep=set()
            for i,l in enumerate(lines):
                if 'read_ic_opcodes.inc:' in l or 'read_ic_runtime.inc:' in l:keep.update(range(max(0,i-3),min(len(lines),i+23)))
            out=[];last=-2
            for i in sorted(keep):
                if i!=last+1:out.append('\n... disjoint excerpt ...\n')
                out.append(lines[i]);last=i
            save(HERE/'machinecode'/f'{v}_read_paths.asm','\n'.join(out)+'\n')
    assert layouts['M'][2]==layouts['ON'][2]==16 and layouts['M'][1]==layouts['ON'][1]
    exe=m['artifacts']['ON']['path'];header=subprocess.check_output(['readelf','-h',exe],text=True);save(HERE/'machinecode/ELF_header.txt',header)
    captures=[]
    for v in ['ON','LOOKUP']:
        cmd=['gdb','--batch','--nx','--nh','-ex','set disable-randomization off','-ex','set startup-with-shell off',
          '-ex','set environment '+MODE_KEY+' '+config(v),'-ex','break JS_NewContextRaw','-ex','run',
          '-ex','p rdi_process_mode','-ex','p rt->read_ic_direct_mode','-ex','p/x &JS_CallInternal','-ex','info proc mappings',
          '--args',exe,'-e','console.log(1)']
        r=capture(v+'_runtime_mode',cmd);assert not r['exit_code'];vals=re.findall(r'\$\d+ = (\d+)\s',r['stdout']);assert vals[:2]==[config(v),config(v)],r['stdout']
        captures.append(dict(condition=v,binary_sha256=sha(exe),mode=int(config(v)),debugger_disable_randomization=False,log='raw/build/'+v+'_runtime_mode.1.json'))
    for symbol in ['rdi_mode_init','JS_NewRuntime2']:
        r=capture(symbol+'_asm',['objdump','-d','-M','intel','--disassemble='+symbol,exe]);assert not r['exit_code']
    csvout(HERE/'machinecode/sizes.csv',rows);save(HERE/'machinecode/layouts.json',layouts)
    save(HERE/'machinecode/gate.json',dict(status='PASS',same_ON_LOOKUP_path=exe,same_ELF_sha256=sha(exe),same_static_relative_text=True,
      native_mode_values_observed=captures,site_bytes=16,runtime_size_delta=layouts['ON'][0]-layouts['M'][0],mode_field_offset=layouts['ON'][-1],
      ASLR_kernel_setting=Path('/proc/sys/kernel/randomize_va_space').read_text().strip(),ELF_type=next(l.strip() for l in header.splitlines() if 'Type:' in l),
      formal_diagnostic_symbols=False,per_read_getenv=False,direct_guard_and_original_hash_code=True,absolute_load_addresses_may_differ=True))
    print('MACHINECODE_GATE_PASS',flush=True)
if __name__=='__main__':main()

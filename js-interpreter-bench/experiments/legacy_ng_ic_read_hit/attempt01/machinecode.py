"""Read-only formal-binary inspection. Only relevant disassembly retained."""
import re
from common import *
def main():
    m=verify_runtime();records={};sizes=[]
    for v in VERSIONS:
        exe=m['artifacts'][v]['path']
        nm=capture(v+'_nm',['nm','-S','--defined-only',exe]);sz=capture(v+'_size',['size',exe]);assert sz['exit_code']==0
        symbols=[]
        for l in nm['stdout'].splitlines():
            p=l.split()
            if len(p)==4 and any(x in p[3] for x in ['JS_CallInternal','get_ic_prop_offset','JS_GetPropertyInternalWithIC','JS_SetPropertyInternalWithIC','JS_GetPropertyInternalIC']):
                symbols.append(dict(address=p[0],bytes=int(p[1],16),kind=p[2],symbol=p[3],alignment_mod16=int(p[0],16)%16))
        fields=sz['stdout'].splitlines()[1].split()
        sizes.append(dict(variant=v,text_bytes=int(fields[0]),data_bytes=int(fields[1]),bss_bytes=int(fields[2]),file_bytes=Path(exe).stat().st_size,binary_sha256=sha(exe)))
        relevant=[];disasm={}
        for sym in symbols:
            cmd=['objdump','-d','-l','-M','intel','--disassemble='+sym['symbol'],exe]
            p=subprocess.run(cmd,capture_output=True,text=True,check=True)
            disasm[sym['symbol']]=p.stdout
            if sym['symbol']!='JS_CallInternal':
                save(HERE/'machinecode'/v/(sym['symbol']+'.asm'),p.stdout)
            else:
                lines=p.stdout.splitlines();wanted=set()
                for i,l in enumerate(lines):
                    if any(str(STORE/v/'quickjs.c')+':'+str(n) in l for n in range(19401,19450)):
                        wanted.update(range(max(0,i-3),min(len(lines),i+22)))
                    if 'call' in l and any(s in l for s in ['GetPropertyInternalWithIC','get_ic_prop_offset','SetPropertyInternalWithIC']):
                        wanted.update(range(max(0,i-10),min(len(lines),i+18)))
                last=-2
                for i in sorted(wanted):
                    if i!=last+1:relevant.append('\n... disjoint excerpt ...\n')
                    relevant.append(lines[i]);last=i
                save(HERE/'machinecode'/v/'read_write_opcode_excerpts.asm','\n'.join(relevant)+'\n')
        callinternal=disasm.get('JS_CallInternal','')
        records[v]=dict(command=['objdump','-d','-l','-M','intel','--disassemble=SYMBOL',exe],binary_sha256=sha(exe),symbols=symbols,
          wrapper_calls=re.findall(r'^.*call.*<JS_GetPropertyInternalWithIC[^>]*>.*$',callinternal,re.M),
          probe_calls=re.findall(r'^.*call.*<get_ic_prop_offset[^>]*>.*$',callinternal,re.M),
          slow_calls=re.findall(r'^.*call.*<JS_GetPropertyInternalIC[^>]*>.*$',callinternal,re.M),
          write_calls=re.findall(r'^.*call.*<JS_SetPropertyInternalWithIC[^>]*>.*$',callinternal,re.M))
    c,d=records['C'],records['D']
    effective=len(c['wrapper_calls'])==2 and not d['wrapper_calls'] and not any('JS_GetPropertyInternalWithIC' in s['symbol'] for s in d['symbols']) and len(d['probe_calls'])>=2 and len(d['slow_calls'])>=2
    save(HERE/'machinecode/identities.json',records);csvout(HERE/'machinecode/sizes.csv',sizes)
    save(HERE/'machinecode/gate.json',dict(status='EFFECTIVE_INTERVENTION' if effective else 'NO_EFFECTIVE_INTERVENTION',
      C_wrapper_call_count=len(c['wrapper_calls']),D_wrapper_call_count=len(d['wrapper_calls']),D_probe_call_count=len(d['probe_calls']),
      D_slow_call_count=len(d['slow_calls']),runtime_dynamic_branch_hits=None,requires_manual_excerpt_review=True))
    print('MACHINE_CODE',effective,flush=True)
if __name__=='__main__':main()

"""Run serially after pilot/before formal; additional serialization and PMU facts."""
from common import *
def main():
    import host
    verify_runtime();host.main();records=[]
    for v,flavor in [(v,'release') for v in VERSIONS]+[('D','sanitizer')]:
        src=STORE/(v if flavor=='release' else 'D_sanitizer');obj=src/('.obj' if flavor=='release' else '.obj/asan/ubsan')
        out=src/'read_roundtrip'
        cmd=['gcc','-g','-O2','-I'+str(src),str(HERE/'correctness/read_roundtrip.c')]
        if flavor=='sanitizer':cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
        cmd+=[str(obj/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
        r=capture(v+'_'+flavor+'_read_roundtrip_build',cmd);assert not r['exit_code']
        r=capture(v+'_'+flavor+'_read_roundtrip',[out]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout'];records.append(dict(variant=v,flavor=flavor,roundtrip=True))
        if flavor=='release':
            r=capture(v+'_read_embedding_build',[src/'qjsc','-o',src/'read_embedded',HERE/'correctness/read_semantics.js'],src);assert not r['exit_code']
            r=capture(v+'_read_embedding',[src/'read_embedded']);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
    # Small miss/exception excerpts from actual D binary; no full-engine asm output.
    r=capture('D_read_slow_asm',['objdump','-d','-l','-M','intel','--start-address=0x2a170','--stop-address=0x2a240',STORE/'D/qjs'])
    save(HERE/'machinecode/D/read_slow_paths.asm',r['stdout'])
    # Correct the early broad function extraction, leaving original raw dump untouched.
    from micros import TARGETS
    import re
    for case,names in TARGETS.items():
        lines=(HERE/'bytecode'/f'{case}.raw.txt').read_text().splitlines();sections=[]
        for name in names:
            i=next(i for i,l in enumerate(lines) if re.search(r'function: '+re.escape(name)+r'$',l))
            j=next((j for j in range(i+1,len(lines)) if ': function: ' in lines[j]),len(lines))
            sections.extend(lines[i:j])
        save(HERE/'bytecode'/f'{case}.target_only.txt','\n'.join(sections)+'\n')
    save(HERE/'correctness/extra_gate.json',dict(status='PASS',warmed_get_field2_and_reference_serialization=records,embedded_read_semantics_all=True))
    print('EXTRA_SERIALIZATION_GATE_PASS',flush=True)
if __name__=='__main__':main()
